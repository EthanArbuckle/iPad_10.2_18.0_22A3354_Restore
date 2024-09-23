@implementation InteractiveViewController

- (_TtC11WeatherMaps25InteractiveViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBF3F85C();
}

- (void)handleVoiceOverStatusDidChangeWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC11WeatherMaps25InteractiveViewController *v8;
  uint64_t v9;

  v4 = sub_1DBFF6520();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DBFF64FC();
  v8 = self;
  sub_1DBF3FC58();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)viewDidLoad
{
  self;
  sub_1DBF3FCF4();
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC11WeatherMaps25InteractiveViewController *v4;

  v4 = self;
  sub_1DBF416C4(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC11WeatherMaps25InteractiveViewController *v2;

  v2 = self;
  sub_1DBF4176C();

}

- (void)didMoveToParentViewController:(id)a3
{
  id v4;
  _TtC11WeatherMaps25InteractiveViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DBF41D60();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC11WeatherMaps25InteractiveViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DBF41E44();

}

- (BOOL)accessibilityPerformEscape
{
  _TtC11WeatherMaps25InteractiveViewController *v2;

  v2 = self;
  sub_1DBF4203C();
}

- (BOOL)accessibilityPerformMagicTap
{
  _TtC11WeatherMaps25InteractiveViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_1DBF420B0();

  return v3 & 1;
}

- (void)didMoveToBackground
{
  _TtC11WeatherMaps25InteractiveViewController *v2;

  v2 = self;
  sub_1DBF42520();

}

- (void)didMoveToForeground
{
  _TtC11WeatherMaps25InteractiveViewController *v2;

  v2 = self;
  sub_1DBF425F4();

}

- (void)dealloc
{
  _TtC11WeatherMaps25InteractiveViewController *v2;

  v2 = self;
  sub_1DBF42CE0();
}

- (void).cxx_destruct
{
  sub_1DBE8BE6C((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_delegate);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController____lazy_storage___mapView);
  sub_1DBEC598C((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_configuration);
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_83_0(OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_cameraFocusFactory);
  OUTLINED_FUNCTION_83_0(OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_geocodeManager);
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_83_0(OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_locationMetadataManager);
  OUTLINED_FUNCTION_83_0(OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_mapLocationAccessibilityModelManager);
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_backgroundEffectView);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_overlayProgressBar);
  sub_1DBE92730((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_activeOverlay, (uint64_t *)&unk_1EDAF9DC0);
  swift_bridgeObjectRelease();
  sub_1DBE92730((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_selectedLocation, &qword_1EDAF9D60);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_debugLabel);
  swift_unknownObjectWeakDestroy();
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_controlsView);
  OUTLINED_FUNCTION_83_0(OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_windOverlayHintManager);
  OUTLINED_FUNCTION_70_3();
  OUTLINED_FUNCTION_70_3();
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_scrubberOverlayViewController);
  OUTLINED_FUNCTION_70_3();
  OUTLINED_FUNCTION_70_3();
  OUTLINED_FUNCTION_70_3();
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_contentStatusBannerViewController);
  OUTLINED_FUNCTION_15_7(OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_pendingBannerReplacementBlock);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_backdropLayerBlur);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_backdropLayerUltraThin);
  sub_1DBE92730((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_wasPlayingBeforeSonificationDate, (uint64_t *)&unk_1EDAF9B90);
  OUTLINED_FUNCTION_70_3();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_accessibilityFrameDateFormatter);
  OUTLINED_FUNCTION_15_7(OBJC_IVAR____TtC11WeatherMaps25InteractiveViewController_onMapEventHandler);
  swift_bridgeObjectRelease();
}

- (void)mapGestureDidChange
{
  _TtC11WeatherMaps25InteractiveViewController *v2;

  v2 = self;
  sub_1DBF43518();

}

- (void)didTapMap:(id)a3
{
  id v4;
  _TtC11WeatherMaps25InteractiveViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DBF43710(v4);

}

- (void)didHoverMap:(id)a3
{
  id v4;
  _TtC11WeatherMaps25InteractiveViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DBF43964(v4);

}

- (NSArray)keyCommands
{
  _TtC11WeatherMaps25InteractiveViewController *v2;
  void *v3;

  v2 = self;
  sub_1DBF45464();

  sub_1DBE8BE34(0, (unint64_t *)&unk_1F0333C98);
  v3 = (void *)sub_1DBFF8368();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (void)selectTemperatureOverlay
{
  _TtC11WeatherMaps25InteractiveViewController *v2;

  v2 = self;
  sub_1DBF455F8();

}

- (void)selectPrecipitationOverlay
{
  _TtC11WeatherMaps25InteractiveViewController *v2;

  v2 = self;
  sub_1DBF456B4();

}

- (void)selectAirQualityOverlay
{
  _TtC11WeatherMaps25InteractiveViewController *v2;

  v2 = self;
  sub_1DBF4576C();

}

- (void)selectWindOverlay
{
  _TtC11WeatherMaps25InteractiveViewController *v2;

  v2 = self;
  sub_1DBF45828();

}

- (void)zoomIn
{
  self;
  sub_1DBF45924();
}

- (void)zoomOut
{
  self;
  sub_1DBF45924();
}

- (void)dismissFromKeyboard
{
  _TtC11WeatherMaps25InteractiveViewController *v2;

  v2 = self;
  sub_1DBF45A0C();

}

- (_TtC11WeatherMaps25InteractiveViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DBFF81A0();
  v5 = a4;
  sub_1DBF45A8C();
}

- (void)mapViewDidChangeVisibleRegion:(id)a3
{
  id v4;
  _TtC11WeatherMaps25InteractiveViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DBF47210(v4);

}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  id v6;
  _TtC11WeatherMaps25InteractiveViewController *v7;
  void *v8;
  void *v9;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_1DBF472A0((uint64_t)v7, (uint64_t)a4);
  v9 = v8;

  swift_unknownObjectRelease();
  return v9;
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5;
  _TtC11WeatherMaps25InteractiveViewController *v6;
  void *v7;
  void *v8;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_1DBF47328();
  v8 = v7;

  swift_unknownObjectRelease();
  return v8;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v5;
  _TtC11WeatherMaps25InteractiveViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1DBF473F0(v5);

}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v6;
  id v7;
  _TtC11WeatherMaps25InteractiveViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1DBF476F4();

}

- (void)mapView:(id)a3 requestedAccessibilityModelForLocation:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC11WeatherMaps25InteractiveViewController *v11;

  v8 = _Block_copy(a5);
  *(_QWORD *)(swift_allocObject() + 16) = v8;
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1DBF4842C();

  swift_release();
}

- (id)accessibilityModelOverlayKeyForMapView:(id)a3
{
  id v4;
  _TtC11WeatherMaps25InteractiveViewController *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = self;
  sub_1DBF48634();
  v7 = v6;

  if (v7)
  {
    v8 = (void *)sub_1DBFF8170();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
