@implementation PXCreateSocialGroupAction

- (NSString)actionIdentifier
{
  PXCreateSocialGroupAction *v2;
  void *v3;

  v2 = self;
  sub_1A6F72F30();
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();

  v3 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)localizedActionName
{
  PXCreateSocialGroupAction *v2;
  void *v3;

  v2 = self;
  sub_1A6F8FADC();

  v3 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PXCreateSocialGroupAction)initWithPeople:(id)a3 customTitle:(id)a4 creationCompletionBlock:(id)a5
{
  uint64_t (*v7)();
  uint64_t (*v8)();
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = (uint64_t (*)())_Block_copy(a5);
  v8 = v7;
  if (!a4)
  {
    v10 = 0;
    if (v7)
      goto LABEL_3;
LABEL_5:
    v11 = 0;
    return (PXCreateSocialGroupAction *)sub_1A6C76578(a3, (uint64_t)a4, v10, (uint64_t)v8, v11);
  }
  a4 = (id)sub_1A7AE3764();
  v10 = v9;
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v8;
  v8 = sub_1A6C77528;
  return (PXCreateSocialGroupAction *)sub_1A6C76578(a3, (uint64_t)a4, v10, (uint64_t)v8, v11);
}

- (void)performAction:(id)a3
{
  sub_1A6C773C4(self, (int)a2, a3, (uint64_t)&unk_1E50E4C80, (uint64_t)sub_1A6A0BDB8, (void (*)(uint64_t, uint64_t))sub_1A6C7674C);
}

- (void)performUndo:(id)a3
{
  sub_1A6C773C4(self, (int)a2, a3, (uint64_t)&unk_1E50E4C58, (uint64_t)sub_1A687EE84, (void (*)(uint64_t, uint64_t))sub_1A6C76C7C);
}

- (PXCreateSocialGroupAction)initWithPhotoLibrary:(id)a3
{
  id v3;
  PXCreateSocialGroupAction *result;

  v3 = a3;
  result = (PXCreateSocialGroupAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___PXCreateSocialGroupAction_creationCompletionBlock));
}

@end
