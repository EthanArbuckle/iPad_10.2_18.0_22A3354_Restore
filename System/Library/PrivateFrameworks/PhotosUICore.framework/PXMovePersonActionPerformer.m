@implementation PXMovePersonActionPerformer

- (NSArray)sourcePeople
{
  void *v2;

  swift_beginAccess();
  sub_1A6856488(0, (unint64_t *)&qword_1EE8C2870);
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  v2 = (void *)sub_1A7AE39F8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setSourcePeople:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  sub_1A6856488(0, (unint64_t *)&qword_1EE8C2870);
  v4 = sub_1A7AE3A10();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___PXMovePersonActionPerformer_sourcePeople);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (int64_t)destinationManualOrder
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___PXMovePersonActionPerformer_destinationManualOrder);
  swift_beginAccess();
  return *v2;
}

- (void)setDestinationManualOrder:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___PXMovePersonActionPerformer_destinationManualOrder);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)destinationType
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___PXMovePersonActionPerformer_destinationType);
  swift_beginAccess();
  return *v2;
}

- (void)setDestinationType:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___PXMovePersonActionPerformer_destinationType);
  swift_beginAccess();
  *v4 = a3;
}

+ (BOOL)canPerformOn:(id)a3
{
  return 1;
}

+ (id)localizedTitleForPerson:(id)a3
{
  return 0;
}

+ (id)systemImageNameForPerson:(id)a3
{
  return 0;
}

- (void)performBackgroundTask
{
  PXMovePersonActionPerformer *v2;

  v2 = self;
  sub_1A6A4E3E0();

}

- (PXMovePersonActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  objc_class *ObjectType;
  uint64_t v9;
  id v10;
  id v11;
  PXMovePersonActionPerformer *v12;
  void *v13;
  PXMovePersonActionPerformer *v14;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1A7AE3764();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXMovePersonActionPerformer_sourcePeople) = (Class)MEMORY[0x1E0DEE9D8];
  v9 = OBJC_IVAR___PXMovePersonActionPerformer_destinationManualOrder;
  v10 = a4;
  v11 = a5;
  v12 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)sub_1A7ADC1D4();
  *(Class *)((char *)&v12->super.super.super.isa + OBJC_IVAR___PXMovePersonActionPerformer_destinationType) = (Class)-1;

  v13 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  v16.receiver = v12;
  v16.super_class = ObjectType;
  v14 = -[PXAssetCollectionActionPerformer initWithActionType:assetCollectionReference:displayTitleInfo:](&v16, sel_initWithActionType_assetCollectionReference_displayTitleInfo_, v13, v10, v11);

  return v14;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
