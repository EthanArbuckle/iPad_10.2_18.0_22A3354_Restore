@implementation CRLiOSPencilTrayObjCHelper

+ (id)p_eraserToolInToolPicker:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_tools"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8);
        objc_opt_class(PKEraserTool, v5);
        v11 = sub_100221D0C(v10, v9);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (v12)
        {
          v13 = (void *)v12;
          goto LABEL_11;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (id)p_lassoToolInToolPicker:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_tools"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8);
        objc_opt_class(PKLassoTool, v5);
        v11 = sub_100221D0C(v10, v9);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (v12)
        {
          v13 = (void *)v12;
          goto LABEL_11;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

+ (void)resetTools:(id)a3 forSelectedTool:(id)a4 inToolPicker:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  BOOL v21;
  id obj;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v25;
    v15 = PKInkIdentifierEraser;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v17, "isEqual:", v15))
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_eraserToolInToolPicker:", v10));
        else
          v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "p_customToolInToolPicker:withId:", v10, v17));
        v19 = (void *)v18;
        if (v18)
          objc_msgSend(v23, "addObject:", v18);
        if (objc_msgSend(v17, "isEqual:", v9))
        {
          v20 = v19;

          v13 = v20;
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  if (objc_msgSend(v23, "count"))
    v21 = v13 == 0;
  else
    v21 = 1;
  if (!v21)
    objc_msgSend(v10, "_resetTools:selectedTool:", v23, v13);

}

+ (id)p_customToolInToolPicker:(id)a3 withId:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  unsigned __int8 v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_tools"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    v11 = *(_QWORD *)v21;
LABEL_3:
    v12 = 0;
    v13 = v10;
    while (1)
    {
      if (*(_QWORD *)v21 != v11)
        objc_enumerationMutation(v6);
      v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v12);
      objc_opt_class(PKCustomTool, v8);
      v16 = sub_100221D0C(v15, v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v16);

      if (v10)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "customIdentifier", (_QWORD)v20));
        v18 = objc_msgSend(v5, "isEqual:", v17);

        if ((v18 & 1) != 0)
          break;
      }
      v12 = (char *)v12 + 1;
      v13 = v10;
      if (v9 == v12)
      {
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)insertCustomizedLassoToolWithToolIdentifier:(id)a3 withToolConfiguration:(id)a4 inToolPicker:(id)a5 forcingIndexZero:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  CRLFreehandDrawingCustomizedLassoTool *v11;
  void *v12;
  id v13;
  unint64_t v14;
  id v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  BOOL v26;
  BOOL v27;
  unint64_t v28;
  _BOOL4 v29;
  id v30;

  v6 = a6;
  v30 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[CRLFreehandDrawingCustomizedLassoTool initWithCustomIdentifier:configuration:color:weight:]([CRLFreehandDrawingCustomizedLassoTool alloc], "initWithCustomIdentifier:configuration:color:weight:", v30, v9, 0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_tools"));
  if (objc_msgSend(v12, "count"))
  {
    v29 = v6;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    do
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v16));
      objc_opt_class(PKLassoTool, v18);
      v20 = sub_100221D0C(v19, v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = v21;
      if (v21)
      {
        v23 = v21;
        v24 = v13;
        v14 = v16;
        v13 = v23;
      }
      else
      {
        v25 = v17;
        v24 = v15;
        v15 = v25;
      }

      if (v13)
        v26 = v15 == 0;
      else
        v26 = 1;
      if (!v26)
        break;
      ++v16;
    }
    while (v16 < (unint64_t)objc_msgSend(v12, "count"));
    if (v13)
      v27 = v15 == 0;
    else
      v27 = 1;
    if (!v27)
    {
      objc_msgSend(v10, "setSelectedTool:", v15);
      objc_msgSend(v10, "_removeTool:", v13);
    }
    v6 = v29;
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v15 = 0;
  }
  if (v6)
    v28 = 0;
  else
    v28 = v14;
  objc_msgSend(v10, "_insertTool:atIndex:", v11, v28);

}

@end
