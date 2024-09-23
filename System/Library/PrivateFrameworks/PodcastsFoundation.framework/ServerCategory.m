@implementation ServerCategory

- (NSString)id
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)type
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)identifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSNumber)artworkHeight
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)self->attributes + 48);
  if (v2 && (v3 = *(_QWORD *)(v2 + 16)) != 0 && (*(_BYTE *)(v3 + 40) & 1) == 0)
    v4 = (void *)sub_1A93F8694();
  else
    v4 = 0;
  return (NSNumber *)v4;
}

- (NSNumber)artworkWidth
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)self->attributes + 48);
  if (v2 && (v3 = *(_QWORD *)(v2 + 16)) != 0 && (*(_BYTE *)(v3 + 24) & 1) == 0)
    v4 = (void *)sub_1A93F8694();
  else
    v4 = 0;
  return (NSNumber *)v4;
}

- (NSString)artworkPrimaryColor
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)self->attributes + 48);
  if (v2 && (v3 = *(_QWORD *)(v2 + 16)) != 0 && *(_QWORD *)(v3 + 72))
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

- (NSString)artworkTemplateURL
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)self->attributes + 48);
  if (v2 && (v3 = *(_QWORD *)(v2 + 16)) != 0 && *(_QWORD *)(v3 + 56))
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

- (NSString)name
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)url
{
  void *v2;

  if (*(_QWORD *)(*(_QWORD *)self->attributes + 40))
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

- (NSString)color
{
  void *v2;

  if (*(_QWORD *)(*(_QWORD *)self->attributes + 64))
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

@end
