@implementation RAPWorkflowLayoutManager

- (RAPWorkflowLayoutManager)initWithSupportedCategories:(id)a3
{
  id v4;
  RAPWorkflowLayoutManager *v5;
  NSArray *v6;
  NSArray *initialCategories;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPWorkflowLayoutManager;
  v5 = -[RAPWorkflowLayoutManager init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    initialCategories = v5->_initialCategories;
    v5->_initialCategories = v6;

    -[RAPWorkflowLayoutManager _initSubcategories](v5, "_initSubcategories");
  }

  return v5;
}

- (void)_initSubcategories
{
  NSMutableArray *v3;
  NSMutableArray *correctionLayoutItems;
  NSMutableArray *v5;
  NSMutableArray *addPlaceLayoutItems;
  NSArray *v7;
  NSArray *incidentLayoutItems;
  NSMutableArray *v9;
  NSMutableArray *otherLayoutItems;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  RAPLayoutItem *v17;
  unsigned __int8 v18;
  NSMutableArray **p_correctionLayoutItems;
  int64_t *v20;
  unsigned int v21;
  unsigned int v22;
  int64_t *p_clientSchoolCategory;
  int64_t *p_clientHomeCategory;
  int64_t *p_clientWorkCategory;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  p_clientHomeCategory = &self->_clientHomeCategory;
  self->_clientHomeCategory = 0;
  p_clientWorkCategory = &self->_clientWorkCategory;
  self->_clientWorkCategory = 0;
  p_clientSchoolCategory = &self->_clientSchoolCategory;
  self->_clientSchoolCategory = 0;
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  correctionLayoutItems = self->_correctionLayoutItems;
  self->_correctionLayoutItems = v3;

  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  addPlaceLayoutItems = self->_addPlaceLayoutItems;
  self->_addPlaceLayoutItems = v5;

  v7 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
  incidentLayoutItems = self->_incidentLayoutItems;
  self->_incidentLayoutItems = v7;

  v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  otherLayoutItems = self->_otherLayoutItems;
  self->_otherLayoutItems = v9;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = self->_initialCategories;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v17 = objc_alloc_init(RAPLayoutItem);
        -[RAPLayoutItem setFieldType:](v17, "setFieldType:", v16);
        v18 = -[RAPWorkflowLayoutManager _isCorrectionCategory:](self, "_isCorrectionCategory:", v16);
        p_correctionLayoutItems = &self->_correctionLayoutItems;
        if ((v18 & 1) == 0)
        {
          if (-[RAPWorkflowLayoutManager _isPersonalizedMapsCategory:](self, "_isPersonalizedMapsCategory:", v16))
          {
            if (-[RAPWorkflowLayoutManager _isHomeCorrectionsCategory:](self, "_isHomeCorrectionsCategory:", v16)
              && (v20 = p_clientHomeCategory, !*p_clientHomeCategory)
              || (v20 = p_clientWorkCategory,
                  -[RAPWorkflowLayoutManager _isWorkCorrectionsCategory:](self, "_isWorkCorrectionsCategory:", v16))
              || (v21 = -[RAPWorkflowLayoutManager _isSchoolCorrectionsCategory:](self, "_isSchoolCorrectionsCategory:", v16), v20 = p_clientSchoolCategory, p_correctionLayoutItems = &self->_addPlaceLayoutItems, v21))
            {
              *v20 = (int64_t)objc_msgSend(v16, "integerValue");
              p_correctionLayoutItems = &self->_addPlaceLayoutItems;
            }
          }
          else
          {
            v22 = -[RAPWorkflowLayoutManager _isOtherCategory:](self, "_isOtherCategory:", v16);
            p_correctionLayoutItems = &self->_otherLayoutItems;
            if (!v22)
              goto LABEL_15;
          }
        }
        -[NSMutableArray addObject:](*p_correctionLayoutItems, "addObject:", v17);
LABEL_15:

      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v13);
  }

}

