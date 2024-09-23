@implementation WFImage

- (void)dealloc
{
  objc_super v3;

  CGImageRelease(self->_CGImage);
  v3.receiver = self;
  v3.super_class = (Class)WFImage;
  -[WFImage dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_symbolConfiguration, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_untintedNSImage, 0);
  objc_destroyWeak((id *)&self->_UIImage);
  objc_destroyWeak((id *)&self->_NSImage);
  objc_destroyWeak(&self->_internalImageSource);
  objc_destroyWeak(&self->_internalCGImage);
}

- (unint64_t)hash
{
  int64_t v3;
  double v4;

  v3 = -[WFImage representationType](self, "representationType");
  -[WFImage scale](self, "scale");
  return v3 ^ -[WFImage orientation](self, "orientation") ^ (unint64_t)v4;
}

- (WFImage)imageWithDisplayStyle:(unint64_t)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)-[WFImage copy](self, "copy");
  v4[8] = a3;
  return (WFImage *)v4;
}

- (CGSize)sizeInPoints
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[WFImage sizeInPixels](self, "sizeInPixels");
  v4 = v3;
  v6 = v5;
  -[WFImage scale](self, "scale");
  v8 = v4 / v7;
  -[WFImage scale](self, "scale");
  v10 = v6 / v9;
  v11 = v8;
  result.height = v10;
  result.width = v11;
  return result;
}

- (CGSize)sizeInPixels
{
  double v3;
  double v4;
  double v5;
  double v6;
  unsigned int v7;
  double v8;
  double v9;
  CGSize result;

  -[WFImage CGImageSize](self, "CGImageSize");
  v4 = v3;
  v6 = v5;
  v7 = -[WFImage orientation](self, "orientation") - 5;
  if (v7 >= 4)
    v8 = v4;
  else
    v8 = v6;
  if (v7 >= 4)
    v9 = v6;
  else
    v9 = v4;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)CGImageSize
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  double v16;
  double Width;
  double v18;
  double Height;
  CGImage *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  CGSize result;

  if (!-[WFImage internalImageSource](self, "internalImageSource"))
  {
LABEL_13:
    v20 = -[WFImage CGImage](self, "CGImage");
    Width = (double)CGImageGetWidth(v20);
    Height = (double)CGImageGetHeight(v20);
    goto LABEL_14;
  }
  soft_CGImageSourceCopyProperties((uint64_t)-[WFImage internalImageSource](self, "internalImageSource"));
  v4 = v3;
  v25 = 0.0;
  v26 = COERCE_DOUBLE(&v25);
  v27 = 0x2020000000;
  v5 = (_QWORD *)getkCGImagePropertyPixelWidthSymbolLoc_ptr;
  v28 = getkCGImagePropertyPixelWidthSymbolLoc_ptr;
  if (!getkCGImagePropertyPixelWidthSymbolLoc_ptr)
  {
    v6 = ImageIOLibrary();
    v5 = dlsym(v6, "kCGImagePropertyPixelWidth");
    *(_QWORD *)(*(_QWORD *)&v26 + 24) = v5;
    getkCGImagePropertyPixelWidthSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v25, 8);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCGImagePropertyPixelWidth(void)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("WFImage.m"), 49, CFSTR("%s"), dlerror());
LABEL_17:

    __break(1u);
    goto LABEL_18;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0.0;
  v26 = COERCE_DOUBLE(&v25);
  v27 = 0x2020000000;
  v8 = (_QWORD *)getkCGImagePropertyPixelHeightSymbolLoc_ptr;
  v28 = getkCGImagePropertyPixelHeightSymbolLoc_ptr;
  if (!getkCGImagePropertyPixelHeightSymbolLoc_ptr)
  {
    v9 = ImageIOLibrary();
    v8 = dlsym(v9, "kCGImagePropertyPixelHeight");
    *(_QWORD *)(*(_QWORD *)&v26 + 24) = v8;
    getkCGImagePropertyPixelHeightSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v25, 8);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCGImagePropertyPixelHeight(void)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("WFImage.m"), 48, CFSTR("%s"), dlerror());
    goto LABEL_17;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = 0;
  if (v7 && v10)
  {
    v13 = (void *)MEMORY[0x1E0CB3B18];
    v14 = (double)objc_msgSend(v7, "integerValue");
    v15 = objc_msgSend(v11, "integerValue");
    v25 = v14;
    v26 = (double)v15;
    objc_msgSend(v13, "valueWithBytes:objCType:", &v25, "{CGSize=dd}");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v12)
    goto LABEL_13;
  objc_msgSend(v12, "wf_CGSizeValue");
  Width = v16;
  Height = v18;

LABEL_14:
  v21 = Width;
  v22 = Height;
LABEL_18:
  result.height = v22;
  result.width = v21;
  return result;
}

