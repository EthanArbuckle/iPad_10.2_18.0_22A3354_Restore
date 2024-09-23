@implementation MenuManager

- (void)buildMenuWithBuilder:(id)a3
{
  _TtC5TeaUI11MenuManager *v5;

  swift_unknownObjectRetain();
  v5 = self;
  MenuManager.buildMenu(with:)(a3);
  swift_unknownObjectRelease();

}

- (void)handleMenuCommandWithSender:(id)a3
{
  sub_1B16AC9C0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_BYTE *))MenuManager.handleMenuCommand(sender:));
}

- (void)handleAlternateMenuCommandWithSender:(id)a3
{
  sub_1B16AC9C0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_BYTE *))MenuManager.handleAlternateMenuCommand(sender:));
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC5TeaUI11MenuManager *v5;
  _TtC5TeaUI11MenuManager *v6;
  char v7;
  _OWORD v9[2];

  if (a4)
  {
    v5 = self;
    swift_unknownObjectRetain();
    sub_1B16BA3AC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  v7 = MenuManager.canPerformAction(_:withSender:)();

  sub_1B13F77F4((uint64_t)v9);
  return v7 & 1;
}

- (_TtC5TeaUI11MenuManager)init
{
  MenuManager.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_46_1();
  OUTLINED_FUNCTION_46_1();
  OUTLINED_FUNCTION_46_1();
  swift_bridgeObjectRelease();
}

@end
