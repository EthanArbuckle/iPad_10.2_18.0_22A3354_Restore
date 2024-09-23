@implementation MTServerPodcastEpisode

- (NSString)author
{
  void *v2;

  if ((*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[3])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (unint64_t)byteSize
{
  return 0;
}

- (NSString)category
{
  return (NSString *)sub_1A9349044((uint64_t)self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.category.getter);
}

- (BOOL)isExplicit
{
  MTServerPodcastEpisode *v2;
  char v3;

  v2 = self;
  v3 = ServerPodcastEpisode.isExplicit.getter();

  return v3 & 1;
}

- (NSString)guid
{
  void *v2;

  if ((*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[41])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)itemDescription
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes);
  if (!*(_QWORD *)(v2 + 184))
  {
    v4 = *(_QWORD *)(v2 + 112);
    if (!v4 || !*(_QWORD *)(v4 + 24))
    {
      v3 = 0;
      return (NSString *)v3;
    }
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSDate)pubDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  MTServerPodcastEpisode *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD360);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  PodcastEpisodeAttributes.releaseDateResolved.getter((uint64_t)v5);

  v7 = sub_1A93F738C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1A93F7314();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (NSDate)firstTimeAvailableAsPaid
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  MTServerPodcastEpisode *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD360);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[26])
  {
    v13 = 2;
    v6 = self;
    swift_retain();
    PodcastEpisodeAttributes.AvailabilityDates.subscript.getter(&v13, v5);

    swift_release();
    v7 = sub_1A93F738C();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
    {
      v9 = (void *)sub_1A93F7314();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
      return (NSDate *)v9;
    }
  }
  else
  {
    v11 = sub_1A93F738C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v5, 1, 1, v11);
  }
  return (NSDate *)0;
}

