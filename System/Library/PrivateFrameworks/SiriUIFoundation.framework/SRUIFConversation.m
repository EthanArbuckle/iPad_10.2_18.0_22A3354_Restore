@implementation SRUIFConversation

- (SRUIFConversation)initWithIdentifier:(id)a3 languageCode:(id)a4 rootNode:(id)a5
{
  id v8;
  id v9;
  id v10;
  SRUIFConversation *v11;
  uint64_t v12;
  NSUUID *identifier;
  uint64_t v14;
  NSString *languageCode;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SRUIFConversation;
  v11 = -[SRUIFConversation init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSUUID *)v12;

    objc_storeStrong((id *)&v11->_rootNode, a5);
    v14 = objc_msgSend(v9, "copy");
    languageCode = v11->_languageCode;
    v11->_languageCode = (NSString *)v14;

    v11->_synchronizedWithServer = 1;
  }

  return v11;
}

- (SRUIFConversation)initWithIdentifier:(id)a3 languageCode:(id)a4
{
  id v6;
  id v7;
  SRUIFTreeNode *v8;
  SRUIFConversation *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(SRUIFTreeNode);
  v9 = -[SRUIFConversation initWithIdentifier:languageCode:rootNode:](self, "initWithIdentifier:languageCode:rootNode:", v7, v6, v8);

  return v9;
}

- (SRUIFConversation)initWithLanguageCode:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SRUIFConversation *v7;

  v4 = (void *)MEMORY[0x24BDD1880];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SRUIFConversation initWithIdentifier:languageCode:](self, "initWithIdentifier:languageCode:", v6, v5);

  return v7;
}

- (id)_nodeAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SRUIFConversation _rootNode](self, "_rootNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nodeAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_itemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[SRUIFConversation _nodeAtIndexPath:](self, "_nodeAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_removeNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  SRUIFConversation *v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  SRUIFConversation *v39;
  id v40;
  id v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __34__SRUIFConversation__removeNodes___block_invoke;
    v37[3] = &unk_24DC1B080;
    v26 = v5;
    v38 = v26;
    v39 = self;
    v23 = self;
    v25 = v6;
    v40 = v25;
    v24 = v7;
    v41 = v24;
    v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x220736DE0](v37);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          ((void (**)(_QWORD, void *))v9)[2](v9, v15);
          v31[0] = v8;
          v31[1] = 3221225472;
          v31[2] = __34__SRUIFConversation__removeNodes___block_invoke_2;
          v31[3] = &unk_24DC1B0A8;
          v16 = v9;
          v31[4] = v15;
          v32 = v16;
          objc_msgSend(v15, "enumerateDescendentNodesUsingBlock:", v31);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      }
      while (v12);
    }

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = v10;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v42, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "removeFromParentNode", v23);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v42, 16);
      }
      while (v19);
    }

    if (objc_msgSend(v26, "count"))
    {
      -[SRUIFConversation delegate](v23, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "conversation:didRemoveItemsWithIdentifiers:atIndexPaths:parentItemIdentifiers:", v23, v26, v25, v24);

    }
  }

}

void __34__SRUIFConversation__removeNodes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
  {
    objc_msgSend(v14, "parentNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_rootNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "item");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v9)
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v3, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      v12 = *(void **)(a1 + 48);
      objc_msgSend(v14, "absoluteIndexPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v13);

      objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
    }

  }
}

uint64_t __34__SRUIFConversation__removeNodes___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_childOfNode:(id)a3 withItemWhichCanBeUpdatedWithAceObject:(id)a4 inDialogPhase:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  char v20;
  _QWORD v21[4];
  id v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1;
  v28 = __Block_byref_object_dispose__1;
  v29 = 0;
  if (-[SRUIFConversation _nodeContainsProvisionalItems:](self, "_nodeContainsProvisionalItems:", v8))
    v11 = objc_msgSend(v10, "isConfirmedDialogPhase");
  else
    v11 = 0;
  v12 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __87__SRUIFConversation__childOfNode_withItemWhichCanBeUpdatedWithAceObject_inDialogPhase___block_invoke;
  v21[3] = &unk_24DC1B0D0;
  v23 = v11;
  v13 = v9;
  v22 = v13;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __87__SRUIFConversation__childOfNode_withItemWhichCanBeUpdatedWithAceObject_inDialogPhase___block_invoke_2;
  v17[3] = &unk_24DC1B0F8;
  v20 = v11;
  v14 = (id)MEMORY[0x220736DE0](v21);
  v18 = v14;
  v19 = &v24;
  objc_msgSend(v8, "enumerateChildNodesWithOptions:usingBlock:", 2, v17);
  v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

uint64_t __87__SRUIFConversation__childOfNode_withItemWhichCanBeUpdatedWithAceObject_inDialogPhase___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;

  v3 = a2;
  objc_msgSend(v3, "dialogPhase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "presentationState");
  objc_msgSend(v3, "aceObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "isExpository");
  v8 = v7;
  if (v5 == 2)
  {
    if (*(_BYTE *)(a1 + 40))
      v8 = 1;
    else
      v8 = v7;
  }
  if ((objc_msgSend(v4, "isConfirmationDialogPhase") & 1) != 0
    || objc_msgSend(v4, "isClarificationDialogPhase"))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "af_isUtterance") ^ 1;
  }
  else
  {
    v9 = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "encodedClassName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodedClassName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", v11))
  {
    objc_msgSend(*(id *)(a1 + 32), "groupIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

  }
  else
  {
    v14 = 0;
  }

  return v9 & v8 & v14;
}

void __87__SRUIFConversation__childOfNode_withItemWhichCanBeUpdatedWithAceObject_inDialogPhase___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v7, "dialogPhase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isUserRequestDialogPhase");

    if ((v10 & 1) != 0)
      goto LABEL_5;
  }
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
LABEL_5:
    *a4 = 1;
  }

}

