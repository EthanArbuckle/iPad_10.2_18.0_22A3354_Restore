@implementation WebAdNavigationCoordinator

- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
  id v7;
  _TtC17PromotedContentUI26WebAdNavigationCoordinator *v8;

  v7 = a3;
  v8 = self;
  sub_1B12E1480(a3, a4);

}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  sub_1B12E1798((char *)self, (uint64_t)a2, a3, a4, (SEL *)&selRef_webView_didStartProvisionalNavigation_);
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  sub_1B12E1688((char *)self, (uint64_t)a2, a3, a4, a5, (SEL *)&selRef_webView_didFailProvisionalNavigation_withError_);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  sub_1B12E1688((char *)self, (uint64_t)a2, a3, a4, a5, (SEL *)&selRef_webView_didFailNavigation_withError_);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  sub_1B12E1798((char *)self, (uint64_t)a2, a3, a4, (SEL *)&selRef_webView_didFinishNavigation_);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _TtC17PromotedContentUI26WebAdNavigationCoordinator *v15;
  _QWORD v16[6];

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = (void *)MEMORY[0x1B5E1B0F0]((char *)self + OBJC_IVAR____TtC17PromotedContentUI26WebAdNavigationCoordinator_navigationResponder);
  if (v10)
  {
    v11 = v10;
    if ((objc_msgSend(v10, sel_respondsToSelector_, sel_webView_decidePolicyForNavigationAction_decisionHandler_) & 1) != 0)
    {
      v16[4] = sub_1B12E1DB0;
      v16[5] = v9;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 1107296256;
      v16[2] = sub_1B12D5404;
      v16[3] = &unk_1E62F5F10;
      v12 = _Block_copy(v16);
      v13 = a3;
      v14 = a4;
      v15 = self;
      swift_retain();
      objc_msgSend(v11, sel_webView_decidePolicyForNavigationAction_decisionHandler_, v13, v14, v12);
      _Block_release(v12);

      swift_release();
      swift_unknownObjectRelease();
      swift_release();
    }
    else
    {
      swift_release();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    swift_release();
  }
}

- (void)_webView:(id)a3 webContentProcessDidTerminateWithReason:(int64_t)a4
{
  id v7;
  _TtC17PromotedContentUI26WebAdNavigationCoordinator *v8;

  v7 = a3;
  v8 = self;
  sub_1B12E19DC(a3, a4);

}

- (_TtC17PromotedContentUI26WebAdNavigationCoordinator)init
{
  _TtC17PromotedContentUI26WebAdNavigationCoordinator *result;

  result = (_TtC17PromotedContentUI26WebAdNavigationCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B12DB4F4((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI26WebAdNavigationCoordinator_navigationResponder);
}

@end
