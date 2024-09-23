@implementation ChevronButton

- (_TtC9SeymourUI13ChevronButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI13ChevronButton *)sub_22B321CA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI13ChevronButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B322E9C();
}

- (void)tintColorDidChange
{
  _TtC9SeymourUI13ChevronButton *v2;

  v2 = self;
  sub_22B3222D4();

}

- (void)layoutSubviews
{
  _TtC9SeymourUI13ChevronButton *v2;

  v2 = self;
  sub_22B3223FC();

}

- (void)contentSizeCategoryChanged
{
  _TtC9SeymourUI13ChevronButton *v2;
  id v3;

  v2 = self;
  v3 = -[ChevronButton traitCollection](v2, sel_traitCollection);
  sub_22B32267C(v3);

}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13ChevronButton_defaults);
  v4 = *(NSMutableArray **)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC9SeymourUI13ChevronButton_defaults);
  v5 = *(UITraitCollection **)((char *)&self->super.super.super._cachedTraitCollection
                             + OBJC_IVAR____TtC9SeymourUI13ChevronButton_defaults);
  v6 = *(UIViewAnimationInfo **)((char *)&self->super.super.super._animationInfo
                               + OBJC_IVAR____TtC9SeymourUI13ChevronButton_defaults);
  v7 = *(id *)((char *)&self->super.super.super._swiftAnimationInfo + OBJC_IVAR____TtC9SeymourUI13ChevronButton_defaults);
  v8 = *(uint64_t *)((char *)&self->super.super.super._traitChangeRegistry
                  + OBJC_IVAR____TtC9SeymourUI13ChevronButton_defaults);
  v9 = *(uint64_t *)((char *)&self->super.super.super._layerRetained + OBJC_IVAR____TtC9SeymourUI13ChevronButton_defaults);
  objc_release(*(id *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC9SeymourUI13ChevronButton_defaults));

  sub_22B29F334(v4, v5, v6, v7, v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22B31ECAC(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI13ChevronButton_fontDescriptorOverride), *(void **)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC9SeymourUI13ChevronButton_fontDescriptorOverride), *(void **)((char *)&self->super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC9SeymourUI13ChevronButton_fontDescriptorOverride), *(void **)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC9SeymourUI13ChevronButton_fontDescriptorOverride), *(uint64_t *)((char *)&self->super.super.super._cachedTraitCollection+ OBJC_IVAR____TtC9SeymourUI13ChevronButton_fontDescriptorOverride), *(uint64_t *)((char *)&self->super.super.super._animationInfo+ OBJC_IVAR____TtC9SeymourUI13ChevronButton_fontDescriptorOverride));
}

@end
