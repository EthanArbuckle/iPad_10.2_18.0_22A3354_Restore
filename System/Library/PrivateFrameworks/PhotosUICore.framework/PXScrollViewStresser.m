@implementation PXScrollViewStresser

- (void)startScrollingScrollView:(id)a3 axis:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[PXScrollViewStresser isScrolling](self, "isScrolling"))
  {
    if (a4 == 2)
      v6 = 2;
    else
      v6 = 3;
    if (objc_msgSend(v9, "px_isScrolledAtEdge:", v6))
      v6 = PXRectEdgeOpposite();
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__handleDisplayLink_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addToRunLoop:forMode:", v8, *MEMORY[0x1E0C99860]);

    -[PXScrollViewStresser setDisplayLink:](self, "setDisplayLink:", v7);
    -[PXScrollViewStresser setScrollView:](self, "setScrollView:", v9);
    -[PXScrollViewStresser setScrollDirection:](self, "setScrollDirection:", v6);
    -[PXScrollViewStresser setScrollCount:](self, "setScrollCount:", 0);

  }
}

- (void)_handleDisplayLink:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  id v14;

  -[PXScrollViewStresser scrollView](self, "scrollView", a3);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[PXScrollViewStresser scrollDirection](self, "scrollDirection");
  if ((objc_msgSend(v14, "px_isScrolledAtEdge:", v4) & 1) != 0)
  {
    -[PXScrollViewStresser setScrollDirection:](self, "setScrollDirection:", PXRectEdgeOpposite());
    -[PXScrollViewStresser setScrollCount:](self, "setScrollCount:", -[PXScrollViewStresser scrollCount](self, "scrollCount") + 1);
    +[PXDiagnosticsSettings sharedInstance](PXDiagnosticsSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "scrollIterations");

    if (v6 >= 1 && -[PXScrollViewStresser scrollCount](self, "scrollCount") >= 2 * v6)
      -[PXScrollViewStresser stopScrolling](self, "stopScrolling");
  }
  else
  {
    objc_msgSend(v14, "contentOffset");
    v8 = v7;
    v10 = v9;
    +[PXDiagnosticsSettings sharedInstance](PXDiagnosticsSettings, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scrollSpeed");
    v13 = v12;

    switch((int)v4)
    {
      case 0:
        v8 = v8 - v13;
        break;
      case 1:
        v10 = v10 - v13;
        break;
      case 2:
        v8 = v8 + v13;
        break;
      case 3:
        v10 = v10 + v13;
        break;
      default:
        break;
    }
    objc_msgSend(v14, "px_scrollToContentOffset:animated:", 0, v8, v10);
  }

}

- (BOOL)isScrolling
{
  void *v2;
  BOOL v3;

  -[PXScrollViewStresser displayLink](self, "displayLink");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)stopScrolling
{
  void *v3;

  -[PXScrollViewStresser displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[PXScrollViewStresser setDisplayLink:](self, "setDisplayLink:", 0);
  -[PXScrollViewStresser setScrollView:](self, "setScrollView:", 0);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (unsigned)scrollDirection
{
  return self->_scrollDirection;
}

- (void)setScrollDirection:(unsigned int)a3
{
  self->_scrollDirection = a3;
}

- (int64_t)scrollCount
{
  return self->_scrollCount;
}

- (void)setScrollCount:(int64_t)a3
{
  self->_scrollCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

+ (PXScrollViewStresser)sharedInstance
{
  if (sharedInstance_onceToken_253222 != -1)
    dispatch_once(&sharedInstance_onceToken_253222, &__block_literal_global_253223);
  return (PXScrollViewStresser *)(id)sharedInstance_sharedInstance_253224;
}

void __38__PXScrollViewStresser_sharedInstance__block_invoke()
{
  PXScrollViewStresser *v0;
  void *v1;

  v0 = objc_alloc_init(PXScrollViewStresser);
  v1 = (void *)sharedInstance_sharedInstance_253224;
  sharedInstance_sharedInstance_253224 = (uint64_t)v0;

}

@end
