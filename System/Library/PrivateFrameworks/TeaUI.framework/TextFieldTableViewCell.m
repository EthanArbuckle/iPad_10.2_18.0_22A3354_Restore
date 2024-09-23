@implementation TextFieldTableViewCell

- (_TtC5TeaUI22TextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC5TeaUI22TextFieldTableViewCell *)sub_1B1561844(v4, v4, v6);
}

- (_TtC5TeaUI22TextFieldTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B1561A64();
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  _TtC5TeaUI22TextFieldTableViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_1B1561B10(v4);

}

- (void).cxx_destruct
{
  sub_1B13B9100(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5TeaUI22TextFieldTableViewCell_onChange));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI22TextFieldTableViewCell_textField));
}

@end
