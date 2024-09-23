@implementation PFAnalyticsEvent

- (void).cxx_destruct
{

  swift_release();
}

- (PFAnalyticsEvent)initWithName:(id)a3 generator:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t (**v8)();
  id v9;
  objc_super v11;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFAnalyticsEvent_name) = (Class)a3;
  v8 = (uint64_t (**)())((char *)self + OBJC_IVAR___PFAnalyticsEvent_payloadGenerator);
  *v8 = sub_1A90C1158;
  v8[1] = (uint64_t (*)())v7;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AnalyticsEvent();
  v9 = a3;
  return -[PFAnalyticsEvent init](&v11, sel_init);
}

- (NSString)name
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___PFAnalyticsEvent_name));
}

- (id)payloadGenerator
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD aBlock[6];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___PFAnalyticsEvent_payloadGenerator);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  aBlock[4] = v3;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A90AC824;
  aBlock[3] = &block_descriptor_24_5;
  v5 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v5;
}

- (PFAnalyticsEvent)initWithName:(id)a3 payload:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  PFAnalyticsEvent *v10;
  _QWORD v12[6];

  sub_1A90AC898();
  v6 = sub_1A93F7EFC();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v12[4] = sub_1A938FC10;
  v12[5] = v7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 1107296256;
  v12[2] = sub_1A90AC824;
  v12[3] = &block_descriptor_14;
  v8 = _Block_copy(v12);
  v9 = a3;
  swift_release();
  v10 = -[PFAnalyticsEvent initWithName:generator:](self, sel_initWithName_generator_, v9, v8);

  _Block_release(v8);
  return v10;
}

+ (id)episodeDurationComparisonWithEpisodeAdamId:(int64_t)a3 duration:(double)a4
{
  return _s18PodcastsFoundation14AnalyticsEventC25episodeDurationComparison0E6AdamId8durationACs5Int64V_SdtFZ_0(a3, a4);
}

+ (id)episodeDurationComparisonWithMapiProvidedDuration:(double)a3 playerItemDuration:(double)a4
{
  return _s18PodcastsFoundation14AnalyticsEventC25episodeDurationComparison012mapiProvidedF0010playerItemF0ACSd_SdtFZ_0(a3, a4);
}

+ (PFAnalyticsEvent)globalRetentionPolicy
{
  objc_class *v2;
  char *v3;
  id (**v4)();
  __CFString *v5;
  objc_super v7;

  v2 = (objc_class *)type metadata accessor for AnalyticsEvent();
  v3 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v3[OBJC_IVAR___PFAnalyticsEvent_name] = CFSTR("com.apple.podcasts.downloads.settings.global.retention-policy");
  v4 = (id (**)())&v3[OBJC_IVAR___PFAnalyticsEvent_payloadGenerator];
  *v4 = sub_1A939146C;
  v4[1] = 0;
  v7.receiver = v3;
  v7.super_class = v2;
  v5 = CFSTR("com.apple.podcasts.downloads.settings.global.retention-policy");
  return (PFAnalyticsEvent *)objc_msgSendSuper2(&v7, sel_init);
}

- (void)setPayloadGenerator:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___PFAnalyticsEvent_payloadGenerator);
  swift_beginAccess();
  *v6 = sub_1A938FC18;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (NSString)description
{
  PFAnalyticsEvent *v2;
  void *v3;

  v2 = self;
  sub_1A938F928();

  v3 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PFAnalyticsEvent)init
{
  PFAnalyticsEvent *result;

  result = (PFAnalyticsEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

+ (id)drmKeyRecoveredWithGenerator:(id)a3
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  uint64_t (**v7)();
  __CFString *v8;
  objc_super v10;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  v5 = (objc_class *)type metadata accessor for AnalyticsEvent();
  v6 = (char *)objc_allocWithZone(v5);
  *(_QWORD *)&v6[OBJC_IVAR___PFAnalyticsEvent_name] = CFSTR("com.apple.podcasts.DRMKeysRecovered");
  v7 = (uint64_t (**)())&v6[OBJC_IVAR___PFAnalyticsEvent_payloadGenerator];
  *v7 = sub_1A90C1158;
  v7[1] = (uint64_t (*)())v4;
  v10.receiver = v6;
  v10.super_class = v5;
  v8 = CFSTR("com.apple.podcasts.DRMKeysRecovered");
  return objc_msgSendSuper2(&v10, sel_init);
}

+ (id)drmKeyRecoveredWithPayload:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  id v8;
  _QWORD v10[6];

  sub_1A90AC898();
  v3 = sub_1A93F7EFC();
  v4 = objc_allocWithZone((Class)type metadata accessor for AnalyticsEvent());
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v3;
  v10[4] = sub_1A9391F40;
  v10[5] = v5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = sub_1A90AC824;
  v10[3] = &block_descriptor_28;
  v6 = _Block_copy(v10);
  v7 = CFSTR("com.apple.podcasts.DRMKeysRecovered");
  swift_bridgeObjectRetain();
  swift_release();
  v8 = objc_msgSend(v4, sel_initWithName_generator_, v7, v6);

  _Block_release(v6);
  swift_bridgeObjectRelease();
  return v8;
}

+ (id)downloadedFileHasiPodLibraryURLWithDiscoveryPoint:(id)a3 path:(id)a4 source:(id)a5
{
  id v6;

  sub_1A93F8040();
  sub_1A93F8040();
  if (a5)
    sub_1A93F8040();
  v6 = _s18PodcastsFoundation14AnalyticsEventC31downloadedFileHasiPodLibraryURL14discoveryPoint4path6sourceACSS_S2SSgtFZ_0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

+ (id)darkDownloadsChangeWithWasDark:(BOOL)a3 isDark:(BOOL)a4 reason:(unint64_t)a5 previousExit:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v15;

  v9 = sub_1A93F738C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A93F7368();
  v13 = _s18PodcastsFoundation14AnalyticsEventC19darkDownloadsChange7wasDark02isI06reason12previousExitACSb_SbSo06PFDarkG6ReasonV0B04DateVtFZ_0(a3, a4, a5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v13;
}

+ (id)transcriptAlignmentFailedWithReason:(id)a3
{
  id v3;

  sub_1A93F8040();
  v3 = _s18PodcastsFoundation14AnalyticsEventC25transcriptAlignmentFailed6reasonACSS_tFZ_0();
  swift_bridgeObjectRelease();
  return v3;
}

@end
