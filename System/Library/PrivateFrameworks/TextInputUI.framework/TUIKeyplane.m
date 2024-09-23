@implementation TUIKeyplane

- (TUIKeyplane)init
{
  TUIKeyplane *v2;
  uint64_t v3;
  NSMutableDictionary *cache;
  uint64_t v5;
  NSMutableDictionary *doubleHeightKeys;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIKeyplane;
  v2 = -[TUIKeyplane init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;

    v2->_indexOfLastRow = -1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    doubleHeightKeys = v2->_doubleHeightKeys;
    v2->_doubleHeightKeys = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (void)updateKeyboardType:(int64_t)a3
{
  id v4;

  -[TUIKeyplane rowsForKeyboardType:](self, "rowsForKeyboardType:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplane setVariantKeysByRow:](self, "setVariantKeysByRow:", v4);

}

- (NSString)name
{
  void *v2;
  void *v3;

  -[TUIKeyplane fullTree](self, "fullTree");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)prefix
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[TUIKeyplane fullTree](self, "fullTree");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("_"));

  -[TUIKeyplane fullTree](self, "fullTree");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  -[TUIKeyplane fullTree](self, "fullTree");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5 >= v8)
  {
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Dynamic-"), &stru_1E24FC6C0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "substringToIndex:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Dynamic-"), &stru_1E24FC6C0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v13;
}

- (unint64_t)numberOfRows
{
  void *v2;
  unint64_t v3;

  -[TUIKeyplane orderedKeysByRow](self, "orderedKeysByRow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)numberOfKeys
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[TUIKeyplane orderedKeysByRow](self, "orderedKeysByRow", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "count");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)orderedKeysByRow
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[TUIKeyplane currentVariantType](self, "currentVariantType")
    && (-[TUIKeyplane variantKeysByRow](self, "variantKeysByRow"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count"),
        v3,
        v4))
  {
    -[TUIKeyplane variantKeysByRow](self, "variantKeysByRow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TUIKeyplane defaultKeysByRow](self, "defaultKeysByRow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v5;
}

- (BOOL)variantTypeIncludesSpaceBar:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[TUIKeyplane cache](self, "cache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = 1;

  return v7;
}

- (id)rowsForKeyboardType:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;

  if (a3)
  {
    -[TUIKeyplane keylayout](self, "keylayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[TUIKeyplane keylayout](self, "keylayout");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "orderedRowsForType:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "count"))
      {
        if (-[TUIKeyplane currentVariantType](self, "currentVariantType") != a3
          || (-[TUIKeyplane variantKeysByRow](self, "variantKeysByRow"),
              v9 = (void *)objc_claimAutoreleasedReturnValue(),
              v10 = objc_msgSend(v9, "count"),
              v9,
              !v10))
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v28 = v8;
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v8;
          if (objc_msgSend(v13, "count"))
          {
            v14 = 0;
            do
            {
              objc_msgSend(v13, "objectAtIndex:", v14, v28);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              -[TUIKeyplane keylayout](self, "keylayout");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "rowSet");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "subtrees");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "count");

              if (v14 >= v19)
                goto LABEL_14;
              -[TUIKeyplane keylayout](self, "keylayout");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "rowSet");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "subtrees");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectAtIndex:", v14);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v15, "isEqualToTree:", v23);

              if (v24)
              {
                -[TUIKeyplane defaultKeysByRow](self, "defaultKeysByRow");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "objectAtIndex:", v14);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "addObject:", v26);

              }
              else
              {
LABEL_14:
                -[TUIKeyplane keyRowFromTreeRow:rowNumber:type:](self, "keyRowFromTreeRow:rowNumber:type:", v15, v14, a3);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v25, "count"))
                  objc_msgSend(v30, "addObject:", v25);
              }

              ++v14;
            }
            while (v14 < objc_msgSend(v13, "count"));
          }
          -[TUIKeyplane setVariantKeysByRow:](self, "setVariantKeysByRow:", v30, v28);
          -[TUIKeyplane setCurrentVariantType:](self, "setCurrentVariantType:", a3);
          -[TUIKeyplane variantKeysByRow](self, "variantKeysByRow");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v8 = v29;
          goto LABEL_20;
        }
        -[TUIKeyplane variantKeysByRow](self, "variantKeysByRow");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[TUIKeyplane defaultKeysByRow](self, "defaultKeysByRow");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      v12 = (void *)v11;
LABEL_20:

      return v12;
    }
  }
  else
  {
    -[TUIKeyplane setCurrentVariantType:](self, "setCurrentVariantType:");
  }
  -[TUIKeyplane defaultKeysByRow](self, "defaultKeysByRow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  return v12;
}

- (id)defaultRowSet
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[TUIKeyplane keylayout](self, "keylayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subtreeWithType:", 15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[TUIKeyplane keylayout](self, "keylayout");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)rowSetForType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[TUIKeyplane stringFromKeyboardType:](self, "stringFromKeyboardType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[TUIKeyplane keylayout](self, "keylayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subtrees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "type") == 15)
        {
          objc_msgSend(v12, "name");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "containsString:", v6);

          if ((v14 & 1) != 0)
          {
            v9 = v12;
            goto LABEL_12;
          }
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_12:

  return v9;
}

- (id)defaultKeysOrderedByRowForKeyplane:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtreeWithType:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplane setKeylayout:](self, "setKeylayout:", v6);
  -[TUIKeyplane defaultRowSet](self, "defaultRowSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subtrees");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplane setIndexOfLastRow:](self, "setIndexOfLastRow:", objc_msgSend(v8, "count") - 1);
  if (objc_msgSend(v8, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKeyplane keyRowFromTreeRow:rowNumber:type:](self, "keyRowFromTreeRow:rowNumber:type:", v10, v9, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v11, v12);

      }
      ++v9;
    }
    while (v9 < objc_msgSend(v8, "count"));
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v13, "addObject:", v18);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeObjectForKey:", v19);

      }
      ++v16;

      objc_msgSend(v5, "allKeys");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

    }
    while (v21);
  }

  return v13;
}

