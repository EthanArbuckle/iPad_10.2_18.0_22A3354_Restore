@implementation SLHighlightDisambiguationCell

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (SLHighlightDisambiguationCell)initWithFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SLHighlightDisambiguationCell;
  return -[SLHighlightDisambiguationCell initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)updateWithAttribution:(id)a3
{
  SLAttribution *v5;
  SLHighlightDisambiguationPillView *expandedAttributionView;
  SLHighlightDisambiguationPillView *v7;
  SLHighlightDisambiguationPillView *v8;
  void *v9;
  SLAttribution *v10;

  v5 = (SLAttribution *)a3;
  if (self->_attribution != v5)
  {
    v10 = v5;
    objc_storeStrong((id *)&self->_attribution, a3);
    expandedAttributionView = self->_expandedAttributionView;
    if (expandedAttributionView)
      -[SLHighlightDisambiguationPillView removeFromSuperview](expandedAttributionView, "removeFromSuperview");
    v7 = -[SLHighlightDisambiguationPillView initWithAttribution:]([SLHighlightDisambiguationPillView alloc], "initWithAttribution:", v10);
    v8 = self->_expandedAttributionView;
    self->_expandedAttributionView = v7;

    -[SLHighlightDisambiguationCell expandedAttributionView](self, "expandedAttributionView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightDisambiguationCell addSubview:](self, "addSubview:", v9);

    -[SLHighlightDisambiguationCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SLHighlightDisambiguationCell;
  -[SLHighlightDisambiguationCell layoutSubviews](&v3, sel_layoutSubviews);
  -[SLHighlightDisambiguationCell bounds](self, "bounds");
  -[SLHighlightDisambiguationPillView setFrame:](self->_expandedAttributionView, "setFrame:");
}

- (void)prepareForReuse
{
  SLAttribution *attribution;
  SLHighlightDisambiguationPillView *expandedAttributionView;
  SLHighlightDisambiguationPillView *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SLHighlightDisambiguationCell;
  -[SLHighlightDisambiguationCell prepareForReuse](&v6, sel_prepareForReuse);
  attribution = self->_attribution;
  self->_attribution = 0;

  expandedAttributionView = self->_expandedAttributionView;
  if (expandedAttributionView)
  {
    -[SLHighlightDisambiguationPillView removeFromSuperview](expandedAttributionView, "removeFromSuperview");
    v5 = self->_expandedAttributionView;
    self->_expandedAttributionView = 0;

  }
}

- (SLAttribution)attribution
{
  return self->_attribution;
}

- (SLHighlightDisambiguationPillView)expandedAttributionView
{
  return self->_expandedAttributionView;
}

- (void)setExpandedAttributionView:(id)a3
{
  objc_storeStrong((id *)&self->_expandedAttributionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedAttributionView, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
}

@end
