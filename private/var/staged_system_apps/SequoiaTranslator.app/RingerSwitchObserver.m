@implementation RingerSwitchObserver

- (_TtC17SequoiaTranslator20RingerSwitchObserver)init
{
  return (_TtC17SequoiaTranslator20RingerSwitchObserver *)sub_100149F58();
}

- (void)dealloc
{
  int v2;
  _TtC17SequoiaTranslator20RingerSwitchObserver *v3;
  objc_super v4;

  v2 = *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC17SequoiaTranslator20RingerSwitchObserver_token);
  v3 = self;
  if (v2 != -1)
    notify_cancel(v2);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for RingerSwitchObserver();
  -[RingerSwitchObserver dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{

}

@end
