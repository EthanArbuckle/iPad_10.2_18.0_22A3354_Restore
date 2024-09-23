@implementation VideoTransportStream

- (void)dealloc
{
  void *v2;
  _TtC16ScreenSharingKit20VideoTransportStream *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit20VideoTransportStream_remoteVideoClient);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit20VideoTransportStream_remoteVideoClient) = 0;
  v3 = self;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574BB3E0);
  sub_245956490();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for VideoTransportStream();
  -[VideoTransportStream dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  sub_2458A4838(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit20VideoTransportStream_currentState));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit20VideoTransportStream_remoteVideoClient));

  v3 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit20VideoTransportStream_stateStream;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574BB400);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit20VideoTransportStream_stateContinuation;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2574BB3E0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit20VideoTransportStream____lazy_storage___screenCapture));

  v7 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit20VideoTransportStream_sessionID;
  v8 = sub_24595589C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

- (_TtC16ScreenSharingKit20VideoTransportStream)init
{
  _TtC16ScreenSharingKit20VideoTransportStream *result;

  result = (_TtC16ScreenSharingKit20VideoTransportStream *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)remoteVideoClientDidReceiveFirstFrame:(id)a3
{
  id v5;
  _TtC16ScreenSharingKit20VideoTransportStream *v6;

  v5 = a3;
  v6 = self;
  sub_24591D230(a3);

}

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v8;
  _TtC16ScreenSharingKit20VideoTransportStream *v9;
  id v10;

  v6 = a4;
  v8 = a3;
  v9 = self;
  v10 = a5;
  sub_24591E96C(v6, a5);

}

- (void)streamDidRTCPTimeOut:(id)a3
{
  id v5;
  _TtC16ScreenSharingKit20VideoTransportStream *v6;

  v5 = a3;
  v6 = self;
  sub_24591D590(a3);

}

- (void)stream:(id)a3 didPause:(BOOL)a4 error:(id)a5
{
  _BOOL4 v6;
  id v9;
  _TtC16ScreenSharingKit20VideoTransportStream *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  v10 = self;
  v11 = a5;
  sub_24591D880(a3, v6, a5);

}

- (void)streamDidStop:(id)a3
{
  sub_24591DD50(self, (uint64_t)a2, a3, "Video stream didStop");
}

- (void)streamDidServerDie:(id)a3
{
  id v4;
  _TtC16ScreenSharingKit20VideoTransportStream *v5;

  v4 = a3;
  v5 = self;
  sub_24591EC9C();

}

- (void)screenCapture:(id)a3 didStart:(BOOL)a4 withError:(id)a5
{
  id v8;
  _TtC16ScreenSharingKit20VideoTransportStream *v9;
  id v10;

  v8 = a3;
  v9 = self;
  v10 = a5;
  sub_24591EE6C(a4, a5, "ScreenCapture didStart=%{BOOL,public}d withError=%{public}s", 11);

}

- (void)screenCapture:(id)a3 didStop:(BOOL)a4 withError:(id)a5
{
  id v8;
  _TtC16ScreenSharingKit20VideoTransportStream *v9;
  id v10;

  v8 = a3;
  v9 = self;
  v10 = a5;
  sub_24591EE6C(a4, a5, "ScreenCapture didStop=%{BOOL,public}d withError=%{public}s", 12);

}

- (void)serverDidDisconnect:(id)a3
{
  sub_24591DD50(self, (uint64_t)a2, a3, "ScreenCapture serverDidDisconnect");
}

- (void)screenCapture:(id)a3 didUpdateAttributes:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC16ScreenSharingKit20VideoTransportStream *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_24591F1D0(v9, a5);

}

@end
