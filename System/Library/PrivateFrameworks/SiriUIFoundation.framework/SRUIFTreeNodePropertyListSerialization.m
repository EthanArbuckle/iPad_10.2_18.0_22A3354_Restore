@implementation SRUIFTreeNodePropertyListSerialization

- (id)_propertyListWithTreeNode:(id)a3 itemPropertyListCreation:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void (**v15)(id, uint64_t);
  _QWORD v17[5];
  id v18;
  void (**v19)(id, uint64_t);
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "item");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v7 && v9)
  {
    v7[2](v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v8, "setObject:forKey:", v11, CFSTR("Item"));
    }
    else
    {
      v12 = *MEMORY[0x24BE08FB0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[SRUIFTreeNodePropertyListSerialization _propertyListWithTreeNode:itemPropertyListCreation:]";
        v22 = 2112;
        v23 = v10;
        _os_log_impl(&dword_219F26000, v12, OS_LOG_TYPE_DEFAULT, "%s item property list creation block returned nil for item %@", buf, 0x16u);
      }
    }

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "numberOfChildNodes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __93__SRUIFTreeNodePropertyListSerialization__propertyListWithTreeNode_itemPropertyListCreation___block_invoke;
  v17[3] = &unk_24DC1B568;
  v18 = v13;
  v19 = v7;
  v17[4] = self;
  v14 = v13;
  v15 = v7;
  objc_msgSend(v6, "enumerateChildNodesUsingBlock:", v17);
  objc_msgSend(v8, "setObject:forKey:", v14, CFSTR("ChildNodes"));

  return v8;
}

void __93__SRUIFTreeNodePropertyListSerialization__propertyListWithTreeNode_itemPropertyListCreation___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_propertyListWithTreeNode:itemPropertyListCreation:", a2, *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

- (id)propertyListWithTreeNode:(id)a3 itemPropertyListCreation:(id)a4
{
  void *v4;

  -[SRUIFTreeNodePropertyListSerialization _propertyListWithTreeNode:itemPropertyListCreation:](self, "_propertyListWithTreeNode:itemPropertyListCreation:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", &unk_24DC26530, CFSTR("Version"));
  return v4;
}

- (id)_treeNodeWithPropertyList:(id)a3 error:(id *)a4 itemCreation:(id)a5
{
  id v8;
  id v9;
  SRUIFDictionarySchema *v10;
  id v11;
  void *v12;
  SRUIFTreeNode *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  SRUIFTreeNode *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(SRUIFDictionarySchema);
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __87__SRUIFTreeNodePropertyListSerialization__treeNodeWithPropertyList_error_itemCreation___block_invoke;
  v34[3] = &unk_24DC1B5B8;
  v34[4] = self;
  v11 = v9;
  v35 = v11;
  +[SRUIFCoercion coercionWithBlock:](SRUIFCoercion, "coercionWithBlock:", v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v10, "setObjectCoercion:forKey:", v12, CFSTR("ChildNodes"));

  v13 = objc_alloc_init(SRUIFTreeNode);
  -[SRUIFDictionarySchema coerceObject:error:](v10, "coerceObject:error:", v8, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "objectForKey:", CFSTR("Item"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v28 = (void *)v16;
    v29 = v8;
    if (v11)
    {
      v18 = v16;
      if (v16)
      {
        (*((void (**)(id, uint64_t))v11 + 2))(v11, v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          -[SRUIFTreeNode setItem:](v13, "setItem:", v19);
          v17 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Item creation block returned nil for %@"), v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          +[SRUIFConversationError errorWithCode:localizedFailureReason:](SRUIFConversationError, "errorWithCode:localizedFailureReason:", 400, v21);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = 0;
        }

      }
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v15, "objectForKey:", CFSTR("ChildNodes"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v22);
          -[SRUIFTreeNode addChildNode:](v13, "addChildNode:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v24);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v17);
    v13 = v13;

    v20 = v13;
    v8 = v29;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

id __87__SRUIFTreeNodePropertyListSerialization__treeNodeWithPropertyList_error_itemCreation___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  id *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  id obj;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  id *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v5 = a2;
  v25 = 0;
  v26 = (id *)&v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__3;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3;
  v23 = __Block_byref_object_dispose__3;
  v24 = 0;
  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;
  obj = v26[5];
  objc_msgSend(v6, "coerceObject:error:", v5, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v7 + 5, obj);

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v20[5];
    v20[5] = v9;

    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __87__SRUIFTreeNodePropertyListSerialization__treeNodeWithPropertyList_error_itemCreation___block_invoke_11;
    v14[3] = &unk_24DC1B590;
    v11 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v16 = &v25;
    v15 = v11;
    v17 = &v19;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);

  }
  if (a3)
    *a3 = objc_retainAutorelease(v26[5]);
  v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

void __87__SRUIFTreeNodePropertyListSerialization__treeNodeWithPropertyList_error_itemCreation___block_invoke_11(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id obj;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_treeNodeWithPropertyList:error:itemCreation:", a2, &obj, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  if (v7)
  {
    objc_msgSend(v9, "addObject:", v7);
  }
  else
  {
    *(_QWORD *)(v8 + 40) = 0;

    *a4 = 1;
  }

}

- (id)treeNodeWithPropertyList:(id)a3 error:(id *)a4 itemCreation:(id)a5
{
  id v8;
  id v9;
  SRUIFDictionarySchema *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(SRUIFDictionarySchema);
  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v10, "setObjectCoercion:forKey:", v11, CFSTR("Version"));

  -[SRUIFDictionarySchema coerceObject:error:](v10, "coerceObject:error:", v9, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_6;
  objc_msgSend(v12, "objectForKey:", CFSTR("Version"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  if (v14 != 1)
  {
    if (!a4)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to create tree node from property list with version %ld"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SRUIFConversationError errorWithCode:localizedFailureReason:](SRUIFConversationError, "errorWithCode:localizedFailureReason:", 400, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    a4 = 0;
    goto LABEL_7;
  }
  -[SRUIFTreeNodePropertyListSerialization _treeNodeWithPropertyList:error:itemCreation:](self, "_treeNodeWithPropertyList:error:itemCreation:", v12, a4, v8);
  a4 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return a4;
}

@end
