@implementation ICTagDetailCell

- (id)selectionOperatorChangeHandler
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa
                 + OBJC_IVAR___ICTagDetailCell_selectionOperatorChangeHandler))
    return 0;
  v2 = *(_QWORD *)&self->selectionOperatorChangeHandler[OBJC_IVAR___ICTagDetailCell_selectionOperatorChangeHandler];
  v6[4] = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                   + OBJC_IVAR___ICTagDetailCell_selectionOperatorChangeHandler);
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_100343CD8;
  v6[3] = &unk_10056A298;
  v3 = _Block_copy(v6);
  v4 = v7;
  swift_retain(v2);
  swift_release(v4);
  return v3;
}

- (void)setSelectionOperatorChangeHandler:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_10056A280, 24, 7);
    v4[2] = v5;
    v6 = sub_100166BB0;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___ICTagDetailCell_selectionOperatorChangeHandler);
  v9 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR___ICTagDetailCell_selectionOperatorChangeHandler);
  v8 = *(_QWORD *)&self->selectionOperatorChangeHandler[OBJC_IVAR___ICTagDetailCell_selectionOperatorChangeHandler];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_100012C50(v9, v8);
}

- (NSString)text
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->selectionOperatorChangeHandler[OBJC_IVAR___ICTagDetailCell_text];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->selectionOperatorChangeHandler[OBJC_IVAR___ICTagDetailCell_text]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  ICTagDetailCell *v8;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___ICTagDetailCell_text);
  v7 = *(_QWORD *)&self->selectionOperatorChangeHandler[OBJC_IVAR___ICTagDetailCell_text];
  *v6 = v4;
  v6[1] = v5;
  v8 = self;
  swift_bridgeObjectRelease(v7);
  sub_100343E48();

}

- (NSAttributedString)attributedText
{
  return (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                       + OBJC_IVAR___ICTagDetailCell_attributedText));
}

- (void)setAttributedText:(id)a3
{
  ICTagDetailCell *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_100345828(a3);

}

- (int64_t)maxNumberOfLines
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR___ICTagDetailCell_maxNumberOfLines);
}

- (void)setMaxNumberOfLines:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagDetailCell_maxNumberOfLines) = (Class)a3;
  -[ICTagDetailCell setNeedsUpdateConfiguration](self, "setNeedsUpdateConfiguration");
}

- (ICTagSelection)tagSelection
{
  return (ICTagSelection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                   + OBJC_IVAR___ICTagDetailCell_tagSelection));
}

- (void)setTagSelection:(id)a3
{
  void *v4;
  ICTagDetailCell *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagDetailCell_tagSelection);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagDetailCell_tagSelection) = (Class)a3;
  v6 = a3;
  v5 = self;

  sub_100343FBC();
  sub_1003440AC();

}

- (BOOL)showOperatorMenuButton
{
  return *((_BYTE *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagDetailCell_showOperatorMenuButton);
}

- (void)setShowOperatorMenuButton:(BOOL)a3
{
  uint64_t v4;
  _BYTE *v5;
  ICTagDetailCell *v6;

  v4 = OBJC_IVAR___ICTagDetailCell_showOperatorMenuButton;
  *((_BYTE *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagDetailCell_showOperatorMenuButton) = a3;
  v6 = self;
  v5 = sub_1003442AC();
  v5[OBJC_IVAR____TtC11MobileNotes24InlineMenuButtonTextView_preservesMenuLineHeight] = *((_BYTE *)&self->super.super.super.super.super.super.isa
                                                                                        + v4);

  sub_1003440AC();
  -[ICTagDetailCell setNeedsUpdateConfiguration](v6, "setNeedsUpdateConfiguration");

}

- (void)updateForTagSelection:(id)a3 animated:(BOOL)a4
{
  id v6;
  ICTagDetailCell *v7;

  v6 = a3;
  v7 = self;
  sub_1003443BC(v6, a4);

}

- (ICTagDetailCell)initWithFrame:(CGRect)a3
{
  return (ICTagDetailCell *)sub_100344588(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (ICTagDetailCell)initWithCoder:(id)a3
{
  return (ICTagDetailCell *)sub_10034474C(a3);
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  ICTagDetailCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100344900((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void).cxx_destruct
{
  sub_100012C50(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR___ICTagDetailCell_selectionOperatorChangeHandler), *(_QWORD *)&self->selectionOperatorChangeHandler[OBJC_IVAR___ICTagDetailCell_selectionOperatorChangeHandler]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->selectionOperatorChangeHandler[OBJC_IVAR___ICTagDetailCell_text]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagDetailCell_attributedText));

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagDetailCell____lazy_storage___allAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagDetailCell____lazy_storage___anyAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagDetailCell____lazy_storage___menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagDetailCell____lazy_storage___listContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagDetailCell____lazy_storage___textView));
}

@end
