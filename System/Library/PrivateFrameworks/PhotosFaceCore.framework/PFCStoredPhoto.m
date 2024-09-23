@implementation PFCStoredPhoto

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localIdentifier;
  double parallaxScale;
  void *v6;
  id v7;

  localIdentifier = self->_localIdentifier;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", localIdentifier, CFSTR("localIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_modificationDate, CFSTR("modificationDate"));
  parallaxScale = self->_parallaxScale;
  *(float *)&parallaxScale = parallaxScale;
  objc_msgSend(v7, "encodeFloat:forKey:", CFSTR("parallaxScale"), parallaxScale);
  objc_msgSend(v7, "encodeInteger:forKey:", self->_preferredLayout, CFSTR("preferredLayout"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_userEdited, CFSTR("userEdited"));
  v6 = (void *)-[NSArray mutableCopy](self->_layouts, "mutableCopy");
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("layouts"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_accessibilityDescription, CFSTR("accessibilityDescription"));
}

- (PFCStoredPhoto)initWithCoder:(id)a3
{
  id v4;
  PFCStoredPhoto *v5;
  uint64_t v6;
  NSString *localIdentifier;
  uint64_t v8;
  NSDate *modificationDate;
  float v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *layouts;
  uint64_t v16;
  NSString *accessibilityDescription;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PFCStoredPhoto;
  v5 = -[PFCStoredPhoto init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modificationDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v8;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("parallaxScale"));
    v5->_parallaxScale = v10;
    v5->_preferredLayout = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredLayout"));
    v5->_userEdited = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userEdited"));
    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("layouts"));
    v14 = objc_claimAutoreleasedReturnValue();
    layouts = v5->_layouts;
    v5->_layouts = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessibilityDescription"));
    v16 = objc_claimAutoreleasedReturnValue();
    accessibilityDescription = v5->_accessibilityDescription;
    v5->_accessibilityDescription = (NSString *)v16;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD0E20], CFSTR("Array validation failed: putative array is a %@"), objc_opt_class());
    -[NSArray enumerateObjectsUsingBlock:](v5->_layouts, "enumerateObjectsUsingBlock:", &__block_literal_global_0);

  }
  return v5;
}

void __32__PFCStoredPhoto_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDD0E20], CFSTR("Array validation failed: expected object class %@, found %@"), objc_opt_class(), v2);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_localIdentifier, "copyWithZone:", a3);
  objc_msgSend(v5, "setLocalIdentifier:", v6);

  v7 = (void *)-[NSDate copyWithZone:](self->_modificationDate, "copyWithZone:", a3);
  objc_msgSend(v5, "setModificationDate:", v7);

  objc_msgSend(v5, "setParallaxScale:", self->_parallaxScale);
  objc_msgSend(v5, "setPreferredLayout:", self->_preferredLayout);
  objc_msgSend(v5, "setUserEdited:", self->_userEdited);
  v8 = (void *)-[NSArray copyWithZone:](self->_layouts, "copyWithZone:", a3);
  objc_msgSend(v5, "setLayouts:", v8);

  v9 = (void *)-[NSString copyWithZone:](self->_accessibilityDescription, "copyWithZone:", a3);
  objc_msgSend(v5, "setAccessibilityDescription:", v9);

  return v5;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)parallaxScale
{
  return self->_parallaxScale;
}

- (void)setParallaxScale:(double)a3
{
  self->_parallaxScale = a3;
}

- (int64_t)preferredLayout
{
  return self->_preferredLayout;
}

- (void)setPreferredLayout:(int64_t)a3
{
  self->_preferredLayout = a3;
}

- (BOOL)userEdited
{
  return self->_userEdited;
}

- (void)setUserEdited:(BOOL)a3
{
  self->_userEdited = a3;
}

- (NSArray)layouts
{
  return self->_layouts;
}

- (void)setLayouts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end
