@implementation TTRListBadgeView

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC15RemindersUICore16TTRListBadgeView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  void *v31;
  CGPoint v33;
  CGRect v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  -[TTRListBadgeView bounds](v11, sel_bounds);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[TTRListBadgeView hitTestInsets](v11, sel_hitTestInsets);
  v22 = UIEdgeInsetsInsetRect(v13, v15, v17, v19, v20, v21);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v9, sel_location);
  v33.x = v29;
  v33.y = v30;
  v34.origin.x = v22;
  v34.origin.y = v24;
  v34.size.width = v26;
  v34.size.height = v28;
  if (CGRectContainsPoint(v34, v33))
  {
    sub_1B41DF50C(0, &qword_1EF0B44F8);
    v31 = (void *)sub_1B490743C();

  }
  else
  {

    v31 = 0;
  }
  return v31;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC15RemindersUICore16TTRListBadgeView *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)_s15RemindersUICore16TTRListBadgeViewC18pointerInteraction_8styleForSo14UIPointerStyleCSgSo0jG0C_So0J6RegionCtF_0();

  return v9;
}

- (_TtC15RemindersUICore16TTRListBadgeView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore16TTRListBadgeView *)TTRListBadgeView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15RemindersUICore16TTRListBadgeView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore16TTRListBadgeView *)TTRListBadgeView.init(coder:)(a3);
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  sub_1B485D5E8(self, (uint64_t)a2, (const char **)&selRef__dynamicUserInterfaceTraitDidChange);
}

- (void)layoutSubviews
{
  _BYTE *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRListBadgeView();
  v2 = v3.receiver;
  -[TTRListBadgeView layoutSubviews](&v3, sel_layoutSubviews);
  sub_1B485ED10();
  if (v2[OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_layerColorsDirty] == 1)
  {
    v2[OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_layerColorsDirty] = 0;
    sub_1B485E778();
  }

}

- (void)tintColorDidChange
{
  sub_1B485D5E8(self, (uint64_t)a2, (const char **)&selRef_tintColorDidChange);
}

- (BOOL)ttrAccessibilityShouldIgnoreAccessibilityName
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_ttrAccessibilityShouldIgnoreAccessibilityName;
  swift_beginAccess();
  return *v2;
}

- (void)setTtrAccessibilityShouldIgnoreAccessibilityName:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_ttrAccessibilityShouldIgnoreAccessibilityName;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)ttrAccessibilityShouldIgnoreTintColorValue
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_ttrAccessibilityShouldIgnoreTintColorValue;
  swift_beginAccess();
  return *v2;
}

- (void)setTtrAccessibilityShouldIgnoreTintColorValue:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_ttrAccessibilityShouldIgnoreTintColorValue;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TTRListBadgeView();
  -[TTRListBadgeView setIsAccessibilityElement:](&v4, sel_setIsAccessibilityElement_, v3);
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1B4312830(self, (uint64_t)a2, (void (*)(void))TTRListBadgeView.accessibilityLabel.getter);
}

- (void)setAccessibilityLabel:(id)a3
{
  sub_1B485FFF4(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityLabel_);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1B4312830(self, (uint64_t)a2, (void (*)(void))TTRListBadgeView.accessibilityValue.getter);
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)sub_1B4312830(self, (uint64_t)a2, (void (*)(void))TTRListBadgeView.accessibilityIdentifier.getter);
}

- (void)setAccessibilityIdentifier:(id)a3
{
  sub_1B485FFF4(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityIdentifier_);
}

- (NSArray)accessibilityUserInputLabels
{
  _TtC15RemindersUICore16TTRListBadgeView *v2;
  _QWORD *v3;
  void *v4;

  v2 = self;
  v3 = TTRListBadgeView.accessibilityUserInputLabels.getter();

  if (v3)
  {
    v4 = (void *)sub_1B4906DA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (unint64_t)accessibilityTraits
{
  char *v2;
  unint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TTRListBadgeView();
  v2 = (char *)v8.receiver;
  v3 = -[TTRListBadgeView accessibilityTraits](&v8, sel_accessibilityTraits);
  v4 = &v2[OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_selected];
  swift_beginAccess();
  if (*v4 == 1)
  {
    v5 = *MEMORY[0x1E0DC46B0];

    if ((v5 & ~v3) != 0)
      v6 = v5;
    else
      v6 = 0;
    v3 |= v6;
  }
  else
  {

  }
  return v3;
}

- (BOOL)accessibilityActivate
{
  _TtC15RemindersUICore16TTRListBadgeView *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = TTRListBadgeView.accessibilityActivate()();

  return v3;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  sub_1B4224990(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_listColorInfo), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_listColorInfo), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_listColorInfo), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_listColorInfo), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_listColorInfo), *(uint64_t *)((char *)&self->super._animationInfo + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_listColorInfo), *((_BYTE *)&self->super._swiftAnimationInfo + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_listColorInfo));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_imageParams));
  v3 = *(_UITraitChangeRegistry **)((char *)&self->super._traitChangeRegistry
                                  + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams);
  v4 = *(CALayer **)((char *)&self->super._layerRetained
                   + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams);
  v5 = *(uint64_t *)((char *)&self->super._subviewCache
                  + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams);
  v6 = *(UIWindow **)((char *)&self->super._window + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams);
  v7 = *(NSArray **)((char *)&self->super._gestureRecognizers
                   + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams);
  sub_1B4862C18(*(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams), *(uint64_t *)((char *)&self->super._animationInfo+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams), *(unsigned int *)((char *)&self->super._swiftAnimationInfo+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundParams));
  sub_1B4862C3C(v3, v4, v5, v6, v7);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_selectionParams));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_selectedLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_shadowLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_emojiView));
  sub_1B4224758(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_customSmartListActionViews), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_customSmartListActionViews));
  sub_1B4862C3C(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_nonEmojiBackgroundLayerGradientSettings), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_nonEmojiBackgroundLayerGradientSettings), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_nonEmojiBackgroundLayerGradientSettings), *(void **)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_nonEmojiBackgroundLayerGradientSettings), *(void **)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_nonEmojiBackgroundLayerGradientSettings));
  sub_1B4862C3C(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_emojiBackgroundLayerGradientSettings), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_emojiBackgroundLayerGradientSettings), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_emojiBackgroundLayerGradientSettings), *(void **)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_emojiBackgroundLayerGradientSettings), *(void **)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_emojiBackgroundLayerGradientSettings));
  swift_bridgeObjectRelease();
  sub_1B4862D34((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore16TTRListBadgeView_accessibilityDelegate);
}

@end
