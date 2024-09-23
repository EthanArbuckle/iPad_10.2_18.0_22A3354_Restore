@implementation DBGViewDebuggerSupport

+ (unint64_t)majorVersion
{
  return 2;
}

+ (unint64_t)minorVersion
{
  return 0;
}

+ (id)classMap
{
  id result;

  result = (id)classMap_classMap;
  if (!classMap_classMap)
  {
    result = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    classMap_classMap = (uint64_t)result;
  }
  return result;
}

+ (void)addPathForClass:(Class)a3
{
  id v5;
  NSString *v6;
  id v7;

  v5 = objc_msgSend(a1, "classMap");
  v6 = NSStringFromClass(a3);
  if (!objc_msgSend(v5, "objectForKey:", a3))
  {
    v7 = objc_msgSend(a1, "pathForClass:", a3);
    if (v7)
    {
      if (v6)
        objc_msgSend(v5, "setObject:forKey:", v7, v6);
    }
  }
}

+ (id)pathForClass:(Class)a3
{
  NSString *v4;
  objc_class *v5;
  objc_class *v6;
  unint64_t v7;

  v4 = NSStringFromClass(a3);
  v5 = (objc_class *)-[objc_class superclass](a3, "superclass");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      if (v6 == (objc_class *)objc_opt_class(NSObject))
        break;
      if (v7 > 0x3E8)
        break;
      v4 = -[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", NSStringFromClass(v6));
      ++v7;
      v6 = (objc_class *)-[objc_class superclass](v6, "superclass");
    }
    while (v6);
  }
  return v4;
}

+ (id)fetchViewHierarchyWithOptions:(id)a3
{
  DBGViewDebuggerUseLayersAsSnapshots = 1;
  if (objc_msgSend(a3, "objectForKey:", CFSTR("DBGViewDebuggerUseLayersAsSnapshots")))
    DBGViewDebuggerUseLayersAsSnapshots = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DBGViewDebuggerUseLayersAsSnapshots")), "BOOLValue");
  DBGViewDebuggerAlwaysEncodeLayers = 0;
  if (objc_msgSend(a3, "objectForKey:", CFSTR("DBGViewDebuggerAlwaysEncodeLayers")))
    DBGViewDebuggerAlwaysEncodeLayers = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DBGViewDebuggerAlwaysEncodeLayers")), "BOOLValue");
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DBGViewDebuggerEffectViewsToSnapshotAsImage")))
    DBGViewDebuggerEffectViewsToSnapshotAsImage = (uint64_t)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DBGViewDebuggerEffectViewsToSnapshotAsImage"));
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DBGViewDebuggerEnableSceneDebugging")))
    DBGViewDebuggerEnableSceneDebugging = objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("DBGViewDebuggerEnableSceneDebugging")), "BOOLValue");
  return objc_msgSend(a1, "fetchViewHierarchy");
}

+ (id)viewDebuggerEffectViewsToSnapshotAsImage
{
  return (id)DBGViewDebuggerEffectViewsToSnapshotAsImage;
}

+ (void)enableLayersAsSnapshots
{
  DBGViewDebuggerUseLayersAsSnapshots = 1;
}

+ (void)disableLayersAsSnapshots
{
  DBGViewDebuggerUseLayersAsSnapshots = 0;
}

