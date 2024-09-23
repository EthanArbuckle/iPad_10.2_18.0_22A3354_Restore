@implementation XPCServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC13SeymourClient9XPCServer *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1CDFBC17C(v7);

  return v9 & 1;
}

- (void)receiveRequest:(int64_t)a3 data:(id)a4 completion:(id)a5
{
  void *v7;
  _TtC13SeymourClient9XPCServer *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v7 = _Block_copy(a5);
  v8 = self;
  if (a4)
  {
    v9 = a4;
    a4 = (id)sub_1CE0B3D64();
    v11 = v10;

  }
  else
  {
    v11 = 0xF000000000000000;
  }
  v12 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SeymourClient9XPCServer_dispatchService);
  _Block_copy(v7);
  sub_1CDFC1CB8(a3, (uint64_t)a4, v11, v12, (void (**)(_QWORD, _QWORD, _QWORD))v7);
  _Block_release(v7);
  _Block_release(v7);
  sub_1CDFC094C((uint64_t)a4, v11);

}

- (_TtC13SeymourClient9XPCServer)init
{
  _TtC13SeymourClient9XPCServer *result;

  result = (_TtC13SeymourClient9XPCServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)receiveEvent:(int64_t)a3 data:(id)a4
{
  _TtC13SeymourClient9XPCServer *v6;
  id v7;
  NSObject *v8;
  unint64_t v9;
  unint64_t v10;
  _TtC13SeymourClient9XPCServer *v11;

  if (a4)
  {
    v6 = self;
    v7 = a4;
    v8 = sub_1CE0B3D64();
    v10 = v9;

  }
  else
  {
    v11 = self;
    v8 = 0;
    v10 = 0xF000000000000000;
  }
  sub_1CDFAEDFC(a3, v8, v10);
  sub_1CDFC094C((uint64_t)v8, v10);

}

@end
