@implementation PBFApplicationStateContext

+ (id)contextWithForegroundStateDescription:(id)a3 posterUUIDs:(id)a4
{
  id v5;
  id v6;
  PBFApplicationStateContext *v7;
  uint64_t v8;
  NSString *foregroundStateDescription;
  uint64_t v10;
  NSSet *posterUUIDs;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(PBFApplicationStateContext);
  v8 = objc_msgSend(v6, "copy");

  foregroundStateDescription = v7->_foregroundStateDescription;
  v7->_foregroundStateDescription = (NSString *)v8;

  v10 = objc_msgSend(v5, "copy");
  posterUUIDs = v7->_posterUUIDs;
  v7->_posterUUIDs = (NSSet *)v10;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PBFApplicationStateContext *v4;
  char v5;

  v4 = (PBFApplicationStateContext *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = -[NSSet isEqualToSet:](v4->_posterUUIDs, "isEqualToSet:", self->_posterUUIDs);
    else
      v5 = 0;
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:skipIfEmpty:", self->_foregroundStateDescription, CFSTR("foregroundStateDescription"), 1);
  -[NSSet allObjects](self->_posterUUIDs, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", v4, CFSTR("posterUUIDs"), 1);

  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSSet)posterUUIDs
{
  return self->_posterUUIDs;
}

- (NSString)foregroundStateDescription
{
  return self->_foregroundStateDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundStateDescription, 0);
  objc_storeStrong((id *)&self->_posterUUIDs, 0);
}

@end
