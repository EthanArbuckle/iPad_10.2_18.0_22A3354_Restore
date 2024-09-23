@implementation DynamicTypeWizard

+ (void)autorefreshLabel:(id)a3 withFontProvider:(id)a4
{
  uint64_t (*v6)(id);
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  if (a4)
  {
    v6 = (uint64_t (*)(id))*((_QWORD *)a4 + 2);
    v7 = a4;
    v8 = a3;
    v9 = v6(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    objc_msgSend(v8, "setFont:", v10);

    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_singletonInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "labelToFontMap"));
    v12 = objc_retainBlock(v7);

    objc_msgSend(v11, "setObject:forKey:", v12, v8);
  }
}

+ (id)autoscaledConstraint:(id)a3 constant:(double)a4 withFontProvider:(id)a5
{
  id v8;
  id v9;
  DynamicTypeValue *v10;
  void *v11;
  void *v12;

  v8 = a3;
  if (a5)
  {
    v9 = a5;
    v10 = objc_alloc_init(DynamicTypeValue);
    -[DynamicTypeValue setUnscaledValue:](v10, "setUnscaledValue:", a4);
    -[DynamicTypeValue setFontProvider:](v10, "setFontProvider:", v9);

    sub_100BA5728(v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_singletonInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintToValueMap"));
    objc_msgSend(v12, "setObject:forKey:", v10, v8);

  }
  return v8;
}

+ (void)updateUnscaledConstantValue:(double)a3 fontProvider:(id)a4 forConstraint:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_singletonInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintToValueMap"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v8));

  if (v11)
  {
    objc_msgSend(v11, "setUnscaledValue:", a3);
    objc_msgSend(v11, "setFontProvider:", v12);
    sub_100BA5728(v8, v11);
  }

}

+ (void)autoscaleStackView:(id)a3 spacing:(double)a4 withFontProvider:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  DynamicTypeValue *v14;

  if (a5)
  {
    v8 = a5;
    v9 = a3;
    v14 = objc_alloc_init(DynamicTypeValue);
    -[DynamicTypeValue setUnscaledValue:](v14, "setUnscaledValue:", a4);
    -[DynamicTypeValue setFontProvider:](v14, "setFontProvider:", v8);

    -[DynamicTypeValue scaledValue](v14, "scaledValue");
    objc_msgSend(v9, "setSpacing:", UIRoundToViewScale(v9, v10, v11));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_singletonInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stackToValueMap"));
    objc_msgSend(v13, "setObject:forKey:", v14, v9);

  }
}

+ (void)stopAutoscalingStackView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_singletonInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stackToValueMap"));
    objc_msgSend(v5, "removeObjectForKey:", v4);

  }
}

+ (void)makeObject:(id)a3 performSelector:(SEL)a4 whenSizeCategoryChangesWithOrder:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_singletonInstance"));
  if ((objc_opt_respondsToSelector(v14, a4) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectToSelectorStringMaps"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a5));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v10));
    v12 = NSStringFromSelector(a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v11, "setObject:forKey:", v13, v14);

  }
}

+ (void)unregisterObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_singletonInstance"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(&off_1012742F8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(&off_1012742F8);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectToSelectorStringMaps"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));
        objc_msgSend(v12, "removeObjectForKey:", v4);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(&off_1012742F8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

+ (id)_singletonInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100BA5C94;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D42E0 != -1)
    dispatch_once(&qword_1014D42E0, block);
  return (id)qword_1014D42D8;
}

