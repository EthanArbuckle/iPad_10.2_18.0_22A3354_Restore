@implementation SafetyCacheMapView.Coordinator

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6;
  _TtCV15SafetyMonitorUI18SafetyCacheMapView11Coordinator *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_24567C0E4(v6, (uint64_t)a4);

  swift_unknownObjectRelease();
  return v8;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v5;
  _TtCV15SafetyMonitorUI18SafetyCacheMapView11Coordinator *v6;

  v5 = a3;
  v6 = self;
  sub_245684E90(v5);

}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v6;
  id v7;
  _TtCV15SafetyMonitorUI18SafetyCacheMapView11Coordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2456850E8(v7);

}

- (void)mapView:(id)a3 didDeselectAnnotationView:(id)a4
{
  uint64_t v6;
  id v7;
  _TtCV15SafetyMonitorUI18SafetyCacheMapView11Coordinator *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;

  v6 = qword_257489558;
  v7 = a3;
  v13 = a4;
  v8 = self;
  if (v6 != -1)
    swift_once();
  v9 = sub_2456F96D0();
  __swift_project_value_buffer(v9, (uint64_t)static Logger.sharedUI);
  v10 = sub_2456F96B8();
  v11 = sub_2456FAA38();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2455BE000, v10, v11, "#SafetyCacheMapView, didDeselect is called.", v12, 2u);
    MEMORY[0x249539F7C](v12, -1, -1);
  }

}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6;
  _TtCV15SafetyMonitorUI18SafetyCacheMapView11Coordinator *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_2456857DC((uint64_t)a4);

  swift_unknownObjectRelease();
  return v8;
}

- (_TtCV15SafetyMonitorUI18SafetyCacheMapView11Coordinator)init
{
  _TtCV15SafetyMonitorUI18SafetyCacheMapView11Coordinator *result;

  result = (_TtCV15SafetyMonitorUI18SafetyCacheMapView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2455C6770((uint64_t)self + OBJC_IVAR____TtCV15SafetyMonitorUI18SafetyCacheMapView11Coordinator_parent, type metadata accessor for SafetyCacheMapView);
  sub_2455C6770((uint64_t)self + OBJC_IVAR____TtCV15SafetyMonitorUI18SafetyCacheMapView11Coordinator_contactImageRenderingContext, type metadata accessor for SafetyCacheMapView.ContactImageRenderingContext);
}

@end
