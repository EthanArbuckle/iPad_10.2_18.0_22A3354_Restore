@implementation CollectionListViewController

- (CollectionListViewController)initWithViewModel:(id)a3
{
  id v4;
  CollectionListViewController *v5;

  v4 = a3;
  v5 = (CollectionListViewController *)sub_1000068BC(a3);

  return v5;
}

+ (NSString)defaultNavigationTitle
{
  uint64_t v2;
  NSString v3;

  if (qword_1000B3FB8 != -1)
    swift_once(&qword_1000B3FB8, sub_1000043F0);
  v2 = *(_QWORD *)algn_1000B9068;
  swift_bridgeObjectRetain(*(_QWORD *)algn_1000B9068);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  void *v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CollectionListViewController();
  v4 = v7.receiver;
  -[TPSAppViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = (void *)objc_opt_self(NSNotificationCenter);
  v6 = objc_msgSend(v5, "defaultCenter", v7.receiver, v7.super_class);
  objc_msgSend(v6, "addObserver:selector:name:object:", v4, "applicationWillEnterForeground", UIApplicationWillEnterForegroundNotification, 0);
  objc_msgSend(v6, "addObserver:selector:name:object:", v4, "applicationWillEnterBackground", UIApplicationDidEnterBackgroundNotification, 0);

  v4[OBJC_IVAR___CollectionListViewController_canIncreaseViewCount] = 1;
  objc_msgSend(v4, "analyticsIncreaseCountViewForCollectionsViewDelay:", TPSAnalyticsViewMethodViewAppear);

}

- (void)analyticsIncreaseCountViewForCollectionsViewDelay:(id)a3
{
  id v4;
  CollectionListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10000AAE4((uint64_t)v4);

}

- (CollectionListViewModel)viewModel
{
  return (CollectionListViewModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                            + OBJC_IVAR___CollectionListViewController_viewModel));
}

- (void)viewDidLoad
{
  CollectionListViewController *v2;

  v2 = self;
  sub_1000083A0();

}

- (void)loadView
{
  CollectionListViewController *v2;

  v2 = self;
  sub_10000A064();

}

- (void)setViewModel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CollectionListViewController_viewModel);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR___CollectionListViewController_viewModel) = (Class)a3;
  v3 = a3;

}

- (UIViewController)hostingController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                     + OBJC_IVAR___CollectionListViewController_hostingController));
}

- (void)dealloc
{
  CollectionListViewController *v2;
  id v3;
  objc_super v4;

  v2 = self;
  -[CollectionListViewController cancelAnalyticsIncreaseCountViewForCollectionsViewDelay](v2, "cancelAnalyticsIncreaseCountViewForCollectionsViewDelay");
  v3 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", v2, UIApplicationWillEnterForegroundNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", v2, UIApplicationDidEnterBackgroundNotification, 0);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for CollectionListViewController();
  -[TPSViewController dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CollectionListViewController_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CollectionListViewController_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CollectionListViewController_searchResultsViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CollectionListViewController_searchResultsViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___CollectionListViewController_searchController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR___CollectionListViewController_cancellables));
  sub_100005500(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___CollectionListViewController_searchResultSelectedHandler), *(uint64_t *)((char *)&self->super.super._messageLabelTitle+ OBJC_IVAR___CollectionListViewController_searchResultSelectedHandler));
}

