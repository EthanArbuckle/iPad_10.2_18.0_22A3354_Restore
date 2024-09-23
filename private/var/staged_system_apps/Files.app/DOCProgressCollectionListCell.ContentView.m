@implementation DOCProgressCollectionListCell.ContentView

- (_TtCC5Files29DOCProgressCollectionListCell11ContentView)initWithFrame:(CGRect)a3
{
  sub_100226BB0((uint64_t)self, (uint64_t)a2, (uint64_t)"Files.ContentView", 17);
}

- (void).cxx_destruct
{
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtCC5Files29DOCProgressCollectionListCell11ContentView_progressConfiguration, &qword_100652490);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Files29DOCProgressCollectionListCell11ContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Files29DOCProgressCollectionListCell11ContentView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Files29DOCProgressCollectionListCell11ContentView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Files29DOCProgressCollectionListCell11ContentView_progressView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Files29DOCProgressCollectionListCell11ContentView_iconViewToTitleTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Files29DOCProgressCollectionListCell11ContentView_mainStack));
}

@end
