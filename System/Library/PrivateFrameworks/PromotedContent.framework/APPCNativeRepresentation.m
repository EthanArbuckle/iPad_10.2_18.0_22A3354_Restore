@implementation APPCNativeRepresentation

- (NSString)articleID
{
  return (NSString *)sub_1B11EFEE0();
}

- (NSString)articleTitle
{
  return (NSString *)sub_1B1225490((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeRepresentation_articleTitle);
}

- (NSString)advertiserName
{
  return (NSString *)sub_1B1225490((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeRepresentation_advertiserName);
}

- (NSString)campaignData
{
  return (NSString *)sub_1B11EFEE0();
}

- (APPCNativeRepresentation)initWithIdentifier:(id)a3 adType:(int64_t)a4 desiredPosition:(int64_t)a5 privacyMarkerPosition:(int64_t)a6 articleID:(id)a7 articleTitle:(id)a8 adSponsor:(id)a9 campaignData:(id)a10 adSize:(CGSize)a11 adPolicyData:(id)a12
{
  double height;
  double width;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  APPCNativeRepresentation *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  APPCNativeRepresentation *v39;
  uint64_t v40;

  height = a11.height;
  width = a11.width;
  v39 = self;
  v40 = a6;
  v37 = a4;
  v38 = a5;
  v16 = sub_1B1289674();
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B128965C();
  if (a7)
  {
    v36 = sub_1B1289884();
    v20 = v19;
  }
  else
  {
    v36 = 0;
    v20 = 0;
  }
  v21 = a9;
  if (a8)
  {
    v22 = sub_1B1289884();
    v24 = v23;
    if (a9)
    {
LABEL_6:
      v25 = sub_1B1289884();
      v21 = v26;
      goto LABEL_9;
    }
  }
  else
  {
    v22 = 0;
    v24 = 0;
    if (a9)
      goto LABEL_6;
  }
  v25 = 0;
LABEL_9:
  v27 = a12;
  v28 = a10;
  if (v28)
  {
    v29 = v28;
    v30 = sub_1B1289884();
    v32 = v31;

  }
  else
  {
    v30 = 0;
    v32 = 0;
  }
  v33 = (APPCNativeRepresentation *)sub_1B122651C((uint64_t)v18, v37, v38, v40, v36, v20, v22, v24, width, height, v25, (uint64_t)v21, v30, v32, v27);

  return v33;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
