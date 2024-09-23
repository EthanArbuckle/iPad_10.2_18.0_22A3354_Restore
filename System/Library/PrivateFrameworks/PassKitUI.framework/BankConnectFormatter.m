@implementation BankConnectFormatter

- (id)formatAsOfDate:(id)a3 hasMultipleBalances:(BOOL)a4
{
  return sub_19D1F7250(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, uint64_t))BankConnectFormatter.formatAsOfDate(_:hasMultipleBalances:));
}

- (id)formatAsOfDateWithFullStop:(id)a3 hasMultipleBalances:(BOOL)a4
{
  return sub_19D1F7250(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, uint64_t))BankConnectFormatter.formatAsOfDateWithFullStop(_:hasMultipleBalances:));
}

- (_TtC9PassKitUI20BankConnectFormatter)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_19DE83C88();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[BankConnectFormatter init](&v5, sel_init);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC9PassKitUI20BankConnectFormatter_calendar;
  v3 = sub_19DE83CB8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
