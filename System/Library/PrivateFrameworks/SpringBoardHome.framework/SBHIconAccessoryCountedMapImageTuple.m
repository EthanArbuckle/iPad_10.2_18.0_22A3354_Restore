@implementation SBHIconAccessoryCountedMapImageTuple

- (UIImage)image
{
  return self->_image;
}

- (NSCopying)sbh_countedMapKey
{
  return self->_countedMapKey;
}

- (SBHIconAccessoryCountedMapImageTuple)initWithImage:(id)a3 countedMapKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  SBHIconAccessoryCountedMapImageTuple *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogIcon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v15 = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_INFO, "Assigning asset '%@' mapkey of %@", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendObject:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendObject:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  v13 = -[SBHIconAccessoryCountedMapImageTuple initWithImage:countedMapKey:hash:](self, "initWithImage:countedMapKey:hash:", v6, v7, v12);
  return v13;
}

- (SBHIconAccessoryCountedMapImageTuple)initWithImage:(id)a3 countedMapKey:(id)a4 hash:(unint64_t)a5
{
  id v9;
  id v10;
  SBHIconAccessoryCountedMapImageTuple *v11;
  SBHIconAccessoryCountedMapImageTuple *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBHIconAccessoryCountedMapImageTuple;
  v11 = -[SBHIconAccessoryCountedMapImageTuple init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_image, a3);
    objc_storeStrong((id *)&v12->_countedMapKey, a4);
    v12->_hash = a5;
  }

  return v12;
}

- (void)dealloc
{
  NSObject *v3;
  UIImage *image;
  NSCopying *countedMapKey;
  objc_super v6;
  uint8_t buf[4];
  UIImage *v8;
  __int16 v9;
  NSCopying *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogIcon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    countedMapKey = self->_countedMapKey;
    image = self->_image;
    *(_DWORD *)buf = 138412546;
    v8 = image;
    v9 = 2112;
    v10 = countedMapKey;
    _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_INFO, "Dealloc asset '%@' mapkey of %@", buf, 0x16u);
  }

  v6.receiver = self;
  v6.super_class = (Class)SBHIconAccessoryCountedMapImageTuple;
  -[SBHIconAccessoryCountedMapImageTuple dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_countedMapKey, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSObject *v5;
  UIImage *image;
  NSCopying *countedMapKey;
  int v9;
  UIImage *v10;
  __int16 v11;
  NSCopying *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SBLogIcon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    countedMapKey = self->_countedMapKey;
    image = self->_image;
    v9 = 138412546;
    v10 = image;
    v11 = 2112;
    v12 = countedMapKey;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "Copying asset '%@' mapkey of %@", (uint8_t *)&v9, 0x16u);
  }

  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithImage:countedMapKey:hash:", self->_image, self->_countedMapKey, self->_hash);
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  SBHIconAccessoryCountedMapImageTuple *v4;
  SBHIconAccessoryCountedMapImageTuple *v5;
  SBHIconAccessoryCountedMapImageTuple *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (SBHIconAccessoryCountedMapImageTuple *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[SBHIconAccessoryCountedMapImageTuple image](self, "image");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconAccessoryCountedMapImageTuple image](v6, "image");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (BSEqualObjects())
      {
        -[SBHIconAccessoryCountedMapImageTuple sbh_countedMapKey](self, "sbh_countedMapKey");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHIconAccessoryCountedMapImageTuple sbh_countedMapKey](v6, "sbh_countedMapKey");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = BSEqualObjects();

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

@end
