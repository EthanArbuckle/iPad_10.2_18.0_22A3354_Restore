@implementation WLKArtworkVariant

- (WLKArtworkVariant)initWithDictionary:(id)a3
{
  id v4;
  WLKArtworkVariant *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  WLKArtworkVariant *v11;
  void *v12;
  void *v13;
  float v14;
  CGFloat v15;
  void *v16;
  float v17;
  void *v18;
  uint64_t v19;
  NSString *artworkURLString;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSString *artworkURLTemplate;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSString *format;
  NSString *v33;
  objc_super v35;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    v35.receiver = self;
    v35.super_class = (Class)WLKArtworkVariant;
    v5 = -[WLKArtworkVariant init](&v35, sel_init);
    if (!v5)
    {
LABEL_69:
      self = v5;
      v11 = self;
      goto LABEL_70;
    }
    objc_msgSend(v4, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v7;
    objc_opt_class();
    v9 = v8;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_60:
      objc_msgSend(v4, "objectForKey:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "objectForKey:", CFSTR("width"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      v15 = v14;
      objc_msgSend(v12, "objectForKey:", CFSTR("height"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "floatValue");
      v5->_artworkSize.width = v15;
      v5->_artworkSize.height = v17;

      objc_msgSend(v12, "objectForKey:", CFSTR("url"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "copy");
      artworkURLString = v5->_artworkURLString;
      v5->_artworkURLString = (NSString *)v19;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v18, "hasPrefix:", CFSTR("bundle://")))
      {
        v21 = objc_msgSend(v18, "rangeOfString:", CFSTR("bundle://"));
        objc_msgSend(v18, "substringFromIndex:", v21 + v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "resourcePath");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringByAppendingPathComponent:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "copy");
        artworkURLTemplate = v5->_artworkURLTemplate;
        v5->_artworkURLTemplate = (NSString *)v27;

      }
      else
      {
        v29 = objc_msgSend(v18, "copy");
        v23 = v5->_artworkURLTemplate;
        v5->_artworkURLTemplate = (NSString *)v29;
      }

      objc_msgSend(v12, "objectForKey:", CFSTR("format"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "copy");
      format = v5->_format;
      v5->_format = (NSString *)v31;

      if (-[NSString compare:options:](v5->_format, "compare:options:", CFSTR("lsr"), 1) == NSOrderedSame)
      {
        v33 = v5->_format;
        v5->_format = (NSString *)CFSTR("lcr");

      }
      v5->_supportsLayeredImage = objc_msgSend(v12, "wlk_BOOLForKey:defaultValue:", CFSTR("supportsLayeredImage"), 0);
      v5->_alpha = objc_msgSend(v12, "wlk_BOOLForKey:defaultValue:", CFSTR("hasAlpha"), 0);
      if (!v5->_format)
      {
        v5->_format = (NSString *)CFSTR("jpg");

      }
      v4 = v12;
      goto LABEL_69;
    }
    objc_msgSend(v8, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "isEqualToString:", CFSTR("banner")))
    {
      v10 = 1;
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("other")))
      {
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("coverart")))
        {
          v10 = 2;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("previewframe")))
        {
          v10 = 4;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("showlogo")))
        {
          v10 = 5;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("castincharacter")))
        {
          v10 = 3;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("fullscreenbackground")))
        {
          v10 = 6;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("contentlogo")))
        {
          v10 = 8;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("fullcolorcontentlogo")))
        {
          v10 = 21;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("singlecolorcontentlogo")))
        {
          v10 = 22;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("flowcaseimage")))
        {
          v10 = 7;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("logoglyph")))
        {
          v10 = 9;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("appicon")))
        {
          v10 = 10;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("heroimage")))
        {
          v10 = 11;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("masterlockupimage")))
        {
          v10 = 12;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("evodfeaturing")))
        {
          v10 = 13;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("actioncoverart")))
        {
          v10 = 14;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("upnextbackground")))
        {
          v10 = 15;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("keyframe")))
        {
          v10 = 16;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("coverart16x9")))
        {
          v10 = 17;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("whitelogo")))
        {
          v10 = 18;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("centeredfullscreenbackgroundimage")))
        {
          v10 = 20;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("shelfimagebackground")))
        {
          v10 = 23;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("posterart")))
        {
          v10 = 24;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("showposterart")))
        {
          v10 = 25;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("shelfimage")))
        {
          v10 = 26;
          goto LABEL_59;
        }
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("keyframeimage")))
        {
          v10 = 27;
          goto LABEL_59;
        }
      }
      v10 = 19;
    }