- (CGImageSource)internalImageSource
{
  id *p_internalImageSource;
  id WeakRetained;
  void *v5;
  CGImageSource *result;
  int64_t v7;
  void *v8;
  uint64_t (*v9)(void *, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;

  p_internalImageSource = &self->_internalImageSource;
  WeakRetained = objc_loadWeakRetained(&self->_internalImageSource);
  if (WeakRetained)
  {
    v5 = WeakRetained;
LABEL_3:
    CFAutorelease(v5);
    return (CGImageSource *)v5;
  }
  v7 = -[WFImage representationType](self, "representationType");
  if (v7 == 1)
  {
    -[WFImage URL](self, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v9 = (uint64_t (*)(void *, _QWORD))getCGImageSourceCreateWithURLSymbolLoc_ptr;
    v17 = (void *)getCGImageSourceCreateWithURLSymbolLoc_ptr;
    if (!getCGImageSourceCreateWithURLSymbolLoc_ptr)
    {
      v13 = ImageIOLibrary();
      v9 = (uint64_t (*)(void *, _QWORD))dlsym(v13, "CGImageSourceCreateWithURL");
      v15[3] = (uint64_t)v9;
      getCGImageSourceCreateWithURLSymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(&v14, 8);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGImageSourceRef  _Nullable soft_CGImageSourceCreateWithURL(CFURLRef _Nonnull, CFDictionaryRef _Nullable)");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("WFImage.m"), 40, CFSTR("%s"), dlerror());
      goto LABEL_18;
    }
LABEL_14:
    v5 = (void *)v9(v8, 0);

    objc_storeWeak(p_internalImageSource, v5);
    if (!v5)
      return (CGImageSource *)v5;
    goto LABEL_3;
  }
  if (v7 != 2)
  {
    objc_storeWeak(p_internalImageSource, 0);
    return 0;
  }
  -[WFImage data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v9 = (uint64_t (*)(void *, _QWORD))getCGImageSourceCreateWithDataSymbolLoc_ptr;
  v17 = getCGImageSourceCreateWithDataSymbolLoc_ptr;
  if (!getCGImageSourceCreateWithDataSymbolLoc_ptr)
  {
    v10 = ImageIOLibrary();
    v9 = (uint64_t (*)(void *, _QWORD))dlsym(v10, "CGImageSourceCreateWithData");
    v15[3] = (uint64_t)v9;
    getCGImageSourceCreateWithDataSymbolLoc_ptr = v9;
  }
  _Block_object_dispose(&v14, 8);
  if (v9)
    goto LABEL_14;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGImageSourceRef  _Nullable soft_CGImageSourceCreateWithData(CFDataRef _Nonnull, CFDictionaryRef _Nullable)");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("WFImage.m"), 41, CFSTR("%s"), dlerror());
LABEL_18:

  __break(1u);
  return result;
}

- (UIImage)UIImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFImage tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFImage tintColor](self, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFImage imageWithTintColor:](self, "imageWithTintColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "untintedUIImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFImage untintedUIImage](self, "untintedUIImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIImage *)v6;
}

- (WFColor)tintColor
{
  return self->_tintColor;
}

- (WFImage)imageWithTintColor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[WFImage copy](self, "copy");
  objc_msgSend(v5, "setTintColor:", v4);

  return (WFImage *)v5;
}

- (void)setTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (UIImage)untintedUIImage
{
  UIImage **p_UIImage;
  void *WeakRetained;
  uint64_t v5;
  Class UIImageClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  _BYTE *v15;
  int v16;
  double v17;
  uint64_t v18;
  id v19;
  CGImage *v20;
  double v21;
  double v22;
  unsigned int v23;
  uint64_t v24;
  Class v25;
  id v26;
  id v27;

  p_UIImage = &self->_UIImage;
  WeakRetained = objc_loadWeakRetained((id *)&self->_UIImage);
  if (!WeakRetained)
  {
    switch(-[WFImage representationType](self, "representationType"))
    {
      case 0:
        getUIImageClass();
        v5 = objc_opt_new();
        goto LABEL_20;
      case 1:
        v11 = objc_alloc(getUIImageClass());
        -[WFImage URL](self, "URL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "path");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "initWithContentsOfFile:", v8);
        goto LABEL_16;
      case 2:
        if (!-[WFImage allowsAnimated](self, "allowsAnimated"))
          goto LABEL_22;
        -[WFImage data](self, "data");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v13, "length") >= 5
          && (v14 = objc_retainAutorelease(v13), v15 = (_BYTE *)objc_msgSend(v14, "bytes"), *v15 == 71)
          && v15[1] == 73)
        {
          v16 = v15[2];

          if (v16 == 70)
          {
            -[WFImage data](self, "data");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFImage scale](self, "scale");
            WFUIImageWithAnimatedGIFDataAndOptions(v7, v17);
            v18 = objc_claimAutoreleasedReturnValue();
            goto LABEL_23;
          }
        }
        else
        {

        }
LABEL_22:
        v26 = objc_alloc(getUIImageClass());
        -[WFImage data](self, "data");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFImage scale](self, "scale");
        v18 = objc_msgSend(v26, "initWithData:scale:", v7);
LABEL_23:
        v10 = (void *)v18;
LABEL_24:

LABEL_25:
        objc_msgSend(v10, "imageWithRenderingMode:", -[WFImage renderingMode](self, "renderingMode"));
        WeakRetained = (void *)objc_claimAutoreleasedReturnValue();

        objc_storeWeak((id *)p_UIImage, WeakRetained);
        break;
      case 3:
        v19 = objc_alloc(getUIImageClass());
        v20 = -[WFImage CGImage](self, "CGImage");
        -[WFImage scale](self, "scale");
        v22 = v21;
        v23 = -[WFImage orientation](self, "orientation") - 2;
        if (v23 > 6)
          v24 = 0;
        else
          v24 = qword_1AF780920[v23];
        v5 = objc_msgSend(v19, "initWithCGImage:scale:orientation:", v20, v24, v22);
LABEL_20:
        v10 = (void *)v5;
        goto LABEL_25;
      case 4:
        UIImageClass = getUIImageClass();
        -[WFImage symbolName](self, "symbolName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFImage symbolConfiguration](self, "symbolConfiguration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uiKitConfiguration");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[objc_class _systemImageNamed:withConfiguration:](UIImageClass, "_systemImageNamed:withConfiguration:", v7, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      case 5:
        v25 = getUIImageClass();
        -[WFImage name](self, "name");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFImage bundle](self, "bundle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[objc_class imageNamed:inBundle:withConfiguration:](v25, "imageNamed:inBundle:withConfiguration:", v7, v8, 0);
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v10 = (void *)v12;
LABEL_17:

        goto LABEL_24;
      default:
        v10 = 0;
        goto LABEL_25;
    }
  }
  v27 = WeakRetained;

  return (UIImage *)v27;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[WFImage representationType](self, "representationType") == 2)
  {
    -[WFImage data](self, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("data"));

    objc_msgSend(v9, "encodeBool:forKey:", -[WFImage allowsAnimated](self, "allowsAnimated"), CFSTR("allowsAnimated"));
  }
  else
  {
    -[WFImage PNGRepresentation](self, "PNGRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("data"));

  }
  -[WFImage scale](self, "scale");
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("scale"));
  objc_msgSend(v9, "encodeInteger:forKey:", -[WFImage renderingMode](self, "renderingMode"), CFSTR("renderingMode"));
  -[WFImage tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("tintColor"));

  -[WFImage symbolName](self, "symbolName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("symbolName"));

  -[WFImage symbolConfiguration](self, "symbolConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("symbolConfiguration"));

  objc_msgSend(v9, "encodeInteger:forKey:", -[WFImage displayStyle](self, "displayStyle"), CFSTR("displayStyle"));
}

- (double)scale
{
  double result;
  void *v3;
  double v4;
  double v5;

  result = self->_scale;
  if (result == 0.0)
  {
    +[WFDevice currentDevice](WFDevice, "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "screenScale");
    v5 = v4;

    return v5;
  }
  return result;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (WFImageSymbolConfiguration)symbolConfiguration
{
  return self->_symbolConfiguration;
}

- (unint64_t)renderingMode
{
  return self->_renderingMode;
}

- (NSData)PNGRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  double v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  CGImage *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  if (!-[WFImage hasValidImage](self, "hasValidImage"))
  {
    v7 = 0;
    return (NSData *)v7;
  }
  v3 = (void *)objc_opt_new();
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v5 = getCGImageDestinationCreateWithDataSymbolLoc_ptr;
  v49 = getCGImageDestinationCreateWithDataSymbolLoc_ptr;
  if (!getCGImageDestinationCreateWithDataSymbolLoc_ptr)
  {
    v6 = ImageIOLibrary_5016();
    v5 = dlsym(v6, "CGImageDestinationCreateWithData");
    v47[3] = (uint64_t)v5;
    getCGImageDestinationCreateWithDataSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&v46, 8);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGImageDestinationRef  _Nullable soft_CGImageDestinationCreateWithData(CFMutableDataRef _Nonnull, CFStringRef _Nonnull, size_t, CFDictionaryRef _Nullable)");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("WFImage+Representations.m"), 19, CFSTR("%s"), dlerror(), v46);

    goto LABEL_44;
  }
  v7 = (id)((uint64_t (*)(void *, void *, uint64_t, _QWORD))v5)(v3, v4, 1, 0);

  if (v7)
  {
    v8 = (void *)objc_opt_new();
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v9 = (uint64_t *)getkCGImagePropertyPNGCompressionFilterSymbolLoc_ptr;
    v49 = (void *)getkCGImagePropertyPNGCompressionFilterSymbolLoc_ptr;
    if (!getkCGImagePropertyPNGCompressionFilterSymbolLoc_ptr)
    {
      v10 = ImageIOLibrary_5016();
      v9 = (uint64_t *)dlsym(v10, "kCGImagePropertyPNGCompressionFilter");
      v47[3] = (uint64_t)v9;
      getkCGImagePropertyPNGCompressionFilterSymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(&v46, 8);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCGImagePropertyPNGCompressionFilter(void)");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("WFImage+Representations.m"), 23, CFSTR("%s"), dlerror(), v46);

      goto LABEL_44;
    }
    v50 = *v9;
    v51[0] = &unk_1E6002628;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v12 = (_QWORD *)getkCGImagePropertyPNGDictionarySymbolLoc_ptr;
    v49 = (void *)getkCGImagePropertyPNGDictionarySymbolLoc_ptr;
    if (!getkCGImagePropertyPNGDictionarySymbolLoc_ptr)
    {
      v13 = ImageIOLibrary_5016();
      v12 = dlsym(v13, "kCGImagePropertyPNGDictionary");
      v47[3] = (uint64_t)v12;
      getkCGImagePropertyPNGDictionarySymbolLoc_ptr = (uint64_t)v12;
    }
    _Block_object_dispose(&v46, 8);
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCGImagePropertyPNGDictionary(void)");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("WFImage+Representations.m"), 22, CFSTR("%s"), dlerror(), v46);

      goto LABEL_44;
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *v12);

    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v14 = (_QWORD *)getkCGImagePropertyPNGBandCountSymbolLoc_ptr;
    v49 = (void *)getkCGImagePropertyPNGBandCountSymbolLoc_ptr;
    if (!getkCGImagePropertyPNGBandCountSymbolLoc_ptr)
    {
      v15 = ImageIOLibrary_5016();
      v14 = dlsym(v15, "kCGImagePropertyPNGBandCount");
      v47[3] = (uint64_t)v14;
      getkCGImagePropertyPNGBandCountSymbolLoc_ptr = (uint64_t)v14;
    }
    _Block_object_dispose(&v46, 8);
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCGImagePropertyPNGBandCount(void)");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("WFImage+Representations.m"), 24, CFSTR("%s"), dlerror(), v46);

      goto LABEL_44;
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E6002640, *v14);
    -[WFImage scale](self, "scale");
    if (v16 != 1.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 * 72.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = 0;
      v47 = &v46;
      v48 = 0x2020000000;
      v18 = (_QWORD *)getkCGImagePropertyDPIWidthSymbolLoc_ptr;
      v49 = (void *)getkCGImagePropertyDPIWidthSymbolLoc_ptr;
      if (!getkCGImagePropertyDPIWidthSymbolLoc_ptr)
      {
        v19 = ImageIOLibrary_5016();
        v18 = dlsym(v19, "kCGImagePropertyDPIWidth");
        v47[3] = (uint64_t)v18;
        getkCGImagePropertyDPIWidthSymbolLoc_ptr = (uint64_t)v18;
      }
      _Block_object_dispose(&v46, 8);
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCGImagePropertyDPIWidth(void)");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("WFImage+Representations.m"), 25, CFSTR("%s"), dlerror(), v46);

        goto LABEL_44;
      }
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, *v18);
      v46 = 0;
      v47 = &v46;
      v48 = 0x2020000000;
      v20 = (_QWORD *)getkCGImagePropertyDPIHeightSymbolLoc_ptr;
      v49 = (void *)getkCGImagePropertyDPIHeightSymbolLoc_ptr;
      if (!getkCGImagePropertyDPIHeightSymbolLoc_ptr)
      {
        v21 = ImageIOLibrary_5016();
        v20 = dlsym(v21, "kCGImagePropertyDPIHeight");
        v47[3] = (uint64_t)v20;
        getkCGImagePropertyDPIHeightSymbolLoc_ptr = (uint64_t)v20;
      }
      _Block_object_dispose(&v46, 8);
      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFStringRef getkCGImagePropertyDPIHeight(void)");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("WFImage+Representations.m"), 26, CFSTR("%s"), dlerror(), v46);

        goto LABEL_44;
      }
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, *v20);

    }
    v22 = -[WFImage createNonRotatedCGImageRepresentation](self, "createNonRotatedCGImageRepresentation");
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v23 = getCGImageDestinationAddImageSymbolLoc_ptr;
    v49 = getCGImageDestinationAddImageSymbolLoc_ptr;
    if (!getCGImageDestinationAddImageSymbolLoc_ptr)
    {
      v24 = ImageIOLibrary_5016();
      v23 = dlsym(v24, "CGImageDestinationAddImage");
      v47[3] = (uint64_t)v23;
      getCGImageDestinationAddImageSymbolLoc_ptr = v23;
    }
    _Block_object_dispose(&v46, 8);
    if (v23)
    {
      ((void (*)(id, CGImage *, void *))v23)(v7, v22, v8);
      CGImageRelease(v22);
      v46 = 0;
      v47 = &v46;
      v48 = 0x2020000000;
      v25 = getCGImageDestinationFinalizeSymbolLoc_ptr;
      v49 = getCGImageDestinationFinalizeSymbolLoc_ptr;
      if (!getCGImageDestinationFinalizeSymbolLoc_ptr)
      {
        v26 = ImageIOLibrary_5016();
        v25 = dlsym(v26, "CGImageDestinationFinalize");
        v47[3] = (uint64_t)v25;
        getCGImageDestinationFinalizeSymbolLoc_ptr = v25;
      }
      _Block_object_dispose(&v46, 8);
      if (v25)
      {
        v27 = ((uint64_t (*)(id))v25)(v7);
        CFRelease(v7);
        if (v27)
          v28 = v3;
        else
          v28 = 0;
        v7 = v28;

        goto LABEL_33;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_Bool soft_CGImageDestinationFinalize(CGImageDestinationRef _Nonnull)");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("WFImage+Representations.m"), 21, CFSTR("%s"), dlerror(), v46);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void soft_CGImageDestinationAddImage(CGImageDestinationRef _Nonnull, CGImageRef _Nonnull, CFDictionaryRef _Nullable)");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("WFImage+Representations.m"), 20, CFSTR("%s"), dlerror(), v46);

    }
