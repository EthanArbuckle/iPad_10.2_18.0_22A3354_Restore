@implementation PKCellAccessoryLoadingIndicator

+ (id)accessory
{
  PKCellAccessoryLoadingIndicator *v2;
  PKCellAccessoryLoadingIndicator *v3;
  void *v4;

  v2 = [PKCellAccessoryLoadingIndicator alloc];
  v3 = -[PKCellAccessoryLoadingIndicator initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v3, 1);

  return v4;
}

- (PKCellAccessoryLoadingIndicator)initWithFrame:(CGRect)a3
{
  PKCellAccessoryLoadingIndicator *v3;
  uint64_t v4;
  UIActivityIndicatorView *loadingIndicator;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKCellAccessoryLoadingIndicator;
  v3 = -[PKCellAccessoryLoadingIndicator initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    loadingIndicator = v3->_loadingIndicator;
    v3->_loadingIndicator = (UIActivityIndicatorView *)v4;

    -[UIActivityIndicatorView startAnimating](v3->_loadingIndicator, "startAnimating");
    -[PKCellAccessoryLoadingIndicator addSubview:](v3, "addSubview:", v3->_loadingIndicator);
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIActivityIndicatorView sizeThatFits:](self->_loadingIndicator, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[PKCellAccessoryLoadingIndicator bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIActivityIndicatorView sizeToFit](self->_loadingIndicator, "sizeToFit");
  -[UIActivityIndicatorView frame](self->_loadingIndicator, "frame");
  -[UIActivityIndicatorView setFrame:](self->_loadingIndicator, "setFrame:", v4 - v7, (v6 - v8) * 0.5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
}

@end
