@implementation PFParallaxLayer

- (id)makeUniqueFileNameWithFileNames:(id)a3 orientation:(int64_t)a4
{
  id v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  PFParallaxLayer *v18;
  SEL v19;
  id v20;
  id *v21;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = CFSTR("portrait");
  }
  else
  {
    if (a4 != 2)
    {
      v18 = (PFParallaxLayer *)_PFAssertFailHandler();
      return (id)-[PFParallaxLayer saveToURL:error:](v18, v19, v20, v21);
    }
    v7 = CFSTR("landscape");
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  -[PFParallaxLayer identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFParallaxLayer fileExtension](self, "fileExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-layer_%@.%@"), v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "containsObject:", v11))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[PFParallaxLayer identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v6, "count");
    -[PFParallaxLayer fileExtension](self, "fileExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-layer_%@_%ld.%@"), v7, v13, v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v16;
  }

  return v11;
}

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  id v4;
  objc_class *v5;
  PFParallaxLayer *v6;
  SEL v7;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  objc_claimAutoreleasedReturnValue();
  v6 = (PFParallaxLayer *)_PFAssertFailHandler();
  return -[PFParallaxLayer fileExtension](v6, v7);
}

- (NSString)fileExtension
{
  objc_class *v2;
  PFParallaxImageLayer *v3;
  SEL v4;
  id v5;
  id *v6;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  v3 = (PFParallaxImageLayer *)_PFAssertFailHandler();
  return (NSString *)-[PFParallaxImageLayer saveToURL:error:](v3, v4, v5, v6);
}

- (PFParallaxLayer)initWithFrame:(CGRect)a3 zPosition:(double)a4 identifier:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSString *v11;
  PFParallaxLayer *v12;
  NSString *identifier;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = (NSString *)a5;
  v15.receiver = self;
  v15.super_class = (Class)PFParallaxLayer;
  v12 = -[PFParallaxLayer init](&v15, sel_init);
  v12->_frame.origin.x = x;
  v12->_frame.origin.y = y;
  v12->_frame.size.width = width;
  v12->_frame.size.height = height;
  v12->_zPosition = a4;
  identifier = v12->_identifier;
  v12->_identifier = v11;

  return v12;
}

- (id)layerByUpdatingFrame:(CGRect)a3
{
  objc_class *v3;
  PFParallaxLayer *v4;
  SEL v5;
  id result;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  objc_claimAutoreleasedReturnValue();
  v4 = (PFParallaxLayer *)_PFAssertFailHandler();
  -[PFParallaxLayer pixelSize](v4, v5);
  return result;
}

- (CGSize)pixelSize
{
  objc_class *v2;
  PFParallaxLayer *v3;
  SEL v4;
  double v5;
  double v6;
  CGSize result;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  v3 = (PFParallaxLayer *)_PFAssertFailHandler();
  -[PFParallaxLayer isForeground](v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)isForeground
{
  void *v2;
  char v3;

  -[PFParallaxLayer identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("foreground"));

  return v3;
}

- (BOOL)isBackground
{
  void *v2;
  char v3;

  -[PFParallaxLayer identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("background"));

  return v3;
}

- (BOOL)isForegroundLandscape
{
  void *v2;
  char v3;

  -[PFParallaxLayer identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("foreground-landscape"));

  return v3;
}

- (BOOL)isBackgroundLandscape
{
  void *v2;
  char v3;

  -[PFParallaxLayer identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("background-landscape"));

  return v3;
}

- (BOOL)isBackfill
{
  void *v2;
  char v3;

  -[PFParallaxLayer identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSuffix:", CFSTR("backfill"));

  return v3;
}

- (BOOL)isInactive
{
  void *v2;
  char v3;

  -[PFParallaxLayer identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("inactive"));

  return v3;
}

- (BOOL)isDebug
{
  void *v2;
  char v3;

  -[PFParallaxLayer identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("debug"));

  return v3;
}

- (BOOL)isSettlingEffect
{
  void *v2;
  char v3;

  -[PFParallaxLayer identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("settling-video"));

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PFParallaxLayer identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFParallaxLayer pixelSize](self, "pixelSize");
  v7 = v6;
  -[PFParallaxLayer pixelSize](self, "pixelSize");
  v9 = v8;
  -[PFParallaxLayer frame](self, "frame");
  v11 = v10;
  -[PFParallaxLayer frame](self, "frame");
  v13 = v12;
  -[PFParallaxLayer frame](self, "frame");
  v15 = v14;
  -[PFParallaxLayer frame](self, "frame");
  v17 = v16;
  -[PFParallaxLayer zPosition](self, "zPosition");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p id:%@ size=%0.fx%0.f frame=(%0.f,%0.f)(%0.fx%0.f) zPos=%0.1f>"), v4, self, v5, v7, v9, v11, v13, v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v11;
  objc_super v13;
  CGRect v14;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v13.receiver = self;
  v13.super_class = (Class)PFParallaxLayer;
  -[PFParallaxLayer debugDescription](&v13, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  -[PFParallaxLayer identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("identifier: %@\n"), v6);

  -[PFParallaxLayer pixelSize](self, "pixelSize");
  v8 = v7;
  -[PFParallaxLayer pixelSize](self, "pixelSize");
  objc_msgSend(v5, "appendFormat:", CFSTR("size: %0.fx%0.f\n"), v8, v9);
  -[PFParallaxLayer frame](self, "frame");
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v14);
  objc_msgSend(v5, "appendFormat:", CFSTR("frame: %@\n"), DictionaryRepresentation);

  -[PFParallaxLayer zPosition](self, "zPosition");
  objc_msgSend(v5, "appendFormat:", CFSTR("zPosition: %.0f\n"), v11);
  objc_msgSend(v5, "appendFormat:", CFSTR("backfill: %d\n"), -[PFParallaxLayer isBackfill](self, "isBackfill"));
  objc_msgSend(v5, "appendFormat:", CFSTR("debug: %d\n"), -[PFParallaxLayer isDebug](self, "isDebug"));
  return v5;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)zPosition
{
  return self->_zPosition;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
