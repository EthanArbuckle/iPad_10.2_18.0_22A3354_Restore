@implementation APPCBannerRepresentation

- (NSString)adTag
{
  void *v2;

  if (*(_QWORD *)&self->super.identifier[OBJC_IVAR___APPCBannerRepresentation_adTag])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B1289878();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSNumber)adamIdentifier
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR___APPCBannerRepresentation_adamIdentifier));
}

- (int64_t)appAdTemplateType
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR___APPCBannerRepresentation_appAdTemplateType);
}

- (APPCOutstreamVideoInfo)outstreamVideoInfo
{
  return (APPCOutstreamVideoInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                           + OBJC_IVAR___APPCBannerRepresentation_outstreamVideoInfo));
}

- (APPCBannerRepresentation)initWithIdentifier:(id)a3 adType:(int64_t)a4 desiredPosition:(int64_t)a5 privacyMarkerPosition:(int64_t)a6 adSize:(CGSize)a7 tapAction:(id)a8 adTag:(id)a9 outstreamVideoInfo:(id)a10 adamIdentifier:(id)a11 tapActionTemplateType:(int64_t)a12 adPolicyData:(id)a13
{
  double height;
  double width;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  APPCBannerRepresentation *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  APPCBannerRepresentation *v31;

  height = a7.height;
  width = a7.width;
  v29 = a5;
  v30 = a6;
  v28 = a4;
  v31 = self;
  v17 = sub_1B1289674();
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B128965C();
  if (a9)
  {
    a9 = (id)sub_1B1289884();
    v21 = v20;
  }
  else
  {
    v21 = 0;
  }
  v22 = a13;
  v23 = a11;
  v24 = a10;
  v25 = a8;
  v26 = (APPCBannerRepresentation *)sub_1B122797C((uint64_t)v19, v28, v29, v30, a8, (uint64_t)a9, v21, (uint64_t)a10, width, height, (uint64_t)a11, a12, a13);

  return v26;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
