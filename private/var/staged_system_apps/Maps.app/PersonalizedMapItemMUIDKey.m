@implementation PersonalizedMapItemMUIDKey

- (PersonalizedMapItemMUIDKey)init
{

  return 0;
}

- (PersonalizedMapItemMUIDKey)initWithMUID:(unint64_t)a3
{
  PersonalizedMapItemMUIDKey *v4;
  PersonalizedMapItemMUIDKey *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PersonalizedMapItemMUIDKey;
  v4 = -[PersonalizedMapItemMUIDKey init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    v4->_muid = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    v5->_hash = (unint64_t)objc_msgSend(v6, "hash");

  }
  return v5;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (BOOL)isEqual:(id)a3
{
  PersonalizedMapItemMUIDKey *v4;
  PersonalizedMapItemMUIDKey *v5;
  uint64_t v6;
  PersonalizedMapItemMUIDKey *v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;

  v4 = (PersonalizedMapItemMUIDKey *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (v4 == self)
  {
    v10 = 1;
    goto LABEL_7;
  }
  v6 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = v5;
    v8 = -[PersonalizedMapItemMUIDKey muid](self, "muid");
    v9 = -[PersonalizedMapItemMUIDKey muid](v7, "muid");

    v10 = v8 == v9;
  }
  else
  {
LABEL_5:
    v10 = 0;
  }
LABEL_7:

  return v10;
}

- (unint64_t)muid
{
  return self->_muid;
}

@end
