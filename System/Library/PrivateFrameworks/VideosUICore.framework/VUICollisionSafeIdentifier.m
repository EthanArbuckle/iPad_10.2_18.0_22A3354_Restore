@implementation VUICollisionSafeIdentifier

- (NSCopying)rootIdentifier
{
  return self->_rootIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  VUICollisionSafeIdentifier *v4;
  VUICollisionSafeIdentifier *v5;
  VUICollisionSafeIdentifier *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  BOOL v13;
  unint64_t v14;

  v4 = (VUICollisionSafeIdentifier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[VUICollisionSafeIdentifier rootIdentifier](self, "rootIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUICollisionSafeIdentifier rootIdentifier](v6, "rootIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        if (v9 == v10)
        {

        }
        else
        {
          v11 = v10;
          if (!v9 || !v10)
          {

LABEL_14:
            v13 = 0;
            goto LABEL_15;
          }
          v12 = objc_msgSend(v9, "isEqual:", v10);

          if ((v12 & 1) == 0)
            goto LABEL_14;
        }
        v14 = -[VUICollisionSafeIdentifier collisionCount](self, "collisionCount");
        v13 = v14 == -[VUICollisionSafeIdentifier collisionCount](v6, "collisionCount");
LABEL_15:

        goto LABEL_16;
      }
    }
    v13 = 0;
  }
LABEL_16:

  return v13;
}

- (VUICollisionSafeIdentifier)initWithRootIdentifier:(id)a3 collisionCount:(unint64_t)a4
{
  id v6;
  VUICollisionSafeIdentifier *v7;
  uint64_t v8;
  NSCopying *rootIdentifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUICollisionSafeIdentifier;
  v7 = -[VUICollisionSafeIdentifier init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    rootIdentifier = v7->_rootIdentifier;
    v7->_rootIdentifier = (NSCopying *)v8;

    v7->_collisionCount = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[VUICollisionSafeIdentifier collisionCount](self, "collisionCount");
  -[VUICollisionSafeIdentifier rootIdentifier](self, "rootIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VUICollisionSafeIdentifier *v4;
  uint64_t v5;
  NSCopying *rootIdentifier;

  v4 = objc_alloc_init(VUICollisionSafeIdentifier);
  v5 = -[NSCopying copy](self->_rootIdentifier, "copy");
  rootIdentifier = v4->_rootIdentifier;
  v4->_rootIdentifier = (NSCopying *)v5;

  v4->_collisionCount = self->_collisionCount;
  return v4;
}

- (unint64_t)collisionCount
{
  return self->_collisionCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootIdentifier, 0);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[VUICollisionSafeIdentifier rootIdentifier](self, "rootIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_%lu"), v4, -[VUICollisionSafeIdentifier collisionCount](self, "collisionCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setRootIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setCollisionCount:(unint64_t)a3
{
  self->_collisionCount = a3;
}

@end
