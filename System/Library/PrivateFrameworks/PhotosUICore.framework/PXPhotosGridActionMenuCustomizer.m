@implementation PXPhotosGridActionMenuCustomizer

- (PXPhotosGridActionMenuCustomizer)initWithViewModel:(id)a3 excludedActionTypes:(id)a4
{
  uint64_t v6;
  id v7;
  PXPhotosGridActionMenuCustomizer *v8;
  uint64_t (*v9)(void);
  uint64_t v10;
  objc_class *v11;
  PXPhotosGridActionMenuCustomizer *v12;
  objc_super v14;

  v6 = sub_1A7AE3DA0();
  v7 = a3;
  v8 = self;
  v9 = (uint64_t (*)(void))PXPhotosViewModel.customMenuActionsProvider.getter();
  v10 = v9();
  swift_release();
  v11 = (objc_class *)MEMORY[0x1E0DEE9D8];
  if (v10)
    v11 = (objc_class *)v10;
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR___PXPhotosGridActionMenuCustomizer_customMenuActions) = v11;
  *(Class *)((char *)&v8->super.isa + OBJC_IVAR___PXPhotosGridActionMenuCustomizer_excludedActionTypes) = (Class)v6;

  v14.receiver = v8;
  v14.super_class = (Class)type metadata accessor for PhotosGridActionMenuCustomizer();
  v12 = -[PXPhotosGridActionMenuCustomizer init](&v14, sel_init);

  return v12;
}

- (id)customizedActions:(id)a3 actionTypes:(id)a4
{
  void *v5;
  unint64_t v6;
  PXPhotosGridActionMenuCustomizer *v7;
  void *v8;

  v5 = _Block_copy(a4);
  sub_1A6856488(0, (unint64_t *)&qword_1EE8C2810);
  v6 = sub_1A7AE3A10();
  _Block_copy(v5);
  v7 = self;
  sub_1A6C738EC(v6, (char *)v7, v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
  v8 = (void *)sub_1A7AE39F8();
  swift_bridgeObjectRelease();
  return v8;
}

- (PXPhotosGridActionMenuCustomizer)init
{
  PXPhotosGridActionMenuCustomizer *result;

  result = (PXPhotosGridActionMenuCustomizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