- (CollectionListViewController)initWithCoder:(id)a3
{
  return (CollectionListViewController *)sub_100031F64(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  void *v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CollectionListViewController();
  v4 = v7.receiver;
  -[TPSAppViewController viewWillDisappear:](&v7, "viewWillDisappear:", v3);
  v4[OBJC_IVAR___CollectionListViewController_canIncreaseViewCount] = 0;
  v5 = (void *)objc_opt_self(NSNotificationCenter);
  v6 = objc_msgSend(v5, "defaultCenter", v7.receiver, v7.super_class);
  objc_msgSend(v6, "removeObserver:name:object:", v4, UIApplicationWillEnterForegroundNotification, 0);
  objc_msgSend(v6, "removeObserver:name:object:", v4, UIApplicationDidEnterBackgroundNotification, 0);

  objc_msgSend(v4, "cancelAnalyticsIncreaseCountViewForCollectionsViewDelay");
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CollectionListViewController();
  -[CollectionListViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v6, "willTransitionToTraitCollection:withTransitionCoordinator:", a3, a4);
}

- (void)applicationWillEnterForeground
{
  -[CollectionListViewController analyticsIncreaseCountViewForCollectionsViewDelay:](self, "analyticsIncreaseCountViewForCollectionsViewDelay:", TPSAnalyticsViewMethodAppForeground);
}

- (void)applicationWillEnterBackground
{
  CollectionListViewController *v2;

  v2 = self;
  -[CollectionListViewController cancelAnalyticsIncreaseCountViewForCollectionsViewDelay](v2, "cancelAnalyticsIncreaseCountViewForCollectionsViewDelay");
  *((_BYTE *)&v2->super.super.super.super.super.isa + OBJC_IVAR___CollectionListViewController_canIncreaseViewCount) = 0;

}

- (CollectionListViewController)initWithAppController:(id)a3
{
  id v3;
  CollectionListViewController *result;

  v3 = a3;
  result = (CollectionListViewController *)_swift_stdlib_reportUnimplementedInitializer("Tips.CollectionListViewController", 33, "init(appController:)", 20, 0);
  __break(1u);
  return result;
}

- (CollectionListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  CollectionListViewController *result;

  v4 = a4;
  result = (CollectionListViewController *)_swift_stdlib_reportUnimplementedInitializer("Tips.CollectionListViewController", 33, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (BOOL)canSearch
{
  return *(Class *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR___CollectionListViewController_searchController) != 0;
}

- (void)searchWithSearchQuery:(id)a3
{
  id v4;
  CollectionListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000324BC(v4);

}

- (void)dismissSearch
{
  void *v2;
  CollectionListViewController *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___CollectionListViewController_searchController);
  if (v2)
  {
    v3 = self;
    v4 = objc_msgSend(v2, "searchBar");
    objc_msgSend(v4, "resignFirstResponder");

  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  CollectionListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100032A34(v4);

}

- (void)didPresentSearchController:(id)a3
{
  id v4;
  CollectionListViewController *v5;

  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR___CollectionListViewController_searchActive) = 1;
  v4 = a3;
  v5 = self;
  sub_100003A74();

}

- (void)willDismissSearchController:(id)a3
{
  id v4;
  CollectionListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100032F80();

}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4;
  CollectionListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100033028();

}

- (void)cancelAnalyticsIncreaseCountViewForCollectionsViewDelay
{
  void *v3;
  id v4;
  CollectionListViewController *v5;
  id v6;

  v3 = (void *)objc_opt_self(NSObject);
  v4 = objc_allocWithZone((Class)TPSViewSourceProxy);
  v5 = self;
  v6 = objc_msgSend(v4, "init");
  objc_msgSend(v3, "cancelPreviousPerformRequestsWithTarget:selector:object:", v5, "analyticsIncreaseCountViewForCollectionsView:", v6);

}

- (void)analyticsIncreaseCountViewForNilTipIDWithLaunchType:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  CollectionListViewController *v6;
  NSString v7;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = v4;
  v6 = self;
  v7 = String._bridgeToObjectiveC()();
  -[CollectionListViewController analyticsIncreaseCountViewForCollectionsViewDelay:](v6, "analyticsIncreaseCountViewForCollectionsViewDelay:", v7);

  swift_bridgeObjectRelease(v5);
}

- (void)analyticsIncreaseCountViewForCollectionsView:(id)a3
{
  id v4;
  CollectionListViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100032D9C(v4);

}

- (void)runTest:(id)a3 options:(id)a4
{
  sub_10006BAC8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, &OBJC_IVAR___CollectionListViewController_hostingController, 52);
}

@end
