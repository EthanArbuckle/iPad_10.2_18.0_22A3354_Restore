@implementation ServerChannel

- (NSString)name
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)subscriptionName
{
  void *v2;

  if ((*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[13])
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

- (int64_t)showCount
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes);
  if (*(_BYTE *)(v2 + 56))
    return 0;
  else
    return *(_QWORD *)(v2 + 48);
}

- (int64_t)availableShowCount
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes);
  if (*(_BYTE *)(v2 + 72))
    return 0;
  else
    return *(_QWORD *)(v2 + 64);
}

- (NSString)storeId
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)displayType
{
  _TtC18PodcastsFoundation13ServerChannel *v2;
  void *v3;
  char v5;

  v2 = self;
  sub_1A9184AA4((uint64_t)v2, &v5);

  v3 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)artworkURL
{
  uint64_t v2;
  void *v3;

  v2 = (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[3];
  if (v2 && *(_QWORD *)(v2 + 56))
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

- (NSString)logoImageURL
{
  uint64_t v2;
  void *v3;

  v2 = (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[16];
  if (v2 && *(_QWORD *)(v2 + 56))
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

- (NSString)backgroundColor
{
  void *v2;

  if ((*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[18])
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

- (float)logoImageHeight
{
  uint64_t v2;

  v2 = (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[16];
  if (v2 && (*(_BYTE *)(v2 + 40) & 1) == 0)
    return (float)*(uint64_t *)(v2 + 32);
  else
    return (float)0;
}

- (float)logoImageWidth
{
  uint64_t v2;

  v2 = (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[16];
  if (v2 && (*(_BYTE *)(v2 + 24) & 1) == 0)
    return (float)*(uint64_t *)(v2 + 16);
  else
    return (float)0;
}

- (NSString)uberBackgroundImageURL
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[14];
  if (v2 && (v3 = *(_QWORD *)(v2 + 32)) != 0 && *(_QWORD *)(v3 + 56))
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

- (NSString)uberBackgroundJoeColor
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = (*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[14];
  if (v2 && (v3 = *(_QWORD *)(v2 + 32)) != 0 && *(_QWORD *)(v3 + 72))
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

- (NSString)url
{
  void *v2;

  if ((*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation13ServerChannel_attributes))[21])
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

- (NSString)fallbackSubscriptionName
{
  _TtC18PodcastsFoundation13ServerChannel *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  ServerChannel.fallbackSubscriptionName.getter();
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

- (NSString)id
{
  return (NSString *)sub_1A91AFA40();
}

- (NSString)type
{
  return (NSString *)sub_1A91AFA40();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end
