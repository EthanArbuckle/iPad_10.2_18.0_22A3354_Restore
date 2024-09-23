@implementation TranscriptView.TranscriptTextView

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  id v6;
  id v7;
  _TtCC10VoiceMemos14TranscriptView18TranscriptTextView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000F1934();

}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  id v6;
  id v7;
  _TtCC10VoiceMemos14TranscriptView18TranscriptTextView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000F1AB0();

}

- (_TtCC10VoiceMemos14TranscriptView18TranscriptTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  char *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (char *)self + OBJC_IVAR____TtCC10VoiceMemos14TranscriptView18TranscriptTextView_findInteractionObserver;
  *((_QWORD *)v10 + 1) = 0;
  swift_unknownObjectWeakInit(v10, 0);
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TranscriptView.TranscriptTextView();
  return -[TranscriptView.TranscriptTextView initWithFrame:textContainer:](&v12, "initWithFrame:textContainer:", a4, x, y, width, height);
}

- (_TtCC10VoiceMemos14TranscriptView18TranscriptTextView)initWithCoder:(id)a3
{
  char *v5;
  objc_super v7;

  v5 = (char *)self + OBJC_IVAR____TtCC10VoiceMemos14TranscriptView18TranscriptTextView_findInteractionObserver;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TranscriptView.TranscriptTextView();
  return -[TranscriptView.TranscriptTextView initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_1000A3170((uint64_t)self + OBJC_IVAR____TtCC10VoiceMemos14TranscriptView18TranscriptTextView_findInteractionObserver);
}

@end
