@implementation AppAdView

- (id)presentingViewControllerForAdLockupView:(id)a3
{
  id v4;
  _TtC17PromotedContentUI9AppAdView *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = _s17PromotedContentUI9AppAdViewC010presentingF10Controller3forSo06UIViewH0CSgSo011ASCAdLockupF0C_tF_0();

  return v6;
}

- (void)adLockupViewDidCancelScreenshotsFetchRequest:(id)a3
{
  id v4;
  _TtC17PromotedContentUI9AppAdView *v5;

  v4 = a3;
  v5 = self;
  sub_1B1329E48((void (*)(id))MEMORY[0x1E0DF2280]);

}

- (void)adLockupViewDidFinishScreenshotsFetchRequest:(id)a3
{
  id v4;
  _TtC17PromotedContentUI9AppAdView *v5;

  v4 = a3;
  v5 = self;
  sub_1B1329E48((void (*)(id))MEMORY[0x1E0DF2270]);

}

- (void)adLockupViewDidInvalidateIntrinsicContentSize:(id)a3
{
  id v4;
  _TtC17PromotedContentUI9AppAdView *v5;

  v4 = a3;
  v5 = self;
  sub_1B1329E48((void (*)(id))MEMORY[0x1E0DF2270]);

}

- (void)adLockupViewDidFinishRequest:(id)a3
{
  id v4;
  _TtC17PromotedContentUI9AppAdView *v5;

  v4 = a3;
  v5 = self;
  _s17PromotedContentUI9AppAdViewC08adLockupF16DidFinishRequestyySo05ASCAdhF0CF_0();

}

- (void)adLockupView:(id)a3 didFailRequestWithError:(id)a4
{
  id v6;
  _TtC17PromotedContentUI9AppAdView *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1B132A26C();

}

- (void)adLockupView:(id)a3 didSelectOfferWithState:(id)a4
{
  id v6;
  id v7;
  _TtC17PromotedContentUI9AppAdView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B132A59C();

}

- (void)adLockupViewDidSelectAdMarker:(id)a3
{
  id v4;
  _TtC17PromotedContentUI9AppAdView *v5;

  v4 = a3;
  v5 = self;
  _s17PromotedContentUI9AppAdViewC08adLockupf9DidSelectE6MarkeryySo05ASCAdhF0CF_0();

}

- (void)adLockupView:(id)a3 preprocessOffer:(id)a4 inState:(id)a5 completionBlock:(id)a6
{
  void *v9;
  id v10;
  id v11;
  _TtC17PromotedContentUI9AppAdView *v12;

  v9 = _Block_copy(a6);
  _Block_copy(v9);
  v10 = a3;
  swift_unknownObjectRetain();
  v11 = a5;
  v12 = self;
  sub_1B132B9D0(v11, (char *)v12, (void (**)(_QWORD))v9);
  _Block_release(v9);
  _Block_release(v9);

  swift_unknownObjectRelease();
}

- (id)metricsActivityForPresentingProductDetailsOfAdLockupView:(id)a3 inState:(id)a4
{
  id v6;
  id v7;
  _TtC17PromotedContentUI9AppAdView *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)_s17PromotedContentUI9AppAdViewC42metricsActivityForPresentingProductDetails2of7inStateSo010ASCMetricsH0CSo011ASCAdLockupF0C_So06ASCAppO0atF_0();

  return v9;
}

- (id)metricsActivityForAdLockupView:(id)a3 toPerformActionOfOffer:(id)a4 inState:(id)a5
{
  void *v7;
  id v8;
  id v9;
  _TtC17PromotedContentUI9AppAdView *v10;
  id v11;

  v7 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___APPCPromotedContentView_promotedContent);
  v8 = a3;
  swift_unknownObjectRetain();
  v9 = a5;
  v10 = self;
  objc_msgSend(objc_msgSend(v7, sel_metricsHelper), sel_interacted);
  swift_unknownObjectRelease();
  v11 = sub_1B132943C();

  swift_unknownObjectRelease();
  return v11;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC17PromotedContentUI9AppAdView *v6;
  uint64_t v7;
  id v8;
  id v9;

  sub_1B12CFA9C(0, (unint64_t *)&qword_1ED389890);
  v5 = a3;
  v6 = self;
  if ((sub_1B12EF790() & 1) != 0)
  {
    v7 = 2;
  }
  else
  {
    v8 = -[AppAdView traitCollection](v6, sel_traitCollection);
    v7 = (uint64_t)objc_msgSend(v8, sel_userInterfaceStyle);

  }
  v9 = sub_1B13479A0();
  objc_msgSend(v9, sel_setOverrideUserInterfaceStyle_, v7);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI9AppAdView____lazy_storage___appView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI9AppAdView____lazy_storage___topBorder));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI9AppAdView____lazy_storage___bottomBorder));
}

@end
