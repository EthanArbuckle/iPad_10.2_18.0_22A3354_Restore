@implementation PKSubcredentialPairingAnalyticsReporter

+ (void)beginSubcredentialPairingSessionWithReferralSource:(unint64_t)a3 brandId:(id)a4 page:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a4)
  {
    v7 = sub_19DE87BF4();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  sub_19D5012A8(a3, v7, v9, a5);
  swift_bridgeObjectRelease();
}

+ (void)sendViewDidAppearWithPage:(int64_t)a3
{
  uint64_t inited;
  void **v5;
  void *v6;
  uint64_t v7;
  id v8;
  unint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE494B30);
  inited = swift_initStackObject();
  v5 = (void **)MEMORY[0x1E0D68AA0];
  *(_OWORD *)(inited + 16) = xmmword_19DEE0240;
  v6 = *v5;
  *(_QWORD *)(inited + 32) = *v5;
  *(_QWORD *)(inited + 40) = sub_19DE87BF4();
  *(_QWORD *)(inited + 48) = v7;
  v8 = v6;
  v9 = sub_19D6BAB58(inited);
  sub_19D500F5C(v9, a3);
  swift_bridgeObjectRelease();
}

+ (void)sendButtonPressWithButtonTag:(int64_t)a3 page:(int64_t)a4
{
  sub_19D501428(a3, a4);
}

+ (void)sendOutcome:(BOOL)a3 errorMessage:(id)a4 page:(int64_t)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a4)
  {
    v7 = sub_19DE87BF4();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  sub_19D5015C0(a3, v7, v9, a5);
  swift_bridgeObjectRelease();
}

+ (void)endSubcredentialPairingSession
{
  objc_msgSend((id)objc_opt_self(), sel_endSubjectReporting_, *MEMORY[0x1E0D698B8]);
}

- (PKSubcredentialPairingAnalyticsReporter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SubcredentialPairingAnalyticsReporter();
  return -[PKSubcredentialPairingAnalyticsReporter init](&v3, sel_init);
}

@end
