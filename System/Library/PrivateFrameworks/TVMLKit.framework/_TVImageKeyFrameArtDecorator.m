@implementation _TVImageKeyFrameArtDecorator

- (_TVImageKeyFrameArtDecorator)initWithInlineTitle:(id)a3
{
  id v5;
  _TVImageKeyFrameArtDecorator *v6;
  _TVImageKeyFrameArtDecorator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TVImageKeyFrameArtDecorator;
  v6 = -[TVImageScaleDecorator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_inlineTitle, a3);

  return v7;
}

- (id)decoratorIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_TVImageKeyFrameArtDecorator;
  -[TVImageScaleDecorator decoratorIdentifier](&v7, sel_decoratorIdentifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@_KeyFrameArt"), v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5
{
  id v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  _TVImageKeyFrameArtDecorator *v28;
  id v29;
  id v30;
  __int128 v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;

  v6 = a3;
  objc_msgSend(v6, "uiImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (int)objc_msgSend(v6, "orientation") >= 2 && (int)objc_msgSend(v6, "orientation") < 9;
  objc_msgSend(v7, "size");
  v10 = v9;
  v12 = v11;
  v31 = *MEMORY[0x24BDBF090];
  -[TVImageScaleDecorator _scaleToSizeAdjustedForUpscaling](self, "_scaleToSizeAdjustedForUpscaling");
  v14 = v13;
  v16 = v15;
  v17 = objc_retainAutorelease(v6);
  +[TVGraphicsImageRenderer formatWithCGImage:](TVGraphicsImageRenderer, "formatWithCGImage:", objc_msgSend(v17, "image"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setOpaque:", 0);
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __69___TVImageKeyFrameArtDecorator_decorate_scaledWithSize_croppedToFit___block_invoke;
  v27 = &unk_24EB863D0;
  v32 = v14;
  v33 = v16;
  v28 = self;
  v29 = v7;
  v36 = v8;
  v30 = v17;
  v34 = v10;
  v35 = v12;
  v19 = v17;
  v20 = v7;
  +[TVGraphicsImageRenderer imageWithSize:format:actions:](TVGraphicsImageRenderer, "imageWithSize:format:actions:", v18, &v24, v14, v16);
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  +[TVImage imageWithCGImageRef:preserveAlpha:](TVImage, "imageWithCGImageRef:preserveAlpha:", objc_msgSend(v21, "CGImage", v24, v25, v26, v27, v28), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSString)inlineTitle
{
  return self->_inlineTitle;
}

- (void)setInlineTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineTitle, 0);
}

@end