LABEL_44:
    __break(1u);
  }
LABEL_33:

  return (NSData *)v7;
}

- (BOOL)hasValidImage
{
  return -[WFImage internalCGImage](self, "internalCGImage") != 0;
}

- (CGImage)createNonRotatedCGImageRepresentation
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  CGImage *Image;

  if (-[WFImage orientation](self, "orientation") == 1)
    return CGImageRetain(-[WFImage CGImage](self, "CGImage"));
  -[WFImage sizeInPoints](self, "sizeInPoints");
  v5 = v4;
  v7 = v6;
  -[WFImage scale](self, "scale");
  +[WFBitmapContext HDRCapableContextWithSize:scale:](WFBitmapContext, "HDRCapableContextWithSize:scale:", v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C9D538];
  v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[WFImage sizeInPoints](self, "sizeInPoints");
  -[WFImage drawInContext:inRect:](self, "drawInContext:inRect:", v9, v10, v11, v12, v13);
  v14 = objc_retainAutorelease(v9);
  Image = CGBitmapContextCreateImage((CGContextRef)objc_msgSend(v14, "CGContext"));

  return Image;
}

- (CGImage)internalCGImage
{
  id *p_internalCGImage;
  CGImage *WeakRetained;
  CGImage *v5;
  CGImageSource *v6;
  void *v7;
  void *v8;
  CGImageRef v9;
  void *v10;
  CGImage *result;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;

  p_internalCGImage = &self->_internalCGImage;
  WeakRetained = (CGImage *)objc_loadWeakRetained(&self->_internalCGImage);
  if (!WeakRetained)
  {
    v5 = 0;
    switch(-[WFImage representationType](self, "representationType"))
    {
      case 0:
        return v5;
      case 1:
      case 2:
        v6 = -[WFImage internalImageSource](self, "internalImageSource");
        v14 = 0;
        v15 = &v14;
        v16 = 0x2020000000;
        v7 = getCGImageSourceCreateImageAtIndexSymbolLoc_ptr;
        v17 = getCGImageSourceCreateImageAtIndexSymbolLoc_ptr;
        if (!getCGImageSourceCreateImageAtIndexSymbolLoc_ptr)
        {
          v8 = ImageIOLibrary();
          v7 = dlsym(v8, "CGImageSourceCreateImageAtIndex");
          v15[3] = (uint64_t)v7;
          getCGImageSourceCreateImageAtIndexSymbolLoc_ptr = v7;
        }
        _Block_object_dispose(&v14, 8);
        if (!v7)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGImageRef  _Nullable soft_CGImageSourceCreateImageAtIndex(CGImageSourceRef _Nonnull, size_t, CFDictionaryRef _Nullable)");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("WFImage.m"), 42, CFSTR("%s"), dlerror());

          __break(1u);
          return result;
        }
        v9 = (CGImageRef)((uint64_t (*)(CGImageSource *, _QWORD, _QWORD))v7)(v6, 0, 0);
LABEL_11:
        v5 = v9;
LABEL_12:
        objc_storeWeak(p_internalCGImage, v5);
        if (v5)
          goto LABEL_13;
        return v5;
      case 3:
        v9 = CGImageRetain(self->_CGImage);
        goto LABEL_11;
      case 4:
      case 5:
        -[WFImage platformImage](self, "platformImage");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = CGImageRetain((CGImageRef)objc_msgSend(v10, "CGImage"));

        goto LABEL_12;
      default:
        objc_storeWeak(p_internalCGImage, 0);
        return 0;
    }
  }
  v5 = WeakRetained;
LABEL_13:
  CFAutorelease(v5);
  return v5;
}

- (unsigned)orientation
{
  CGImageSource *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  unsigned int result;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;

  if ((unint64_t)(-[WFImage representationType](self, "representationType") - 1) > 1)
    return self->_orientation;
  v3 = -[WFImage internalImageSource](self, "internalImageSource");
  soft_CGImageSourceCopyProperties((uint64_t)v3);
  v5 = v4;
  getkCGImagePropertyOrientation();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
LABEL_4:
    v9 = objc_msgSend(v8, "integerValue");

LABEL_5:
    return v9;
  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v11 = getCGImageSourceGetCountSymbolLoc_ptr;
  v23 = getCGImageSourceGetCountSymbolLoc_ptr;
  if (!getCGImageSourceGetCountSymbolLoc_ptr)
  {
    v12 = ImageIOLibrary();
    v11 = dlsym(v12, "CGImageSourceGetCount");
    v21[3] = (uint64_t)v11;
    getCGImageSourceGetCountSymbolLoc_ptr = v11;
  }
  _Block_object_dispose(&v20, 8);
  if (v11)
  {
    if (!((uint64_t (*)(CGImageSource *))v11)(v3))
    {
      v9 = 1;
      goto LABEL_5;
    }
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v13 = getCGImageSourceCopyPropertiesAtIndexSymbolLoc_ptr;
    v23 = getCGImageSourceCopyPropertiesAtIndexSymbolLoc_ptr;
    if (!getCGImageSourceCopyPropertiesAtIndexSymbolLoc_ptr)
    {
      v14 = ImageIOLibrary();
      v13 = dlsym(v14, "CGImageSourceCopyPropertiesAtIndex");
      v21[3] = (uint64_t)v13;
      getCGImageSourceCopyPropertiesAtIndexSymbolLoc_ptr = v13;
    }
    _Block_object_dispose(&v20, 8);
    if (v13)
    {
      v15 = (void *)((uint64_t (*)(CGImageSource *, _QWORD, _QWORD))v13)(v3, 0, 0);

      getkCGImagePropertyOrientation();
      objc_msgSend(v15, "objectForKeyedSubscript:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v9 = 1;
        v5 = v15;
        goto LABEL_5;
      }
      v8 = (void *)v17;
      v5 = v15;
      goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFDictionaryRef  _Nullable soft_CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef _Nonnull, size_t, CFDictionaryRef _Nullable)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("WFImage.m"), 44, CFSTR("%s"), dlerror());
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t soft_CGImageSourceGetCount(CGImageSourceRef _Nonnull)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("WFImage.m"), 45, CFSTR("%s"), dlerror());
  }

  __break(1u);
  return result;
}

