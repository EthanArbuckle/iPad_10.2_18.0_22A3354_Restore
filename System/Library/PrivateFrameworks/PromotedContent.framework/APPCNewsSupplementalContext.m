@implementation APPCNewsSupplementalContext

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___APPCNewsSupplementalContext_currentArticleSourceContentProviderId));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___APPCNewsSupplementalContext_nextArticleSourceContentProviderId));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveContentProviderId));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowContentProviderId));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___APPCNewsSupplementalContext_numOfArticlesSeenSinceLastInterstitial));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)copyWithZone:(void *)a3
{
  APPCNewsSupplementalContext *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_1B11FCCD4(v6);

  sub_1B11FCC70(v6, v6[3]);
  v4 = (void *)sub_1B1289F38();
  sub_1B11E2C70((uint64_t)v6);
  return v4;
}

- (APPCNewsSupplementalContext)init
{
  return (APPCNewsSupplementalContext *)NewsSupplementalContext.init()();
}

- (NSString)advertisementType
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_advertisementType);
}

- (void)setAdvertisementType:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_advertisementType);
}

- (NSDictionary)anfComponentMetadata
{
  APPCNewsSupplementalContext *v2;
  unint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_1B11FE8D0();

  if (v3)
  {
    v4 = (void *)sub_1B1289800();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSDictionary *)v4;
}

- (void)setAnfComponentMetadata:(id)a3
{
  uint64_t v4;
  APPCNewsSupplementalContext *v5;

  if (a3)
    v4 = sub_1B128980C();
  else
    v4 = 0;
  v5 = self;
  sub_1B11FF234(v4);

}

- (int64_t)requestedAdType
{
  APPCNewsSupplementalContext *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1B1268E5C();

  return v3;
}

- (void)setRequestedAdType:(int64_t)a3
{
  APPCNewsSupplementalContext *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  v4 = self;
  if (NewsRequestedAdType.rawValue.getter(a3) == 1162760014 && v5 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = sub_1B1289F44();
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0)
    {
      v7 = NewsRequestedAdType.rawValue.getter(a3);
      goto LABEL_7;
    }
  }
  v7 = 0;
  v8 = 0;
LABEL_7:
  v9 = (uint64_t *)((char *)v4 + OBJC_IVAR___APPCNewsSupplementalContext_requestedAdTypeInternal);
  *v9 = v7;
  v9[1] = v8;

  swift_bridgeObjectRelease();
}

- (NSString)creativeType
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_creativeType);
}

- (void)setCreativeType:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_creativeType);
}

- (NSString)currentArticleArticleId
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleArticleId);
}

- (void)setCurrentArticleArticleId:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleArticleId);
}

- (NSString)nextArticleArticleId
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleArticleId);
}

- (void)setNextArticleArticleId:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleArticleId);
}

- (NSNumber)currentArticleIsSponsored
{
  return (NSNumber *)sub_1B126AE9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleIsSponsored);
}

- (void)setCurrentArticleIsSponsored:(id)a3
{
  sub_1B126AF38((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleIsSponsored);
}

- (NSNumber)nextArticleIsSponsored
{
  return (NSNumber *)sub_1B126AE9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleIsSponsored);
}

- (void)setNextArticleIsSponsored:(id)a3
{
  sub_1B126AF38((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleIsSponsored);
}

- (NSDictionary)currentArticlePublicationMetadata
{
  return (NSDictionary *)sub_1B1269660((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticlePublicationMetadata);
}

- (void)setCurrentArticlePublicationMetadata:(id)a3
{
  sub_1B1269704((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticlePublicationMetadata);
}

- (NSDictionary)nextArticlePublicationMetadata
{
  return (NSDictionary *)sub_1B1269660((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticlePublicationMetadata);
}

- (void)setNextArticlePublicationMetadata:(id)a3
{
  sub_1B1269704((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticlePublicationMetadata);
}

- (NSString)currentArticleRating
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleRating);
}

- (void)setCurrentArticleRating:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleRating);
}

- (NSString)nextArticleRating
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleRating);
}

- (void)setNextArticleRating:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleRating);
}

- (NSString)currentArticleSourceChannel
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleSourceChannel);
}

- (void)setCurrentArticleSourceChannel:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleSourceChannel);
}

- (NSString)nextArticleSourceChannel
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleSourceChannel);
}

- (void)setNextArticleSourceChannel:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleSourceChannel);
}

- (NSString)currentArticleSourceChannelRating
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleSourceChannelRating);
}

- (void)setCurrentArticleSourceChannelRating:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleSourceChannelRating);
}

- (NSString)nextArticleSourceChannelRating
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleSourceChannelRating);
}

- (void)setNextArticleSourceChannelRating:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleSourceChannelRating);
}

- (NSNumber)currentArticleSourceContentProviderId
{
  return (NSNumber *)sub_1B126AE9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleSourceContentProviderId);
}

