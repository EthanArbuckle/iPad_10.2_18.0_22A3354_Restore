@implementation RERelevanceProviderManagerScheduledUpdate

- (RERelevanceProviderManagerScheduledUpdate)initWithProvider:(id)a3 updateDate:(id)a4
{
  id v6;
  RERelevanceProviderManagerScheduledUpdate *v7;
  uint64_t v8;
  NSDate *updateDate;
  RERelevanceProviderManagerScheduledUpdate *v10;
  objc_super v12;

  v6 = a4;
  if (v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)RERelevanceProviderManagerScheduledUpdate;
    v7 = -[RERelevanceProviderManagerUpdate initWithProvider:](&v12, sel_initWithProvider_, a3);
    if (v7)
    {
      REDateByRemovingSubseconds(v6);
      v8 = objc_claimAutoreleasedReturnValue();
      updateDate = v7->_updateDate;
      v7->_updateDate = (NSDate *)v8;

    }
    self = v7;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)RERelevanceProviderManagerScheduledUpdate;
  -[RERelevanceProviderManagerScheduledUpdate description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v4, self->_updateDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RERelevanceProviderManagerScheduledUpdate;
  v4 = -[RERelevanceProviderManagerUpdate copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 3, self->_updateDate);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  RERelevanceProviderManagerScheduledUpdate *v4;
  NSDate *updateDate;
  NSDate *v6;
  NSDate *v7;
  NSDate *v8;
  char v9;
  objc_super v11;

  v4 = (RERelevanceProviderManagerScheduledUpdate *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v11.receiver = self,
          v11.super_class = (Class)RERelevanceProviderManagerScheduledUpdate,
          -[RERelevanceProviderManagerUpdate isEqual:](&v11, sel_isEqual_, self)))
    {
      updateDate = self->_updateDate;
      v6 = v4->_updateDate;
      v7 = updateDate;
      v8 = v7;
      if (v7 == v6)
        v9 = 1;
      else
        v9 = -[NSDate isEqual:](v7, "isEqual:", v6);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RERelevanceProviderManagerScheduledUpdate;
  v3 = -[RERelevanceProviderManagerUpdate hash](&v5, sel_hash);
  return -[NSDate hash](self->_updateDate, "hash") ^ v3;
}

- (NSDate)updateDate
{
  return self->_updateDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateDate, 0);
}

@end
