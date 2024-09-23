@implementation PXTitleSubtitleUILabelTile

- (PXTitleSubtitleUILabelTile)init
{
  PXTitleSubtitleUILabelTile *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXTitleSubtitleUILabelTile;
  result = -[PXTitleSubtitleUILabelTile init](&v3, sel_init);
  if (result)
    result->_rendersTextAsynchronously = 1;
  return result;
}

- (void)performBatchUpdates:(id)a3
{
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  -[PXTitleSubtitleUILabelTile _updateLabelTitleAndSubtitle](self, "_updateLabelTitleAndSubtitle");
}

- (void)setRendersTextAsynchronously:(BOOL)a3
{
  if (self->_rendersTextAsynchronously != a3)
  {
    self->_rendersTextAsynchronously = a3;
    -[PXTitleSubtitleUILabel setRendersTextAsynchronously:](self->_label, "setRendersTextAsynchronously:");
  }
}

- (double)lastBaseline
{
  double result;

  -[PXTitleSubtitleUILabel lastBaseline](self->_label, "lastBaseline");
  return result;
}

- (void)_updateLabelTitleAndSubtitle
{
  void *v3;
  id v4;

  -[PXTitleSubtitleUILabelTile title](self, "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXTitleSubtitleUILabelTile subtitle](self, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTitleSubtitleUILabel setTitleText:](self->_label, "setTitleText:", v4);
  -[PXTitleSubtitleUILabel setSubtitleText:](self->_label, "setSubtitleText:", v3);

}

- (void)_setAnimationCount:(int64_t)a3
{
  if (self->__animationCount != a3)
  {
    self->__animationCount = a3;
    -[PXTitleSubtitleUILabel setShouldRasterizeTextLayer:](self->_label, "setShouldRasterizeTextLayer:", a3 > 0);
  }
}

- (UIView)view
{
  UIView *view;
  UIView *v4;
  UIView *v5;
  PXTitleSubtitleUILabel *v6;
  PXTitleSubtitleUILabel *label;

  view = self->_view;
  if (!view)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
    v5 = self->_view;
    self->_view = v4;

    -[UIView setUserInteractionEnabled:](self->_view, "setUserInteractionEnabled:", 0);
    v6 = objc_alloc_init(PXTitleSubtitleUILabel);
    label = self->_label;
    self->_label = v6;

    -[PXTitleSubtitleUILabel setRendersTextAsynchronously:](self->_label, "setRendersTextAsynchronously:", -[PXTitleSubtitleUILabelTile rendersTextAsynchronously](self, "rendersTextAsynchronously"));
    -[PXTitleSubtitleUILabel setUserInteractionEnabled:](self->_label, "setUserInteractionEnabled:", 0);
    -[UIView addSubview:](self->_view, "addSubview:", self->_label);
    view = self->_view;
  }
  return view;
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  PXTitleSubtitleUILabel *label;
  UIView *view;
  id v7;
  PXTitleSubtitleLabelSpec *v8;
  PXTitleSubtitleLabelSpec *labelSpec;

  view = self->_view;
  label = self->_label;
  v7 = a4;
  -[UIView bounds](view, "bounds");
  -[PXTitleSubtitleUILabel setFrame:](label, "setFrame:");
  objc_msgSend(v7, "viewSpec");
  v8 = (PXTitleSubtitleLabelSpec *)objc_claimAutoreleasedReturnValue();

  -[PXTitleSubtitleUILabel setSpec:](self->_label, "setSpec:", v8);
  labelSpec = self->_labelSpec;
  self->_labelSpec = v8;

  -[PXTitleSubtitleUILabelTile _updateLabelTitleAndSubtitle](self, "_updateLabelTitleAndSubtitle");
}

- (void)becomeReusable
{
  id v3;

  -[PXTitleSubtitleUILabelTile setTitle:](self, "setTitle:", 0);
  -[PXTitleSubtitleUILabelTile setSubtitle:](self, "setSubtitle:", 0);
  -[PXTitleSubtitleUILabelTile view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

}

- (void)prepareForReuse
{
  id v2;

  -[PXTitleSubtitleUILabelTile view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 0);

}

- (void)willAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5
{
  -[PXTitleSubtitleUILabelTile _setAnimationCount:](self, "_setAnimationCount:", -[PXTitleSubtitleUILabelTile _animationCount](self, "_animationCount", a3, a4, a5) + 1);
}

- (void)didAnimateToGeometry:(PXTileGeometry *)a3 toUserData:(id)a4 withOptions:(id)a5
{
  -[PXTitleSubtitleUILabelTile _setAnimationCount:](self, "_setAnimationCount:", -[PXTitleSubtitleUILabelTile _animationCount](self, "_animationCount", a3, a4, a5) - 1);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PXTitleSubtitleLabelSpec)labelSpec
{
  return self->_labelSpec;
}

- (BOOL)rendersTextAsynchronously
{
  return self->_rendersTextAsynchronously;
}

- (int64_t)_animationCount
{
  return self->__animationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelSpec, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

@end
