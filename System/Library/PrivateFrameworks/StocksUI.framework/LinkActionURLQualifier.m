@implementation LinkActionURLQualifier

- (BOOL)allowCopyingOfURL:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC8StocksUI22LinkActionURLQualifier *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v12;

  v4 = sub_1DC3FFDD0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DC3FFD94();
  v8 = self;
  v9 = (void *)sub_1DC3FFD88();
  v10 = objc_msgSend(v9, sel_fc_isHardPaywallNewsArticleURL_, 0);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10 ^ 1;
}

- (BOOL)allowOpenInSafariForURL:(id)a3
{
  return sub_1DC230A5C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_1DC230B50);
}

- (BOOL)allowOpenInNewWindowForURL:(id)a3
{
  return sub_1DC230A5C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_1DC230D10);
}

- (_TtC8StocksUI22LinkActionURLQualifier)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[LinkActionURLQualifier init](&v3, sel_init);
}

@end
