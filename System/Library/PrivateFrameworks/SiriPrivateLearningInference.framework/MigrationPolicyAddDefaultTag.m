@implementation MigrationPolicyAddDefaultTag

- (id)migrateAndAddDefaultTagWithSource:(id)a3 manager:(id)a4
{
  id v6;
  id v7;
  _TtC28SiriPrivateLearningInference28MigrationPolicyAddDefaultTag *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_213E235A4(v7);

  sub_213DB9CDC(0, &qword_254D3CC28);
  v9 = (void *)sub_213EF2A30();
  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC28SiriPrivateLearningInference28MigrationPolicyAddDefaultTag)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MigrationPolicyAddDefaultTag();
  return -[MigrationPolicyAddDefaultTag init](&v3, sel_init);
}

@end
