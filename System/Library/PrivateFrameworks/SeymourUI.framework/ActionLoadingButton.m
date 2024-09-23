@implementation ActionLoadingButton

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActionLoadingButton();
  return -[ActionLoadingButton isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActionLoadingButton();
  v4 = v5.receiver;
  -[ActionLoadingButton setHighlighted:](&v5, sel_setHighlighted_, v3);
  sub_22B539150();

}

- (CGSize)intrinsicContentSize
{
  _TtC9SeymourUI19ActionLoadingButton *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_22B537448();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC9SeymourUI19ActionLoadingButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19ActionLoadingButton *)sub_22B5376D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI19ActionLoadingButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B539E14();
}

- (void)tintColorDidChange
{
  _TtC9SeymourUI19ActionLoadingButton *v2;

  v2 = self;
  sub_22B53795C();

}

- (void)updateConfiguration
{
  _TtC9SeymourUI19ActionLoadingButton *v2;

  v2 = self;
  sub_22B537C58();

}

- (void).cxx_destruct
{
  void *v3;

  sub_22B539A98(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI19ActionLoadingButton_currentState), *(_QWORD *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC9SeymourUI19ActionLoadingButton_currentState));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19ActionLoadingButton_indefiniteSpinner));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI19ActionLoadingButton_defaults);
  objc_release(*(id *)((char *)&self->super.super.super.super._responderFlags
                     + OBJC_IVAR____TtC9SeymourUI19ActionLoadingButton_defaults));

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19ActionLoadingButton_baseForegroundColor));
}

@end
