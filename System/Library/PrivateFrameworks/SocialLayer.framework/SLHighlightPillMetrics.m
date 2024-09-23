@implementation SLHighlightPillMetrics

- (SLHighlightPillMetrics)initWithSlotStyle:(id)a3 tag:(id)a4
{
  id v6;
  id v7;
  SLHighlightPillMetrics *v8;

  v6 = a3;
  v7 = a4;
  v8 = -[SLHighlightPillMetrics initWithSlotStyle:tag:variant:](self, sel_initWithSlotStyle_tag_variant_, v6, v7, objc_msgSend(v7, sel_variant));

  return v8;
}

- (SLHighlightPillMetrics)initWithSlotStyle:(id)a3 tag:(id)a4 variant:(unint64_t)a5
{
  id v7;
  id v8;
  SLHighlightPillMetrics *v9;

  v7 = a3;
  v8 = a4;
  v9 = (SLHighlightPillMetrics *)specialized PillMetrics.init(slotStyle:tag:variant:)(v7, v8, a5);

  return v9;
}

- (SLHighlightPillMetrics)init
{
  SLHighlightPillMetrics *result;

  result = (SLHighlightPillMetrics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _QWORD v3[16];

  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics);

  outlined init with take of SLDHighlightPillMetrics?((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics____lazy_storage___pillMetrics, (uint64_t)v3);
  outlined release of SLDHighlightPillMetrics?(v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))outlined consume of SLDHighlightPillMetrics?);
}

- (NSEdgeInsets)margins
{
  SLHighlightPillMetrics *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[16];
  NSEdgeInsets result;

  v2 = self;
  PillMetrics.pillMetrics.getter((uint64_t)v7);
  outlined release of SLDHighlightPillMetrics((uint64_t)v7);

  v3 = *(double *)&v7[1];
  v4 = *(double *)&v7[2];
  v5 = *(double *)&v7[3];
  v6 = *(double *)&v7[4];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGSize)pillSize
{
  SLHighlightPillMetrics *v2;
  double v3;
  double v4;
  _QWORD v5[16];
  CGSize result;

  v2 = self;
  PillMetrics.pillMetrics.getter((uint64_t)v5);
  outlined release of SLDHighlightPillMetrics((uint64_t)v5);

  v3 = *(double *)&v5[5];
  v4 = *(double *)&v5[6];
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)hasValidMetricsForDrawing
{
  SLHighlightPillMetrics *v2;
  _BYTE v4[128];

  v2 = self;
  PillMetrics.pillMetrics.getter((uint64_t)v4);
  outlined release of SLDHighlightPillMetrics((uint64_t)v4);

  return v4[0];
}

- (const)firstLine
{
  SLHighlightPillMetrics *v2;
  id v3;
  id v5[16];

  v2 = self;
  PillMetrics.pillMetrics.getter((uint64_t)v5);
  v3 = v5[7];
  outlined release of SLDHighlightPillMetrics((uint64_t)v5);

  return (const __CTLine *)v3;
}

- (const)secondLine
{
  SLHighlightPillMetrics *v2;
  id v3;
  id v5[16];

  v2 = self;
  PillMetrics.pillMetrics.getter((uint64_t)v5);
  v3 = v5[8];
  outlined release of SLDHighlightPillMetrics((uint64_t)v5);

  return (const __CTLine *)v3;
}

- (double)overlappedAvatarKnockoutBorderWidth
{
  SLHighlightPillMetrics *v2;
  _QWORD v4[16];

  v2 = self;
  PillMetrics.pillMetrics.getter((uint64_t)v4);
  outlined release of SLDHighlightPillMetrics((uint64_t)v4);

  return *(double *)&v4[9];
}

- (NSEdgeInsets)labelHorizontalMargins
{
  SLHighlightPillMetrics *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[16];
  NSEdgeInsets result;

  v2 = self;
  PillMetrics.pillMetrics.getter((uint64_t)v7);
  outlined release of SLDHighlightPillMetrics((uint64_t)v7);

  v3 = *(double *)&v7[10];
  v4 = *(double *)&v7[11];
  v5 = *(double *)&v7[12];
  v6 = *(double *)&v7[13];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)specMaxWidth
{
  uint64_t v3;
  uint64_t v4;
  double (*v5)(uint64_t, uint64_t);
  SLHighlightPillMetrics *v6;
  double v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v5 = *(double (**)(uint64_t, uint64_t))(v4 + 80);
  v6 = self;
  v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7;
}

- (NSEdgeInsets)minimumLabelHorizontalMargines
{
  uint64_t v3;
  uint64_t v4;
  double (*v5)(uint64_t, uint64_t);
  SLHighlightPillMetrics *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;
  NSEdgeInsets result;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v18);
  v3 = v19;
  v4 = v20;
  __swift_project_boxed_opaque_existential_1(v18, v19);
  v5 = *(double (**)(uint64_t, uint64_t))(v4 + 88);
  v6 = self;
  v7 = v5(v3, v4);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (double)avatarDiameter
{
  uint64_t v3;
  uint64_t v4;
  double (*v5)(uint64_t, uint64_t);
  SLHighlightPillMetrics *v6;
  double v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v5 = *(double (**)(uint64_t, uint64_t))(v4 + 96);
  v6 = self;
  v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7;
}

