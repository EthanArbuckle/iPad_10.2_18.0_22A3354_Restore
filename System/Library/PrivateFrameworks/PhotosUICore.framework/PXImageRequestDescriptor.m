@implementation PXImageRequestDescriptor

- (PXImageRequestDescriptor)initWithAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  id v13;
  PXImageRequestDescriptor *v14;
  PXImageRequestDescriptor *v15;
  uint64_t v16;
  PXImageRequestOptions *options;
  objc_super v19;

  height = a4.height;
  width = a4.width;
  v12 = a3;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PXImageRequestDescriptor;
  v14 = -[PXImageRequestDescriptor init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_asset, a3);
    v15->_targetSize.width = width;
    v15->_targetSize.height = height;
    v15->_contentMode = a5;
    v16 = objc_msgSend(v13, "copy");
    options = v15->_options;
    v15->_options = (PXImageRequestOptions *)v16;

  }
  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  PXImageRequestOptions *options;
  uint64_t v5;

  v3 = -[PXDisplayAsset hash](self->_asset, "hash") ^ (uint64_t)self->_targetSize.width;
  options = self->_options;
  v5 = v3 ^ (uint64_t)self->_targetSize.height ^ self->_contentMode;
  return v5 ^ -[PXImageRequestOptions hash](options, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PXImageRequestDescriptor *v4;
  PXImageRequestDescriptor *v5;
  id v6;
  id v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;

  v4 = (PXImageRequestDescriptor *)a3;
  if (v4 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXImageRequestDescriptor asset](self, "asset");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[PXImageRequestDescriptor asset](v5, "asset");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", v7);

        if (!v8)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      -[PXImageRequestDescriptor targetSize](self, "targetSize");
      v10 = v9;
      v12 = v11;
      -[PXImageRequestDescriptor targetSize](v5, "targetSize");
      LOBYTE(v8) = 0;
      if (v10 == v14 && v12 == v13)
      {
        v15 = -[PXImageRequestDescriptor contentMode](self, "contentMode");
        LOBYTE(v8) = v15 == -[PXImageRequestDescriptor contentMode](v5, "contentMode");
      }
      goto LABEL_12;
    }
    LOBYTE(v8) = 0;
  }
LABEL_13:

  return v8;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImageRequestDescriptor asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImageRequestDescriptor targetSize](self, "targetSize");
  v8 = v7;
  -[PXImageRequestDescriptor targetSize](self, "targetSize");
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PXImageRequestDescriptor contentMode](self, "contentMode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXImageRequestDescriptor options](self, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; asset: %@, targetSize: {%.2f, %.2f}; contentMode: %@; options: %@>"),
                  v5,
                  self,
                  v6,
                  v8,
                  v10,
                  v11,
                  v12);

  return v13;
}

- (PXImageRequestDescriptor)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXImageRequestDescriptor.m"), 57, CFSTR("%s is not available as initializer"), "-[PXImageRequestDescriptor init]");

  abort();
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (CGSize)targetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSize.width;
  height = self->_targetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (PXImageRequestOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
