import ExpoModulesCore

public class ExpoMapboxNavigationModule: Module {

  public func definition() -> ModuleDefinition {
    Name("ExpoMapboxNavigation")

    View(ExpoMapboxNavigationView.self) {
      Prop("coordinates") { (view: ExpoMapboxNavigationView, coordinates: Array<Dictionary<String, Any>>) in
         var points: Array<CLLocationCoordinate2D> = []
         for coordinate in coordinates {
            let longValue = coordinate["longitude"]
            let latValue = coordinate["latitude"]
            if let long = longValue as? Double, let lat = latValue as? Double {
                points.append(CLLocationCoordinate2D(latitude: lat, longitude: long))
            }
          }
          view.controller.setCoordinates(coordinates: points) 
      }

      Prop("locale") { (view: ExpoMapboxNavigationView, locale: String?) in
          view.controller.setLocale(locale: locale) 
      }
    }
  }
}
