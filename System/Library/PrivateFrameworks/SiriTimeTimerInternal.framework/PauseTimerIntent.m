@implementation PauseTimerIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (PauseTimerIntent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PauseTimerIntent();
  return -[PauseTimerIntent init](&v3, sel_init);
}

- (PauseTimerIntent)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PauseTimerIntent();
  return -[PauseTimerIntent initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (PauseTimerIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  id v6;
  void *v7;
  id v8;
  PauseTimerIntent *v9;
  objc_super v11;

  if (a3)
  {
    sub_2473EE428();
    v6 = a4;
    v7 = (void *)sub_2473EE41C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for PauseTimerIntent();
  v9 = -[PauseTimerIntent initWithIdentifier:backingStore:](&v11, sel_initWithIdentifier_backingStore_, v7, a4);

  return v9;
}

- (PauseTimerIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  PauseTimerIntent *v10;
  objc_super v12;

  sub_2473EE428();
  sub_2473EE428();
  if (a5)
    a5 = (id)sub_2473EE404();
  v7 = (void *)sub_2473EE41C();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_2473EE41C();
  swift_bridgeObjectRelease();
  if (a5)
  {
    v9 = (void *)sub_2473EE3F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for PauseTimerIntent();
  v10 = -[PauseTimerIntent initWithDomain:verb:parametersByName:](&v12, sel_initWithDomain_verb_parametersByName_, v7, v8, v9);

  return v10;
}

@end
