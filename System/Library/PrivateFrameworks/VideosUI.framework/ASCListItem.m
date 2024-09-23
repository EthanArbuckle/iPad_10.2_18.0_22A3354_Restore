@implementation ASCListItem

- (_TtC8VideosUI11ASCListItem)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9DA5AF4();
}

- (CGSize)intrinsicContentSize
{
  _TtC8VideosUI11ASCListItem *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = self;
  sub_1D9DA5C40();
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _TtC8VideosUI11ASCListItem *v5;
  double v6;
  double v7;
  CGSize result;

  v5 = self;
  sub_1D9DA5C78(a4);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC8VideosUI11ASCListItem)initWithFrame:(CGRect)a3
{
  sub_1D9DA6318();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI11ASCListItem_currentLockup);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI11ASCListItem_appInstallerHelper);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI11ASCListItem_previousState);
  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI11ASCListItem_advanceASCOfferHandler));
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI11ASCListItem_offerListUIConfiguration);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI11ASCListItem_dismissalUIConfiguration));
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  id v4;
  _TtC8VideosUI11ASCListItem *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1D9DA5EB8();

  return v6;
}

- (void)lockupView:(id)a3 preprocessOffer:(id)a4 inState:(id)a5 completionBlock:(id)a6
{
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _TtC8VideosUI11ASCListItem *v13;
  uint64_t v14;

  v9 = _Block_copy(a6);
  v10 = OUTLINED_FUNCTION_48();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = a3;
  swift_unknownObjectRetain();
  v12 = a5;
  v13 = self;
  sub_1D9DA6408((uint64_t)v13, v14, (uint64_t)v12, (uint64_t)sub_1D9CD4C74, v10);

  swift_unknownObjectRelease();
  swift_release();
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v6;
  id v7;
  _TtC8VideosUI11ASCListItem *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D9DA65E4((uint64_t)v8, v7);

}

@end
