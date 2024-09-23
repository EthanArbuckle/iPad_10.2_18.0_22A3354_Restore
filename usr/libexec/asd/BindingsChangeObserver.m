@implementation BindingsChangeObserver

+ (_TtC3asd22BindingsChangeObserver)shared
{
  return (_TtC3asd22BindingsChangeObserver *)static BindingsChangeObserver.shared.getter();
}

- (void)registerObservers
{
  _TtC3asd22BindingsChangeObserver *v2;

  v2 = self;
  BindingsChangeObserver.registerObservers()();

}

- (_TtC3asd22BindingsChangeObserver)init
{
  BindingsChangeObserver.init()();
}

- (void).cxx_destruct
{
  sub_100032F94((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3asd22BindingsChangeObserver_contactsManager));
  sub_100032F94((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3asd22BindingsChangeObserver_xpcStreamListener));
}

@end
