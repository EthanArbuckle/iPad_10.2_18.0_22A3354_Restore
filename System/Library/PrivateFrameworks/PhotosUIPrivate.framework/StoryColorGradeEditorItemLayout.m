@implementation StoryColorGradeEditorItemLayout

- (void)update
{
  _TtC15PhotosUIPrivate31StoryColorGradeEditorItemLayout *v2;

  v2 = self;
  sub_1AAC8F7B4();

}

- (void)referenceSizeDidChange
{
  _TtC15PhotosUIPrivate31StoryColorGradeEditorItemLayout *v2;

  v2 = self;
  sub_1AAC90254((uint64_t)v2, type metadata accessor for StoryColorGradeEditorItemLayout, (SEL *)&selRef_referenceSizeDidChange, (void (*)(id))sub_1AAC8F73C);

}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  _TtC15PhotosUIPrivate31StoryColorGradeEditorItemLayout *v7;
  uint64_t v8;
  int64_t v9;
  _QWORD v11[4];

  swift_unknownObjectRetain();
  v7 = self;
  sub_1AB08DCA8();
  swift_unknownObjectRelease();
  v9 = sub_1AAC8F950(v11, v8, a5);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  return v9;
}

- (_TtC15PhotosUIPrivate31StoryColorGradeEditorItemLayout)initWithComposition:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AAC91A48();
}

- (_TtC15PhotosUIPrivate31StoryColorGradeEditorItemLayout)init
{
  sub_1AAC91A84();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate31StoryColorGradeEditorItemLayout_viewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate31StoryColorGradeEditorItemLayout_clipLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate31StoryColorGradeEditorItemLayout_overlayLayout));
  swift_unknownObjectRelease();
}

@end
