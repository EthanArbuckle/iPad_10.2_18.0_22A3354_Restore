@implementation TextAlignmentControl

- (_TtC8PaperKit20TextAlignmentControl)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized TextAlignmentControl.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC8PaperKit20TextAlignmentControl *v2;

  v2 = self;
  TextAlignmentControl.layoutSubviews()();

}

- (void)didTapLeftAlignmentButton
{
  char *v2;
  _TtC8PaperKit20TextAlignmentControl *v3;

  v2 = (char *)self + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_selectedTextAlignment;
  *(_QWORD *)v2 = 0;
  v2[8] = 0;
  v3 = self;
  TextAlignmentControl.updateUI()();
  -[TextAlignmentControl sendActionsForControlEvents:](v3, sel_sendActionsForControlEvents_, 4096);

}

- (void)didTapCenterAlignmentButton
{
  char *v2;
  _TtC8PaperKit20TextAlignmentControl *v3;

  v2 = (char *)self + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_selectedTextAlignment;
  *(_QWORD *)v2 = 1;
  v2[8] = 0;
  v3 = self;
  TextAlignmentControl.updateUI()();
  -[TextAlignmentControl sendActionsForControlEvents:](v3, sel_sendActionsForControlEvents_, 4096);

}

- (void)didTapRightAlignmentButton
{
  char *v2;
  _TtC8PaperKit20TextAlignmentControl *v3;

  v2 = (char *)self + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_selectedTextAlignment;
  *(_QWORD *)v2 = 2;
  v2[8] = 0;
  v3 = self;
  TextAlignmentControl.updateUI()();
  -[TextAlignmentControl sendActionsForControlEvents:](v3, sel_sendActionsForControlEvents_, 4096);

}

- (void)didTapJustifiedAlignmentButton
{
  char *v2;
  _TtC8PaperKit20TextAlignmentControl *v3;

  v2 = (char *)self + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_selectedTextAlignment;
  *(_QWORD *)v2 = 3;
  v2[8] = 0;
  v3 = self;
  TextAlignmentControl.updateUI()();
  -[TextAlignmentControl sendActionsForControlEvents:](v3, sel_sendActionsForControlEvents_, 4096);

}

- (_TtC8PaperKit20TextAlignmentControl)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit20TextAlignmentControl *result;

  result = (_TtC8PaperKit20TextAlignmentControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_leftAlignmentButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_centerAlignmentButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_rightAlignmentButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit20TextAlignmentControl_justifiedAlignmentButton));
}

@end
