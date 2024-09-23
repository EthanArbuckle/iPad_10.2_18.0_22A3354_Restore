@implementation PXTilingLayout

- (PXTilingLayout)init
{
  PXTilingLayout *v2;
  PXTilingCoordinateSpace *v3;
  PXTilingCoordinateSpace *coordinateSpace;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXTilingLayout;
  v2 = -[PXTilingLayout init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXTilingCoordinateSpace);
    coordinateSpace = v2->_coordinateSpace;
    v2->_coordinateSpace = v3;

    v2->_coordinateSpaceIdentifier = -[PXTilingCoordinateSpace identifier](v2->_coordinateSpace, "identifier");
  }
  return v2;
}

- (CGRect)visibleRect
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
  CGRect result;

  -[PXTilingLayout visibleOrigin](self, "visibleOrigin");
  v4 = v3;
  v6 = v5;
  -[PXTilingLayout visibleSize](self, "visibleSize");
  v8 = v7;
  v10 = v9;
  v11 = v4;
  v12 = v6;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)contentBounds
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingLayout.m"), 39, CFSTR("must be implemented by concrete subclass"));

  v5 = *MEMORY[0x1E0C9D628];
  v6 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)scrollBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PXTilingLayout contentBounds](self, "contentBounds");
  -[PXTilingLayout contentInset](self, "contentInset");
  sub_1A7AE3F38();
  PXEdgeInsetsInsetRect();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)enumerateTilesInRect:(CGRect)a3 withOptions:(id)a4 usingBlock:(id)a5
{
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingLayout.m"), 51, CFSTR("must be implemented by concrete subclass"));

}

- (BOOL)getGeometry:(PXTileGeometry *)a3 group:(unint64_t *)a4 userData:(id *)a5 forTileWithIdentifier:(PXTileIdentifier *)a6
{
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTilingLayout.m"), 55, CFSTR("must be implemented by concrete subclass"));

  return 0;
}

- (void)invalidateLayout
{
  PXTilingLayoutInvalidationContext *v3;

  v3 = objc_alloc_init(PXTilingLayoutInvalidationContext);
  -[PXTilingLayoutInvalidationContext setTag:](v3, "setTag:", CFSTR("Generic Invalidate Everything"));
  -[PXTilingLayoutInvalidationContext invalidateEverything](v3, "invalidateEverything");
  -[PXTilingLayout invalidateLayoutWithContext:](self, "invalidateLayoutWithContext:", v3);

}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXTilingLayout observer](self, "observer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tilingLayout:invalidatedWithContext:", self, v4);

}

- (BOOL)allowHorizontalFlip
{
  return 1;
}

- (BOOL)shouldFlipHorizontally
{
  void *v3;
  int v4;

  if (objc_msgSend(MEMORY[0x1E0C99DC8], "px_currentCharacterDirection") == 2)
    return -[PXTilingLayout allowHorizontalFlip](self, "allowHorizontalFlip");
  +[PXTilingSettings sharedInstance](PXTilingSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "flipLayoutsHorizontally");

  return v4 && -[PXTilingLayout allowHorizontalFlip](self, "allowHorizontalFlip");
}

- (CGSize)referenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_referenceSize.width;
  height = self->_referenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setReferenceSize:(CGSize)a3
{
  self->_referenceSize = a3;
}

- (CGSize)visibleSize
{
  double width;
  double height;
  CGSize result;

  width = self->_visibleSize.width;
  height = self->_visibleSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setVisibleSize:(CGSize)a3
{
  self->_visibleSize = a3;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (CGPoint)visibleOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_visibleOrigin.x;
  y = self->_visibleOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setVisibleOrigin:(CGPoint)a3
{
  self->_visibleOrigin = a3;
}

- (PXScrollInfo)scrollInfo
{
  return self->_scrollInfo;
}

- (void)coordinateSpaceIdentifier
{
  return self->_coordinateSpaceIdentifier;
}

- (PXTilingLayoutObserver)observer
{
  return (PXTilingLayoutObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (PXTilingCoordinateSpace)coordinateSpace
{
  return self->_coordinateSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateSpace, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_scrollInfo, 0);
}

@end
