@implementation MarketingWebUserInterfaceCoordinator

- (_TtC9SeymourUI36MarketingWebUserInterfaceCoordinator)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MarketingWebUserInterfaceCoordinator();
  return -[MarketingWebUserInterfaceCoordinator init](&v4, sel_init);
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  sub_22B393320(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_22B3933F4);
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  void *v5;

  v5 = _Block_copy(a5);
  _Block_release(v5);
  return 0;
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  sub_22B393320(self, (int)a2, a3, a4, a5, (void (*)(id, id, void *))sub_22B3935A8);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