- (id)keyRowFromTreeRow:(id)a3 rowNumber:(unint64_t)a4 type:(int64_t)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t k;
  void *v36;
  void *v37;
  int64_t v38;
  BOOL v39;
  TUIKeyplane *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t m;
  void *v60;
  void *v61;
  int64_t v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  uint64_t v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t n;
  void *v97;
  void *v98;
  int v99;
  BOOL v100;
  double v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v107;
  void *v108;
  id obj;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  TUIKeyplane *v118;
  id v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v124;
  int64_t v125;
  uint64_t v126;
  void *v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  uint64_t v153;

  v153 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "type") == 7 || objc_msgSend(v6, "type") == 4)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rowset.Row%li"), a4 + 1);
    v9 = objc_claimAutoreleasedReturnValue();
    v118 = self;
    -[TUIKeyplane keylayout](self, "keylayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "properties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = (void *)v9;
    objc_msgSend(v11, "objectForKey:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v112 = v12;
    if (v12)
    {
      v146 = 0u;
      v147 = 0u;
      v144 = 0u;
      v145 = 0u;
      objc_msgSend(v12, "allKeys");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v144, v152, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v145;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v145 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * i);
            objc_msgSend(v112, "objectForKey:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "setObject:forKey:", v19, v18);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v144, v152, 16);
        }
        while (v15);
      }

    }
    v20 = (void *)MEMORY[0x1E0CB3940];
    -[TUIKeyplane stringFromKeyboardType:](self, "stringFromKeyboardType:", a5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("Rowset.%@.Row%li"), v21, a4 + 1);
    v22 = objc_claimAutoreleasedReturnValue();

    -[TUIKeyplane keylayout](self, "keylayout");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "properties");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = (void *)v22;
    objc_msgSend(v24, "objectForKey:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v111 = v25;
    if (v25)
    {
      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      objc_msgSend(v25, "allKeys");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v140, v151, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v141;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v141 != v29)
              objc_enumerationMutation(v26);
            v31 = *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * j);
            objc_msgSend(v111, "objectForKey:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "setObject:forKey:", v32, v31);

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v140, v151, 16);
        }
        while (v28);
      }

      self = v118;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = 0u;
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    objc_msgSend(v6, "subtrees");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v113 = v33;
    v117 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v150, 16);
    if (v117)
    {
      v116 = 0;
      v34 = 0;
      v115 = *(_QWORD *)v137;
      while (1)
      {
        for (k = 0; k != v117; ++k)
        {
          if (*(_QWORD *)v137 != v115)
            objc_enumerationMutation(obj);
          v36 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * k);
          v124 = v36;
          if (objc_msgSend(v36, "type") == 8)
          {
            objc_msgSend(MEMORY[0x1E0DC3918], "shape");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setShape:", v37);

            objc_msgSend(v36, "setDisplayRowHint:", a4);
            v38 = +[TUIKey layoutTypeForKey:](TUIKey, "layoutTypeForKey:", v36);
            v39 = v38 == 4;
            v125 = v38;
            if (v38 == 3)
            {
              v40 = v118;
              -[TUIKeyplane doubleHeightKeys](v118, "doubleHeightKeys");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "name");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "objectForKey:", v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              v44 = 2 * (v43 != 0);
              v45 = 3;

              v33 = v113;
            }
            else
            {
              v45 = v38;
              v44 = 0;
              v40 = v118;
            }
            v116 |= v39;
            -[TUIKeyplane multiplierForKey:withProperties:](v40, "multiplierForKey:withProperties:", v36, v120);
            v78 = v77;
            self = v40;
            if ((objc_msgSend(v36, "visible") & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v78);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "name");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setObject:forKey:", v55, v83);
              goto LABEL_63;
            }
            -[TUIKeyplane createPreparedKeyFromTree:withMultiplier:type:shape:](v40, "createPreparedKeyFromTree:withMultiplier:type:shape:", v36, v45, v44, v78);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v79);

            if (!-[TUIKeyplane shouldDuplicateKey:forRow:](v40, "shouldDuplicateKey:forRow:", v36, v6))
              continue;
            -[TUIKeyplane duplicateTreeForSplitMode:](v40, "duplicateTreeForSplitMode:", v36);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "name");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "name");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "setObject:forKey:", v80, v81);

            if (!v34)
            {
              objc_msgSend(v6, "subtrees");
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = (void *)objc_msgSend(v82, "mutableCopy");

            }
            v33 = v113;
            if ((objc_msgSend(v34, "containsObject:", v55) & 1) == 0)
            {
              objc_msgSend(v34, "insertObject:atIndex:", v55, objc_msgSend(v7, "count"));
              -[TUIKeyplane createPreparedKeyFromTree:withMultiplier:type:shape:](self, "createPreparedKeyFromTree:withMultiplier:type:shape:", v55, v125, v44, v78);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v83);