- (void)setCurrentArticleSourceContentProviderId:(id)a3
{
  sub_1B126AF38((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleSourceContentProviderId);
}

- (NSNumber)nextArticleSourceContentProviderId
{
  return (NSNumber *)sub_1B126AE9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleSourceContentProviderId);
}

- (void)setNextArticleSourceContentProviderId:(id)a3
{
  sub_1B126AF38((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleSourceContentProviderId);
}

- (NSArray)currentArticleSourceSections
{
  return (NSArray *)sub_1B126B508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleSourceSections);
}

- (void)setCurrentArticleSourceSections:(id)a3
{
  sub_1B126B590((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_currentArticleSourceSections);
}

- (NSArray)nextArticleSourceSections
{
  return (NSArray *)sub_1B126B508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleSourceSections);
}

- (void)setNextArticleSourceSections:(id)a3
{
  sub_1B126B590((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_nextArticleSourceSections);
}

- (NSArray)feedMetadataCategories
{
  return (NSArray *)sub_1B126B508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataCategories);
}

- (void)setFeedMetadataCategories:(id)a3
{
  sub_1B126B590((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataCategories);
}

- (NSString)feedMetadataChannelId
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataChannelId);
}

- (void)setFeedMetadataChannelId:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataChannelId);
}

- (NSString)feedMetadataTagId
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataTagId);
}

- (void)setFeedMetadataTagId:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataTagId);
}

- (NSNumber)feedMetadataContentProviderID
{
  return (NSNumber *)sub_1B126AE9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataContentProviderID);
}

- (void)setFeedMetadataContentProviderID:(id)a3
{
  sub_1B126AF38((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataContentProviderID);
}

- (NSArray)feedMetadataKeywords
{
  return (NSArray *)sub_1B126B508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataKeywords);
}

- (void)setFeedMetadataKeywords:(id)a3
{
  sub_1B126B590((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataKeywords);
}

- (NSArray)feedMetadataLanguages
{
  return (NSArray *)sub_1B126B508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataLanguages);
}

- (void)setFeedMetadataLanguages:(id)a3
{
  sub_1B126B590((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataLanguages);
}

- (NSString)feedMetadataRating
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataRating);
}

- (void)setFeedMetadataRating:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataRating);
}

- (NSString)feedMetadataSectionId
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataSectionId);
}

- (void)setFeedMetadataSectionId:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_feedMetadataSectionId);
}

- (NSArray)groupContextCategories
{
  return (NSArray *)sub_1B126B508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextCategories);
}

- (void)setGroupContextCategories:(id)a3
{
  sub_1B126B590((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextCategories);
}

- (NSArray)groupContextAboveCategories
{
  return (NSArray *)sub_1B126B508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveCategories);
}

- (void)setGroupContextAboveCategories:(id)a3
{
  sub_1B126B590((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveCategories);
}

- (NSArray)groupContextBelowCategories
{
  return (NSArray *)sub_1B126B508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowCategories);
}

- (void)setGroupContextBelowCategories:(id)a3
{
  sub_1B126B590((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowCategories);
}

- (NSString)groupContextId
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextId);
}

- (void)setGroupContextId:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextId);
}

- (NSString)groupContextAboveId
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveId);
}

- (void)setGroupContextAboveId:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveId);
}

- (NSString)groupContextBelowId
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowId);
}

- (void)setGroupContextBelowId:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowId);
}

- (NSArray)groupContextKeywords
{
  return (NSArray *)sub_1B126B508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextKeywords);
}

- (void)setGroupContextKeywords:(id)a3
{
  sub_1B126B590((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextKeywords);
}

- (NSArray)groupContextAboveKeywords
{
  return (NSArray *)sub_1B126B508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveKeywords);
}

- (void)setGroupContextAboveKeywords:(id)a3
{
  sub_1B126B590((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveKeywords);
}

- (NSArray)groupContextBelowKeywords
{
  return (NSArray *)sub_1B126B508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowKeywords);
}

- (void)setGroupContextBelowKeywords:(id)a3
{
  sub_1B126B590((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowKeywords);
}

- (NSArray)groupContextLanguages
{
  return (NSArray *)sub_1B126B508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextLanguages);
}

- (void)setGroupContextLanguages:(id)a3
{
  sub_1B126B590((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextLanguages);
}

- (NSArray)groupContextAboveLanguages
{
  return (NSArray *)sub_1B126B508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveLanguages);
}

- (void)setGroupContextAboveLanguages:(id)a3
{
  sub_1B126B590((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveLanguages);
}

- (NSArray)groupContextBelowLanguages
{
  return (NSArray *)sub_1B126B508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowLanguages);
}

- (void)setGroupContextBelowLanguages:(id)a3
{
  sub_1B126B590((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowLanguages);
}

- (NSString)groupContextAboveChannelId
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveChannelId);
}

