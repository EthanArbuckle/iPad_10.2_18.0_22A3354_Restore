@implementation MTLineCountLayoutGroup

- (MTLineCountLayoutGroup)initWithTotalLineCount:(unint64_t)a3
{
  MTLineCountLayoutGroup *v4;
  MTLineCountLayoutGroup *v5;
  NSArray *priorityOrderedItems;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLineCountLayoutGroup;
  v4 = -[MTLineCountLayoutGroup init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    priorityOrderedItems = v4->_priorityOrderedItems;
    v4->_totalLineCount = a3;
    v4->_priorityOrderedItems = (NSArray *)&__NSArray0__struct;

  }
  return v5;
}

- (void)addLabel:(id)a3 maxLineCount:(unint64_t)a4 sharingPriority:(int64_t)a5
{
  id v8;
  uint64_t v9;
  NSObject *v10;
  MTLineCountLayoutGroupItem *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *priorityOrderedItems;
  _DWORD v16[2];

  v8 = a3;
  if (-[MTLineCountLayoutGroup _hasLabelWithPriority:](self, "_hasLabelWithPriority:", a5))
  {
    v9 = _MTLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v16[0] = 67109120;
      v16[1] = a5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "A label with priority %d already exists", (uint8_t *)v16, 8u);
    }

  }
  v11 = objc_opt_new(MTLineCountLayoutGroupItem);
  -[MTLineCountLayoutGroupItem setLabel:](v11, "setLabel:", v8);

  -[MTLineCountLayoutGroupItem setMaxLineCount:](v11, "setMaxLineCount:", a4);
  -[MTLineCountLayoutGroupItem setSharingPriority:](v11, "setSharingPriority:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTLineCountLayoutGroup priorityOrderedItems](self, "priorityOrderedItems"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "arrayByAddingObject:", v11));
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sortedArrayUsingComparator:", &stru_100028D38));

  priorityOrderedItems = self->_priorityOrderedItems;
  self->_priorityOrderedItems = v14;

}

- (void)layout
{
  -[MTLineCountLayoutGroup layoutWithSize:](self, "layoutWithSize:", 0.0, 10000.0);
}

- (void)layoutWithSize:(CGSize)a3
{
  double height;
  double width;
  int64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  int64_t v17;
  id v18;
  int64_t v19;
  unint64_t v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  height = a3.height;
  width = a3.width;
  v6 = -[MTLineCountLayoutGroup totalLineCount](self, "totalLineCount");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTLineCountLayoutGroup priorityOrderedItems](self, "priorityOrderedItems", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "label"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "font"));
        objc_msgSend(v14, "lineHeight");
        v16 = v15;

        v17 = vcvtmd_u64_f64(height / v16);
        v18 = objc_msgSend(v12, "maxLineCount");
        if ((uint64_t)v18 >= v6)
          v19 = v6;
        else
          v19 = (int64_t)v18;
        if (v19 >= v17)
          v20 = v17;
        else
          v20 = v19;
        v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "label"));
        v22 = v21;
        if (v20)
        {
          v23 = width;
          if (width < 0.00000011920929)
          {
            objc_msgSend(v21, "bounds");
            v23 = v24;
          }
          objc_msgSend(v22, "setNumberOfLines:", 0);
          objc_msgSend(v22, "textRectForBounds:limitedToNumberOfLines:", v20, 0.0, 0.0, v23, 3.40282347e38);
          v26 = v25;
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "font"));
          objc_msgSend(v27, "lineHeight");
          v20 = 0;
          if (v26 > 0.0)
          {
            v29 = v28;
            objc_msgSend(v27, "lineHeight");
            v20 = vcvtad_u64_f64((v26 - v30) / v29) + 1;
          }

        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "label"));
        objc_msgSend(v31, "setNumberOfLines:", v20);

        v6 -= v20;
        height = height - (double)v20 * v16;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v9);
  }

}

- (BOOL)_hasLabelWithPriority:(int64_t)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTLineCountLayoutGroup priorityOrderedItems](self, "priorityOrderedItems", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "sharingPriority") == (id)a3)
        {
          v9 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (unint64_t)totalLineCount
{
  return self->_totalLineCount;
}

- (NSArray)priorityOrderedItems
{
  return self->_priorityOrderedItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priorityOrderedItems, 0);
}

@end
