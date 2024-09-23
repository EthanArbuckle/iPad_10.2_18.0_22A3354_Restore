@implementation WFCloudKitBaseOrdering

+ (NSString)recordType
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("+recordType should be overridden by subclasses"));
  return (NSString *)&stru_1E7AFA810;
}

+ (NSDictionary)properties
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("orderedWorkflowIDs");
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:", CFSTR("orderedWorkflowIDsArray"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("orderedFolderIDs");
  v7[0] = v2;
  +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:", CFSTR("orderedFolderIDsArray"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

+ (NSString)recordBasename
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("+recordBasename should be overridden by subclasses"));
  return (NSString *)&stru_1E7AFA810;
}

+ (id)collectionIdentifierForRecordID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "recordBasename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hasPrefix:", v7))
  {
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v7, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)collectionIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[WFCloudKitBaseOrdering identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionIdentifierForRecordID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSOrderedSet)orderedFolderIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFCloudKitBaseOrdering orderedFolderIDsArray](self, "orderedFolderIDsArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E40];
    -[WFCloudKitBaseOrdering orderedFolderIDsArray](self, "orderedFolderIDsArray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orderedSetWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSOrderedSet *)v6;
}

- (NSOrderedSet)orderedWorkflowIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFCloudKitBaseOrdering orderedWorkflowIDsArray](self, "orderedWorkflowIDsArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E40];
    -[WFCloudKitBaseOrdering orderedWorkflowIDsArray](self, "orderedWorkflowIDsArray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "orderedSetWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return (NSOrderedSet *)v6;
}

- (WFCloudKitBaseOrdering)initWithIdentifier:(id)a3 orderedWorkflowIDs:(id)a4 orderedFolderIDs:(id)a5
{
  id v10;
  id v11;
  id v12;
  WFCloudKitBaseOrdering *v13;
  WFCloudKitBaseOrdering *v14;
  uint64_t v15;
  NSArray *orderedWorkflowIDsArray;
  uint64_t v17;
  NSArray *orderedFolderIDsArray;
  WFCloudKitBaseOrdering *v19;
  void *v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCloudKitBaseOrdering.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v13 = -[WFCloudKitBaseOrdering init](self, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_msgSend(v11, "array");
    v15 = objc_claimAutoreleasedReturnValue();
    orderedWorkflowIDsArray = v14->_orderedWorkflowIDsArray;
    v14->_orderedWorkflowIDsArray = (NSArray *)v15;

    objc_msgSend(v12, "array");
    v17 = objc_claimAutoreleasedReturnValue();
    orderedFolderIDsArray = v14->_orderedFolderIDsArray;
    v14->_orderedFolderIDsArray = (NSArray *)v17;

    v19 = v14;
  }

  return v14;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (NSData)recordSystemFieldsData
{
  return self->_recordSystemFieldsData;
}

- (void)setRecordSystemFieldsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)orderedWorkflowIDsArray
{
  return self->_orderedWorkflowIDsArray;
}

- (NSArray)orderedFolderIDsArray
{
  return self->_orderedFolderIDsArray;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedFolderIDsArray, 0);
  objc_storeStrong((id *)&self->_orderedWorkflowIDsArray, 0);
  objc_storeStrong((id *)&self->_recordSystemFieldsData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