+ (id)fetchViewHierarchy
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id result;
  id obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  NSString *v33;
  const __CFString *v34;
  NSArray *v35;
  _BYTE v36[128];
  id v37;
  _BYTE v38[128];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = objc_msgSend(a1, "appWindows");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  obj = v4;
  if (v5)
  {
    v6 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(obj);
        v8 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v9 = objc_msgSend(a1, "windowContentViewForWindow:", v8);
        if (v8 == v9)
        {
          v10 = objc_msgSend(a1, "_collectSubviewInfoForView:encodeLayers:", v8, 1);
        }
        else
        {
          v10 = objc_msgSend(a1, "collectViewInfo:", v8);
          v37 = objc_msgSend(a1, "_collectSubviewInfoForView:encodeLayers:", v9, 1);
          objc_msgSend(v10, "setObject:forKey:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1), CFSTR("subviews"));
        }
        objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(a1, "isHiddenForWindow:", v8)), CFSTR("hidden"));
        v11 = +[NSMutableArray array](NSMutableArray, "array");
        objc_msgSend(a1, "_populateConstraintInfosArray:forViewHierarchy:", v11, v9);
        if (objc_msgSend(v11, "count"))
          objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("constraints"));
        v12 = objc_msgSend(a1, "titleForWindow:", v8);
        if (objc_msgSend(v12, "length"))
          objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("displayName"));
        objc_msgSend(a1, "screenBackingScaleForWindow:", v8);
        objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("screenBackingScale"));
        objc_msgSend(v3, "addObject:", v10);
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v5);
  }
  v13 = objc_msgSend(a1, "additionalRootLevelViewsToArchive");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j);
        if ((objc_msgSend(a1, "isViewSubclass:", v17) & 1) != 0)
        {
          v18 = objc_msgSend(a1, "_collectSubviewInfoForView:encodeLayers:", v17, 1);
          v19 = +[NSMutableArray array](NSMutableArray, "array");
          objc_msgSend(a1, "_populateConstraintInfosArray:forViewHierarchy:", v19, v17);
          if (objc_msgSend(v19, "count"))
            objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("constraints"));
          objc_msgSend(a1, "screenBackingScaleForView:", v17);
          objc_msgSend(v18, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("screenBackingScale"));
          objc_msgSend(v3, "addObject:", v18);
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
    }
    while (v14);
  }
  v20 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(v20, "setObject:forKey:", v3, CFSTR("views"));
  objc_msgSend(v20, "setObject:forKey:", objc_msgSend(a1, "classMap"), CFSTR("classmap"));
  v21 = objc_msgSend(a1, "primaryWindowFromWindows:", obj);
  if (v21)
    objc_msgSend(v20, "setObject:forKey:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), v21), CFSTR("primaryWindow"));
  v24 = 0;
  result = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v20, 200, 0, &v24);
  if (v24)
  {
    v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error serializing view hierarchy information: %@"), v24);
    v34 = CFSTR("exceptions");
    v35 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v33, 1);
    return +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1), 200, 0, 0);
  }
  return result;
}

+ (id)collectViewInfo:(id)a3
{
  id v5;

  v5 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  objc_msgSend(a1, "addObjectBasics:toDict:", a3, v5);
  objc_msgSend(a1, "addFrameBasics:toDict:", a3, v5);
  if (objc_msgSend(a1, "isViewSubclass:", a3))
  {
    objc_msgSend(a1, "addViewBasics:toDict:", a3, v5);
    objc_msgSend(a1, "addViewLayerInfo:toDict:", a3, v5);
    objc_msgSend(a1, "addLayoutInfoForView:toDict:", a3, v5);
    objc_msgSend(a1, "_snapshotView:andAddDataToDictionary:", a3, v5);
    objc_msgSend(a1, "addViewSubclassSpecificInfoForView:toDict:", a3, v5);
  }
  return v5;
}