- (int64_t)representationType
{
  return self->_representationType;
}

- (CGImage)CGImage
{
  CGImage *CGImage;
  CGImageRef v4;

  CGImage = self->_CGImage;
  if (!CGImage)
    return -[WFImage internalCGImage](self, "internalCGImage");
  v4 = CGImageRetain(CGImage);
  CFAutorelease(v4);
  return self->_CGImage;
}

- (UIImage)platformImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFImage tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFImage tintColor](self, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFImage imageWithTintColor:](self, "imageWithTintColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "untintedPlatformImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFImage untintedPlatformImage](self, "untintedPlatformImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (UIImage *)v6;
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolSize:(unint64_t)a5 scaleFactor:(double)a6
{
  id v10;
  void *v11;

  v10 = a3;
  objc_msgSend(a1, "glyphNamed:pointSize:symbolSize:symbolWeight:scaleFactor:rightToLeft:appearanceName:inCatalogs:", v10, a5, 4, WFShouldReverseLayoutDirection(), CFSTR("UIAppearanceLight"), 0, a4, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolSize:(unint64_t)a5 symbolWeight:(int64_t)a6 scaleFactor:(double)a7 rightToLeft:(BOOL)a8 appearanceName:(id)a9 inCatalogs:(id)a10
{
  _BOOL4 v12;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  WFImage *v31;
  void *v32;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v12 = a8;
  v40 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v20 = a9;
  v21 = a10;
  v22 = v21;
  if (v19)
  {
    if (v21)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFImage+Glyphs.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  if (!v22)
  {
LABEL_3:
    WFImageBeginUsingCoreGlyphsCatalogs();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    WFImageEndUsingCoreGlyphsCatalogs();
  }
LABEL_4:
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v23 = v22;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v36;
    if (v12)
      v27 = 4;
    else
      v27 = 5;
    if (a5 < 3)
      v28 = a5 + 1;
    else
      v28 = 0;
    while (2)
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v36 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v29), "namedVectorGlyphWithName:scaleFactor:deviceIdiom:layoutDirection:glyphSize:glyphWeight:glyphPointSize:appearanceName:", v19, 0, v27, v28, a6, v20, a7, a4);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          v32 = v30;
          v31 = -[WFImage initWithCGImage:scale:orientation:renderingMode:]([WFImage alloc], "initWithCGImage:scale:orientation:renderingMode:", objc_msgSend(v30, "image"), 1, 2, a7);

          goto LABEL_19;
        }
        ++v29;
      }
      while (v25 != v29);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v25)
        continue;
      break;
    }
  }
  v31 = 0;
LABEL_19:

  return v31;
}