LABEL_63:

            }
          }
          else
          {
            objc_msgSend(v36, "name");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "rangeOfString:", CFSTR("Row"));

            objc_msgSend(v36, "name");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v36;
            v50 = objc_msgSend(v48, "length");

            if (v47 >= v50)
              goto LABEL_31;
            objc_msgSend(v49, "name");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "substringFromIndex:", v47);
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            -[TUIKeyplane keylayout](self, "keylayout");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "properties");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "objectForKey:", v52);
            v55 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v55)
            {
LABEL_31:
              -[TUIKeyplane keylayout](self, "keylayout");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "properties");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "name");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "objectForKey:", v58);
              v55 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v114 = k;
            v134 = 0u;
            v135 = 0u;
            v132 = 0u;
            v133 = 0u;
            objc_msgSend(v49, "subtrees");
            v119 = (id)objc_claimAutoreleasedReturnValue();
            v126 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v132, v149, 16);
            if (v126)
            {
              v121 = *(_QWORD *)v133;
              v122 = v55;
              do
              {
                for (m = 0; m != v126; ++m)
                {
                  if (*(_QWORD *)v133 != v121)
                    objc_enumerationMutation(v119);
                  v60 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * m);
                  objc_msgSend(MEMORY[0x1E0DC3918], "shape");
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v60, "setShape:", v61);

                  objc_msgSend(v60, "setDisplayRowHint:", a4);
                  v62 = +[TUIKey layoutTypeForKey:](TUIKey, "layoutTypeForKey:", v60);
                  if (v55)
                    objc_msgSend(v55, "doubleValue");
                  else
                    -[TUIKeyplane multiplierForKey:withProperties:](self, "multiplierForKey:withProperties:", v60, v120);
                  v64 = v63;
                  v65 = v34;
                  if (v62 == 3)
                  {
                    -[TUIKeyplane doubleHeightKeys](self, "doubleHeightKeys");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "name");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v66, "objectForKey:", v67);
                    v68 = (void *)objc_claimAutoreleasedReturnValue();

                    v55 = v122;
                    v69 = 2 * (v68 != 0);
                    self = v118;

                  }
                  else
                  {
                    v69 = 0;
                  }
                  -[TUIKeyplane createPreparedKeyFromTree:withMultiplier:type:shape:](self, "createPreparedKeyFromTree:withMultiplier:type:shape:", v60, v62, v69, v64);
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "addObject:", v70);

                  if (-[TUIKeyplane shouldDuplicateKey:forRow:](self, "shouldDuplicateKey:forRow:", v60, v6))
                  {
                    -[TUIKeyplane duplicateTreeForSplitMode:](self, "duplicateTreeForSplitMode:", v60);
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v71, "name");
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v60, "name");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v120, "setObject:forKey:", v72, v73);

                    v34 = v65;
                    v74 = v124;
                    if (!v34)
                    {
                      objc_msgSend(v124, "subtrees");
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      v34 = (void *)objc_msgSend(v75, "mutableCopy");

                    }
                    objc_msgSend(v34, "insertObject:atIndex:", v71, objc_msgSend(v7, "count"));
                    -[TUIKeyplane createPreparedKeyFromTree:withMultiplier:type:shape:](self, "createPreparedKeyFromTree:withMultiplier:type:shape:", v71, v62, v69, v64);
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v7, "addObject:", v76);

                    v55 = v122;
                  }
                  else
                  {
                    v34 = v65;
                    v74 = v124;
                  }
                }
                v126 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v132, v149, 16);
              }
              while (v126);
            }
            else
            {
              v74 = v49;
            }

            if (v34)
            {
              v84 = (void *)objc_msgSend(v34, "mutableCopy");
              objc_msgSend(v74, "setSubtrees:", v84);

              objc_msgSend(v34, "removeAllObjects");
              v83 = v34;
              v34 = 0;
              v33 = v113;
              k = v114;
              goto LABEL_63;
            }
            v33 = v113;
            k = v114;
          }

        }
        v117 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v150, 16);
        if (!v117)
          goto LABEL_69;
      }
    }
    v116 = 0;
    v34 = 0;
LABEL_69:

    v127 = v34;
    if (objc_msgSend(v33, "count"))
    {
      objc_msgSend(v33, "allKeys");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "containsObject:", CFSTR("Dictation-Key"));

      objc_msgSend(v33, "objectForKey:", CFSTR("International-Key"));
      v87 = objc_claimAutoreleasedReturnValue();
      if (v87)
      {
        v88 = (void *)v87;
        objc_msgSend(v33, "objectForKey:", CFSTR("International-Key"));
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "doubleValue");
        v91 = v90;

        if (v91 > 0.0)
        {
          v130 = 0u;
          v131 = 0u;
          v128 = 0u;
          v129 = 0u;
          v92 = v7;
          v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v128, v148, 16);
          if (v93)
          {
            v94 = v93;
            v95 = *(_QWORD *)v129;
            while (2)
            {
              for (n = 0; n != v94; ++n)
              {
                if (*(_QWORD *)v129 != v95)
                  objc_enumerationMutation(v92);
                v97 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * n);
                objc_msgSend(v97, "backingTree");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = objc_msgSend(v98, "displayType");

                if (v86)
                  v100 = v99 == 18;
                else
                  v100 = v99 == 4;
                v34 = v127;
                if (v100)
                {
                  objc_msgSend(v97, "multiplier");
                  objc_msgSend(v97, "setMultiplier:", v91 + v101);
                  goto LABEL_86;
                }
              }
              v94 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v128, v148, 16);
              if (v94)
                continue;
              break;
            }
          }
