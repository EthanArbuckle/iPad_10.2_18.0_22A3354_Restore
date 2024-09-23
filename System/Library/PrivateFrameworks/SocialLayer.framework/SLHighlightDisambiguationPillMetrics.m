@implementation SLHighlightDisambiguationPillMetrics

- (SLHighlightDisambiguationPillMetrics)initWithSlotStyle:(id)a3 tag:(id)a4
{
  id v6;
  id v7;
  SLHighlightDisambiguationPillMetrics *v8;

  v6 = a3;
  v7 = a4;
  v8 = -[SLHighlightDisambiguationPillMetrics initWithSlotStyle:tag:variant:](self, sel_initWithSlotStyle_tag_variant_, v6, v7, objc_msgSend(v7, sel_variant));

  return v8;
}

- (SLHighlightDisambiguationPillMetrics)initWithSlotStyle:(id)a3 tag:(id)a4 variant:(unint64_t)a5
{
  return (SLHighlightDisambiguationPillMetrics *)DisambiguationPillMetrics.init(slotStyle:tag:variant:)((uint64_t)a3, (uint64_t)a4, a5);
}

+ (id)accessibilityLabelFor:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  Swift::String v10;
  void *v11;

  v3 = a3;
  v4 = specialized static DisambiguationPillMetrics.firstLineString(for:)(v3);
  v6 = v5;
  v7 = specialized static DisambiguationPillMetrics.secondLineString(for:)(v3);
  v9 = v8;
  swift_bridgeObjectRetain();
  v10._countAndFlagsBits = (uint64_t)v7;
  v10._object = v9;
  String.append(_:)(v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = (void *)MEMORY[0x19AEC3B6C](v4, v6);
  swift_bridgeObjectRelease();
  return v11;
}

- (SLHighlightDisambiguationPillMetrics)init
{
  SLHighlightDisambiguationPillMetrics *result;

  result = (SLHighlightDisambiguationPillMetrics *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics);
}

- (NSEdgeInsets)margins
{
  SLHighlightDisambiguationPillMetrics *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  __int128 v7;
  double v8;
  double v9;
  NSEdgeInsets result;

  v2 = self;
  DisambiguationPillMetrics.pillMetrics.getter(&v7);

  v4 = *((double *)&v7 + 1);
  v3 = *(double *)&v7;
  v5 = v8;
  v6 = v9;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)pillHeight
{
  SLHighlightDisambiguationPillMetrics *v2;
  double v3;

  v2 = self;
  v3 = DisambiguationPillMetrics.pillHeight.getter();

  return v3;
}

- (CGSize)pillSize
{
  SLHighlightDisambiguationPillMetrics *v2;
  double v3;
  double v4;
  __int128 v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  DisambiguationPillMetrics.pillMetrics.getter(&v5);

  v3 = v6;
  v4 = v7;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)avatarDiameter
{
  SLHighlightDisambiguationPillMetrics *v2;
  _OWORD v4[3];
  double v5;

  v2 = self;
  DisambiguationPillMetrics.pillMetrics.getter(v4);

  return v5;
}

- (BOOL)useSingleLineLayout
{
  SLHighlightDisambiguationPillMetrics *v2;
  _OWORD v4[3];
  BOOL v5;

  v2 = self;
  DisambiguationPillMetrics.pillMetrics.getter(v4);

  return v5;
}

- (BOOL)useChevron
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  SLHighlightDisambiguationPillMetrics *v6;
  char v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 32);
  v6 = self;
  v7 = v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return v7 & 1;
}

- (CGImage)chevronImage
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  SLHighlightDisambiguationPillMetrics *v6;
  void *v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 152);
  v6 = self;
  v7 = (void *)v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return (CGImage *)v7;
}

