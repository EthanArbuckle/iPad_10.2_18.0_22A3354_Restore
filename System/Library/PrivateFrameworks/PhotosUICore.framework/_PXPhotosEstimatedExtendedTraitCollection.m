@implementation _PXPhotosEstimatedExtendedTraitCollection

- (_PXPhotosEstimatedExtendedTraitCollection)initWithViewController:(id)a3
{
  id v4;
  _PXPhotosEstimatedExtendedTraitCollection *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  uint8_t v25[16];
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_PXPhotosEstimatedExtendedTraitCollection;
  v5 = -[PXExtendedTraitCollection initWithViewController:](&v26, sel_initWithViewController_, v4);
  if (!v5)
    goto LABEL_27;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == 5)
  {
    v5->_layoutSizeClass = 2;
    v8 = 4;
  }
  else
  {
    if (v7 == 1)
    {
      v8 = 2;
    }
    else
    {
      if (v7)
      {
        PXAssertGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v25 = 0;
          _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "current device isn't supported yet", v25, 2u);
        }

        goto LABEL_13;
      }
      v8 = 1;
    }
    v5->_layoutSizeClass = v8;
  }
  v5->_userInterfaceIdiom = v8;
LABEL_13:
  v10 = v4;
  if (v10)
  {
    while (1)
    {
      objc_msgSend(v10, "viewIfLoaded");
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
        break;
      objc_msgSend(v10, "parentViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        objc_msgSend(v10, "presentingViewController");
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;

      v10 = v15;
      if (!v15)
        goto LABEL_19;
    }
    v16 = (void *)v11;
  }
  else
  {
LABEL_19:
    v16 = 0;
  }
  objc_msgSend(v16, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "px_firstKeyWindow");
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v19, "bounds");
  v5->_layoutReferenceSize.width = v21;
  v5->_layoutReferenceSize.height = v22;
  v23 = 2;
  if (v21 <= v22)
    v23 = 1;
  v5->_layoutOrientation = v23;

LABEL_27:
  return v5;
}

- (int64_t)layoutSizeClass
{
  return self->_layoutSizeClass;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (CGSize)layoutReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->_layoutReferenceSize.width;
  height = self->_layoutReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