LABEL_86:

          self = v118;
          v33 = v113;
        }
      }
    }
    if (-[TUIKeyplane indexOfLastRow](self, "indexOfLastRow") == a4)
    {
      -[TUIKeyplane cache](self, "cache");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v116 & 1);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "setObject:forKey:", v103, v104);

      v34 = v127;
    }
    if (v34)
    {
      v105 = (void *)objc_msgSend(v34, "mutableCopy");
      objc_msgSend(v6, "setSubtrees:", v105);

      objc_msgSend(v34, "removeAllObjects");
    }

  }
  else
  {
    v7 = (id)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (double)multiplierForKey:(id)a3 withProperties:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_3;
  objc_msgSend(v5, "representedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_3;
  objc_msgSend(v5, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "rangeOfString:", CFSTR("_"));

  v13 = 1.0;
  if (v17 == 1)
  {
    objc_msgSend(v5, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "substringFromIndex:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
LABEL_3:
      objc_msgSend(v6, "objectForKey:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v6, "objectForKey:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        v13 = v12;

      }
      else
      {
        objc_msgSend(v8, "doubleValue");
        v13 = v14;
      }

    }
  }

  return v13;
}

- (BOOL)shouldDuplicateKey:(id)a3 forRow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  if (-[TUIKeyplane layoutClass](self, "layoutClass") == 2 && objc_msgSend(v6, "interactionType") == 15)
  {
    objc_msgSend(v7, "properties");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = 0;
    else
      v11 = objc_msgSend(v6, "splitMode") != 3;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)duplicateTreeForSplitMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUIKeyplane fullTree](self, "fullTree");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedKeysByKeyName:", CFSTR("Space-Key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") < 2
    || (objc_msgSend(v6, "objectAtIndex:", 1), (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_15:
    v8 = (void *)objc_msgSend(v4, "copy");
    goto LABEL_16;
  }
  v8 = v7;
  if (!objc_msgSend(v7, "isEqual:", v4))
    goto LABEL_16;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isEqual:", v4, (_QWORD)v21) & 1) == 0)
        {
          v15 = v14;

          v8 = v15;
          goto LABEL_14;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
        continue;
      break;
    }
LABEL_14:

    if (!v8)
      goto LABEL_15;
  }
  else
  {

  }
LABEL_16:
  if ((objc_msgSend(v6, "containsObject:", v8, (_QWORD)v21) & 1) == 0)
  {
    -[TUIKeyplane fullTree](self, "fullTree");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "replaceKey:withKey:", 0, v8);

  }
  v17 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v4, "cache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryWithDictionary:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "setObject:forKey:", &unk_1E2517260, *MEMORY[0x1E0DC4D78]);
  objc_msgSend(v8, "setCache:", v19);
  objc_msgSend(v8, "setSplitMode:", 3);

  return v8;
}

- (id)keysForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUIKeyplane doubleHeightKeys](self, "doubleHeightKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)findRowSpanningDuplicatesForKeyplane:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 2)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v5 = objc_msgSend(&unk_1E2517750, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        v8 = 0;
        v17 = v6;
        do
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(&unk_1E2517750);
          objc_msgSend(v3, "cachedKeysByKeyName:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v8));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v9, "count") >= 2)
          {
            v20 = 0u;
            v21 = 0u;
            v18 = 0u;
            v19 = 0u;
            v10 = v9;
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v19;
              do
              {
                v14 = 0;
                do
                {
                  if (*(_QWORD *)v19 != v13)
                    objc_enumerationMutation(v10);
                  objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "name");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v4, "setObject:forKey:", v10, v15);

                  ++v14;
                }
                while (v12 != v14);
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
              }
              while (v12);
            }

            v6 = v17;
          }

          ++v8;
        }
        while (v8 != v6);
        v6 = objc_msgSend(&unk_1E2517750, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v6);
    }
  }

  return v4;
}

- (id)createPreparedKeyFromTree:(id)a3 withMultiplier:(double)a4 type:(int64_t)a5 shape:(int64_t)a6
{
  void *v7;
  void *v8;

  +[TUIKey keyFromKBTree:layoutType:layoutShape:multiplier:](TUIKey, "keyFromKBTree:layoutType:layoutShape:multiplier:", a3, a5, a6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplane fullTree](self, "fullTree");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKeyplane:", v8);

  objc_msgSend(v7, "setStyle:", -[TUIKeyplane keyStyleForLayoutClass:](self, "keyStyleForLayoutClass:", -[TUIKeyplane layoutClass](self, "layoutClass")));
  objc_msgSend(v7, "setInGridLayout:", -[TUIKeyplane isGridLayout](self, "isGridLayout"));
  return v7;
}

- (double)finalSplitSizeForRightSide:(BOOL)a3
{
  double result;
  BOOL v4;
  double v5;

  if (a3)
  {
    -[TUIKeyplane rightSplitSize](self, "rightSplitSize");
    v4 = result <= 0.0;
    v5 = 280.0;
  }
  else
  {
    -[TUIKeyplane leftSplitSize](self, "leftSplitSize");
    v4 = result <= 0.0;
    v5 = 266.0;
  }
  if (v4)
    return v5;
  return result;
}

- (double)finalHeightForSplitKeyboard
{
  double v2;
  double result;

  -[TUIKeyplane leftSplitSize](self, "leftSplitSize");
  result = 206.0;
  if (v2 > 0.0)
    return v2;
  return result;
}

- (BOOL)hasSimilarLayoutToKeyplane:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;

  v4 = a3;
  v5 = -[TUIKeyplane currentVariantType](self, "currentVariantType");
  if (v5 != objc_msgSend(v4, "currentVariantType"))
    goto LABEL_9;
  -[TUIKeyplane orderedKeysByRow](self, "orderedKeysByRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(v4, "orderedKeysByRow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 == v9)
  {
    -[TUIKeyplane orderedKeysByRow](self, "orderedKeysByRow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = 0;
      while (1)
      {
        -[TUIKeyplane orderedKeysByRow](self, "orderedKeysByRow");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectAtIndex:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "orderedKeysByRow");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v14, "count");
        v17 = objc_msgSend(v16, "count");

        LOBYTE(v11) = v11 == v17;
        if (!(_BYTE)v11)
          break;
        ++v12;
        -[TUIKeyplane orderedKeysByRow](self, "orderedKeysByRow");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v12 >= v19)
        {
          LOBYTE(v11) = 1;
          break;
        }
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)needsResetFromKeyplane:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  _BOOL4 v8;

  v4 = a3;
  -[TUIKeyplane name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6)
    && (v7 = -[TUIKeyplane currentVariantType](self, "currentVariantType"), v7 == objc_msgSend(v4, "currentVariantType")))
  {
    v8 = !-[TUIKeyplane hasSimilarLayoutToKeyplane:](self, "hasSimilarLayoutToKeyplane:", v4);
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (int64_t)keyLayoutStyle
{
  return -[TUIKeyplane keyStyleForLayoutClass:](self, "keyStyleForLayoutClass:", -[TUIKeyplane layoutClass](self, "layoutClass"));
}

- (int64_t)keyStyleForLayoutClass:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return -1;
  else
    return qword_18C80C878[a3];
}

