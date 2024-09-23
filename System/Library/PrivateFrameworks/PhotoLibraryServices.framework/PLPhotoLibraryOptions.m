@implementation PLPhotoLibraryOptions

- (BOOL)refreshesAfterSave
{
  return self->_refreshesAfterSave;
}

- (int64_t)requiredState
{
  return self->_requiredState;
}

- (BOOL)automaticallyPinToFirstFetch
{
  return self->_automaticallyPinToFirstFetch;
}

- (BOOL)automaticallyMergesContext
{
  return self->_automaticallyMergesContext;
}

- (void)setAutomaticallyPinToFirstFetch:(BOOL)a3
{
  self->_automaticallyPinToFirstFetch = a3;
}

- (void)setAutomaticallyMergesContext:(BOOL)a3
{
  self->_automaticallyMergesContext = a3;
}

- (PLPhotoLibraryOptions)init
{
  PLPhotoLibraryOptions *v2;
  PLPhotoLibraryOptions *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLPhotoLibraryOptions;
  v2 = -[PLPhotoLibraryOptions init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_refreshesAfterSave = 1;
    if (PLIsAssetsd())
      v3->_automaticallyPinToFirstFetch = 1;
  }
  return v3;
}

- (void)setRequiredState:(int64_t)a3
{
  self->_requiredState = a3;
}

- (BOOL)preventsWaitingForRequiredState
{
  return self->_preventsWaitingForRequiredState;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 automaticallyMergesContext;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  automaticallyMergesContext = self->_automaticallyMergesContext;
  v6 = a3;
  objc_msgSend(v4, "numberWithBool:", automaticallyMergesContext);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("automaticallyMergesContext"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_requiredState);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("requiredState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_libraryRole);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("libraryRole"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preventsWaitingForRequiredState);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("preventsWaitingForRequiredState"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_libraryInitiator);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("libraryInitiator"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_refreshesAfterSave);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("refreshesAfterSave"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_automaticallyPinToFirstFetch);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v13, CFSTR("automaticallyPinToFirstFetch"));

}

- (PLPhotoLibraryOptions)initWithCoder:(id)a3
{
  id v4;
  PLPhotoLibraryOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[PLPhotoLibraryOptions init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("automaticallyMergesContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_automaticallyMergesContext = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requiredState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requiredState = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("libraryRole"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_libraryRole = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preventsWaitingForRequiredState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_preventsWaitingForRequiredState = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("libraryInitiator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_libraryInitiator = objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("refreshesAfterSave"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_refreshesAfterSave = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("automaticallyPinToFirstFetch"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_automaticallyPinToFirstFetch = objc_msgSend(v12, "BOOLValue");

  }
  return v5;
}

- (void)setRefreshesAfterSave:(BOOL)a3
{
  self->_refreshesAfterSave = a3;
}

- (unint64_t)libraryRole
{
  return self->_libraryRole;
}

- (void)setLibraryRole:(unint64_t)a3
{
  self->_libraryRole = a3;
}

- (void)setPreventsWaitingForRequiredState:(BOOL)a3
{
  self->_preventsWaitingForRequiredState = a3;
}

- (unint64_t)libraryInitiator
{
  return self->_libraryInitiator;
}

- (void)setLibraryInitiator:(unint64_t)a3
{
  self->_libraryInitiator = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