- (void)setGroupContextAboveChannelId:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveChannelId);
}

- (NSString)groupContextAboveTagId
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveTagId);
}

- (void)setGroupContextAboveTagId:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveTagId);
}

- (NSString)groupContextBelowChannelId
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowChannelId);
}

- (void)setGroupContextBelowChannelId:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowChannelId);
}

- (NSString)groupContextBelowTagId
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowTagId);
}

- (void)setGroupContextBelowTagId:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowTagId);
}

- (NSNumber)groupContextContentProviderId
{
  return (NSNumber *)sub_1B126AE9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextContentProviderId);
}

- (void)setGroupContextContentProviderId:(id)a3
{
  sub_1B126AF38((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextContentProviderId);
}

- (NSNumber)groupContextAboveContentProviderId
{
  return (NSNumber *)sub_1B126AE9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveContentProviderId);
}

- (void)setGroupContextAboveContentProviderId:(id)a3
{
  sub_1B126AF38((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveContentProviderId);
}

- (NSNumber)groupContextBelowContentProviderId
{
  return (NSNumber *)sub_1B126AE9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowContentProviderId);
}

- (void)setGroupContextBelowContentProviderId:(id)a3
{
  sub_1B126AF38((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowContentProviderId);
}

- (NSString)groupContextType
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextType);
}

- (void)setGroupContextType:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextType);
}

- (NSString)groupContextAboveType
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveType);
}

- (void)setGroupContextAboveType:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextAboveType);
}

- (NSString)groupContextBelowType
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowType);
}

- (void)setGroupContextBelowType:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_groupContextBelowType);
}

- (NSString)contentEnvironment
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_contentEnvironment);
}

- (void)setContentEnvironment:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_contentEnvironment);
}

- (NSNumber)isDraft
{
  return (NSNumber *)sub_1B126AE9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_isDraft);
}

- (void)setIsDraft:(id)a3
{
  sub_1B126AF38((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___APPCNewsSupplementalContext_isDraft);
}

- (NSNumber)onboardStatus
{
  return (NSNumber *)0;
}

- (NSString)placement
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_placement);
}

- (void)setPlacement:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_placement);
}

- (NSString)referralLocation
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_referralLocation);
}

- (void)setReferralLocation:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_referralLocation);
}

- (NSNumber)referralPublisherInventory
{
  return (NSNumber *)sub_1B126AE9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_referralPublisherInventory);
}

- (void)setReferralPublisherInventory:(id)a3
{
  sub_1B126AF38((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___APPCNewsSupplementalContext_referralPublisherInventory);
}

- (NSNumber)numOfArticlesSeenSinceLastInterstitial
{
  return (NSNumber *)sub_1B126AE9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_numOfArticlesSeenSinceLastInterstitial);
}

- (void)setNumOfArticlesSeenSinceLastInterstitial:(id)a3
{
  sub_1B126AF38((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___APPCNewsSupplementalContext_numOfArticlesSeenSinceLastInterstitial);
}

- (NSNumber)playerAspectRatio
{
  return (NSNumber *)sub_1B126AE9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_playerAspectRatio);
}

- (void)setPlayerAspectRatio:(id)a3
{
  sub_1B126AF38((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___APPCNewsSupplementalContext_playerAspectRatio);
}

- (NSString)subscriptionType
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_subscriptionType);
}

- (void)setSubscriptionType:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_subscriptionType);
}

- (NSString)currentIssueId
{
  return (NSString *)sub_1B120D678((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentIssueId);
}

- (void)setCurrentIssueId:(id)a3
{
  sub_1B126B0D4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_currentIssueId);
}

- (int64_t)currentIssueIsDraft
{
  return sub_1B126B2CC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentIssueIsDraftInternal);
}

- (void)setCurrentIssueIsDraft:(int64_t)a3
{
  APPCNewsSupplementalContext *v4;

  v4 = self;
  sub_1B126B258(a3);

}

- (int64_t)currentIssueIsCurrent
{
  return sub_1B126B2CC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_currentIssueIsCurrentInternal);
}

- (void)setCurrentIssueIsCurrent:(int64_t)a3
{
  APPCNewsSupplementalContext *v4;

  v4 = self;
  sub_1B126B388(a3);

}

- (NSArray)superFeedMetadata
{
  return (NSArray *)sub_1B126B508((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNewsSupplementalContext_superFeedMetadata);
}

- (void)setSuperFeedMetadata:(id)a3
{
  sub_1B126B590((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___APPCNewsSupplementalContext_superFeedMetadata);
}

- (NSDictionary)dictionaryRepresentation
{
  APPCNewsSupplementalContext *v2;
  void *v3;

  v2 = self;
  sub_1B11FF760();

  sub_1B11FFBAC(&qword_1ED391370);
  v3 = (void *)sub_1B1289800();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

@end
