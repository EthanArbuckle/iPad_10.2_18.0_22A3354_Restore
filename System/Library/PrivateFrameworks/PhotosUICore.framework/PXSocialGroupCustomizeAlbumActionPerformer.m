@implementation PXSocialGroupCustomizeAlbumActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  if (!a4)
    return 0;
  if ((objc_msgSend(a4, sel_respondsToSelector_, sel_socialGroups) & 1) != 0)
  {
    v5 = a3;
    v6 = objc_msgSend((id)swift_unknownObjectRetain(), sel_socialGroups);
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v6, sel_count);

      swift_unknownObjectRelease();
      return v8 == (id)1;
    }

    swift_unknownObjectRelease();
  }
  return 0;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v5;
  void *v6;

  v5 = a4;
  swift_unknownObjectRetain();
  sub_1A6F8FADC();

  swift_unknownObjectRelease();
  v6 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return v6;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return (id)sub_1A7AE3734();
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = sub_1A7AE3764();
  v8 = v7;
  v9 = sub_1A7AE3764();
  v11 = v10;
  if (a5)
  {
    v12 = sub_1A7AE3764();
    a5 = v13;
  }
  else
  {
    v12 = 0;
  }
  v14 = sub_1A6939190(v6, v8, v9, v11, v12, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

- (void)performUserInteractionTask
{
  PXSocialGroupCustomizeAlbumActionPerformer *v2;

  v2 = self;
  sub_1A6937C54();

}

- (PXSocialGroupCustomizeAlbumActionPerformer)initWithActionType:(id)a3 assetCollectionReference:(id)a4 displayTitleInfo:(id)a5
{
  uint64_t v7;
  uint64_t v8;

  v7 = sub_1A7AE3764();
  return (PXSocialGroupCustomizeAlbumActionPerformer *)sub_1A6938FA8(v7, v8, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PXSocialGroupCustomizeAlbumActionPerformer_photoLibrary));
  swift_bridgeObjectRelease();
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___PXSocialGroupCustomizeAlbumActionPerformer_creationCompletionBlock));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___PXSocialGroupCustomizeAlbumActionPerformer_addPeoplePerformer));
}

@end
