@implementation TTRIAddShareesViewController

+ (id)titleString
{
  Swift::String v3;
  Swift::String v4;

  v4._object = (void *)0x800000010055F720;
  v3._countAndFlagsBits = 0x7372655020646441;
  v3._object = (void *)0xEA00000000006E6FLL;
  v4._countAndFlagsBits = 0xD00000000000002ALL;
  return sub_100049544((int)a1, (int)a2, v3, v4);
}

+ (id)composeLabel
{
  Swift::String v3;
  Swift::String v4;

  v4._object = (void *)0x800000010055F6D0;
  v3._countAndFlagsBits = 3829588;
  v3._object = (void *)0xE300000000000000;
  v4._countAndFlagsBits = 0xD000000000000047;
  return sub_100049544((int)a1, (int)a2, v3, v4);
}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders28TTRIAddShareesViewController *v3;

  v3 = self;
  sub_100049588((uint64_t)v3, v2);

}

- (_TtC9Reminders28TTRIAddShareesViewController)initWithAllowsPhoneNumbers:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[RemindersListAddPersonController initWithAllowsPhoneNumbers:](&v5, "initWithAllowsPhoneNumbers:", v3);
}

- (_TtC9Reminders28TTRIAddShareesViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC9Reminders28TTRIAddShareesViewController *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
    v10 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[TTRIAddShareesViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);

  return v12;
}

- (_TtC9Reminders28TTRIAddShareesViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[TTRIAddShareesViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
