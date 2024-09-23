@implementation LocationSearchViewModel

- (_TtC15SafetyMonitorUI23LocationSearchViewModel)init
{
  _TtC15SafetyMonitorUI23LocationSearchViewModel *result;

  result = (_TtC15SafetyMonitorUI23LocationSearchViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;

  v3 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__locationSearchText;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25748CCC0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__searchedLocations;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25748CCB8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__selectedLocation;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25748CD60);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__selectedLocationValidity;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25748CCB0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__destinationType;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25748CD78);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__selectedFenceSize;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25748CCA8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__annotations;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25748CCA0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  v17 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__selectedLocationReverseGeocodeStatus;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25748CC98);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v17, v18);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel_safetyMonitorManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel_mkLocalSearchCompleter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel_locationManager));
  v19 = (char *)self + OBJC_IVAR____TtC15SafetyMonitorUI23LocationSearchViewModel__endLocation;
  v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25748CDA0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v19, v20);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC15SafetyMonitorUI23LocationSearchViewModel *v8;

  sub_245600F90(0, (unint64_t *)&unk_25748CF10);
  v6 = sub_2456FA8DC();
  v7 = a3;
  v8 = self;
  sub_245662F1C(v6);

  swift_bridgeObjectRelease();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC15SafetyMonitorUI23LocationSearchViewModel *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_2456631A0(v8);

}

- (void)completerDidUpdateResults:(id)a3
{
  id v4;
  _TtC15SafetyMonitorUI23LocationSearchViewModel *v5;

  v4 = a3;
  v5 = self;
  LocationSearchViewModel.completerDidUpdateResults(_:)((MKLocalSearchCompleter)v4);

}

@end
