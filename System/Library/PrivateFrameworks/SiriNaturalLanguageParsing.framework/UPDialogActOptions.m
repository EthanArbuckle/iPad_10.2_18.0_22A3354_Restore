@implementation UPDialogActOptions

- (UPDialogActOptions)initWithIntent:(id)a3 entityType:(id)a4 entityName:(id)a5 entityValues:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  UPDialogActOptions *v14;
  uint64_t v15;
  NSString *intent;
  uint64_t v17;
  NSString *entityType;
  uint64_t v19;
  NSString *entityName;
  uint64_t v21;
  NSArray *entityValues;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)UPDialogActOptions;
  v14 = -[UPDialogActOptions init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    intent = v14->_intent;
    v14->_intent = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    entityType = v14->_entityType;
    v14->_entityType = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    entityName = v14->_entityName;
    v14->_entityName = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    entityValues = v14->_entityValues;
    v14->_entityValues = (NSArray *)v21;

  }
  return v14;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDialogActOptions[intent: %@, entityType: %@, entityName: %@, entityValues: %@]"), self->_intent, self->_entityType, self->_entityName, self->_entityValues);
}

- (NSString)intent
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)entityType
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)entityName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)entityValues
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityValues, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

@end
