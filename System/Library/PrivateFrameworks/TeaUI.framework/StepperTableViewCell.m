@implementation StepperTableViewCell

- (_TtC5TeaUI20StepperTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1B16B9860();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC5TeaUI20StepperTableViewCell *)sub_1B1670294(a3, (uint64_t)a4, v6);
}

- (_TtC5TeaUI20StepperTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B1670850();
}

- (void)valueChanged
{
  _TtC5TeaUI20StepperTableViewCell *v2;

  v2 = self;
  sub_1B1670938();

}

- (void).cxx_destruct
{
  sub_1B13B9100(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI20StepperTableViewCell_onChange));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI20StepperTableViewCell_valueLabel));

}

@end
