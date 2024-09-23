@implementation SenseRow

- (UILabel)titleLabel
{
  _TtC17SequoiaTranslator8SenseRow *v2;
  id v3;

  v2 = self;
  v3 = sub_10015C8DC();

  return (UILabel *)v3;
}

- (void)setTitleLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___titleLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___titleLabel) = (Class)a3;
  v3 = a3;

}

- (UILabel)subtitleLabel
{
  _TtC17SequoiaTranslator8SenseRow *v2;
  id v3;

  v2 = self;
  v3 = sub_10015CA58();

  return (UILabel *)v3;
}

- (void)setSubtitleLabel:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___subtitleLabel);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___subtitleLabel) = (Class)a3;
  v3 = a3;

}

- (UIImageView)checkmark
{
  _TtC17SequoiaTranslator8SenseRow *v2;
  id v3;

  v2 = self;
  v3 = sub_10015CC08();

  return (UIImageView *)v3;
}

- (void)setCheckmark:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___checkmark);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___checkmark) = (Class)a3;
  v3 = a3;

}

- (_TtC17SequoiaTranslator8SenseRow)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10015D6F4();
}

- (_TtC17SequoiaTranslator8SenseRow)initWithFrame:(CGRect)a3
{
  _TtC17SequoiaTranslator8SenseRow *result;

  result = (_TtC17SequoiaTranslator8SenseRow *)_swift_stdlib_reportUnimplementedInitializer("SequoiaTranslator.SenseRow", 26, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___checkmark));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___titleStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow____lazy_storage___checkmarkImage));
  swift_bridgeObjectRelease();
  sub_100009C08((Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator8SenseRow_sense));
}

@end
