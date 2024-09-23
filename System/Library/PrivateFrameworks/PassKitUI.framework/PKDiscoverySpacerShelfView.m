@implementation PKDiscoverySpacerShelfView

- (PKDiscoverySpacerShelfView)initWithShelf:(id)a3
{
  id v4;
  PKDiscoverySpacerShelfView *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKDiscoverySpacerShelfView;
  v5 = -[PKDiscoveryShelfView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v5)
    v5->_spacerType = objc_msgSend(v4, "spacerType");

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4A88], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((unint64_t)(self->_spacerType - 1) <= 3)
    objc_msgSend(v4, "lineHeight");
  PKSizeRoundToPixel();
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

@end
