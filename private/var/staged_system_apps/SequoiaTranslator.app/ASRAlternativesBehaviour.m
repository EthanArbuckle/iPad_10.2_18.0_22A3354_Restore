@implementation ASRAlternativesBehaviour

- (_TtC17SequoiaTranslator24ASRAlternativesBehaviour)init
{
  return (_TtC17SequoiaTranslator24ASRAlternativesBehaviour *)sub_10000FB88();
}

- (void)dealloc
{
  void *v3;
  _TtC17SequoiaTranslator24ASRAlternativesBehaviour *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:", v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for ASRAlternativesBehaviour();
  -[ASRAlternativesBehaviour dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{

  sub_100011194((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator24ASRAlternativesBehaviour_delegate);
}

- (BOOL)handleTapWithRecognizer:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator24ASRAlternativesBehaviour *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1000105E8(v4);

  return self & 1;
}

- (void)asrAlternativeSelectedWithIndex:(int64_t)a3
{
  _TtC17SequoiaTranslator24ASRAlternativesBehaviour *v4;

  v4 = self;
  sub_10001073C(a3);

}

- (void)menuDidHideWithSender:(id)a3
{
  _TtC17SequoiaTranslator24ASRAlternativesBehaviour *v5;
  _QWORD v6[4];

  swift_unknownObjectRetain(a3);
  v5 = self;
  _bridgeAnyObjectToAny(_:)(v6, a3);
  swift_unknownObjectRelease(a3);
  sub_1000108B8();

  sub_100009C08(v6);
}

@end
