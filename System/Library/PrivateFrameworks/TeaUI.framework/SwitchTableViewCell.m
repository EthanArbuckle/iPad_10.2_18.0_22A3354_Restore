@implementation SwitchTableViewCell

- (_TtC5TeaUI19SwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    v4 = sub_1B16B9860();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  return (_TtC5TeaUI19SwitchTableViewCell *)sub_1B160D534(v4, v4, v6);
}

- (_TtC5TeaUI19SwitchTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B160D6BC();
}

- (void)valueChanged
{
  _TtC5TeaUI19SwitchTableViewCell *v2;

  v2 = self;
  sub_1B160D778();

}

- (void).cxx_destruct
{
  sub_1B13B9100(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI19SwitchTableViewCell_onChange));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI19SwitchTableViewCell_switchControl));
}

@end
