@implementation PUFeedCell

- (void)dealloc
{
  objc_super v3;

  -[UITapGestureRecognizer setDelegate:](self->__tapGestureRecognizer, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PUFeedCell;
  -[PUFeedCell dealloc](&v3, sel_dealloc);
}

- (void)setTappable:(BOOL)a3
{
  if (self->_tappable != a3)
  {
    self->_tappable = a3;
    -[PUFeedCell _updateTapGestureRecognizer](self, "_updateTapGestureRecognizer");
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUFeedCell;
  -[PUFeedCell applyLayoutAttributes:](&v11, sel_applyLayoutAttributes_, v4);
  objc_msgSend(v4, "indexPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "representedElementKind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUFeedCell setIndexPath:](self, "setIndexPath:", v5);
  -[PUFeedCell setRepresentedElementKind:](self, "setRepresentedElementKind:", v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "edgeParallaxOffset");
    -[PUFeedCell setEdgeParallaxOffset:](self, "setEdgeParallaxOffset:");
    objc_msgSend(v4, "parallaxOffset");
    v8 = v7;
    v10 = v9;
  }
  else
  {
    v8 = *MEMORY[0x1E0C9D538];
    v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    -[PUFeedCell setEdgeParallaxOffset:](self, "setEdgeParallaxOffset:", *MEMORY[0x1E0C9D538], v10);
  }
  -[PUFeedCell setParallaxOffset:](self, "setParallaxOffset:", v8, v10);

}

- (void)_updateTapGestureRecognizer
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = -[PUFeedCell isTappable](self, "isTappable");
  -[PUFeedCell _tapGestureRecognizer](self, "_tapGestureRecognizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (!v4)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTap_);
      objc_msgSend(v5, "setDelegate:", self);
      -[PUFeedCell addGestureRecognizer:](self, "addGestureRecognizer:", v5);
      v7 = v5;
LABEL_6:
      -[PUFeedCell _setTapGestureRecognizer:](self, "_setTapGestureRecognizer:", v5);
      v4 = v7;
    }
  }
  else if (v4)
  {
    v7 = v4;
    objc_msgSend(v4, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeGestureRecognizer:", v7);

    v5 = 0;
    goto LABEL_6;
  }

}

- (void)_handleTap:(id)a3
{
  id v4;

  -[PUFeedCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "didTapFeedCell:", self);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[PUFeedCell _tapGestureRecognizer](self, "_tapGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
    return 1;
  -[PUFeedCell _tapGestureRecognizer](self, "_tapGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PUFeedCell shouldRecognizerTap:](self, "shouldRecognizerTap:", v7);

  return v8;
}

- (BOOL)shouldRecognizerTap:(id)a3
{
  return 1;
}

- (PUFeedCellDelegate)delegate
{
  return (PUFeedCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isTappable
{
  return self->_tappable;
}

- (CGPoint)parallaxOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_parallaxOffset.x;
  y = self->_parallaxOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setParallaxOffset:(CGPoint)a3
{
  self->_parallaxOffset = a3;
}

- (CGPoint)edgeParallaxOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_edgeParallaxOffset.x;
  y = self->_edgeParallaxOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setEdgeParallaxOffset:(CGPoint)a3
{
  self->_edgeParallaxOffset = a3;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)setIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_indexPath, a3);
}

- (NSString)representedElementKind
{
  return self->_representedElementKind;
}

- (void)setRepresentedElementKind:(id)a3
{
  objc_storeStrong((id *)&self->_representedElementKind, a3);
}

- (UITapGestureRecognizer)_tapGestureRecognizer
{
  return self->__tapGestureRecognizer;
}

- (void)_setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__tapGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_representedElementKind, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (CGRect)rectWithAspectRatio:(double)a3 fillingRect:(CGRect)a4 parallaxOffset:(CGPoint)a5 edgeParallaxOffset:(CGPoint)a6
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double height;
  CGRect result;

  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (a3 > 0.0)
  {
    x = PURectWithAspectRatioFillingRect(a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
    y = v9;
    width = v10;
    a4.size.height = v11;
  }
  v12 = x;
  v13 = y;
  v14 = width;
  height = a4.size.height;
  result.size.height = height;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

@end