- (double)avatarContainerWidth
{
  uint64_t v3;
  uint64_t v4;
  double (*v5)(uint64_t, uint64_t);
  SLHighlightPillMetrics *v6;
  double v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v5 = *(double (**)(uint64_t, uint64_t))(v4 + 112);
  v6 = self;
  v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7;
}

- (double)avatarKnockoutWidth
{
  uint64_t v3;
  uint64_t v4;
  double (*v5)(uint64_t, uint64_t);
  SLHighlightPillMetrics *v6;
  double v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v5 = *(double (**)(uint64_t, uint64_t))(v4 + 120);
  v6 = self;
  v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7;
}

- (double)overlappedAvatarVisibleWidth
{
  uint64_t v3;
  uint64_t v4;
  double (*v5)(uint64_t, uint64_t);
  SLHighlightPillMetrics *v6;
  double v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v5 = *(double (**)(uint64_t, uint64_t))(v4 + 104);
  v6 = self;
  v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7;
}

- (BOOL)useDoubleLinedLabel
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  SLHighlightPillMetrics *v6;
  char v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 128);
  v6 = self;
  v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7 & 1;
}

- (CGSize)chevronSize
{
  uint64_t v3;
  uint64_t v4;
  double (*v5)(uint64_t, uint64_t);
  SLHighlightPillMetrics *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;
  CGSize result;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v12);
  v3 = v13;
  v4 = v14;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  v5 = *(double (**)(uint64_t, uint64_t))(v4 + 192);
  v6 = self;
  v7 = v5(v3, v4);
  v9 = v8;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

+ (id)accessibilityLabelFor:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = specialized static PillMetrics.accessibilityLabel(for:)(v3);
  v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x19AEC3B6C](v4, v6);
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (double)pillHeightWithStyle:(id)a3 variant:(unint64_t)a4 maxWidth:(double)a5
{
  id v8;
  double v9;

  swift_getObjCClassMetadata();
  v8 = a3;
  v9 = static PillMetrics.pillHeight(style:variant:maxWidth:)(v8, a4, a5);

  return v9;
}

+ (NSEdgeInsets)pillMarginsWithStyle:(id)a3 variant:(unint64_t)a4 maxWidth:(double)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;
  NSEdgeInsets result;

  swift_getObjCClassMetadata();
  v8 = a3;
  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(v8, a4, (uint64_t)v22, a5);
  v9 = v23;
  v10 = v24;
  __swift_project_boxed_opaque_existential_1(v22, v23);
  v11 = (*(double (**)(uint64_t, uint64_t))(v10 + 168))(v9, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

+ (int64_t)maxSendersToDisplayWithStyle:(id)a3 variant:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;

  swift_getObjCClassMetadata();
  v6 = a3;
  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(v6, a4, (uint64_t)v14, 100.0);
  v7 = v15;
  v8 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 40))(v7, v8);
  v10 = v15;
  v11 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 48))(v10, v11);
  if (v12 > v9)
    v9 = v12;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);

  return v9;
}

+ (const)chevronFontDescriptorWithStyle:(id)a3 variant:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  swift_getObjCClassMetadata();
  v6 = a3;
  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(v6, a4, (uint64_t)v11, 100.0);
  v7 = v12;
  v8 = v13;
  __swift_project_boxed_opaque_existential_1(v11, v12);
  v9 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 184))(v7, v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);

  return (const __CTFontDescriptor *)v9;
}

+ (CGSize)chevronSizeWithStyle:(id)a3 variant:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;
  CGSize result;

  swift_getObjCClassMetadata();
  v6 = a3;
  static PillMetrics.metricsPlaceholder(for:variant:maxWidth:)(v6, a4, (uint64_t)v14, 100.0);
  v7 = v15;
  v8 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  v9 = (*(double (**)(uint64_t, uint64_t))(v8 + 192))(v7, v8);
  v11 = v10;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (const)truncatedLineFrom:(id)a3 maxWidth:(double)a4
{
  const __CFAttributedString *v4;
  CTLineRef v5;
  void *TruncatedLineWithTokenHandler;

  v4 = (const __CFAttributedString *)a3;
  v5 = CTLineCreateWithAttributedString(v4);
  TruncatedLineWithTokenHandler = (void *)CTLineCreateTruncatedLineWithTokenHandler();

  return (const __CTLine *)TruncatedLineWithTokenHandler;
}

- (int64_t)imageCount
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  SLHighlightPillMetrics *v6;
  int64_t v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 64);
  v6 = self;
  v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7;
}

- (BOOL)shouldDisplayPin
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  SLHighlightPillMetrics *v6;
  char v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 72);
  v6 = self;
  v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7 & 1;
}

- (const)chevronFontDescriptor
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  SLHighlightPillMetrics *v6;
  void *v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 184);
  v6 = self;
  v7 = (void *)v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return (const __CTFontDescriptor *)v7;
}

- (const)baseFont
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  SLHighlightPillMetrics *v6;
  void *v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightPillMetrics_metrics, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 152);
  v6 = self;
  v7 = (void *)v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return (const __CTFont *)v7;
}

@end
