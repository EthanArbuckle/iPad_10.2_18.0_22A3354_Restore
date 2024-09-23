@implementation UWBPrewarmSession

- (_TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession)init
{
  _TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession *result;

  result = (_TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession *)_swift_stdlib_reportUnimplementedInitializer("seserviced.UWBPrewarmSession", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->onInvalidation[OBJC_IVAR____TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession_onInvalidation]);
  swift_release(*(_QWORD *)&self->onInvalidation[OBJC_IVAR____TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession_onStart]);
  swift_release(*(_QWORD *)&self->onInvalidation[OBJC_IVAR____TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession_onStateUpdate]);
  swift_release(*(_QWORD *)&self->onInvalidation[OBJC_IVAR____TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession_onRangingLimitUpdate]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession_session));
}

- (void)systemConfigurator:(id)a3 didUpdateState:(id)a4
{
  id v6;
  id v7;
  _TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100199DB4(v7);

}

- (void)systemConfigurator:(id)a3 didUpdateResourceUsageLimitExceeded:(BOOL)a4 forSessionConfigurationType:(Class)a5
{
  uint64_t ObjCClassMetadata;
  id v9;
  _TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession *v10;

  ObjCClassMetadata = swift_getObjCClassMetadata(a5);
  v9 = a3;
  v10 = self;
  sub_100199F08(a4, ObjCClassMetadata);

}

- (void)sessionDidStartRunning:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  _TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  v5 = type metadata accessor for DispatchPredicate(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (uint64_t *)((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = qword_1003447B8;
  v11 = a3;
  v12 = self;
  if (v10 != -1)
    swift_once(&qword_1003447B8, sub_1001EEFA4);
  v13 = qword_100354EE8;
  *v9 = qword_100354EE8;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v6 + 104))(v9, enum case for DispatchPredicate.onQueue(_:), v5);
  v14 = (id)v13;
  LOBYTE(v13) = _dispatchPreconditionTest(_:)(v9);
  v15 = (*(uint64_t (**)(_QWORD *, uint64_t))(v6 + 8))(v9, v5);
  if ((v13 & 1) != 0)
  {
    (*(void (**)(uint64_t))((char *)&v12->super.isa
                                    + OBJC_IVAR____TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession_onStart))(v15);

  }
  else
  {
    __break(1u);
  }
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  id v13;
  id v14;
  _TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v7 = type metadata accessor for DispatchPredicate(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (uint64_t *)((char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = qword_1003447B8;
  v13 = a3;
  v14 = a4;
  v15 = self;
  if (v12 != -1)
    swift_once(&qword_1003447B8, sub_1001EEFA4);
  v16 = qword_100354EE8;
  *v11 = qword_100354EE8;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v8 + 104))(v11, enum case for DispatchPredicate.onQueue(_:), v7);
  v17 = (id)v16;
  LOBYTE(v16) = _dispatchPreconditionTest(_:)(v11);
  (*(void (**)(_QWORD *, uint64_t))(v8 + 8))(v11, v7);
  if ((v16 & 1) != 0)
  {
    (*(void (**)(id))((char *)&v15->super.isa
                               + OBJC_IVAR____TtC10seservicedP33_4D3BC54BA96E8438A66520691EE354E617UWBPrewarmSession_onInvalidation))(v14);

  }
  else
  {
    __break(1u);
  }
}

@end
