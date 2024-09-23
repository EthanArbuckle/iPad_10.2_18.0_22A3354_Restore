@implementation ExtensionService

- (void)getConnectionHostInterfaceForBundleIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  NSString *v8;
  _TtC10LinkDaemon16ExtensionService *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject(&unk_10011E6F0, 40, 7);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_100004C84((uint64_t)&unk_10012B7C8, (uint64_t)v7);
}

- (_TtC10LinkDaemon16ExtensionService)init
{
  return (_TtC10LinkDaemon16ExtensionService *)sub_1000C2D50();
}

@end
