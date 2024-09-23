@implementation SessionRangedCoachingEventView

- (_TtC9SeymourUI30SessionRangedCoachingEventView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI30SessionRangedCoachingEventView *)sub_22B32BCC8();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI30SessionRangedCoachingEventView *v2;

  v2 = self;
  sub_22B32B648();

}

- (CGSize)intrinsicContentSize
{
  _TtC9SeymourUI30SessionRangedCoachingEventView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_22B32B95C();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SessionRangedCoachingEventView intrinsicContentSize](self, sel_intrinsicContentSize, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC9SeymourUI30SessionRangedCoachingEventView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B32C440();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30SessionRangedCoachingEventView_valueLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30SessionRangedCoachingEventView_unitLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30SessionRangedCoachingEventView_plusImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30SessionRangedCoachingEventView_plusImage));
}

@end
