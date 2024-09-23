@implementation NSAdaptiveImageGlyph

+ (BOOL)prefersTextAttachment
{
  return objc_msgSend(MEMORY[0x1E0CA80D8], "prefersTextAttachment");
}

+ (void)setPrefersTextAttachment:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0CA80D8], "setPrefersTextAttachment:", a3);
}

+ (BOOL)prefersEmojiImageTextAttachment
{
  return objc_msgSend(MEMORY[0x1E0CA80D8], "prefersEmojiImageTextAttachment");
}

+ (void)setPrefersEmojiImageTextAttachment:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0CA80D8], "setPrefersEmojiImageTextAttachment:", a3);
}

+ (void)flushInstanceCache
{
  objc_msgSend(MEMORY[0x1E0CA80D8], "flushInstanceCache");
}

+ (id)contentTypeIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CA80D8], "contentType");
}

+ (UTType)contentType
{
  return (UTType *)objc_msgSend(MEMORY[0x1E0CA80D8], "contentType");
}

+ (id)contentTypeUTI
{
  return (id)objc_msgSend(MEMORY[0x1E0CA80D8], "contentType");
}

- (NSAdaptiveImageGlyph)initWithImageContent:(id)a3
{
  id v4;
  NSAdaptiveImageGlyph *v5;
  uint64_t v6;
  CTAdaptiveImageGlyph *CTAdaptiveImageGlyph;
  NSAdaptiveImageGlyph *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NSAdaptiveImageGlyph;
  v5 = -[NSAdaptiveImageGlyph init](&v10, sel_init);
  if (v5
    && (v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA80D8]), "initWithImageContent:", v4),
        CTAdaptiveImageGlyph = v5->_CTAdaptiveImageGlyph,
        v5->_CTAdaptiveImageGlyph = (CTAdaptiveImageGlyph *)v6,
        CTAdaptiveImageGlyph,
        v5->_CTAdaptiveImageGlyph))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSAdaptiveImageGlyph)initWithContentIdentifier:(id)a3
{
  id v4;
  NSAdaptiveImageGlyph *v5;
  uint64_t v6;
  CTAdaptiveImageGlyph *CTAdaptiveImageGlyph;
  NSAdaptiveImageGlyph *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NSAdaptiveImageGlyph;
  v5 = -[NSAdaptiveImageGlyph init](&v10, sel_init);
  if (v5
    && (v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA80D8]), "initWithContentIdentifier:", v4),
        CTAdaptiveImageGlyph = v5->_CTAdaptiveImageGlyph,
        v5->_CTAdaptiveImageGlyph = (CTAdaptiveImageGlyph *)v6,
        CTAdaptiveImageGlyph,
        v5->_CTAdaptiveImageGlyph))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSAdaptiveImageGlyph)initWithCTAdaptiveImageGlyph:(id)a3
{
  CTAdaptiveImageGlyph *v4;
  CTAdaptiveImageGlyph *v5;
  NSAdaptiveImageGlyph *v6;
  CTAdaptiveImageGlyph *CTAdaptiveImageGlyph;
  objc_super v9;

  v4 = (CTAdaptiveImageGlyph *)a3;
  if (!v4)
    -[NSAdaptiveImageGlyph initWithCTAdaptiveImageGlyph:].cold.1();
  v5 = v4;
  v9.receiver = self;
  v9.super_class = (Class)NSAdaptiveImageGlyph;
  v6 = -[NSAdaptiveImageGlyph init](&v9, sel_init);
  CTAdaptiveImageGlyph = v6->_CTAdaptiveImageGlyph;
  v6->_CTAdaptiveImageGlyph = v5;

  return v6;
}

- (NSAdaptiveImageGlyph)initWithFileWrapper:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSAdaptiveImageGlyph *v11;
  NSAdaptiveImageGlyph *v12;

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
      v11 = -[NSAdaptiveImageGlyph initWithImageContent:](self, "initWithImageContent:", v10);
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

- (NSData)imageContent
{
  return (NSData *)-[CTAdaptiveImageGlyph imageContent](self->_CTAdaptiveImageGlyph, "imageContent");
}

- (NSString)contentIdentifier
{
  return (NSString *)-[CTAdaptiveImageGlyph contentIdentifier](self->_CTAdaptiveImageGlyph, "contentIdentifier");
}

- (NSString)contentDescription
{
  return (NSString *)-[CTAdaptiveImageGlyph contentDescription](self->_CTAdaptiveImageGlyph, "contentDescription");
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSAdaptiveImageGlyph *v4;
  void *v5;
  NSAdaptiveImageGlyph *v6;

  v4 = [NSAdaptiveImageGlyph alloc];
  -[CTAdaptiveImageGlyph contentIdentifier](self->_CTAdaptiveImageGlyph, "contentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSAdaptiveImageGlyph initWithContentIdentifier:](v4, "initWithContentIdentifier:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "allowsKeyedCoding"))
    -[CTAdaptiveImageGlyph encodeWithCoder:](self->_CTAdaptiveImageGlyph, "encodeWithCoder:", v4);

}