- (WFImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(unsigned int)a5 renderingMode:(unint64_t)a6
{
  WFImage *v10;
  WFImage *v11;

  if (a3 && (self = -[WFImage initWithRepresentationType:](self, "initWithRepresentationType:", 3)) != 0)
  {
    v10 = self;
    self->_CGImage = CGImageRetain(a3);
    v10->_scale = a4;
    v10->_orientation = a5;
    v10->_renderingMode = a6;
    self = v10;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)systemImageNamed:(id)a3 configuration:(id)a4 renderingMode:(unint64_t)a5
{
  id v7;
  id v8;
  WFImage *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[WFImage initWithSymbolName:configuration:renderingMode:]([WFImage alloc], "initWithSymbolName:configuration:renderingMode:", v8, v7, a5);

  return v9;
}

- (WFImage)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  WFImage *v10;
  void *tintColor;
  uint64_t v12;
  WFImage *v13;
  WFColor *v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("renderingMode"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tintColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("displayStyle"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolConfiguration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[WFImage initWithSymbolName:configuration:renderingMode:](self, "initWithSymbolName:configuration:renderingMode:", v8, v9, v5);

    if (!v10)
      goto LABEL_10;
    goto LABEL_7;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
  tintColor = (void *)objc_claimAutoreleasedReturnValue();
  if (!tintColor)
  {
    v10 = -[WFImage initWithRepresentationType:](self, "initWithRepresentationType:", 0);
    goto LABEL_9;
  }
  v12 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsAnimated"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("scale"));
  v13 = -[WFImage initWithData:scale:allowAnimated:](self, "initWithData:scale:allowAnimated:", tintColor, v12);
  v10 = v13;
  if (v13)
  {
    v13->_renderingMode = v5;

LABEL_7:
    v10->_displayStyle = v7;
    v14 = v6;
    tintColor = v10->_tintColor;
    v10->_tintColor = v14;
  }
LABEL_9:

LABEL_10:
  return v10;
}

- (WFImage)initWithSymbolName:(id)a3 configuration:(id)a4 renderingMode:(unint64_t)a5
{
  id v8;
  id v9;
  WFImage *v10;
  uint64_t v11;
  NSString *symbolName;
  WFImage *v13;

  v8 = a3;
  v9 = a4;
  v10 = -[WFImage initWithRepresentationType:](self, "initWithRepresentationType:", 4);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    symbolName = v10->_symbolName;
    v10->_symbolName = (NSString *)v11;

    v10->_renderingMode = a5;
    objc_storeStrong((id *)&v10->_symbolConfiguration, a4);
    v13 = v10;
  }

  return v10;
}

- (WFImage)initWithRepresentationType:(int64_t)a3
{
  WFImage *v4;
  WFImage *v5;
  WFImage *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFImage;
  v4 = -[WFImage init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_representationType = a3;
    v4->_scale = 1.0;
    v4->_orientation = 1;
    v4->_renderingMode = 0;
    v6 = v4;
  }

  return v5;
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4
{
  return (id)objc_msgSend(a1, "imageNamed:inBundle:scale:", a3, a4, 0.0);
}

+ (id)imageNamed:(id)a3 inBundle:(id)a4 scale:(double)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  WFImage *v12;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  v12 = -[WFImage initWithName:bundle:scale:]([WFImage alloc], "initWithName:bundle:scale:", v7, v10, a5);

  return v12;
}

- (id)tintedImageWithColor:(id)a3
{
  id v5;
  WFBitmapContext *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  WFBitmapContext *v12;
  CGContext *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v24;
  CGRect v25;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFImage+Tinting.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("color"));

  }
  v6 = [WFBitmapContext alloc];
  -[WFImage sizeInPoints](self, "sizeInPoints");
  v8 = v7;
  v10 = v9;
  -[WFImage scale](self, "scale");
  v12 = objc_retainAutorelease(-[WFBitmapContext initWithSize:opaque:scale:](v6, "initWithSize:opaque:scale:", 0, v8, v10, v11));
  v13 = -[WFBitmapContext CGContext](v12, "CGContext");
  v14 = *MEMORY[0x1E0C9D538];
  v15 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[WFImage sizeInPoints](self, "sizeInPoints");
  v17 = v16;
  v19 = v18;
  v20 = objc_retainAutorelease(v5);
  CGContextSetFillColorWithColor(v13, (CGColorRef)objc_msgSend(v20, "CGColor"));
  v25.origin.x = v14;
  v25.origin.y = v15;
  v25.size.width = v17;
  v25.size.height = v19;
  CGContextFillRect(v13, v25);
  -[WFImage drawInContext:inRect:blendMode:alpha:](self, "drawInContext:inRect:blendMode:alpha:", v12, 22, v14, v15, v17, v19, 1.0);
  -[WFBitmapContext image](v12, "image");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageWithRenderingMode:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (WFImage)initWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(unsigned int)a5
{
  return -[WFImage initWithCGImage:scale:orientation:renderingMode:](self, "initWithCGImage:scale:orientation:renderingMode:", a3, *(_QWORD *)&a5, 0, a4);
}

- (WFImage)init
{
  return -[WFImage initWithRepresentationType:](self, "initWithRepresentationType:", 0);
}

- (WFImage)initWithContentsOfURL:(id)a3
{
  id v5;
  WFImage *v6;
  WFImage *v7;

  v5 = a3;
  if (v5
    && (v6 = -[WFImage initWithRepresentationType:](self, "initWithRepresentationType:", 1), (self = v6) != 0)
    && (objc_storeStrong((id *)&v6->_URL, a3), -[WFImage hasValidImage](self, "hasValidImage")))
  {
    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (WFImage)initWithData:(id)a3 scale:(double)a4 allowAnimated:(BOOL)a5
{
  id v8;
  NSData *v9;
  NSData *data;
  WFImage *v11;

  v8 = a3;
  if (v8
    && (self = -[WFImage initWithRepresentationType:](self, "initWithRepresentationType:", 2)) != 0
    && (v9 = (NSData *)objc_msgSend(v8, "copy"),
        data = self->_data,
        self->_data = v9,
        data,
        self->_scale = a4,
        self->_allowsAnimated = a5,
        -[WFImage hasValidImage](self, "hasValidImage")))
  {
    self = self;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (WFImage)initWithName:(id)a3 bundle:(id)a4 scale:(double)a5
{
  id v8;
  id v9;
  WFImage *v10;
  uint64_t v11;
  NSString *name;
  WFImage *v13;

  v8 = a3;
  v9 = a4;
  v10 = -[WFImage initWithRepresentationType:](self, "initWithRepresentationType:", 5);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v11;

    objc_storeStrong((id *)&v10->_bundle, a4);
    v10->_scale = a5;
    v13 = v10;
  }

  return v10;
}

- (WFImage)initWithPlatformImage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  WFImage *v9;
  uint64_t v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "renderingMode");
    v7 = objc_msgSend(v5, "imageOrientation") - 1;
    if (v7 > 6)
      v8 = 1;
    else
      v8 = dword_1AF780900[v7];
    v10 = objc_msgSend(v5, "CGImage");
    objc_msgSend(v5, "scale");
    self = -[WFImage initWithCGImage:scale:orientation:renderingMode:](self, "initWithCGImage:scale:orientation:renderingMode:", v10, v8, v6);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (WFImage)initWithPlatformImage:(id)a3 scale:(double)a4
{
  WFImage *v5;
  WFImage *v6;
  WFImage *v7;

  v5 = -[WFImage initWithPlatformImage:](self, "initWithPlatformImage:", a3);
  v6 = v5;
  if (v5)
  {
    v5->_scale = a4;
    v7 = v5;
  }

  return v6;
}

- (void)drawInContext:(id)a3 inRect:(CGRect)a4 blendMode:(int)a5 alpha:(double)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  CGContext *v15;
  CGFloat MinX;
  CGFloat MaxY;
  double v18;
  CGImage *v19;
  CGAffineTransform v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  if (!CGRectIsEmpty(v21))
  {
    v14 = objc_retainAutorelease(v13);
    v15 = (CGContext *)objc_msgSend(v14, "CGContext");
    CGContextSaveGState(v15);
    CGContextSetBlendMode(v15, (CGBlendMode)a5);
    CGContextSetAlpha(v15, a6);
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    MinX = CGRectGetMinX(v22);
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    MaxY = CGRectGetMaxY(v23);
    CGContextTranslateCTM(v15, MinX, MaxY);
    CGContextScaleCTM(v15, 1.0, -1.0);
    objc_msgSend(v14, "scale");
    -[WFImage contentsTransformForDrawingWithSize:scale:](self, "contentsTransformForDrawingWithSize:scale:", width, height, v18);
    CGContextConcatCTM(v15, &v20);
    v19 = -[WFImage CGImage](self, "CGImage");
    if (v19)
    {
      v24.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
      v24.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
      v24.size.width = width;
      v24.size.height = height;
      CGContextDrawImage(v15, v24, v19);
    }
    CGContextRestoreGState(v15);
  }

}

- (id)imageByTintingBitmapWithTintColor:(id)a3
{
  id v4;
  WFBitmapContext *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  WFBitmapContext *v11;
  CGContext *v12;
  id v13;
  CGColor *v14;
  WFBitmapContext *v15;
  CGContext *v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  CGRect v25;

  v4 = a3;
  v5 = [WFBitmapContext alloc];
  -[WFImage sizeInPoints](self, "sizeInPoints");
  v7 = v6;
  v9 = v8;
  -[WFImage scale](self, "scale");
  v11 = objc_retainAutorelease(-[WFBitmapContext initWithSize:opaque:scale:](v5, "initWithSize:opaque:scale:", 0, v7, v9, v10));
  v12 = -[WFBitmapContext CGContext](v11, "CGContext");
  v13 = objc_retainAutorelease(v4);
  v14 = (CGColor *)objc_msgSend(v13, "CGColor");

  CGContextSetFillColorWithColor(v12, v14);
  v15 = objc_retainAutorelease(v11);
  v16 = -[WFBitmapContext CGContext](v15, "CGContext");
  -[WFImage sizeInPixels](self, "sizeInPixels");
  v18 = v17;
  -[WFImage sizeInPixels](self, "sizeInPixels");
  v25.size.height = v19;
  v25.origin.x = 0.0;
  v25.origin.y = 0.0;
  v25.size.width = v18;
  CGContextFillRect(v16, v25);
  -[WFImage sizeInPoints](self, "sizeInPoints");
  v21 = v20;
  -[WFImage sizeInPoints](self, "sizeInPoints");
  -[WFImage drawInContext:inRect:blendMode:alpha:](self, "drawInContext:inRect:blendMode:alpha:", v15, 22, 0.0, 0.0, v21, v22, 1.0);
  -[WFBitmapContext image](v15, "image");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (WFImage)imageWithRenderingMode:(unint64_t)a3
{
  WFImage *v5;
  WFImage *v6;
  CGImage *v7;
  double v8;
  uint64_t v9;
  NSString *symbolName;
  uint64_t v11;
  NSString *name;
  uint64_t v13;
  NSBundle *bundle;
  uint64_t v15;
  NSData *data;
  WFImage *v17;

  if (-[WFImage renderingMode](self, "renderingMode") == a3)
  {
    v5 = self;
  }
  else
  {
    v6 = [WFImage alloc];
    v7 = -[WFImage CGImage](self, "CGImage");
    -[WFImage scale](self, "scale");
    v5 = -[WFImage initWithCGImage:scale:orientation:renderingMode:](v6, "initWithCGImage:scale:orientation:renderingMode:", v7, -[WFImage orientation](self, "orientation"), a3, v8);
    if (v5)
    {
      v5->_representationType = -[WFImage representationType](self, "representationType");
      -[WFImage symbolName](self, "symbolName");
      v9 = objc_claimAutoreleasedReturnValue();
      symbolName = v5->_symbolName;
      v5->_symbolName = (NSString *)v9;

      -[WFImage name](self, "name");
      v11 = objc_claimAutoreleasedReturnValue();
      name = v5->_name;
      v5->_name = (NSString *)v11;

      -[WFImage bundle](self, "bundle");
      v13 = objc_claimAutoreleasedReturnValue();
      bundle = v5->_bundle;
      v5->_bundle = (NSBundle *)v13;

      -[WFImage data](self, "data");
      v15 = objc_claimAutoreleasedReturnValue();
      data = v5->_data;
      v5->_data = (NSData *)v15;

      v17 = v5;
    }

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  WFImage *v4;
  WFImage *v5;
  WFImage *v6;
  int64_t v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  _BOOL4 v20;
  CGImage *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;

  v4 = (WFImage *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v18) = 1;
    goto LABEL_17;
  }
  v6 = v4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = -[WFImage representationType](self, "representationType");
    if (v7 == -[WFImage representationType](v6, "representationType"))
    {
      -[WFImage scale](self, "scale");
      v9 = v8;
      -[WFImage scale](v6, "scale");
      if (v9 == v10)
      {
        v11 = -[WFImage orientation](self, "orientation");
        if (v11 == -[WFImage orientation](v6, "orientation"))
        {
          v12 = -[WFImage renderingMode](self, "renderingMode");
          if (v12 == -[WFImage renderingMode](v6, "renderingMode"))
          {
            switch(-[WFImage representationType](self, "representationType"))
            {
              case 1:
                -[WFImage URL](self, "URL");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFImage URL](v6, "URL");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = v13;
                v16 = v14;
                v17 = v16;
                if (v15 == v16)
                {
                  LOBYTE(v18) = 1;
                }
                else
                {
                  LOBYTE(v18) = 0;
                  if (v15 && v16)
                    LOBYTE(v18) = objc_msgSend(v15, "isEqual:", v16);
                }

                goto LABEL_34;
              case 2:
                v20 = -[WFImage allowsAnimated](self, "allowsAnimated");
                if (v20 != -[WFImage allowsAnimated](v6, "allowsAnimated"))
                  goto LABEL_14;
                -[WFImage data](self, "data");
                v15 = (id)objc_claimAutoreleasedReturnValue();
                -[WFImage data](v6, "data");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v18) = objc_msgSend(v15, "isEqual:", v17);
LABEL_34:

                goto LABEL_15;
              case 3:
                v21 = -[WFImage CGImage](self, "CGImage");
                LOBYTE(v18) = v21 == -[WFImage CGImage](v6, "CGImage");
                goto LABEL_15;
              case 4:
                -[WFImage symbolName](self, "symbolName");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFImage symbolName](v6, "symbolName");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = v22;
                v25 = v23;
                v26 = v25;
                if (v24 == v25)
                {

LABEL_36:
                  -[WFImage symbolConfiguration](self, "symbolConfiguration");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WFImage symbolConfiguration](v6, "symbolConfiguration");
                  v33 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_39;
                }
                LOBYTE(v18) = 0;
                v27 = v25;
                v28 = v24;
                if (v24 && v25)
                {
                  v18 = objc_msgSend(v24, "isEqualToString:", v25);

                  if (!v18)
                    goto LABEL_46;
                  goto LABEL_36;
                }
LABEL_45:

LABEL_46:
                break;
              case 5:
                -[WFImage name](self, "name");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFImage name](v6, "name");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = v29;
                v31 = v30;
                v26 = v31;
                if (v24 == v31)
                {

                }
                else
                {
                  LOBYTE(v18) = 0;
                  v27 = v31;
                  v28 = v24;
                  if (!v24 || !v31)
                    goto LABEL_45;
                  v18 = objc_msgSend(v24, "isEqualToString:", v31);

                  if (!v18)
                    goto LABEL_46;
                }
                -[WFImage bundle](self, "bundle");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFImage bundle](v6, "bundle");
                v33 = objc_claimAutoreleasedReturnValue();
LABEL_39:
                v34 = (void *)v33;
                v28 = v32;
                v35 = v34;
                v27 = v35;
                if (v28 == v35)
                {
                  LOBYTE(v18) = 1;
                }
                else
                {
                  LOBYTE(v18) = 0;
                  if (v28 && v35)
                    LOBYTE(v18) = objc_msgSend(v28, "isEqual:", v35);
                }

                goto LABEL_45;
              default:
                LOBYTE(v18) = 1;
                goto LABEL_15;
            }
            goto LABEL_15;
          }
        }
      }
    }
  }
  else
  {

    v6 = 0;
  }
