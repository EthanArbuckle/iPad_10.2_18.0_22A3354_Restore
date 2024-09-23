@implementation AudioPlayer

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  id v5;
  _TtC14SiriMessagesUI11AudioPlayer *v6;

  v5 = a3;
  v6 = self;
  sub_246E0DC90();

}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v6;
  _TtC14SiriMessagesUI11AudioPlayer *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_246E0DDCC((uint64_t)v8, a4);

}

- (_TtC14SiriMessagesUI11AudioPlayer)init
{
  sub_246E0E0B8();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14SiriMessagesUI11AudioPlayer___observationRegistrar;
  v4 = sub_246E79B94();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