- (CGSize)chevronSize
{
  SLHighlightDisambiguationPillMetrics *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = DisambiguationPillMetrics.chevronSize.getter();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (double)chevronLeadingMargin
{
  SLHighlightDisambiguationPillMetrics *v2;
  double v3;

  v2 = self;
  v3 = DisambiguationPillMetrics.chevronLeadingMargin.getter();

  return v3;
}

- (NSEdgeInsets)labelHorizontalMargins
{
  SLHighlightDisambiguationPillMetrics *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  _OWORD v7[4];
  double v8;
  double v9;
  double v10;
  double v11;
  NSEdgeInsets result;

  v2 = self;
  DisambiguationPillMetrics.pillMetrics.getter(v7);

  v3 = v8;
  v4 = v9;
  v5 = v10;
  v6 = v11;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (const)lineFrom:(id)a3 maxWidth:(double)a4
{
  const __CFAttributedString *v5;
  SLHighlightDisambiguationPillMetrics *v6;
  CTLineRef v7;
  uint64_t TruncatedLineWithTokenHandler;
  void *v9;
  const __CTLine *result;

  v5 = (const __CFAttributedString *)a3;
  v6 = self;
  v7 = CTLineCreateWithAttributedString(v5);
  TruncatedLineWithTokenHandler = CTLineCreateTruncatedLineWithTokenHandler();
  if (TruncatedLineWithTokenHandler)
  {
    v9 = (void *)TruncatedLineWithTokenHandler;

    return (const __CTLine *)v9;
  }
  else
  {
    result = (const __CTLine *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

- (CGSize)firstLineSize
{
  SLHighlightDisambiguationPillMetrics *v2;
  double v3;
  double v4;
  _OWORD v5[6];
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  DisambiguationPillMetrics.pillMetrics.getter(v5);

  v3 = v6;
  v4 = v7;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGColor)firstLineColor
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  SLHighlightDisambiguationPillMetrics *v6;
  void *v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 64);
  v6 = self;
  v7 = (void *)v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return (CGColor *)v7;
}

- (const)firstLineFont
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  SLHighlightDisambiguationPillMetrics *v6;
  void *v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 72);
  v6 = self;
  v7 = (void *)v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return (const __CTFont *)v7;
}

- (NSMutableAttributedString)firstLineAttributedString
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  SLHighlightDisambiguationPillMetrics *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];

  v3 = (char *)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics;
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v15);
  v4 = v15[4];
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)v3, (uint64_t)v12);
  v5 = v13;
  v6 = v14;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 80);
  v8 = self;
  v9 = v7(v5, v6);
  v10 = (void *)(*(uint64_t (**)(uint64_t))(v4 + 192))(v9);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);

  return (NSMutableAttributedString *)v10;
}

- (CGColor)secondLineColor
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  SLHighlightDisambiguationPillMetrics *v6;
  void *v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 88);
  v6 = self;
  v7 = (void *)v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return (CGColor *)v7;
}

- (const)secondLineFont
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  SLHighlightDisambiguationPillMetrics *v6;
  void *v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v9);
  v3 = v10;
  v4 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 96);
  v6 = self;
  v7 = (void *)v5(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

  return (const __CTFont *)v7;
}

- (CGSize)secondLineSize
{
  SLHighlightDisambiguationPillMetrics *v2;
  double v3;
  double v4;
  _OWORD v5[7];
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  DisambiguationPillMetrics.pillMetrics.getter(v5);

  v3 = v6;
  v4 = v7;
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSMutableAttributedString)secondLineAttributedString
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  SLHighlightDisambiguationPillMetrics *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];

  v3 = (char *)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics;
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)self + OBJC_IVAR___SLHighlightDisambiguationPillMetrics_metrics, (uint64_t)v15);
  v4 = v15[4];
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  outlined init with copy of HighlightDisambiguationPillMetricVariant((uint64_t)v3, (uint64_t)v12);
  v5 = v13;
  v6 = v14;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  v7 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 104);
  v8 = self;
  v9 = v7(v5, v6);
  v10 = (void *)(*(uint64_t (**)(uint64_t))(v4 + 200))(v9);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);

  return (NSMutableAttributedString *)v10;
}

+ (id)firstLineStringFor:(id)a3
{
  return @objc static DisambiguationPillMetrics.firstLineString(for:)((uint64_t)a1, (uint64_t)a2, a3, (uint64_t (*)(void))specialized static DisambiguationPillMetrics.firstLineString(for:));
}

+ (id)secondLineStringFor:(id)a3
{
  return @objc static DisambiguationPillMetrics.firstLineString(for:)((uint64_t)a1, (uint64_t)a2, a3, (uint64_t (*)(void))specialized static DisambiguationPillMetrics.secondLineString(for:));
}

@end