- (BOOL)_shouldIncludeServerControlledField:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  v6 = objc_msgSend(v4, "enabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWorkflowLayoutManager _categoryForName:](self, "_categoryForName:", objc_msgSend(v7, "workflowFieldName")));
  v9 = objc_msgSend(v8, "isEqual:", &off_10126D018);

  if (v5 == 1)
    return v6 & (v9 ^ 1);
  else
    return 0;
}

- (void)mergeWithServerConfig:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  RAPLayoutItem *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  unsigned int v23;
  void *v24;
  NSMutableArray *v25;
  NSMutableArray *correctionLayoutItems;
  NSMutableArray *v27;
  NSMutableArray *addPlaceLayoutItems;
  NSMutableArray *v29;
  NSMutableArray *otherLayoutItems;
  id v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "layoutFields"));
  v5 = objc_alloc_init((Class)NSMutableArray);
  v33 = objc_alloc_init((Class)NSMutableArray);
  v31 = objc_alloc_init((Class)NSMutableArray);
  v32 = objc_alloc_init((Class)NSMutableSet);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        if (-[RAPWorkflowLayoutManager _shouldIncludeServerControlledField:](self, "_shouldIncludeServerControlledField:", v11))
        {
          v12 = objc_alloc_init(RAPLayoutItem);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWorkflowLayoutManager _categoryForName:](self, "_categoryForName:", objc_msgSend(v13, "workflowFieldName")));
          -[RAPLayoutItem setFieldType:](v12, "setFieldType:", v14);

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayText"));
          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayText"));
            -[RAPLayoutItem setDisplayText:](v12, "setDisplayText:", v16);

          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLayoutItem fieldType](v12, "fieldType"));
          v18 = -[RAPWorkflowLayoutManager _isCorrectionCategory:](self, "_isCorrectionCategory:", v17);

          v19 = v5;
          if ((v18 & 1) != 0)
            goto LABEL_12;
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLayoutItem fieldType](v12, "fieldType"));
          v21 = -[RAPWorkflowLayoutManager _isPersonalizedMapsCategory:](self, "_isPersonalizedMapsCategory:", v20);

          v19 = v33;
          if ((v21 & 1) != 0
            || (v22 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLayoutItem fieldType](v12, "fieldType")),
                v23 = -[RAPWorkflowLayoutManager _isOtherCategory:](self, "_isOtherCategory:", v22),
                v22,
                v19 = v31,
                v23))
          {
LABEL_12:
            objc_msgSend(v19, "addObject:", v12);
          }
        }
        else
        {
          if ((objc_msgSend(v11, "enabled") & 1) != 0)
            continue;
          v12 = (RAPLayoutItem *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWorkflowLayoutManager _categoryForName:](self, "_categoryForName:", -[RAPLayoutItem workflowFieldName](v12, "workflowFieldName")));
          objc_msgSend(v32, "addObject:", v24);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v8);
  }

  v25 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[RAPWorkflowLayoutManager _mergeOriginalItems:withServerOverrideItems:withServerDisabledItemTypes:](self, "_mergeOriginalItems:withServerOverrideItems:withServerDisabledItemTypes:", self->_correctionLayoutItems, v5, v32));
  correctionLayoutItems = self->_correctionLayoutItems;
  self->_correctionLayoutItems = v25;

  v27 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[RAPWorkflowLayoutManager _mergeOriginalItems:withServerOverrideItems:withServerDisabledItemTypes:](self, "_mergeOriginalItems:withServerOverrideItems:withServerDisabledItemTypes:", self->_addPlaceLayoutItems, v33, v32));
  addPlaceLayoutItems = self->_addPlaceLayoutItems;
  self->_addPlaceLayoutItems = v27;

  v29 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[RAPWorkflowLayoutManager _mergeOriginalItems:withServerOverrideItems:withServerDisabledItemTypes:](self, "_mergeOriginalItems:withServerOverrideItems:withServerDisabledItemTypes:", self->_otherLayoutItems, v31, v32));
  otherLayoutItems = self->_otherLayoutItems;
  self->_otherLayoutItems = v29;

}

