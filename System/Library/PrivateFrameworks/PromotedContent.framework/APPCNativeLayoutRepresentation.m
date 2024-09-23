@implementation APPCNativeLayoutRepresentation

- (NSString)headline
{
  return (NSString *)sub_1B1225490((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_headline);
}

- (NSString)accessibilityHeadline
{
  return (NSString *)sub_1B1225490((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_accessibilityHeadline);
}

- (NSString)adCopy
{
  return (NSString *)sub_1B1225490((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_adCopy);
}

- (NSString)accessibilityAdCopy
{
  return (NSString *)sub_1B1225490((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_accessibilityAdCopy);
}

- (NSString)sponsoredBy
{
  return (NSString *)sub_1B1225490((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_sponsoredBy);
}

- (NSArray)elements
{
  void *v2;

  if (*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___APPCNativeLayoutRepresentation_elements))
  {
    type metadata accessor for ClientLayoutElement();
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

- (int64_t)adFormatType
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR___APPCNativeLayoutRepresentation_adFormatType);
}

- (NSURL)sponsoredByAssetURL
{
  return (NSURL *)sub_1B12505F4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_sponsoredByAssetURL);
}

- (NSURL)sponsoredByAssetProxyURL
{
  return (NSURL *)sub_1B12505F4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_sponsoredByAssetProxyURL);
}

- (NSURL)sponsoredByAssetURLForDarkModeProxyURL
{
  return (NSURL *)sub_1B12505F4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_sponsoredByAssetURLForDarkModeProxyURL);
}

- (APPCClientLayoutButton)button
{
  return (APPCClientLayoutButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                           + OBJC_IVAR___APPCNativeLayoutRepresentation_button));
}

- (NSURL)actionURL
{
  return (NSURL *)sub_1B12505F4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCNativeLayoutRepresentation_actionURL);
}

- (NSDictionary)localizedHeadlines
{
  void *v2;

  if (*(Class *)((char *)&self->super.super.isa + OBJC_IVAR___APPCNativeLayoutRepresentation_localizedHeadlines))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B1289800();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (_TtC15PromotedContent19TargetingDimensions)targetingDimensions
{
  return (_TtC15PromotedContent19TargetingDimensions *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                               + OBJC_IVAR___APPCNativeLayoutRepresentation_targetingDimensions));
}

- (APPCNativeLayoutRepresentation)initWithIdentifier:(id)a3 adIdentifier:(id)a4 adType:(int64_t)a5 desiredPosition:(int64_t)a6 privacyMarkerPosition:(int64_t)a7 adSize:(CGSize)a8 headline:(id)a9 accessibilityHeadline:(id)a10 adCopy:(id)a11 accessibilityAdCopy:(id)a12 sponsoredBy:(id)a13 elements:(id)a14 adPolicyData:(id)a15 adFormatType:(int64_t)a16 sponsoredByAssetURL:(id)a17 sponsoredByAssetURLForDarkMode:(id)a18 button:(id)a19 actionURL:(id)a20 localizedHeadlines:(id)a21 targetingDimensions:(id)a22 tapAction:(id)a23
{
  double height;
  double width;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  char *v67;
  void *v68;
  APPCNativeLayoutRepresentation *v69;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  char *v91;
  char *v92;
  APPCNativeLayoutRepresentation *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  id v98;
  id v99;
  id v100;

  height = a8.height;
  width = a8.width;
  v95 = a6;
  v96 = a7;
  v93 = self;
  v94 = a5;
  v26 = sub_1B11FFBAC((uint64_t *)&unk_1ED391290);
  v27 = MEMORY[0x1E0C80A78](v26);
  v92 = (char *)&v72 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x1E0C80A78](v27);
  v31 = (char *)&v72 - v30;
  MEMORY[0x1E0C80A78](v29);
  v33 = (char *)&v72 - v32;
  v34 = sub_1B1289674();
  MEMORY[0x1E0C80A78](v34);
  v90 = (uint64_t)&v72 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B128965C();
  v36 = sub_1B1289884();
  v87 = v37;
  v88 = v36;
  v91 = v31;
  v89 = v33;
  if (a9)
  {
    v38 = sub_1B1289884();
    v85 = v39;
    v86 = v38;
  }
  else
  {
    v85 = 0;
    v86 = 0;
  }
  v99 = a20;
  v100 = a21;
  v97 = a17;
  v98 = a18;
  if (a10)
  {
    v40 = sub_1B1289884();
    v83 = v41;
    v84 = v40;
    if (a11)
    {
LABEL_6:
      v80 = sub_1B1289884();
      v79 = v42;
      goto LABEL_9;
    }
  }
  else
  {
    v83 = 0;
    v84 = 0;
    if (a11)
      goto LABEL_6;
  }
  v80 = 0;
  v79 = 0;
