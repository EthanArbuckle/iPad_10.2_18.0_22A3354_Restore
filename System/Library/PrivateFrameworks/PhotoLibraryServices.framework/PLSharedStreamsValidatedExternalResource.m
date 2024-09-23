@implementation PLSharedStreamsValidatedExternalResource

- (void)setSharedStreamsType:(unsigned int)a3
{
  uint64_t v3;

  self->_sharedStreamsType = a3;
  if (a3 > 9)
    v3 = 65741;
  else
    v3 = dword_199B9B5C8[a3];
  -[PLValidatedExternalResource setRecipeID:](self, "setRecipeID:", v3);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> - sharedStreamsType: %ld, recipeID: %ld"), v5, self, -[PLSharedStreamsValidatedExternalResource sharedStreamsType](self, "sharedStreamsType"), -[PLValidatedExternalResource recipeID](self, "recipeID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unsigned)sharedStreamsType
{
  return self->_sharedStreamsType;
}

- (NSString)fingerprint
{
  return self->_fingerprint;
}

- (void)setFingerprint:(id)a3
{
  objc_storeStrong((id *)&self->_fingerprint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerprint, 0);
}

@end
