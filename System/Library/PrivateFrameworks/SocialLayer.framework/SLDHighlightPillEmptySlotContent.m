@implementation SLDHighlightPillEmptySlotContent

- (SLDHighlightPillEmptySlotContent)initWithStyle:(id)a3 variant:(unint64_t)a4 maxWidth:(double)a5 forRemote:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  SLDHighlightPillEmptySlotContent *v11;
  SLDHighlightPillEmptySlotContent *v12;
  void *v13;
  double v14;
  double v15;
  objc_super v17;

  v6 = a6;
  v10 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SLDHighlightPillEmptySlotContent;
  v11 = -[SLDEmptySlotContent initWithStyle:forRemote:](&v17, sel_initWithStyle_forRemote_, v10, v6);
  v12 = v11;
  if (v11)
  {
    -[SLDEmptySlotContent style](v11, "style");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      +[SLHighlightPillMetrics pillHeightWithStyle:variant:maxWidth:](SLHighlightPillMetrics, "pillHeightWithStyle:variant:maxWidth:", v10, a4, a5);
      v15 = v14;
      -[SLDHighlightPillEmptySlotContent setVariant:](v12, "setVariant:", a4);
      -[SLDHighlightPillEmptySlotContent setMaxWidth:](v12, "setMaxWidth:", a5);
      -[SLDEmptySlotContent setContentSize:](v12, "setContentSize:", 0.0, v15);
    }
  }

  return v12;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

@end
