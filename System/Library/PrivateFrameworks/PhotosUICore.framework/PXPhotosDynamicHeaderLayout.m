@implementation PXPhotosDynamicHeaderLayout

+ (double)headerMinimumHeightForReferenceSize:(CGSize)a3
{
  double height;
  double width;
  double result;

  height = a3.height;
  width = a3.width;
  sub_1A6D29EC8();
  PhotosDynamicHeaderSpec.headerHeight(for:)(width, height);
  return result;
}

- (void)willUpdate
{
  sub_1A6BE06CC(self, (uint64_t)a2, (const char **)&selRef_willUpdate, (void (*)(char *))off_1E50B8978);
}

- (void)update
{
  PXPhotosDynamicHeaderLayout *v2;

  v2 = self;
  sub_1A6BE0498();

}

- (void)didUpdate
{
  sub_1A6BE06CC(self, (uint64_t)a2, (const char **)&selRef_didUpdate, (void (*)(char *))off_1E50B8968);
}

- (void)visibleRectDidChange
{
  sub_1A6BE089C(self, (uint64_t)a2, (const char **)&selRef_visibleRectDidChange);
}

- (void)safeAreaInsetsDidChange
{
  sub_1A6BE089C(self, (uint64_t)a2, (const char **)&selRef_safeAreaInsetsDidChange);
}

- (void)referenceSizeDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosDynamicHeaderLayout();
  v2 = v3.receiver;
  -[PXGLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  swift_beginAccess();
  sub_1A6BE034C();
  PXGLayout.invalidate<A>(updateFlags:with:)();
  swift_endAccess();
  swift_beginAccess();
  sub_1A6BE0308();
  PXGLayout.invalidate<A>(updateFlags:with:)();
  swift_endAccess();

}

- (void)entityManagerDidChange
{
  sub_1A6BE089C(self, (uint64_t)a2, (const char **)&selRef_entityManagerDidChange);
}

- (void)contentSizeDidChange
{
  sub_1A6BE089C(self, (uint64_t)a2, (const char **)&selRef_contentSizeDidChange);
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  Class result;

  result = (Class)sub_1A6BE25C8(a3);
  if (result)
    return (Class)swift_getObjCClassFromMetadata();
  return result;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6;
  PXPhotosDynamicHeaderLayout *v7;
  void *v8;

  v6 = a4;
  v7 = self;
  v8 = (void *)sub_1A6BE26A8(a3);

  return v8;
}

- (NSIndexSet)axSpriteIndexes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v2 = sub_1A7ADCC0C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[1] = MEMORY[0x1E0DEE9D8];
  sub_1A6847A44(&qword_1EE8C3310, v6, MEMORY[0x1E0CB13E8]);
  v7 = MEMORY[0x1E0DEB418];
  sub_1A6847920(0, (unint64_t *)&unk_1EE8C4260, MEMORY[0x1E0DEB418], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1A6BE2910(&qword_1EE8C4270, (unint64_t *)&unk_1EE8C4260, v7, MEMORY[0x1E0DEAF38]);
  sub_1A7AE47A8();
  v8 = (void *)sub_1A7ADCB7C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSIndexSet *)v8;
}

- (PXPhotosDynamicHeaderLayout)init
{
  PXPhotosDynamicHeaderLayout *result;

  result = (PXPhotosDynamicHeaderLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  swift_release();
}

@end
