@implementation StoryColorGradeEditorOverlayContentLayout

- (void)update
{
  _TtC15PhotosUIPrivateP33_3F240FA02FCAE5DC780044DE9ABB5C8941StoryColorGradeEditorOverlayContentLayout *v2;

  v2 = self;
  sub_1AABE3F70();

}

- (void)referenceSizeDidChange
{
  _TtC15PhotosUIPrivateP33_3F240FA02FCAE5DC780044DE9ABB5C8941StoryColorGradeEditorOverlayContentLayout *v2;

  v2 = self;
  sub_1AABE4148();

}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  _TtC15PhotosUIPrivateP33_3F240FA02FCAE5DC780044DE9ABB5C8941StoryColorGradeEditorOverlayContentLayout *v8;
  int64_t v9;
  _QWORD v11[4];

  swift_unknownObjectRetain();
  v8 = self;
  sub_1AB08DCA8();
  swift_unknownObjectRelease();
  v9 = sub_1AABE451C(v11, a4, a5);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  return v9;
}

- (int64_t)scrollableAxis
{
  return OUTLINED_FUNCTION_144();
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  id v6;
  _TtC15PhotosUIPrivateP33_3F240FA02FCAE5DC780044DE9ABB5C8941StoryColorGradeEditorOverlayContentLayout *v7;
  char *v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1AABE5F8C((uint64_t)v6, a4);

  return v8;
}

- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)a5
{
  double v5;
  double v6;
  CGSize result;

  CGSizeMake(a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  void *v10;
  __int128 v12;
  uint64_t v13;

  sub_1AABE61C4(&v12);
  v4 = v13;
  if (!v13)
    return 0;
  v5 = __swift_project_boxed_opaque_existential_0(&v12, v13);
  v6 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v6 + 16))(v9, v7);
  v10 = (void *)sub_1AB08DFE4();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v12);
  return v10;
}

- (_TtC15PhotosUIPrivateP33_3F240FA02FCAE5DC780044DE9ABB5C8941StoryColorGradeEditorOverlayContentLayout)initWithComposition:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AABE62A4();
}

- (_TtC15PhotosUIPrivateP33_3F240FA02FCAE5DC780044DE9ABB5C8941StoryColorGradeEditorOverlayContentLayout)init
{
  sub_1AABE62F4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivateP33_3F240FA02FCAE5DC780044DE9ABB5C8941StoryColorGradeEditorOverlayContentLayout_viewModel));
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
