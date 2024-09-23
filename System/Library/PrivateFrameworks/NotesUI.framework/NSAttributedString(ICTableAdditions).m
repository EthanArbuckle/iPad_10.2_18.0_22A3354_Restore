@implementation NSAttributedString(ICTableAdditions)

- (uint64_t)ic_tableSizeForTextTable:()ICTableAdditions inRange:
{
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  uint64_t *v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;

  v8 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3010000000;
  v25 = 0;
  v26 = 0;
  v24 = "";
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3010000000;
  v20[4] = 0;
  v20[5] = 0;
  v20[3] = "";
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 1;
  v9 = *MEMORY[0x1E0DC1178];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__NSAttributedString_ICTableAdditions__ic_tableSizeForTextTable_inRange___block_invoke;
  v13[3] = &unk_1E5C24210;
  v10 = v8;
  v14 = v10;
  v15 = v18;
  v16 = &v21;
  v17 = v20;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v9, a4, a5, 0, v13);
  v11 = v22[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v21, 8);

  return v11;
}

- (uint64_t)ic_numRowsForTextTable:()ICTableAdditions outNumColumns:
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v26 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v28 = objc_msgSend(a1, "length");
  if (v28)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v27 = *MEMORY[0x1E0DC1178];
    while (1)
    {
      v36 = 0;
      v37 = 0;
      objc_msgSend(a1, "attribute:atIndex:effectiveRange:", v27, v8, &v36, v26);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textBlocks");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
        break;
      v8 = v37 + v36;
      if (v6 <= 1)
        v6 = 1;
      ++v7;
LABEL_22:

      if (v8 >= v28)
        goto LABEL_25;
    }
    v30 = v10;
    v31 = v9;
    objc_msgSend(v10, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "table");
    v12 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)v12;
    v13 = objc_msgSend(a1, "rangeOfTextTable:atIndex:", v12, v36);
    v15 = v14;
    objc_msgSend(a1, "ic_textTablesInRange:", v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (!v17)
      goto LABEL_18;
    v18 = v17;
    v19 = *(_QWORD *)v33;
LABEL_6:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v19)
        objc_enumerationMutation(v16);
      v21 = *(id *)(*((_QWORD *)&v32 + 1) + 8 * v20);
      if (!v5)
        break;
      if (v21 == v5)
      {
        v22 = a1;
        v21 = v5;
LABEL_13:
        v23 = objc_msgSend(v22, "ic_tableSizeForTextTable:inRange:", v21, v13, v15);
        if (v6 <= v23)
          v6 = v23;
        v7 += v24;
      }
      if (v18 == ++v20)
      {
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        if (!v18)
        {
LABEL_18:
          v8 = v13 + v15;

          v10 = v30;
          v9 = v31;
          goto LABEL_22;
        }
        goto LABEL_6;
      }
    }
    v22 = a1;
    goto LABEL_13;
  }
  v7 = 0;
  v6 = 0;
LABEL_25:
  if (v26)
    *v26 = v6;

  return v7;
}

- (id)ic_nextTableStringFromIndex:()ICTableAdditions tableRange:
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  unint64_t v19;
  id v22;

  v6 = objc_msgSend(a1, "length");
  v7 = *MEMORY[0x1E0DC1178];
  while (a3 < v6)
  {
    objc_msgSend(a1, "attribute:atIndex:effectiveRange:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textBlocks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "table");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(a1, "rangeOfTextTable:atIndex:", v11, a3);
      v14 = v13;
      objc_msgSend(a1, "attributedSubstringFromRange:", v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = 3;
      }
      else
      {
        if (a4)
        {
          *a4 = v12;
          a4[1] = v14;
        }
        v22 = v15;
        v17 = 1;
      }

    }
    else
    {
      v17 = 0;
    }

    if (v17)
    {
      if (v17 != 3)
      {
        v18 = v22;
        return v18;
      }
      break;
    }
  }
  v18 = 0;
  if (a4)
  {
    v19 = v6 - a3;
    if (v6 < a3)
      v19 = 0;
    *a4 = a3;
    a4[1] = v19;
  }
  return v18;
}

- (uint64_t)ic_rangeofNextTableFromIndex:()ICTableAdditions
{
  unint64_t v3;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v14;
  uint64_t v15;

  v3 = a3;
  v14 = a3;
  v15 = 0;
  v5 = objc_msgSend(a1, "length");
  if (v5 <= v3)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = v5;
  v7 = *MEMORY[0x1E0DC1178];
  while (1)
  {
    objc_msgSend(a1, "attribute:atIndex:effectiveRange:", v7, v3, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textBlocks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
      break;

    v3 = v15 + v14;
    if (v15 + v14 >= v6)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_msgSend(v9, "objectAtIndex:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "table");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(a1, "rangeOfTextTable:atIndex:", v12, v14);
  return v10;
}

- (uint64_t)ic_numberOfTables
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  if (!objc_msgSend(a1, "length"))
    return 0;
  v2 = objc_msgSend(a1, "length");
  if (!v2)
    return 0;
  v3 = v2;
  v4 = 0;
  v5 = 0;
  do
  {
    v8 = 0;
    v9 = 0;
    objc_msgSend(a1, "ic_nextTableStringFromIndex:tableRange:", v5, &v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      ++v4;
    v5 = v9 + v8;

  }
  while (v5 < v3);
  return v4;
}

- (id)ic_textTablesInRange:()ICTableAdditions
{
  uint64_t v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__77;
  v17 = __Block_byref_object_dispose__77;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__77;
  v11[4] = __Block_byref_object_dispose__77;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DC1178];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__NSAttributedString_ICTableAdditions__ic_textTablesInRange___block_invoke;
  v10[3] = &unk_1E5C24238;
  v10[4] = v11;
  v10[5] = &v13;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v7, a3, a4, 0, v10);
  v8 = (id)v14[5];
  _Block_object_dispose(v11, 8);

  _Block_object_dispose(&v13, 8);
  return v8;
}

@end
