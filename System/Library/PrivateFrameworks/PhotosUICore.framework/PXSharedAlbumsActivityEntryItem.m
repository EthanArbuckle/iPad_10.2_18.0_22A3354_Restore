@implementation PXSharedAlbumsActivityEntryItem

- (NSDate)date
{
  return (NSDate *)(id)sub_1A7ADC93C();
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___PXSharedAlbumsActivityEntryItem_type);
}

- (BOOL)isFromMe
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___PXSharedAlbumsActivityEntryItem_isFromMe);
}

- (NSArray)contributorDisplayNames
{
  void *v2;

  _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  v2 = (void *)sub_1A7AE39F8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSString)albumName
{
  return (NSString *)sub_1A6959214();
}

- (NSString)albumId
{
  return (NSString *)sub_1A6959214();
}

- (NSString)message
{
  return (NSString *)sub_1A6959268((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PXSharedAlbumsActivityEntryItem_message);
}

- (BOOL)isPlaceholder
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___PXSharedAlbumsActivityEntryItem_isPlaceholder);
}

- (NSString)relatedCommentUUID
{
  return (NSString *)sub_1A6959268((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___PXSharedAlbumsActivityEntryItem_relatedCommentUUID);
}

- (id)assets
{
  PXSharedAlbumsActivityEntryItem *v2;
  void *v3;

  v2 = self;
  sub_1A6FC1B70();

  sub_1A68F0D08();
  v3 = (void *)sub_1A7AE39F8();
  swift_bridgeObjectRelease();
  return v3;
}

- (NSString)contributorDisplayName
{
  void *v2;
  PXSharedAlbumsActivityEntryItem *v3;
  id v4;
  void *v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXSharedAlbumsActivityEntryItem_activityEntry);
  v3 = self;
  v4 = objc_msgSend(v2, sel_contributorDisplayName);
  sub_1A7AE3764();

  v5 = (void *)sub_1A7AE3734();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (PXSharedAlbumsActivityEntryAvatarConfiguration)avatarInfo
{
  return (PXSharedAlbumsActivityEntryAvatarConfiguration *)objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR___PXSharedAlbumsActivityEntryItem_activityEntry), sel_avatarConfiguration);
}

- (PXSharedAlbumsActivityEntryItem)init
{
  PXSharedAlbumsActivityEntryItem *result;

  result = (PXSharedAlbumsActivityEntryItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___PXSharedAlbumsActivityEntryItem_date;
  v4 = sub_1A7ADC9C0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
