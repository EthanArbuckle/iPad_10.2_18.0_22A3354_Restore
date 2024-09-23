@implementation PRLikeness

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertionDate, 0);
  objc_storeStrong((id *)&self->_ownerID, 0);
  objc_storeStrong((id *)&self->_softExpirationDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_dirtyProperties, 0);
  objc_storeStrong((id *)&self->_staticRepresentationData, 0);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setStaticRepresentation:(CGImage *)a3
{
  CGImage *staticRepresentation;
  NSData *staticRepresentationData;

  if (a3)
  {
    self->_staticRepresentation = CGImageRetain(a3);
  }
  else
  {
    staticRepresentation = self->_staticRepresentation;
    if (staticRepresentation)
      CGImageRelease(staticRepresentation);
    self->_staticRepresentation = 0;
  }
  staticRepresentationData = self->_staticRepresentationData;
  self->_staticRepresentationData = 0;

  -[NSMutableSet addObject:](self->_dirtyProperties, "addObject:", CFSTR("staticrep"));
}

- (void)setScope:(unint64_t)a3
{
  self->_scope = a3;
}

- (void)setRecipe:(id)a3
{
  NSData *v4;
  NSData *recipe;
  id v6;

  v6 = a3;
  if ((-[NSData isEqual:](self->_recipe, "isEqual:") & 1) == 0)
  {
    v4 = (NSData *)objc_msgSend(v6, "copy");
    recipe = self->_recipe;
    self->_recipe = v4;

    -[NSMutableSet addObject:](self->_dirtyProperties, "addObject:", CFSTR("recipe"));
  }

}

- (NSData)recipe
{
  return self->_recipe;
}

- (PRLikeness)init
{
  void *v3;
  void *v4;
  PRLikeness *v5;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PRLikeness _initWithIdentifier:](self, "_initWithIdentifier:", v4);

  return v5;
}

- (void)dealloc
{
  CGImage *staticRepresentation;
  objc_super v4;

  staticRepresentation = self->_staticRepresentation;
  if (staticRepresentation)
  {
    CGImageRelease(staticRepresentation);
    self->_staticRepresentation = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PRLikeness;
  -[PRLikeness dealloc](&v4, sel_dealloc);
}

- (id)_initWithIdentifier:(id)a3
{
  id v5;
  PRLikeness *v6;
  PRLikeness *v7;
  CGSize v8;
  NSMutableSet *v9;
  NSMutableSet *dirtyProperties;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PRLikeness;
  v6 = -[PRLikeness init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uniqueIdentifier, a3);
    v8 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    v7->_cropRectForTopLeftOrigin.origin = (CGPoint)*MEMORY[0x24BDBF070];
    v7->_cropRectForTopLeftOrigin.size = v8;
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    dirtyProperties = v7->_dirtyProperties;
    v7->_dirtyProperties = v9;

  }
  return v7;
}

+ (id)monogramWithScope:(unint64_t)a3 recipe:(id)a4 staticRepresentation:(CGImage *)a5
{
  id v7;
  PRLikeness *v8;

  v7 = a4;
  v8 = objc_alloc_init(PRLikeness);
  -[PRLikeness setType:](v8, "setType:", 1);
  -[PRLikeness setScope:](v8, "setScope:", a3);
  -[PRLikeness setRecipe:](v8, "setRecipe:", v7);

  -[PRLikeness setStaticRepresentation:](v8, "setStaticRepresentation:", a5);
  return v8;
}

