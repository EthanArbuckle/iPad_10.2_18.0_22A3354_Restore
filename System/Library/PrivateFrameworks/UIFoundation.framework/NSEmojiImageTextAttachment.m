@implementation NSEmojiImageTextAttachment

+ (BOOL)_readsEmojiImageTextAttachmentFromDocumentFormats
{
  if (_readsEmojiImageTextAttachmentFromDocumentFormats_onceToken != -1)
    dispatch_once(&_readsEmojiImageTextAttachmentFromDocumentFormats_onceToken, &__block_literal_global_35);
  return _readsEmojiImageTextAttachmentFromDocumentFormats__readsEmojiImageTextAttachmentFromDocumentFormats;
}

void __79__NSEmojiImageTextAttachment__readsEmojiImageTextAttachmentFromDocumentFormats__block_invoke()
{
  void *v0;
  char v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForKey:", CFSTR("_NSReadsEmojiImageTextAttachmentFromDocumentFormats"));
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (v2)
    v1 = objc_msgSend(v2, "BOOLValue");
  else
    v1 = +[NSAdaptiveImageGlyph prefersEmojiImageTextAttachment](NSAdaptiveImageGlyph, "prefersEmojiImageTextAttachment");
  _readsEmojiImageTextAttachmentFromDocumentFormats__readsEmojiImageTextAttachmentFromDocumentFormats = v1;

}

+ (id)_UTIForEmojiImage
{
  if (_UTIForEmojiImage_onceToken != -1)
    dispatch_once(&_UTIForEmojiImage_onceToken, &__block_literal_global_12_0);
  return (id)_UTIForEmojiImage_utType;
}

void __47__NSEmojiImageTextAttachment__UTIForEmojiImage__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "exportedTypeWithIdentifier:conformingToType:", CFSTR("com.apple.emojiimage"), *MEMORY[0x1E0CEC508]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_UTIForEmojiImage_utType;
  _UTIForEmojiImage_utType = v0;

}

+ (void)initialize
{
  void *v3;
  id v4;

  if ((id)objc_opt_class() == a1)
  {
    if (objc_msgSend(a1, "_readsEmojiImageTextAttachmentFromDocumentFormats"))
    {
      objc_msgSend(a1, "_UTIForEmojiImage");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSTextAttachment registerTextAttachmentClass:forFileType:](NSTextAttachment, "registerTextAttachmentClass:forFileType:", a1, v3);

    }
  }
}

+ (BOOL)_isEmojiImageTextAttachmentData:(id)a3 UTI:(id)a4
{
  const __CFData *v6;
  id v7;
  void *v8;
  int v9;
  CGImageSource *v10;
  id v11;
  BOOL v12;
  uint64_t v14;
  id v15;

  v6 = (const __CFData *)a3;
  v7 = a4;
  if (objc_msgSend(a1, "_readsEmojiImageTextAttachmentFromDocumentFormats")
    && (+[NSAdaptiveImageGlyph contentType](NSAdaptiveImageGlyph, "contentType"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "isEqual:", v8),
        v8,
        v9))
  {
    v14 = 0;
    v15 = 0;
    v10 = NSEmojiImageSourceCreateWithData(v6, &v15, &v14);
    v11 = v15;
    v12 = v10 != 0;
    if (v10)
      CFRelease(v10);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)emojiImageTextAttachmentForContentIdentifier:(id)a3
{
  return (id)objc_msgSend((id)_emojiTextAttachmentCache, "objectForKey:", a3);
}

+ (void)setEmojiImageTextAttachment:(id)a3 forContentIdentifier:(id)a4
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = setEmojiImageTextAttachment_forContentIdentifier__onceToken;
  v6 = a4;
  v7 = a3;
  if (v5 != -1)
    dispatch_once(&setEmojiImageTextAttachment_forContentIdentifier__onceToken, &__block_literal_global_16);
  v8 = (void *)_emojiTextAttachmentCache;
  objc_msgSend(v7, "contents");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:cost:", v7, v6, objc_msgSend(v9, "length"));

}

uint64_t __79__NSEmojiImageTextAttachment_setEmojiImageTextAttachment_forContentIdentifier___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_emojiTextAttachmentCache;
  _emojiTextAttachmentCache = (uint64_t)v0;

  return objc_msgSend((id)_emojiTextAttachmentCache, "setTotalCostLimit:", 0x400000);
}