- (double)heightMultiplierForRowNumber:(unint64_t)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;

  -[TUIKeyplane defaultRowSet](self, "defaultRowSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtrees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = 1.0;
  if (v6 > a3)
  {
    objc_msgSend(v4, "subtrees");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "numberForProperty:", CFSTR("Height"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = v10;
        objc_msgSend(v10, "doubleValue");
        v7 = v12;

      }
    }

  }
  return v7;
}

- (id)sortedKeysForKeyplane:(id)a3
{
  id v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  unint64_t v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL IsEmpty;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  int v46;
  BOOL v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  double v53;
  char v54;
  double v55;
  int64_t v56;
  double v57;
  void *v58;
  uint64_t v59;
  double v60;
  char v61;
  double v62;
  int64_t v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  double v70;
  double v71;
  void *v72;
  uint64_t v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t j;
  void *v84;
  void *v85;
  unint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  TUIKeyplane *v91;
  id v92;
  unsigned int v93;
  uint64_t v94;
  id v95;
  void *v96;
  char v97;
  unsigned int v98;
  char v99;
  void *v100;
  id v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;
  CGRect v114;

  v91 = self;
  v113 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v93 = objc_msgSend(v3, "visualStyle") - 1;
  if ((objc_msgSend(v3, "isKanaPlane") & 1) != 0
    || (objc_msgSend(v3, "name"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "containsString:", CFSTR("n10")),
        v5,
        v6)
    && v93 < 5)
  {
    v98 = 1;
    v7 = 2;
  }
  else
  {
    objc_msgSend(v3, "name", v91);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "containsString:", CFSTR("Fudge"));

    v98 = 0;
    if (!v23)
      goto LABEL_6;
    v7 = 1;
  }
  -[TUIKeyplane setLayoutType:](v91, "setLayoutType:", v7, v91);
LABEL_6:
  if (v93 >= 5)
    v8 = 1.5;
  else
    v8 = 1.0;
  objc_msgSend(v3, "keys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;

  if (v12 < 15.0)
  {
    objc_msgSend(v3, "keys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 >= 2)
    {
      v15 = 1;
      while (1)
      {
        objc_msgSend(v3, "keys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndex:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "frame");
        v19 = v18;

        if (v19 > 15.0)
          break;
        ++v15;
        objc_msgSend(v3, "keys");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        if (v15 >= v21)
          goto LABEL_18;
      }
      v12 = v19;
    }
  }
LABEL_18:
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  objc_msgSend(v3, "keysOrderedByPosition");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v107, v112, 16);
  v95 = v4;
  if (!v25)
  {
    v28 = 0;
    v27 = 0;
    goto LABEL_94;
  }
  v26 = v25;
  v97 = 0;
  v94 = 0;
  v27 = 0;
  v28 = 0;
  v29 = *(_QWORD *)v108;
  v92 = v3;
  v99 = v98;
  v100 = v24;
  do
  {
    for (i = 0; i != v26; ++i)
    {
      if (*(_QWORD *)v108 != v29)
        objc_enumerationMutation(v24);
      v31 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
      objc_msgSend(v31, "shape");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v32, "isEmpty") & 1) != 0)
        goto LABEL_75;
      v33 = v28;
      objc_msgSend(v31, "shape");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "frame");
      IsEmpty = CGRectIsEmpty(v114);

      if (IsEmpty)
      {
        v28 = v33;
        v24 = v100;
        continue;
      }
      v28 = v33;
      if (objc_msgSend(v31, "displayType") == 51
        && objc_msgSend(v33, "interactionType") == 9)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v33, "displayRowHint"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "removeObjectAtIndex:", 0);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v33, "displayRowHint"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v37, v38);

        v28 = v33;
        v97 = 1;
      }
      else
      {
        v97 = 0;
      }
      if ((v99 & 1) != 0 && objc_msgSend(v31, "interactionType") == 13)
      {
        objc_msgSend(v31, "setDisplayRowHint:", (v94 + 1));
        v39 = objc_msgSend(v31, "copy");

        objc_msgSend(v31, "setDisplayRowHint:", v94);
        v99 = 1;
        if ((v98 & 1) == 0)
        {
          v27 = (void *)v39;
          v24 = v100;
          continue;
        }
      }
      else
      {
        v99 |= objc_msgSend(v31, "interactionType") == 13;
        v39 = (uint64_t)v27;
      }
      v101 = v28;
      v96 = (void *)v39;
      objc_msgSend(v31, "setState:", 4);
      v94 = objc_msgSend(v31, "displayRowHint");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)v94);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
      {
        v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v49 = objc_msgSend(v31, "displayType");
        if (v49 == objc_msgSend(v28, "displayType"))
        {
          objc_msgSend(v31, "representedString");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "representedString");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v50, "isEqualToString:", v51) & 1) != 0)
          {
            v52 = objc_msgSend(v31, "displayType");

            v47 = v52 == 21;
            v4 = v95;
            if (!v47)
            {
              v24 = v100;
              goto LABEL_73;
            }
          }
          else
          {

          }
        }
        objc_msgSend(v31, "frame");
        if (vabdd_f64(v60, v12) <= 10.0)
          v61 = 1;
        else
          v61 = v97;
        v62 = 0.0;
        if ((v61 & 1) == 0)
          v62 = round((v60 + v60) / v12) * 0.5;
        v63 = +[TUIKey layoutTypeForKey:](TUIKey, "layoutTypeForKey:", v31);
        if (v98)
          v64 = v8;
        else
          v64 = v62;
        +[TUIKey keyFromKBTree:layoutType:layoutShape:multiplier:](TUIKey, "keyFromKBTree:layoutType:layoutShape:multiplier:", v31, v63, v98, v64);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setKeyplane:", v92);
        if (v93 >= 5)
        {
          if (-[TUIKeyplane layoutType](v91, "layoutType") == 1)
            v59 = 3;
          else
            v59 = 2;
        }
        else
        {
          v59 = 1;
        }
        goto LABEL_72;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)v94);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", v42);
      v43 = (id)objc_claimAutoreleasedReturnValue();

      LODWORD(v42) = objc_msgSend(v31, "displayType");
      if ((_DWORD)v42 != objc_msgSend(v28, "displayType"))
        goto LABEL_45;
      objc_msgSend(v31, "representedString");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "representedString");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v44, "isEqualToString:", v45) & 1) == 0)
      {

LABEL_45:
        objc_msgSend(v31, "frame");
        if (vabdd_f64(v53, v12) <= 10.0)
          v54 = 1;
        else
          v54 = v97;
        v55 = 0.0;
        if ((v54 & 1) == 0)
          v55 = round((v53 + v53) / v12) * 0.5;
        v56 = +[TUIKey layoutTypeForKey:](TUIKey, "layoutTypeForKey:", v31);
        if (v98)
          v57 = v8;
        else
          v57 = v55;
        +[TUIKey keyFromKBTree:layoutType:layoutShape:multiplier:](TUIKey, "keyFromKBTree:layoutType:layoutShape:multiplier:", v31, v56, v98, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "setKeyplane:", v92);
        if (v93 >= 5)
        {
          if (-[TUIKeyplane layoutType](v91, "layoutType") == 1)
            v59 = 3;
          else
            v59 = 2;
        }
        else
        {
          v59 = 1;
        }
LABEL_72:
        v24 = v100;
        objc_msgSend(v58, "setStyle:", v59);
        objc_msgSend(v58, "setInGridLayout:", v98);
        objc_msgSend(v43, "addObject:", v58);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (int)v94);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v43, v65);

