@implementation WFWorkflowQuery

- (WFWorkflowQuery)initWithFolderIdentifier:(id)a3
{
  id v4;
  WFWorkflowQuery *v5;
  uint64_t v6;
  NSString *folderIdentifier;
  WFWorkflowQuery *v8;

  v4 = a3;
  v5 = -[WFWorkflowQuery initWithLocation:](self, "initWithLocation:", 3);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    folderIdentifier = v5->_folderIdentifier;
    v5->_folderIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFWorkflowQuery)initWithLocation:(unint64_t)a3
{
  WFWorkflowQuery *v4;
  WFWorkflowQuery *v5;
  WFWorkflowQuery *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFWorkflowQuery;
  v4 = -[WFWorkflowQuery init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_location = a3;
    v6 = v4;
  }

  return v5;
}

- (int64_t)resultsLimit
{
  return self->_resultsLimit;
}

- (unint64_t)location
{
  return self->_location;
}

- (BOOL)includeTombstonesAndConflicts
{
  return self->_includeTombstonesAndConflicts;
}

- (NSString)folderIdentifier
{
  return self->_folderIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderIdentifier, 0);
  objc_storeStrong((id *)&self->_workflowType, 0);
}

- (WFWorkflowQuery)initWithWorkflowType:(id)a3
{
  id v4;
  WFWorkflowQuery *v5;
  uint64_t v6;
  NSString *workflowType;
  WFWorkflowQuery *v8;

  v4 = a3;
  v5 = -[WFWorkflowQuery initWithLocation:](self, "initWithLocation:", 2);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    workflowType = v5->_workflowType;
    v5->_workflowType = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (WFWorkflowQuery)initWithCollectionIdentifier:(id)a3
{
  WFWorkflowQuery *v3;
  WFWorkflowQuery *v4;

  if (a3)
    v3 = -[WFWorkflowQuery initWithFolderIdentifier:](self, "initWithFolderIdentifier:");
  else
    v3 = -[WFWorkflowQuery initWithLocation:](self, "initWithLocation:", 1);
  v4 = v3;

  return v4;
}

- (WFWorkflowQuery)initWithCoder:(id)a3
{
  id v4;
  WFWorkflowQuery *v5;
  uint64_t v6;
  NSString *folderIdentifier;
  uint64_t v8;
  NSString *workflowType;
  WFWorkflowQuery *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFWorkflowQuery;
  v5 = -[WFWorkflowQuery init](&v12, sel_init);
  if (v5)
  {
    v5->_location = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("location"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("folderIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    folderIdentifier = v5->_folderIdentifier;
    v5->_folderIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workflowType"));
    v8 = objc_claimAutoreleasedReturnValue();
    workflowType = v5->_workflowType;
    v5->_workflowType = (NSString *)v8;

    v5->_resultsLimit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("resultsLimit"));
    v5->_includeTombstonesAndConflicts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("includeTombstonesAndConflicts"));
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[WFWorkflowQuery location](self, "location"), CFSTR("location"));
  -[WFWorkflowQuery folderIdentifier](self, "folderIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("folderIdentifier"));

  -[WFWorkflowQuery workflowType](self, "workflowType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("workflowType"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[WFWorkflowQuery resultsLimit](self, "resultsLimit"), CFSTR("resultsLimit"));
  objc_msgSend(v6, "encodeBool:forKey:", -[WFWorkflowQuery includeTombstonesAndConflicts](self, "includeTombstonesAndConflicts"), CFSTR("includeTombstonesAndConflicts"));

}

- (NSString)workflowType
{
  return self->_workflowType;
}

- (void)setResultsLimit:(int64_t)a3
{
  self->_resultsLimit = a3;
}

- (void)setIncludeTombstonesAndConflicts:(BOOL)a3
{
  self->_includeTombstonesAndConflicts = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
