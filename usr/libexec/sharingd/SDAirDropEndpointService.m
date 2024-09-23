@implementation SDAirDropEndpointService

- (id)endpointsChangedHandler
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  if (!*(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler))
    return 0;
  v2 = *(_QWORD *)&self->deviceStatus[OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler];
  v6[4] = *(Class *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler);
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_100399238;
  v6[3] = &unk_100725BB8;
  v3 = _Block_copy(v6);
  v4 = v7;
  swift_retain(v2);
  swift_release(v4);
  return v3;
}

- (void)setEndpointsChangedHandler:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void (*v6)(uint64_t);
  void (**v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_100725BA0, 24, 7);
    v4[2] = v5;
    v6 = sub_1003AB230;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler);
  v9 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler);
  v8 = *(_QWORD *)&self->deviceStatus[OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler];
  *v7 = v6;
  v7[1] = (void (*)(uint64_t))v4;
  sub_1002845F4(v9, v8);
}

- (id)addClient:(id)a3
{
  id v4;
  _TtC16DaemoniOSLibrary24SDAirDropEndpointService *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1003995BC(v4);

  return v6;
}

- (void)removeClientWithToken:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC16DaemoniOSLibrary24SDAirDropEndpointService *v11;
  id v12;
  _TtC16DaemoniOSLibrary24SDAirDropEndpointService *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = sub_100008384(&qword_1007B68A0);
  __chkstk_darwin(v5);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = qword_1007B3D98;
  v10 = a3;
  v11 = self;
  v12 = v10;
  v13 = v11;
  if (v9 != -1)
    swift_once(&qword_1007B3D98, sub_1002ACAEC);
  v14 = static AirDropActor.shared;
  v15 = sub_100220D78((unint64_t *)&qword_1007BCF00, (uint64_t (*)(uint64_t))type metadata accessor for AirDropActor, (uint64_t)&protocol conformance descriptor for AirDropActor);
  v16 = (_QWORD *)swift_allocObject(&unk_100725A10, 48, 7);
  v16[2] = v14;
  v16[3] = v15;
  v16[4] = v12;
  v16[5] = v13;
  swift_retain(v14);
  v17 = sub_100252EC0((uint64_t)v7, (uint64_t)&unk_1007BD9B0, (uint64_t)v16);
  swift_release(v17);

}

- (void)nearFieldDidTap
{
  _TtC16DaemoniOSLibrary24SDAirDropEndpointService *v2;

  v2 = self;
  sub_1003A728C();

}

- (_TtC16DaemoniOSLibrary24SDAirDropEndpointService)init
{
  _TtC16DaemoniOSLibrary24SDAirDropEndpointService *result;

  result = (_TtC16DaemoniOSLibrary24SDAirDropEndpointService *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDAirDropEndpointService", 41, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_deviceStatus));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_nearbyAgent));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_bleController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_applicationServiceBrowser));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_bonjourBrowser));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_classroomBrowser));
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_sessionID;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  *(_QWORD *)&v5 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_allDiscoveredEndpoints)).n128_u64[0];
  *(_QWORD *)&v6 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_allDiscovered), v5).n128_u64[0];
  *(_QWORD *)&v7 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_browseClientIDs), v6).n128_u64[0];
  *(_QWORD *)&v8 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_displayableIDs), v7).n128_u64[0];
  *(_QWORD *)&v9 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_connectableByDisplayableID), v8).n128_u64[0];
  *(_QWORD *)&v10 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_transferringConnectables), v9).n128_u64[0];
  *(_QWORD *)&v11 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_receivingDisplayables), v10).n128_u64[0];
  *(_QWORD *)&v12 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_delegateByConnectableID), v11).n128_u64[0];
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_bonjourDiscoveryContinuations), v12);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_sessionLogger));
  sub_1002845F4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler), *(_QWORD *)&self->deviceStatus[OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler]);
  sub_100232F78((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_delegate);
}

@end
