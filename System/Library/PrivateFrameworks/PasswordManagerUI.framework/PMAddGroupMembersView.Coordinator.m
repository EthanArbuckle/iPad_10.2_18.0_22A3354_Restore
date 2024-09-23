@implementation PMAddGroupMembersView.Coordinator

- (void)memberPickerViewController:(id)a3 addedRecipients:(id)a4
{
  uint64_t v4;
  id v7;
  _TtCV17PasswordManagerUI21PMAddGroupMembersView11Coordinator *v8;

  v4 = (uint64_t)a4;
  if (a4)
  {
    sub_24354DEA8(0, &qword_2572B6B18);
    v4 = sub_243850414();
  }
  v7 = a3;
  v8 = self;
  sub_2435D6C8C(v4);

  swift_bridgeObjectRelease();
}

- (_TtCV17PasswordManagerUI21PMAddGroupMembersView11Coordinator)init
{
  _TtCV17PasswordManagerUI21PMAddGroupMembersView11Coordinator *result;

  result = (_TtCV17PasswordManagerUI21PMAddGroupMembersView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
