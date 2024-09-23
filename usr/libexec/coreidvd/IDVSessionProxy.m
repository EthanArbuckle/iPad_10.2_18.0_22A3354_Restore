@implementation IDVSessionProxy

- (void)dealloc
{
  _TtC8coreidvd15IDVSessionProxy *v2;

  v2 = self;
  sub_100142E10();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  swift_bridgeObjectRelease(*(_QWORD *)&self->conversation[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy_conversation]);

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__connection);
  swift_bridgeObjectRelease(*(_QWORD *)&self->conversation[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__externalGSToken]);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__workflow));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__submittedPages));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__submittedAttributes));
  sub_100008030((uint64_t)self + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__inoKey, &qword_100636508);
  sub_100008030((uint64_t)self + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__spKey, &qword_100636508);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__inoECIESSession));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__storedClaim));
  swift_bridgeObjectRelease(*(_QWORD *)&self->conversation[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__applicationIdentifier]);

  swift_errorRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__errorInInit));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__jetsamTransaction));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__inoKeyCreationDispatchSignal));

  sub_1001825D8(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__collectedAccountAssessmentDeviceData), *(_QWORD *)&self->conversation[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__collectedAccountAssessmentDeviceData], *(_QWORD *)&self->conversation[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__collectedAccountAssessmentDeviceData + 8], *(_QWORD *)&self->topekaWebService[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__collectedAccountAssessmentDeviceData], *(_QWORD *)&self->assessmentWebService[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__collectedAccountAssessmentDeviceData], *(_QWORD *)&self->spWebService[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__collectedAccountAssessmentDeviceData], *(_QWORD *)&self->_connection[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__collectedAccountAssessmentDeviceData], *(_QWORD *)&self->_context[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__collectedAccountAssessmentDeviceData]);
  v3 = (char *)self + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__authRetrier;
  v4 = type metadata accessor for DIPRetrier(0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__nonceRetrier, v4);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__profileManager));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__odnator));
  sub_10018343C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__clientGUIDFactory), *(_QWORD *)&self->conversation[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__clientGUIDFactory], *(_QWORD *)&self->conversation[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__clientGUIDFactory + 8], *(_QWORD *)&self->topekaWebService[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__clientGUIDFactory], *(_QWORD *)&self->assessmentWebService[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__clientGUIDFactory], *(_QWORD *)&self->spWebService[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__clientGUIDFactory], *(_QWORD *)&self->_connection[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__clientGUIDFactory], *(_QWORD *)&self->_context[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__clientGUIDFactory], *(_QWORD *)&self->_externalGSToken[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__clientGUIDFactory], *(_QWORD *)&self->_externalGSToken[OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__clientGUIDFactory + 8]);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__pregeneratedAssessments));
  sub_100008030((uint64_t)self + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__augmentedProfile, &qword_100636668);
  sub_100008030((uint64_t)self + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__verificationResultDate, &qword_100633990);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8coreidvd15IDVSessionProxy__keystoreDict));
}

- (void)configure:(id)a3 completion:(id)a4
{
  void *v6;
  _TtC8coreidvd15IDVSessionProxy *v7;
  id v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v8 = a3;
  v7 = self;
  sub_100171344(v8, (uint64_t)v7, v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)performVerificationWithAttributes:(id)a3 completion:(id)a4
{
  void *v6;
  _TtC8coreidvd15IDVSessionProxy *v7;
  id v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v8 = a3;
  v7 = self;
  sub_10017AC6C(a3, v7, v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)shareVerificationResultWithOptions:(id)a3 completion:(id)a4
{
  sub_100157BCC(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id, void *))sub_10017DEB8);
}

- (void)getVerificationResultWithOptions:(id)a3 completion:(id)a4
{
  sub_100157BCC(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id, void *))sub_10017F9E8);
}

- (void)concludeVerification:(id)a3
{
  uint64_t v4;
  int64_t v5;
  int64_t v6;
  _TtC8coreidvd15IDVSessionProxy *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_100157C70(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)confirmVerificationCompletedWithFeedback:(id)a3
{
  id v4;
  _TtC8coreidvd15IDVSessionProxy *v5;

  v4 = a3;
  v5 = self;
  sub_100158240(v4);

}

- (_TtC8coreidvd15IDVSessionProxy)init
{
  _TtC8coreidvd15IDVSessionProxy *result;

  result = (_TtC8coreidvd15IDVSessionProxy *)_swift_stdlib_reportUnimplementedInitializer("coreidvd.IDVSessionProxy", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