+ (void)addObjectBasics:(id)a3 toDict:(id)a4
{
  objc_class *v7;

  v7 = (objc_class *)objc_opt_class(a3);
  objc_msgSend(a4, "setObject:forKey:", NSStringFromClass(v7), CFSTR("class"));
  objc_msgSend(a1, "addPathForClass:", v7);
  objc_msgSend(a4, "setObject:forKey:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), a3), CFSTR("address"));
}

+ (void)addViewSubclassSpecificInfoForView:(id)a3 toDict:(id)a4
{
  Class v7;
  id v8;
  id v9;
  Class v10;
  id v11;
  id v12;
  Class v13;
  Class v14;
  id v15;
  const __CFString *v16;
  id v17;

  if (DBGViewDebuggerEnableSceneDebugging)
  {
    v7 = NSClassFromString(CFSTR("SCNView"));
    if ((objc_opt_isKindOfClass(a3, v7) & 1) != 0)
    {
      v8 = objc_msgSend(a3, "scene");
      if (v8)
      {
        v9 = v8;
        v10 = NSClassFromString(CFSTR("SCNKeyedArchiver"));
        if ((objc_opt_respondsToSelector(v10, "archivedDataWithRootObject:options:") & 1) != 0)
        {
          objc_msgSend(a4, "setObject:forKey:", -[objc_class archivedDataWithRootObject:options:](v10, "archivedDataWithRootObject:options:", v9, &off_55398), CFSTR("encodedDocumentData"));
          objc_msgSend(a4, "setObject:forKey:", objc_msgSend(a1, "pathForClass:", objc_opt_class(v9)), CFSTR("classPathRepresentedByEncodedDocumentData"));
        }
        if ((objc_opt_respondsToSelector(a3, "pointOfView") & 1) != 0)
        {
          v11 = objc_msgSend(a3, "valueForKey:", CFSTR("pointOfView"));
          if (v11)
          {
            v12 = v11;
            v13 = NSClassFromString(CFSTR("SCNScene"));
            if (v13)
            {
              v14 = v13;
              if ((objc_opt_respondsToSelector(v13, "_indexPathForNode:") & 1) != 0)
              {
                v15 = -[objc_class _indexPathForNode:](v14, "_indexPathForNode:", v12);
                if (v15)
                {
                  v16 = CFSTR("pointOfView");
                  v17 = objc_msgSend(a1, "_arrayEncodedIndexPath:", v15);
                  objc_msgSend(a4, "setObject:forKey:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1), CFSTR("encodedDocumentInfo"));
                }
              }
            }
          }
        }
      }
    }
  }
}

+ (id)_arrayEncodedIndexPath:(id)a3
{
  char *v4;
  uint64_t v5;
  uint64_t *v6;
  id i;
  uint64_t v8;
  uint64_t v10;

  v4 = (char *)objc_msgSend(a3, "length");
  __chkstk_darwin();
  v6 = (uint64_t *)((char *)&v10 - v5);
  objc_msgSend(a3, "getIndexes:range:", (char *)&v10 - v5, 0, v4);
  for (i = &__NSArray0__struct; v4; --v4)
  {
    v8 = *v6++;
    i = objc_msgSend(i, "arrayByAddingObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v8));
  }
  return i;
}

+ (BOOL)_shouldEncodeLayers
{
  return (DBGViewDebuggerUseLayersAsSnapshots | DBGViewDebuggerAlwaysEncodeLayers) != 0;
}

+ (BOOL)_layerShouldSupersedeSnapshot:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = objc_msgSend(a1, "layerForView:");
  if (v5)
  {
    if (objc_msgSend(a1, "snapshotMethodForView:", a3))
    {
LABEL_3:
      LOBYTE(v5) = 0;
      return (char)v5;
    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (void *)DBGViewDebuggerEffectViewsToSnapshotAsImage;
    v7 = objc_msgSend((id)DBGViewDebuggerEffectViewsToSnapshotAsImage, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
LABEL_7:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = (objc_class *)objc_opt_class(a3);
        if ((objc_msgSend(v11, "isEqualToString:", NSStringFromClass(v12)) & 1) != 0)
          goto LABEL_3;
        if (v8 == (id)++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          LOBYTE(v5) = 1;
          if (v8)
            goto LABEL_7;
          return (char)v5;
        }
      }
    }
    LOBYTE(v5) = 1;
  }
  return (char)v5;
}

+ (void)_snapshotView:(id)a3 andAddDataToDictionary:(id)a4
{
  id v7;
  uint64_t v8;

  if (!DBGViewDebuggerUseLayersAsSnapshots
    || (objc_msgSend(a1, "_layerShouldSupersedeSnapshot:", a3) & 1) == 0)
  {
    v8 = 0;
    v7 = objc_msgSend(a1, "snapshotView:errorString:", a3, &v8);
    if (v7)
      objc_msgSend(a4, "setObject:forKey:", v7, CFSTR("imageData"));
    if (v8)
      objc_msgSend(a4, "setObject:forKey:", v8, CFSTR("snapshottingError"));
  }
}

+ (void)_populateConstraintInfosArray:(id)a3 forViewHierarchy:(id)a4
{
  id v6;
  id v7;
  _UNKNOWN **v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  float v14;
  objc_class *v15;
  const __CFString *v16;
  const __CFString *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = objc_msgSend(a4, "constraints");
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = &_s10Foundation19PropertyListEncoderC6encodeyAA4DataVxKSERzlFTj_ptr;
    v9 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(v8[81]);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          v13 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
          objc_msgSend(v13, "setObject:forKey:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), v11), CFSTR("address"));
          objc_msgSend(v13, "setObject:forKey:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), objc_msgSend(v11, "firstItem")), CFSTR("firstItem"));
          objc_msgSend(v13, "setObject:forKey:", +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v11, "firstAttribute")), CFSTR("firstAttribute"));
          objc_msgSend(v13, "setObject:forKey:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), objc_msgSend(v11, "secondItem")), CFSTR("secondItem"));
          objc_msgSend(v13, "setObject:forKey:", +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v11, "secondAttribute")), CFSTR("secondAttribute"));
          objc_msgSend(v13, "setObject:forKey:", +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", a4), CFSTR("container"));
          objc_msgSend(v13, "setObject:forKey:", +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v11, "relation")), CFSTR("relation"));
          objc_msgSend(v11, "constant");
          objc_msgSend(v13, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("constant"));
          objc_msgSend(v11, "multiplier");
          objc_msgSend(v13, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("multiplier"));
          objc_msgSend(v11, "priority");
          objc_msgSend(v13, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14), CFSTR("priority"));
          v15 = (objc_class *)objc_opt_class(v11);
          objc_msgSend(v13, "setObject:forKey:", NSStringFromClass(v15), CFSTR("class"));
          v16 = (const __CFString *)objc_msgSend(v11, "identifier");
          if (v16)
            v17 = v16;
          else
            v17 = &stru_38A98;
          objc_msgSend(v13, "setObject:forKey:", v17, CFSTR("identifier"));
          v8 = &_s10Foundation19PropertyListEncoderC6encodeyAA4DataVxKSERzlFTj_ptr;
          objc_msgSend(a3, "addObject:", v13);
          objc_msgSend(a1, "addPathForClass:", objc_opt_class(v11));
        }
        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v7);
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = objc_msgSend(a4, "subviews");
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(a1, "_populateConstraintInfosArray:forViewHierarchy:", a3, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v22));
        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }
}