LABEL_14:
  LOBYTE(v18) = 0;
LABEL_15:

LABEL_17:
  return v18;
}

- (CGAffineTransform)contentsTransformForDrawingWithSize:(SEL)a3 scale:(CGSize)a4
{
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  uint64_t v24;
  CGFloat v25;
  double v31;
  __int128 v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  double v56;
  double v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  CGAffineTransform *result;
  __int128 v62;
  double v63;
  double v64;
  __int128 v65;
  __int128 v66;
  __int128 rect;
  double recta;
  CGAffineTransform v69;
  CGAffineTransform v70;
  CGAffineTransform v71;
  CGAffineTransform v72;
  CGAffineTransform v73;
  CGAffineTransform v74;
  CGAffineTransform v75;
  CGAffineTransform v76;
  CGAffineTransform v77;
  CGAffineTransform v78;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGRect v81;
  CGRect v82;

  height = a4.height;
  width = a4.width;
  -[WFImage CGImageSize](self, "CGImageSize");
  v11 = v10;
  -[WFImage scale](self, "scale");
  v13 = v11 / v12;
  -[WFImage CGImageSize](self, "CGImageSize");
  v15 = v14;
  -[WFImage scale](self, "scale");
  v17 = v15 / v16;
  -[WFImage sizeInPoints](self, "sizeInPoints");
  v19 = v18;
  v21 = v20;
  if (a5 == 0.0)
  {
    +[WFDevice currentDevice](WFDevice, "currentDevice");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "screenScale");
    a5 = v23;

  }
  v24 = MEMORY[0x1E0C9BAA8];
  v66 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  rect = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v66;
  v65 = *(_OWORD *)(v24 + 32);
  *(_OWORD *)&retstr->tx = v65;
  CGAffineTransformMakeTranslation(&t2, v13 * -0.5, v17 * -0.5);
  *(_OWORD *)&t1.a = rect;
  *(_OWORD *)&t1.c = v66;
  *(_OWORD *)&t1.tx = v65;
  CGAffineTransformConcat(retstr, &t1, &t2);
  memset(&v78, 0, sizeof(v78));
  v63 = v17;
  v64 = v13;
  switch(-[WFImage orientation](self, "orientation"))
  {
    case 2u:
      v78.tx = 0.0;
      v78.ty = 0.0;
      v78.a = -1.0;
      v78.b = 0.0;
      v25 = 1.0;
      goto LABEL_8;
    case 3u:
      v78.tx = 0.0;
      v78.ty = 0.0;
      v25 = -1.0;
      v78.a = -1.0;
      v78.b = 0.0;
      goto LABEL_8;
    case 4u:
      v78.tx = 0.0;
      v78.ty = 0.0;
      v78.a = 1.0;
      v78.b = 0.0;
      v25 = -1.0;
LABEL_8:
      v78.c = 0.0;
      v78.d = v25;
      break;
    case 5u:
      v78.tx = 0.0;
      v78.ty = 0.0;
      __asm { FMOV            V0.2D, #-1.0 }
      goto LABEL_13;
    case 6u:
      v78.tx = 0.0;
      v78.ty = 0.0;
      _Q0 = xmmword_1AF77F040;
      goto LABEL_13;
    case 7u:
      v78.tx = 0.0;
      v78.ty = 0.0;
      __asm { FMOV            V0.2D, #1.0 }
      goto LABEL_13;
    case 8u:
      v78.tx = 0.0;
      v78.ty = 0.0;
      _Q0 = xmmword_1AF77F050;
LABEL_13:
      *(_OWORD *)&v78.b = _Q0;
      break;
    default:
      *(_OWORD *)&v78.a = rect;
      *(_OWORD *)&v78.c = v66;
      *(_OWORD *)&v78.tx = v65;
      break;
  }
  v31 = round(height * a5) / a5;
  v32 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v77.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v77.c = v32;
  *(_OWORD *)&v77.tx = *(_OWORD *)&retstr->tx;
  v33 = round(width * a5) / a5;
  CGAffineTransformConcat(&t1, &v77, &v78);
  v34 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v34;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeTranslation(&v76, v19 * 0.5, v21 * 0.5);
  v35 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v77.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v77.c = v35;
  *(_OWORD *)&v77.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v77, &v76);
  v36 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v36;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeScale(&v75, v33 / v19, v31 / v21);
  v37 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v77.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v77.c = v37;
  *(_OWORD *)&v77.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v77, &v75);
  v38 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v38;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  v39 = *MEMORY[0x1E0C9D538];
  v40 = *(_QWORD *)(MEMORY[0x1E0C9D538] + 8);
  v41 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v41;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  v42 = v39;
  *(_QWORD *)&v41 = v40;
  v43 = v19;
  v44 = v21;
  v81 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v41 - 8), &t1);
  recta = v19;
  v45 = v81.size.width;
  v46 = v21;
  v47 = v81.size.height;
  CGAffineTransformMakeTranslation(&v74, v33 * -0.5, v31 * -0.5);
  v48 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v77.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v77.c = v48;
  *(_OWORD *)&v77.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v77, &v74);
  v49 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v49;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeScale(&v73, round(a5 * v45) / a5 / v45, round(a5 * v47) / a5 / v47);
  v50 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v77.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v77.c = v50;
  *(_OWORD *)&v77.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v77, &v73);
  v51 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v51;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  CGAffineTransformMakeTranslation(&v72, v33 * 0.5, v31 * 0.5);
  v52 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v77.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v77.c = v52;
  *(_OWORD *)&v77.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v77, &v72);
  v53 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v53;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  v54 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v54;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  v55 = v39;
  *(_QWORD *)&v54 = v40;
  v56 = recta;
  v57 = v46;
  v82 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v54 - 8), &t1);
  CGAffineTransformMakeTranslation(&v71, round(a5 * v82.origin.x) / a5 - v82.origin.x, round(a5 * v82.origin.y) / a5 - v82.origin.y);
  v58 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v77.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v77.c = v58;
  *(_OWORD *)&v77.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&t1, &v77, &v71);
  v59 = *(_OWORD *)&t1.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t1.a;
  *(_OWORD *)&retstr->c = v59;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t1.tx;
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeScale(&t1, v33 / v64, v31 / v63);
  v77 = t1;
  CGAffineTransformInvert(&v70, &v77);
  v60 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v69.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v69.c = v60;
  *(_OWORD *)&v69.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&v77, &v70, &v69);
  v62 = *(_OWORD *)&v77.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v77.a;
  *(_OWORD *)&retstr->c = v62;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v77.tx;
  return result;
}

- (NSImage)NSImage
{
  return (NSImage *)objc_loadWeakRetained((id *)&self->_NSImage);
}

