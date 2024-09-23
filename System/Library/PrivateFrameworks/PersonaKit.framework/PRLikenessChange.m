@implementation PRLikenessChange

+ (id)changeForLikeness:(id)a3 withType:(unint64_t)a4
{
  id v5;
  PRLikenessChange *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSString *changedLikenessID;
  uint64_t v12;
  NSNumber *changedLikenessVersion;
  void *v14;
  uint64_t v15;
  NSArray *dirtyLikenessProperties;

  v5 = a3;
  v6 = objc_alloc_init(PRLikenessChange);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = objc_claimAutoreleasedReturnValue();
  identifier = v6->_identifier;
  v6->_identifier = (NSString *)v8;

  v6->_type = a4;
  objc_msgSend(v5, "uniqueIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  changedLikenessID = v6->_changedLikenessID;
  v6->_changedLikenessID = (NSString *)v10;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "version"));
  v12 = objc_claimAutoreleasedReturnValue();
  changedLikenessVersion = v6->_changedLikenessVersion;
  v6->_changedLikenessVersion = (NSNumber *)v12;

  objc_msgSend(v5, "dirtyProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "allObjects");
  v15 = objc_claimAutoreleasedReturnValue();
  dirtyLikenessProperties = v6->_dirtyLikenessProperties;
  v6->_dirtyLikenessProperties = (NSArray *)v15;

  return v6;
}

+ (id)descriptionForChangeType:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("(undefined)");
  else
    return *(&off_24C1C17B0 + a3);
}

+ (unint64_t)changeTypeFromDescription:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqual:", CFSTR("delete")) & 1) != 0)
    v4 = 2;
  else
    v4 = objc_msgSend(v3, "isEqual:", CFSTR("create"));

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  +[PRLikenessChange descriptionForChangeType:](PRLikenessChange, "descriptionForChangeType:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PRLikenessChange {type: %@, changed-version: %@, changed-id: %@, dirty-props: %@}"), v4, self->_changedLikenessVersion, self->_changedLikenessID, self->_dirtyLikenessProperties);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)changedLikenessID
{
  return self->_changedLikenessID;
}

- (void)setChangedLikenessID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)changedLikenessVersion
{
  return self->_changedLikenessVersion;
}

- (void)setChangedLikenessVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)dirtyLikenessProperties
{
  return self->_dirtyLikenessProperties;
}

- (void)setDirtyLikenessProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dirtyLikenessProperties, 0);
  objc_storeStrong((id *)&self->_changedLikenessVersion, 0);
  objc_storeStrong((id *)&self->_changedLikenessID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
