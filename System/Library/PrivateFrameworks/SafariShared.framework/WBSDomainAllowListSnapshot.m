@implementation WBSDomainAllowListSnapshot

- (WBSDomainAllowListSnapshot)init
{

  return 0;
}

- (WBSDomainAllowListSnapshot)initWithSnapshotData:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  WBSDomainAllowListSnapshot *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D20], "safari_arrayWithPropertyListData:options:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0, (_QWORD)v16);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }

            v14 = 0;
            goto LABEL_14;
          }
          objc_msgSend(v7, "addObject:", v13, (_QWORD)v16);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }

    self = -[WBSDomainAllowListSnapshot initWithDomains:](self, "initWithDomains:", v7);
    v14 = self;
LABEL_14:

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 259, 0);
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (WBSDomainAllowListSnapshot)initWithDomains:(id)a3
{
  id v4;
  WBSDomainAllowListSnapshot *v5;
  uint64_t v6;
  NSSet *allowedDomains;
  WBSDomainAllowListSnapshot *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSDomainAllowListSnapshot;
  v5 = -[WBSDomainAllowListSnapshot init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    allowedDomains = v5->_allowedDomains;
    v5->_allowedDomains = (NSSet *)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)isDomainAllowed:(id)a3
{
  return -[NSSet containsObject:](self->_allowedDomains, "containsObject:", a3);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[NSSet isEqualToSet:](self->_allowedDomains, "isEqualToSet:", v4[1]);

  return v5;
}

- (id)snapshotData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB38B0];
  -[NSSet allObjects](self->_allowedDomains, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithPropertyList:format:options:error:", v4, 200, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedDomains, 0);
}

@end
