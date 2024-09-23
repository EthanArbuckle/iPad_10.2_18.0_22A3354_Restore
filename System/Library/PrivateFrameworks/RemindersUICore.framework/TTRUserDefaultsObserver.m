@implementation TTRUserDefaultsObserver

- (void)stopObserving
{
  uint64_t v2;
  _TtC15RemindersUICore23TTRUserDefaultsObserver *v4;

  v2 = OBJC_IVAR____TtC15RemindersUICore23TTRUserDefaultsObserver_removed;
  if ((*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15RemindersUICore23TTRUserDefaultsObserver_removed) & 1) == 0)
  {
    v4 = self;
    sub_1B47A67DC((uint64_t)v4);
    *((_BYTE *)&self->super.isa + v2) = 1;

  }
}

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC15RemindersUICore23TTRUserDefaultsObserver *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC15RemindersUICore23TTRUserDefaultsObserver_removed;
  if (*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC15RemindersUICore23TTRUserDefaultsObserver_removed) == 1)
  {
    v5 = self;
  }
  else
  {
    sub_1B47A67DC((uint64_t)self);
    *((_BYTE *)&self->super.isa + v4) = 1;
  }
  v6.receiver = self;
  v6.super_class = ObjectType;
  -[TTRUserDefaultsObserver dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

- (_TtC15RemindersUICore23TTRUserDefaultsObserver)init
{
  _TtC15RemindersUICore23TTRUserDefaultsObserver *result;

  result = (_TtC15RemindersUICore23TTRUserDefaultsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
