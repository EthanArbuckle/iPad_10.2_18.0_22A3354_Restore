@implementation _PXStoryStyleChromePreloadingRecord

- (_PXStoryStyleChromePreloadingRecord)initWithDisplayScale:(double)a3 styleInfo:(id)a4 viewLayoutSpec:(id)a5
{
  id v9;
  id v10;
  _PXStoryStyleChromePreloadingRecord *v11;
  _PXStoryStyleChromePreloadingRecord *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_PXStoryStyleChromePreloadingRecord;
  v11 = -[_PXStoryStyleChromePreloadingRecord init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_displayScale = a3;
    objc_storeStrong((id *)&v11->_styleInfo, a4);
    objc_storeStrong((id *)&v12->_viewLayoutSpec, a5);
  }

  return v12;
}

- (_PXStoryStyleChromePreloadingRecord)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryStyleChromeContainerLayout.m"), 327, CFSTR("%s is not available as initializer"), "-[_PXStoryStyleChromePreloadingRecord init]");

  abort();
}

- (unint64_t)hash
{
  unint64_t displayScale;
  uint64_t v4;

  displayScale = (unint64_t)self->_displayScale;
  v4 = -[PXStoryStyleDescriptor hash](self->_styleInfo, "hash");
  return v4 ^ -[PXStoryViewLayoutSpec hash](self->_viewLayoutSpec, "hash") ^ displayScale;
}

- (BOOL)isEqual:(id)a3
{
  _PXStoryStyleChromePreloadingRecord *v4;
  _PXStoryStyleChromePreloadingRecord *v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  int v11;
  char v12;
  void *v13;
  void *v14;

  v4 = (_PXStoryStyleChromePreloadingRecord *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_PXStoryStyleChromePreloadingRecord displayScale](self, "displayScale");
      v7 = v6;
      -[_PXStoryStyleChromePreloadingRecord displayScale](v5, "displayScale");
      if (v7 != v8)
      {
        v12 = 0;
LABEL_16:

        goto LABEL_17;
      }
      -[_PXStoryStyleChromePreloadingRecord styleInfo](self, "styleInfo");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[_PXStoryStyleChromePreloadingRecord styleInfo](v5, "styleInfo");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (v9 == v10)
      {

      }
      else
      {
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (!v11)
        {
          v12 = 0;
LABEL_15:

          goto LABEL_16;
        }
      }
      -[_PXStoryStyleChromePreloadingRecord viewLayoutSpec](self, "viewLayoutSpec");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PXStoryStyleChromePreloadingRecord viewLayoutSpec](v5, "viewLayoutSpec");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 == v14)
        v12 = 1;
      else
        v12 = objc_msgSend(v13, "isEqual:", v14);

      goto LABEL_15;
    }
    v12 = 0;
  }
LABEL_17:

  return v12;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (PXStoryStyleDescriptor)styleInfo
{
  return self->_styleInfo;
}

- (PXStoryViewLayoutSpec)viewLayoutSpec
{
  return self->_viewLayoutSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewLayoutSpec, 0);
  objc_storeStrong((id *)&self->_styleInfo, 0);
}

@end