- (void)_processInsertions:(id)a3 inDialogPhase:(id)a4
{
  id v6;
  NSObject **v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  SRUIFConversation *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id *v34;
  void *v35;
  id obj;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[6];
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];
  id v58;
  uint8_t v59[128];
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v41 = a3;
  v6 = a4;
  v7 = (NSObject **)MEMORY[0x24BE08FB0];
  if (!v6)
  {
    +[SRUIFDialogPhase completionDialogPhase](SRUIFDialogPhase, "completionDialogPhase");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v8 = *v7;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v61 = "-[SRUIFConversation _processInsertions:inDialogPhase:]";
      v62 = 2112;
      v63 = v6;
      _os_log_impl(&dword_219F26000, v8, OS_LOG_TYPE_DEFAULT, "%s No dialog phase provided for conversation insertions; defaulting to %@",
        buf,
        0x16u);
    }
  }
  if ((objc_msgSend(v6, "isConfirmationDialogPhase") & 1) != 0
    || objc_msgSend(v6, "isClarificationDialogPhase"))
  {
    v9 = 2;
  }
  else
  {
    v9 = 1;
  }
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v57[0] = MEMORY[0x24BDAC760];
  v57[1] = 3221225472;
  v57[2] = __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke;
  v57[3] = &unk_24DC1B120;
  v13 = self;
  v57[4] = self;
  v14 = v11;
  v58 = v14;
  objc_msgSend(v41, "enumerateObjectsUsingBlock:", v57);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v38 = v14;
  objc_msgSend(v14, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  v39 = v10;
  if (v15)
  {
    v16 = v15;
    v34 = &v50;
    v17 = *(_QWORD *)v54;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v54 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v18);
        objc_msgSend(v38, "objectForKey:", v19, v34);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "sruif_arrayByMappingWithBlock:", &__block_literal_global_2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v6, "isExpository") & 1) == 0
          && (objc_msgSend(v6, "isConfirmedDialogPhase") & 1) == 0
          && ((objc_msgSend(v21, "containsObject:", &unk_24DC26488) & 1) != 0
           || (objc_msgSend(v21, "containsObject:", &unk_24DC264A0) & 1) != 0
           || objc_msgSend(v21, "containsObject:", &unk_24DC264B8))
          && -[SRUIFConversation _nodeContainsProvisionalItems:](v13, "_nodeContainsProvisionalItems:", v19))
        {
          if ((objc_msgSend(v6, "isConfirmationDialogPhase") & 1) != 0
            || objc_msgSend(v6, "isClarificationDialogPhase"))
          {
            v51[0] = v12;
            v51[1] = 3221225472;
            v51[2] = __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_16;
            v51[3] = &unk_24DC1B188;
            v52 = v37;
            objc_msgSend(v19, "enumerateChildNodesUsingBlock:", v51);
            v22 = &v52;
          }
          else
          {
            if ((objc_msgSend(v6, "isSummaryDialogPhase") & 1) != 0)
              goto LABEL_23;
            v49[0] = v12;
            v49[1] = 3221225472;
            v49[2] = __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_2_17;
            v49[3] = &unk_24DC1B188;
            v50 = v35;
            objc_msgSend(v19, "enumerateChildNodesWithOptions:usingBlock:", 2, v49);
            v22 = v34;
          }

        }
LABEL_23:
        if ((objc_msgSend(v21, "containsObject:", &unk_24DC26488) & 1) != 0
          || objc_msgSend(v21, "containsObject:", &unk_24DC264A0))
        {
          v47[0] = v12;
          v47[1] = 3221225472;
          v47[2] = __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_3;
          v47[3] = &unk_24DC1B188;
          v48 = v37;
          objc_msgSend(v19, "enumerateChildNodesUsingBlock:", v47);

        }
        v42[0] = v12;
        v42[1] = 3221225472;
        v42[2] = __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_4;
        v42[3] = &unk_24DC1B1B0;
        v42[4] = v13;
        v42[5] = v19;
        v43 = v6;
        v46 = v9;
        v10 = v39;
        v44 = v39;
        v45 = v40;
        objc_msgSend(v20, "enumerateObjectsUsingBlock:", v42);

        ++v18;
      }
      while (v16 != v18);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      v16 = v23;
    }
    while (v23);
  }

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[SRUIFTreeNode absoluteIndexPathsForTreeNodes:](SRUIFTreeNode, "absoluteIndexPathsForTreeNodes:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = 0;
  }
  if (objc_msgSend(v40, "count"))
  {
    objc_msgSend(v40, "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[SRUIFTreeNode absoluteIndexPathsForTreeNodes:](SRUIFTreeNode, "absoluteIndexPathsForTreeNodes:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }
  if (objc_msgSend(v35, "count"))
  {
    objc_msgSend(v35, "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRUIFConversation _changePresentationStateForNodes:](v13, "_changePresentationStateForNodes:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = 0;
  }
  -[SRUIFConversation notifyDelegateOfUpdates:inserts:presentationChanges:](v13, "notifyDelegateOfUpdates:inserts:presentationChanges:", v25, v27, v29);
  if (objc_msgSend(v37, "count"))
  {
    objc_msgSend(v37, "array");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRUIFConversation _removeNodes:](v13, "_removeNodes:", v30);

  }
  v31 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v32 = v31;
    -[SRUIFConversation _rootNode](v13, "_rootNode");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v61 = "-[SRUIFConversation _processInsertions:inDialogPhase:]";
    v62 = 2112;
    v63 = v33;
    _os_log_impl(&dword_219F26000, v32, OS_LOG_TYPE_DEFAULT, "%s rootNode=%@", buf, 0x16u);

  }
}

void __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "indexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "indexPathByRemovingLastIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_nodeAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v8);

}

uint64_t __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a2, "conversationItemType"));
}