+ (void)flushInstanceCache
{
  objc_msgSend((id)_emojiTextAttachmentCache, "removeAllObjects");
}

- (NSEmojiImageTextAttachment)initWithAdaptiveImageGlyph:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSEmojiImageTextAttachment *v9;
  NSEmojiImageTextAttachment *v10;
  void *v11;
  void *v12;
  void *v13;
  NSEmojiImageTextAttachment *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v5 = a3;
  if (v5)
  {
    v6 = (void *)objc_opt_class();
    objc_msgSend(v5, "contentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emojiImageTextAttachmentForContentIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
    }
    else
    {
      objc_msgSend(v5, "imageContent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSAdaptiveImageGlyph contentType](NSAdaptiveImageGlyph, "contentType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18.receiver = self;
      v18.super_class = (Class)NSEmojiImageTextAttachment;
      v14 = -[NSTextAttachment initWithData:ofType:](&v18, sel_initWithData_ofType_, v11, v13);

      if (v14)
      {
        objc_storeStrong((id *)&v14->_glyph, a3);
        v15 = (void *)objc_opt_class();
        -[NSAdaptiveImageGlyph contentIdentifier](v14->_glyph, "contentIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setEmojiImageTextAttachment:forContentIdentifier:", v14, v16);

      }
      v9 = v14;
      self = v9;
    }
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSEmojiImageTextAttachment)initWithData:(id)a3
{
  id v5;
  NSAdaptiveImageGlyph *v6;
  NSEmojiImageTextAttachment *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSEmojiImageTextAttachment.m"), 258, CFSTR("%@: initializer called with invalid data %@"), objc_opt_class(), 0);

  }
  v6 = -[NSAdaptiveImageGlyph initWithImageContent:]([NSAdaptiveImageGlyph alloc], "initWithImageContent:", v5);
  v7 = -[NSEmojiImageTextAttachment initWithAdaptiveImageGlyph:](self, "initWithAdaptiveImageGlyph:", v6);

  return v7;
}

- (NSEmojiImageTextAttachment)initWithFileWrapper:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSEmojiImageTextAttachment *v11;
  NSEmojiImageTextAttachment *v12;

  v4 = a3;
  objc_msgSend(v4, "preferredFilename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSAdaptiveImageGlyph contentType](NSAdaptiveImageGlyph, "contentType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (!v9)
    {
      v12 = 0;
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(v4, "regularFileContents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = -[NSEmojiImageTextAttachment initWithData:](self, "initWithData:", v10);
      if (v11)
      {
        self = v11;
        v12 = self;
LABEL_10:

        goto LABEL_11;
      }
      self = 0;
    }
    v12 = 0;
    goto LABEL_10;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  NSEmojiImageTextAttachment *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (NSEmojiImageTextAttachment *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NSAdaptiveImageGlyph contentIdentifier](self->_glyph, "contentIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSEmojiImageTextAttachment contentIdentifier](v4, "contentIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NSAdaptiveImageGlyph contentIdentifier](self->_glyph, "contentIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)contentIdentifier
{
  return -[NSAdaptiveImageGlyph contentIdentifier](self->_glyph, "contentIdentifier");
}

- (NSString)shortDescription
{
  return -[NSAdaptiveImageGlyph contentDescription](self->_glyph, "contentDescription");
}

- (NSAdaptiveImageGlyph)adaptiveImageGlyph
{
  return self->_glyph;
}

- (id)strikes
{
  return -[NSAdaptiveImageGlyph strikes](self->_glyph, "strikes");
}

- (CGImage)imageForProposedSize:(CGSize)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6
{
  return -[NSAdaptiveImageGlyph imageForProposedSize:scaleFactor:imageOffset:imageSize:](self->_glyph, "imageForProposedSize:scaleFactor:imageOffset:imageSize:", a5, a6, a3.width, a3.height, a4);
}

- (CGImage)imageForPointSize:(double)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6
{
  return -[NSEmojiImageTextAttachment imageForProposedSize:scaleFactor:imageOffset:imageSize:](self, "imageForProposedSize:scaleFactor:imageOffset:imageSize:", a5, a6, a3, a3, a4);
}

- (BOOL)_isEmojiImage
{
  return 1;
}

- (id)_fallbackFileWrapper
{
  return -[NSAdaptiveImageGlyph _fallbackFileWrapper](self->_glyph, "_fallbackFileWrapper");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyph, 0);
}

@end
