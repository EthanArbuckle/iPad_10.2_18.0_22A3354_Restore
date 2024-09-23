@implementation LocationSearchCompleter

- (_TtC7Weather23LocationSearchCompleter)init
{
  LocationSearchCompleter.init()();
}

- (void).cxx_destruct
{
  sub_1000BF8D0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Weather23LocationSearchCompleter_onUpdate), *(_QWORD *)&self->onUpdate[OBJC_IVAR____TtC7Weather23LocationSearchCompleter_onUpdate]);
  sub_1000BF8D0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7Weather23LocationSearchCompleter_onError), *(_QWORD *)&self->onUpdate[OBJC_IVAR____TtC7Weather23LocationSearchCompleter_onError]);

}

- (void)completerDidUpdateResults:(id)a3
{
  id v4;
  _TtC7Weather23LocationSearchCompleter *v5;

  v4 = a3;
  v5 = self;
  LocationSearchCompleter.completerDidUpdateResults(_:)((MKLocalSearchCompleter)v5);

}

- (void)completer:(id)a3 didFailWithError:(id)a4
{
  id v6;
  _TtC7Weather23LocationSearchCompleter *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  LocationSearchCompleter.completer(_:didFailWithError:)((uint64_t)v7, (uint64_t)v8);

}

@end