- (NSImage)untintedNSImage
{
  return self->_untintedNSImage;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)name
{
  return self->_name;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (BOOL)allowsAnimated
{
  return self->_allowsAnimated;
}

- (void)drawInContext:(id)a3 inRect:(CGRect)a4
{
  -[WFImage drawInContext:inRect:blendMode:alpha:](self, "drawInContext:inRect:blendMode:alpha:", a3, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 1.0);
}

+ (id)imageWithData:(id)a3 scale:(double)a4
{
  return +[WFImage imageWithData:scale:allowAnimated:](WFImage, "imageWithData:scale:allowAnimated:", a3, 1, a4);
}

+ (id)imageWithData:(id)a3
{
  return +[WFImage imageWithData:scale:](WFImage, "imageWithData:scale:", a3, 1.0);
}

+ (id)imageWithDeviceScreenScaleImageData:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[WFDevice currentDevice](WFDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screenScale");
  +[WFImage imageWithData:scale:](WFImage, "imageWithData:scale:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)imageWithCGImage:(CGImage *)a3
{
  return +[WFImage imageWithCGImage:scale:orientation:](WFImage, "imageWithCGImage:scale:orientation:", a3, 1, 1.0);
}

+ (id)imageWithContentsOfURL:(id)a3
{
  id v3;
  WFImage *v4;

  v3 = a3;
  v4 = -[WFImage initWithContentsOfURL:]([WFImage alloc], "initWithContentsOfURL:", v3);

  return v4;
}

+ (id)imageWithData:(id)a3 scale:(double)a4 allowAnimated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  WFImage *v8;

  v5 = a5;
  v7 = a3;
  v8 = -[WFImage initWithData:scale:allowAnimated:]([WFImage alloc], "initWithData:scale:allowAnimated:", v7, v5, a4);

  return v8;
}

+ (id)imageWithCGImage:(CGImage *)a3 scale:(double)a4 orientation:(unsigned int)a5
{
  return -[WFImage initWithCGImage:scale:orientation:]([WFImage alloc], "initWithCGImage:scale:orientation:", a3, *(_QWORD *)&a5, a4);
}

- (id)applicationIconImageWithFormat:(unint64_t)a3
{
  CGImage *v5;
  void *v6;
  objc_class *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = -[WFImage createNonRotatedCGImageRepresentation](self, "createNonRotatedCGImageRepresentation");
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v6 = (void *)getISImageClass_softClass;
  v19 = getISImageClass_softClass;
  if (!getISImageClass_softClass)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getISImageClass_block_invoke;
    v15[3] = &unk_1E5FC8858;
    v15[4] = &v16;
    __getISImageClass_block_invoke((uint64_t)v15);
    v6 = (void *)v17[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v16, 8);
  v8 = [v7 alloc];
  -[WFImage scale](self, "scale");
  v9 = (void *)objc_msgSend(v8, "initWithCGImage:scale:", v5);
  CGImageRelease(v5);
  v10 = objc_alloc((Class)getISIconClass());
  v20[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithImages:", v11);

  WFImageForIconAndFormat(v12, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)roundedWithContinuousCornerRadius:(double)a3 size:(CGSize)a4
{
  double height;
  double width;
  WFBitmapContext *v8;
  double v9;
  WFBitmapContext *v10;
  CGContext *v11;
  const CGPath *v12;
  void *v13;
  CGRect v15;

  height = a4.height;
  width = a4.width;
  v8 = [WFBitmapContext alloc];
  -[WFImage scale](self, "scale");
  v10 = objc_retainAutorelease(-[WFBitmapContext initWithSize:opaque:scale:](v8, "initWithSize:opaque:scale:", 0, width, height, v9));
  v11 = -[WFBitmapContext CGContext](v10, "CGContext");
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = width;
  v15.size.height = height;
  v12 = CGPathCreateWithRoundedRect(v15, a3, a3, 0);
  CGContextAddPath(v11, v12);
  CGContextClip(v11);
  -[WFImage drawInContext:inRect:](self, "drawInContext:inRect:", v10, 0.0, 0.0, width, height);
  -[WFBitmapContext image](v10, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)applicationIconImageForBundleIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "applicationIconImageForBundleIdentifier:format:", a3, 0);
}

+ (id)applicationIconImageForBundleIdentifier:(id)a3 format:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  WFImageApplicationIconCache();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%lu"), v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;
    goto LABEL_20;
  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilecal"))
    || (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(a1, "applicationIconImageForCalendarDate:format:", v13, a4),
        v12 = (id)objc_claimAutoreleasedReturnValue(),
        v13,
        !v12))
  {
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isValid");

    if ((v16 & 1) != 0)
    {
      v17 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForSystemPlaceholder:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "appState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isPlaceholder");

      if (!v19)
      {
        v12 = 0;
LABEL_14:

        goto LABEL_16;
      }
    }
    if (!v17)
    {
      v12 = 0;
      goto LABEL_16;
    }
    v20 = (void *)objc_msgSend(objc_alloc((Class)getISIconClass()), "initWithResourceProxy:", v17);
    WFImageForIconAndFormat(v20, a4);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
LABEL_16:
  WFImageApplicationIconCache();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v21 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%lu"), v6, a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v21, v22);

  if (!v12)
LABEL_20:

  return v12;
}

+ (id)_applicationIconImageLoadingQueue
{
  if (_applicationIconImageLoadingQueue_onceToken != -1)
    dispatch_once(&_applicationIconImageLoadingQueue_onceToken, &__block_literal_global_5375);
  return (id)_applicationIconImageLoadingQueue_queue;
}

+ (void)applicationIconImageForBundleIdentifier:(id)a3 length:(double)a4 scale:(double)a5 completionHandler:(id)a6
{
  id v10;
  void (**v11)(id, void *);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD block[4];
  id v21;
  id v22;
  void (**v23)(id, void *);

  v10 = a3;
  v11 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", a4, a4, a5);
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.mobilecal"))
    && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(a1, "applicationIconImageForCalendarDate:format:", v13, 2),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v14))
  {
    v11[2](v11, v14);
  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD728]), "initWithBundleIdentifier:", v10);
    if (objc_msgSend(v14, "isInstalled"))
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithBundleIdentifier:", v10);
      objc_msgSend(v15, "imageForDescriptor:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16 && (objc_msgSend(v16, "placeholder") & 1) == 0)
      {
        +[WFImage imageWithCGImage:](WFImage, "imageWithCGImage:", objc_msgSend(v17, "CGImage"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v11[2](v11, v19);

        goto LABEL_9;
      }

    }
    objc_msgSend(a1, "_applicationIconImageLoadingQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke;
    block[3] = &unk_1E5FC7900;
    v21 = v14;
    v22 = v12;
    v23 = v11;
    dispatch_async(v18, block);

  }
LABEL_9:

}

+ (id)documentIconImageForFileType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;
  id v12;
  id *v13;
  void *v14;
  id v15;
  id *v16;
  void *v17;
  id v18;
  id *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[3];
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CA58C8];
  objc_msgSend(v3, "utType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MIMEType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentProxyForName:type:MIMEType:", 0, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc((Class)getISIconClass()), "initWithResourceProxy:", v8);
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v10 = (id *)getkISImageDescriptorCustomDocumentSizeSymbolLoc_ptr;
  v43 = getkISImageDescriptorCustomDocumentSizeSymbolLoc_ptr;
  if (!getkISImageDescriptorCustomDocumentSizeSymbolLoc_ptr)
  {
    v11 = IconServicesLibrary();
    v10 = (id *)dlsym(v11, "kISImageDescriptorCustomDocumentSize");
    v41[3] = (uint64_t)v10;
    getkISImageDescriptorCustomDocumentSizeSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v40, 8);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ISImageDescriptorName getkISImageDescriptorCustomDocumentSize(void)");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("WFImage+Icons.m"), 29, CFSTR("%s"), dlerror(), v40);

    goto LABEL_21;
  }
  v12 = *v10;
  v44[0] = v12;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v13 = (id *)getkISImageDescriptorBadgedDocumentSizeSymbolLoc_ptr;
  v43 = getkISImageDescriptorBadgedDocumentSizeSymbolLoc_ptr;
  if (!getkISImageDescriptorBadgedDocumentSizeSymbolLoc_ptr)
  {
    v14 = IconServicesLibrary();
    v13 = (id *)dlsym(v14, "kISImageDescriptorBadgedDocumentSize");
    v41[3] = (uint64_t)v13;
    getkISImageDescriptorBadgedDocumentSizeSymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(&v40, 8);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ISImageDescriptorName getkISImageDescriptorBadgedDocumentSize(void)");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("WFImage+Icons.m"), 30, CFSTR("%s"), dlerror(), v40);

    goto LABEL_21;
  }
  v15 = *v13;
  v44[1] = v15;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v16 = (id *)getkISImageDescriptorCustomDocumentScalableSizeSymbolLoc_ptr;
  v43 = getkISImageDescriptorCustomDocumentScalableSizeSymbolLoc_ptr;
  if (!getkISImageDescriptorCustomDocumentScalableSizeSymbolLoc_ptr)
  {
    v17 = IconServicesLibrary();
    v16 = (id *)dlsym(v17, "kISImageDescriptorCustomDocumentScalableSize");
    v41[3] = (uint64_t)v16;
    getkISImageDescriptorCustomDocumentScalableSizeSymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&v40, 8);
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ISImageDescriptorName getkISImageDescriptorCustomDocumentScalableSize(void)");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("WFImage+Icons.m"), 31, CFSTR("%s"), dlerror(), v40);

    goto LABEL_21;
  }
  v18 = *v16;
  v44[2] = v18;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v19 = (id *)getkISImageDescriptorBadgedDocumentScalableSizeSymbolLoc_ptr;
  v43 = getkISImageDescriptorBadgedDocumentScalableSizeSymbolLoc_ptr;
  if (!getkISImageDescriptorBadgedDocumentScalableSizeSymbolLoc_ptr)
  {
    v20 = IconServicesLibrary();
    v19 = (id *)dlsym(v20, "kISImageDescriptorBadgedDocumentScalableSize");
    v41[3] = (uint64_t)v19;
    getkISImageDescriptorBadgedDocumentScalableSizeSymbolLoc_ptr = (uint64_t)v19;
  }
  _Block_object_dispose(&v40, 8);
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ISImageDescriptorName getkISImageDescriptorBadgedDocumentScalableSize(void)");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("WFImage+Icons.m"), 32, CFSTR("%s"), dlerror(), v40);

