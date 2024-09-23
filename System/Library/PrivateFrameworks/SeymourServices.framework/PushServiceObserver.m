@implementation PushServiceObserver

- (_TtC15SeymourServices19PushServiceObserver)init
{
  _TtC15SeymourServices19PushServiceObserver *result;

  result = (_TtC15SeymourServices19PushServiceObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices19PushServiceObserver_container);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  void *v4;
  id v6;
  _TtC15SeymourServices19PushServiceObserver *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  _TtC15SeymourServices19PushServiceObserver *v12;

  v4 = a4;
  if (a4)
  {
    v6 = a3;
    v7 = self;
    v8 = v4;
    v4 = (void *)sub_1CF14AD00();
    v10 = v9;

  }
  else
  {
    v11 = a3;
    v12 = self;
    v10 = 0xF000000000000000;
  }
  sub_1CEEA99A0(a3, (uint64_t)v4, v10);
  sub_1CEB7F888((uint64_t)v4, v10);

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  void *v8;
  id v10;
  id v11;
  id v12;
  _TtC15SeymourServices19PushServiceObserver *v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  _TtC15SeymourServices19PushServiceObserver *v26;

  v8 = a4;
  if (a4)
  {
    v10 = a3;
    v11 = a5;
    v12 = a6;
    v13 = self;
    v14 = v8;
    v8 = (void *)sub_1CF14AD00();
    v16 = v15;

    if (a5)
      goto LABEL_3;
LABEL_6:
    v17 = 0;
    v19 = 0;
    if (a6)
      goto LABEL_4;
LABEL_7:
    v20 = 0;
    v22 = 0;
    goto LABEL_8;
  }
  v23 = a3;
  v24 = a5;
  v25 = a6;
  v26 = self;
  v16 = 0xF000000000000000;
  if (!a5)
    goto LABEL_6;
LABEL_3:
  v17 = sub_1CF151B70();
  v19 = v18;

  if (!a6)
    goto LABEL_7;
LABEL_4:
  v20 = sub_1CF151B70();
  v22 = v21;

LABEL_8:
  sub_1CEEA9C6C((uint64_t)v8, v16, v17, v19, v20, v22);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1CEB7F888((uint64_t)v8, v16);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  _TtC15SeymourServices19PushServiceObserver *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1CEEAA048(a4);

}

@end
