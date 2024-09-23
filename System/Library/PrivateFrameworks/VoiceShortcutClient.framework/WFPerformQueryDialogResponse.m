@implementation WFPerformQueryDialogResponse

- (WFPerformQueryDialogResponse)initWithQueryResults:(id)a3 cancelled:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  WFPerformQueryDialogResponse *v8;
  WFPerformQueryDialogResponse *v9;
  WFPerformQueryDialogResponse *v10;
  objc_super v12;

  v4 = a4;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFPerformQueryDialogResponse;
  v8 = -[WFDialogResponse initWithCancelled:](&v12, sel_initWithCancelled_, v4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queryResults, a3);
    v10 = v9;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPerformQueryDialogResponse queryResults](self, "queryResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFDialogResponse isCancelled](self, "isCancelled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, queryResults: %@, cancelled: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (WFPerformQueryDialogResponse)initWithCoder:(id)a3
{
  id v4;
  WFPerformQueryDialogResponse *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *queryResults;
  WFPerformQueryDialogResponse *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFPerformQueryDialogResponse;
  v5 = -[WFDialogResponse initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("queryResults"));
    v9 = objc_claimAutoreleasedReturnValue();
    queryResults = v5->_queryResults;
    v5->_queryResults = (NSArray *)v9;

    v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFPerformQueryDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[WFPerformQueryDialogResponse queryResults](self, "queryResults", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("queryResults"));

}

- (WFPerformQueryDialogResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  WFPerformQueryDialogResponse *v5;
  uint64_t v6;
  uint64_t v7;
  NSArray *queryResults;
  WFPerformQueryDialogResponse *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFPerformQueryDialogResponse;
  v5 = -[WFDialogResponse initWithBSXPCCoder:](&v11, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeCollectionOfClass:containingClass:forKey:", v6, objc_opt_class(), CFSTR("queryResults"));
    v7 = objc_claimAutoreleasedReturnValue();
    queryResults = v5->_queryResults;
    v5->_queryResults = (NSArray *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFPerformQueryDialogResponse;
  v4 = a3;
  -[WFDialogResponse encodeWithBSXPCCoder:](&v6, sel_encodeWithBSXPCCoder_, v4);
  -[WFPerformQueryDialogResponse queryResults](self, "queryResults", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeCollection:forKey:", v5, CFSTR("queryResults"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WFDialogResponse isCancelled](self, "isCancelled"), CFSTR("cancelled"));
}

- (NSArray)queryResults
{
  return self->_queryResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryResults, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

@end
