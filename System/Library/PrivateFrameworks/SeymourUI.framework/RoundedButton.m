@implementation RoundedButton

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RoundedButton();
  return -[RoundedButton backgroundColor](&v3, sel_backgroundColor);
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  char *v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RoundedButton();
  v4 = a3;
  v5 = (char *)v8.receiver;
  -[RoundedButton setBackgroundColor:](&v8, sel_setBackgroundColor_, v4);
  if (objc_msgSend(v5, sel_tintAdjustmentMode, v8.receiver, v8.super_class) == (id)2)
  {

  }
  else
  {
    v6 = objc_msgSend(v5, sel_backgroundColor);
    v7 = *(void **)&v5[OBJC_IVAR____TtC9SeymourUI13RoundedButton_undimmedBackgroundColor];
    *(_QWORD *)&v5[OBJC_IVAR____TtC9SeymourUI13RoundedButton_undimmedBackgroundColor] = v6;

    v4 = v7;
  }

}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RoundedButton();
  return -[RoundedButton isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC9SeymourUI13RoundedButton *v4;

  v4 = self;
  sub_22B73A3C4(a3);

}

- (_TtC9SeymourUI13RoundedButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI13RoundedButton *)sub_22B73A51C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI13RoundedButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B73BF04();
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  sub_22B73A880(self, (uint64_t)a2, a3, a4, (const char **)&selRef_setImage_forState_);
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  _TtC9SeymourUI13RoundedButton *v6;
  void *v7;
  _TtC9SeymourUI13RoundedButton *v8;
  objc_super v9;

  if (a3)
  {
    sub_22BA8067C();
    v6 = self;
    v7 = (void *)sub_22BA8064C();
  }
  else
  {
    v8 = self;
    v7 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for RoundedButton();
  -[RoundedButton setTitle:forState:](&v9, sel_setTitle_forState_, v7, a4);

  sub_22B73B200();
  swift_bridgeObjectRelease();
}

- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4
{
  sub_22B73A880(self, (uint64_t)a2, a3, a4, (const char **)&selRef_setAttributedTitle_forState_);
}

- (void)tintColorDidChange
{
  _TtC9SeymourUI13RoundedButton *v2;

  v2 = self;
  sub_22B73A8F8();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC9SeymourUI13RoundedButton *v6;

  v5 = a3;
  v6 = self;
  sub_22B73AAB4(a3);

}

- (void)textSizeChanged:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  _TtC9SeymourUI13RoundedButton *v13;
  id v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B8E770);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_22BA79320();
    v8 = sub_22BA79344();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_22BA79344();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13RoundedButton_lastFont);
  v11 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC9SeymourUI13RoundedButton_lastSymbolScale);
  v12 = *((_BYTE *)&self->super.super.super.super._responderFlags
        + OBJC_IVAR____TtC9SeymourUI13RoundedButton_lastSymbolScale);
  v13 = self;
  v14 = v10;
  sub_22B73ACD0(v10, v11, v12, 0);

  sub_22B3BCFC4((uint64_t)v7);
}

- (void)handleTimer:(id)a3
{
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13RoundedButton_shouldShowHighlight) = 1;
  -[RoundedButton setHighlighted:](self, sel_setHighlighted_, 1);
}

- (void)handleTouchDown:(id)a3
{
  void *v5;
  id v6;
  _TtC9SeymourUI13RoundedButton *v7;
  objc_class *v8;
  id v9;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = self;
  v8 = (objc_class *)objc_msgSend(v5, sel_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_, v7, sel_handleTimer_, 0, 0, 0.12);
  v9 = *(Class *)((char *)&v7->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI13RoundedButton_highlightTimer);
  *(Class *)((char *)&v7->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13RoundedButton_highlightTimer) = v8;

}

- (void)handleTouchUp:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13RoundedButton_highlightTimer), sel_invalidate, a3);
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  sub_22B539A98(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI13RoundedButton_currentState), *(_QWORD *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC9SeymourUI13RoundedButton_currentState));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13RoundedButton_indefiniteSpinner));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13RoundedButton_defaults);
  v4 = *(void **)((char *)&self->super.super.super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI13RoundedButton_defaults);
  v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI13RoundedButton_defaults);
  v6 = *(NSMutableArray **)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC9SeymourUI13RoundedButton_defaults);
  objc_release(*(id *)((char *)&self->super.super.super._subviewCache
                     + OBJC_IVAR____TtC9SeymourUI13RoundedButton_defaults));
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13RoundedButton_highlightTimer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13RoundedButton_lastFont));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13RoundedButton_undimmedBackgroundColor));
}

@end
