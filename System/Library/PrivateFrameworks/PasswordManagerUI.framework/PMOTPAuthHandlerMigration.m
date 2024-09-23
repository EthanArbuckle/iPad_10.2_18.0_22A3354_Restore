@implementation PMOTPAuthHandlerMigration

- (BOOL)migrateDefaultOTPAuthHandlerWithURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unsigned __int8 v7;
  uint64_t v9;

  v3 = sub_24384D720();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24384D6F0();
  v7 = sub_243538970((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

- (PMOTPAuthHandlerMigration)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PMOTPAuthHandlerMigration;
  return -[PMOTPAuthHandlerMigration init](&v3, sel_init);
}

@end
