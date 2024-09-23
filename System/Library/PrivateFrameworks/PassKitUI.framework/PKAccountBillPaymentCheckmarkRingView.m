@implementation PKAccountBillPaymentCheckmarkRingView

- (PKAccountBillPaymentCheckmarkRingView)initWithRingView:(id)a3
{
  id v5;
  PKAccountBillPaymentCheckmarkRingView *v6;
  PKAccountBillPaymentCheckmarkRingView *v7;
  LAUICheckmarkLayer *v8;
  LAUICheckmarkLayer *checkmarkLayer;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAccountBillPaymentCheckmarkRingView;
  v6 = -[PKAccountBillPaymentCheckmarkRingView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ringView, a3);
    -[PKAccountBillPaymentCheckmarkRingView addSubview:](v7, "addSubview:", v7->_ringView);
    v8 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x1E0D44440]);
    checkmarkLayer = v7->_checkmarkLayer;
    v7->_checkmarkLayer = v8;

    -[LAUICheckmarkLayer setLineWidthScale:](v7->_checkmarkLayer, "setLineWidthScale:", 1.4);
    -[LAUICheckmarkLayer setRevealed:animated:](v7->_checkmarkLayer, "setRevealed:animated:", 0, 0);
    -[PKAccountBillPaymentCheckmarkRingView layer](v7, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSublayer:", v7->_checkmarkLayer);

  }
  return v7;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  PKBillPaymentRingView *ringView;
  PKBillPaymentRingView *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  CATransform3D v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PKAccountBillPaymentCheckmarkRingView;
  -[PKAccountBillPaymentCheckmarkRingView layoutSubviews](&v23, sel_layoutSubviews);
  -[PKAccountBillPaymentCheckmarkRingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[PKBillPaymentRingView sizeThatFits:](self->_ringView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v8 = v7;
  v10 = v9;
  -[PKBillPaymentRingView setBounds:](self->_ringView, "setBounds:", v4, v6, v7, v9);
  PKSizeScaleAspectFit();
  v12 = v11;
  v14 = v13;
  ringView = self->_ringView;
  CATransform3DMakeScale(&v22, v11 / v8, v13 / v10, 1.0);
  -[PKBillPaymentRingView setTransform3D:](ringView, "setTransform3D:", &v22);
  v16 = self->_ringView;
  v17 = *MEMORY[0x1E0C9D538];
  v18 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PKBillPaymentRingView layer](v16, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "anchorPoint");
  -[PKBillPaymentRingView setPosition:](v16, "setPosition:", v17 + v20 * v12, v18 + v21 * v14);

  -[LAUICheckmarkLayer aspectSize](self->_checkmarkLayer, "aspectSize");
  PKSizeScaleAspectFit();
  PKSizeAlignedInRect();
  -[LAUICheckmarkLayer setFrame:](self->_checkmarkLayer, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKBillPaymentRingView sizeThatFits:](self->_ringView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  PKSizeScaleAspectFit();
  result.height = v4;
  result.width = v3;
  return result;
}

- (PKBillPaymentRingView)ringView
{
  return self->_ringView;
}

- (void)setRingView:(id)a3
{
  objc_storeStrong((id *)&self->_ringView, a3);
}

- (LAUICheckmarkLayer)checkmarkLayer
{
  return self->_checkmarkLayer;
}

- (void)setCheckmarkLayer:(id)a3
{
  objc_storeStrong((id *)&self->_checkmarkLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkLayer, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
}

@end
