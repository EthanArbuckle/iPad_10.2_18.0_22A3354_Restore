@implementation ICSystemPaperThumbnailServiceInternal

+ (ICSystemPaperThumbnailServiceInternal)sharedService
{
  if (qword_1ED6E8490 != -1)
    swift_once();
  return (ICSystemPaperThumbnailServiceInternal *)(id)qword_1ED6E8060;
}

- (ICThumbnailService)thumbnailService
{
  return (ICThumbnailService *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService));
}

- (UITraitCollection)traitCollection
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_traitCollection);
  swift_beginAccess();
  return (UITraitCollection *)*v2;
}

- (void)setTraitCollection:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_traitCollection);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)dealloc
{
  objc_class *ObjectType;
  ICSystemPaperThumbnailServiceInternal *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  SystemPaperThumbnailService.cancel()();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[ICSystemPaperThumbnailServiceInternal dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  sub_1AC7C3AB0((uint64_t)self + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___contextDidUpdateObject, &qword_1ED6E8298);
  sub_1AC7C3AB0((uint64_t)self + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___cacheDidInvalidateObject, &qword_1ED6E8130);
  sub_1AC7C3AB0((uint64_t)self + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___didUpdateSystemPaperNotes, &qword_1ED6E8218);
  sub_1AC7C3AB0((uint64_t)self + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___contextDidDeleteObject, &qword_1ED6E8298);
  sub_1AC7C3AB0((uint64_t)self + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___didDeleteSystemPaperNotes, &qword_1ED6E8200);
  sub_1AC7C3AB0((uint64_t)self + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal____lazy_storage___accessibilityAppearanceDidChange, &qword_1ED6E81E0);
}

- (void)updateIfNeededForNote:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  ICSystemPaperThumbnailServiceInternal *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1ACA0B804;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  SystemPaperThumbnailService.updateIfNeeded(for:completion:)(a3, (uint64_t)v6, v7);
  sub_1AC8C5C14((uint64_t)v6);

}

- (void)updateIfNeededForNotes:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();
  ICSystemPaperThumbnailServiceInternal *v9;

  v5 = _Block_copy(a4);
  sub_1AC7C3570(0, (unint64_t *)&qword_1ED6E85E0);
  sub_1AC90A314((unint64_t *)&qword_1ED6E85E8, (unint64_t *)&qword_1ED6E85E0, 0x1E0D63BB8, MEMORY[0x1E0DEFCF8]);
  v6 = sub_1ACA42348();
  if (v5)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v5;
    v8 = sub_1ACA0B804;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = self;
  SystemPaperThumbnailService.updateIfNeeded(for:completion:)(v6, (uint64_t)v8, v7);
  sub_1AC8C5C14((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (void)updateIfNeededForNoteIDs:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();
  ICSystemPaperThumbnailServiceInternal *v9;

  v5 = _Block_copy(a4);
  sub_1AC7C3570(0, (unint64_t *)&qword_1ED6E8570);
  sub_1AC90A314((unint64_t *)&qword_1ED6E8D38, (unint64_t *)&qword_1ED6E8570, 0x1E0C97B90, MEMORY[0x1E0DEFCF8]);
  v6 = sub_1ACA42348();
  if (v5)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v5;
    v8 = sub_1ACA0B804;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = self;
  SystemPaperThumbnailService.updateIfNeeded(for:completion:)(v6, (uint64_t)v8, v7);
  sub_1AC8C5C14((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (void)updateIfNeededWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  ICSystemPaperThumbnailServiceInternal *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  ICSystemPaperThumbnailServiceInternal *v11;
  _QWORD v12[6];

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1ACA0B640;
  }
  else
  {
    v5 = 0;
  }
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService);
  v7 = self;
  v8 = objc_msgSend(v6, sel_workerContext);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v7;
  v9[3] = v4;
  v9[4] = v5;
  v12[4] = sub_1ACA0B910;
  v12[5] = v9;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = sub_1AC94AFB0;
  v12[3] = &block_descriptor_99;
  v10 = _Block_copy(v12);
  v11 = v7;
  sub_1AC8E0E44((uint64_t)v4);
  swift_release();
  objc_msgSend(v8, sel_performBlock_, v10);
  _Block_release(v10);

  sub_1AC8C5C14((uint64_t)v4);
}

- (void)updateRecentSystemPaperNote
{
  sub_1ACA07AF4((char *)self, (uint64_t)a2, (uint64_t)&unk_1E5C2D638, (uint64_t)sub_1ACA0B8BC, (uint64_t)&block_descriptor_92);
}

- (void)invalidateForNote:(id)a3
{
  id v5;
  ICSystemPaperThumbnailServiceInternal *v6;

  v5 = a3;
  v6 = self;
  SystemPaperThumbnailService.invalidate(for:)(a3);

}

- (void)invalidateForNotes:(id)a3
{
  uint64_t v4;
  ICSystemPaperThumbnailServiceInternal *v5;

  sub_1AC7C3570(0, (unint64_t *)&qword_1ED6E85E0);
  sub_1AC90A314((unint64_t *)&qword_1ED6E85E8, (unint64_t *)&qword_1ED6E85E0, 0x1E0D63BB8, MEMORY[0x1E0DEFCF8]);
  v4 = sub_1ACA42348();
  v5 = self;
  sub_1ACA03CA4(v4, (char *)v5);

  swift_bridgeObjectRelease();
}

- (void)invalidateForNoteIDs:(id)a3
{
  uint64_t v4;
  void *v5;
  ICSystemPaperThumbnailServiceInternal *v6;
  id v7;
  uint64_t v8;
  void *v9;
  ICSystemPaperThumbnailServiceInternal *v10;
  _QWORD v11[6];

  sub_1AC7C3570(0, (unint64_t *)&qword_1ED6E8570);
  sub_1AC90A314((unint64_t *)&qword_1ED6E8D38, (unint64_t *)&qword_1ED6E8570, 0x1E0C97B90, MEMORY[0x1E0DEFCF8]);
  v4 = sub_1ACA42348();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICSystemPaperThumbnailServiceInternal_thumbnailService);
  v6 = self;
  v7 = objc_msgSend(v5, sel_workerContext);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v4;
  *(_QWORD *)(v8 + 24) = v6;
  v11[4] = sub_1ACA0B800;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1AC94AFB0;
  v11[3] = &block_descriptor_85;
  v9 = _Block_copy(v11);
  v10 = v6;
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v7, sel_performBlock_, v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (void)invalidate
{
  sub_1ACA07AF4((char *)self, (uint64_t)a2, (uint64_t)&unk_1E5C2D598, (uint64_t)sub_1ACA0B8D8, (uint64_t)&block_descriptor_78);
}

- (void)observe
{
  ICSystemPaperThumbnailServiceInternal *v2;

  v2 = self;
  SystemPaperThumbnailService.observe()();

}

- (void)cancel
{
  ICSystemPaperThumbnailServiceInternal *v2;

  v2 = self;
  SystemPaperThumbnailService.cancel()();

}

- (ICSystemPaperThumbnailServiceInternal)init
{
  ICSystemPaperThumbnailServiceInternal *result;

  result = (ICSystemPaperThumbnailServiceInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