LABEL_73:
        v48 = v101;
        goto LABEL_74;
      }
      v46 = objc_msgSend(v31, "displayType");

      v47 = v46 == 21;
      v4 = v95;
      if (v47)
        goto LABEL_45;
      v48 = v33;
      v24 = v100;
LABEL_74:

      v32 = v48;
      v28 = v31;
      v27 = v96;
LABEL_75:

    }
    v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v107, v112, 16);
  }
  while (v26);

  if (v27)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v27, "displayRowHint"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v67;
    if (v67)
      v69 = v67;
    else
      v69 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = v69;
    v3 = v92;

    objc_msgSend(v27, "frame");
    v71 = 0.0;
    if (!((vabdd_f64(v70, v12) <= 10.0) | v97 & 1))
      v71 = round((v70 + v70) / v12) * 0.5;
    if (v98)
      v71 = v8;
    +[TUIKey keyFromKBTree:layoutType:layoutShape:multiplier:](TUIKey, "keyFromKBTree:layoutType:layoutShape:multiplier:", v27, 3, 0, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setKeyplane:", v92);
    if (v93 >= 5)
    {
      if (-[TUIKeyplane layoutType](v91, "layoutType") == 1)
        v73 = 3;
      else
        v73 = 2;
    }
    else
    {
      v73 = 1;
    }
    objc_msgSend(v72, "setStyle:", v73);
    objc_msgSend(v72, "setInGridLayout:", v98);
    objc_msgSend(v24, "addObject:", v72);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v27, "displayRowHint"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, v74);

LABEL_94:
  }
  else
  {
    v3 = v92;
  }
  if (objc_msgSend(v4, "count"))
  {
    v102 = v28;
    v75 = v3;
    v76 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "allKeys");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "sortedArrayUsingComparator:", &__block_literal_global_1628);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v79 = v78;
    v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v103, v111, 16);
    if (v80)
    {
      v81 = v80;
      v82 = *(_QWORD *)v104;
      do
      {
        for (j = 0; j != v81; ++j)
        {
          if (*(_QWORD *)v104 != v82)
            objc_enumerationMutation(v79);
          v84 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
          objc_msgSend(v4, "objectForKey:", v84);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v85, "count")
            && ((unint64_t)objc_msgSend(v79, "count") < 3 || (unint64_t)objc_msgSend(v85, "count") >= 2))
          {
            v86 = objc_msgSend(v84, "integerValue");
            if (v86 <= objc_msgSend(v76, "count"))
            {
              if (objc_msgSend(v84, "integerValue"))
              {
                v87 = objc_msgSend(v84, "integerValue");
                v88 = v76;
                v89 = v85;
              }
              else
              {
                v88 = v76;
                v89 = v85;
                v87 = 0;
              }
              objc_msgSend(v88, "insertObject:atIndex:", v89, v87);
            }
            else
            {
              objc_msgSend(v76, "addObject:", v85);
            }
            v4 = v95;
          }

        }
        v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v103, v111, 16);
      }
      while (v81);
    }

    v3 = v75;
    v28 = v102;
  }
  else
  {
    v76 = 0;
  }

  return v76;
}

- (BOOL)isGridLayout
{
  void *v3;
  void *v4;
  int v5;
  char v6;

  -[TUIKeyplane fullTree](self, "fullTree");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "containsString:", CFSTR("Wubihua-Simplified")) & 1) != 0
    || (objc_msgSend(v4, "containsString:", CFSTR("Pinyin10-Simplified")) & 1) != 0
    || (objc_msgSend(v4, "containsString:", CFSTR("Wubihua-Traditional")) & 1) != 0
    || objc_msgSend(v4, "containsString:", CFSTR("Pinyin10-Traditional")))
  {
    v5 = objc_msgSend(v4, "containsString:", CFSTR("Numbers-And-Punctuation")) ^ 1;
  }
  else
  {
    v5 = 0;
  }
  if (-[TUIKeyplane layoutType](self, "layoutType") == 2
    || ((v5 | objc_msgSend(v4, "containsString:", CFSTR("Kana"))) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v4, "hasPrefix:", CFSTR("Dynamic-Inuktitut-Small"));
  }

  return v6;
}

