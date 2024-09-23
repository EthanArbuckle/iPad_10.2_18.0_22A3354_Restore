@implementation PXBoopableItemsProvider_Swift

- (PXBoopableItemsProvider_Swift)init
{
  return (PXBoopableItemsProvider_Swift *)BoopableItemsProvider.init()();
}

- (void)dealloc
{
  uint64_t v2;
  PXBoopableItemsProvider_Swift *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  objc_super v8;

  v2 = qword_1EE991160;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = sub_1A7ADFF24();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EE991168);
  v5 = sub_1A7ADFF0C();
  v6 = sub_1A7AE3F74();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A6789000, v5, v6, "-= Boop activity items configuration deinit =-", v7, 2u);
    MEMORY[0x1A85CEBCC](v7, -1, -1);
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for BoopableItemsProvider();
  -[PXBoopableItemsProvider_Swift dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

- (PXSectionedSelectionManager)selectionManager
{
  return (PXSectionedSelectionManager *)sub_1A718D960((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PXBoopableItemsProvider_Swift_selectionManager);
}

- (void)setSelectionManager:(id)a3
{
  id v5;
  PXBoopableItemsProvider_Swift *v6;
  void **v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = self;
  sub_1A718FA68();
  v7 = (void **)((char *)&v6->super.isa + OBJC_IVAR___PXBoopableItemsProvider_Swift_selectionManager);
  swift_beginAccess();
  v8 = *v7;
  *v7 = a3;
  v9 = v5;

  sub_1A718CBCC();
}

- (NSArray)assets
{
  void *v2;

  swift_beginAccess();
  sub_1A6856488(0, (unint64_t *)&qword_1EE8C4430);
  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  v2 = (void *)sub_1A7AE39F8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setAssets:(id)a3
{
  unint64_t v4;
  PXBoopableItemsProvider_Swift *v5;
  unint64_t *v6;

  sub_1A6856488(0, (unint64_t *)&qword_1EE8C4430);
  v4 = sub_1A7AE3A10();
  v5 = self;
  sub_1A718D0D8(v4);
  v6 = (unint64_t *)((char *)v5 + OBJC_IVAR___PXBoopableItemsProvider_Swift_assets);
  swift_beginAccess();
  *v6 = v4;

  swift_bridgeObjectRelease();
}

- (PXMediaProvider)imagePreviewMediaProvider
{
  return (PXMediaProvider *)sub_1A718D960((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PXBoopableItemsProvider_Swift_imagePreviewMediaProvider);
}

- (void)setImagePreviewMediaProvider:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___PXBoopableItemsProvider_Swift_imagePreviewMediaProvider);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NSArray)itemProvidersForActivityItemsConfiguration
{
  PXBoopableItemsProvider_Swift *v2;
  void *v3;

  v2 = self;
  sub_1A718DB8C();

  sub_1A6856488(0, &qword_1EE90B950);
  v3 = (void *)sub_1A7AE39F8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (id)activityItemsConfigurationMetadataForKey:(id)a3
{
  id v4;
  PXBoopableItemsProvider_Swift *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD v14[3];
  uint64_t v15;

  v4 = a3;
  v5 = self;
  sub_1A718E1F0((uint64_t)v14);

  v6 = v15;
  if (!v15)
    return 0;
  v7 = __swift_project_boxed_opaque_existential_1(v14, v15);
  v8 = *(_QWORD *)(v6 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v8 + 16))(v11, v9);
  v12 = (void *)sub_1A7AE4D9C();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v6);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  return v12;
}

- (id)activityItemsConfigurationMetadataForItemAtIndex:(int64_t)a3 key:(id)a4
{
  void (*v5)(_QWORD *__return_ptr, id);
  id v6;
  PXBoopableItemsProvider_Swift *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD v16[3];
  uint64_t v17;

  v5 = *(void (**)(_QWORD *__return_ptr, id))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0xC0);
  v6 = a4;
  v7 = self;
  v5(v16, v6);

  v8 = v17;
  if (!v17)
    return 0;
  v9 = __swift_project_boxed_opaque_existential_1(v16, v17);
  v10 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v10 + 16))(v13, v11);
  v14 = (void *)sub_1A7AE4D9C();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  return v14;
}

- (id)activityItemsConfigurationPreviewForItemAtIndex:(int64_t)a3 intent:(id)a4 suggestedSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  PXBoopableItemsProvider_Swift *v10;
  id v11;

  height = a5.height;
  width = a5.width;
  v9 = a4;
  v10 = self;
  v11 = sub_1A718FC70(a3, width, height);

  return v11;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v5;
  uint64_t v8;
  void *v9;
  id v10;
  PXBoopableItemsProvider_Swift *v11;
  id v12;

  v5 = a4;
  objc_opt_self();
  v8 = swift_dynamicCastObjCClass();
  if (v8)
  {
    if ((v5 & 1) != 0)
    {
      v9 = (void *)v8;
      v10 = a3;
      v11 = self;
      v12 = objc_msgSend(v9, sel_selectionSnapshot);
      sub_1A718E8CC(v12);

    }
  }
  else
  {
    sub_1A7AE4AFC();
    __break(1u);
  }
}

@end
