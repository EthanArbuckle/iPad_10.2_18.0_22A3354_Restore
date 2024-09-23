@implementation VUISidebandMediaEntityIdentifier

- (VUISidebandMediaEntityIdentifier)initWithManagedObjectID:(id)a3 mediaEntityType:(id)a4
{
  id v7;
  id v8;
  VUISidebandMediaEntityIdentifier *v9;
  VUISidebandMediaEntityIdentifier *v10;
  uint64_t v11;
  VUIMediaEntityType *mediaEntityType;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The %@ parameter must not be nil."), CFSTR("managedObjectID"));
  v14.receiver = self;
  v14.super_class = (Class)VUISidebandMediaEntityIdentifier;
  v9 = -[VUISidebandMediaEntityIdentifier init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_managedObjectID, a3);
    v11 = objc_msgSend(v8, "copy");
    mediaEntityType = v10->_mediaEntityType;
    v10->_mediaEntityType = (VUIMediaEntityType *)v11;

  }
  return v10;
}

- (VUISidebandMediaEntityIdentifier)init
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

  -[VUISidebandMediaEntityIdentifier managedObjectID](self, "managedObjectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VUISidebandMediaEntityIdentifier *v4;
  VUISidebandMediaEntityIdentifier *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;

  v4 = (VUISidebandMediaEntityIdentifier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[VUISidebandMediaEntityIdentifier managedObjectID](self, "managedObjectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUISidebandMediaEntityIdentifier managedObjectID](v5, "managedObjectID");
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

- (NSManagedObjectID)managedObjectID
{
  return self->_managedObjectID;
}

- (void)setManagedObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectID, a3);
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
  objc_storeStrong((id *)&self->_managedObjectID, 0);
}

@end
