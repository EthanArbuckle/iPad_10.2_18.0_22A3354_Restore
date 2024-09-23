@implementation SLDHighlightDisambiguationPillEmptySlotContent

- (SLDHighlightDisambiguationPillEmptySlotContent)initWithStyle:(id)a3 variant:(unint64_t)a4 forRemote:(BOOL)a5
{
  SLDHighlightDisambiguationPillEmptySlotContent *v6;
  SLDHighlightDisambiguationPillEmptySlotContent *v7;
  void *v8;
  SLHighlightDisambiguationPillMetrics *v9;
  void *v10;
  SLHighlightDisambiguationPillMetrics *v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SLDHighlightDisambiguationPillEmptySlotContent;
  v6 = -[SLDEmptySlotContent initWithStyle:forRemote:](&v14, sel_initWithStyle_forRemote_, a3, a5);
  v7 = v6;
  if (v6)
  {
    -[SLDEmptySlotContent style](v6, "style");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = [SLHighlightDisambiguationPillMetrics alloc];
      -[SLDEmptySlotContent style](v7, "style");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[SLHighlightDisambiguationPillMetrics initWithSlotStyle:tag:variant:](v9, "initWithSlotStyle:tag:variant:", v10, 0, a4);

      -[SLHighlightDisambiguationPillMetrics pillHeight](v11, "pillHeight");
      -[SLDEmptySlotContent setContentSize:](v7, "setContentSize:", 0.0, v12);

    }
  }
  return v7;
}

@end
