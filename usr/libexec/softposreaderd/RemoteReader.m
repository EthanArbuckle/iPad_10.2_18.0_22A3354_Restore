@implementation RemoteReader

- (void)validateWithReadParameters:(id)a3 reply:(id)a4
{
  void (**v6)(void *, _QWORD);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(id, uint64_t, uint64_t);
  _TtC14softposreaderd12RemoteReader *v10;
  id v11;

  v6 = (void (**)(void *, _QWORD))_Block_copy(a4);
  v7 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 16];
  v8 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 24];
  sub_100005EF8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance), v7);
  v9 = *(void (**)(id, uint64_t, uint64_t))(v8 + 8);
  v11 = a3;
  v10 = self;
  v9(v11, v7, v8);
  v6[2](v6, 0);
  _Block_release(v6);

}

- (void)readCardWithParameter:(id)a3 delegate:(id)a4 reply:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(id, id, void (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t);
  id v13;
  _TtC14softposreaderd12RemoteReader *v14;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1001965A0, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 16];
  v11 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 24];
  sub_100005EF8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance), v10);
  v12 = *(void (**)(id, id, void (*)(uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(v11 + 16);
  v13 = a3;
  swift_unknownObjectRetain(a4);
  v14 = self;
  v12(a3, a4, sub_100007F4C, v9, v10, v11);

  swift_unknownObjectRelease(a4);
  swift_release(v9);
}

- (void)cancelReadWithReply:(id)a3
{
  void (**v4)(void *, _QWORD);
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  _TtC14softposreaderd12RemoteReader *v8;

  v4 = (void (**)(void *, _QWORD))_Block_copy(a3);
  v5 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 16];
  v6 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 24];
  sub_100005EF8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance), v5);
  v7 = *(void (**)(uint64_t, uint64_t))(v6 + 24);
  v8 = self;
  v7(v5, v6);
  v4[2](v4, 0);
  _Block_release(v4);

}

- (void)generateSecureReaderBlobWithTrxBlob:(id)a3 pinBlob:(id)a4 reply:(id)a5
{
  void (**v8)(void *, NSString, _QWORD);
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString v21;
  _TtC14softposreaderd12RemoteReader *v22;

  v8 = (void (**)(void *, NSString, _QWORD))_Block_copy(a5);
  v9 = a3;
  v22 = self;
  v10 = a4;
  v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;

  if (v10)
  {
    v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v10);
    v16 = v15;

  }
  else
  {
    v14 = 0;
    v16 = 0xF000000000000000;
  }
  v17 = *(_QWORD *)&v22->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 16];
  v18 = *(_QWORD *)&v22->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 24];
  sub_100005EF8((Class *)((char *)&v22->super.isa + OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance), v17);
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(v18 + 32))(v11, v13, v14, v16, v17, v18);
  v20 = v19;
  v21 = String._bridgeToObjectiveC()();
  v8[2](v8, v21, 0);
  swift_bridgeObjectRelease(v20);

  _Block_release(v8);
  sub_10000A9B0(v14, v16);
  sub_100005DE0(v11, v13);

}

- (void)getStoreAndForwardResultsBlobWithTrxHashes:(id)a3 sessionId:(id)a4 activationId:(id)a5 mid:(id)a6 partnerId:(id)a7 virtualTerminalId:(id)a8 reply:(id)aBlock
{
  unint64_t v16;
  _TtC14softposreaderd12RemoteReader *v17;
  uint64_t v18;
  _TtC14softposreaderd12RemoteReader *v19;
  _TtC14softposreaderd12RemoteReader *v20;
  _TtC14softposreaderd12RemoteReader *v21;
  uint64_t v22;
  _TtC14softposreaderd12RemoteReader *v23;
  _TtC14softposreaderd12RemoteReader *v24;
  _TtC14softposreaderd12RemoteReader *v25;
  _TtC14softposreaderd12RemoteReader *v26;
  uint64_t v27;
  void (*v28)(_TtC14softposreaderd12RemoteReader *, uint64_t, _TtC14softposreaderd12RemoteReader *, uint64_t, _TtC14softposreaderd12RemoteReader *, uint64_t, _TtC14softposreaderd12RemoteReader *, uint64_t);
  _TtC14softposreaderd12RemoteReader *v29;
  _TtC14softposreaderd12RemoteReader *v30;
  NSString v31;
  SEL v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  SEL v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  SEL v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  SEL v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  SEL v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  SEL v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  SEL v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  _TtC14softposreaderd12RemoteReader *v87;
  _TtC14softposreaderd12RemoteReader *v88;
  uint64_t v89;
  uint64_t v90;
  _TtC14softposreaderd12RemoteReader *v91;
  _TtC14softposreaderd12RemoteReader *v92;
  void (**v93)(void *, NSString, _QWORD);

  v93 = (void (**)(void *, NSString, _QWORD))_Block_copy(aBlock);
  v16 = sub_10000A974();
  v91 = (_TtC14softposreaderd12RemoteReader *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v16);
  v90 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v87 = v17;
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v88 = v19;
  v89 = v18;
  v86 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v21 = v20;
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
  v24 = v23;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a8);
  v26 = v25;
  v27 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 24];
  sub_100005EF8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance), *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 16]);
  v28 = *(void (**)(_TtC14softposreaderd12RemoteReader *, uint64_t, _TtC14softposreaderd12RemoteReader *, uint64_t, _TtC14softposreaderd12RemoteReader *, uint64_t, _TtC14softposreaderd12RemoteReader *, uint64_t))(v27 + 40);
  v92 = self;
  v28(v91, v90, v87, v89, v88, v86, v21, v22);
  v30 = v29;
  v31 = String._bridgeToObjectiveC()();
  v93[2](v93, v31, 0);
  swift_bridgeObjectRelease(v30, v32, v33, v34, v35, v36, v37, v38, v24);

  _Block_release(v93);
  swift_bridgeObjectRelease(v26, v39, v40, v41, v42, v43, v44, v45, v81);

  swift_bridgeObjectRelease(v91, v46, v47, v48, v49, v50, v51, v52, v82);
  swift_bridgeObjectRelease(v87, v53, v54, v55, v56, v57, v58, v59, v83);
  swift_bridgeObjectRelease(v88, v60, v61, v62, v63, v64, v65, v66, v84);
  swift_bridgeObjectRelease(v21, v67, v68, v69, v70, v71, v72, v73, v85);
  swift_bridgeObjectRelease(v24, v74, v75, v76, v77, v78, v79, v80, aBlock);
}

