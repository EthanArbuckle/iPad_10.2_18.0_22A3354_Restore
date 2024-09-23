@implementation PXTTRWorkflowFactory

+ (void)presentDefaultWorkFlowInViewController:(id)a3 withContext:(int64_t)a4 attachmentImageUrls:(id)a5 attachmentFileUrls:(id)a6
{
  id v7;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v7 = a5;
  if (a5)
  {
    sub_1A7ADC8A0();
    a1 = (id)sub_1A7AE3A10();
    v7 = a1;
  }
  if (a6)
  {
    sub_1A7ADC8A0();
    a1 = (id)sub_1A7AE3A10();
    a6 = a1;
  }
  MEMORY[0x1E0C80A78](a1);
  v9 = a3;
  sub_1A72142A0((uint64_t (*)(uint64_t))sub_1A6D694D0, &v11);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v7;
  *(_QWORD *)(v10 + 24) = a6;
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  sub_1A721434C(v9, (uint64_t)sub_1A6D694D4, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)presentDefaultWorkFlowInViewController:(id)a3 withContext:(int64_t)a4 attachmentImageUrls:(id)a5
{
  id v5;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a5;
  if (a5)
  {
    sub_1A7ADC8A0();
    a1 = (id)sub_1A7AE3A10();
    v5 = a1;
  }
  MEMORY[0x1E0C80A78](a1);
  v7 = a3;
  sub_1A72142A0((uint64_t (*)(uint64_t))sub_1A6D694D0, &v9);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v5;
  *(_QWORD *)(v8 + 24) = 0;
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  sub_1A721434C(v7, (uint64_t)sub_1A6D694D4, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)presentDefaultWorkFlowInViewController:(id)a3 withContext:(int64_t)a4 attachmentFileUrls:(id)a5
{
  id v5;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a5;
  if (a5)
  {
    sub_1A7ADC8A0();
    a1 = (id)sub_1A7AE3A10();
    v5 = a1;
  }
  MEMORY[0x1E0C80A78](a1);
  v7 = a3;
  sub_1A72142A0((uint64_t (*)(uint64_t))sub_1A6D694D0, &v9);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = 0;
  *(_QWORD *)(v8 + 24) = v5;
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  sub_1A721434C(v7, (uint64_t)sub_1A6D694D4, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (PXTTRWorkflowFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRWorkflowFactory();
  return -[PXTTRWorkflowFactory init](&v3, sel_init);
}

@end
