@implementation PrivacySettingsPlacardCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  _TtC17PrivacySettingsUI26PrivacySettingsPlacardCell *v5;

  v4 = a3;
  v5 = self;
  sub_1DB25343C();

}

- (_TtC17PrivacySettingsUI26PrivacySettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (a4)
  {
    v7 = sub_1DB2557CC();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = a5;
  return (_TtC17PrivacySettingsUI26PrivacySettingsPlacardCell *)sub_1DB252C70(a3, v7, v9, a5);
}

- (_TtC17PrivacySettingsUI26PrivacySettingsPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_class *ObjectType;
  _TtC17PrivacySettingsUI26PrivacySettingsPlacardCell *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_1DB2557CC();
    a4 = (id)sub_1DB2557A8();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = -[PrivacySettingsPlacardCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);

  return v8;
}

- (_TtC17PrivacySettingsUI26PrivacySettingsPlacardCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[PrivacySettingsPlacardCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
