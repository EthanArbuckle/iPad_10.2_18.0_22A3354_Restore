@implementation APPCPromotedContent

- (BOOL)isMRAID
{
  APPCPromotedContent *v3;
  unint64_t v4;
  char v5;

  swift_beginAccess();
  v3 = self;
  v4 = swift_bridgeObjectRetain();
  v5 = sub_1B11E4924(v4);

  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (BOOL)isOutstreamVideoAd
{
  unint64_t *v3;
  unint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  APPCPromotedContent *v8;

  v3 = (unint64_t *)((char *)self + OBJC_IVAR___APPCPromotedContent_representations);
  swift_beginAccess();
  v4 = *v3;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___APPCPromotedContent_identifier);
  swift_beginAccess();
  v7 = *v5;
  v6 = v5[1];
  v8 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  LOBYTE(v7) = sub_1B1205880(v7, v6, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (NSDate)expirationDate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1B1289620();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___APPCPromotedContent_expirationDate;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_1B12895E4();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v8;
}

- (void)registerPromotedContentUsedWithAction:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD **v7;
  _QWORD *v8;
  APPCPromotedContent *v9;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1B1278540;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = (_QWORD **)((char *)self + OBJC_IVAR___APPCPromotedContent_onPromotedContentComplete);
  swift_beginAccess();
  v8 = *v7;
  v9 = self;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_1B120CA44(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  v12 = v8[2];
  v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    v8 = sub_1B120CA44((_QWORD *)(v11 > 1), v12 + 1, 1, v8);
    *v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = sub_1B12785D8;
  v13[5] = v6;
  swift_endAccess();

  swift_release();
}

- (NSDictionary)transparencyDetailsDictionary
{
  APPCPromotedContent *v2;
  void *v3;

  v2 = self;
  sub_1B11E9BD0();

  v3 = (void *)sub_1B1289800();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (APPCCarouselMetricsHelping)metricsHelper
{
  swift_beginAccess();
  return (APPCCarouselMetricsHelping *)(id)swift_unknownObjectRetain();
}

- (BOOL)placeholder
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___APPCPromotedContent_placeholder);
}

- (int64_t)adType
{
  APPCPromotedContent *v2;
  id v3;

  v2 = self;
  v3 = sub_1B1205BA4();

  return (int64_t)v3;
}

- (APPCMetricEventsTracking)metricEventsTracking
{
  return (APPCMetricEventsTracking *)sub_1B1208D8C();
}

- (NSUUID)contextIdentifier
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  APPCPromotedContent *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = sub_1B11FFBAC(&qword_1ED391670);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_1B11E1B94((uint64_t)v5);

  v7 = sub_1B1289674();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1B1289644();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSUUID *)v9;
}

- (APPCPromotableContentRepresentation)bestRepresentation
{
  return (APPCPromotableContentRepresentation *)sub_1B1208D8C();
}

- (NSString)identifier
{
  return (NSString *)sub_1B120925C();
}

- (int64_t)serverUnfilledReason
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___APPCPromotedContent_serverUnfilledReason);
  swift_beginAccess();
  return *v2;
}

- (NSArray)representations
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B11FFBAC(&qword_1ED3912B0);
  v2 = (void *)sub_1B1289938();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setBestRepresentation:(id)a3
{
  sub_1B11E36C4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCPromotedContent_bestRepresentation);
}

- (NSString)campaignText
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCPromotedContent_campaignText);
}

- (APPCDiagnosticMetricsHelping)diagnosticMetricHelper
{
  return (APPCDiagnosticMetricsHelping *)(id)swift_unknownObjectRetain();
}

- (void)setMetricsHelper:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContent_metricsHelper);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)setIdentifier:(id)a3
{
  sub_1B1271FC0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCPromotedContent_identifier);
}

- (NSString)journeyIdentifier
{
  return (NSString *)sub_1B120925C();
}

- (void)setJourneyIdentifier:(id)a3
{
  sub_1B1271FC0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCPromotedContent_journeyIdentifier);
}

- (APPCPromotableContext)context
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___APPCPromotedContent_context;
  swift_beginAccess();
  return (APPCPromotableContext *)(id)MEMORY[0x1B5E19218](v2);
}

