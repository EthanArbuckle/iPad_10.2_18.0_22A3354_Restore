@implementation PUOneUpActivitySharingActionPerformer

- (PUOneUpActivitySharingActionPerformer)initWithActionsController:(id)a3
{
  PUOneUpActivitySharingActionPerformer *result;

  swift_unknownObjectRetain();
  OneUpActivitySharingActionPerformer.init(actionsController:)((uint64_t)a3);
  return result;
}

- (BOOL)performActionWithActivityType:(id)a3 assetsByAssetCollection:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  PUOneUpActivitySharingActionPerformer *v9;
  Swift::String v10;

  v5 = sub_1AB08D498();
  v7 = v6;
  sub_1AAC2D8AC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEBC08E0);
  sub_1AAC2D8E8();
  v8 = sub_1AB08D3A8();
  v9 = self;
  v10._countAndFlagsBits = v5;
  v10._object = v7;
  LOBYTE(v5) = OneUpActivitySharingActionPerformer.performAction(forActivityType:assetsByAssetCollection:)(v10, (Swift::OpaquePointer)v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (PUOneUpActivitySharingActionPerformer)init
{
  OneUpActivitySharingActionPerformer.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
