@implementation TVWidgetAsyncOperation

- (_TtC17TVWidgetExtension22TVWidgetAsyncOperation)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC17TVWidgetExtension22TVWidgetAsyncOperation__logIdentifier);
  *v2 = 0;
  v2[1] = 0;
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC17TVWidgetExtension22TVWidgetAsyncOperation_lock) = 0;
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC17TVWidgetExtension22TVWidgetAsyncOperation__state) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TVWidgetAsyncOperation();
  return -[TVWidgetAsyncOperation init](&v4, "init");
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  _TtC17TVWidgetExtension22TVWidgetAsyncOperation *v2;
  char v3;

  v2 = self;
  v3 = sub_100019A78();

  return v3 & 1;
}

- (BOOL)isFinished
{
  _TtC17TVWidgetExtension22TVWidgetAsyncOperation *v2;
  char v3;

  v2 = self;
  v3 = sub_100019B84();

  return v3 & 1;
}

- (void)start
{
  _TtC17TVWidgetExtension22TVWidgetAsyncOperation *v2;

  v2 = self;
  sub_100019D48();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->_logIdentifier[OBJC_IVAR____TtC17TVWidgetExtension22TVWidgetAsyncOperation__logIdentifier]);
}

@end