- (NSAdaptiveImageGlyph)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  NSAdaptiveImageGlyph *v6;
  CTAdaptiveImageGlyph *CTAdaptiveImageGlyph;
  NSAdaptiveImageGlyph *v8;
  objc_super v10;

  v4 = a3;
  if (!objc_msgSend(v4, "allowsKeyedCoding"))
    goto LABEL_6;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA80D8]), "initWithCoder:", v4);
  if (!v5
    || (v10.receiver = self,
        v10.super_class = (Class)NSAdaptiveImageGlyph,
        v6 = -[NSAdaptiveImageGlyph init](&v10, sel_init),
        (self = v6) == 0))
  {

LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  CTAdaptiveImageGlyph = v6->_CTAdaptiveImageGlyph;
  v6->_CTAdaptiveImageGlyph = (CTAdaptiveImageGlyph *)v5;

  self = self;
  v8 = self;
LABEL_7:

  return v8;
}

- (NSArray)strikes
{
  return (NSArray *)-[CTAdaptiveImageGlyph strikes](self->_CTAdaptiveImageGlyph, "strikes");
}

- (NSTextAttachment)nominalTextAttachment
{
  CTAdaptiveImageGlyph *CTAdaptiveImageGlyph;
  _QWORD v4[5];

  CTAdaptiveImageGlyph = self->_CTAdaptiveImageGlyph;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__NSAdaptiveImageGlyph_nominalTextAttachment__block_invoke;
  v4[3] = &unk_1E26049C0;
  v4[4] = self;
  -[CTAdaptiveImageGlyph _nominalTextAttachmentCreatingIfNeededUsingBlock:](CTAdaptiveImageGlyph, "_nominalTextAttachmentCreatingIfNeededUsingBlock:", v4);
  return (NSTextAttachment *)(id)objc_claimAutoreleasedReturnValue();
}

NSTextAttachment *__45__NSAdaptiveImageGlyph_nominalTextAttachment__block_invoke(uint64_t a1)
{
  NSTextAttachment *v2;
  void *v3;
  void *v4;
  void *v5;
  NSTextAttachment *v6;

  v2 = [NSTextAttachment alloc];
  objc_msgSend(*(id *)(a1 + 32), "imageContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSAdaptiveImageGlyph contentType](NSAdaptiveImageGlyph, "contentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSTextAttachment initWithData:ofType:](v2, "initWithData:ofType:", v3, v5);

  return v6;
}

- (CGImage)imageForProposedSize:(CGSize)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6
{
  return (CGImage *)-[CTAdaptiveImageGlyph imageForProposedSize:scaleFactor:imageOffset:imageSize:](self->_CTAdaptiveImageGlyph, "imageForProposedSize:scaleFactor:imageOffset:imageSize:", a5, a6, a3.width, a3.height, a4);
}

- (CGImage)imageForPointSize:(double)a3 scaleFactor:(double)a4 imageOffset:(CGPoint *)a5 imageSize:(CGSize *)a6
{
  return -[NSAdaptiveImageGlyph imageForProposedSize:scaleFactor:imageOffset:imageSize:](self, "imageForProposedSize:scaleFactor:imageOffset:imageSize:", a5, a6, a3, a3, a4);
}

+ (BOOL)_readsAdaptiveImageGlyphFromDocumentFormats
{
  return objc_msgSend(MEMORY[0x1E0CA80D8], "_readsAdaptiveImageGlyphFromDocumentFormats");
}

- (id)_configuredFileWrapperForAttributes:(id)a3
{
  return -[CTAdaptiveImageGlyph _configuredFileWrapperForAttributes:](self->_CTAdaptiveImageGlyph, "_configuredFileWrapperForAttributes:", a3);
}

- (CGSize)_imageSizeForAttributes:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("NSFont"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    NSDefaultFont();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "ascender");
  v6 = v5;
  objc_msgSend(v4, "descender");
  -[CTAdaptiveImageGlyph _imageSizeForProposedSize:scaleFactor:](self->_CTAdaptiveImageGlyph, "_imageSizeForProposedSize:scaleFactor:", v6 - v7, v6 - v7, 1.0);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (NSFileWrapper)_fallbackFileWrapper
{
  return (NSFileWrapper *)-[CTAdaptiveImageGlyph _fallbackFileWrapper](self->_CTAdaptiveImageGlyph, "_fallbackFileWrapper");
}

- (CTAdaptiveImageGlyph)_CTAdaptiveImageGlyph
{
  return (CTAdaptiveImageGlyph *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CTAdaptiveImageGlyph, 0);
}

- (void)initWithCTAdaptiveImageGlyph:.cold.1()
{
  __assert_rtn("-[NSAdaptiveImageGlyph initWithCTAdaptiveImageGlyph:]", "NSAdaptiveImageGlyph.m", 112, "nil != adaptiveImageGlyph");
}

@end
