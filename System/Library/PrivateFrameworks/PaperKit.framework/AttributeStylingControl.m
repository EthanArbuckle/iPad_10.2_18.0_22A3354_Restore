@implementation AttributeStylingControl

- (_TtC8PaperKit23AttributeStylingControl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized AttributeStylingControl.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC8PaperKit23AttributeStylingControl *v2;

  v2 = self;
  AttributeStylingControl.layoutSubviews()();

}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  _TtC8PaperKit23AttributeStylingControl *v8;
  _TtC8PaperKit23AttributeStylingControl *v9;
  _OWORD v10[2];

  if (a3)
  {
    v8 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v9 = self;
  }
  AttributeStylingControl.addTarget(_:action:for:)((uint64_t)v10, (uint64_t)a4, a5);

  outlined destroy of Any?((uint64_t)v10);
}

- (void)removeTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  _TtC8PaperKit23AttributeStylingControl *v8;
  _TtC8PaperKit23AttributeStylingControl *v9;
  _OWORD v10[2];

  if (a3)
  {
    v8 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v9 = self;
  }
  AttributeStylingControl.removeTarget(_:action:for:)((uint64_t)v10, (uint64_t)a4, a5);

  outlined destroy of Any?((uint64_t)v10);
}

- (BOOL)isSelected
{
  return @objc AttributeStylingControl.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  @objc AttributeStylingControl.isSelected.setter(self, (uint64_t)a2, a3, (const char **)&selRef_setSelected_);
}

- (BOOL)isHighlighted
{
  return @objc AttributeStylingControl.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  @objc AttributeStylingControl.isSelected.setter(self, (uint64_t)a2, a3, (const char **)&selRef_setHighlighted_);
}

- (BOOL)isEnabled
{
  return @objc AttributeStylingControl.isSelected.getter(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  @objc AttributeStylingControl.isSelected.setter(self, (uint64_t)a2, a3, (const char **)&selRef_setEnabled_);
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  _TtC8PaperKit23AttributeStylingControl *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_contentStackView);
  v3 = *MEMORY[0x1E0DC4FF8];
  v4 = *(double *)(MEMORY[0x1E0DC4FF8] + 8);
  v5 = self;
  objc_msgSend(v2, sel_systemLayoutSizeFittingSize_, v3, v4);
  v7 = *(double *)((char *)&v5->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_contentInsets);
  v8 = v6
     + *(double *)((char *)&v5->super.super.super._responderFlags
                 + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_contentInsets)
     + *(double *)((char *)&v5->super.super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_contentInsets);
  v10 = v9
      + *(double *)((char *)&v5->super.super.super.super.isa
                  + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_contentInsets);

  v11 = v10 + v7;
  v12 = v8;
  result.height = v11;
  result.width = v12;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AttributeStylingControl();
  v4 = a3;
  v5 = v6.receiver;
  -[AttributeStylingControl traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  AttributeStylingControl.updateUI()();

}

- (_TtC8PaperKit23AttributeStylingControl)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit23AttributeStylingControl *result;

  result = (_TtC8PaperKit23AttributeStylingControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_contentButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_titleLabelFont));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_font));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23AttributeStylingControl_image));
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  _TtC8PaperKit23AttributeStylingControl *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[6];

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  if (!-[AttributeStylingControl isSelected](v10, sel_isSelected))
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v8;
    v14[4] = partial apply for closure #1 in AttributeStylingControl.pointerInteraction(_:willEnter:animator:);
    v14[5] = v11;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 1107296256;
    v14[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
    v14[3] = &block_descriptor_7_0;
    v12 = _Block_copy(v14);
    v13 = v8;
    swift_release();
    objc_msgSend(a5, sel_addAnimations_, v12);
    _Block_release(v12);
  }
  swift_unknownObjectRelease();

}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  uint64_t v9;
  void *v10;
  id v11;
  _TtC8PaperKit23AttributeStylingControl *v12;
  id v13;
  _TtC8PaperKit23AttributeStylingControl *v14;
  id v15;
  _QWORD v16[6];

  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  *(_QWORD *)(v9 + 24) = self;
  v16[4] = partial apply for closure #1 in AttributeStylingControl.pointerInteraction(_:willExit:animator:);
  v16[5] = v9;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 1107296256;
  v16[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  v16[3] = &block_descriptor_20;
  v10 = _Block_copy(v16);
  v11 = a3;
  v12 = self;
  v13 = v11;
  v14 = v12;
  v15 = a4;
  swift_unknownObjectRetain();
  swift_release();
  objc_msgSend(a5, sel_addAnimations_, v10);
  _Block_release(v10);

  swift_unknownObjectRelease();
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return objc_msgSend((id)objc_opt_self(), sel_systemPointerStyle);
}

@end