void __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_16(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "presentationState") == 2)
  {
    objc_msgSend(v3, "aceObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "af_isUtterance");

    if ((v5 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }

}

void __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_2_17(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dialogPhase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isConfirmationDialogPhase") & 1) != 0)
  {
    objc_msgSend(v6, "aceObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      if (objc_msgSend(v6, "presentationState") == 2)
      {
        objc_msgSend(v6, "setPresentationState:", 3);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
      }
      *a4 = 1;
    }
  }
  else
  {

  }
}

void __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isTransient"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __54__SRUIFConversation__processInsertions_inDialogPhase___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  SRUIFTreeNode *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  SRUIFMutableConversationItem *v18;
  uint64_t v19;
  SRUIFDataStore *v20;
  char v21;
  SRUIFDataStore *v22;
  SRUIFMutableConversationItem *v23;
  uint64_t v24;
  SRUIFMutableConversationItem *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  SRUIFDataStore *v29;
  uint64_t v30;
  void *v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  SRUIFTreeNode *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "indexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aceObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "conversationItemType");
  objc_msgSend(v3, "aceCommandIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "isTransient");
  v9 = objc_msgSend(v3, "isSupplemental");
  v10 = objc_msgSend(v3, "isImmersiveExperience");

  objc_msgSend(*(id *)(a1 + 32), "_childOfNode:withItemWhichCanBeUpdatedWithAceObject:inDialogPhase:", *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[SRUIFConversation _processInsertions:inDialogPhase:]_block_invoke_4";
    v34 = 2112;
    v35 = v5;
    _os_log_impl(&dword_219F26000, v12, OS_LOG_TYPE_INFO, "%s ACE object: %@", buf, 0x16u);
  }
  if (v11)
  {
    objc_msgSend(v11, "item");
    v13 = (SRUIFTreeNode *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      v33 = "-[SRUIFConversation _processInsertions:inDialogPhase:]_block_invoke";
      v34 = 2112;
      v35 = v15;
      v36 = 2112;
      v37 = v13;
      v38 = 2112;
      v39 = v4;
      _os_log_impl(&dword_219F26000, v14, OS_LOG_TYPE_DEFAULT, "%s %@: updating item %@ at %@ from ACE object.", buf, 0x2Au);
    }
    -[SRUIFTreeNode setAceObject:](v13, "setAceObject:", v5);
    -[SRUIFTreeNode setDialogPhase:](v13, "setDialogPhase:", *(_QWORD *)(a1 + 48));
    -[SRUIFTreeNode setPresentationState:](v13, "setPresentationState:", *(_QWORD *)(a1 + 72));
    -[SRUIFTreeNode setAceCommandIdentifier:](v13, "setAceCommandIdentifier:", v7);
    -[SRUIFTreeNode setTransient:](v13, "setTransient:", v8);
    -[SRUIFTreeNode setSupplemental:](v13, "setSupplemental:", v9);
    -[SRUIFTreeNode setImmersiveExperience:](v13, "setImmersiveExperience:", v10);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
  }
  else
  {
    v13 = objc_alloc_init(SRUIFTreeNode);
    objc_msgSend(*(id *)(a1 + 40), "addChildNode:", v13);
    v16 = v5;
    v17 = v4;
    v18 = [SRUIFMutableConversationItem alloc];
    v30 = *(_QWORD *)(a1 + 48);
    v31 = v7;
    v19 = *(_QWORD *)(a1 + 72);
    v20 = objc_alloc_init(SRUIFDataStore);
    v21 = v9;
    v22 = v20;
    v29 = v20;
    BYTE2(v28) = v10;
    BYTE1(v28) = v21;
    LOBYTE(v28) = v8;
    v23 = v18;
    v4 = v17;
    v5 = v16;
    v24 = v19;
    v7 = v31;
    v25 = -[SRUIFMutableConversationItem initWithType:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:](v23, "initWithType:aceObject:dialogPhase:presentationState:aceCommandIdentifier:virgin:transient:supplemental:immersiveExperience:associatedDataStore:", v6, v16, v30, v24, v31, 1, v28, v29);

    -[SRUIFTreeNode setItem:](v13, "setItem:", v25);
    v26 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 136315906;
      v33 = "-[SRUIFConversation _processInsertions:inDialogPhase:]_block_invoke";
      v34 = 2112;
      v35 = v27;
      v36 = 2112;
      v37 = (SRUIFTreeNode *)v25;
      v38 = 2112;
      v39 = v4;
      _os_log_impl(&dword_219F26000, v26, OS_LOG_TYPE_DEFAULT, "%s %@: adding new item %@ at %@ for ACE object.", buf, 0x2Au);
    }
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v13);

    v11 = 0;
  }

}

- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 atIndexPaths:(id)a6 isSupplemental:(BOOL)a7 isImmersiveExperience:(BOOL)a8
{
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  BOOL v27;
  BOOL v28;

  v14 = a5;
  v15 = a6;
  v16 = (void *)MEMORY[0x24BDBCEB8];
  v17 = a4;
  v18 = a3;
  objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v18, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __134__SRUIFConversation__addItemsForAceViews_withDialogPhase_fromCommandWithIdentifier_atIndexPaths_isSupplemental_isImmersiveExperience___block_invoke;
  v23[3] = &unk_24DC1B1D8;
  v24 = v15;
  v25 = v19;
  v26 = v14;
  v27 = a7;
  v28 = a8;
  v20 = v14;
  v21 = v19;
  v22 = v15;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", v23);

  -[SRUIFConversation _processInsertions:inDialogPhase:](self, "_processInsertions:inDialogPhase:", v21, v17);
}

void __134__SRUIFConversation__addItemsForAceViews_withDialogPhase_fromCommandWithIdentifier_atIndexPaths_isSupplemental_isImmersiveExperience___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  SRUIFConversationInsertion *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 40);
  v8 = -[SRUIFConversationInsertion initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:indexPath:]([SRUIFConversationInsertion alloc], "initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:indexPath:", 3, v6, *(_QWORD *)(a1 + 48), objc_msgSend(v6, "isTransient"), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), v9);

  objc_msgSend(v7, "addObject:", v8);
}

