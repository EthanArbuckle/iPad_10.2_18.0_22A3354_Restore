@implementation SXTangierDragItemProvider

- (id)dragItemForSmartField:(id)a3 interaction:(id)a4 session:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  SXIdentifiableItemProvider *v20;
  void *v21;
  void *v22;
  SXIdentifiableItemProvider *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  SXIdentifiableItemProvider *v38;
  void *v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_6;
  }
  v11 = v8;
  objc_msgSend(v11, "action");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "conformsToProtocol:", &unk_254F563B8);

  if (!v13)
  {
LABEL_6:
    v17 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v11, "action");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SXTangierDragItemProvider session:containsURL:](self, "session:containsURL:", v10, v15);

  if (v16)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v14, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v18;
    objc_msgSend(v18, "_setTitle:", v19);

    v20 = [SXIdentifiableItemProvider alloc];
    objc_msgSend(v14, "URL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "absoluteString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[SXIdentifiableItemProvider initWithObject:identifier:](v20, "initWithObject:identifier:", v18, v22);

    objc_msgSend(v11, "displayText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v23;
    -[SXIdentifiableItemProvider setSuggestedName:](v23, "setSuggestedName:", v24);

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF69F0]), "initWithItemProvider:", v23);
    objc_msgSend(v9, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationInView:", v25);
    v27 = v26;
    v29 = v28;

    v30 = objc_alloc(MEMORY[0x24BDF6A00]);
    objc_msgSend(v9, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v30, "initWithContainer:center:", v31, v27, v29);

    v33 = (void *)MEMORY[0x24BDF6E88];
    objc_msgSend(v14, "URL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayText");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "previewForURL:title:target:", v34, v35, v32);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setLocalObject:", v36);

  }
LABEL_9:

  return v17;
}

- (BOOL)session:(id)a3 containsURL:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a3, "items", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "itemProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "absoluteString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

          if (v13)
          {

            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  return v7;
}

@end
