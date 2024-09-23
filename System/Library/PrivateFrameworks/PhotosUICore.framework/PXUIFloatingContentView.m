@implementation PXUIFloatingContentView

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  PXUIFloatingContentView *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "nextFocusedView");
  v6 = (PXUIFloatingContentView *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = v6 == self;

  -[_UIFloatingContentView setControlState:withAnimationCoordinator:](self, "setControlState:withAnimationCoordinator:", 8 * a3, v7);
}

- (void)setContentsRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_contentsRect;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21 = *MEMORY[0x1E0C80C00];
  p_contentsRect = &self->_contentsRect;
  if (!CGRectEqualToRect(self->_contentsRect, a3))
  {
    p_contentsRect->origin.x = x;
    p_contentsRect->origin.y = y;
    p_contentsRect->size.width = width;
    p_contentsRect->size.height = height;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[_UIFloatingContentView contentView](self, "contentView", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subviews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EEB0DD20))
            objc_msgSend(v15, "setContentsRect:", x, y, width, height);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

- (CGRect)contentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentsRect.origin.x;
  y = self->_contentsRect.origin.y;
  width = self->_contentsRect.size.width;
  height = self->_contentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
