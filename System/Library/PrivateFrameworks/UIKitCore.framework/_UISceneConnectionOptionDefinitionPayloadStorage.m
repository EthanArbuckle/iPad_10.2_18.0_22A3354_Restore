@implementation _UISceneConnectionOptionDefinitionPayloadStorage

- (_UISceneConnectionOptionDefinitionPayloadStorage)init
{
  _UISceneConnectionOptionDefinitionPayloadStorage *v2;
  objc_super v4;

  v2 = self;
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____UISceneConnectionOptionDefinitionPayloadStorage_values) = (Class)sub_1856A2DEC(MEMORY[0x1E0DEE9D8]);

  v4.receiver = v2;
  v4.super_class = (Class)_UISceneConnectionOptionDefinitionPayloadStorage;
  return -[_UISceneConnectionOptionDefinitionPayloadStorage init](&v4, sel_init);
}

- (void)applyValuesFromOtherStorage:(id)a3
{
  id v4;
  _UISceneConnectionOptionDefinitionPayloadStorage *v5;

  v4 = a3;
  v5 = self;
  sub_18577736C((uint64_t)v4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