LABEL_9:
  v82 = a23;
  v81 = a22;
  v43 = v100;
  v44 = v99;
  v78 = (char *)a19;
  v45 = v98;
  v46 = v97;
  v77 = a15;
  v47 = a14;
  v48 = a13;
  v49 = a12;
  if (v49)
  {
    v50 = v49;
    v76 = sub_1B1289884();
    v75 = v51;

    if (v48)
    {
LABEL_11:
      v74 = sub_1B1289884();
      v73 = v52;

      goto LABEL_14;
    }
  }
  else
  {
    v76 = 0;
    v75 = 0;
    if (v48)
      goto LABEL_11;
  }
  v74 = 0;
  v73 = 0;
LABEL_14:
  v53 = (uint64_t)v89;
  v54 = v43;
  if (v47)
  {
    type metadata accessor for ClientLayoutElement();
    v55 = sub_1B1289944();

    v56 = (uint64_t)v91;
    if (v46)
    {
LABEL_16:
      sub_1B128956C();

      v57 = sub_1B1289584();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v53, 0, 1, v57);
      goto LABEL_19;
    }
  }
  else
  {
    v55 = 0;
    v56 = (uint64_t)v91;
    if (v46)
      goto LABEL_16;
  }
  v58 = sub_1B1289584();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v53, 1, 1, v58);
LABEL_19:
  if (v45)
  {
    sub_1B128956C();

    v59 = sub_1B1289584();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 56))(v56, 0, 1, v59);
  }
  else
  {
    v60 = sub_1B1289584();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 56))(v56, 1, 1, v60);
  }
  v61 = v92;
  if (v44)
  {
    sub_1B128956C();

    v62 = sub_1B1289584();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 56))(v61, 0, 1, v62);
  }
  else
  {
    v63 = sub_1B1289584();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 56))(v61, 1, 1, v63);
  }
  if (v43)
  {
    v64 = sub_1B128980C();

  }
  else
  {
    v64 = 0;
  }
  v65 = v82;
  v66 = v81;
  v71 = (uint64_t)v61;
  v67 = v78;
  v68 = v77;
  v69 = (APPCNativeLayoutRepresentation *)sub_1B12529F4(v90, v88, v87, v94, v95, v96, v86, v85, width, height, v84, v83, v80, v79, v76, v75, v74, v73, v55,
                                            v77,
                                            (char *)a16,
                                            v53,
                                            v56,
                                            v78,
                                            v71,
                                            v64,
                                            v81,
                                            v82);

  return v69;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B1206378((uint64_t)self + OBJC_IVAR___APPCNativeLayoutRepresentation_sponsoredByAssetURL);
  sub_1B1206378((uint64_t)self + OBJC_IVAR___APPCNativeLayoutRepresentation_sponsoredByAssetProxyURL);
  sub_1B1206378((uint64_t)self + OBJC_IVAR___APPCNativeLayoutRepresentation_sponsoredByAssetURLForDarkModeProxyURL);

  sub_1B1206378((uint64_t)self + OBJC_IVAR___APPCNativeLayoutRepresentation_actionURL);
  swift_bridgeObjectRelease();

}

@end