+ (id)_collectSubviewInfoForView:(id)a3 encodeLayers:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  id v8;
  id v9;
  void *v10;
  const void *v11;
  CFTypeRef v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v4 = a4;
  v7 = objc_msgSend(a1, "collectViewInfo:");
  v8 = +[NSMutableArray array](NSMutableArray, "array");
  v9 = objc_msgSend(a3, "layer");
  v10 = v9;
  if (v4 && v9 && objc_msgSend(a1, "_shouldEncodeLayers"))
  {
    v11 = (const void *)CAEncodeLayerTree(v10);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("layerRoot"));
    v12 = (id)CFMakeCollectable(v11);
  }
  if (objc_msgSend(objc_msgSend(a1, "subviewsForView:", a3), "count"))
  {
    v13 = 0;
    if (v10)
      v14 = 1;
    else
      v14 = !v4;
    v15 = 1;
    do
    {
      v16 = objc_msgSend(objc_msgSend(a1, "subviewsForView:", a3), "objectAtIndexedSubscript:", v13);
      if (v16)
      {
        v17 = v16;
        if (v14)
        {
          v18 = objc_msgSend(v16, "layer");
          v19 = 0;
          if (v4 && v18)
            v19 = objc_msgSend(objc_msgSend(v10, "sublayers"), "containsObject:", v18) ^ 1;
        }
        else
        {
          v19 = 1;
        }
        objc_msgSend(v8, "addObject:", objc_msgSend(a1, "_collectSubviewInfoForView:encodeLayers:", v17, v19));
      }
      v13 = v15;
    }
    while ((unint64_t)objc_msgSend(objc_msgSend(a1, "subviewsForView:", a3), "count") > v15++);
  }
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("subviews"));
  return v7;
}

+ (id)_layerInfo:(id)a3 view:(id)a4
{
  objc_class *v7;
  NSString *v8;
  _QWORD v10[4];
  _QWORD v11[4];

  if (!a3)
    return 0;
  v7 = (objc_class *)objc_opt_class(a3);
  objc_msgSend(a1, "addPathForClass:", v7);
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), a3);
  v10[0] = CFSTR("layerDelegate");
  v11[0] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), objc_msgSend(a3, "delegate"));
  v10[1] = CFSTR("viewIdentifier");
  v11[1] = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p"), a4);
  v10[2] = CFSTR("class");
  v10[3] = CFSTR("address");
  v11[2] = NSStringFromClass(v7);
  v11[3] = v8;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
}

+ (id)appWindows
{
  return 0;
}

+ (id)windowContentViewForWindow:(id)a3
{
  return 0;
}

