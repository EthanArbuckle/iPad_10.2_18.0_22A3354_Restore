@implementation DOCProgressIndicatorView

- (double)fractionCompleted
{
  return *(double *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC5Files24DOCProgressIndicatorView_fractionCompleted);
}

- (void)setFractionCompleted:(double)a3
{
  _TtC5Files24DOCProgressIndicatorView *v3;

  *(double *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC5Files24DOCProgressIndicatorView_fractionCompleted) = a3;
  v3 = self;
  sub_1002AE018();

}

- (_TtC5Files24DOCProgressIndicatorView)initWithFrame:(CGRect)a3
{
  sub_100226BB0((uint64_t)self, (uint64_t)a2, (uint64_t)"Files.DOCProgressIndicatorView", 30);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCProgressIndicatorView_preferredIconColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files24DOCProgressIndicatorView_contentView));
}

@end
