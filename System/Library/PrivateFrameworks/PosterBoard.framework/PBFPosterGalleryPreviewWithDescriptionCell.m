@implementation PBFPosterGalleryPreviewWithDescriptionCell

- (void)prepareForReuse
{
  CGSize v3;
  CGPoint v4;
  CGSize v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PBFPosterGalleryPreviewWithDescriptionCell;
  -[PBFPosterGalleryPreviewWithDescriptionCell prepareForReuse](&v7, sel_prepareForReuse);
  v4 = (CGPoint)*MEMORY[0x1E0C9D648];
  v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v5 = (CGSize)*MEMORY[0x1E0C9D820];
  self->_metrics.posterDescriptionLabelFrame.size = v3;
  self->_metrics.intrinsicContentSize = v5;
  self->_metrics.posterViewFrame.size = v3;
  self->_metrics.posterDescriptionLabelFrame.origin = v4;
  self->_metrics.posterViewFrame.origin = v4;
  -[PBFPosterGalleryPreviewWithDescriptionCell posterPreviewView](self, "posterPreviewView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareForReuse");

}

- (void)didMoveToWindow
{
  PBFPosterGalleryViewSpec *spec;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBFPosterGalleryPreviewWithDescriptionCell;
  -[PBFPosterGalleryPreviewWithDescriptionCell didMoveToWindow](&v4, sel_didMoveToWindow);
  spec = self->_spec;
  self->_spec = 0;

}

- (BOOL)supportsPosterTitle
{
  return 1;
}

- (BOOL)supportsPosterDescription
{
  return 1;
}