- (DynamicTypeWizard)init
{
  DynamicTypeWizard *v2;
  uint64_t v3;
  NSMapTable *labelToFontMap;
  uint64_t v5;
  NSMapTable *constraintToValueMap;
  uint64_t v7;
  NSMapTable *stackToValueMap;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDictionary *objectToSelectorStringMaps;
  void *v18;
  DynamicTypeWizard *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];

  v25.receiver = self;
  v25.super_class = (Class)DynamicTypeWizard;
  v2 = -[DynamicTypeWizard init](&v25, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    labelToFontMap = v2->_labelToFontMap;
    v2->_labelToFontMap = (NSMapTable *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    constraintToValueMap = v2->_constraintToValueMap;
    v2->_constraintToValueMap = (NSMapTable *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    stackToValueMap = v2->_stackToValueMap;
    v2->_stackToValueMap = (NSMapTable *)v7;

    v9 = objc_alloc_init((Class)NSMutableDictionary);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = objc_msgSend(&off_101274310, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(&off_101274310);
          v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v14);

          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = objc_msgSend(&off_101274310, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v11);
    }
    v16 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v9));
    objectToSelectorStringMaps = v2->_objectToSelectorStringMaps;
    v2->_objectToSelectorStringMaps = (NSDictionary *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "addObserver:selector:name:object:", v2, "_contentSizeCategoryDidChange", UIContentSizeCategoryDidChangeNotification, 0);

    v19 = v2;
  }

  return v2;
}

- (void)_contentSizeCategoryDidChange
{
  NSDictionary *objectToSelectorStringMaps;
  void *v4;
  void *v5;
  NSMapTable *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSDictionary *v16;
  void *v17;
  void *v18;
  NSMapTable *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  NSMapTable *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *k;
  void *v31;
  void *v32;
  uint64_t v33;
  double v34;
  NSDictionary *v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];

  objectToSelectorStringMaps = self->_objectToSelectorStringMaps;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](objectToSelectorStringMaps, "objectForKeyedSubscript:", v4));

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v6 = self->_labelToFontMap;
  v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v12 = objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_labelToFontMap, "objectForKey:", v11));
        v13 = (void *)v12;
        if (v12)
        {
          v14 = (*(uint64_t (**)(uint64_t))(v12 + 16))(v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          objc_msgSend(v11, "setFont:", v15);

        }
      }
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v8);
  }

  sub_100BA6208(v5);
  v16 = self->_objectToSelectorStringMaps;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v17));

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v19 = self->_constraintToValueMap;
  v20 = -[NSMapTable countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v43;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v43 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_constraintToValueMap, "objectForKey:", v24));
        sub_100BA5728(v24, v25);

      }
      v21 = -[NSMapTable countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v21);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v26 = self->_stackToValueMap;
  v27 = -[NSMapTable countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v39;
    do
    {
      for (k = 0; k != v28; k = (char *)k + 1)
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)k);
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_stackToValueMap, "objectForKey:", v31, (_QWORD)v38));
        objc_msgSend(v32, "scaledValue");
        objc_msgSend(v31, "setSpacing:", UIRoundToViewScale(v31, v33, v34));

      }
      v28 = -[NSMapTable countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v28);
  }

  sub_100BA6208(v18);
  v35 = self->_objectToSelectorStringMaps;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 2));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v35, "objectForKeyedSubscript:", v36));

  sub_100BA6208(v37);
}

- (NSMapTable)labelToFontMap
{
  return self->_labelToFontMap;
}

- (void)setLabelToFontMap:(id)a3
{
  objc_storeStrong((id *)&self->_labelToFontMap, a3);
}

- (NSMapTable)constraintToValueMap
{
  return self->_constraintToValueMap;
}

- (void)setConstraintToValueMap:(id)a3
{
  objc_storeStrong((id *)&self->_constraintToValueMap, a3);
}

- (NSMapTable)stackToValueMap
{
  return self->_stackToValueMap;
}

- (void)setStackToValueMap:(id)a3
{
  objc_storeStrong((id *)&self->_stackToValueMap, a3);
}

- (NSDictionary)objectToSelectorStringMaps
{
  return self->_objectToSelectorStringMaps;
}

- (void)setObjectToSelectorStringMaps:(id)a3
{
  objc_storeStrong((id *)&self->_objectToSelectorStringMaps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectToSelectorStringMaps, 0);
  objc_storeStrong((id *)&self->_stackToValueMap, 0);
  objc_storeStrong((id *)&self->_constraintToValueMap, 0);
  objc_storeStrong((id *)&self->_labelToFontMap, 0);
}

@end