- (id)_mergeOriginalItems:(id)a3 withServerOverrideItems:(id)a4 withServerDisabledItemTypes:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init((Class)NSMutableDictionary);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fieldType"));
        objc_msgSend(v10, "setObject:forKey:", v16, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v13);
  }

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1003D4C94;
  v39[3] = &unk_1011B4798;
  v33 = v9;
  v40 = v33;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v39));
  v34 = v7;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "filteredArrayUsingPredicate:", v18));

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v36 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "fieldType"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v26));

        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "displayText"));
          v29 = objc_msgSend(v28, "length");

          if (v29)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "displayText"));
            objc_msgSend(v25, "setDisplayText:", v30);

          }
        }

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v22);
  }

  v31 = objc_msgSend(v20, "mutableCopy");
  return v31;
}

- (void)mergeWithTrafficIncidentsLayout:(id)a3
{
  objc_storeStrong((id *)&self->_incidentLayoutItems, a3);
}

- (BOOL)_isCorrectionCategory:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_101273188));
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (BOOL)_isPersonalizedMapsCategory:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[RAPWorkflowLayoutManager _isHomeCorrectionsCategory:](self, "_isHomeCorrectionsCategory:", v4)
    || -[RAPWorkflowLayoutManager _isWorkCorrectionsCategory:](self, "_isWorkCorrectionsCategory:", v4))
  {
    v5 = 1;
  }
  else
  {
    v5 = -[RAPWorkflowLayoutManager _isSchoolCorrectionsCategory:](self, "_isSchoolCorrectionsCategory:", v4);
  }

  return v5;
}

- (BOOL)_isHomeCorrectionsCategory:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_1012731A0));
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (BOOL)_isWorkCorrectionsCategory:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_1012731B8));
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (BOOL)_isSchoolCorrectionsCategory:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_1012731D0));
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (BOOL)_isOtherCategory:(id)a3
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_1012731E8));
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (id)_categoryForName:(int)a3
{
  _UNKNOWN **v4;
  id result;
  uint64_t v6;

  v4 = &off_10126D108;
  switch(a3)
  {
    case 0:
    case 9:
      goto LABEL_9;
    case 1:
      return &off_10126D030;
    case 2:
      return &off_10126D048;
    case 3:
      return &off_10126D060;
    case 7:
      v6 = 16;
      goto LABEL_8;
    case 8:
      v6 = 24;
LABEL_8:
      v4 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(Class *)((char *)&self->super.super.isa + v6)));
LABEL_9:
      result = v4;
      break;
    default:
      result = &off_10126D018;
      break;
  }
  return result;
}

- (NSArray)correctionLayoutItems
{
  return (NSArray *)-[NSMutableArray copy](self->_correctionLayoutItems, "copy");
}

- (NSArray)addPlaceLayoutItems
{
  return (NSArray *)-[NSMutableArray copy](self->_addPlaceLayoutItems, "copy");
}

- (id)addIncidentLayoutItems
{
  return -[NSArray copy](self->_incidentLayoutItems, "copy");
}

- (NSArray)otherLayoutItems
{
  return (NSArray *)-[NSMutableArray copy](self->_otherLayoutItems, "copy");
}

- (NSArray)incidentLayoutItems
{
  return self->_incidentLayoutItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherLayoutItems, 0);
  objc_storeStrong((id *)&self->_incidentLayoutItems, 0);
  objc_storeStrong((id *)&self->_addPlaceLayoutItems, 0);
  objc_storeStrong((id *)&self->_correctionLayoutItems, 0);
  objc_storeStrong((id *)&self->_initialCategories, 0);
}

@end
