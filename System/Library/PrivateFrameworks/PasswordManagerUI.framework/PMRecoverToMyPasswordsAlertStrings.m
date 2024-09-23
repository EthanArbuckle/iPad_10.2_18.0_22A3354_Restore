@implementation PMRecoverToMyPasswordsAlertStrings

+ (id)alertTitleForRecoveringSavedAccountToMyPasswords:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  sub_2437DBB60(v3);

  v4 = (void *)sub_243850234();
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)alertMessageForRecoveringSavedAccountToMyPasswords:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  sub_2437DBCE8(v3);
  v5 = v4;

  if (v5)
  {
    v6 = (void *)sub_243850234();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)alertTitleAndMessageForRecoveringSavedAccountToMyPasswords:(id)a3
{
  id v4;
  id v5;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = sub_2437D9E9C((uint64_t)v4);

  return v5;
}

+ (id)alertTitleForRecoveringSavedAccountsToMyPasswords:(id)a3
{
  unint64_t v3;
  void *v4;

  sub_24354DEA8(0, (unint64_t *)&qword_2572B40D8);
  v3 = sub_243850414();
  swift_getObjCClassMetadata();
  sub_2437D9FB0(v3);
  swift_bridgeObjectRelease();
  v4 = (void *)sub_243850234();
  swift_bridgeObjectRelease();
  return v4;
}

+ (id)alertMessageForRecoveringSavedAccountsToMyPasswords:(id)a3
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  sub_24354DEA8(0, (unint64_t *)&qword_2572B40D8);
  v3 = sub_243850414();
  swift_getObjCClassMetadata();
  sub_2437DAF60(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    v6 = (void *)sub_243850234();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)alertTitleAndMessageForRecoveringSavedAccountsToMyPasswords:(id)a3
{
  void *v3;
  void *v4;

  sub_24354DEA8(0, (unint64_t *)&qword_2572B40D8);
  sub_243850414();
  swift_getObjCClassMetadata();
  sub_2437DB7E4();
  v4 = v3;
  swift_bridgeObjectRelease();
  return v4;
}

- (PMRecoverToMyPasswordsAlertStrings)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PMRecoverToMyPasswordsAlertStrings;
  return -[PMRecoverToMyPasswordsAlertStrings init](&v3, sel_init);
}

@end
