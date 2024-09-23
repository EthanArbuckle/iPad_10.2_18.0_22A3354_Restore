@implementation TUAudioRouteCollectionKey

- (TUAudioRouteCollectionKey)initWithCategory:(id)a3 mode:(id)a4
{
  __CFString *v6;
  id v7;
  TUAudioRouteCollectionKey *v8;
  void **v9;
  void *v10;
  uint64_t v11;
  NSString *category;
  uint64_t v13;
  NSString *mode;
  objc_super v16;

  v6 = (__CFString *)a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TUAudioRouteCollectionKey;
  v8 = -[TUAudioRouteCollectionKey init](&v16, sel_init);
  if (v8)
  {
    if (!initWithCategory_mode___AVAudioSessionCategoryPhoneCall)
    {
      v9 = (void **)CUTWeakLinkSymbol();
      if (v9)
        v10 = *v9;
      else
        v10 = 0;
      objc_storeStrong((id *)&initWithCategory_mode___AVAudioSessionCategoryPhoneCall, v10);
    }
    if (-[__CFString isEqualToString:](v6, "isEqualToString:"))
    {

      v6 = CFSTR("PhoneCall");
    }
    v11 = -[__CFString copy](v6, "copy");
    category = v8->_category;
    v8->_category = (NSString *)v11;

    v13 = objc_msgSend(v7, "copy");
    mode = v8->_mode;
    v8->_mode = (NSString *)v13;

  }
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TUAudioRouteCollectionKey category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUAudioRouteCollectionKey mode](self, "mode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p category=%@ mode=%@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUAudioRouteCollectionKey isEqualToAudioRouteCollectionKey:](self, "isEqualToAudioRouteCollectionKey:", v4);

  return v5;
}

- (BOOL)isEqualToAudioRouteCollectionKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[TUAudioRouteCollectionKey category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (TUStringsAreEqualOrNil((unint64_t)v5, (uint64_t)v6))
  {
    -[TUAudioRouteCollectionKey mode](self, "mode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = TUStringsAreEqualOrNil((unint64_t)v7, (uint64_t)v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[TUAudioRouteCollectionKey category](self, "category");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUAudioRouteCollectionKey mode](self, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TUAudioRouteCollectionKey category](self, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUAudioRouteCollectionKey mode](self, "mode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithCategory:mode:", v5, v6);

  return v7;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
