@implementation PXGPageControl

- (PXGPageControl)initWithFrame:(CGRect)a3
{
  PXGPageControl *v3;
  id v4;
  uint64_t v5;
  UIPageControl *pageControl;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXGPageControl;
  v3 = -[PXGPageControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3A88]);
    -[PXGPageControl bounds](v3, "bounds");
    v5 = objc_msgSend(v4, "initWithFrame:");
    pageControl = v3->_pageControl;
    v3->_pageControl = (UIPageControl *)v5;

    -[UIPageControl setAutoresizingMask:](v3->_pageControl, "setAutoresizingMask:", 18);
    -[UIPageControl addTarget:action:forControlEvents:](v3->_pageControl, "addTarget:action:forControlEvents:", v3, sel__valueChanged_, 4096);
    -[PXGPageControl addSubview:](v3, "addSubview:", v3->_pageControl);
  }
  return v3;
}

- (int64_t)numberOfPages
{
  return -[UIPageControl numberOfPages](self->_pageControl, "numberOfPages");
}

- (void)setNumberOfPages:(int64_t)a3
{
  -[UIPageControl setNumberOfPages:](self->_pageControl, "setNumberOfPages:", a3);
}

- (int64_t)currentPage
{
  return -[UIPageControl currentPage](self->_pageControl, "currentPage");
}

- (void)setCurrentPage:(int64_t)a3
{
  -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", a3);
}

- (void)setHidesForSinglePage:(BOOL)a3
{
  -[UIPageControl setHidesForSinglePage:](self->_pageControl, "setHidesForSinglePage:", a3);
}

- (BOOL)hidesForSinglePage
{
  return -[UIPageControl hidesForSinglePage](self->_pageControl, "hidesForSinglePage");
}

- (void)_valueChanged:(id)a3
{
  uint64_t v4;
  void *v5;
  const char *v6;
  id v7;

  -[PXGPageControlConfiguration target](self->_userData, "target", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[PXGPageControlConfiguration action](self->_userData, "action");

    if (v6)
    {
      -[PXGPageControlConfiguration target](self->_userData, "target");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "performSelector:withObject:", -[PXGPageControlConfiguration action](self->_userData, "action"), self);

    }
  }
}

- (void)setUserData:(id)a3
{
  PXGPageControlConfiguration *v4;
  BOOL v5;
  PXGPageControlConfiguration *v6;
  PXGPageControlConfiguration *userData;
  PXGPageControlConfiguration *v8;

  v8 = (PXGPageControlConfiguration *)a3;
  v4 = self->_userData;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXGPageControlConfiguration isEqual:](v8, "isEqual:", v4);

    if (!v5)
    {
      v6 = (PXGPageControlConfiguration *)-[PXGPageControlConfiguration copy](v8, "copy");
      userData = self->_userData;
      self->_userData = v6;

      -[PXGPageControl setNumberOfPages:](self, "setNumberOfPages:", -[PXGPageControlConfiguration numberOfPages](self->_userData, "numberOfPages"));
      -[PXGPageControl setCurrentPage:](self, "setCurrentPage:", -[PXGPageControlConfiguration currentPage](self->_userData, "currentPage"));
      -[PXGPageControl setHidesForSinglePage:](self, "setHidesForSinglePage:", -[PXGPageControlConfiguration hidesForSinglePage](self->_userData, "hidesForSinglePage"));
    }
  }

}

- (void)prepareForReuse
{
  -[PXGPageControl setUserData:](self, "setUserData:", 0);
}

- (CGRect)clippingRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_clippingRect.origin.x;
  y = self->_clippingRect.origin.y;
  width = self->_clippingRect.size.width;
  height = self->_clippingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (PXGPageControlConfiguration)userData
{
  return self->_userData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
}

@end
