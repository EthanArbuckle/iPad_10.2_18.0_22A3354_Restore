@implementation SKUIArtworkTemplate

- (SKUIArtworkTemplate)initWithTemplateDictionary:(id)a3
{
  id v4;
  SKUIArtworkTemplate *v5;
  NSMutableSet *v6;
  NSMutableSet *servedArtworks;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIArtworkTemplate initWithTemplateDictionary:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIArtworkTemplate;
  v5 = -[SKUIArtworkTemplate init](&v12, sel_init);
  if (v5)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    servedArtworks = v5->_servedArtworks;
    v5->_servedArtworks = v6;

    objc_msgSend(v4, "objectForKey:", CFSTR("url"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)&v5->_urlTemplateString, v8);
    objc_msgSend(v4, "objectForKey:", CFSTR("width"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_width = objc_msgSend(v9, "integerValue");
    objc_msgSend(v4, "objectForKey:", CFSTR("height"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5->_height = objc_msgSend(v10, "integerValue");

  }
  return v5;
}

- (id)artworkForSize:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SKUIArtworkTemplate artworkWithWidth:](self, "artworkWithWidth:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIArtworkTemplate servedArtworks](self, "servedArtworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  return v4;
}

- (id)artworkURLForSize:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SKUIArtworkTemplate artworkForSize:](self, "artworkForSize:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIArtworkTemplate servedArtworks](self, "servedArtworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  objc_msgSend(v4, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)artworkWithWidth:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SKUIArtworkTemplate _artworkWithWidth:](self, "_artworkWithWidth:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIArtworkTemplate servedArtworks](self, "servedArtworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  return v4;
}

- (id)bestArtworkForSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  SKUIArtwork *v7;
  void *v8;
  SKUIArtwork *v9;
  void *v10;

  height = a3.height;
  width = a3.width;
  -[SKUIArtworkTemplate _urlStringWithTargetSize:](self, "_urlStringWithTargetSize:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [SKUIArtwork alloc];
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v6);
  v9 = -[SKUIArtwork initWithURL:size:](v7, "initWithURL:size:", v8, width, height);

  -[SKUIArtworkTemplate servedArtworks](self, "servedArtworks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v9);

  return v9;
}

- (id)bestArtworkForScaledSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  height = a3.height;
  width = a3.width;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  -[SKUIArtworkTemplate bestArtworkForSize:](self, "bestArtworkForSize:", ceil(width * v8), ceil(height * v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIArtworkTemplate servedArtworks](self, "servedArtworks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v9);

  return v9;
}

- (id)preferredExactArtworkForSize:(CGSize)a3
{
  void *v4;
  void *v5;

  -[SKUIArtworkTemplate bestArtworkForSize:](self, "bestArtworkForSize:", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIArtworkTemplate servedArtworks](self, "servedArtworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  return v4;
}

- (BOOL)hasArtwork
{
  return self->_urlTemplateString != 0;
}

+ (BOOL)canHandleArtworkFormat:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (SKUIArtwork)largestArtwork
{
  double width;
  double height;
  void *v5;
  SKUIArtwork *v6;
  void *v7;
  SKUIArtwork *v8;
  void *v9;

  width = (double)self->_width;
  height = (double)self->_height;
  -[SKUIArtworkTemplate _urlStringWithTargetSize:](self, "_urlStringWithTargetSize:", width, height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [SKUIArtwork alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SKUIArtwork initWithURL:size:](v6, "initWithURL:size:", v7, width, height);

  -[SKUIArtworkTemplate servedArtworks](self, "servedArtworks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  return v8;
}

- (SKUIArtwork)smallestArtwork
{
  void *v3;
  SKUIArtwork *v4;
  void *v5;
  SKUIArtwork *v6;
  void *v7;

  -[SKUIArtworkTemplate _urlStringWithTargetSize:](self, "_urlStringWithTargetSize:", 65.0, 65.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [SKUIArtwork alloc];
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SKUIArtwork initWithURL:size:](v4, "initWithURL:size:", v5, 65.0, 65.0);

  -[SKUIArtworkTemplate servedArtworks](self, "servedArtworks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

  return v6;
}

- (id)_artworkWithWidth:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  SKUIArtwork *v10;

  -[SKUIArtworkTemplate _sizeForWidth:](self, "_sizeForWidth:");
  v6 = v5;
  v8 = v7;
  -[SKUIArtworkTemplate _artworkURLWithWidth:](self, "_artworkURLWithWidth:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SKUIArtwork initWithURL:size:]([SKUIArtwork alloc], "initWithURL:size:", v9, v6, v8);

  return v10;
}

- (id)_artworkURLWithWidth:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SKUIArtworkTemplate _sizeForWidth:](self, "_sizeForWidth:", a3);
  -[SKUIArtworkTemplate _urlStringWithTargetSize:](self, "_urlStringWithTargetSize:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGSize)_sizeForWidth:(int64_t)a3
{
  double v3;
  double v4;
  int64_t height;
  int64_t width;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  height = self->_height;
  if (height >= 1)
  {
    width = self->_width;
    if (width >= 1)
    {
      v3 = (double)a3;
      v4 = ceil((double)height / (double)width * (double)a3);
    }
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)_urlStringWithTargetSize:(CGSize)a3
{
  void *v3;
  double height;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = 0;
  if (self->_urlTemplateString)
  {
    if (a3.width > 0.0)
    {
      height = a3.height;
      if (a3.height > 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), (uint64_t)a3.width);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%li"), (uint64_t)height);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSString stringByReplacingOccurrencesOfString:withString:](self->_urlTemplateString, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{w}"), v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{h}"), v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{f}"), CFSTR("jpg"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{c}"), CFSTR("bb"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  return v3;
}

- (id)_lookupDictionary
{
  void *v2;
  void *v3;

  -[SKUIArtworkTemplate largestArtwork](self, "largestArtwork");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_lookupDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *urlTemplateString;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    urlTemplateString = self->_urlTemplateString;
    objc_msgSend(v4, "urlTemplateString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString isEqualToString:](urlTemplateString, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_urlTemplateString, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_urlTemplateString, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v5[2] = self->_width;
  v5[1] = self->_height;
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SKUIArtworkTemplate;
  -[SKUIArtworkTemplate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIArtworkTemplate largestArtwork](self, "largestArtwork");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Artwork: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKUIArtworkTemplate)initWithCoder:(id)a3
{
  id v4;
  SKUIArtworkTemplate *v5;
  uint64_t v6;
  NSString *urlTemplateString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIArtworkTemplate;
  v5 = -[SKUIArtworkTemplate init](&v9, sel_init);
  if (v5)
  {
    v5->_height = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("height"));
    v5->_width = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("width"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("urlTemplateString"));
    v6 = objc_claimAutoreleasedReturnValue();
    urlTemplateString = v5->_urlTemplateString;
    v5->_urlTemplateString = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t height;
  id v5;

  height = self->_height;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", height, CFSTR("height"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_width, CFSTR("width"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_urlTemplateString, CFSTR("urlTemplateString"));

}

- (SKUIArtworkTemplate)initWithCacheRepresentation:(id)a3
{
  id v4;
  SKUIArtworkTemplate *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)SKUIArtworkTemplate;
    v5 = -[SKUIArtworkTemplate init](&v10, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("urlTemplateString"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v5->_urlTemplateString, v6);
      objc_msgSend(v4, "objectForKey:", CFSTR("width"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5->_width = objc_msgSend(v7, "integerValue");
      objc_msgSend(v4, "objectForKey:", CFSTR("height"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v5->_height = objc_msgSend(v8, "integerValue");

    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (NSMutableDictionary)cacheRepresentation
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKey:", self->_urlTemplateString, CFSTR("urlTemplateString"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_width);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("width"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("height"));

  return (NSMutableDictionary *)v3;
}

- (int64_t)height
{
  return self->_height;
}

- (int64_t)width
{
  return self->_width;
}

- (NSString)urlTemplateString
{
  return self->_urlTemplateString;
}

- (NSMutableSet)servedArtworks
{
  return self->_servedArtworks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servedArtworks, 0);
  objc_storeStrong((id *)&self->_urlTemplateString, 0);
}

- (void)initWithTemplateDictionary:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIArtworkTemplate initWithTemplateDictionary:]";
}

@end
