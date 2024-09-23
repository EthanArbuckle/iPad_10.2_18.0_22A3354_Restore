@implementation PKRemoteImageSet

- (PKRemoteImageSet)initWithName:(id)a3 dictionaries:(id)a4
{
  id v6;
  void *v7;
  PKRemoteImageSet *v8;

  v6 = a3;
  objc_msgSend(a4, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_140);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PKRemoteImageSet initWithName:images:](self, "initWithName:images:", v6, v7);

  return v8;
}

PKRemoteImage *__46__PKRemoteImageSet_initWithName_dictionaries___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKRemoteImage *v3;

  v2 = a2;
  v3 = -[PKRemoteImage initWithDictionary:]([PKRemoteImage alloc], "initWithDictionary:", v2);

  return v3;
}

- (PKRemoteImageSet)initWithName:(id)a3 images:(id)a4
{
  id v7;
  id v8;
  PKRemoteImageSet *v9;
  PKRemoteImageSet *v10;
  void *v11;
  void *v12;
  NSSet *v13;
  PKRemoteImageSet *v14;
  NSSet *images;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKRemoteImageSet;
  v9 = -[PKRemoteImageSet init](&v17, sel_init);
  v10 = v9;
  if (!v9)
  {
LABEL_8:
    v14 = v10;
    goto LABEL_9;
  }
  objc_storeStrong((id *)&v9->_name, a3);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v13 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    images = v10->_images;
    v10->_images = v13;

    goto LABEL_8;
  }
  v14 = 0;
LABEL_9:

  return v14;
}

- (id)imageForScaleFactor:(unint64_t)a3
{
  id v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = (id)a3;
  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = self->_images;
    v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if ((id)objc_msgSend(v9, "scaleFactor", (_QWORD)v11) == v3)
          {
            v3 = v9;
            goto LABEL_12;
          }
        }
        v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
    v3 = 0;
LABEL_12:

  }
  return v3;
}

- (id)imageForScaleFactorValue:(double)a3
{
  uint64_t v3;

  if (a3 <= 2.0)
    v3 = 2;
  else
    v3 = 3;
  return -[PKRemoteImageSet imageForScaleFactor:](self, "imageForScaleFactor:", v3);
}

- (void)addURL:(id)a3 forScaleFactor:(unint64_t)a4
{
  id v6;
  NSSet *v7;
  NSSet *images;
  PKRemoteImage *v9;
  NSSet *v10;
  NSSet *v11;
  id v12;

  if (a3 && a4)
  {
    v6 = a3;
    -[PKRemoteImageSet imageForScaleFactor:](self, "imageForScaleFactor:", a4);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[NSSet pk_setByRemovingObject:](self->_images, "pk_setByRemovingObject:", v12);
      v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
      images = self->_images;
      self->_images = v7;

    }
    v9 = -[PKRemoteImage initWithRemoteURL:scaleFactor:]([PKRemoteImage alloc], "initWithRemoteURL:scaleFactor:", v6, a4);

    if (v9)
    {
      -[NSSet setByAddingObject:](self->_images, "setByAddingObject:", v9);
      v10 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v11 = self->_images;
      self->_images = v10;

    }
  }
}

- (id)description
{
  void *v3;
  NSSet *images;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("name: '%@'; "), self->_name);
  if (-[NSSet count](self->_images, "count"))
    images = (NSSet *)&stru_1E2ADF4C0;
  else
    images = self->_images;
  objc_msgSend(v3, "appendFormat:", CFSTR("images: %@\n"), images);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_images;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("- %@\n"), v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PKRemoteImageSet *v4;
  PKRemoteImageSet *v5;
  BOOL v6;

  v4 = (PKRemoteImageSet *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKRemoteImageSet isEqualToRemoteImageSet:](self, "isEqualToRemoteImageSet:", v5);

  return v6;
}

- (BOOL)isEqualToRemoteImageSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  NSSet *images;
  char v12;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_11;
  v6 = (void *)*((_QWORD *)v4 + 1);
  v7 = self->_name;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

LABEL_11:
      v12 = 0;
      goto LABEL_12;
    }
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_11;
  }
  images = self->_images;
  if (images)
    v12 = -[NSSet isEqual:](images, "isEqual:", self->_images);
  else
    v12 = 1;
LABEL_12:

  return v12;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_name);
  objc_msgSend(v3, "safelyAddObject:", self->_images);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRemoteImageSet)initWithCoder:(id)a3
{
  id v4;
  PKRemoteImageSet *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSSet *images;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKRemoteImageSet;
  v5 = -[PKRemoteImageSet init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("images"));
    v12 = objc_claimAutoreleasedReturnValue();
    images = v5->_images;
    v5->_images = (NSSet *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_images, CFSTR("images"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  -[NSSet allObjects](self->_images, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __33__PKRemoteImageSet_copyWithZone___block_invoke;
  v13[3] = &__block_descriptor_40_e23__16__0__PKRemoteImage_8l;
  v13[4] = a3;
  objc_msgSend(v8, "pk_arrayBySafelyApplyingBlock:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

id __33__PKRemoteImageSet_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyWithZone:", *(_QWORD *)(a1 + 32));
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSSet)images
{
  return self->_images;
}

- (void)setImages:(id)a3
{
  objc_storeStrong((id *)&self->_images, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
