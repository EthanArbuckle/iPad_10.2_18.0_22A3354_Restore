@implementation WFDatabaseAccessResourceState

- (WFDatabaseAccessResourceState)initWithPersistentIdentifier:(id)a3 perWorkflowStateData:(id)a4
{
  id v6;
  id v7;
  WFDatabaseAccessResourceState *v8;
  uint64_t v9;
  NSString *persistentIdentifier;
  uint64_t v11;
  NSData *perWorkflowStateData;
  WFDatabaseAccessResourceState *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFDatabaseAccessResourceState;
  v8 = -[WFDatabaseAccessResourceState init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    persistentIdentifier = v8->_persistentIdentifier;
    v8->_persistentIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    perWorkflowStateData = v8->_perWorkflowStateData;
    v8->_perWorkflowStateData = (NSData *)v11;

    v13 = v8;
  }

  return v8;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (NSData)perWorkflowStateData
{
  return self->_perWorkflowStateData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perWorkflowStateData, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
}

@end
