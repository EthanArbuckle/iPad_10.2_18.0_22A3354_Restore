@implementation SBUIImageDataProvider

- (SBUIImageDataProvider)initWithImage:(id)a3 context:(id)a4 scaleFactor:(double)a5
{
  id v10;
  id v11;
  SBUIImageDataProvider *v12;
  SBUIImageDataProvider *v13;
  void *v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSnapshotDataProvider.m"), 177, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("image"));

  }
  v16.receiver = self;
  v16.super_class = (Class)SBUIImageDataProvider;
  v12 = -[SBUIImageDataProvider init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_image, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    v13->_scaleFactor = a5;
  }

  return v13;
}

- (id)fetchImageForFormat:(int64_t)a3
{
  UIImage *v4;
  uint64_t v5;

  v4 = self->_image;
  if ((BSFloatIsOne() & 1) == 0)
  {
    -[UIImage sbf_scaleImage:canUseIOSurface:](v4, "sbf_scaleImage:canUseIOSurface:", 0, self->_scaleFactor);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (UIImage *)v5;
  }
  return v4;
}

- (XBSnapshotDataProviderContext)context
{
  return &self->_context->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