+ (id)additionalRootLevelViewsToArchive
{
  return 0;
}

+ (BOOL)isHiddenForWindow:(id)a3
{
  return 0;
}

+ (id)titleForWindow:(id)a3
{
  return &stru_38A98;
}

+ (double)screenBackingScaleForWindow:(id)a3
{
  return 1.0;
}

+ (double)screenBackingScaleForView:(id)a3
{
  return 1.0;
}

+ (id)snapshotView:(id)a3 errorString:(id *)a4
{
  return 0;
}

+ (id)snapshotMethodForView:(id)a3
{
  return 0;
}

+ (id)layerForView:(id)a3
{
  return 0;
}

+ (id)subviewsForView:(id)a3
{
  return 0;
}

+ (BOOL)isWindowSubclass:(id)a3
{
  return 0;
}

+ (BOOL)isViewSubclass:(id)a3
{
  return 0;
}

+ (id)displayNameForView:(id)a3
{
  return 0;
}

+ (id)primaryWindowFromWindows:(id)a3
{
  return 0;
}

+ (void)addViewLayerInfo:(id)a3 toDict:(id)a4
{
  id v7;
  void *v8;
  id v9;
  objc_class *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15[16];
  double v16[16];
  NSNumber *v17;
  NSNumber *v18;

  v7 = objc_msgSend(a1, "layerForView:");
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(a1, "_layerInfo:view:", v7, a3);
    if (v9)
      objc_msgSend(a4, "setObject:forKey:", v9, CFSTR("layer"));
    objc_msgSend(a4, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(objc_msgSend(objc_msgSend(v8, "superlayer"), "sublayers"), "indexOfObject:", v8)), CFSTR("layerIndex"));
    v10 = (objc_class *)objc_opt_class(v8);
    objc_msgSend(a4, "setObject:forKey:", NSStringFromClass(v10), CFSTR("layerClass"));
    objc_msgSend(a4, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "masksToBounds")), CFSTR("masksToBounds"));
    objc_msgSend(a4, "setObject:forKey:", __50__DBGViewDebuggerSupport_addViewLayerInfo_toDict___block_invoke((uint64_t)objc_msgSend(v8, "transform"), v16), CFSTR("transform"));
    objc_msgSend(a4, "setObject:forKey:", __50__DBGViewDebuggerSupport_addViewLayerInfo_toDict___block_invoke((uint64_t)objc_msgSend(v8, "sublayerTransform"), v15), CFSTR("sublayerTransform"));
    objc_msgSend(v8, "position");
    v12 = v11;
    v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12);
    objc_msgSend(a4, "setObject:forKey:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 2), CFSTR("position"));
    objc_msgSend(v8, "zPosition");
    objc_msgSend(a4, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("zPosition"));
    objc_msgSend(v8, "anchorPoint");
    v14 = v13;
    v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14);
    objc_msgSend(a4, "setObject:forKey:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 2), CFSTR("anchorPoint"));
    objc_msgSend(v8, "anchorPointZ");
    objc_msgSend(a4, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), CFSTR("anchorPointZ"));
    objc_msgSend(a4, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "isDoubleSided")), CFSTR("isDoubleSided"));
  }
}

NSArray *__50__DBGViewDebuggerSupport_addViewLayerInfo_toDict___block_invoke(uint64_t a1, double *a2)
{
  _QWORD v4[16];

  v4[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *a2);
  v4[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2[1]);
  v4[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2[2]);
  v4[3] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2[3]);
  v4[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2[4]);
  v4[5] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2[5]);
  v4[6] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2[6]);
  v4[7] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2[7]);
  v4[8] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2[8]);
  v4[9] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2[9]);
  v4[10] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2[10]);
  v4[11] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2[11]);
  v4[12] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2[12]);
  v4[13] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2[13]);
  v4[14] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2[14]);
  v4[15] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2[15]);
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 16);
}

+ (double)firstBaselineOffsetFromTopForView:(id)a3
{
  return 0.0;
}

+ (double)lastBaselineOffsetFromBottomForView:(id)a3
{
  return 0.0;
}

id __52__DBGViewDebuggerSupport_iOS_addFrameBasics_toDict___block_invoke(double a1, double a2, double a3, double a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v13[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a2));
  v13[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  v13[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  v13[3] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 4));

  return v11;
}

@end
