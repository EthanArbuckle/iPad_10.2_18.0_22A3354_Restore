@implementation ActionButton

- (_TtC5TeaUI12ActionButton)init
{
  return (_TtC5TeaUI12ActionButton *)sub_1B13A7704();
}

- (_TtC5TeaUI12ActionButton)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI12ActionButton *)ActionButton.init(frame:)();
}

- (_TtC5TeaUI12ActionButton)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  ActionButton.init(coder:)((uint64_t)v3, v4, v5, v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI12ActionButton_onTap));
  OUTLINED_FUNCTION_1_35(*(id *)((char *)&self->super.super.super.super.super.super.isa
                               + OBJC_IVAR____TtC5TeaUI12ActionButton_onMenuPresentation));
}

@end