- (void)setContext:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (NSDictionary)metaData
{
  _QWORD *v2;
  void *v3;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContent_metaData);
  swift_beginAccess();
  if (!*v2)
    return (NSDictionary *)0;
  swift_bridgeObjectRetain();
  sub_1B11FFBAC(&qword_1ED390B58);
  v3 = (void *)sub_1B1289800();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (void)setMetaData:(id)a3
{
  uint64_t v3;
  uint64_t *v5;

  v3 = (uint64_t)a3;
  if (a3)
  {
    sub_1B11FFBAC(&qword_1ED390B58);
    v3 = sub_1B128980C();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___APPCPromotedContent_metaData);
  swift_beginAccess();
  *v5 = v3;
  swift_bridgeObjectRelease();
}

- (NSURL)disclosureURL
{
  return (NSURL *)sub_1B12734F8((uint64_t)self, (uint64_t)a2, (uint64_t *)&unk_1ED391290, &OBJC_IVAR___APPCPromotedContent_disclosureURL, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CAFE38]);
}

- (void)setDisclosureURL:(id)a3
{
  sub_1B127367C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t *)&unk_1ED391290, (void (*)(uint64_t))MEMORY[0x1E0CAFF00], (uint64_t (*)(_QWORD))MEMORY[0x1E0CAFFF8], &OBJC_IVAR___APPCPromotedContent_disclosureURL);
}

- (NSString)disclosureRendererPayload
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCPromotedContent_disclosureRendererPayload);
}

- (void)setDisclosureRendererPayload:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCPromotedContent_disclosureRendererPayload);
}

- (int64_t)minimumTimeBetweenPresentation
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___APPCPromotedContent_minimumTimeBetweenPresentation);
  swift_beginAccess();
  return *v2;
}

- (void)setMinimumTimeBetweenPresentation:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___APPCPromotedContent_minimumTimeBetweenPresentation);
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)brandName
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCPromotedContent_brandName);
}

- (void)setBrandName:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCPromotedContent_brandName);
}

- (void)setCampaignText:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCPromotedContent_campaignText);
}

- (void)setRepresentations:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  sub_1B11FFBAC(&qword_1ED3912B0);
  v4 = sub_1B1289944();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___APPCPromotedContent_representations);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (APInstallAttribution)installAttribution
{
  return (APInstallAttribution *)sub_1B126AE9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCPromotedContent_installAttribution);
}

- (void)setInstallAttribution:(id)a3
{
  sub_1B126AF38((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___APPCPromotedContent_installAttribution);
}

- (NSError)error
{
  return (NSError *)sub_1B126AE9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCPromotedContent_error);
}

- (void)setError:(id)a3
{
  sub_1B126AF38((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___APPCPromotedContent_error);
}

- (void)setExpirationDate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  void (*v9)(char *, char *, uint64_t);
  APPCPromotedContent *v10;
  uint64_t v11;

  v4 = sub_1B1289620();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B12895FC();
  v8 = (char *)self + OBJC_IVAR___APPCPromotedContent_expirationDate;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();

}

- (void)setServerUnfilledReason:(int64_t)a3
{
  int64_t *v5;
  uint64_t v6;
  void *v7;
  APPCPromotedContent *v8;

  v5 = (int64_t *)((char *)self + OBJC_IVAR___APPCPromotedContent_serverUnfilledReason);
  swift_beginAccess();
  *v5 = a3;
  v6 = MEMORY[0x1B5E19218]((char *)self + OBJC_IVAR___APPCPromotedContent_unfilledReasonDelegate);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = self;
    objc_msgSend(v7, sel_setUnfilledReason_, a3);

    swift_unknownObjectRelease();
  }
}

- (APPCMediaMetricsHelping)mediaMetricHelper
{
  return (APPCMediaMetricsHelping *)sub_1B1208D8C();
}

- (void)setMediaMetricHelper:(id)a3
{
  sub_1B11E36C4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCPromotedContent_mediaMetricHelper);
}

- (BOOL)attachedToView
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_attachedToView;
  swift_beginAccess();
  return *v2;
}

- (void)setAttachedToView:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_attachedToView;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)vended
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_vended;
  swift_beginAccess();
  return *v2;
}

- (void)setVended:(BOOL)a3
{
  APPCPromotedContent *v4;

  v4 = self;
  sub_1B1272E0C(a3);

}

- (BOOL)discarded
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_discarded;
  swift_beginAccess();
  return *v2;
}

- (void)setDiscarded:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_discarded;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)consumed
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_consumed;
  swift_beginAccess();
  return *v2;
}

- (void)setConsumed:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_consumed;
  swift_beginAccess();
  *v4 = a3;
}

- (double)impressionThreshold
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___APPCPromotedContent_impressionThreshold);
  swift_beginAccess();
  return *v2;
}

