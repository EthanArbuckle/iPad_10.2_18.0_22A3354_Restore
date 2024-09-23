@implementation PXCuratedLibraryLabel

- (void)setUserData:(id)a3
{
  id v4;
  PXCuratedLibraryLabelConfiguration *v5;
  PXCuratedLibraryLabelConfiguration *userData;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (PXCuratedLibraryLabelConfiguration *)objc_msgSend(v4, "copy");
  userData = self->_userData;
  self->_userData = v5;

  objc_msgSend(v4, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryLabel setText:](self, "setText:", v7);

  -[PXCuratedLibraryLabel setTextAlignment:](self, "setTextAlignment:", objc_msgSend(v4, "textAlignment"));
  +[PXCuratedLibraryOverlayButton defaultTitleFont](PXCuratedLibraryOverlayButton, "defaultTitleFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibraryLabel setFont:](self, "setFont:", v8);

  objc_msgSend(v4, "textColor");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibraryLabel setTextColor:](self, "setTextColor:", v9);
}

- (void)prepareForReuse
{
  -[PXCuratedLibraryLabel setUserData:](self, "setUserData:", 0);
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXCuratedLibraryLabelConfiguration)userData
{
  return self->_userData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
}

+ (CGSize)sizeThatFits:(CGSize)a3 withConfiguration:(id)a4
{
  double height;
  double width;
  uint64_t v6;
  id v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = sizeThatFits_withConfiguration__onceToken;
  v7 = a4;
  if (v6 != -1)
    dispatch_once(&sizeThatFits_withConfiguration__onceToken, &__block_literal_global_292825);
  objc_msgSend((id)sizeThatFits_withConfiguration__measuringLabel, "setUserData:", v7);

  objc_msgSend((id)sizeThatFits_withConfiguration__measuringLabel, "sizeThatFits:", width, height);
  v10 = ceil(v9);
  result.height = v8;
  result.width = v10;
  return result;
}

void __56__PXCuratedLibraryLabel_sizeThatFits_withConfiguration___block_invoke()
{
  PXCuratedLibraryLabel *v0;
  void *v1;

  v0 = objc_alloc_init(PXCuratedLibraryLabel);
  v1 = (void *)sizeThatFits_withConfiguration__measuringLabel;
  sizeThatFits_withConfiguration__measuringLabel = (uint64_t)v0;

}

@end
