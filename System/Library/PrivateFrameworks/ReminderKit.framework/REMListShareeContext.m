@implementation REMListShareeContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_list, 0);
  objc_storeStrong((id *)&self->_sharedOwner, 0);
}

- (REMListShareeContext)initWithList:(id)a3
{
  id v5;
  REMListShareeContext *v6;
  REMListShareeContext *v7;
  REMSharee *sharedOwner;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)REMListShareeContext;
  v6 = -[REMListShareeContext init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_list, a3);
    sharedOwner = v7->_sharedOwner;
    v7->_sharedOwner = 0;

    objc_msgSend(v5, "sharedOwnerID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      objc_msgSend(v5, "sharees");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(v15, "objectID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "sharedOwnerID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqual:", v17);

            if (v18)
            {
              objc_storeStrong((id *)&v7->_sharedOwner, v15);
              goto LABEL_13;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_13:

    }
  }

  return v7;
}

- (NSArray)sharees
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[REMListShareeContext list](self, "list");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (id)shareesExcludingOwner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[REMListShareeContext sharedOwner](self, "sharedOwner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[REMListShareeContext sharees](self, "sharees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3880];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __45__REMListShareeContext_shareesExcludingOwner__block_invoke;
  v14[3] = &unk_1E67FA3B8;
  v15 = v4;
  v7 = v4;
  objc_msgSend(v6, "predicateWithBlock:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("hash"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingDescriptors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __45__REMListShareeContext_shareesExcludingOwner__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = objc_opt_class();
  REMDynamicCast(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v7;
}

- (REMSharee)sharedOwner
{
  return self->_sharedOwner;
}

- (REMList)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
  objc_storeStrong((id *)&self->_list, a3);
}

@end