- (void)validateStoreAndForwardResultsToken:(id)a3 sessionId:(id)a4 activationId:(id)a5 trxCount:(int64_t)a6 reply:(id)a7
{
  _TtC14softposreaderd12RemoteReader *v11;
  _TtC14softposreaderd12RemoteReader *v12;
  uint64_t v13;
  _TtC14softposreaderd12RemoteReader *v14;
  _TtC14softposreaderd12RemoteReader *v15;
  uint64_t v16;
  _TtC14softposreaderd12RemoteReader *v17;
  _TtC14softposreaderd12RemoteReader *v18;
  _QWORD *v19;
  uint64_t v20;
  void (*v21)(uint64_t, _TtC14softposreaderd12RemoteReader *, uint64_t, _TtC14softposreaderd12RemoteReader *, uint64_t, _TtC14softposreaderd12RemoteReader *, int64_t, uint64_t);
  _TtC14softposreaderd12RemoteReader *v22;
  SEL v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  SEL v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  SEL v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  void (**v47)(void *, _QWORD);
  void *v48;

  v47 = (void (**)(void *, _QWORD))_Block_copy(a7);
  v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v18 = v17;
  v20 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 16];
  v19 = *(_QWORD **)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 24];
  sub_100005EF8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance), v20);
  v21 = (void (*)(uint64_t, _TtC14softposreaderd12RemoteReader *, uint64_t, _TtC14softposreaderd12RemoteReader *, uint64_t, _TtC14softposreaderd12RemoteReader *, int64_t, uint64_t))v19[6];
  v22 = self;
  v21(v45, v12, v13, v15, v16, v18, a6, v20);
  v47[2](v47, 0);
  _Block_release(v47);
  swift_bridgeObjectRelease(v18, v23, v24, v25, v26, v27, v28, v29, v19);

  swift_bridgeObjectRelease(v12, v30, v31, v32, v33, v34, v35, v36, v44);
  swift_bridgeObjectRelease(v15, v37, v38, v39, v40, v41, v42, v43, v48);
}

- (void)cancelReadWithCallback:(id)a3 reply:(id)a4
{
  void (**v6)(void *, _QWORD);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(id, uint64_t, uint64_t);
  _TtC14softposreaderd12RemoteReader *v10;

  v6 = (void (**)(void *, _QWORD))_Block_copy(a4);
  v7 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 16];
  v8 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 24];
  sub_100005EF8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance), v7);
  v9 = *(void (**)(id, uint64_t, uint64_t))(v8 + 64);
  swift_unknownObjectRetain(a3);
  v10 = self;
  v9(a3, v7, v8);
  v6[2](v6, 0);
  _Block_release(v6);

  swift_unknownObjectRelease(a3);
}

- (void)getCardReaderBlobWithTxnBlob:(id)a3 reply:(id)a4
{
  void (**v6)(void *, NSString);
  uint64_t v7;
  _TtC14softposreaderd12RemoteReader *v8;
  _TtC14softposreaderd12RemoteReader *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, _TtC14softposreaderd12RemoteReader *, uint64_t, uint64_t);
  _TtC14softposreaderd12RemoteReader *v13;
  _TtC14softposreaderd12RemoteReader *v14;
  _TtC14softposreaderd12RemoteReader *v15;
  NSString v16;
  SEL v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  SEL v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;

  v6 = (void (**)(void *, NSString))_Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 16];
  v11 = *(_QWORD *)&self->instance[OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance + 24];
  sub_100005EF8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance), v10);
  v12 = *(void (**)(uint64_t, _TtC14softposreaderd12RemoteReader *, uint64_t, uint64_t))(v11 + 56);
  v13 = self;
  v12(v7, v9, v10, v11);
  v15 = v14;
  v16 = String._bridgeToObjectiveC()();
  v6[2](v6, v16);
  swift_bridgeObjectRelease(v15, v17, v18, v19, v20, v21, v22, v23);

  _Block_release(v6);
  swift_bridgeObjectRelease(v9, v24, v25, v26, v27, v28, v29, v30);
}

- (_TtC14softposreaderd12RemoteReader)init
{
  _TtC14softposreaderd12RemoteReader *result;

  result = (_TtC14softposreaderd12RemoteReader *)_swift_stdlib_reportUnimplementedInitializer("softposreaderd.RemoteReader", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100005D3C((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14softposreaderd12RemoteReader_instance));
}

@end