LABEL_21:
    __break(1u);
  }
  v45 = *v19;
  v21 = (void *)MEMORY[0x1E0C99D20];
  v22 = v45;
  objc_msgSend(v21, "arrayWithObjects:count:", v44, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  WFISImagesForIconAndDescriptorNames(v9, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "if_firstObjectPassingTest:", &__block_literal_global_48_5371);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    v27 = v25;
  }
  else
  {
    objc_msgSend(v24, "firstObject");
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = v27;
  v29 = objc_msgSend(v27, "CGImage");
  objc_msgSend(v28, "scale");
  +[WFImage imageWithCGImage:scale:orientation:](WFImage, "imageWithCGImage:scale:orientation:", v29, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

+ (id)applicationIconImageForCalendarDate:(id)a3 format:(unint64_t)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v14;
  _QWORD block[4];
  id v16;
  __int128 *v17;
  void **v18;
  unint64_t v19;
  void *v20;
  void **v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  __int128 v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20 = 0;
  if (!CalendarUIKitLibraryCore_frameworkLibrary)
  {
    v26 = xmmword_1E5FC6108;
    v27 = 0;
    CalendarUIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CalendarUIKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CalendarUIKitLibrary(void)");
    a4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", a4, CFSTR("WFImage+Icons.m"), 21, CFSTR("%s"), v20);

    __break(1u);
    free(v14);
  }
  *(_QWORD *)&v26 = 0;
  *((_QWORD *)&v26 + 1) = &v26;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__5364;
  v29 = __Block_byref_object_dispose__5365;
  v30 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__5364;
  v24 = __Block_byref_object_dispose__5365;
  v25 = 0;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    v6 = objc_alloc((Class)getISIconClass());
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithDate:calendar:format:", v5, v7, 0);
    v9 = *(void **)(*((_QWORD *)&v26 + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&v26 + 1) + 40) = v8;

    WFImageForIconAndFormat(*(void **)(*((_QWORD *)&v26 + 1) + 40), a4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v21[5];
    v21[5] = (void *)v10;
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__WFImage_Icons__applicationIconImageForCalendarDate_format___block_invoke;
    block[3] = &unk_1E5FC60B0;
    v17 = &v26;
    v16 = v5;
    v18 = &v20;
    v19 = a4;
    dispatch_sync(MEMORY[0x1E0C80D38], block);
    v11 = v16;
  }

  v12 = v21[5];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v12;
}

void __61__WFImage_Icons__applicationIconImageForCalendarDate_format___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = objc_alloc((Class)getISIconClass());
  v3 = a1[4];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "initWithDate:calendar:format:", v3, v4, 0);
  v6 = *(_QWORD *)(a1[5] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  WFImageForIconAndFormat(*(void **)(*(_QWORD *)(a1[5] + 8) + 40), a1[7]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

uint64_t __47__WFImage_Icons__documentIconImageForFileType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "placeholder") ^ 1;
}

void __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolvedAppMatchingDescriptor:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isInstalled"))
  {
    v4 = objc_alloc(MEMORY[0x1E0D3A820]);
    objc_msgSend(v3, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithBundleIdentifier:", v5);

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke_2;
    v20[3] = &unk_1E5FC6020;
    v7 = *(_QWORD *)(a1 + 40);
    v21 = *(id *)(a1 + 48);
    objc_msgSend(v6, "getImageForImageDescriptor:completion:", v7, v20);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "size");
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 40), "scale");
    v11 = v9 * v10;
    objc_msgSend(*(id *)(a1 + 40), "size");
    v13 = v12;
    objc_msgSend(*(id *)(a1 + 40), "scale");
    v15 = v13 * v14;
    objc_msgSend(v3, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke_4;
    v17[3] = &unk_1E5FC6048;
    v19 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 40);
    +[WFAppIconLoader loadIconWithBundleIdentifier:desiredSize:completionHandler:](WFAppIconLoader, "loadIconWithBundleIdentifier:desiredSize:completionHandler:", v16, v17, v11, v15);

    v6 = v19;
  }

}

void __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke_3;
  v6[3] = &unk_1E5FC72E0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke_5;
  block[3] = &unk_1E5FC7900;
  v6 = v3;
  v8 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke_5(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (a1[4])
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D3A820], "genericApplicationIcon");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "imageForDescriptor:", a1[5]);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v3 = a1[6];
    +[WFImage imageWithCGImage:](WFImage, "imageWithCGImage:", objc_msgSend(v5, "CGImage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
}

void __89__WFImage_Icons__applicationIconImageForBundleIdentifier_length_scale_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  +[WFImage imageWithCGImage:](WFImage, "imageWithCGImage:", objc_msgSend(*(id *)(a1 + 32), "CGImage"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __51__WFImage_Icons___applicationIconImageLoadingQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.shortcuts.WFImage-ApplicationIconLoading", v2);
  v1 = (void *)_applicationIconImageLoadingQueue_queue;
  _applicationIconImageLoadingQueue_queue = (uint64_t)v0;

}

+ (id)glyphNamed:(id)a3 pointSize:(double)a4
{
  return (id)objc_msgSend(a1, "glyphNamed:pointSize:symbolSize:", a3, 1, a4);
}

+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolWeight:(int64_t)a5 scaleFactor:(double)a6
{
  return (id)objc_msgSend(a1, "glyphNamed:pointSize:symbolSize:symbolWeight:scaleFactor:rightToLeft:appearanceName:inCatalogs:", a3, 1, a5, 0, CFSTR("UIAppearanceLight"), 0, a4, a6);
}

+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolSize:(unint64_t)a5
{
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v15;

  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFImage+Glyphs.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  +[WFDevice currentDevice](WFDevice, "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "screenScale");
  v12 = v11;

  objc_msgSend(a1, "glyphNamed:pointSize:symbolSize:symbolWeight:scaleFactor:rightToLeft:appearanceName:inCatalogs:", v9, a5, 4, WFShouldReverseLayoutDirection(), CFSTR("UIAppearanceLight"), 0, a4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)glyphNamed:(id)a3 pointSize:(double)a4 inCatalogs:(id)a5
{
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v16;

  v9 = a3;
  v10 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFImage+Glyphs.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  +[WFDevice currentDevice](WFDevice, "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "screenScale");
  v13 = v12;

  objc_msgSend(a1, "glyphNamed:pointSize:symbolSize:symbolWeight:scaleFactor:rightToLeft:appearanceName:inCatalogs:", v9, 1, 4, WFShouldReverseLayoutDirection(), CFSTR("UIAppearanceLight"), v10, a4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolWeight:(int64_t)a5 scaleFactor:(double)a6 inCatalogs:(id)a7
{
  id v13;
  id v14;
  void *v15;
  void *v17;

  v13 = a3;
  v14 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFImage+Glyphs.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  objc_msgSend(a1, "glyphNamed:pointSize:symbolSize:symbolWeight:scaleFactor:rightToLeft:appearanceName:inCatalogs:", v13, 1, a5, WFShouldReverseLayoutDirection(), CFSTR("UIAppearanceLight"), v14, a4, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)glyphNamed:(id)a3 pointSize:(double)a4 symbolSize:(unint64_t)a5 scaleFactor:(double)a6 rightToLeft:(BOOL)a7 appearanceName:(id)a8
{
  return (id)objc_msgSend(a1, "glyphNamed:pointSize:symbolSize:symbolWeight:scaleFactor:rightToLeft:appearanceName:inCatalogs:", a3, a5, 4, a7, CFSTR("UIAppearanceLight"), 0, a4, a6);
}

- (id)resizedImageWithSizeInPoints:(CGSize)a3
{
  double height;
  double width;
  double v6;

  height = a3.height;
  width = a3.width;
  -[WFImage scale](self, "scale");
  return -[WFImage resizedImageWithSizeInPoints:scale:](self, "resizedImageWithSizeInPoints:scale:", width, height, v6);
}

- (id)resizedImageWithSizeInPoints:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;

  height = a3.height;
  width = a3.width;
  +[WFBitmapContext HDRCapableContextWithSize:scale:](WFBitmapContext, "HDRCapableContextWithSize:scale:", a3.width, a3.height, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[WFImage drawInContext:inRect:](self, "drawInContext:inRect:", v7, 0.0, 0.0, width, height);
    objc_msgSend(v7, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithRenderingMode:", -[WFImage renderingMode](self, "renderingMode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
