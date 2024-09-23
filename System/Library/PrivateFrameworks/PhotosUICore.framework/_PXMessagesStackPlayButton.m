@implementation _PXMessagesStackPlayButton

- (_PXMessagesStackPlayButton)initWithFrame:(CGRect)a3
{
  _PXMessagesStackPlayButton *v3;
  UIView *v4;
  UIView *videoOverlayButton;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PXMessagesStackPlayButton;
  v3 = -[_PXMessagesStackPlayButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "px_videoOverlayButtonWithStyle:", 1);
    v4 = (UIView *)objc_claimAutoreleasedReturnValue();
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[_PXMessagesStackPlayButton addSubview:](v3, "addSubview:", v4);
    videoOverlayButton = v3->_videoOverlayButton;
    v3->_videoOverlayButton = v4;

  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PXMessagesStackPlayButton;
  -[_PXMessagesStackPlayButton layoutSubviews](&v3, sel_layoutSubviews);
  -[_PXMessagesStackPlayButton bounds](self, "bounds");
  PXRectGetCenter();
  PXRectWithCenterAndSize();
  -[UIView setFrame:](self->_videoOverlayButton, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoOverlayButton, 0);
}

@end
