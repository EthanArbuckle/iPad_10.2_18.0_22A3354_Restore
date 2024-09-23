@implementation Choice

- (RUIElement)parent
{
  uint64_t (*v2)(void);
  _TtC8RemoteUI6Choice *v3;
  void *v4;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.isa) + 0x178);
  v3 = self;
  v4 = (void *)v2();

  return (RUIElement *)v4;
}

- (void)startActivityIndicator
{
  _TtC8RemoteUI6Choice *v2;

  v2 = self;
  sub_209F148B4();

}

- (void)stopActivityIndicator
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t (*v5)(void);
  _TtC8RemoteUI6Choice *v6;
  void (*v7)(void);

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8RemoteUI6Choice_activityIndicatorCount);
  v3 = __OFSUB__(v2, 1);
  v4 = v2 - 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8RemoteUI6Choice_activityIndicatorCount) = (Class)(v4 & ~(v4 >> 63));
    if (v4 <= 0)
    {
      v5 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.isa) + 0x118);
      v6 = self;
      v7 = (void (*)(void))v5();
      v7();

      swift_release();
    }
  }
}

- (void)pageDidChange
{
  _TtC8RemoteUI6Choice *v2;

  v2 = self;
  sub_209F149FC();

}

- (void)tappedWithSender:(id)a3
{
  _TtC8RemoteUI6Choice *v4;
  _TtC8RemoteUI6Choice *v5;
  void (*v6)(_TtC8RemoteUI6Choice *);
  uint64_t v7;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_209F67654();
    v5 = (_TtC8RemoteUI6Choice *)swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = (void (*)(_TtC8RemoteUI6Choice *))(*(uint64_t (**)(_TtC8RemoteUI6Choice *))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.isa) + 0xE8))(v5);
  if (v6)
  {
    v7 = (uint64_t)v6;
    v6(self);
    sub_209F0F414(v7);
  }

  sub_209EE017C((uint64_t)v8, &qword_2545BAF78);
}

- (id)staticValues
{
  void *v2;

  if (sub_209F15B40())
  {
    sub_209F17220();
    v2 = (void *)sub_209F673FC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (_TtC8RemoteUI6Choice)initWithAttributes:(id)a3 parent:(id)a4
{
  id v4;
  _TtC8RemoteUI6Choice *result;

  v4 = a4;
  result = (_TtC8RemoteUI6Choice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC8RemoteUI6Choice)init
{
  _TtC8RemoteUI6Choice *result;

  result = (_TtC8RemoteUI6Choice *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_209F0F414(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8RemoteUI6Choice_action));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_release();
}

@end
