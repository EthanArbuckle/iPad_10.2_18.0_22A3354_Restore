@implementation REElementGroup

- (REElementGroup)initWithGroupIdentifier:(id)a3
{
  id v4;
  REElementGroup *v5;
  uint64_t v6;
  NSString *groupIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REElementGroup;
  v5 = -[REElementGroup init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v6;

  }
  return v5;
}

+ (id)topElementGroupWithIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupIdentifier:", v3);

  objc_msgSend(v4, "setBehavior:", 1);
  objc_msgSend(v4, "setMaxElementCount:", 1);
  return v4;
}

+ (id)adjoiningElementGroupWithIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupIdentifier:", v3);

  objc_msgSend(v4, "setBehavior:", 1);
  objc_msgSend(v4, "setMaxElementCount:", -1);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  REElementGroup *v4;
  REElementGroup *v5;
  REElementGroup *v6;
  NSString *groupIdentifier;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;

  v4 = (REElementGroup *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_behavior == v5->_behavior && self->_maxElementCount == v5->_maxElementCount)
      {
        groupIdentifier = self->_groupIdentifier;
        v8 = v5->_groupIdentifier;
        v9 = groupIdentifier;
        v10 = v9;
        if (v9 == v8)
          v11 = 1;
        else
          v11 = -[NSString isEqual:](v9, "isEqual:", v8);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  return self->_maxElementCount ^ self->_behavior ^ -[NSString hash](self->_groupIdentifier, "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithGroupIdentifier:", self->_groupIdentifier);
  objc_msgSend(v4, "setBehavior:", self->_behavior);
  objc_msgSend(v4, "setMaxElementCount:", self->_maxElementCount);
  return v4;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(unint64_t)a3
{
  self->_behavior = a3;
}

- (int64_t)maxElementCount
{
  return self->_maxElementCount;
}

- (void)setMaxElementCount:(int64_t)a3
{
  self->_maxElementCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

@end
