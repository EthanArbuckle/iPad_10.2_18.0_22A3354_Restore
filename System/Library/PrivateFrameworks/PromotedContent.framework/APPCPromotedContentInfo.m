@implementation APPCPromotedContentInfo

- (void)dealloc
{
  void *v2;
  APPCPromotedContentInfo *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_promotedContent);
  v3 = self;
  if (objc_msgSend(v2, sel_adType) == (id)1)
    objc_msgSend(*(id *)((char *)&v3->super.isa + OBJC_IVAR___APPCPromotedContentInfo_metricsHelper), sel_manuallyDiscardWithReason_, 0);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for PromotedContentInfo();
  -[APPCPromotedContentInfo dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_1B11E40EC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_ready));
}

- (APPCLifecycleMetricsHelping)metricsHelper
{
  return (APPCLifecycleMetricsHelping *)(id)swift_unknownObjectRetain();
}

- (id)ready
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_ready))
    return 0;
  v2 = *(_QWORD *)&self->promotedContent[OBJC_IVAR___APPCPromotedContentInfo_ready];
  v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_ready);
  v5[5] = v2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 1107296256;
  v5[2] = sub_1B123B2E4;
  v5[3] = &unk_1E62E4048;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (NSString)identifier
{
  void *v2;
  APPCPromotedContentInfo *v3;
  id v4;
  void *v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_promotedContent);
  v3 = self;
  v4 = objc_msgSend(v2, sel_identifier);
  sub_1B1289884();

  v5 = (void *)sub_1B1289878();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (APPCNativeRepresentation)nativeInfo
{
  void *v2;
  APPCPromotedContentInfo *v3;
  void *v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_promotedContent);
  v3 = self;
  if (objc_msgSend(v2, sel_bestRepresentation))
  {
    type metadata accessor for NativeRepresentation();
    v4 = (void *)swift_dynamicCastClass();

    if (!v4)
      swift_unknownObjectRelease();
  }
  else
  {

    v4 = 0;
  }
  return (APPCNativeRepresentation *)v4;
}

- (int64_t)desiredPosition
{
  void *v2;
  APPCPromotedContentInfo *v3;
  id v4;
  id v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_promotedContent);
  v3 = self;
  v4 = objc_msgSend(v2, sel_bestRepresentation);
  if (v4)
  {
    v5 = objc_msgSend(v4, sel_desiredPosition);

    swift_unknownObjectRelease();
    return (int64_t)v5;
  }
  else
  {

    return 0;
  }
}

- (int64_t)errorReason
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_promotedContent), sel_serverUnfilledReason);
}

- (int64_t)unfilledReason
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___APPCPromotedContentInfo_unfilledReason);
  swift_beginAccess();
  return *v2;
}

- (void)setUnfilledReason:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___APPCPromotedContentInfo_unfilledReason);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)placeholder
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___APPCPromotedContentInfo_placeholder;
  swift_beginAccess();
  return *v2;
}

- (void)setPlaceholder:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___APPCPromotedContentInfo_placeholder;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isInteractive
{
  void *v2;
  APPCPromotedContentInfo *v3;
  BOOL v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_promotedContent);
  v3 = self;
  if (objc_msgSend(v2, sel_bestRepresentation))
  {
    type metadata accessor for ClientLayoutRepresentation();
    v4 = swift_dynamicCastClass() != 0;

    swift_unknownObjectRelease();
  }
  else
  {

    return 0;
  }
  return v4;
}

- (BOOL)isDownloadable
{
  APPCPromotedContentInfo *v2;
  char v3;

  v2 = self;
  v3 = sub_1B122F2D0();

  return v3 & 1;
}

- (BOOL)isVideo
{
  void *v2;
  APPCPromotedContentInfo *v3;
  unsigned __int8 v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContentInfo_promotedContent);
  v3 = self;
  if (objc_msgSend(v2, sel_bestRepresentation))
  {
    type metadata accessor for VideoRepresentation();
    if (swift_dynamicCastClass())
    {

      swift_unknownObjectRelease();
      return 1;
    }
    swift_unknownObjectRelease();
  }
  v5 = objc_msgSend(v2, sel_isOutstreamVideoAd);

  return v5;
}

- (APPCPromotedContentInfo)init
{
  APPCPromotedContentInfo *result;

  result = (APPCPromotedContentInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
