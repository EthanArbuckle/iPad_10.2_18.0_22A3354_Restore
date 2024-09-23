@implementation STUIAskForTimeRequestResponse

- (STUIAskForTimeRequestResponse)init
{
  return -[STUIAskForTimeRequestResponse initWithRequestResponse:](self, "initWithRequestResponse:", 0);
}

- (STUIAskForTimeRequestResponse)initWithRequestResponse:(id)a3
{
  id v4;
  STUIAskForTimeRequestResponse *v5;
  STUIAskForTimeRequestResponse *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *budgetedIdentifier;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *identifier;
  void *v14;
  uint64_t v15;
  NSNumber *requestingUserDSID;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STUIAskForTimeRequestResponse;
  v5 = -[STUIAskForTimeRequestResponse init](&v18, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_msgSend(v4, "usageType");
    if (v7 == 2)
    {
      v6->_usageType = 1;
      objc_msgSend(v4, "requestedCategoryIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else if (v7 == 1)
    {
      v6->_usageType = 2;
      objc_msgSend(v4, "requestedWebDomain");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7)
      {
LABEL_10:
        objc_msgSend(v4, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "UUIDString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "copy");
        identifier = v6->_identifier;
        v6->_identifier = (NSString *)v12;

        objc_msgSend(v4, "requestingUser");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dsid");
        v15 = objc_claimAutoreleasedReturnValue();
        requestingUserDSID = v6->_requestingUserDSID;
        v6->_requestingUserDSID = (NSNumber *)v15;

        goto LABEL_11;
      }
      v6->_usageType = 0;
      objc_msgSend(v4, "requestedApplicationBundleIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    budgetedIdentifier = v6->_budgetedIdentifier;
    v6->_budgetedIdentifier = (NSString *)v8;

    goto LABEL_10;
  }
LABEL_11:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 8) = self->_usageType;
  v5 = -[NSString copy](self->_identifier, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  v7 = -[NSString copy](self->_budgetedIdentifier, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  objc_storeStrong((id *)(v4 + 32), self->_requestingUserDSID);
  return (id)v4;
}

- (unint64_t)usageType
{
  return self->_usageType;
}

- (void)setUsageType:(unint64_t)a3
{
  self->_usageType = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)budgetedIdentifier
{
  return self->_budgetedIdentifier;
}

- (void)setBudgetedIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)requestingUserDSID
{
  return self->_requestingUserDSID;
}

- (void)setRequestingUserDSID:(id)a3
{
  objc_storeStrong((id *)&self->_requestingUserDSID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestingUserDSID, 0);
  objc_storeStrong((id *)&self->_budgetedIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
