@implementation UIPromptBackgroundView

- (_TtC5UIKit22UIPromptBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1856630D0();
}

- (double)_cornerRadius
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UIPromptBackgroundView();
  -[UIView _cornerRadius](&v3, sel__cornerRadius);
  return result;
}

- (void)_setCornerRadius:(double)a3
{
  _TtC5UIKit22UIPromptBackgroundView *v4;

  v4 = self;
  sub_18565FE24(a3);

}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UIPromptBackgroundView();
  v2 = (char *)v5.receiver;
  -[UIView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_effectView];
  objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_);
  v4 = *(void **)&v2[OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_fresnelView];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);

}

- (_TtC5UIKit22UIPromptBackgroundView)initWithFrame:(CGRect)a3
{
  _TtC5UIKit22UIPromptBackgroundView *result;

  result = (_TtC5UIKit22UIPromptBackgroundView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[10];
  char v9;

  v3 = *(_OWORD *)((char *)&self->super._minimumSafeAreaInsets.left
                 + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v8[8] = *(_OWORD *)((char *)&self->super._viewFlags + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration
                                                      + 24);
  v8[9] = v3;
  v9 = *((_BYTE *)&self->super._minimumSafeAreaInsets.right
       + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v4 = *(_OWORD *)((char *)&self->super._window + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v8[4] = *(_OWORD *)((char *)&self->super._layerRetained + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v8[5] = v4;
  v5 = *(_OWORD *)((char *)&self->super._viewFlags + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration + 8);
  v8[6] = *(_OWORD *)((char *)&self->super._viewDelegate + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v8[7] = v5;
  v6 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v8[1] = v6;
  v7 = *(_OWORD *)((char *)&self->super._swiftAnimationInfo
                 + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v8[2] = *(_OWORD *)((char *)&self->super._cachedTraitCollection
                    + OBJC_IVAR____TtC5UIKit22UIPromptBackgroundView_configuration);
  v8[3] = v7;
  sub_18565EF04((uint64_t)v8);

}

@end
