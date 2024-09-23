@implementation RBSEndowmentTree

+ (id)endowmentTreeForNamespace:(id)a3
{
  id v3;
  _QWORD *v4;

  v3 = a3;
  v4 = -[RBSEndowmentTree _initWithNamespace:]([RBSEndowmentTree alloc], v3);

  return v4;
}

- (_QWORD)_initWithNamespace:(void *)a1
{
  id *v4;
  _QWORD *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v52 = a2;
  if (a1)
  {
    v65.receiver = a1;
    v65.super_class = (Class)RBSEndowmentTree;
    v4 = (id *)objc_msgSendSuper2(&v65, sel_init);
    v5 = v4;
    if (v4)
    {
      objc_storeStrong(v4 + 2, a2);
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = (void *)v5[1];
      v5[1] = v6;

      +[RBSConnection sharedInstance](RBSConnection, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "assertionDescriptorsByPidWithFlattenedAttributes:error:", 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v10 = v9;
        v41 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
        if (!v41)
          goto LABEL_35;
        v39 = *(_QWORD *)v62;
        v40 = v10;
        v47 = (uint64_t)v5;
        while (1)
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v62 != v39)
              objc_enumerationMutation(v10);
            v42 = v11;
            objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v11), v39);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            v60 = 0u;
            obj = v12;
            v45 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
            if (v45)
            {
              v44 = *(_QWORD *)v58;
              do
              {
                v13 = 0;
                do
                {
                  if (*(_QWORD *)v58 != v44)
                    objc_enumerationMutation(obj);
                  v46 = v13;
                  v14 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v13);
                  v53 = 0u;
                  v54 = 0u;
                  v55 = 0u;
                  v56 = 0u;
                  v49 = v14;
                  objc_msgSend(v14, "attributes");
                  v50 = (id)objc_claimAutoreleasedReturnValue();
                  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
                  if (v51)
                  {
                    v15 = *(_QWORD *)v54;
                    v48 = *(_QWORD *)v54;
                    do
                    {
                      v16 = 0;
                      do
                      {
                        if (*(_QWORD *)v54 != v15)
                          objc_enumerationMutation(v50);
                        v17 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v16);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v18 = v17;
                          objc_msgSend(v18, "endowmentNamespace");
                          v19 = (void *)objc_claimAutoreleasedReturnValue();
                          v20 = objc_msgSend(v19, "isEqual:", v52);

                          if (v20)
                          {
                            objc_msgSend(v18, "sourceEnvironment");
                            v21 = (void *)objc_claimAutoreleasedReturnValue();
                            if (!v21)
                              v21 = (void *)objc_msgSend((id)RBSEndowmentRootEnvironment, "copy");
                            objc_msgSend(v49, "identifier");
                            v22 = (void *)objc_claimAutoreleasedReturnValue();
                            v23 = objc_msgSend(v22, "clientPid");
                            objc_msgSend(v49, "target");
                            v24 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v24, "environment");
                            v25 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v49, "target");
                            v26 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v26, "processIdentifier");
                            v27 = (void *)objc_claimAutoreleasedReturnValue();
                            +[RBSEndowmentLink endowmentLinkForNamespace:sourceEnvironment:sourcePid:targetEnvironment:targetPid:](RBSEndowmentLink, "endowmentLinkForNamespace:sourceEnvironment:sourcePid:targetEnvironment:targetPid:", v52, v21, v23, v25, objc_msgSend(v27, "pid"));
                            v28 = (void *)objc_claimAutoreleasedReturnValue();

                            v5 = (_QWORD *)v47;
                            -[RBSEndowmentTree _addLink:](v47, v28);

                            goto LABEL_27;
                          }
                        }
                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) == 0)
                            goto LABEL_29;
                          objc_msgSend(v17, "endowmentNamespace");
                          v29 = (void *)objc_claimAutoreleasedReturnValue();
                          v30 = objc_msgSend(v29, "isEqual:", v52);

                          if (v30)
                          {
                            v31 = (void *)objc_msgSend((id)RBSEndowmentRootEnvironment, "copy");
                            objc_msgSend(v49, "identifier");
                            v32 = (void *)objc_claimAutoreleasedReturnValue();
                            v33 = objc_msgSend(v32, "clientPid");
                            objc_msgSend(v49, "target");
                            v34 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v34, "environment");
                            v35 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v49, "target");
                            v36 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v36, "processIdentifier");
                            v37 = (void *)objc_claimAutoreleasedReturnValue();
                            +[RBSEndowmentLink endowmentLinkForNamespace:sourceEnvironment:sourcePid:targetEnvironment:targetPid:](RBSEndowmentLink, "endowmentLinkForNamespace:sourceEnvironment:sourcePid:targetEnvironment:targetPid:", v52, v31, v33, v35, objc_msgSend(v37, "pid"));
                            v21 = (void *)objc_claimAutoreleasedReturnValue();

                            v5 = (_QWORD *)v47;
                            -[RBSEndowmentTree _addLink:](v47, v21);
LABEL_27:

                            v15 = v48;
                          }
                        }

