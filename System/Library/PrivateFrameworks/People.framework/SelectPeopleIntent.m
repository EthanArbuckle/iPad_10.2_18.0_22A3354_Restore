@implementation SelectPeopleIntent

- (SelectPeopleIntent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SelectPeopleIntent();
  return -[SelectPeopleIntent init](&v3, sel_init);
}

- (SelectPeopleIntent)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SelectPeopleIntent();
  return -[SelectPeopleIntent initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (SelectPeopleIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  id v6;
  void *v7;
  id v8;
  SelectPeopleIntent *v9;
  objc_super v11;

  if (a3)
  {
    sub_1C0747930();
    v6 = a4;
    v7 = (void *)sub_1C074790C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SelectPeopleIntent();
  v9 = -[SelectPeopleIntent initWithIdentifier:backingStore:](&v11, sel_initWithIdentifier_backingStore_, v7, a4);

  return v9;
}

- (SelectPeopleIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  SelectPeopleIntent *v10;
  objc_super v12;

  sub_1C0747930();
  sub_1C0747930();
  if (a5)
    a5 = (id)sub_1C07477EC();
  v7 = (void *)sub_1C074790C();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_1C074790C();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_1C07477E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for SelectPeopleIntent();
  v10 = -[SelectPeopleIntent initWithDomain:verb:parametersByName:](&v12, sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

@end
