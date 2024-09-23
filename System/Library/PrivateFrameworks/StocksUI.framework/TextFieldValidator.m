@implementation TextFieldValidator

- (BOOL)textFieldShouldReturn:(id)a3
{
  uint64_t (*v4)(uint64_t, unint64_t);
  id v5;
  _TtC8StocksUI18TextFieldValidator *v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;

  v4 = *(uint64_t (**)(uint64_t, unint64_t))((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC8StocksUI18TextFieldValidator_isTextValid);
  v5 = a3;
  v6 = self;
  v7 = objc_msgSend(v5, sel_text);
  if (v7)
  {
    v8 = v7;
    v9 = sub_1DC408A4C();
    v11 = v10;

  }
  else
  {
    v9 = 0;
    v11 = 0xE000000000000000;
  }
  v12 = v4(v9, v11);
  v13 = swift_bridgeObjectRelease();
  if ((v12 & 1) != 0)
    (*(void (**)(uint64_t))((char *)&v6->super.isa + OBJC_IVAR____TtC8StocksUI18TextFieldValidator_submit))(v13);

  return v12 & 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  id v7;
  _TtC8StocksUI18TextFieldValidator *v8;

  sub_1DC408A4C();
  v7 = a3;
  v8 = self;
  sub_1DC3E2214(v7);

  swift_bridgeObjectRelease();
  return 1;
}

- (_TtC8StocksUI18TextFieldValidator)init
{
  _TtC8StocksUI18TextFieldValidator *result;

  result = (_TtC8StocksUI18TextFieldValidator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
}

@end