+ (id)monogramWithRecipe:(id)a3 staticRepresentation:(CGImage *)a4
{
  return (id)objc_msgSend(a1, "monogramWithScope:recipe:staticRepresentation:", 2, a3, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)photoWithImage:(CGImage *)a3 cropRectForTopLeftOrigin:(CGRect)a4
{
  return (id)objc_msgSend(a1, "_photoWithScope:image:cropRectForTopLeftOrigin:", 2, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

+ (id)photoWithImage:(CGImage *)a3 cropRectForBottomLeftOrigin:(CGRect)a4
{
  objc_msgSend(a1, "_flippedRectForRect:relativeToImage:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return (id)objc_msgSend(a1, "photoWithImage:cropRectForTopLeftOrigin:", a3);
}

+ (CGRect)_flippedRectForRect:(CGRect)a3 relativeToImage:(CGImage *)a4
{
  double height;
  CGFloat width;
  double y;
  CGFloat x;
  BOOL IsNull;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  IsNull = CGRectIsNull(a3);
  if (a4 && !IsNull)
    y = (double)CGImageGetHeight(a4) - y - height;
  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

+ (id)photoWithImage:(CGImage *)a3
{
  return (id)objc_msgSend(a1, "_photoWithScope:image:cropRectForTopLeftOrigin:", 2, a3, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
}

+ (id)photoWithScope:(unint64_t)a3 image:(CGImage *)a4
{
  return (id)objc_msgSend(a1, "_photoWithScope:image:cropRectForTopLeftOrigin:", a3, a4, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
}

+ (id)_photoWithScope:(unint64_t)a3 image:(CGImage *)a4 cropRectForTopLeftOrigin:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  PRLikeness *v11;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = objc_alloc_init(PRLikeness);
  -[PRLikeness setType:](v11, "setType:", 2);
  -[PRLikeness setScope:](v11, "setScope:", a3);
  -[PRLikeness setStaticRepresentation:](v11, "setStaticRepresentation:", a4);
  -[PRLikeness setCropRectForTopLeftOrigin:](v11, "setCropRectForTopLeftOrigin:", x, y, width, height);
  return v11;
}

+ (id)diddlySquatLikeness
{
  id v2;

  v2 = -[PRLikeness _initWithIdentifier:]([PRLikeness alloc], "_initWithIdentifier:", CFSTR("7D5543CA-DJLT-4714-8D3B"));
  objc_msgSend(v2, "setType:", 4);
  objc_msgSend(v2, "setVersion:", 0x7FFFFFFFLL);
  return v2;
}

- (BOOL)isDiddlySquat
{
  return -[NSString isEqualToString:](self->_uniqueIdentifier, "isEqualToString:", CFSTR("7D5543CA-DJLT-4714-8D3B"));
}

- (PRLikeness)initWithCoder:(id)a3
{
  id v4;
  PRLikeness *v5;
  uint64_t v6;
  NSString *uniqueIdentifier;
  uint64_t v8;
  NSString *externalIdentifier;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDate *expirationDate;
  uint64_t v16;
  NSDate *softExpirationDate;
  uint64_t v18;
  NSData *recipe;
  uint64_t v20;
  NSData *staticRepresentationData;
  uint64_t v22;
  NSDate *creationDate;
  uint64_t v24;
  NSDate *insertionDate;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSMutableSet *dirtyProperties;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const __CFDictionary *v36;
  BOOL v37;
  NSObject *v38;
  objc_super v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  const __CFDictionary *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)PRLikeness;
  v5 = -[PRLikeness init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uniqueIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_externalIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    externalIdentifier = v5->_externalIdentifier;
    v5->_externalIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_scope"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_scope = objc_msgSend(v11, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_version"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_version = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_isCurrent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isCurrent = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_expirationDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_softExpirationDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    softExpirationDate = v5->_softExpirationDate;
    v5->_softExpirationDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recipe"));
    v18 = objc_claimAutoreleasedReturnValue();
    recipe = v5->_recipe;
    v5->_recipe = (NSData *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_staticRepresentationData"));
    v20 = objc_claimAutoreleasedReturnValue();
    staticRepresentationData = v5->_staticRepresentationData;
    v5->_staticRepresentationData = (NSData *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_creationDate"));
    v22 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_insertionDate"));
    v24 = objc_claimAutoreleasedReturnValue();
    insertionDate = v5->_insertionDate;
    v5->_insertionDate = (NSDate *)v24;

    v26 = (void *)MEMORY[0x24BDBCF20];
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("_dirtyProperties"));
    v30 = objc_claimAutoreleasedReturnValue();
    dirtyProperties = v5->_dirtyProperties;
    v5->_dirtyProperties = (NSMutableSet *)v30;

    v32 = (void *)MEMORY[0x24BDBCF20];
    v33 = objc_opt_class();
    v34 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("_cropRectForTopLeftOrigin"));
    v36 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v37 = CGRectMakeWithDictionaryRepresentation(v36, &v5->_cropRectForTopLeftOrigin);
    if (v36 && !v37)
    {
      _PRGetLogSystem();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v42 = "-[PRLikeness initWithCoder:]";
        v43 = 1024;
        v44 = 192;
        v45 = 2112;
        v46 = v36;
        _os_log_impl(&dword_209583000, v38, OS_LOG_TYPE_DEFAULT, "%s (%d) \"CGRectMakeWithDictionaryRepresentation failed with %@\", buf, 0x1Cu);
      }

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uniqueIdentifier;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CFDictionaryRef DictionaryRepresentation;

  uniqueIdentifier = self->_uniqueIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueIdentifier, CFSTR("_uniqueIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_externalIdentifier, CFSTR("_externalIdentifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_type);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_type"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_scope);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("_scope"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isCurrent);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("_isCurrent"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("_expirationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_softExpirationDate, CFSTR("_softExpirationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipe, CFSTR("_recipe"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_version);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("_version"));

  -[PRLikeness staticRepresentationData](self, "staticRepresentationData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("_staticRepresentationData"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_creationDate, CFSTR("_creationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_insertionDate, CFSTR("_insertionDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dirtyProperties, CFSTR("_dirtyProperties"));
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(self->_cropRectForTopLeftOrigin);
  objc_msgSend(v5, "encodeObject:forKey:", DictionaryRepresentation, CFSTR("_cropRectForTopLeftOrigin"));

}

+ (id)likenessWithPropagatedData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  unsigned __int8 *v7;
  uint64_t v8;
  void *v9;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v3 = a3;
  objc_msgSend(v3, "subdataWithRange:", 0, objc_msgSend(v3, "length") - 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subdataWithRange:", objc_msgSend(v3, "length") - 1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_retainAutorelease(v5);
  v7 = (unsigned __int8 *)objc_msgSend(v6, "bytes");

  if (!v7)
  {
    v8 = 4;
    goto LABEL_8;
  }
  v8 = *v7;
  if ((_DWORD)v8 == 3)
  {
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  if ((_DWORD)v8 != 1)
  {
LABEL_8:
    _PRGetLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315650;
      v14 = "+[PRLikeness likenessWithPropagatedData:]";
      v15 = 1024;
      v16 = 243;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_209583000, v11, OS_LOG_TYPE_DEFAULT, "%s (%d) \"Unsupported likeness type parsed: %@\", (uint8_t *)&v13, 0x1Cu);

    }
    goto LABEL_11;
  }
  +[PRLikeness monogramWithRecipe:staticRepresentation:](PRLikeness, "monogramWithRecipe:staticRepresentation:", v4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v9;
}

- (id)dataForPropagation
{
  NSData *recipe;
  void *v4;
  void *v5;
  char type;

  recipe = self->_recipe;
  if (!recipe)
    return 0;
  v4 = (void *)-[NSData mutableCopy](recipe, "mutableCopy");
  type = self->_type;
  objc_msgSend(v4, "appendBytes:length:", &type, 1);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (void)setCurrent:(BOOL)a3
{
  if (self->_isCurrent != a3)
  {
    self->_isCurrent = a3;
    -[NSMutableSet addObject:](self->_dirtyProperties, "addObject:", CFSTR("current"));
  }
}

- (void)setExternalIdentifier:(id)a3
{
  NSString *v4;
  NSString *externalIdentifier;
  id v6;

  v6 = a3;
  if ((-[NSString isEqual:](self->_externalIdentifier, "isEqual:") & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    externalIdentifier = self->_externalIdentifier;
    self->_externalIdentifier = v4;

    -[NSMutableSet addObject:](self->_dirtyProperties, "addObject:", CFSTR("eid"));
  }

}

+ (BOOL)automaticallyNotifiesObserversOfCropRectForTopLeftOrigin
{
  return 0;
}

- (void)setCropRectForTopLeftOrigin:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->_cropRectForTopLeftOrigin, a3))
  {
    -[PRLikeness willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cropRectForTopLeftOrigin"));
    -[PRLikeness willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cropRectForBottomLeftOrigin"));
    -[PRLikeness willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cropRect"));
    self->_cropRectForTopLeftOrigin.origin.x = x;
    self->_cropRectForTopLeftOrigin.origin.y = y;
    self->_cropRectForTopLeftOrigin.size.width = width;
    self->_cropRectForTopLeftOrigin.size.height = height;
    -[NSMutableSet addObject:](self->_dirtyProperties, "addObject:", CFSTR("crop"));
    -[PRLikeness didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cropRectForTopLeftOrigin"));
    -[PRLikeness didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cropRectForBottomLeftOrigin"));
    -[PRLikeness didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cropRect"));
  }
}

- (CGRect)cropRectForBottomLeftOrigin
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  +[PRLikeness _flippedRectForRect:relativeToImage:](PRLikeness, "_flippedRectForRect:relativeToImage:", self->_staticRepresentation, self->_cropRectForTopLeftOrigin.origin.x, self->_cropRectForTopLeftOrigin.origin.y, self->_cropRectForTopLeftOrigin.size.width, self->_cropRectForTopLeftOrigin.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGImage)staticRepresentation
{
  CGImage *staticRepresentation;
  NSData *staticRepresentationData;
  CGDataProvider *v6;
  CGDataProvider *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  staticRepresentation = self->_staticRepresentation;
  if (!staticRepresentation)
  {
    staticRepresentationData = self->_staticRepresentationData;
    if (!staticRepresentationData)
      return 0;
    v6 = CGDataProviderCreateWithCFData((CFDataRef)staticRepresentationData);
    if (v6)
    {
      v7 = v6;
      staticRepresentation = CGImageCreateWithPNGDataProvider(v6, 0, 1, kCGRenderingIntentDefault);
      CGDataProviderRelease(v7);
      self->_staticRepresentation = staticRepresentation;
      if (staticRepresentation)
        return staticRepresentation;
    }
    else
    {
      _PRGetLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 136315394;
        v11 = "_PRCreateImageWithPNGData";
        v12 = 1024;
        v13 = 527;
        _os_log_impl(&dword_209583000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"CGDataProviderCreateWithCFData returned NULL!\", (uint8_t *)&v10, 0x12u);
      }

      self->_staticRepresentation = 0;
    }
    _PRGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = "-[PRLikeness staticRepresentation]";
      v12 = 1024;
      v13 = 349;
      _os_log_impl(&dword_209583000, v9, OS_LOG_TYPE_DEFAULT, "%s (%d) \"CGImageCreateWithPNGDataProvider returned NULL!\", (uint8_t *)&v10, 0x12u);
    }

    return self->_staticRepresentation;
  }
  return staticRepresentation;
}

- (NSData)staticRepresentationData
{
  CGImage *staticRepresentation;
  __CFData *Mutable;
  CGImageDestination *v5;
  CGImageDestination *v6;
  NSObject *v7;
  NSObject *v8;
  NSData *staticRepresentationData;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  staticRepresentation = self->_staticRepresentation;
  if (staticRepresentation && !self->_staticRepresentationData)
  {
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v5 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)*MEMORY[0x24BDC1820], 1uLL, 0);
    if (v5)
    {
      v6 = v5;
      CGImageDestinationAddImage(v5, staticRepresentation, 0);
      if (!CGImageDestinationFinalize(v6))
      {
        _PRGetLogSystem();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136315394;
          v13 = "_PRGetPNGDataForImage";
          v14 = 1024;
          v15 = 556;
          _os_log_impl(&dword_209583000, v7, OS_LOG_TYPE_DEFAULT, "%s (%d) \"CGImageDestinationFinalize returned false!\", (uint8_t *)&v12, 0x12u);
        }

        CFRelease(Mutable);
        Mutable = 0;
      }
      CFRelease(v6);
    }
    else
    {
      _PRGetLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315394;
        v13 = "_PRGetPNGDataForImage";
        v14 = 1024;
        v15 = 548;
        _os_log_impl(&dword_209583000, v8, OS_LOG_TYPE_DEFAULT, "%s (%d) \"CGImageDestinationCreateWithData return NULL!\", (uint8_t *)&v12, 0x12u);
      }

      CFRelease(Mutable);
      Mutable = 0;
    }
    staticRepresentationData = self->_staticRepresentationData;
    self->_staticRepresentationData = (NSData *)Mutable;

    if (!self->_staticRepresentationData)
    {
      _PRGetLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315394;
        v13 = "-[PRLikeness staticRepresentationData]";
        v14 = 1024;
        v15 = 380;
        _os_log_impl(&dword_209583000, v10, OS_LOG_TYPE_DEFAULT, "%s (%d) \"_PRGetPNGDataForImage returned nil!\", (uint8_t *)&v12, 0x12u);
      }

    }
  }
  return self->_staticRepresentationData;
}

- (void)setStaticRepresentationData:(id)a3
{
  objc_storeStrong((id *)&self->_staticRepresentationData, a3);
  self->_staticRepresentation = 0;
}

- (NSString)scopeDescription
{
  return (NSString *)+[PRLikeness descriptionForScope:](PRLikeness, "descriptionForScope:", self->_scope);
}

+ (id)descriptionForScope:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("(unknown)");
  if (a3 == 1)
    v3 = CFSTR("private");
  if (a3 == 2)
    return CFSTR("public");
  else
    return (id)v3;
}

+ (unint64_t)scopeFromDescription:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("private")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqual:", CFSTR("public")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)typeDescription
{
  unint64_t v2;

  v2 = self->_type - 1;
  if (v2 > 3)
    return (NSString *)CFSTR("(unknown)");
  else
    return &off_24C1C15D0[v2]->isa;
}

- (id)description
{
  NSData *recipe;
  void *v4;
  void *v5;
  CGImage *staticRepresentation;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  id v22;
  id v23;
  __CFString *v24;
  __CFString *v25;

  recipe = self->_recipe;
  if (recipe)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSData length](recipe, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("NSData of size %@ bytes"), v5);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = CFSTR("(none)");
  }
  staticRepresentation = self->_staticRepresentation;
  if (staticRepresentation)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", CGImageGetWidth(staticRepresentation));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", CGImageGetHeight(self->_staticRepresentation));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@x%@ CGImageRef - "), v7, v8);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = &stru_24C1C1BA8;
  }
  if (CGRectIsNull(self->_cropRectForTopLeftOrigin))
  {
    v9 = CFSTR("(none)");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{(%.1f, %.1f), w: %.1f, h: %.1f}"), *(_QWORD *)&self->_cropRectForTopLeftOrigin.origin.x, *(_QWORD *)&self->_cropRectForTopLeftOrigin.origin.y, *(_QWORD *)&self->_cropRectForTopLeftOrigin.size.width, *(_QWORD *)&self->_cropRectForTopLeftOrigin.size.height);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (-[NSMutableSet count](self->_dirtyProperties, "count"))
  {
    -[NSMutableSet allObjects](self->_dirtyProperties, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = CFSTR("(none)");
  }
  objc_msgSend((id)objc_opt_class(), "_dateFormatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromDate:", self->_softExpirationDate);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromDate:", self->_expirationDate);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromDate:", self->_creationDate);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)MEMORY[0x24BDD17C8];
  -[PRLikeness typeDescription](self, "typeDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_version);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSData length](self->_staticRepresentationData, "length"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (self->_isCurrent)
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  objc_msgSend(v22, "stringWithFormat:", CFSTR("PRLikeness { type: %@, version: %@, recipe: %@, expires: (h: %@ - s: %@), created: %@, static rep: (%@%@ data bytes), crop: %@, dirty: %@, current: %@ }"), v16, v17, v25, v14, v13, v15, v24, v18, v9, v11, v20);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (BOOL)isDirty
{
  return -[NSMutableSet count](self->_dirtyProperties, "count") != 0;
}

- (void)clearDirtyProperties
{
  -[NSMutableSet removeAllObjects](self->_dirtyProperties, "removeAllObjects");
}

+ (id)_dateFormatter
{
  if (_dateFormatter_onceToken != -1)
    dispatch_once(&_dateFormatter_onceToken, &__block_literal_global);
  return (id)_dateFormatter_formatter;
}

uint64_t __28__PRLikeness__dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)_dateFormatter_formatter;
  _dateFormatter_formatter = (uint64_t)v0;

  objc_msgSend((id)_dateFormatter_formatter, "setDateStyle:", 1);
  return objc_msgSend((id)_dateFormatter_formatter, "setTimeStyle:", 1);
}

- (unint64_t)scope
{
  return self->_scope;
}

- (BOOL)isCurrent
{
  return self->_isCurrent;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (CGRect)cropRectForTopLeftOrigin
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRectForTopLeftOrigin.origin.x;
  y = self->_cropRectForTopLeftOrigin.origin.y;
  width = self->_cropRectForTopLeftOrigin.size.width;
  height = self->_cropRectForTopLeftOrigin.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (NSDate)softExpirationDate
{
  return self->_softExpirationDate;
}

- (void)setSoftExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_softExpirationDate, a3);
}

- (NSString)ownerID
{
  return self->_ownerID;
}

- (void)setOwnerID:(id)a3
{
  objc_storeStrong((id *)&self->_ownerID, a3);
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSDate)insertionDate
{
  return self->_insertionDate;
}

- (void)setInsertionDate:(id)a3
{
  objc_storeStrong((id *)&self->_insertionDate, a3);
}

- (NSSet)dirtyProperties
{
  return &self->_dirtyProperties->super;
}

- (void)setDirtyProperties:(id)a3
{
  objc_storeStrong((id *)&self->_dirtyProperties, a3);
}

@end