- (id)_indexPathsForAddingItemsWithCount:(int64_t)a3 asChildrenOfItemWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  void *v12;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFConversation indexPathForItemWithIdentifier:](self, "indexPathForItemWithIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SRUIFConversation numberOfChildrenForItemAtIndexPath:](self, "numberOfChildrenForItemAtIndexPath:", v8);
  if (a3 >= 1)
  {
    v10 = v9;
    v11 = v9 + a3;
    do
    {
      objc_msgSend(v8, "indexPathByAddingIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v12);

      ++v10;
    }
    while (v10 < v11);
  }

  return v7;
}

- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 atIndexPaths:(id)a6
{
  -[SRUIFConversation _addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:atIndexPaths:isSupplemental:isImmersiveExperience:](self, "_addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:atIndexPaths:isSupplemental:isImmersiveExperience:", a3, a4, a5, a6, 0, 0);
}

- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 asChildrenOfItemWithIdentifier:(id)a6 isSupplemental:(BOOL)a7 isImmersiveExperience:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v8 = a8;
  v9 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[SRUIFConversation _indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:](self, "_indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:", objc_msgSend(v17, "count"), v14);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[SRUIFConversation _addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:atIndexPaths:isSupplemental:isImmersiveExperience:](self, "_addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:atIndexPaths:isSupplemental:isImmersiveExperience:", v17, v16, v15, v18, v9, v8);
}

- (void)_addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 fromCommandWithIdentifier:(id)a5 asChildrenOfItemWithIdentifier:(id)a6
{
  -[SRUIFConversation _addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:asChildrenOfItemWithIdentifier:isSupplemental:isImmersiveExperience:](self, "_addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:asChildrenOfItemWithIdentifier:isSupplemental:isImmersiveExperience:", a3, a4, a5, a6, 0, 0);
}

- (void)insertItemsForAceViews:(id)a3 withDialogPhase:(id)a4 atIndexPaths:(id)a5
{
  -[SRUIFConversation _addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:atIndexPaths:](self, "_addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:atIndexPaths:", a3, a4, 0, a5);
}

- (void)addItemsForAceViews:(id)a3 withDialogPhase:(id)a4 asChildrenOfItemWithIdentifier:(id)a5
{
  -[SRUIFConversation _addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:asChildrenOfItemWithIdentifier:](self, "_addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:asChildrenOfItemWithIdentifier:", a3, a4, 0, a5);
}

- (void)addItemsForAddViewsCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "dialogPhase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SRUIFDialogPhase dialogPhaseForAceDialogPhase:](SRUIFDialogPhase, "dialogPhaseForAceDialogPhase:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "views");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aceId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "supplemental");
  v9 = objc_msgSend(v4, "immersiveExperience");

  -[SRUIFConversation _addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:asChildrenOfItemWithIdentifier:isSupplemental:isImmersiveExperience:](self, "_addItemsForAceViews:withDialogPhase:fromCommandWithIdentifier:asChildrenOfItemWithIdentifier:isSupplemental:isImmersiveExperience:", v6, v10, v7, 0, v8, v9);
}

- (void)_addItemsForAceObjects:(id)a3 type:(int64_t)a4 aceCommandIdentifier:(id)a5 dialogPhase:(id)a6 asChildrenOfItemWithIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  int64_t v23;

  v12 = a5;
  v13 = a7;
  v14 = a6;
  v15 = a3;
  -[SRUIFConversation _indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:](self, "_indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:", objc_msgSend(v15, "count"), v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __113__SRUIFConversation__addItemsForAceObjects_type_aceCommandIdentifier_dialogPhase_asChildrenOfItemWithIdentifier___block_invoke;
  v20[3] = &unk_24DC1B200;
  v22 = v12;
  v23 = a4;
  v21 = v16;
  v17 = v12;
  v18 = v16;
  objc_msgSend(v15, "sruif_arrayByMappingWithBlock:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[SRUIFConversation _processInsertions:inDialogPhase:](self, "_processInsertions:inDialogPhase:", v19, v14);
}

SRUIFConversationInsertion *__113__SRUIFConversation__addItemsForAceObjects_type_aceCommandIdentifier_dialogPhase_asChildrenOfItemWithIdentifier___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  SRUIFConversationInsertion *v8;

  v5 = (void *)a1[4];
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SRUIFConversationInsertion initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:indexPath:]([SRUIFConversationInsertion alloc], "initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:indexPath:", a1[6], v6, a1[5], 0, 0, 0, v7);

  return v8;
}

- (void)addItemsForAceObjects:(id)a3 type:(int64_t)a4 dialogPhase:(id)a5 asChildrenOfItemWithIdentifier:(id)a6
{
  -[SRUIFConversation _addItemsForAceObjects:type:aceCommandIdentifier:dialogPhase:asChildrenOfItemWithIdentifier:](self, "_addItemsForAceObjects:type:aceCommandIdentifier:dialogPhase:asChildrenOfItemWithIdentifier:", a3, a4, 0, a5, a6);
}

- (void)addItemForSpeechRecognizedCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFConversation _rootNode](self, "_rootNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__SRUIFConversation_addItemForSpeechRecognizedCommand___block_invoke;
  v14[3] = &unk_24DC1B228;
  v8 = v6;
  v15 = v8;
  v9 = v4;
  v16 = v9;
  v10 = v5;
  v17 = v10;
  objc_msgSend(v7, "enumerateDescendentNodesUsingBlock:", v14);

  if (objc_msgSend(v10, "count"))
  {
    -[SRUIFConversation notifyDelegateOfUpdates:inserts:presentationChanges:](self, "notifyDelegateOfUpdates:inserts:presentationChanges:", v10, 0, 0);
  }
  else
  {
    v18[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "aceId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SRUIFDialogPhase userRequestDialogPhase](SRUIFDialogPhase, "userRequestDialogPhase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRUIFConversation _addItemsForAceObjects:type:aceCommandIdentifier:dialogPhase:asChildrenOfItemWithIdentifier:](self, "_addItemsForAceObjects:type:aceCommandIdentifier:dialogPhase:asChildrenOfItemWithIdentifier:", v11, 1, v12, v13, 0);

  }
}

