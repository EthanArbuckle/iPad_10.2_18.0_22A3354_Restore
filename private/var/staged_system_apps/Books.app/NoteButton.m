@implementation NoteButton

- (_TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton)initWithFrame:(CGRect)a3
{
  return (_TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton *)sub_100697B04(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton_annotation) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton_associatedHighlightText);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/BookReaderAccessoryNotesController.swift", 46, 2, 326, 0);
  __break(1u);
  return result;
}

- (NSArray)accessibilityUserInputLabels
{
  _TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_100698244();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton_annotation));
  swift_bridgeObjectRelease(*(_QWORD *)&self->annotation[OBJC_IVAR____TtC5BooksP33_2999BCB781BB4046BF6F224C010EC6FE10NoteButton_associatedHighlightText]);
}

@end
