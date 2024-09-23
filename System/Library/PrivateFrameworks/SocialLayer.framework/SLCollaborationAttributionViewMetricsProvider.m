@implementation SLCollaborationAttributionViewMetricsProvider

- (SLCollaborationAttributionViewMetricsProvider)initWithSlotStyle:(id)a3 tag:(id)a4
{
  id v6;
  id v7;
  id v8;
  double v9;
  double v10;
  id v11;
  SLCollaborationAttributionViewMetricsProvider *v12;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, sel_variant);
  objc_msgSend(v7, sel_maxWidth);
  v10 = v9;
  v11 = objc_msgSend(v7, sel_placeholderGlyphConfiguration);
  v12 = -[SLCollaborationAttributionViewMetricsProvider initWithVariant:slotStyle:maxWidth:placeholderGlyphConfig:](self, sel_initWithVariant_slotStyle_maxWidth_placeholderGlyphConfig_, v8, v6, v11, v10);

  return v12;
}

- (SLCollaborationAttributionViewMetricsProvider)initWithVariant:(int64_t)a3 slotStyle:(id)a4 maxWidth:(double)a5 placeholderGlyphConfig:(id)a6
{
  return (SLCollaborationAttributionViewMetricsProvider *)CollaborationAttributionViewMetricsProvider.init(variant:slotStyle:maxWidth:placeholderGlyphConfig:)(a3, (uint64_t)a4, (uint64_t)a6, a5);
}

- (SLCollaborationAttributionViewMetricsProvider)init
{
  SLCollaborationAttributionViewMetricsProvider *result;

  result = (SLCollaborationAttributionViewMetricsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics);
}

- (CGSize)drawingSize
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double (*v7)(uint64_t, uint64_t);
  SLCollaborationAttributionViewMetricsProvider *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(_QWORD *)(v5 + 8);
  v7 = *(double (**)(uint64_t, uint64_t))(v6 + 24);
  v8 = self;
  v9 = v7(v4, v6);
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (double)avatarDiameter
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  double (*v6)(uint64_t, uint64_t);
  SLCollaborationAttributionViewMetricsProvider *v7;
  double v8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(double (**)(uint64_t, uint64_t))(v5 + 32);
  v7 = self;
  v8 = v6(v4, v5);

  return v8;
}

- (double)avatarLabelSpace
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  double (*v6)(uint64_t, uint64_t);
  SLCollaborationAttributionViewMetricsProvider *v7;
  double v8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(double (**)(uint64_t, uint64_t))(v5 + 48);
  v7 = self;
  v8 = v6(v4, v5);

  return v8;
}

- (double)titleSubtitleSpace
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  double (*v6)(uint64_t, uint64_t);
  SLCollaborationAttributionViewMetricsProvider *v7;
  double v8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SLCollaborationAttributionViewMetricsProvider_metrics);
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(double (**)(uint64_t, uint64_t))(v5 + 56);
  v7 = self;
  v8 = v6(v4, v5);

  return v8;
}

- (const)singleLineTitleForString:(id)a3
{
  return (const __CTLine *)@objc CollaborationAttributionViewMetricsProvider.singleLineTitle(for:)((char *)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t))static CollaborationAttributionViewMetricsProvider.singleLineTitle<A>(for:metrics:));
}

- (const)singleLineSubtitleForString:(id)a3
{
  return (const __CTLine *)@objc CollaborationAttributionViewMetricsProvider.singleLineTitle(for:)((char *)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t))static CollaborationAttributionViewMetricsProvider.singleLineSubtitle<A>(for:metrics:));
}

@end
