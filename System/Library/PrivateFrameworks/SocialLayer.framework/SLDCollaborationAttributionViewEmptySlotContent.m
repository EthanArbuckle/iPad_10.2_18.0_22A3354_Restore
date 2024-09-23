@implementation SLDCollaborationAttributionViewEmptySlotContent

- (SLDCollaborationAttributionViewEmptySlotContent)initWithStyle:(id)a3 variant:(int64_t)a4 maxWidth:(double)a5 placeholderGlyphConfig:(id)a6 forRemote:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  SLDCollaborationAttributionViewEmptySlotContent *v14;
  SLDCollaborationAttributionViewEmptySlotContent *v15;
  void *v16;
  SLCollaborationAttributionViewMetricsProvider *v17;
  objc_super v19;

  v7 = a7;
  v12 = a3;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SLDCollaborationAttributionViewEmptySlotContent;
  v14 = -[SLDEmptySlotContent initWithStyle:forRemote:](&v19, sel_initWithStyle_forRemote_, v12, v7);
  v15 = v14;
  if (v14)
  {
    -[SLDEmptySlotContent style](v14, "style");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = -[SLCollaborationAttributionViewMetricsProvider initWithVariant:slotStyle:maxWidth:placeholderGlyphConfig:]([SLCollaborationAttributionViewMetricsProvider alloc], "initWithVariant:slotStyle:maxWidth:placeholderGlyphConfig:", a4, v12, v13, a5);
      -[SLCollaborationAttributionViewMetricsProvider drawingSize](v17, "drawingSize");
      -[SLDEmptySlotContent setContentSize:](v15, "setContentSize:");

    }
  }

  return v15;
}

@end
