@implementation MTServerPodcast

- (id)toFeed
{
  MTServerPodcast *v2;
  IMPodcastFeed *v3;
  void *v4;
  void *v5;

  v2 = self;
  ServerPodcast.toFeed()(v3);
  v5 = v4;

  return v5;
}

- (NSString)feedDescription
{
  return (NSString *)sub_1A9246B18(self, (uint64_t)a2, (void (*)(void))ServerPodcast.feedDescription.getter);
}

- (NSString)category
{
  uint64_t v2;
  void *v3;

  ServerPodcast.category.getter();
  if (v2)
  {
    v3 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)globalImageURL
{
  return (NSString *)0;
}

- (BOOL)hasEpisodes
{
  unint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  MTServerPodcast *v7;

  v3 = (unint64_t *)((char *)self + OBJC_IVAR___MTServerPodcast_episodes);
  swift_beginAccess();
  v4 = *v3;
  if (!v4)
    return 0;
  if (v4 >> 62)
  {
    v7 = self;
    swift_bridgeObjectRetain();
    v5 = sub_1A93F8E5C();

    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return v5 != 0;
}

- (id)author
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v1 && *(_QWORD *)(v1 + 24))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (NSString)updatedFeedURL
{
  return (NSString *)0;
}

- (NSString)resolvedFeedURL
{
  uint64_t v2;
  void *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && *(_QWORD *)(v2 + 80))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)title
{
  uint64_t v2;
  void *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && *(_QWORD *)(v2 + 96))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)isExplicit
{
  MTServerPodcast *v2;
  char v3;

  v2 = self;
  v3 = ServerPodcast.isExplicit.getter();

  return v3 & 1;
}

- (BOOL)isNotSubscribable
{
  uint64_t v2;
  int v3;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (!v2)
    return 0;
  v3 = *(unsigned __int8 *)(v2 + 48);
  return (v3 & 1) == 0 && v3 != 2;
}

- (NSString)shareURL
{
  uint64_t v2;
  void *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && *(_QWORD *)(v2 + 40))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)showType
{
  uint64_t v2;
  void *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && *(_QWORD *)(v2 + 144))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)webpageURL
{
  uint64_t v2;
  void *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && *(_QWORD *)(v2 + 200))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)podcastStoreId
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)displayType
{
  return (NSString *)sub_1A9246B18(self, (uint64_t)a2, (void (*)(void))ServerPodcast.displayType.getter);
}

- (NSArray)offers
{
  MTServerPodcast *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = ServerPodcast.offers.getter();

  if (v3)
  {
    sub_1A9247410();
    v4 = (void *)sub_1A93F82F8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (NSString)uberBackgroundImageURL
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(_QWORD *)(v2 + 152)) != 0 && (v4 = *(_QWORD *)(v3 + 16)) != 0 && *(_QWORD *)(v4 + 56))
  {
    swift_bridgeObjectRetain();
    v5 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)uberBackgroundJoeColor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(_QWORD *)(v2 + 152)) != 0 && (v4 = *(_QWORD *)(v3 + 16)) != 0 && *(_QWORD *)(v4 + 72))
  {
    swift_bridgeObjectRetain();
    v5 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)uberArtworkTextPrimaryColor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(_QWORD *)(v2 + 152)) != 0 && (v4 = *(_QWORD *)(v3 + 16)) != 0 && *(_QWORD *)(v4 + 88))
  {
    swift_bridgeObjectRetain();
    v5 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)uberArtworkTextSecondaryColor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(_QWORD *)(v2 + 152)) != 0 && (v4 = *(_QWORD *)(v3 + 16)) != 0 && *(_QWORD *)(v4 + 104))
  {
    swift_bridgeObjectRetain();
    v5 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)uberArtworkTextTertiaryColor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(_QWORD *)(v2 + 152)) != 0 && (v4 = *(_QWORD *)(v3 + 16)) != 0 && *(_QWORD *)(v4 + 120))
  {
    swift_bridgeObjectRetain();
    v5 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)uberArtworkTextQuaternaryColor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(_QWORD *)(v2 + 152)) != 0 && (v4 = *(_QWORD *)(v3 + 16)) != 0 && *(_QWORD *)(v4 + 136))
  {
    swift_bridgeObjectRetain();
    v5 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)imageURL
{
  return (NSString *)sub_1A9246B18(self, (uint64_t)a2, (void (*)(void))ServerPodcast.imageURL.getter);
}

- (NSString)artworkTemplateURL
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(_QWORD *)(v2 + 112)) != 0 && *(_QWORD *)(v3 + 56))
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)artworkPrimaryColor
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(_QWORD *)(v2 + 112)) != 0 && *(_QWORD *)(v3 + 72))
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)artworkTextPrimaryColor
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(_QWORD *)(v2 + 112)) != 0 && *(_QWORD *)(v3 + 88))
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)artworkTextSecondaryColor
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(_QWORD *)(v2 + 112)) != 0 && *(_QWORD *)(v3 + 104))
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)artworkTextTertiaryColor
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(_QWORD *)(v2 + 112)) != 0 && *(_QWORD *)(v3 + 120))
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)artworkTextQuaternaryColor
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && (v3 = *(_QWORD *)(v2 + 112)) != 0 && *(_QWORD *)(v3 + 136))
  {
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (MTFeedChannel)channelItem
{
  MTServerPodcast *v2;
  void *v3;

  v2 = self;
  v3 = (void *)ServerPodcast.channelItem.getter();

  return (MTFeedChannel *)v3;
}

- (NSString)showSpecificUpsellCopy
{
  uint64_t v2;
  void *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC18PodcastsFoundation17ServerPodcastBase_attributes);
  if (v2 && *(_QWORD *)(v2 + 240))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1A93F8010();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSOrderedSet)categories
{
  MTServerPodcast *v2;
  id v3;

  v2 = self;
  v3 = ServerPodcast.categories.getter();

  return (NSOrderedSet *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
