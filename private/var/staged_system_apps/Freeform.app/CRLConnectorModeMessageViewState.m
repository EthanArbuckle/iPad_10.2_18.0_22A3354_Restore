@implementation CRLConnectorModeMessageViewState

- (BOOL)isConnectorModeEnabled
{
  return sub_1006E04F8(self, (uint64_t)a2, (uint64_t)&unk_100F05F38, (uint64_t)&unk_100F05F60);
}

- (void)setIsConnectorModeEnabled:(BOOL)a3
{
  sub_100639000(self, (uint64_t)a2, a3, (uint64_t)&unk_100F05F38, (uint64_t)&unk_100F05F60);
}

- (BOOL)isMessageVisible
{
  return sub_1006E04F8(self, (uint64_t)a2, (uint64_t)&unk_100F05F98, (uint64_t)&unk_100F05FC0);
}

- (void)setIsMessageVisible:(BOOL)a3
{
  sub_100639000(self, (uint64_t)a2, a3, (uint64_t)&unk_100F05F98, (uint64_t)&unk_100F05FC0);
}

- (_TtC8Freeform32CRLConnectorModeMessageViewState)init
{
  return (_TtC8Freeform32CRLConnectorModeMessageViewState *)CRLConnectorModeMessageViewState.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform32CRLConnectorModeMessageViewState__isConnectorModeEnabled;
  v4 = sub_1004B804C(&qword_10140B9D0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8Freeform32CRLConnectorModeMessageViewState__isMessageVisible, v4);
}

@end
