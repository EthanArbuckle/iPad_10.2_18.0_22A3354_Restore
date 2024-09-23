@implementation TextTableViewCell

- (_TtC13SleepHealthUI17TextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = sub_1A9CE82E0();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC13SleepHealthUI17TextTableViewCell *)sub_1A9C9932C(v4, v5);
}

- (_TtC13SleepHealthUI17TextTableViewCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC13SleepHealthUI17TextTableViewCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI17TextTableViewCell_model;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC13SleepHealthUI17TextTableViewCell *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TextTableViewCell();
  v2 = v3.receiver;
  -[TextTableViewCell tintColorDidChange](&v3, sel_tintColorDidChange);
  sub_1A9C99074();

}

- (void).cxx_destruct
{
  sub_1A9BE2C2C((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI17TextTableViewCell_model);
}

@end
