@implementation SDAirDropReceiveConnectionManager

- (void)wirelessBluetoothStateChangedWithNotification:(id)a3
{
  sub_1002E60B0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100721B40, (uint64_t)&unk_100721B68, (uint64_t)&unk_1007B9CF8, (uint64_t)&unk_1007B9D00);
}

- (void)screenStateChangedWithNotification:(id)a3
{
  sub_1002E60B0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100721AF0, (uint64_t)&unk_100721B18, (uint64_t)&unk_1007B9CE0, (uint64_t)&unk_1007B9CE8);
}

- (void)appleIDChangedWithNotification:(id)a3
{
  sub_1002E60B0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100721AA0, (uint64_t)&unk_100721AC8, (uint64_t)&unk_1007B9CC8, (uint64_t)&unk_1007B9CD0);
}

- (void)deviceNameChangedWithNotification:(id)a3
{
  sub_1002E60B0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100721A50, (uint64_t)&unk_100721A78, (uint64_t)&unk_1007B9CB0, (uint64_t)&unk_1007B9CB8);
}

- (void)discoverableModeChangedWithNotification:(id)a3
{
  sub_1002E60B0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100721A00, (uint64_t)&unk_100721A28, (uint64_t)&unk_1007B9C98, (uint64_t)&unk_1007B9CA0);
}

- (void)consoleUserChangedWithNotification:(id)a3
{
  sub_1002E60B0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_1007219B0, (uint64_t)&unk_1007219D8, (uint64_t)&unk_1007B9C80, (uint64_t)&unk_1007B9C88);
}

@end
