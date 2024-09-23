@implementation PSGGeneralPlacardCell

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4;
  _TtC17GeneralSettingsUI21PSGGeneralPlacardCell *v5;

  v4 = a3;
  v5 = self;
  sub_22E0552B4();

}

- (_TtC17GeneralSettingsUI21PSGGeneralPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (a4)
  {
    v7 = sub_22E056650();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = a5;
  return (_TtC17GeneralSettingsUI21PSGGeneralPlacardCell *)sub_22E054E7C(a3, v7, v9, a5);
}

- (_TtC17GeneralSettingsUI21PSGGeneralPlacardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_class *ObjectType;
  _TtC17GeneralSettingsUI21PSGGeneralPlacardCell *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_22E056650();
    a4 = (id)sub_22E05662C();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = -[PSGGeneralPlacardCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);

  return v8;
}

- (_TtC17GeneralSettingsUI21PSGGeneralPlacardCell)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[PSGGeneralPlacardCell initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