- (void)updatePreviewType:(id)a3 scale:(double)a4 posterPreviewView:(id)a5 layoutOrientation:(int64_t)a6 index:(unint64_t)a7
{
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  v13 = a5;
  -[PBFPosterGalleryPreviewWithDescriptionCell posterPreviewView](self, "posterPreviewView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updatePreviewType:scale:posterPreviewView:layoutOrientation:index:", v15, v13, a6, a7, a4);

  if (*(_OWORD *)&self->_layoutOrientation != __PAIR128__((unint64_t)v15, a6))
  {
    self->_layoutOrientation = a6;
    objc_storeStrong((id *)&self->_previewType, a3);
    -[PBFPosterGalleryPreviewWithDescriptionCell invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[PBFPosterGalleryPreviewWithDescriptionCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (NSString)posterDescription
{
  void *v2;
  void *v3;

  -[PBFPosterGalleryPreviewWithDescriptionCell posterDescriptionLabel](self, "posterDescriptionLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPosterDescription:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  CGSize v7;
  CGPoint v8;
  CGSize v9;
  id v10;

  v10 = a3;
  -[PBFPosterGalleryPreviewWithDescriptionCell posterDescriptionLabel](self, "posterDescriptionLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v10);

  if ((v5 & 1) == 0)
  {
    -[PBFPosterGalleryPreviewWithDescriptionCell posterDescriptionLabel](self, "posterDescriptionLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v10);

    v8 = (CGPoint)*MEMORY[0x1E0C9D648];
    v7 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v9 = (CGSize)*MEMORY[0x1E0C9D820];
    self->_metrics.posterDescriptionLabelFrame.size = v7;
    self->_metrics.intrinsicContentSize = v9;
    self->_metrics.posterViewFrame.size = v7;
    self->_metrics.posterDescriptionLabelFrame.origin = v8;
    self->_metrics.posterViewFrame.origin = v8;
    -[PBFPosterGalleryPreviewWithDescriptionCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (id)posterDescriptionLabel
{
  UILabel *posterDescriptionLabel;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  void *v11;
  void *v12;

  posterDescriptionLabel = self->_posterDescriptionLabel;
  if (!posterDescriptionLabel)
  {
    v4 = (UILabel *)objc_opt_new();
    v5 = self->_posterDescriptionLabel;
    self->_posterDescriptionLabel = v4;

    -[UILabel setNumberOfLines:](self->_posterDescriptionLabel, "setNumberOfLines:", 0);
    v6 = self->_posterDescriptionLabel;
    -[PBFPosterGalleryPreviewWithDescriptionCell spec](self, "spec");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "previewCellDescriptionLabelFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v8);

    v9 = self->_posterDescriptionLabel;
    -[PBFPosterGalleryPreviewWithDescriptionCell spec](self, "spec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "previewCellDescriptionLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v9, "setTextColor:", v11);

    -[UILabel setTextAlignment:](self->_posterDescriptionLabel, "setTextAlignment:", 4);
    -[PBFPosterGalleryPreviewWithDescriptionCell contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", self->_posterDescriptionLabel);

    -[PBFPosterGalleryPreviewWithDescriptionCell setNeedsLayout](self, "setNeedsLayout");
    posterDescriptionLabel = self->_posterDescriptionLabel;
  }
  return posterDescriptionLabel;
}

- (id)pbf_displayContext
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBFPosterGalleryPreviewWithDescriptionCell;
  -[UIView pbf_displayContext](&v6, sel_pbf_displayContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayContextWithUpdatedInterfaceOrientation:", self->_layoutOrientation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PBFPosterGalleryPreviewView)posterPreviewView
{
  PBFPosterGalleryPreviewView *posterPreviewView;
  PBFPosterGalleryPreviewView *v4;
  PBFPosterGalleryPreviewView *v5;
  void *v6;
  void *v7;

  posterPreviewView = self->_posterPreviewView;
  if (!posterPreviewView)
  {
    v4 = (PBFPosterGalleryPreviewView *)objc_opt_new();
    v5 = self->_posterPreviewView;
    self->_posterPreviewView = v4;

    -[PBFPosterGalleryPreviewView sizeToFit](self->_posterPreviewView, "sizeToFit");
    -[PBFPosterGalleryPreviewWithDescriptionCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", self->_posterPreviewView);

    -[PBFPosterGalleryPreviewWithDescriptionCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendSubviewToBack:", self->_posterPreviewView);

    posterPreviewView = self->_posterPreviewView;
  }
  return posterPreviewView;
}

- (id)spec
{
  PBFPosterGalleryViewSpec *spec;
  void *v4;
  void *v5;
  PBFPosterGalleryViewSpec *v6;
  PBFPosterGalleryViewSpec *v7;

  spec = self->_spec;
  if (!spec)
  {
    -[PBFPosterGalleryPreviewWithDescriptionCell window](self, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PBFPosterGalleryViewSpec specForScreen:](PBFPosterGalleryViewSpec, "specForScreen:", v5);
    v6 = (PBFPosterGalleryViewSpec *)objc_claimAutoreleasedReturnValue();
    v7 = self->_spec;
    self->_spec = v6;

    spec = self->_spec;
  }
  return spec;
}

- ($91384402D6A983DE6D4FF1F0AF3B9FB7)metrics
{
  CGSize *p_size;
  CGSize var2;
  CGPoint origin;
  $91384402D6A983DE6D4FF1F0AF3B9FB7 *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGSize v30;
  CGSize v31;
  double v32;
  id v33;
  CGRect v34;
  CGRect v35;

  p_size = &self[8].var0.size;
  if (self[9].var0.origin.x == *MEMORY[0x1E0C9D820] && self[9].var0.origin.y == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v8 = self;
    -[$91384402D6A983DE6D4FF1F0AF3B9FB7 spec](self, "spec");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    -[$91384402D6A983DE6D4FF1F0AF3B9FB7 bounds](v8, "bounds");
    v10 = v9;
    -[$91384402D6A983DE6D4FF1F0AF3B9FB7 traitCollection](v8, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayScale");

    v12 = -[$91384402D6A983DE6D4FF1F0AF3B9FB7 effectiveUserInterfaceLayoutDirection](v8, "effectiveUserInterfaceLayoutDirection");
    objc_msgSend(v33, "standardSpacing");
    v14 = v13;
    objc_msgSend(v33, "posterContentSizeForOrientation:", *(_QWORD *)&v8[9].var0.size.height);
    v16 = v15;
    v18 = v17;
    v19 = v10 - v15;
    if (v12)
      v20 = v10 - v15;
    else
      v20 = 0.0;
    v32 = v20;
    objc_msgSend(*(id *)&v8[8].var0.origin.y, "sizeThatFits:", v10 - (v14 + v16), 1000.0);
    v23 = v22;
    if (v21 >= v18)
      v24 = v18;
    else
      v24 = v21;
    if (v12)
    {
      v34.origin.y = 0.0;
      v34.origin.x = v19;
      v34.size.width = v16;
      v34.size.height = v18;
      v25 = CGRectGetMinX(v34) - v14 - v23;
    }
    else
    {
      v35.origin.x = 0.0;
      v35.origin.y = 0.0;
      v35.size.width = v16;
      v35.size.height = v18;
      v25 = v14 + CGRectGetMaxX(v35);
    }
    p_size->width = v32;
    p_size->height = 0.0;
    p_size[1].width = v16;
    p_size[1].height = v18;
    p_size[3].width = v23;
    p_size[3].height = v24;
    p_size[2].width = v25;
    UIRectCenteredYInRectScale();
    p_size[2].width = v26;
    p_size[2].height = v27;
    p_size[3].width = v28;
    p_size[3].height = v29;
    p_size[4].width = v14 + v16 + v23;
    p_size[4].height = v18;
    v30 = p_size[1];
    retstr->var0.origin = (CGPoint)*p_size;
    retstr->var0.size = v30;
    v31 = p_size[3];
    retstr->var1.origin = (CGPoint)p_size[2];
    retstr->var1.size = v31;
    retstr->var2 = p_size[4];

  }
  else
  {
    var2 = self[8].var2;
    retstr->var1.origin = (CGPoint)self[8].var1.size;
    retstr->var1.size = var2;
    retstr->var2 = (CGSize)self[9].var0.origin;
    origin = self[8].var1.origin;
    retstr->var0.origin = (CGPoint)*p_size;
    retstr->var0.size = (CGSize)origin;
  }
  return self;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;
  CGRect v6;
  CGRect v7;
  CGRect v8;
  CGRect v9;

  v5.receiver = self;
  v5.super_class = (Class)PBFPosterGalleryPreviewWithDescriptionCell;
  -[PBFPosterGalleryPreviewWithDescriptionCell layoutSubviews](&v5, sel_layoutSubviews);
  -[PBFPosterGalleryPreviewWithDescriptionCell metrics](self, "metrics");
  -[PBFPosterGalleryPreviewWithDescriptionCell posterDescriptionLabel](self, "posterDescriptionLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterGalleryPreviewWithDescriptionCell posterPreviewView](self, "posterPreviewView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = 0.0;
  v8.size.height = 0.0;
  if (!CGRectEqualToRect(v6, v8))
    objc_msgSend(v4, "setFrame:", 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v3, "frame");
  v9.origin = 0u;
  v9.size = 0u;
  if (!CGRectEqualToRect(v7, v9))
    objc_msgSend(v3, "setFrame:", 0.0, 0.0, 0.0, 0.0);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[PBFPosterGalleryPreviewWithDescriptionCell metrics](self, "metrics");
  v2 = v4;
  v3 = v5;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  CGPoint v2;
  CGSize v3;
  CGSize v4;
  objc_super v5;

  v2 = (CGPoint)*MEMORY[0x1E0C9D648];
  v3 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v4 = (CGSize)*MEMORY[0x1E0C9D820];
  self->_metrics.posterDescriptionLabelFrame.size = v3;
  self->_metrics.intrinsicContentSize = v4;
  self->_metrics.posterViewFrame.size = v3;
  self->_metrics.posterDescriptionLabelFrame.origin = v2;
  self->_metrics.posterViewFrame.origin = v2;
  v5.receiver = self;
  v5.super_class = (Class)PBFPosterGalleryPreviewWithDescriptionCell;
  -[PBFPosterGalleryPreviewWithDescriptionCell invalidateIntrinsicContentSize](&v5, sel_invalidateIntrinsicContentSize);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_posterDescription, 0);
  objc_storeStrong((id *)&self->_posterPreviewView, 0);
  objc_storeStrong((id *)&self->_previewType, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_posterDescriptionLabel, 0);
}

@end
