@implementation PXModifySocialGroupAction

- (NSString)actionIdentifier
{
  PXModifySocialGroupAction *v2;
  void *v3;

  v2 = self;
  sub_1A6F72F3C();
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();

  v3 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)localizedActionName
{
  return (NSString *)0;
}

- (PXModifySocialGroupAction)initWithOriginalSocialGroup:(id)a3 newKeyAsset:(id)a4 newCustomTitle:(id)a5 customTitleWasDeleted:(BOOL)a6 peopleToBeAdded:(id)a7 peopleToBeRemoved:(id)a8
{
  uint64_t v9;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;

  v9 = (uint64_t)a7;
  if (a5)
  {
    v13 = sub_1A7AE3764();
    v15 = v14;
    if (!v9)
      goto LABEL_4;
    goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
  if (a7)
  {
LABEL_3:
    sub_1A6856488(0, (unint64_t *)&qword_1EE8C2870);
    v9 = sub_1A7AE3A10();
  }
LABEL_4:
  if (a8)
  {
    sub_1A6856488(0, (unint64_t *)&qword_1EE8C2870);
    a8 = (id)sub_1A7AE3A10();
  }
  v16 = a3;
  v17 = a4;
  return (PXModifySocialGroupAction *)sub_1A6C9DEC8(v16, a4, v13, v15, a6, v9, (uint64_t)a8);
}

- (void)performAction:(id)a3
{
  void *v4;
  uint64_t v5;
  PXModifySocialGroupAction *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1A6C9E750((uint64_t)sub_1A6A0BDB8, v5, (uint64_t)&unk_1E50E6CD0, (uint64_t)sub_1A6C9E140, (uint64_t)&block_descriptor_134, (uint64_t)&block_descriptor_6_5);

  swift_release();
}

- (void)performUndo:(id)a3
{
  void *v4;
  uint64_t v5;
  PXModifySocialGroupAction *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1A6C9E750((uint64_t)sub_1A687EE84, v5, (uint64_t)&unk_1E50E6D48, (uint64_t)sub_1A6C9E890, (uint64_t)&block_descriptor_13_5, (uint64_t)&block_descriptor_16_4);

  swift_release();
}

- (PXModifySocialGroupAction)initWithPhotoLibrary:(id)a3
{
  id v3;
  PXModifySocialGroupAction *result;

  v3 = a3;
  result = (PXModifySocialGroupAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
