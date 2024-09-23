@implementation WBSTouchIconRequest

- (WBSTouchIconRequest)initWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6 monogramConfiguration:(id)a7 options:(unint64_t)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat v12;
  CGFloat v13;
  id v16;
  id v17;
  id v18;
  WBSTouchIconRequest *v19;
  WBSTouchIconRequest *v20;
  uint64_t v21;
  NSString *monogramTitle;
  WBSTouchIconRequest *v23;
  objc_super v25;

  height = a6.height;
  width = a6.width;
  v12 = a5.height;
  v13 = a5.width;
  v16 = a3;
  v17 = a4;
  v18 = a7;
  if ((objc_msgSend(v17, "safari_isHTTPFamilyURL") & 1) == 0)
  {

    v17 = 0;
  }
  v25.receiver = self;
  v25.super_class = (Class)WBSTouchIconRequest;
  v19 = -[WBSSiteMetadataRequest initWithURL:extraInfo:](&v25, sel_initWithURL_extraInfo_, v17, 0);
  v20 = v19;
  if (v19)
  {
    v19->_minimumIconSize.width = v13;
    v19->_minimumIconSize.height = v12;
    v19->_maximumIconSize.width = width;
    v19->_maximumIconSize.height = height;
    v21 = objc_msgSend(v16, "copy");
    monogramTitle = v20->_monogramTitle;
    v20->_monogramTitle = (NSString *)v21;

    objc_storeStrong((id *)&v20->_monogramConfiguration, a7);
    v20->_options = a8;
    v23 = v20;
  }

  return v20;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[WBSSiteMetadataRequest url](self, "url");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  WBSTouchIconRequest *v4;
  uint64_t v5;
  char v6;
  WBSTouchIconRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *monogramTitle;
  BOOL v13;
  BOOL v14;

  v4 = (WBSTouchIconRequest *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      -[WBSSiteMetadataRequest url](self, "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "host");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[WBSSiteMetadataRequest url](v7, "url");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "host");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v9 == v11 || objc_msgSend(v9, "isEqualToString:", v11))
        && ((monogramTitle = self->_monogramTitle, monogramTitle == v7->_monogramTitle)
         || -[NSString isEqualToString:](monogramTitle, "isEqualToString:"))
        && (self->_minimumIconSize.width == v7->_minimumIconSize.width
          ? (v13 = self->_minimumIconSize.height == v7->_minimumIconSize.height)
          : (v13 = 0),
            v13
         && (self->_maximumIconSize.width == v7->_maximumIconSize.width
           ? (v14 = self->_maximumIconSize.height == v7->_maximumIconSize.height)
           : (v14 = 0),
             v14 && ((v7->_options ^ self->_options) & 0xFFFFFFFFFFFFFFFDLL) == 0)))
      {
        v6 = WBSIsEqual();
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)options
{
  return self->_options;
}

- (CGSize)minimumIconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_minimumIconSize.width;
  height = self->_minimumIconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (WBSTemplateIconMonogramConfiguration)monogramConfiguration
{
  return self->_monogramConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monogramTitle, 0);
  objc_storeStrong((id *)&self->_monogramConfiguration, 0);
}

+ (id)requestWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6
{
  double height;
  double width;
  double v8;
  double v9;
  id v12;
  id v13;
  void *v14;

  height = a6.height;
  width = a6.width;
  v8 = a5.height;
  v9 = a5.width;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:url:minimumIconSize:maximumIconSize:", v13, v12, v9, v8, width, height);

  return v14;
}

- (WBSTouchIconRequest)initWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6
{
  return -[WBSTouchIconRequest initWithTitle:url:minimumIconSize:maximumIconSize:options:](self, "initWithTitle:url:minimumIconSize:maximumIconSize:options:", a3, a4, 3, a5.width, a5.height, a6.width, a6.height);
}

+ (id)requestWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6 options:(unint64_t)a7
{
  double height;
  double width;
  double v10;
  double v11;
  id v14;
  id v15;
  void *v16;

  height = a6.height;
  width = a6.width;
  v10 = a5.height;
  v11 = a5.width;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:url:minimumIconSize:maximumIconSize:options:", v15, v14, a7, v11, v10, width, height);

  return v16;
}

- (WBSTouchIconRequest)initWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6 options:(unint64_t)a7
{
  return -[WBSTouchIconRequest initWithTitle:url:minimumIconSize:maximumIconSize:monogramConfiguration:options:](self, "initWithTitle:url:minimumIconSize:maximumIconSize:monogramConfiguration:options:", a3, a4, 0, a7, a5.width, a5.height, a6.width, a6.height);
}

+ (id)requestWithTitle:(id)a3 url:(id)a4 minimumIconSize:(CGSize)a5 maximumIconSize:(CGSize)a6 monogramConfiguration:(id)a7 options:(unint64_t)a8
{
  double height;
  double width;
  double v11;
  double v12;
  id v16;
  id v17;
  id v18;
  void *v19;

  height = a6.height;
  width = a6.width;
  v11 = a5.height;
  v12 = a5.width;
  v16 = a7;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:url:minimumIconSize:maximumIconSize:monogramConfiguration:options:", v18, v17, v16, a8, v12, v11, width, height);

  return v19;
}

- (NSString)uniqueIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self);
}

- (CGSize)sizeForDrawing
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumIconSize.width;
  height = self->_maximumIconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)maximumIconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maximumIconSize.width;
  height = self->_maximumIconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)monogramTitle
{
  return self->_monogramTitle;
}

@end
