@implementation WeatherMapSnapshotView

- (_TtC11WeatherMaps22WeatherMapSnapshotView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBEA0760();
}

- (void)dealloc
{
  _TtC11WeatherMaps22WeatherMapSnapshotView *v2;

  v2 = self;
  sub_1DBEA0900();
}

- (void).cxx_destruct
{
  sub_1DBE8BE6C((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_annotationViewModelFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_mapLocationAccessibilityModelManager);
  swift_unknownObjectRelease();
  sub_1DBE927A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_status, type metadata accessor for WeatherMapSnapshotView.Status);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView____lazy_storage___snapshotDisplayView);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_annotationView);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_debugLabel);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_errorLabelEffect);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_errorEffectView);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_errorLabel);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_errorPlatterView);
  swift_unknownObjectWeakDestroy();
  swift_release();
  sub_1DBE92730((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_snapshot, qword_1EDAFBEA8);
  sub_1DBE92730((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps22WeatherMapSnapshotView_weatherData, &qword_1EDAF9BD0);
}

- (void)layoutSubviews
{
  _TtC11WeatherMaps22WeatherMapSnapshotView *v2;

  v2 = self;
  sub_1DBEA0AD4();

}

- (void)darkerSystemColorsStatusDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC11WeatherMaps22WeatherMapSnapshotView *v8;
  uint64_t v9;

  v4 = sub_1DBFF6520();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DBFF64FC();
  v8 = self;
  sub_1DBEA4990();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC11WeatherMaps22WeatherMapSnapshotView)initWithFrame:(CGRect)a3
{
  sub_1DBEA4A30();
}

@end
