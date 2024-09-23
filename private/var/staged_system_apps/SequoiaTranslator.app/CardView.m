@implementation CardView

- (_TtC17SequoiaTranslator8CardView)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator8CardView *)sub_10002D78C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17SequoiaTranslator8CardView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10002E2C8();
}

- (void).cxx_destruct
{

  sub_10002E414((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator8CardView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator8CardView_stackLeadingAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator8CardView_stackTrailingAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator8CardView_actionLeadingAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator8CardView_actionTrailingAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator8CardView_actionBottomAnchor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator8CardView_separationConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator8CardView_containerBottom));
}

@end
