import WidgetKit
import SwiftUI
import Intents

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), filename: "No screenshot available", displaySize: context.displaySize)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let userDefaults = UserDefaults(suiteName: "group.home_widget_demo_group")
        let filename = userDefaults?.string(forKey: "filename") ?? "No screenshot available"
        let entry = SimpleEntry(date: Date(), filename: filename, displaySize: context.displaySize)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
          getSnapshot(in: context) { (entry) in
            let timeline = Timeline(entries: [entry], policy: .atEnd)
                      completion(timeline)
                  }
        }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let filename: String
    let displaySize: CGSize
}

struct home_widget_demoEntryView : View {
    var entry: Provider.Entry
    var CustomImage: some View {
            if let uiImage = UIImage(contentsOfFile: entry.filename) {
                let image = Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                return AnyView(image)
            }
            print("The image file could not be loaded")
            return AnyView(EmptyView())
        }
    var body: some View {
        CustomImage
            .scaledToFill()
            .padding(0)
    }
}

struct home_widget_demo: Widget {
    let kind: String = "home_widget_demo"
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            home_widget_demoEntryView(entry: entry)
        }
        .configurationDisplayName("Home Widget Demo")
        .description("This is my home widget.")
        .supportedFamilies([.systemSmall])
    }
}

//struct home_widget_demo_Previews: PreviewProvider {
//    static var previews: some View {
//        home_widget_demoEntryView(entry: SimpleEntry(date: Date(), filename: "filename", displaySize: context.displaySize))
//            .previewContext(WidgetPreviewContext(family: .systemSmall))
//    }
//}
