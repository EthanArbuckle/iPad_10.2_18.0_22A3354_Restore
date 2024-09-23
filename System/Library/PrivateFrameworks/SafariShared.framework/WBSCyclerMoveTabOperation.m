@implementation WBSCyclerMoveTabOperation

- (void)executeWithContext:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(id, void *);
  unint64_t v26;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCyclerMoveTabOperation _randomTabGroupInContext:requireTabs:notIntersecting:](self, "_randomTabGroupInContext:requireTabs:notIntersecting:", v6, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCyclerMoveTabOperation _randomTabGroupInContext:requireTabs:notIntersecting:](self, "_randomTabGroupInContext:requireTabs:notIntersecting:", v6, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (v12)
  {
    objc_msgSend(v6, "topLevelItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v13);

  }
  else
  {
    objc_msgSend(v9, "randomTabDescendant");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = +[WBSCyclerRandomnessUtilities randomIntegerWithUpperBound:](WBSCyclerRandomnessUtilities, "randomIntegerWithUpperBound:", objc_msgSend(v11, "numberOfTabs") + 1);
    objc_msgSend(v6, "testTarget");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __66__WBSCyclerMoveTabOperation_executeWithContext_completionHandler___block_invoke;
    v20[3] = &unk_1E4B387E8;
    v25 = v7;
    v21 = v6;
    v22 = v9;
    v23 = v11;
    v24 = v14;
    v26 = v15;
    v19 = v14;
    objc_msgSend(v16, "moveBookmarkWithIdentifier:intoListWithIdentifier:atIndex:reply:", v17, v18, v15, v20);

  }
}

void __66__WBSCyclerMoveTabOperation_executeWithContext_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WBSCyclerBookmarkLeafRepresentation *v10;
  void *v11;
  void *v12;
  WBSCyclerBookmarkLeafRepresentation *v13;
  uint64_t v14;
  id v15;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v3, "copy");

    objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "descendantWithUniqueIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "descendantWithUniqueIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "descendantWithUniqueIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "deleteChild:", v9);
    if (objc_msgSend(v5, "numberOfChildren") == 1)
    {
      v10 = [WBSCyclerBookmarkLeafRepresentation alloc];
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[WBSCyclerBookmarkLeafRepresentation initWithURL:title:uniqueIdentifier:](v10, "initWithURL:title:uniqueIdentifier:", 0, CFSTR("Start Page"), v12);

      objc_msgSend(v5, "insertChild:atIndex:", v13, 1);
    }
    objc_msgSend(v7, "insertChild:atIndex:", v9, *(_QWORD *)(a1 + 72) + 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    v14 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v15);
  }

}

- (id)_randomTabGroupInContext:(id)a3 requireTabs:(BOOL)a4 notIntersecting:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  BOOL v17;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "topLevelItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__WBSCyclerMoveTabOperation__randomTabGroupInContext_requireTabs_notIntersecting___block_invoke;
  v14[3] = &unk_1E4B38930;
  v17 = a4;
  v15 = v7;
  v16 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v11, "randomDescendantOfList:enforcingTitlePrefixValidity:passingTest:", v9, 1, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __82__WBSCyclerMoveTabOperation__randomTabGroupInContext_requireTabs_notIntersecting___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = v4;
    if (*(_BYTE *)(a1 + 48) && !objc_msgSend(v4, "numberOfTabs"))
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "topLevelItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v5)
        v7 = 0;
      else
        v7 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v5) ^ 1;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
