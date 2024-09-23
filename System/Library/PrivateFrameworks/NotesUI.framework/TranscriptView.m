@implementation TranscriptView

- (_TtC7NotesUI14TranscriptView)initWithCoder:(id)a3
{
  id v5;
  _TtC7NotesUI14TranscriptView *result;

  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7NotesUI14TranscriptView_scrollAnimationDuration) = (Class)0x3FD0000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7NotesUI14TranscriptView_inset) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7NotesUI14TranscriptView_padding) = (Class)0x4018000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC7NotesUI14TranscriptView_summaryButton) = 0;
  v5 = a3;

  result = (_TtC7NotesUI14TranscriptView *)sub_1ACA42C6C();
  __break(1u);
  return result;
}

- (BOOL)supportsTextReplacement
{
  return 0;
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  id v6;
  _TtC7NotesUI14TranscriptView *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_1AC9B1C2C((uint64_t)v8, (uint64_t)v6);

}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  id v6;
  _TtC7NotesUI14TranscriptView *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_1AC9B1D3C((uint64_t)v8, (uint64_t)v6);

}

- (NSArray)accessibilityElements
{
  _TtC7NotesUI14TranscriptView *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1AC9B3DE8();

  if (v3)
  {
    v4 = (void *)sub_1ACA42210();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setAccessibilityElements:(id)a3
{
  _TtC7NotesUI14TranscriptView *v4;
  void *v5;
  _TtC7NotesUI14TranscriptView *v6;
  objc_super v7;

  if (a3)
  {
    sub_1ACA42228();
    v4 = self;
    v5 = (void *)sub_1ACA42210();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
    v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TranscriptView();
  -[TranscriptView setAccessibilityElements:](&v7, sel_setAccessibilityElements_, v5);

}

- (_TtC7NotesUI14TranscriptView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4;
  _TtC7NotesUI14TranscriptView *result;

  v4 = a4;
  result = (_TtC7NotesUI14TranscriptView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7NotesUI14TranscriptView_summaryButton));
}

@end
