@implementation PulldownButton

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PulldownButton();
  return -[PulldownButton isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  unsigned int v5;
  double v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PulldownButton();
  v4 = v7.receiver;
  -[PulldownButton setHighlighted:](&v7, sel_setHighlighted_, v3);
  v5 = objc_msgSend(v4, sel_isHighlighted, v7.receiver, v7.super_class);
  v6 = 0.4;
  if (!v5)
    v6 = 1.0;
  objc_msgSend(v4, sel_setAlpha_, v6);

}

- (_TtC9SeymourUI14PulldownButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI14PulldownButton *)sub_22B6CE8D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI14PulldownButton)initWithCoder:(id)a3
{
  char *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  _TtC9SeymourUI14PulldownButton *result;

  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance;
  v6 = (void *)objc_opt_self();
  v7 = a3;
  v8 = objc_msgSend(v6, sel_secondaryLabelColor);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.650980392, 1.0, 0.0, 1.0);
  v10 = (void *)*MEMORY[0x24BEBE1D0];
  *(_QWORD *)v5 = v8;
  *((_QWORD *)v5 + 1) = v9;
  *((_QWORD *)v5 + 2) = 0;
  *((_QWORD *)v5 + 3) = 0;
  *((_QWORD *)v5 + 4) = v10;
  *(_OWORD *)(v5 + 40) = xmmword_22BA9A5D0;
  v11 = MEMORY[0x24BEE4B08];
  *((_QWORD *)v5 + 7) = 1;
  *((_QWORD *)v5 + 8) = v11;
  v12 = (char *)self + OBJC_IVAR____TtC9SeymourUI14PulldownButton_attributedTitle;
  v13 = sub_22BA79590();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  v14 = v10;

  result = (_TtC9SeymourUI14PulldownButton *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  _TtC9SeymourUI14PulldownButton *v2;

  v2 = self;
  sub_22B6CEDEC();

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

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance);
  v4 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance);
  v5 = *(NSMutableArray **)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance);
  v6 = *(UITraitCollection **)((char *)&self->super.super.super._cachedTraitCollection
                             + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance);
  v7 = *(UIViewAnimationInfo **)((char *)&self->super.super.super._animationInfo
                               + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance);
  v8 = *(uint64_t *)((char *)&self->super.super.super._swiftAnimationInfo
                  + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance);
  v9 = *(uint64_t *)((char *)&self->super.super.super._traitChangeRegistry
                  + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance);
  objc_release(*(id *)((char *)&self->super.super.super.super._responderFlags
                     + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance));

  sub_22B29F334(v4, v5, v6, v7, v8, v9);
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI14PulldownButton_attributedTitle, &qword_255B8C118);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14PulldownButton_textColor));
}

@end
