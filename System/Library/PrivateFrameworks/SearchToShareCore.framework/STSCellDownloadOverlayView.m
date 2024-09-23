@implementation STSCellDownloadOverlayView

- (STSCellDownloadOverlayView)initWithFrame:(CGRect)a3
{
  STSCellDownloadOverlayView *v3;
  void *v4;
  STSRoundProgressView *v5;
  uint64_t v6;
  STSRoundProgressView *progressView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STSCellDownloadOverlayView;
  v3 = -[STSCellDownloadOverlayView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSCellDownloadOverlayView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = [STSRoundProgressView alloc];
    v6 = -[STSRoundProgressView initWithFrame:style:](v5, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    progressView = v3->_progressView;
    v3->_progressView = (STSRoundProgressView *)v6;

    -[STSCellDownloadOverlayView addSubview:](v3, "addSubview:", v3->_progressView);
  }
  return v3;
}

- (void)layoutSubviews
{
  -[STSCellDownloadOverlayView bounds](self, "bounds");
  UIRectCenteredIntegralRectScale();
  -[STSRoundProgressView setFrame:](self->_progressView, "setFrame:");
}

- (STSRoundProgressView)progressView
{
  return self->_progressView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end
