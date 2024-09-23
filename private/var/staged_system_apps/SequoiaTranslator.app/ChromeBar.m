@implementation ChromeBar

- (_TtC17SequoiaTranslator9ChromeBar)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator9ChromeBar *)sub_10002EE8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17SequoiaTranslator9ChromeBar)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  _TtC17SequoiaTranslator9ChromeBar *result;

  v4 = OBJC_IVAR____TtC17SequoiaTranslator9ChromeBar_backgroundView;
  v5 = qword_10028A3A8;
  v6 = a3;
  if (v5 != -1)
    swift_once(&qword_10028A3A8, sub_10002EE50);
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)objc_msgSend(objc_allocWithZone((Class)UIVisualEffectView), "initWithEffect:", qword_10028C250);

  result = (_TtC17SequoiaTranslator9ChromeBar *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001001F88D0, "SequoiaTranslator/ChromeBar.swift", 33, 2, 24, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator9ChromeBar_backgroundView));
}

@end