void __55__SRUIFConversation_addItemForSpeechRecognizedCommand___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aceObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", a1[4]))
  {

    goto LABEL_5;
  }
  v6 = objc_msgSend(v3, "type");

  if (v6 == 2)
  {
    objc_msgSend(v3, "setAceObject:", a1[5]);
    objc_msgSend(v3, "setType:", 1);
    v7 = (void *)a1[6];
    objc_msgSend(v8, "absoluteIndexPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v4);
LABEL_5:

  }
}

- (void)addAdditionalSpeechInterpretation:(id)a3 refId:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *additionalInterpretationsForRefId;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    additionalInterpretationsForRefId = self->_additionalInterpretationsForRefId;
    if (!additionalInterpretationsForRefId)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v10 = self->_additionalInterpretationsForRefId;
      self->_additionalInterpretationsForRefId = v9;

      additionalInterpretationsForRefId = self->_additionalInterpretationsForRefId;
    }
    -[NSMutableDictionary objectForKey:](additionalInterpretationsForRefId, "objectForKey:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[NSMutableDictionary setValue:forKey:](self->_additionalInterpretationsForRefId, "setValue:forKey:", v11, v7);
    }
    objc_msgSend(v11, "addObject:", v6);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRUIFConversation _rootNode](self, "_rootNode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __61__SRUIFConversation_addAdditionalSpeechInterpretation_refId___block_invoke;
    v19 = &unk_24DC1B250;
    v20 = v7;
    v14 = v12;
    v21 = v14;
    objc_msgSend(v13, "enumerateDescendentNodesUsingBlock:", &v16);

    if (objc_msgSend(v14, "count", v16, v17, v18, v19))
      -[SRUIFConversation notifyDelegateOfUpdates:inserts:presentationChanges:](self, "notifyDelegateOfUpdates:inserts:presentationChanges:", v14, 0, 0);

  }
  else
  {
    v15 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFConversation addAdditionalSpeechInterpretation:refId:].cold.1(v15);
  }

}

void __61__SRUIFConversation_addAdditionalSpeechInterpretation_refId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aceObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v9, "absoluteIndexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
}

- (id)additionalSpeechInterpretationsForRefId:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_additionalInterpretationsForRefId, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)addRecognitionUpdateWithPhrases:(id)a3 utterances:(id)a4 refId:(id)a5
{
  id v8;
  id v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *updatedUserUtteranceForRefId;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  if (!self->_updatedUserUtteranceForRefId)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    updatedUserUtteranceForRefId = self->_updatedUserUtteranceForRefId;
    self->_updatedUserUtteranceForRefId = v10;

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE09390]), "initWithPhrases:utterances:", v13, v8);
  -[NSMutableDictionary setObject:forKey:](self->_updatedUserUtteranceForRefId, "setObject:forKey:", v12, v9);

}

- (id)updatedUserUtteranceForRefId:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_updatedUserUtteranceForRefId, "objectForKey:", a3);
}

- (void)addItemForPartialResultCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFConversation _rootNode](self, "_rootNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __52__SRUIFConversation_addItemForPartialResultCommand___block_invoke;
  v14[3] = &unk_24DC1B228;
  v8 = v6;
  v15 = v8;
  v9 = v4;
  v16 = v9;
  v10 = v5;
  v17 = v10;
  objc_msgSend(v7, "enumerateDescendentNodesUsingBlock:", v14);

  if (objc_msgSend(v10, "count"))
  {
    -[SRUIFConversation notifyDelegateOfUpdates:inserts:presentationChanges:](self, "notifyDelegateOfUpdates:inserts:presentationChanges:", v10, 0, 0);
  }
  else
  {
    v18[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "aceId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SRUIFDialogPhase userRequestDialogPhase](SRUIFDialogPhase, "userRequestDialogPhase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRUIFConversation _addItemsForAceObjects:type:aceCommandIdentifier:dialogPhase:asChildrenOfItemWithIdentifier:](self, "_addItemsForAceObjects:type:aceCommandIdentifier:dialogPhase:asChildrenOfItemWithIdentifier:", v11, 2, v12, v13, 0);

  }
}

void __52__SRUIFConversation_addItemForPartialResultCommand___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 2)
  {
    objc_msgSend(v3, "aceObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "refId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", a1[4]);

    if (v6)
    {
      objc_msgSend(v3, "setAceObject:", a1[5]);
      v7 = (void *)a1[6];
      objc_msgSend(v9, "absoluteIndexPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

    }
  }

}

- (void)addItemsForShowHelpCommand:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  SRUIFConversationInsertion *v11;
  void *v12;
  SRUIFConversationInsertion *v13;
  SRUIFConversationInsertion *v14;
  void *v15;
  void *v16;
  SRUIFConversationInsertion *v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFConversation _indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:](self, "_indexPathsForAddingItemsWithCount:asChildrenOfItemWithIdentifier:", 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v19, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BE81870]);
    objc_msgSend(v8, "setText:", v7);
    objc_msgSend(v19, "speakableText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSpeakableText:", v9);

    objc_msgSend(v6, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectAtIndex:", 0);
    v11 = [SRUIFConversationInsertion alloc];
    objc_msgSend(v19, "aceId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SRUIFConversationInsertion initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:indexPath:](v11, "initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:indexPath:", 3, v8, v12, 0, 0, 0, v10);
    objc_msgSend(v4, "addObject:", v13);

  }
  v14 = [SRUIFConversationInsertion alloc];
  objc_msgSend(v19, "aceId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SRUIFConversationInsertion initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:indexPath:](v14, "initWithConversationItemType:aceObject:aceCommandIdentifier:transient:supplemental:immersiveExperience:indexPath:", 4, v19, v15, 0, 0, 0, v16);
  objc_msgSend(v4, "addObject:", v17);

  +[SRUIFDialogPhase completionDialogPhase](SRUIFDialogPhase, "completionDialogPhase");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFConversation _processInsertions:inDialogPhase:](self, "_processInsertions:inDialogPhase:", v4, v18);

}