- (id)stringFromKeyboardType:(int64_t)a3
{
  id result;

  result = CFSTR("Default");
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("ASCII");
      break;
    case 2:
      result = CFSTR("NumbersAndPunctuation");
      break;
    case 3:
      result = CFSTR("URL");
      break;
    case 4:
      result = CFSTR("NumberPad");
      break;
    case 5:
      result = CFSTR("PhonePad");
      break;
    case 6:
      result = CFSTR("NamePhonePad");
      break;
    case 7:
      result = CFSTR("EmailAddress");
      break;
    case 8:
      result = CFSTR("DecimalPad");
      break;
    case 9:
      result = CFSTR("Twitter");
      break;
    case 10:
      result = CFSTR("WebSearch");
      break;
    default:
      if (a3 == 126)
      {
        result = CFSTR("Writeboard");
      }
      else
      {
        NSLog(CFSTR("Keyboard type %li not found; using Default"), a2, a3);
        result = CFSTR("Default");
      }
      break;
  }
  return result;
}

- (id)stringFromLayoutType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E24FB028[a3];
}

- (id)stringFromLayoutStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return CFSTR("Unknown");
  else
    return off_1E24FB048[a3];
}

- (id)stringFromLayoutClass:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return CFSTR("Unknown");
  else
    return off_1E24FB068[a3];
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TUIKeyplane fullTree](self, "fullTree");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplane stringFromLayoutClass:](self, "stringFromLayoutClass:", -[TUIKeyplane layoutClass](self, "layoutClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplane stringFromLayoutType:](self, "stringFromLayoutType:", -[TUIKeyplane layoutType](self, "layoutType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplane stringFromLayoutStyle:](self, "stringFromLayoutStyle:", -[TUIKeyplane keyLayoutStyle](self, "keyLayoutStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> name = %@; size class = %@; layout type = %@; key style = %@; number of rows = %li"),
    v4,
    self,
    v6,
    v7,
    v8,
    v9,
    -[TUIKeyplane numberOfRows](self, "numberOfRows"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (int64_t)layoutClass
{
  return self->_layoutClass;
}

- (void)setLayoutClass:(int64_t)a3
{
  self->_layoutClass = a3;
}

- (int64_t)effectsType
{
  return self->_effectsType;
}

- (void)setEffectsType:(int64_t)a3
{
  self->_effectsType = a3;
}

- (int64_t)currentVariantType
{
  return self->_currentVariantType;
}

- (void)setCurrentVariantType:(int64_t)a3
{
  self->_currentVariantType = a3;
}

- (NSArray)defaultKeysByRow
{
  return self->_defaultKeysByRow;
}

- (void)setDefaultKeysByRow:(id)a3
{
  objc_storeStrong((id *)&self->_defaultKeysByRow, a3);
}

- (NSArray)variantKeysByRow
{
  return self->_variantKeysByRow;
}

- (void)setVariantKeysByRow:(id)a3
{
  objc_storeStrong((id *)&self->_variantKeysByRow, a3);
}

- (UIKBTree)fullTree
{
  return self->_fullTree;
}

- (void)setFullTree:(id)a3
{
  objc_storeStrong((id *)&self->_fullTree, a3);
}

- (UIKBTree)keylayout
{
  return self->_keylayout;
}

- (void)setKeylayout:(id)a3
{
  objc_storeStrong((id *)&self->_keylayout, a3);
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (NSMutableDictionary)doubleHeightKeys
{
  return self->_doubleHeightKeys;
}

- (void)setDoubleHeightKeys:(id)a3
{
  objc_storeStrong((id *)&self->_doubleHeightKeys, a3);
}

- (int64_t)indexOfLastRow
{
  return self->_indexOfLastRow;
}

- (void)setIndexOfLastRow:(int64_t)a3
{
  self->_indexOfLastRow = a3;
}

- (CGSize)leftSplitSize
{
  double width;
  double height;
  CGSize result;

  width = self->_leftSplitSize.width;
  height = self->_leftSplitSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLeftSplitSize:(CGSize)a3
{
  self->_leftSplitSize = a3;
}

- (CGSize)rightSplitSize
{
  double width;
  double height;
  CGSize result;

  width = self->_rightSplitSize.width;
  height = self->_rightSplitSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setRightSplitSize:(CGSize)a3
{
  self->_rightSplitSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doubleHeightKeys, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_keylayout, 0);
  objc_storeStrong((id *)&self->_fullTree, 0);
  objc_storeStrong((id *)&self->_variantKeysByRow, 0);
  objc_storeStrong((id *)&self->_defaultKeysByRow, 0);
}

uint64_t __37__TUIKeyplane_sortedKeysForKeyplane___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)keyplaneFromKBTree:(id)a3
{
  return +[TUIKeyplane keyplaneFromKBTree:withType:](TUIKeyplane, "keyplaneFromKBTree:withType:", a3, 0);
}

+ (id)keyplaneFromKBTree:(id)a3 withType:(int64_t)a4
{
  id v5;
  TUIKeyplane *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = objc_alloc_init(TUIKeyplane);
  -[TUIKeyplane setFullTree:](v6, "setFullTree:", v5);
  -[TUIKeyplane setEffectsType:](v6, "setEffectsType:", +[TUIKeyplane defaultEffectsType](TUIKeyplane, "defaultEffectsType"));
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplane setLayoutClass:](v6, "setLayoutClass:", +[TUIKeyplane layoutClassFromKeyplaneName:](TUIKeyplane, "layoutClassFromKeyplaneName:", v7));

  if (-[TUIKeyplane isGridLayout](v6, "isGridLayout"))
    v8 = 2;
  else
    v8 = -[TUIKeyplane layoutClass](v6, "layoutClass") == 4;
  -[TUIKeyplane setLayoutType:](v6, "setLayoutType:", v8);
  -[TUIKeyplane findRowSpanningDuplicatesForKeyplane:](v6, "findRowSpanningDuplicatesForKeyplane:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplane setDoubleHeightKeys:](v6, "setDoubleHeightKeys:", v9);

  -[TUIKeyplane defaultKeysOrderedByRowForKeyplane:](v6, "defaultKeysOrderedByRowForKeyplane:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplane setDefaultKeysByRow:](v6, "setDefaultKeysByRow:", v10);

  -[TUIKeyplane rowsForKeyboardType:](v6, "rowsForKeyboardType:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKeyplane setVariantKeysByRow:](v6, "setVariantKeysByRow:", v11);

  -[TUIKeyplane setCurrentVariantType:](v6, "setCurrentVariantType:", a4);
  return v6;
}

+ (int64_t)defaultEffectsType
{
  return 0;
}

+ (BOOL)isSixRowLayout:(id)a3
{
  if (a3)
    return objc_msgSend(&unk_1E2517768, "containsObject:");
  else
    return 0;
}

+ (int64_t)layoutClassFromKeyplaneName:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR("Mini")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("Small_")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("Medium")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("Large")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("Grand")) & 1) != 0)
  {
    v4 = 4;
  }
  else
  {
    NSLog(CFSTR("Error: No mapping found for class for %@"), v3);
    v4 = -1;
  }

  return v4;
}

+ (int64_t)layoutClassFromScreenDimensions:(CGSize)a3
{
  if (*MEMORY[0x1E0C9D820] == a3.width && *(double *)(MEMORY[0x1E0C9D820] + 8) == a3.height)
    return -1;
  if (a3.width > a3.height)
    a3.width = a3.height;
  if (a3.width < 320.0)
    return 0;
  if (a3.width < 730.0)
    return 1;
  if (a3.width < 815.0)
    return 2;
  if (a3.width >= 1024.0)
    return 4;
  return 3;
}

+ (double)baseHeightForLayout:(id)a3 layoutClass:(int64_t)a4 landscape:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  double v8;
  uint64_t v9;

  v5 = a5;
  v7 = a3;
  if (v5)
  {
    if ((unint64_t)(a4 - 2) >= 3)
    {
      v9 = 0x4064000000000000;
LABEL_8:
      v8 = *(double *)&v9;
    }
    else
    {
      v8 = dbl_18C80C8A0[a4 - 2];
    }
  }
  else
  {
    v8 = 132.0;
    switch(a4)
    {
      case 0:
        break;
      case 1:
        if (objc_msgSend((id)objc_opt_class(), "isSixRowLayout:", v7))
          v8 = 240.0;
        else
          v8 = 216.0;
        break;
      case 2:
      case 3:
        v8 = 258.0;
        break;
      case 4:
        v8 = 325.0;
        break;
      default:
        v9 = 0x406B000000000000;
        goto LABEL_8;
    }
  }

  return v8;
}

+ (CGSize)sizeBasisForLayoutClass:(int64_t)a3
{
  double v3;
  double v4;
  uint64_t v5;
  CGSize result;

  v3 = 244.0;
  v4 = 198.0;
  switch(a3)
  {
    case 0:
      goto LABEL_8;
    case 1:
      v3 = 812.0;
      v4 = 375.0;
      goto LABEL_8;
    case 2:
      v3 = 1024.0;
      v5 = 0x4088000000000000;
      goto LABEL_7;
    case 3:
      v3 = 1194.0;
      v4 = 834.0;
      goto LABEL_8;
    case 4:
      v3 = 1366.0;
      v5 = 0x4090000000000000;
      goto LABEL_7;
    default:
      v3 = 568.0;
      v5 = 0x4074000000000000;
LABEL_7:
      v4 = *(double *)&v5;
LABEL_8:
      result.height = v3;
      result.width = v4;
      return result;
  }
}

+ (CGSize)sizeFromScreenTraits:(id)a3 layout:(id)a4 layoutClass:(int64_t)a5
{
  id v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  v7 = a3;
  v8 = a4;
  +[TUIKeyplane baseHeightForLayout:layoutClass:landscape:](TUIKeyplane, "baseHeightForLayout:layoutClass:landscape:", v8, a5, objc_msgSend(v7, "isKeyboardMinorEdgeWidth") ^ 1);
  v10 = v9;

  if (a5 == 1 && !objc_msgSend(v7, "idiom"))
  {
    objc_msgSend(v7, "keyboardWidth");
    if (v11 > 400.0)
    {
      if (objc_msgSend(v7, "isKeyboardMinorEdgeWidth"))
        v10 = v10 + 8.0;
    }
  }
  if (objc_msgSend(v7, "isFloating"))
    v10 = v10 + 1.0;
  if (a5 == 3)
  {
    if (objc_msgSend(v7, "isKeyboardMinorEdgeWidth") && (objc_msgSend(v7, "keyboardWidth"), v12 < 834.0))
    {
      v10 = v10 + -3.0;
    }
    else if ((objc_msgSend(v7, "isKeyboardMinorEdgeWidth") & 1) == 0)
    {
      objc_msgSend(v7, "keyboardWidth");
      if (v13 < 1194.0)
        v10 = v10 + -6.0;
    }
  }
  objc_msgSend(v7, "screen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "scale");
  v16 = v15;
  objc_msgSend(v7, "screen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "nativeScale");
  v19 = v16 / v18;

  if (v19 > 1.0 && (objc_msgSend(v7, "isFloating") & 1) == 0)
    v10 = round(v10 * v19);
  objc_msgSend(v7, "keyboardWidth");
  v21 = v20;

  v22 = v21;
  v23 = v10;
  result.height = v23;
  result.width = v22;
  return result;
}

@end
