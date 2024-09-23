@implementation PSListController(PUIGroupReplace)

- (id)pui_replaceRows:()PUIGroupReplace withRows:header:insertPoint:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(a1, "specifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "containsObject:", v15);

    if ((v16 & 1) == 0)
      objc_msgSend(a1, "insertContiguousSpecifiers:afterSpecifier:", v12, v13);
    objc_msgSend(v12, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "table");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __81__PSListController_PUIGroupReplace__pui_replaceRows_withRows_header_insertPoint___block_invoke;
    v24 = &unk_1EA26B3C0;
    v25 = a1;
    v26 = v10;
    v19 = v11;
    v27 = v19;
    v28 = v17;
    objc_msgSend(v18, "performBatchUpdates:completion:", &v21, 0);

    objc_msgSend(v19, "lastObject", v21, v22, v23, v24, v25);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "removeContiguousSpecifiers:animated:", v10, 0);
    objc_msgSend(a1, "removeContiguousSpecifiers:animated:", v12, 0);
  }

  return v13;
}

@end
