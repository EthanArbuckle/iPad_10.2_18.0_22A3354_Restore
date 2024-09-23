@implementation PXLoadingFailureBadgeView

- (PXLoadingFailureBadgeView)initWithFrame:(CGRect)a3
{
  return -[PXLoadingFailureBadgeView initWithFrame:error:](self, "initWithFrame:error:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PXLoadingFailureBadgeView)initWithFrame:(CGRect)a3 error:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  PXLoadingFailureBadgeView *v10;
  uint64_t v11;
  NSError *error;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXLoadingFailureBadgeView;
  v10 = -[PXLoadingFailureBadgeView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    error = v10->_error;
    v10->_error = (NSError *)v11;

  }
  return v10;
}

- (PXLoadingFailureBadgeView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXLoadingFailureBadgeView.m"), 62, CFSTR("%s is not available as initializer"), "-[PXLoadingFailureBadgeView initWithCoder:]");

  abort();
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  -[PXLoadingFailureBadgeView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXLoadingFailureBadgeView setSizeClass:](self, "setSizeClass:", objc_msgSend((id)objc_opt_class(), "_sizeClassForSize:", v7, v9));
  -[PXLoadingFailureBadgeView imageView](self, "imageView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)setSizeClass:(int64_t)a3
{
  id v4;

  if (self->_sizeClass != a3)
  {
    self->_sizeClass = a3;
    objc_msgSend((id)objc_opt_class(), "_imageForSizeClass:", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PXLoadingFailureBadgeView setImage:](self, "setImage:", v4);

  }
}

- (void)setImage:(id)a3
{
  void *v5;
  UIImage *v6;

  v6 = (UIImage *)a3;
  if (self->_image != v6)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[PXLoadingFailureBadgeView imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

  }
}

- (UIImageView)imageView
{
  UIImageView *imageView;
  UIImageView *v4;
  UIImageView *v5;

  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    v5 = self->_imageView;
    self->_imageView = v4;

    -[PXLoadingFailureBadgeView addSubview:](self, "addSubview:", self->_imageView);
    -[PXLoadingFailureBadgeView _installGestureRecognizers](self, "_installGestureRecognizers");
    imageView = self->_imageView;
  }
  return imageView;
}

- (void)_installGestureRecognizers
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTap_);
  -[PXLoadingFailureBadgeView addGestureRecognizer:](self, "addGestureRecognizer:", v3);

}

- (void)_handleTap:(id)a3
{
  if (objc_msgSend(a3, "state") == 3)
    -[PXLoadingFailureBadgeView _handlePrimaryAction](self, "_handlePrimaryAction");
}

- (void)_handlePrimaryAction
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[PXLoadingFailureBadgeView error](self, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *(_QWORD *)off_1E50B8070;
    v10 = *MEMORY[0x1E0CB2D50];
    PXLocalizedStringFromTable(CFSTR("PXDisplayAssetViewGenericErrorMessage"), CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, -1, v8);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v9 = +[PXAlert showForError:](PXAlert, "showForError:", v4);

}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (int64_t)sizeClass
{
  return self->_sizeClass;
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

+ (CGSize)sizeForSizeClass:(int64_t)a3
{
  double v4;
  double v5;
  NSObject *v6;
  int v7;
  int64_t v8;
  uint64_t v9;
  CGSize result;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    v4 = 22.0;
    v5 = 22.0;
  }
  else if (a3 == 2)
  {
    v4 = 33.0;
    v5 = 33.0;
  }
  else
  {
    PXAssertGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = 134217984;
      v8 = a3;
      _os_log_fault_impl(&dword_1A6789000, v6, OS_LOG_TYPE_FAULT, "invalid PXLoadingFailureBadgeViewSizeClass %ti", (uint8_t *)&v7, 0xCu);
    }

    v4 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

+ (int64_t)_sizeClassForSize:(CGSize)a3
{
  double width;
  double v4;

  width = a3.width;
  objc_msgSend(a1, "sizeForSizeClass:", 2, a3.width, a3.height);
  if (width < v4)
    return 1;
  else
    return 2;
}

+ (id)_imageForSizeClass:(int64_t)a3
{
  NSObject *v3;
  const __CFString *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    v4 = CFSTR("PXLoadingErrorRegular");
  }
  else
  {
    if (a3 != 1)
    {
      if (a3)
      {
        v4 = 0;
        goto LABEL_10;
      }
      PXAssertGetLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        v6 = 134217984;
        v7 = 0;
        _os_log_fault_impl(&dword_1A6789000, v3, OS_LOG_TYPE_FAULT, "invalid PXLoadingFailureBadgeViewSizeClass %ti", (uint8_t *)&v6, 0xCu);
      }

    }
    v4 = CFSTR("PXLoadingErrorCompact");
  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0DC3870], "px_imageNamed:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
