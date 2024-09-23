@implementation ScriptConfiguration

- (BOOL)useSimulatorBag
{
  return -[ScriptConfiguration useLocalEndpoint](self, sel_useLocalEndpoint);
}

- (NSString)platformName
{
  NSString *result;

  __asm { BR              X10 }
  return result;
}

- (BOOL)disableHTTPCaching
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _TtC15SeymourServices19ScriptConfiguration *v7;
  _BYTE v9[16];

  v3 = sub_1CF14FDDC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0D8EA68], v3);
  v9[14] = 0;
  v7 = self;
  sub_1CF14FAAC();
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);

  return v9[15];
}

- (BOOL)useLocalEndpoint
{
  return sub_1CEAF652C() & 1;
}

- (_TtC15SeymourServices19ScriptConfiguration)init
{
  _TtC15SeymourServices19ScriptConfiguration *result;

  result = (_TtC15SeymourServices19ScriptConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
