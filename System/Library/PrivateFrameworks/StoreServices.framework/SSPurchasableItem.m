@implementation SSPurchasableItem

- (SSPurchasableItem)initWithPropertyValues:(id)a3
{
  SSPurchasableItem *v4;

  v4 = -[SSPurchasableItem init](self, "init");
  if (v4)
    v4->_propertyValues = (NSDictionary *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSPurchasableItem;
  -[SSPurchasableItem dealloc](&v3, sel_dealloc);
}

- (id)propertyValues
{
  return self->_propertyValues;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> [PID: %lld] [Account: %lld] [StoreID: %lld]"), NSStringFromClass(v4), self, -[SSPurchasableItem pid](self, "pid"), -[SSPurchasableItem accountUniqueIdentifier](self, "accountUniqueIdentifier"), -[SSPurchasableItem storeID](self, "storeID"));
}

- (int64_t)pid
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_propertyValues, "objectForKey:", SSPurchasableItemPID), "longLongValue");
}

- (int64_t)accountUniqueIdentifier
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_propertyValues, "objectForKey:", SSPurchasableItemAccountUniqueIdentifier), "longLongValue");
}

- (id)datePurchased
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(-[NSDictionary objectForKey:](self->_propertyValues, "objectForKey:", SSPurchasableItemDatePurchased), "longLongValue"));
}

- (BOOL)isHidden
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_propertyValues, "objectForKey:", SSPurchasableItemIsHidden), "BOOLValue");
}

- (int64_t)storeID
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_propertyValues, "objectForKey:", SSPurchasableItemStoreID), "longLongValue");
}

+ (id)databaseTable
{
  return 0;
}

+ (id)sortByDatePurchasedKey
{
  return (id)SSPurchasableItemDatePurchased;
}

+ (id)allPropertyKeys
{
  if (allPropertyKeys_onceToken != -1)
    dispatch_once(&allPropertyKeys_onceToken, &__block_literal_global_35);
  return (id)allPropertyKeys___allPropertyKeys;
}

uint64_t __36__SSPurchasableItem_allPropertyKeys__block_invoke()
{
  uint64_t result;
  _QWORD v1[6];

  v1[5] = *MEMORY[0x1E0C80C00];
  v1[0] = SSPurchasableItemPID;
  v1[1] = SSPurchasableItemAccountUniqueIdentifier;
  v1[2] = SSPurchasableItemDatePurchased;
  v1[3] = SSPurchasableItemIsHidden;
  v1[4] = SSPurchasableItemStoreID;
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v1, 5);
  allPropertyKeys___allPropertyKeys = result;
  return result;
}

@end
