@implementation REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList)initWithParentSmartListObjectID:(id)a3
{
  id v5;
  REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList *v6;
  REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList;
  v6 = -[REMStoreInvocationValueStorage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_smartListObjectID, a3);

  return v7;
}

- (REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("smartListObjectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList initWithParentSmartListObjectID:](self, "initWithParentSmartListObjectID:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList smartListObjectID](self, "smartListObjectID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("smartListObjectID"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList smartListObjectID](self, "smartListObjectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "smartListObjectID");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v6)
    {
      v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      -[REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList smartListObjectID](self, "smartListObjectID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "smartListObjectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMSmartListSectionsDataViewInvocation_fetchSmartListSectionsInSmartList smartListObjectID](self, "smartListObjectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (REMObjectID)smartListObjectID
{
  return self->_smartListObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartListObjectID, 0);
}

@end
