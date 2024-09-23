@implementation UIViewController

- (UIView)dimmingOverlayHostView
{
  UIViewController *v2;
  UIView *result;
  UIView *v4;

  v2 = self;
  result = -[UIViewController view](v2, "view");
  if (result)
  {
    v4 = result;

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSString)docUnavailableSearchResultsText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController _contentUnavailableConfigurationState](self, "_contentUnavailableConfigurationState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "searchControllerText"));

  return (NSString *)v3;
}

- (void)dimmingOverlayStateDidChange:(id)a3 state:(int64_t)a4
{
  void *v6;
  id v7;
  UIViewController *v8;
  id v9;

  v6 = (void *)objc_opt_self(UIColor);
  v7 = a3;
  v8 = self;
  v9 = objc_msgSend(v6, "_dimmingViewColor");
  objc_msgSend(v7, "setBackgroundColor:", v9);

}

- (void)objc_doc_preheatForPresentingWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  UIViewController *v7;
  __objc2_prot *v8;

  v4 = (void (**)(_QWORD))_Block_copy(a3);
  v5 = swift_allocObject(&unk_1005C2EC8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v8 = &OBJC_PROTOCOL____TtP5Files26DOCPresentationPreheatable__0;
  v6 = swift_dynamicCastObjCProtocolConditional(self, 1, &v8);
  v7 = self;
  _Block_copy(v4);
  if (v6)
    DOCPresentationPreheatable<>.doc_preheatForPresenting(completion:)(sub_1000E62C0, v5);
  else
    v4[2](v4);
  swift_release(v5);
  _Block_release(v4);

}

- (void)objc_doc_preheatDidFinish
{
  UIViewController *v3;

  if (swift_dynamicCastObjCProtocolConditional(self, 1))
  {
    v3 = self;
    DOCPresentationPreheatable<>.doc_preheatDidFinish()((uint64_t)v3);

  }
}

- (_TtC5Files13DOCTabBarItem)DOCTabBarItem
{
  UIViewController *v2;
  _TtC5Files13DOCTabBarItem *result;
  _TtC5Files13DOCTabBarItem *v4;
  uint64_t v5;

  v2 = self;
  result = -[UIViewController tabBarItem](v2, "tabBarItem");
  if (result)
  {
    v4 = result;

    v5 = type metadata accessor for DOCTabBarItem();
    return (_TtC5Files13DOCTabBarItem *)(id)swift_dynamicCastClassUnconditional(v4, v5, 0, 0, 0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setDOCTabBarItem:(id)a3
{
  -[UIViewController setTabBarItem:](self, "setTabBarItem:", a3);
}

- (_TtP5Files27DOCScannedDocumentReceiving_)doc_documentScannerReceivingTarget
{
  return (_TtP5Files27DOCScannedDocumentReceiving_ *)0;
}

- (void)doc_updateBarButtonTrackingViewsIfNecessary
{
  UIViewController *v2;
  UIViewController *v3;

  v2 = self;
  v3 = -[UIViewController parentViewController](v2, "parentViewController");
  -[UIViewController doc_updateBarButtonTrackingViewsIfNecessary](v3, "doc_updateBarButtonTrackingViewsIfNecessary");

}

- (BOOL)doc_isPlaceholder
{
  return 0;
}

@end
