@implementation LineEndControl

- (_TtC8PaperKit14LineEndControl)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8PaperKit14LineEndControl *result;

  v5 = OBJC_IVAR____TtC8PaperKit14LineEndControl_contentStackView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3CA8]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit14LineEndControl_regularCornerRadius) = (Class)0x4020000000000000;

  result = (_TtC8PaperKit14LineEndControl *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8PaperKit14LineEndControl *v2;

  v2 = self;
  LineEndControl.layoutSubviews()();

}

- (void)didTapNoArrowButton
{
  char *v2;
  _TtC8PaperKit14LineEndControl *v3;

  v2 = (char *)self + OBJC_IVAR____TtC8PaperKit14LineEndControl_lineEnds;
  *(_QWORD *)v2 = 0;
  v2[8] = 0;
  *((_QWORD *)v2 + 2) = 0;
  v2[24] = 0;
  v3 = self;
  LineEndControl.updateUI()();
  -[LineEndControl sendActionsForControlEvents:](v3, sel_sendActionsForControlEvents_, 4096);

}

- (void)didTapOneArrowButton
{
  char *v2;
  _TtC8PaperKit14LineEndControl *v3;

  v2 = (char *)self + OBJC_IVAR____TtC8PaperKit14LineEndControl_lineEnds;
  *(_QWORD *)v2 = 1;
  v2[8] = 0;
  *((_QWORD *)v2 + 2) = 0;
  v2[24] = 0;
  v3 = self;
  LineEndControl.updateUI()();
  -[LineEndControl sendActionsForControlEvents:](v3, sel_sendActionsForControlEvents_, 4096);

}

- (void)didTapTwoArrowButton
{
  char *v2;
  _TtC8PaperKit14LineEndControl *v3;

  v2 = (char *)self + OBJC_IVAR____TtC8PaperKit14LineEndControl_lineEnds;
  *(_QWORD *)v2 = 1;
  v2[8] = 0;
  *((_QWORD *)v2 + 2) = 1;
  v2[24] = 0;
  v3 = self;
  LineEndControl.updateUI()();
  -[LineEndControl sendActionsForControlEvents:](v3, sel_sendActionsForControlEvents_, 4096);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit14LineEndControl_contentStackView), sel_systemLayoutSizeFittingSize_, *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC8PaperKit14LineEndControl)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit14LineEndControl *result;

  result = (_TtC8PaperKit14LineEndControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit14LineEndControl_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit14LineEndControl_noArrowButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit14LineEndControl_oneArrowButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit14LineEndControl_twoArrowButton));
}

@end
