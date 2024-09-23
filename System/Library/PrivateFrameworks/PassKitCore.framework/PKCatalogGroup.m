@implementation PKCatalogGroup

- (void)setIsUbiquitous:(BOOL)a3
{
  self->_isUbiquitous = a3;
}

- (void)setGroupID:(id)a3
{
  objc_storeStrong((id *)&self->_groupID, a3);
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (NSMutableArray)uniqueIDs
{
  NSMutableArray *uniqueIDs;
  NSMutableArray *v4;
  NSMutableArray *v5;

  uniqueIDs = self->_uniqueIDs;
  if (!uniqueIDs)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_uniqueIDs;
    self->_uniqueIDs = v4;

    uniqueIDs = self->_uniqueIDs;
  }
  return uniqueIDs;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *groupID;
  id v5;
  id v6;

  groupID = self->_groupID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", groupID, CFSTR("groupID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueIDs, CFSTR("uniqueIDs"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PKCatalogGroup isUbiquitous](self, "isUbiquitous"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("isUbiquitous"));

}

- (BOOL)isUbiquitous
{
  return self->_isUbiquitous;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIDs, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
}

- (PKCatalogGroup)init
{
  PKCatalogGroup *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKCatalogGroup;
  result = -[PKCatalogGroup init](&v3, sel_init);
  if (result)
    result->_isUbiquitous = 1;
  return result;
}

- (PKCatalogGroup)initWithCoder:(id)a3
{
  id v4;
  PKCatalogGroup *v5;
  void *v6;
  uint64_t v7;
  NSNumber *groupID;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *uniqueIDs;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKCatalogGroup;
  v5 = -[PKCatalogGroup init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupID"));
    v7 = objc_claimAutoreleasedReturnValue();
    groupID = v5->_groupID;
    v5->_groupID = (NSNumber *)v7;

    v9 = objc_alloc(MEMORY[0x1E0C99E60]);
    v10 = objc_opt_class();
    v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("uniqueIDs"));
    v12 = objc_claimAutoreleasedReturnValue();
    uniqueIDs = v5->_uniqueIDs;
    v5->_uniqueIDs = (NSMutableArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isUbiquitous"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isUbiquitous = objc_msgSend(v14, "BOOLValue");

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToGroup:(id)a3
{
  id v4;
  NSNumber *groupID;
  NSNumber *v6;
  BOOL v7;
  NSMutableArray *uniqueIDs;
  NSMutableArray *v9;
  BOOL v10;

  v4 = a3;
  groupID = self->_groupID;
  v6 = (NSNumber *)*((_QWORD *)v4 + 2);
  if (groupID)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (groupID != v6)
      goto LABEL_16;
  }
  else if ((-[NSNumber isEqual:](groupID, "isEqual:") & 1) == 0)
  {
    goto LABEL_16;
  }
  if (!-[NSMutableArray count](self->_uniqueIDs, "count") && !objc_msgSend(*((id *)v4 + 3), "count"))
    goto LABEL_14;
  uniqueIDs = self->_uniqueIDs;
  v9 = (NSMutableArray *)*((_QWORD *)v4 + 3);
  if (!uniqueIDs || !v9)
  {
    if (uniqueIDs == v9)
      goto LABEL_14;
LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  if ((-[NSMutableArray isEqual:](uniqueIDs, "isEqual:") & 1) == 0)
    goto LABEL_16;
LABEL_14:
  v10 = 1;
LABEL_17:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKCatalogGroup *v5;
  uint64_t v6;
  NSNumber *groupID;
  uint64_t v8;
  NSMutableArray *uniqueIDs;

  v5 = -[PKCatalogGroup init](+[PKCatalogGroup allocWithZone:](PKCatalogGroup, "allocWithZone:"), "init");
  v6 = -[NSNumber copyWithZone:](self->_groupID, "copyWithZone:", a3);
  groupID = v5->_groupID;
  v5->_groupID = (NSNumber *)v6;

  v8 = -[NSMutableArray mutableCopyWithZone:](self->_uniqueIDs, "mutableCopyWithZone:", a3);
  uniqueIDs = v5->_uniqueIDs;
  v5->_uniqueIDs = (NSMutableArray *)v8;

  v5->_isUbiquitous = self->_isUbiquitous;
  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) Passes: %@"), self->_groupID, self->_uniqueIDs);
}

- (void)setUniqueIDs:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIDs, a3);
}

@end
