@implementation JSSubscriptionPurchaseLoadingViewController

- (_TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController *v9;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  v9 = (_TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController *)sub_869908(v5, v7, (uint64_t)a4);

  return v9;
}

- (_TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController *result;

  v4 = OBJC_IVAR____TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController_loadingView;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)_s16MusicApplication43JSSubscriptionPurchaseLoadingViewControllerC07loadingF033_E9A8DE5BD8B377223C15E85C975C1B400A6CoreUI0eF0Cvpfi_0();

  result = (_TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSSubscriptionPurchaseLoadingViewController.swift", 66, 2, 35, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController *v2;

  v2 = self;
  JSSubscriptionPurchaseLoadingViewController.viewDidLoad()();

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = (char *)v6.receiver;
  -[JSSubscriptionPurchaseLoadingViewController viewDidLayoutSubviews](&v6, "viewDidLayoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController_loadingView];
  v4 = objc_msgSend(v2, "view", v6.receiver, v6.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "center");
    objc_msgSend(v3, "setCenter:");

  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController *v4;

  v4 = self;
  JSSubscriptionPurchaseLoadingViewController.viewWillAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController *v4;

  v4 = self;
  JSSubscriptionPurchaseLoadingViewController.viewWillDisappear(_:)(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication43JSSubscriptionPurchaseLoadingViewController_loadingView));
}

@end
