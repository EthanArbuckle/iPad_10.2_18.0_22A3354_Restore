@implementation VUIFamilySharingMediaEntityIdentifier

- (VUIFamilySharingMediaEntityIdentifier)initWithEntityIdentifier:(id)a3 mediaEntityType:(id)a4
{
  id v7;
  id v8;
  VUIFamilySharingMediaEntityIdentifier *v9;
  VUIFamilySharingMediaEntityIdentifier *v10;
  uint64_t v11;
  VUIMediaEntityType *mediaEntityType;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("objectIdentifier"));
  v14.receiver = self;
  v14.super_class = (Class)VUIFamilySharingMediaEntityIdentifier;
  v9 = -[VUIFamilySharingMediaEntityIdentifier init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_objectIdentifier, a3);
    v11 = objc_msgSend(v8, "copy");
    mediaEntityType = v10->_mediaEntityType;
    v10->_mediaEntityType = (VUIMediaEntityType *)v11;

  }
  return v10;
}

- (VUIFamilySharingMediaEntityIdentifier)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VUIFamilySharingMediaEntityIdentifier objectIdentifier](self, "objectIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VUIFamilySharingMediaEntityIdentifier *v4;
  VUIFamilySharingMediaEntityIdentifier *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;

  v4 = (VUIFamilySharingMediaEntityIdentifier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[VUIFamilySharingMediaEntityIdentifier objectIdentifier](self, "objectIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIFamilySharingMediaEntityIdentifier objectIdentifier](v5, "objectIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
      v11 = 1;
    }
    else
    {
      v11 = 0;
      if (v8 && v9)
        v11 = objc_msgSend(v8, "isEqual:", v9);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_objectIdentifier, a3);
}

- (VUIMediaEntityType)mediaEntityType
{
  return self->_mediaEntityType;
}

- (void)setMediaEntityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaEntityType, 0);
  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

@end