- (void)addItemForMusicStartSessionCommand:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aceId", v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SRUIFDialogPhase reflectionDialogPhase](SRUIFDialogPhase, "reflectionDialogPhase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SRUIFConversation _addItemsForAceObjects:type:aceCommandIdentifier:dialogPhase:asChildrenOfItemWithIdentifier:](self, "_addItemsForAceObjects:type:aceCommandIdentifier:dialogPhase:asChildrenOfItemWithIdentifier:", v6, 5, v7, v8, 0);
}

- (void)addSelectionResponse:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SRUIFDialogPhase userRequestDialogPhase](SRUIFDialogPhase, "userRequestDialogPhase", v8, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SRUIFConversation addItemsForAceViews:withDialogPhase:asChildrenOfItemWithIdentifier:](self, "addItemsForAceViews:withDialogPhase:asChildrenOfItemWithIdentifier:", v6, v7, 0);
}

- (void)updateWithUpdateViewsCommand:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id obj;
  _QWORD v15[5];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v4;
  objc_msgSend(v4, "views");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        -[SRUIFConversation _rootNode](self, "_rootNode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v9;
        v15[1] = 3221225472;
        v15[2] = __50__SRUIFConversation_updateWithUpdateViewsCommand___block_invoke;
        v15[3] = &unk_24DC1B250;
        v15[4] = v11;
        v16 = v5;
        objc_msgSend(v12, "enumerateDescendentNodesUsingBlock:", v15);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  -[SRUIFConversation notifyDelegateOfUpdates:inserts:presentationChanges:](self, "notifyDelegateOfUpdates:inserts:presentationChanges:", v5, 0, 0);
}

void __50__SRUIFConversation_updateWithUpdateViewsCommand___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 3)
  {
    objc_msgSend(v3, "aceObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "viewId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

    if (v7)
    {
      objc_msgSend(v3, "setAceObject:", *(_QWORD *)(a1 + 32));
      v8 = *(void **)(a1 + 40);
      objc_msgSend(v10, "absoluteIndexPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
  }

}

- (void)removeItemsWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[SRUIFConversation indexPathForItemWithIdentifier:](self, "indexPathForItemWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[SRUIFConversation removeItemsAtIndexPaths:](self, "removeItemsAtIndexPaths:", v5);
}

- (void)removeItemsAtIndexPaths:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[SRUIFConversation _nodeAtIndexPath:](self, "_nodeAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[SRUIFConversation _removeNodes:](self, "_removeNodes:", v5);
}

- (void)removeItemsFollowingItemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = objc_msgSend(v4, "indexAtPosition:", objc_msgSend(v4, "length") - 1);
    objc_msgSend(v4, "indexPathByRemovingLastIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRUIFConversation _nodeAtIndexPath:](self, "_nodeAtIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __57__SRUIFConversation_removeItemsFollowingItemAtIndexPath___block_invoke;
    v13 = &unk_24DC1B278;
    v14 = v5;
    v15 = v6;
    v9 = v5;
    objc_msgSend(v8, "enumerateChildNodesWithOptions:usingBlock:", 2, &v10);
    -[SRUIFConversation _removeNodes:](self, "_removeNodes:", v9, v10, v11, v12, v13);

  }
}

uint64_t __57__SRUIFConversation_removeItemsFollowingItemAtIndexPath___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (*(_QWORD *)(result + 40) < a3)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  *a4 = 1;
  return result;
}

- (void)removeTransientItems
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFConversation _rootNode](self, "_rootNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__SRUIFConversation_removeTransientItems__block_invoke;
  v6[3] = &unk_24DC1B2A0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateDescendentNodesUsingBlock:", v6);

  -[SRUIFConversation _removeNodes:](self, "_removeNodes:", v5);
}

void __41__SRUIFConversation_removeTransientItems__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isTransient"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (void)cancelItemWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[SRUIFConversation _indexPathForItemWithIdentifier:ignoreNonExistent:](self, "_indexPathForItemWithIdentifier:ignoreNonExistent:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "presentationState") != 3)
  {
    objc_msgSend(v5, "setPresentationState:", 3);
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRUIFConversation notifyDelegateOfUpdates:inserts:presentationChanges:](self, "notifyDelegateOfUpdates:inserts:presentationChanges:", 0, 0, v6);

  }
}

- (BOOL)containsItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[SRUIFConversation _rootNode](self, "_rootNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__SRUIFConversation_containsItemWithIdentifier___block_invoke;
  v8[3] = &unk_24DC1B2C8;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "enumerateDescendentNodesUsingBlock:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __48__SRUIFConversation_containsItemWithIdentifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a2, "item");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }

}

- (id)identifierOfItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[SRUIFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)indexPathForItemWithIdentifier:(id)a3
{
  return -[SRUIFConversation _indexPathForItemWithIdentifier:ignoreNonExistent:](self, "_indexPathForItemWithIdentifier:ignoreNonExistent:", a3, 0);
}

- (id)_indexPathForItemWithIdentifier:(id)a3 ignoreNonExistent:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  if (v5)
  {
    -[SRUIFConversation _rootNode](self, "_rootNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __71__SRUIFConversation__indexPathForItemWithIdentifier_ignoreNonExistent___block_invoke;
    v11[3] = &unk_24DC1B2C8;
    v12 = v5;
    v13 = &v14;
    objc_msgSend(v6, "enumerateDescendentNodesUsingBlock:", v11);

    v7 = v12;
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BDD15D8]);
    v7 = (void *)v15[5];
    v15[5] = (uint64_t)v8;
  }

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v9;
}

void __71__SRUIFConversation__indexPathForItemWithIdentifier_ignoreNonExistent___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isEqual:", v7);

  if ((_DWORD)v6)
  {
    objc_msgSend(v11, "absoluteIndexPath");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a3 = 1;
  }

}

