@implementation _PUOneUpCropUIButton

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PUOneUpCropUIButton;
  -[_PUOneUpCropUIButton contextMenuInteraction:willDisplayMenuForConfiguration:animator:](&v7, sel_contextMenuInteraction_willDisplayMenuForConfiguration_animator_, a3, a4, a5);
  -[_PUOneUpCropUIButton delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oneUpCropUIButton:menuPresentedDidChange:", self, 1);

}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_PUOneUpCropUIButton;
  -[_PUOneUpCropUIButton contextMenuInteraction:willEndForConfiguration:animator:](&v7, sel_contextMenuInteraction_willEndForConfiguration_animator_, a3, a4, a5);
  -[_PUOneUpCropUIButton delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oneUpCropUIButton:menuPresentedDidChange:", self, 0);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PUOneUpCropUIButton;
  -[_PUOneUpCropUIButton touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[_PUOneUpCropUIButton setBeingTouched:](self, "setBeingTouched:", 1);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PUOneUpCropUIButton;
  -[_PUOneUpCropUIButton touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[_PUOneUpCropUIButton setBeingTouched:](self, "setBeingTouched:", 0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PUOneUpCropUIButton;
  -[_PUOneUpCropUIButton touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[_PUOneUpCropUIButton setBeingTouched:](self, "setBeingTouched:", 0);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  BOOL v7;
  uint64_t v8;
  objc_super v13;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)_PUOneUpCropUIButton;
  v7 = -[_PUOneUpCropUIButton pointInside:withEvent:](&v13, sel_pointInside_withEvent_, a4);
  -[_PUOneUpCropUIButton bounds](self, "bounds");
  if (!CGRectIsEmpty(v15))
  {
    PXEdgeInsetsInvert();
    PXEdgeInsetsInsetRect();
    if (v7)
    {
      return 1;
    }
    else
    {
      v14.x = x;
      v14.y = y;
      return CGRectContainsPoint(*(CGRect *)&v8, v14);
    }
  }
  return v7;
}

- (_PUOneUpCropUIButtonDelegate)delegate
{
  return (_PUOneUpCropUIButtonDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isBeingTouched
{
  return self->_beingTouched;
}

- (void)setBeingTouched:(BOOL)a3
{
  self->_beingTouched = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
