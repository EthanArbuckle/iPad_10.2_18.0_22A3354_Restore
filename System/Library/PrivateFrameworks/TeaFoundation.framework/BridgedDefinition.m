@implementation BridgedDefinition

- (id)inScope:(unint64_t)a3
{
  _TtC13TeaFoundation17BridgedDefinition *v4;
  id v5;

  v4 = self;
  v5 = sub_190AB9CE8(a3);

  return v5;
}

- (id)withConfiguration:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC13TeaFoundation17BridgedDefinition *v6;
  id v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  v7 = sub_190AC1520((uint64_t)sub_190AF9C88, v5);

  swift_release();
  return v7;
}

- (void).cxx_destruct
{
  swift_release();
}

- (_TtC13TeaFoundation17BridgedDefinition)init
{
  sub_190BC3CDC();
}

@end