- (BOOL)hasItemWithIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[SRUIFConversation _indexPathForItemWithIdentifier:ignoreNonExistent:](self, "_indexPathForItemWithIdentifier:ignoreNonExistent:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)itemWithIdentifier:(id)a3
{
  void *v4;
  void *v5;

  -[SRUIFConversation indexPathForItemWithIdentifier:](self, "indexPathForItemWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFConversation itemAtIndexPath:](self, "itemAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)parentOfItemWithIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SRUIFConversation indexPathForItemWithIdentifier:](self, "indexPathForItemWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathByRemovingLastIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)itemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[SRUIFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)lastItem
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDD15D8]);
  v4 = -[SRUIFConversation numberOfChildrenForItemAtIndexPath:](self, "numberOfChildrenForItemAtIndexPath:", v3);

  if (v4 < 1)
  {
    v6 = 0;
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15D8]), "initWithIndex:", v4 - 1);
    -[SRUIFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (int64_t)typeForItemAtIndexPath:(id)a3
{
  void *v3;
  int64_t v4;

  -[SRUIFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  return v4;
}

- (id)dialogPhaseForItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[SRUIFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dialogPhase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)aceObjectForItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[SRUIFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aceObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)presentationStateForItemAtIndexPath:(id)a3
{
  void *v3;
  int64_t v4;

  -[SRUIFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presentationState");

  return v4;
}

- (int64_t)numberOfChildrenForItemWithIdentifier:(id)a3
{
  void *v4;
  int64_t v5;

  -[SRUIFConversation indexPathForItemWithIdentifier:](self, "indexPathForItemWithIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SRUIFConversation numberOfChildrenForItemAtIndexPath:](self, "numberOfChildrenForItemAtIndexPath:", v4);

  return v5;
}

- (int64_t)numberOfChildrenForItemAtIndexPath:(id)a3
{
  void *v3;
  int64_t v4;

  -[SRUIFConversation _nodeAtIndexPath:](self, "_nodeAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfChildNodes");

  return v4;
}

- (id)aceCommandIdentifierForItemAtIndexPath:(id)a3
{
  void *v3;
  void *v4;

  -[SRUIFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aceCommandIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)itemAtIndexPathIsVirgin:(id)a3
{
  void *v3;
  char v4;

  -[SRUIFConversation _itemAtIndexPath:](self, "_itemAtIndexPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isVirgin");

  return v4;
}

- (id)itemsRelatedToIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDD15D8]);
  v7 = -[SRUIFConversation numberOfChildrenForItemAtIndexPath:](self, "numberOfChildrenForItemAtIndexPath:", v6);

  v18 = v4;
  -[SRUIFConversation itemWithIdentifier:](self, "itemWithIdentifier:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "aceObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "refId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SRUIFConversation itemAtIndexPath:](self, "itemAtIndexPath:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "aceObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "refId");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", v10);

      if (v16)
        objc_msgSend(v5, "addObject:", v13);

    }
  }

  return v5;
}

- (void)_enumerateItemsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SRUIFConversation _rootNode](self, "_rootNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__SRUIFConversation__enumerateItemsUsingBlock___block_invoke;
  v7[3] = &unk_24DC1B2F0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateDescendentNodesUsingBlock:", v7);

}

void __47__SRUIFConversation__enumerateItemsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "item");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);

}

- (BOOL)containsItemForAceViewWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__SRUIFConversation_containsItemForAceViewWithIdentifier___block_invoke;
  v7[3] = &unk_24DC1B318;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[SRUIFConversation _enumerateItemsUsingBlock:](self, "_enumerateItemsUsingBlock:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __58__SRUIFConversation_containsItemForAceViewWithIdentifier___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  v5 = objc_msgSend(v10, "type") == 3;
  v6 = v10;
  if (v5)
  {
    objc_msgSend(v10, "aceObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v9)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }

    v6 = v10;
  }

}

- (BOOL)_nodeContainsProvisionalItems:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__SRUIFConversation__nodeContainsProvisionalItems___block_invoke;
  v6[3] = &unk_24DC1B340;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateChildNodesWithOptions:usingBlock:", 2, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __51__SRUIFConversation__nodeContainsProvisionalItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  objc_msgSend(a2, "item");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "presentationState") == 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (id)_changePresentationStateForNodes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "parentNode", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "absoluteIndexPath");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  return v4;
}

- (id)propertyListRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SRUIFTreeNodePropertyListSerialization *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", &unk_24DC264D0, CFSTR("Version"));
  -[SRUIFConversation identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("Identifier"));

  -[SRUIFConversation languageCode](self, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("LanguageCode"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SRUIFConversation isSynchronizedWithServer](self, "isSynchronizedWithServer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("SynchronizedWithServer"));

  v8 = objc_alloc_init(SRUIFTreeNodePropertyListSerialization);
  -[SRUIFConversation _rootNode](self, "_rootNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFTreeNodePropertyListSerialization propertyListWithTreeNode:itemPropertyListCreation:](v8, "propertyListWithTreeNode:itemPropertyListCreation:", v9, &__block_literal_global_43);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("RootNode"));
  return v3;
}

uint64_t __47__SRUIFConversation_propertyListRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "propertyListRepresentation");
}

