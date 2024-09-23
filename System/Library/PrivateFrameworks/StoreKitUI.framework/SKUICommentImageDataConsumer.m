@implementation SKUICommentImageDataConsumer

- (id)imageForImage:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  void (**completionBlock)(id, void *, _QWORD);
  _QWORD v26[4];
  id v27;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUICommentImageDataConsumer imageForImage:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  -[SKUIStyledImageDataConsumer imageSize](self, "imageSize");
  v14 = v13;
  v16 = v15;
  -[SKUIStyledImageDataConsumer imageSize](self, "imageSize");
  v18 = v17;
  -[SKUIStyledImageDataConsumer imageSize](self, "imageSize");
  v20 = v19;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __46__SKUICommentImageDataConsumer_imageForImage___block_invoke;
  v26[3] = &unk_1E73A4EC8;
  v21 = v4;
  v27 = v21;
  -[SKUICommentImageDataConsumer _scaledImageWithBounds:contentRect:drawBlock:](self, "_scaledImageWithBounds:contentRect:drawBlock:", v26, v14, v16, 0.0, 0.0, v18, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "imageWithRenderingMode:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  completionBlock = (void (**)(id, void *, _QWORD))self->_completionBlock;
  if (completionBlock)
    completionBlock[2](completionBlock, v23, 0);

  return v23;
}

uint64_t __46__SKUICommentImageDataConsumer_imageForImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:");
}

- (id)_scaledImageWithBounds:(CGSize)a3 contentRect:(CGRect)a4 drawBlock:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void (**v12)(_QWORD, double, double, double, double);
  void *v13;
  double v14;
  CGFloat v15;
  void *v16;
  CGSize v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.height;
  v10 = a3.width;
  v11 = (void *)MEMORY[0x1E0DC3BF8];
  v12 = (void (**)(_QWORD, double, double, double, double))a5;
  objc_msgSend(v11, "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  v15 = v14;
  v18.width = v10;
  v18.height = v9;
  UIGraphicsBeginImageContextWithOptions(v18, 1, v15);

  v12[2](v12, x, y, width, height);
  UIGraphicsGetImageFromCurrentImageContext();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v16;
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 232, 1);
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
}

- (void)imageForImage:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
