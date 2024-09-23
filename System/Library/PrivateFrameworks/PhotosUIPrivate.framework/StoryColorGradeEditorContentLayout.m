@implementation StoryColorGradeEditorContentLayout

- (int64_t)selectionDecorationStyleInLayout:(id)a3
{
  return 2;
}

- (unint64_t)selectionDecorationAdditionsInLayout:(id)a3
{
  return 0;
}

- (id)selectedSpriteIndexesInLayout:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC15PhotosUIPrivate34StoryColorGradeEditorContentLayout *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEBBDC00);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  v9 = self;
  sub_1AABE37D8((uint64_t)v7);

  v10 = sub_1AB08B008();
  v11 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v10) != 1)
  {
    v11 = (void *)sub_1AB08AFC0();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v7, v10);
  }
  return v11;
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)overlayInsetsForSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  float v4;
  float v5;
  float v6;
  float v7;
  $C28CD4A45FD07A4F97CC9D5F91F25271 result;

  v4 = sub_1AABE3998();
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (int64_t)overallSelectionOrderAtSpriteIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v5;
  _TtC15PhotosUIPrivate34StoryColorGradeEditorContentLayout *v6;
  int64_t v7;

  v5 = a4;
  v6 = self;
  v7 = sub_1AABE39C0();

  return v7;
}

- (_TtC15PhotosUIPrivate34StoryColorGradeEditorContentLayout)initWithDecoratedLayout:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AABE3A0C();
}

- (_TtC15PhotosUIPrivate34StoryColorGradeEditorContentLayout)init
{
  sub_1AABE3A48();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate34StoryColorGradeEditorContentLayout_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate34StoryColorGradeEditorContentLayout_overlayLayout));
}

@end
