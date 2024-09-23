@implementation JSSettingsViewController.EditNameTextFieldAlert

- (_TtCC16MusicApplication24JSSettingsViewControllerP33_7919D88BB8212442612DA538E61A458122EditNameTextFieldAlert)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtCC16MusicApplication24JSSettingsViewControllerP33_7919D88BB8212442612DA538E61A458122EditNameTextFieldAlert *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC16MusicApplication24JSSettingsViewControllerP33_7919D88BB8212442612DA538E61A458122EditNameTextFieldAlert_doneAction) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtCC16MusicApplication24JSSettingsViewControllerP33_7919D88BB8212442612DA538E61A458122EditNameTextFieldAlert_currentName);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtCC16MusicApplication24JSSettingsViewControllerP33_7919D88BB8212442612DA538E61A458122EditNameTextFieldAlert *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/JSSettingsViewController.swift", 47, 2, 854, 0);
  __break(1u);
  return result;
}

- (void)textFieldDidChange:(id)a3
{
  id v4;
  _TtCC16MusicApplication24JSSettingsViewControllerP33_7919D88BB8212442612DA538E61A458122EditNameTextFieldAlert *v5;

  v4 = a3;
  v5 = self;
  sub_8DC1C4(v4);

}

- (_TtCC16MusicApplication24JSSettingsViewControllerP33_7919D88BB8212442612DA538E61A458122EditNameTextFieldAlert)initWithNibName:(id)a3 bundle:(id)a4
{
  sub_662EC((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)"MusicApplication.EditNameTextFieldAlert", 39);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC16MusicApplication24JSSettingsViewControllerP33_7919D88BB8212442612DA538E61A458122EditNameTextFieldAlert_doneAction));
  swift_bridgeObjectRelease(*(_QWORD *)&self->doneAction[OBJC_IVAR____TtCC16MusicApplication24JSSettingsViewControllerP33_7919D88BB8212442612DA538E61A458122EditNameTextFieldAlert_currentName]);
}

@end
