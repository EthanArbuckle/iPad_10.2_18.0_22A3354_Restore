@implementation TTRIReminderCellHashtagViewController

- (_TtC15RemindersUICore37TTRIReminderCellHashtagViewController)init
{
  _TtC15RemindersUICore37TTRIReminderCellHashtagViewController *result;

  result = (_TtC15RemindersUICore37TTRIReminderCellHashtagViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderCellHashtagViewController_hashtagsAttributedText));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderCellHashtagViewController_uncommittedHashtagsFont));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderCellHashtagViewController_uncommittedHashtagsBoldFont));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderCellHashtagViewController_committedHashtagsFont));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderCellHashtagViewController____lazy_storage___committedHashtagsBoldFont));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderCellHashtagViewController_uncommittedTagsColor));
  swift_unknownObjectRelease();
  swift_release();
  sub_1B448B9D8(*(void **)((char *)&self->super.isa
                         + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderCellHashtagViewController_lastTextChangeDetail));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore37TTRIReminderCellHashtagViewController_descriptionAndTagsView));
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v4;
  _TtC15RemindersUICore37TTRIReminderCellHashtagViewController *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1B44F19A4((uint64_t)v4);

  return self & 1;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4;
  _TtC15RemindersUICore37TTRIReminderCellHashtagViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B44F1AFC(v4);

}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  _TtC15RemindersUICore37TTRIReminderCellHashtagViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B44F1CC4(v4);

}

- (void)textViewDidChange:(id)a3
{
  id v4;
  _TtC15RemindersUICore37TTRIReminderCellHashtagViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B44F1E44(v4);

}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4;
  _TtC15RemindersUICore37TTRIReminderCellHashtagViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1B44F20A0();

}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC15RemindersUICore37TTRIReminderCellHashtagViewController *v13;

  length = a4.length;
  location = a4.location;
  v9 = sub_1B4906A64();
  v11 = v10;
  v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1B44F22E8((uint64_t)v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (id)textView:(id)a3 editMenuForTextInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  Swift::Int length;
  Swift::Int location;
  uint64_t v9;
  id v10;
  _TtC15RemindersUICore37TTRIReminderCellHashtagViewController *v11;
  __C::_NSRange v12;
  void *v13;

  length = a4.length;
  location = a4.location;
  sub_1B41DF50C(0, (unint64_t *)&unk_1EF0A3630);
  v9 = sub_1B4906DAC();
  type metadata accessor for TTRIReminderTitleTextView();
  if (swift_dynamicCastClass())
  {
    v10 = a3;
    v11 = self;
    v12.location = location;
    v12.length = length;
    v13 = (void *)TTRIReminderTitleTextView.editMenuForTextIn(_:suggestedActions:)(v12, (Swift::OpaquePointer)v9);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v13 = 0;
  }
  return v13;
}

@end
