@implementation PXSocialGroupMakeKeyPhotoAction

- (NSString)actionIdentifier
{
  void *v2;

  sub_1A7AE3764();
  v2 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)localizedActionName
{
  PXSocialGroupMakeKeyPhotoAction *v2;
  void *v3;

  v2 = self;
  sub_1A6F8FADC();

  v3 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PXSocialGroupMakeKeyPhotoAction)initWithSocialGroup:(id)a3 newKeyAsset:(id)a4
{
  objc_class *ObjectType;
  id v8;
  id v9;
  id v10;
  id v11;
  PXSocialGroupMakeKeyPhotoAction *result;
  PXSocialGroupMakeKeyPhotoAction *v13;
  PXSocialGroupMakeKeyPhotoAction *v14;
  objc_super v15;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXSocialGroupMakeKeyPhotoAction_originalKeyAsset) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXSocialGroupMakeKeyPhotoAction_socialGroup) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PXSocialGroupMakeKeyPhotoAction_newKeyAsset) = (Class)a4;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  v11 = v9;
  result = (PXSocialGroupMakeKeyPhotoAction *)objc_msgSend(v10, sel_photoLibrary);
  if (result)
  {
    v13 = result;
    v15.receiver = self;
    v15.super_class = ObjectType;
    v14 = -[PXPhotosAction initWithPhotoLibrary:](&v15, sel_initWithPhotoLibrary_, result);

    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)performAction:(id)a3
{
  sub_1A6C773C4(self, (int)a2, a3, (uint64_t)&unk_1E50FF548, (uint64_t)sub_1A6A0BDB8, (void (*)(uint64_t, uint64_t))sub_1A6F82790);
}

- (void)performUndo:(id)a3
{
  sub_1A6C773C4(self, (int)a2, a3, (uint64_t)&unk_1E50FF520, (uint64_t)sub_1A687EE84, (void (*)(uint64_t, uint64_t))sub_1A6F82D34);
}

- (PXSocialGroupMakeKeyPhotoAction)initWithPhotoLibrary:(id)a3
{
  id v3;
  PXSocialGroupMakeKeyPhotoAction *result;

  v3 = a3;
  result = (PXSocialGroupMakeKeyPhotoAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PXSocialGroupMakeKeyPhotoAction_originalKeyAsset));
}

@end