- (NSDate)firstTimeAvailableAsFree
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  MTServerPodcastEpisode *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED2AD360);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  ServerPodcastEpisode.firstTimeAvailableAsFree.getter(v5);

  v7 = sub_1A93F738C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1A93F7314();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (NSString)title
{
  void *v2;

  if ((*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[11])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (unsigned)trackNum
{
  return 0;
}

- (NSString)uti
{
  MTServerPodcastEpisode *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  PodcastEpisodeAttributes.uti.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)itunesTitle
{
  void *v2;

  if ((*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[13])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)itemSummary
{
  uint64_t v2;
  void *v3;

  v2 = (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[14];
  if (!v2)
    goto LABEL_6;
  if (!*(_QWORD *)(v2 + 24))
  {
    if (*(_QWORD *)(v2 + 40))
    {
      swift_bridgeObjectRetain();
      goto LABEL_5;
    }
LABEL_6:
    v3 = 0;
    return (NSString *)v3;
  }
LABEL_5:
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (int64_t)seasonNumber
{
  if ((*(_BYTE **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[360])
    return 0;
  else
    return (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[44];
}

- (int64_t)episodeNumber
{
  if ((*(_BYTE **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[344])
    return 0;
  else
    return (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[42];
}

- (NSString)episodeType
{
  return (NSString *)sub_1A9246B18(self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.episodeType.getter);
}

- (NSString)webpageURL
{
  void *v2;

  if ((*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR___MTServerPodcastEpisode_attributes))[30])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSString)episodeStoreId
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)priceType
{
  MTServerPodcastEpisode *v2;
  Swift::tuple_priceType_PodcastsFoundation_PriceType_assetUrl_String_optional_durationInMilliseconds_Double_optional *v3;
  void *v4;
  char v6;

  v2 = self;
  ServerPodcastEpisode.determineBestChannelMetaData(isSubscriptionActive:)(v3, (Swift::Bool)&v6);
  swift_bridgeObjectRelease();

  v4 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (double)duration
{
  return sub_1A93489F8(self);
}

- (NSString)enclosureURL
{
  return (NSString *)sub_1A9348B08(self);
}

- (NSString)entitledPriceType
{
  MTServerPodcastEpisode *v2;
  Swift::tuple_priceType_PodcastsFoundation_PriceType_assetUrl_String_optional_durationInMilliseconds_Double_optional *v3;
  void *v4;
  char v6;

  v2 = self;
  ServerPodcastEpisode.determineBestChannelMetaData(isSubscriptionActive:)(v3, (Swift::Bool)&v6);
  swift_bridgeObjectRelease();

  v4 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (double)entitledDuration
{
  return sub_1A93489F8(self);
}

- (NSString)entitledEnclosureURL
{
  return (NSString *)sub_1A9348B08(self);
}

- (NSString)resolvedEnclosureUrl
{
  return (NSString *)sub_1A9348B08(self);
}

- (NSString)artworkTemplateURL
{
  return (NSString *)sub_1A9349044((uint64_t)self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.artworkTemplateURL.getter);
}

- (double)artworkWidth
{
  return ServerPodcastEpisode.artworkWidth.getter();
}

- (double)artworkHeight
{
  return ServerPodcastEpisode.artworkHeight.getter();
}

- (NSString)artworkBackgroundColor
{
  return (NSString *)sub_1A9349044((uint64_t)self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.artworkBackgroundColor.getter);
}

- (NSString)artworkTextPrimaryColor
{
  return (NSString *)sub_1A9349044((uint64_t)self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.artworkTextPrimaryColor.getter);
}

- (NSString)artworkTextSecondaryColor
{
  return (NSString *)sub_1A9349044((uint64_t)self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.artworkTextSecondaryColor.getter);
}

- (NSString)artworkTextTertiaryColor
{
  return (NSString *)sub_1A9349044((uint64_t)self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.artworkTextTertiaryColor.getter);
}

- (NSString)artworkTextQuaternaryColor
{
  return (NSString *)sub_1A9349044((uint64_t)self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.artworkTextQuaternaryColor.getter);
}

- (NSString)freeTranscriptIdentifier
{
  MTServerPodcastEpisode *v2;
  Swift::tuple_priceType_PodcastsFoundation_PriceType_assetUrl_String_optional_durationInMilliseconds_Double_optional *v3;
  Swift::tuple_ttmlToken_String_optional_snippet_String_optional_source_PodcastsFoundation_TranscriptSource_optional *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v9;
  char v10;

  v2 = self;
  ServerPodcastEpisode.determineBestChannelMetaData(isSubscriptionActive:)(v3, (Swift::Bool)&v9);
  swift_bridgeObjectRelease();
  ServerPodcastEpisode.determineBestTranscriptMetadata(for:)(v4, (PodcastsFoundation::PriceType)&v10);
  v6 = v5;

  swift_bridgeObjectRelease();
  if (!v6)
    return (NSString *)0;
  v7 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)entitledTranscriptIdentifier
{
  MTServerPodcastEpisode *v2;
  Swift::tuple_priceType_PodcastsFoundation_PriceType_assetUrl_String_optional_durationInMilliseconds_Double_optional *v3;
  Swift::tuple_ttmlToken_String_optional_snippet_String_optional_source_PodcastsFoundation_TranscriptSource_optional *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v9;
  char v10;

  v2 = self;
  ServerPodcastEpisode.determineBestChannelMetaData(isSubscriptionActive:)(v3, (Swift::Bool)&v9);
  swift_bridgeObjectRelease();
  ServerPodcastEpisode.determineBestTranscriptMetadata(for:)(v4, (PodcastsFoundation::PriceType)&v10);
  v6 = v5;

  swift_bridgeObjectRelease();
  if (!v6)
    return (NSString *)0;
  v7 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)freeTranscriptSnippet
{
  MTServerPodcastEpisode *v2;
  Swift::tuple_priceType_PodcastsFoundation_PriceType_assetUrl_String_optional_durationInMilliseconds_Double_optional *v3;
  Swift::tuple_ttmlToken_String_optional_snippet_String_optional_source_PodcastsFoundation_TranscriptSource_optional *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v9;
  char v10;

  v2 = self;
  ServerPodcastEpisode.determineBestChannelMetaData(isSubscriptionActive:)(v3, (Swift::Bool)&v9);
  swift_bridgeObjectRelease();
  ServerPodcastEpisode.determineBestTranscriptMetadata(for:)(v4, (PodcastsFoundation::PriceType)&v10);
  v6 = v5;

  swift_bridgeObjectRelease();
  if (!v6)
    return (NSString *)0;
  v7 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)entitledTranscriptSnippet
{
  MTServerPodcastEpisode *v2;
  Swift::tuple_priceType_PodcastsFoundation_PriceType_assetUrl_String_optional_durationInMilliseconds_Double_optional *v3;
  Swift::tuple_ttmlToken_String_optional_snippet_String_optional_source_PodcastsFoundation_TranscriptSource_optional *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v9;
  char v10;

  v2 = self;
  ServerPodcastEpisode.determineBestChannelMetaData(isSubscriptionActive:)(v3, (Swift::Bool)&v9);
  swift_bridgeObjectRelease();
  ServerPodcastEpisode.determineBestTranscriptMetadata(for:)(v4, (PodcastsFoundation::PriceType)&v10);
  v6 = v5;

  swift_bridgeObjectRelease();
  if (!v6)
    return (NSString *)0;
  v7 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v7;
}

- (NSString)freeTranscriptProvider
{
  return (NSString *)sub_1A9246B18(self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.freeTranscriptProvider.getter);
}

- (NSString)entitledTranscriptProvider
{
  return (NSString *)sub_1A9246B18(self, (uint64_t)a2, (void (*)(void))ServerPodcastEpisode.entitledTranscriptProvider.getter);
}

- (BOOL)priceTypeIsPSUB
{
  MTServerPodcastEpisode *v2;
  Swift::tuple_priceType_PodcastsFoundation_PriceType_assetUrl_String_optional_durationInMilliseconds_Double_optional *v3;
  BOOL result;
  char v5;

  v2 = self;
  ServerPodcastEpisode.determineBestChannelMetaData(isSubscriptionActive:)(v3, (Swift::Bool)&v5);
  swift_bridgeObjectRelease();
  __asm { BR              X10 }
  return result;
}

- (NSString)id
{
  return (NSString *)sub_1A91AFA40();
}

- (NSString)type
{
  return (NSString *)sub_1A91AFA40();
}

- (MTServerPodcastEpisode)init
{
  MTServerPodcastEpisode *result;

  result = (MTServerPodcastEpisode *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

}

- (BOOL)isRestricted
{
  MTServerPodcastEpisode *v2;
  char v3;

  v2 = self;
  v3 = ServerPodcastEpisode.isRestricted.getter();

  return v3 & 1;
}

@end
