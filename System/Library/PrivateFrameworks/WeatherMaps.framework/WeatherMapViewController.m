@implementation WeatherMapViewController

- (_TtC11WeatherMaps24WeatherMapViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DBEC6408();
}

- (void)loadView
{
  _TtC11WeatherMaps24WeatherMapViewController *v2;

  v2 = self;
  WeatherMapViewController.loadView()();

}

- (void)viewDidLoad
{
  _TtC11WeatherMaps24WeatherMapViewController *v2;

  v2 = self;
  WeatherMapViewController.viewDidLoad()();

}

- (void)willMoveToParentViewController:(id)a3
{
  id v5;
  _TtC11WeatherMaps24WeatherMapViewController *v6;

  v5 = a3;
  v6 = self;
  WeatherMapViewController.willMove(toParent:)((UIViewController_optional *)a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC11WeatherMaps24WeatherMapViewController *v4;

  v4 = self;
  WeatherMapViewController.viewDidAppear(_:)(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC11WeatherMaps24WeatherMapViewController *v2;

  v2 = self;
  WeatherMapViewController.viewDidLayoutSubviews()();

}

- (_TtC11WeatherMaps24WeatherMapViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DBFF81A0();
  v5 = a4;
  WeatherMapViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_resolver);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_snapshotViewController);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_interactiveViewController);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_locationPickerViewController);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_locationPopoverViewController);
  OUTLINED_FUNCTION_15_7(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_previewViewController);
  OUTLINED_FUNCTION_15_7(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_locationActionHandler);
  OUTLINED_FUNCTION_15_7(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_canAddLocationHandler);
  OUTLINED_FUNCTION_15_7(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_canViewLocationHandler);
  OUTLINED_FUNCTION_15_7(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_onMapEventHandler);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController____lazy_storage___supplementaryOverlayContainerView);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_supplementaryOverlayDebounceTimer);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_supplementaryOverlayViewController);
  swift_release();
  sub_1DBE927A0((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_lastViewModel, type metadata accessor for WeatherMapStore.ViewModel);
  sub_1DBE92730((uint64_t)self + OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_viewModelToUpdate, &qword_1EDAFB8B0);
  OUTLINED_FUNCTION_4_2(OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_resizeTimer);
  sub_1DBECE368(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC11WeatherMaps24WeatherMapViewController_bannerUpdateBlock));
}

- (void)mapSnapshotViewDidRetrieveSnapshot:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC11WeatherMaps24WeatherMapViewController *v8;
  uint64_t v9;

  v4 = sub_1DBFF6520();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DBFF64FC();
  v8 = self;
  sub_1DBECAF48();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(id)a3
{
  id v4;
  _TtC11WeatherMaps24WeatherMapViewController *v5;

  v4 = a3;
  v5 = self;
  WeatherMapViewController.popoverPresentationControllerShouldDismissPopover(_:)((UIPopoverPresentationController)v5);

  return 1;
}

@end
