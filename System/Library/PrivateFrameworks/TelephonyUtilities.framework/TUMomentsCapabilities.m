@implementation TUMomentsCapabilities

- (TUMomentsCapabilities)initWithAvailability:(int)a3 supportedMediaTypes:(id)a4
{
  id v6;
  TUMomentsCapabilities *v7;
  TUMomentsCapabilities *v8;
  uint64_t v9;
  NSSet *supportedMediaTypes;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUMomentsCapabilities;
  v7 = -[TUMomentsCapabilities init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_availability = a3;
    v9 = objc_msgSend(v6, "copy");
    supportedMediaTypes = v8->_supportedMediaTypes;
    v8->_supportedMediaTypes = (NSSet *)v9;

  }
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[TUMomentsCapabilities availability](self, "availability");
  -[TUMomentsCapabilities supportedMediaTypes](self, "supportedMediaTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p availability=%d supportedMediaTypes=%@>"), v4, self, v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[TUMomentsCapabilities availability](self, "availability");
  -[TUMomentsCapabilities supportedMediaTypes](self, "supportedMediaTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUMomentsCapabilities isEqualToCapabilities:](self, "isEqualToCapabilities:", v4);

  return v5;
}

- (BOOL)isEqualToCapabilities:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  v5 = -[TUMomentsCapabilities availability](self, "availability");
  if (v5 == objc_msgSend(v4, "availability"))
  {
    -[TUMomentsCapabilities supportedMediaTypes](self, "supportedMediaTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "supportedMediaTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToSet:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUMomentsCapabilities)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  TUMomentsCapabilities *v12;

  v4 = a3;
  NSStringFromSelector(sel_availability);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntForKey:", v5);

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_supportedMediaTypes);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[TUMomentsCapabilities initWithAvailability:supportedMediaTypes:](self, "initWithAvailability:supportedMediaTypes:", v6, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = -[TUMomentsCapabilities availability](self, "availability");
  NSStringFromSelector(sel_availability);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt:forKey:", v5, v6);

  -[TUMomentsCapabilities supportedMediaTypes](self, "supportedMediaTypes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_supportedMediaTypes);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (int)availability
{
  return self->_availability;
}

- (NSSet)supportedMediaTypes
{
  return self->_supportedMediaTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedMediaTypes, 0);
}

@end
