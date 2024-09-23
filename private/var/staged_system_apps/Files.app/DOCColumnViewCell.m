@implementation DOCColumnViewCell

- (_TtC5Files17DOCColumnViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC5Files17DOCColumnViewCell *)sub_100325E20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Files17DOCColumnViewCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  _TtC5Files17DOCColumnViewCell *v5;

  v3 = a3;
  v5 = (_TtC5Files17DOCColumnViewCell *)sub_1003266DC((uint64_t)v3, v4);

  return v5;
}

- (void)layoutSubviews
{
  _TtC5Files17DOCColumnViewCell *v2;

  v2 = self;
  sub_100326248();

}

- (void)prepareForReuse
{
  char *v2;
  id v3;
  Class isa;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v5.receiver;
  -[DOCColumnViewCell prepareForReuse](&v5, "prepareForReuse");
  sub_1003264B8();
  v3 = *(id *)&v2[OBJC_IVAR____TtC5Files17DOCColumnViewCell_navigationFocusGuide];
  sub_10006922C((uint64_t *)&unk_100648EE0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v3, "setPreferredFocusEnvironments:", isa, v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files17DOCColumnViewCell_browserContainerController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files17DOCColumnViewCell_navigationFocusGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files17DOCColumnViewCell_separatorView));
}

@end
