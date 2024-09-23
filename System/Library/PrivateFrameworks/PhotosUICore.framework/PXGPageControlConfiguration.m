@implementation PXGPageControlConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id WeakRetained;

  v4 = objc_alloc_init((Class)objc_opt_class());
  *((_QWORD *)v4 + 2) = self->_numberOfPages;
  *((_QWORD *)v4 + 3) = self->_currentPage;
  WeakRetained = objc_loadWeakRetained(&self->_target);
  objc_storeWeak((id *)v4 + 4, WeakRetained);

  *((_QWORD *)v4 + 5) = self->_action;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PXGPageControlConfiguration *v4;
  PXGPageControlConfiguration *v5;
  SEL *v6;
  id WeakRetained;
  id v8;
  BOOL v9;

  v4 = (PXGPageControlConfiguration *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (SEL *)v5;
      v9 = v5->_numberOfPages == self->_numberOfPages
        && v5->_currentPage == self->_currentPage
        && (WeakRetained = objc_loadWeakRetained(&v5->_target),
            v8 = objc_loadWeakRetained(&self->_target),
            v8,
            WeakRetained,
            WeakRetained == v8)
        && v6[5] == self->_action;

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  int64_t v3;

  v3 = -[PXGPageControlConfiguration numberOfPages](self, "numberOfPages");
  return v3 ^ (2 * -[PXGPageControlConfiguration currentPage](self, "currentPage"));
}

- (int64_t)numberOfPages
{
  return self->_numberOfPages;
}

- (void)setNumberOfPages:(int64_t)a3
{
  self->_numberOfPages = a3;
}

- (int64_t)currentPage
{
  return self->_currentPage;
}

- (void)setCurrentPage:(int64_t)a3
{
  self->_currentPage = a3;
}

- (BOOL)hidesForSinglePage
{
  return self->_hidesForSinglePage;
}

- (void)setHidesForSinglePage:(BOOL)a3
{
  self->_hidesForSinglePage = a3;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
}

@end