- (SRUIFConversation)initWithPropertyListRepresentation:(id)a3
{
  id v4;
  SRUIFDictionarySchema *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SRUIFCoercion *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  SRUIFConversation *v23;
  void *v24;
  NSObject *v25;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(SRUIFDictionarySchema);
  +[SRUIFCoercion stringToUUIDCoercion](SRUIFCoercion, "stringToUUIDCoercion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v6, CFSTR("Identifier"));

  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v7, CFSTR("Version"));

  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v8, CFSTR("LanguageCode"));

  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v9, CFSTR("SynchronizedWithServer"));

  v10 = -[SRUIFCoercion initWithBlock:]([SRUIFCoercion alloc], "initWithBlock:", &__block_literal_global_48);
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v5, "setObjectCoercion:forKey:", v10, CFSTR("RootNode"));

  v27 = 0;
  -[SRUIFDictionarySchema coerceObject:error:](v5, "coerceObject:error:", v4, &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v27;
  if (!v11)
  {
    v24 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFConversation initWithPropertyListRepresentation:].cold.1(v24, v12, (uint64_t)v4);
    goto LABEL_10;
  }
  objc_msgSend(v11, "objectForKey:", CFSTR("Version"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");

  if (v14 != 1)
  {
    v25 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFConversation initWithPropertyListRepresentation:].cold.2(v14, v25);
LABEL_10:
    v23 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v11, "objectForKey:", CFSTR("Identifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("LanguageCode"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("SynchronizedWithServer"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  objc_msgSend(v11, "objectForKey:", CFSTR("RootNode"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[SRUIFConversation initWithIdentifier:languageCode:rootNode:](self, "initWithIdentifier:languageCode:rootNode:", v15, v16, v19);
  -[SRUIFConversation setSynchronizedWithServer:](self, "setSynchronizedWithServer:", v18);
  v20 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    -[SRUIFConversation _rootNode](self, "_rootNode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v29 = "-[SRUIFConversation initWithPropertyListRepresentation:]";
    v30 = 2112;
    v31 = v22;
    _os_log_impl(&dword_219F26000, v21, OS_LOG_TYPE_DEFAULT, "%s rootNode=%@", buf, 0x16u);

  }
  v23 = self;
LABEL_11:

  return v23;
}

id __56__SRUIFConversation_initWithPropertyListRepresentation___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  SRUIFTreeNodePropertyListSerialization *v5;
  void *v6;

  v4 = a2;
  v5 = objc_alloc_init(SRUIFTreeNodePropertyListSerialization);
  -[SRUIFTreeNodePropertyListSerialization treeNodeWithPropertyList:error:itemCreation:](v5, "treeNodeWithPropertyList:error:itemCreation:", v4, a3, &__block_literal_global_49);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

SRUIFMutableConversationItem *__56__SRUIFConversation_initWithPropertyListRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  SRUIFMutableConversationItem *v3;

  v2 = a2;
  v3 = -[SRUIFMutableConversationItem initWithPropertyListRepresentation:]([SRUIFMutableConversationItem alloc], "initWithPropertyListRepresentation:", v2);

  return v3;
}

- (void)notifyDelegateOfUpdates:(id)a3 inserts:(id)a4 presentationChanges:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  SRUIFConversationTransaction *v19;
  void *v20;
  char v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v23, "count"))
  {
    -[SRUIFConversation delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[SRUIFConversation delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "conversation:didUpdateItemsAtIndexPaths:", self, v23);

    }
  }
  if (objc_msgSend(v8, "count"))
  {
    -[SRUIFConversation delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      -[SRUIFConversation delegate](self, "delegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "conversation:didInsertItemsAtIndexPaths:", self, v8);

    }
  }
  if (objc_msgSend(v9, "count"))
  {
    -[SRUIFConversation delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[SRUIFConversation delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "conversation:presentationStateDidChangeForItemsAtIndexPaths:", self, v9);

    }
  }
  if (objc_msgSend(v23, "count") || objc_msgSend(v8, "count") || objc_msgSend(v9, "count"))
  {
    v19 = -[SRUIFConversationTransaction initWithUpdatedItemIndexPaths:insertedItemIndexPaths:presentationStateChangedItemIndexPaths:]([SRUIFConversationTransaction alloc], "initWithUpdatedItemIndexPaths:insertedItemIndexPaths:presentationStateChangedItemIndexPaths:", v23, v8, v9);
    -[SRUIFConversation delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      -[SRUIFConversation delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "conversation:didChangeWithTransaction:", self, v19);

    }
  }

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (BOOL)isSynchronizedWithServer
{
  return self->_synchronizedWithServer;
}

- (void)setSynchronizedWithServer:(BOOL)a3
{
  self->_synchronizedWithServer = a3;
}

- (SRUIFConversationDelegate)delegate
{
  return (SRUIFConversationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SRUIFTreeNode)_rootNode
{
  return self->_rootNode;
}

- (void)_setRootNode:(id)a3
{
  objc_storeStrong((id *)&self->_rootNode, a3);
}

- (SRUIFConversationStorable)lastRestoredItem
{
  return self->_lastRestoredItem;
}

- (void)_setLastRestoredItem:(id)a3
{
  objc_storeStrong((id *)&self->_lastRestoredItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRestoredItem, 0);
  objc_storeStrong((id *)&self->_rootNode, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_updatedUserUtteranceForRefId, 0);
  objc_storeStrong((id *)&self->_additionalInterpretationsForRefId, 0);
}

- (void)addAdditionalSpeechInterpretation:(os_log_t)log refId:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[SRUIFConversation addAdditionalSpeechInterpretation:refId:]";
  _os_log_error_impl(&dword_219F26000, log, OS_LOG_TYPE_ERROR, "%s Unable to add additional speech interpretation, invalid refId", (uint8_t *)&v1, 0xCu);
}

- (void)initWithPropertyListRepresentation:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "localizedFailureReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[SRUIFConversation initWithPropertyListRepresentation:]";
  v9 = 2112;
  v10 = v6;
  v11 = 2114;
  v12 = a3;
  _os_log_error_impl(&dword_219F26000, v5, OS_LOG_TYPE_ERROR, "%s passed invalid property list (%@): %{public}@", (uint8_t *)&v7, 0x20u);

}

- (void)initWithPropertyListRepresentation:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[SRUIFConversation initWithPropertyListRepresentation:]";
  v4 = 2050;
  v5 = a1;
  _os_log_error_impl(&dword_219F26000, a2, OS_LOG_TYPE_ERROR, "%s Unable to create conversation from property list with version %{public}ld", (uint8_t *)&v2, 0x16u);
}

@end