- (void)setImpressionThreshold:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___APPCPromotedContent_impressionThreshold);
  swift_beginAccess();
  *v4 = a3;
}

- (NSDate)videoRequestStartDate
{
  return (NSDate *)sub_1B12734F8((uint64_t)self, (uint64_t)a2, (uint64_t *)&unk_1ED391840, &OBJC_IVAR___APPCPromotedContent_videoRequestStartDate, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB06B8]);
}

- (void)setVideoRequestStartDate:(id)a3
{
  sub_1B127367C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t *)&unk_1ED391840, (void (*)(uint64_t))MEMORY[0x1E0CB07E8], (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870], &OBJC_IVAR___APPCPromotedContent_videoRequestStartDate);
}

- (BOOL)discardedDueToPolicy
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_discardedDueToPolicy;
  swift_beginAccess();
  return *v2;
}

- (void)setDiscardedDueToPolicy:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_discardedDueToPolicy;
  swift_beginAccess();
  *v4 = a3;
}

- (void)setMetricEventsTracking:(id)a3
{
  sub_1B11E36C4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCPromotedContent_metricEventsTracking);
}

- (BOOL)isLocationAvailableForAd
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___APPCPromotedContent_isLocationAvailableForAd);
}

- (BOOL)isPAAvailableForAd
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___APPCPromotedContent_isPAAvailableForAd);
}

- (NSDate)receivedReferenceTime
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1B11FFBAC((uint64_t *)&unk_1ED391840);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B11F4CF4((uint64_t)self + OBJC_IVAR___APPCPromotedContent_receivedReferenceTime, (uint64_t)v5, (uint64_t *)&unk_1ED391840);
  v6 = sub_1B1289620();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v8 = (void *)sub_1B12895E4();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return (NSDate *)v8;
}

- (NSArray)adServerEnvironments
{
  void *v2;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContent_adServerEnvironments))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B1289938();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (int64_t)numOfArticlesSinceInterstitial
{
  APPCPromotedContent *v2;
  id v3;

  v2 = self;
  v3 = sub_1B1273D7C();

  return (int64_t)v3;
}

- (BOOL)available
{
  APPCPromotedContent *v2;
  char v3;

  v2 = self;
  v3 = sub_1B1273E18();

  return v3 & 1;
}

- (int64_t)feedMetadataContentProviderID
{
  APPCPromotedContent *v2;
  id v3;

  v2 = self;
  v3 = sub_1B1273F90();

  return (int64_t)v3;
}

- (NSString)debugDescription
{
  APPCPromotedContent *v2;
  void *v3;

  v2 = self;
  sub_1B1274318();

  v3 = (void *)sub_1B1289878();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  APPCPromotedContent *v2;

  v2 = self;
  PromotedContent.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B121CA90((uint64_t)self + OBJC_IVAR___APPCPromotedContent_context);
  swift_bridgeObjectRelease();
  sub_1B11DF5D8((uint64_t)self + OBJC_IVAR___APPCPromotedContent_disclosureURL, (uint64_t *)&unk_1ED391290);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR___APPCPromotedContent_expirationDate;
  v4 = sub_1B1289620();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  sub_1B11DF5D8((uint64_t)self + OBJC_IVAR___APPCPromotedContent_videoRequestStartDate, (uint64_t *)&unk_1ED391840);
  swift_unknownObjectRelease();
  sub_1B11DF5D8((uint64_t)self + OBJC_IVAR___APPCPromotedContent_receivedReferenceTime, (uint64_t *)&unk_1ED391840);
  swift_bridgeObjectRelease();
  sub_1B121CA90((uint64_t)self + OBJC_IVAR___APPCPromotedContent_unfilledReasonDelegate);
  swift_bridgeObjectRelease();
  sub_1B11DF5D8((uint64_t)self + OBJC_IVAR___APPCPromotedContent__contextIdentifier, &qword_1ED391670);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)replaceMetricsHelperWithNewMetricsHelper:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContent_metricsHelper);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (unint64_t)retrieveNetworkType
{
  APPCPromotedContent *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1B11F6AD0();

  return v3;
}

- (void)notifyListenersPCUsedWithPcID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  APPCPromotedContent *v7;

  v4 = sub_1B1289884();
  v6 = v5;
  v7 = self;
  sub_1B12766CC(v4, v6);

  swift_bridgeObjectRelease();
}

- (APPCPromotedContent)init
{
  APPCPromotedContent *result;

  result = (APPCPromotedContent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
