@implementation PXCloudQuotaMockView

- (PXCloudQuotaMockView)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudQuotaView.m"), 151, CFSTR("%s is not available as initializer"), "-[PXCloudQuotaMockView init]");

  abort();
}

- (PXCloudQuotaMockView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudQuotaView.m"), 155, CFSTR("%s is not available as initializer"), "-[PXCloudQuotaMockView initWithFrame:]");

  abort();
}

- (PXCloudQuotaMockView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudQuotaView.m"), 159, CFSTR("%s is not available as initializer"), "-[PXCloudQuotaMockView initWithCoder:]");

  abort();
}

- (PXCloudQuotaMockView)initWithContentView:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudQuotaView.m"), 163, CFSTR("%s is not available as initializer"), "-[PXCloudQuotaMockView initWithContentView:]");

  abort();
}

- (PXCloudQuotaMockView)initWithCloudQuotaFull:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PXCloudQuotaMockView *v21;
  void *v24;
  objc_super v25;
  _QWORD v26[3];

  v3 = a3;
  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v4, "_setCornerRadius:", 10.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemExtraLightGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderWidth:", 2.0);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemLightGrayColor");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "CGColor");
  objc_msgSend(v4, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderColor:", v8);

  v10 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (v3)
    v11 = CFSTR("Mock: iCloud storage is full.");
  else
    v11 = CFSTR("Mock: iCloud storage is almost full.");
  objc_msgSend(v10, "setText:", v11, self);
  PXFontWithTextStyleSymbolicTraits();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v12);

  objc_msgSend(v4, "addSubview:", v10);
  v13 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v10, "centerXAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerXAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v16;
  objc_msgSend(v10, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "activateConstraints:", v20);

  v25.receiver = v24;
  v25.super_class = (Class)PXCloudQuotaMockView;
  v21 = -[PXCloudQuotaView initWithContentView:](&v25, sel_initWithContentView_, v4);

  return v21;
}

- (id)contentViewFont
{
  return (id)PXFontWithTextStyleSymbolicTraits();
}

- (CGSize)contentViewSizeForWidth:(double)a3
{
  double v3;
  CGSize result;

  v3 = 100.0;
  result.height = v3;
  result.width = a3;
  return result;
}

@end