LABEL_29:
                        ++v16;
                      }
                      while (v51 != v16);
                      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
                    }
                    while (v51);
                  }

                  v13 = v46 + 1;
                }
                while (v46 + 1 != v45);
                v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
              }
              while (v45);
            }

            v11 = v42 + 1;
            v10 = v40;
          }
          while (v42 + 1 != v41);
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
          if (!v41)
          {
LABEL_35:

            goto LABEL_37;
          }
        }
      }
      v10 = v5;
      v5 = 0;
LABEL_37:

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)endowmentTreeForLinks:(id)a3
{
  id v3;
  _QWORD *v4;

  v3 = a3;
  v4 = -[RBSEndowmentTree _initWithLinks:]([RBSEndowmentTree alloc], v3);

  return v4;
}

- (_QWORD)_initWithLinks:(_QWORD *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v3 = a2;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)RBSEndowmentTree;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      objc_msgSend(v3, "anyObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endowmentNamespace");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)a1[2];
      a1[2] = v5;

      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = (void *)a1[1];
      a1[1] = v7;

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __35__RBSEndowmentTree__initWithLinks___block_invoke;
      v10[3] = &unk_1E2D173B0;
      a1 = a1;
      v11 = a1;
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", v10);

    }
  }

  return a1;
}

- (void)_addLink:(uint64_t)a1
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a1)
  {
    v3 = *(void **)(a1 + 8);
    objc_msgSend(v8, "sourceEnvironment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v6 = *(void **)(a1 + 8);
      objc_msgSend(v8, "sourceEnvironment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v5, v7);

    }
    objc_msgSend(v5, "addObject:", v8);

  }
}

void __35__RBSEndowmentTree__initWithLinks___block_invoke(uint64_t a1, void *a2)
{
  -[RBSEndowmentTree _addLink:](*(_QWORD *)(a1 + 32), a2);
}

- (id)rootLinks
{
  return (id)-[NSMutableDictionary objectForKey:](self->_tree, "objectForKey:", RBSEndowmentRootEnvironment);
}

- (id)childrenLinks:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *tree;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  tree = self->_tree;
  objc_msgSend(v4, "targetEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](tree, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __34__RBSEndowmentTree_childrenLinks___block_invoke;
  v14[3] = &unk_1E2D173D8;
  v15 = v4;
  v9 = v5;
  v16 = v9;
  v10 = v4;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

void __34__RBSEndowmentTree_childrenLinks___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "targetPid");
    if (v3 == objc_msgSend(v4, "sourcePid"))
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }

}

- (BOOL)isEqual:(id)a3
{
  RBSEndowmentTree *v4;
  uint64_t v5;
  char v6;
  NSString *endowmentNamespace;
  NSString *v8;
  NSMutableDictionary *tree;
  NSMutableDictionary *v10;

  v4 = (RBSEndowmentTree *)a3;
  if (self == v4)
    goto LABEL_12;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
LABEL_3:
    v6 = 0;
    goto LABEL_13;
  }
  endowmentNamespace = self->_endowmentNamespace;
  v8 = v4->_endowmentNamespace;
  if (endowmentNamespace != v8)
  {
    v6 = 0;
    if (!endowmentNamespace || !v8)
      goto LABEL_13;
    if (!-[NSString isEqual:](endowmentNamespace, "isEqual:"))
      goto LABEL_3;
  }
  tree = self->_tree;
  v10 = v4->_tree;
  if (tree == v10)
  {
LABEL_12:
    v6 = 1;
    goto LABEL_13;
  }
  v6 = 0;
  if (tree && v10)
    v6 = -[NSMutableDictionary isEqual:](tree, "isEqual:");
LABEL_13:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_endowmentNamespace, "hash");
  return -[NSMutableDictionary hash](self->_tree, "hash") ^ v3;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| namespace:%@>"), v4, self->_endowmentNamespace);

  return (NSString *)v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RBSEndowmentTree *v4;

  v4 = objc_alloc_init(RBSEndowmentTree);
  objc_storeStrong((id *)&v4->_tree, self->_tree);
  objc_storeStrong((id *)&v4->_endowmentNamespace, self->_endowmentNamespace);
  return v4;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  NSMutableDictionary *tree;
  id v5;

  tree = self->_tree;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", tree, CFSTR("_tree"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endowmentNamespace, CFSTR("_endowmentNamespace"));

}

- (RBSEndowmentTree)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSEndowmentTree *v5;
  uint64_t v6;
  NSMutableDictionary *tree;
  uint64_t v8;
  NSString *endowmentNamespace;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RBSEndowmentTree;
  v5 = -[RBSEndowmentTree init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_tree"));
    v6 = objc_claimAutoreleasedReturnValue();
    tree = v5->_tree;
    v5->_tree = (NSMutableDictionary *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_endowmentNamespace"));
    v8 = objc_claimAutoreleasedReturnValue();
    endowmentNamespace = v5->_endowmentNamespace;
    v5->_endowmentNamespace = (NSString *)v8;

  }
  return v5;
}

- (NSString)endowmentNamespace
{
  return self->_endowmentNamespace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endowmentNamespace, 0);
  objc_storeStrong((id *)&self->_tree, 0);
}

@end
