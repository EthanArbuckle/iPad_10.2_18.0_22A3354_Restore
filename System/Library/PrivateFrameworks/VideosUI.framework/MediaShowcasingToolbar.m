@implementation MediaShowcasingToolbar

- (_TtC8VideosUI22MediaShowcasingToolbar)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI22MediaShowcasingToolbar *result;

  sub_1D9F5672C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI22MediaShowcasingToolbar)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9F56D74();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC8VideosUI22MediaShowcasingToolbar *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1D9F58AE8();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar_onMutePressed));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar_currentButtonState);
  v4 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar_currentButtonState);
  v5 = *(UITraitCollection **)((char *)&self->super._cachedTraitCollection
                             + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar_currentButtonState);
  v6 = *(id *)((char *)&self->super._swiftAnimationInfo
             + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar_currentButtonState);
  v7 = *(CALayer **)((char *)&self->super._layerRetained
                   + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar_currentButtonState);
  objc_release(*(id *)((char *)&self->super._traitChangeRegistry
                     + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar_currentButtonState));

  swift_release();
  OUTLINED_FUNCTION_43_6();
  OUTLINED_FUNCTION_43_6();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar____lazy_storage___stackView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22MediaShowcasingToolbar_navigationItem));
}

@end
