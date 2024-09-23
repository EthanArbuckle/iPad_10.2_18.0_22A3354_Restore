@implementation SpecifierController

- (void)reloadWithNotification:(id)a3
{
  void *v3;
  id v4;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20SettingsUIKitPrivate19SpecifierController__storage);
  v4 = a3;
  swift_retain();
  objc_msgSend(v3, sel_numberOfSections);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2289EA750();

}

@end