LABEL_59:
    v5->_artworkType = v10;
    goto LABEL_60;
  }
  v11 = 0;
LABEL_70:

  return v11;
}

- (NSURL)artworkURL
{
  void *v2;
  void *v3;

  -[WLKArtworkVariant artworkURLForSize:](self, "artworkURLForSize:", self->_artworkSize.width, self->_artworkSize.height);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSURL *)v3;
}

- (id)artworkURLForSize:(CGSize)a3
{
  return -[WLKArtworkVariant artworkURLForSize:format:](self, "artworkURLForSize:format:", 0, a3.width, a3.height);
}

- (id)artworkURLForSize:(CGSize)a3 format:(id)a4
{
  return -[WLKArtworkVariant artworkURLForSize:cropCode:format:](self, "artworkURLForSize:cropCode:format:", 0, a4, a3.width, a3.height);
}

- (id)artworkURLForSize:(CGSize)a3 cropCode:(id)a4 format:(id)a5
{
  double height;
  double width;
  void *format;
  id v11;
  id v12;
  id v13;
  void *v14;

  height = a3.height;
  width = a3.width;
  format = a5;
  if (!a5)
    format = self->_format;
  v11 = format;
  v12 = a5;
  v13 = a4;
  objc_msgSend((id)objc_opt_class(), "artworkURLFromTemplate:forSize:cropCode:format:", self->_artworkURLTemplate, v13, v11, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)artworkURLFromTemplate:(id)a3 forSize:(CGSize)a4 format:(id)a5
{
  return (id)objc_msgSend(a1, "artworkURLFromTemplate:forSize:cropCode:format:", a3, 0, a5, a4.width, a4.height);
}

+ (id)artworkURLFromTemplate:(id)a3 forSize:(CGSize)a4 cropCode:(id)a5 format:(id)a6
{
  CGFloat height;
  CGFloat width;
  __CFString *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  height = a4.height;
  width = a4.width;
  v10 = (__CFString *)a5;
  v11 = a6;
  v12 = (void *)objc_msgSend(a3, "mutableCopy");
  v13 = objc_msgSend(v12, "rangeOfString:", CFSTR("{w}"));
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = v13;
    v16 = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.0f"), *(_QWORD *)&width);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v15, v16, v17);

  }
  v18 = objc_msgSend(v12, "rangeOfString:", CFSTR("{h}"));
  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v20 = v18;
    v21 = v19;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.0f"), *(_QWORD *)&height);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v20, v21, v22);

  }
  v23 = objc_msgSend(v12, "rangeOfString:", CFSTR("{c}"));
  if (v23 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v25 = v23;
    v26 = v24;
    if (-[__CFString length](v10, "length"))
      v27 = v10;
    else
      v27 = &stru_1E68AA228;
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v25, v26, v27);
  }
  v28 = objc_msgSend(v12, "rangeOfString:", CFSTR("{f}"));
  if (v28 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v28, v29, v11);
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAddingPercentEncodingWithAllowedCharacters:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)artworkSizeTemplateURL
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)-[NSString mutableCopy](self->_artworkURLTemplate, "mutableCopy");
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("{f}"));
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v3, "replaceCharactersInRange:withString:", v4, v5, self->_format);
  objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t artworkType;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)WLKArtworkVariant;
  -[WLKArtworkVariant description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  artworkType = self->_artworkType;
  -[WLKArtworkVariant artworkSize](self, "artworkSize");
  -[WLKArtworkVariant _sizeDescription:](self, "_sizeDescription:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKArtworkVariant artworkURL](self, "artworkURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ type: %ld, size: %@, url: %@"), v4, artworkType, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_sizeDescription:(CGSize)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.*g, %.*g}"), 17, *(_QWORD *)&a3.width, 17, *(_QWORD *)&a3.height);
}

- (NSString)artworkURLString
{
  return self->_artworkURLString;
}

- (CGSize)artworkSize
{
  double width;
  double height;
  CGSize result;

  width = self->_artworkSize.width;
  height = self->_artworkSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)artworkType
{
  return self->_artworkType;
}

- (NSString)format
{
  return self->_format;
}

- (BOOL)supportsLayeredImage
{
  return self->_supportsLayeredImage;
}

- (void)setSupportsLayeredImage:(BOOL)a3
{
  self->_supportsLayeredImage = a3;
}

- (BOOL)hasAlpha
{
  return self->_alpha;
}

- (void)setAlpha:(BOOL)a3
{
  self->_alpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_artworkURLString, 0);
  objc_storeStrong((id *)&self->_artworkURLTemplate, 0);
}

@end
