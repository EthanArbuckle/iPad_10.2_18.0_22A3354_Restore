@implementation TTRWebViewLoadingStateHelper

- (_TtC9Reminders28TTRWebViewLoadingStateHelper)init
{
  return (_TtC9Reminders28TTRWebViewLoadingStateHelper *)sub_100379BF0((uint64_t)self, (uint64_t)a2);
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC9Reminders28TTRWebViewLoadingStateHelper *v4;
  objc_super v5;
  char v6;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v6 = 1;
  v4 = self;
  PassthroughSubject.send(completion:)(&v6);
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[TTRWebViewLoadingStateHelper dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC9Reminders28TTRWebViewLoadingStateHelper_finishedNavigationPublisher));
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6;
  _TtC9Reminders28TTRWebViewLoadingStateHelper *v7;
  id v8;
  _QWORD v9[2];

  if (a4)
  {
    v9[0] = a4;
    v9[1] = 0;
    v6 = a3;
    v7 = self;
    v8 = a4;
    PassthroughSubject.send(_:)(v9);

  }
  else
  {
    __break(1u);
  }
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  _TtC9Reminders28TTRWebViewLoadingStateHelper *v10;
  id v11;
  _QWORD v12[2];

  if (a4)
  {
    v12[0] = a4;
    v12[1] = a5;
    v8 = a3;
    v9 = a5;
    v10 = self;
    v11 = a4;
    PassthroughSubject.send(_:)(v12);

  }
  else
  {
    __break(1u);
  }
}

@end
