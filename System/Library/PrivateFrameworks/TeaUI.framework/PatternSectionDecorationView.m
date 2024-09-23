@implementation PatternSectionDecorationView

- (_TtC5TeaUI28PatternSectionDecorationView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI28PatternSectionDecorationView *)PatternSectionDecorationView.init(frame:)();
}

- (_TtC5TeaUI28PatternSectionDecorationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B14974F8();
}

- (void)layoutSubviews
{
  _TtC5TeaUI28PatternSectionDecorationView *v2;

  v2 = self;
  PatternSectionDecorationView.layoutSubviews()();

}

- (void)willMoveToSuperview:(id)a3
{
  id v5;
  _TtC5TeaUI28PatternSectionDecorationView *v6;

  v5 = a3;
  v6 = self;
  PatternSectionDecorationView.willMove(toSuperview:)((UIView_optional *)a3);

}

- (void)didMoveToSuperview
{
  _TtC5TeaUI28PatternSectionDecorationView *v2;

  v2 = self;
  PatternSectionDecorationView.didMoveToSuperview()();

}

- (void)applyLayoutAttributes:(id)a3
{
  UICollectionViewLayoutAttributes *v4;
  _TtC5TeaUI28PatternSectionDecorationView *v5;

  v4 = (UICollectionViewLayoutAttributes *)a3;
  v5 = self;
  PatternSectionDecorationView.apply(_:)(v4);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC5TeaUI28PatternSectionDecorationView *v6;
  _TtC5TeaUI28PatternSectionDecorationView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  PatternSectionDecorationView.traitCollectionDidChange(_:)(v8);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI28PatternSectionDecorationView_patternView));
  sub_1B1497E24(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5TeaUI28PatternSectionDecorationView_model), *(_QWORD *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC5TeaUI28PatternSectionDecorationView_model), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC5TeaUI28PatternSectionDecorationView_model), *(uint64_t *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC5TeaUI28PatternSectionDecorationView_model), *(uint64_t *)((char *)&self->super.super._cachedTraitCollection+ OBJC_IVAR____TtC5TeaUI28PatternSectionDecorationView_model), *(uint64_t *)((char *)&self->super.super._animationInfo + OBJC_IVAR____TtC5TeaUI28PatternSectionDecorationView_model), *(uint64_t *)((char *)&self->super.super._swiftAnimationInfo+ OBJC_IVAR____TtC5TeaUI28PatternSectionDecorationView_model));
  swift_bridgeObjectRelease();
}

@end
