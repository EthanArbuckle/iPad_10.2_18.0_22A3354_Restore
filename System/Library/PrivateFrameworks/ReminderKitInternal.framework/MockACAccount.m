@implementation MockACAccount

- (NSString)aa_primaryEmail
{
  return (NSString *)sub_1A452DA60();
}

- (NSString)aa_altDSID
{
  return (NSString *)sub_1A452DA60();
}

- (NSArray)childAccounts
{
  void *v2;

  sub_1A4498778();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A4690B94();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (id)childAccountsWithAccountTypeIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;

  if (a3)
  {
    v3 = _sSo15REMSortingStylea19ReminderKitInternalE11descriptionSSvg_0();
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  v6 = swift_bridgeObjectRetain();
  sub_1A452EC0C(v6, v3, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A4498778();
  v7 = (void *)sub_1A4690B94();
  swift_bridgeObjectRelease();
  return v7;
}

- (BOOL)isEnabledForDataclass:(id)a3
{
  uint64_t *v5;
  BOOL result;
  uint64_t v7;
  _TtC19ReminderKitInternal13MockACAccount *v8;
  id v9;
  char v10;

  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19ReminderKitInternal13MockACAccount_rem_enabledDataClasses);
  result = swift_beginAccess();
  if (a3)
  {
    v7 = *v5;
    v8 = self;
    v9 = a3;
    swift_bridgeObjectRetain();
    v10 = sub_1A4462540((uint64_t)v9, v7);

    swift_bridgeObjectRelease();
    return v10 & 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setEnabled:(BOOL)a3 forDataclass:(id)a4
{
  id v7;
  _TtC19ReminderKitInternal13MockACAccount *v8;

  v7 = a4;
  v8 = self;
  sub_1A452DC68(a3, a4);

}

- (NSMutableSet)enabledDataclasses
{
  _TtC19ReminderKitInternal13MockACAccount *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  swift_beginAccess();
  v3 = self;
  v4 = swift_bridgeObjectRetain();
  sub_1A44EFBFC(v4);
  swift_bridgeObjectRelease();
  v5 = objc_allocWithZone(MEMORY[0x1E0C99E20]);
  v6 = (void *)sub_1A4690D5C();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_initWithSet_, v6);

  return (NSMutableSet *)v7;
}

- (void)setEnabledDataclasses:(id)a3
{
  _TtC19ReminderKitInternal13MockACAccount *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1A452EE04(a3);

}

- (_TtC19ReminderKitInternal13MockACAccount)initWithAccountType:(id)a3
{
  return (_TtC19ReminderKitInternal13MockACAccount *)sub_1A452DFE4((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithAccountType_);
}

- (_TtC19ReminderKitInternal13MockACAccount)initWithCoder:(id)a3
{
  return (_TtC19ReminderKitInternal13MockACAccount *)sub_1A452DFE4((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithCoder_);
}

- (_TtC19ReminderKitInternal13MockACAccount)initWithManagedAccount:(id)a3
{
  return (_TtC19ReminderKitInternal13MockACAccount *)sub_1A452DFE4((char *)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithManagedAccount_);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
