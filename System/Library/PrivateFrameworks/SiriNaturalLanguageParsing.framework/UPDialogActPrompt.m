@implementation UPDialogActPrompt

- (UPDialogActPrompt)initWithIntent:(id)a3 entityType:(id)a4 entityName:(id)a5 reference:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  UPDialogActPrompt *v14;
  uint64_t v15;
  NSString *intent;
  uint64_t v17;
  NSString *entityType;
  uint64_t v19;
  NSString *entityName;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)UPDialogActPrompt;
  v14 = -[UPDialogActPrompt init](&v22, sel_init);
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

    objc_storeStrong((id *)&v14->_reference, a6);
  }

  return v14;
}

- (NSString)description
{
  void *v2;
  NSString *entityName;
  void *v4;
  void *v5;
  __int128 v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v7 = *(_OWORD *)&self->_intent;
  entityName = self->_entityName;
  -[USOSerializedGraph printedForm](self->_reference, "printedForm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("UPDialogActPrompt[intent: %@, entityType: %@, entityName: %@, reference: %@]"), v7, entityName, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
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

- (USOSerializedGraph)reference
{
  return (USOSerializedGraph *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

@end
