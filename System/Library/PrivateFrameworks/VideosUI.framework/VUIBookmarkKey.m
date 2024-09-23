@implementation VUIBookmarkKey

- (VUIBookmarkKey)initWithIdentifier:(id)a3 keyType:(int64_t)a4
{
  id v6;
  VUIBookmarkKey *v7;
  uint64_t v8;
  NSString *identifier;
  VUIBookmarkKey *v10;
  objc_super v12;

  v6 = a3;
  if (v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)VUIBookmarkKey;
    v7 = -[VUIBookmarkKey init](&v12, sel_init);
    if (v7)
    {
      v8 = objc_msgSend(v6, "copy");
      identifier = v7->_identifier;
      v7->_identifier = (NSString *)v8;

      v7->_keyType = a4;
    }
    self = v7;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (VUIBookmarkKey)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Use -[VUIBookmark initWithIdentifier:keyType:] instead."));

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)VUIBookmarkKey;
  -[VUIBookmarkKey description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, identifier=%@, keyType=%ld"), v4, self->_identifier, self->_keyType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)keyType
{
  return self->_keyType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
