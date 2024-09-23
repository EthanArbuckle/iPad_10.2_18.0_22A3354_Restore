@implementation SLAMSwift

- (id)transceive:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  Class isa;

  v6 = a3;
  swift_retain();
  v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;

  v10 = *(_QWORD *)&self->session[24];
  v11 = *(_QWORD *)&self->session[32];
  sub_100005EF8(self->session, v10);
  v12 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v11 + 16))(v7, v9, v10, v11);
  v14 = v13;
  sub_10004F83C(v7, v9, v12, v13);
  swift_release(self);
  sub_100005DE0(v7, v9);
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100005DE0(v12, v14);
  return isa;
}

- (void)log:(id)a3
{
  uint64_t v4;
  _TtC14softposreaderd12RemoteReader *v5;
  _TtC14softposreaderd12RemoteReader *v6;
  SEL v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  swift_retain();
  sub_10004F134(v4, (unint64_t)v6);
  swift_release(self);
  swift_bridgeObjectRelease(v6, v7, v8, v9, v10, v11, v12, v13);
}

@end
