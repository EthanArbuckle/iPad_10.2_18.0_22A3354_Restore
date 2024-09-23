@implementation ChildItemsViewModel

- (ChildItemsViewModel)initWithChildItems:(id)a3 childItemsSpacing:(double)a4 font:(id)a5 maxWidth:(double)a6 buttonContentEdgeInsets:(UIEdgeInsets)a7
{
  double right;
  double bottom;
  double left;
  double top;
  id v15;
  id v16;
  ChildItemsViewModel *v17;
  NSArray *v18;
  NSArray *childItems;
  objc_super v21;

  right = a7.right;
  bottom = a7.bottom;
  left = a7.left;
  top = a7.top;
  v15 = a3;
  v16 = a5;
  v21.receiver = self;
  v21.super_class = (Class)ChildItemsViewModel;
  v17 = -[ChildItemsViewModel init](&v21, "init");
  if (v17)
  {
    v18 = (NSArray *)objc_msgSend(v15, "copy");
    childItems = v17->_childItems;
    v17->_childItems = v18;

    -[ChildItemsViewModel calculateModelWithChildItemsSpacing:font:maxWidth:buttonContentEdgeInsets:](v17, "calculateModelWithChildItemsSpacing:font:maxWidth:buttonContentEdgeInsets:", v16, a4, a6, top, left, bottom, right);
  }

  return v17;
}

- (unint64_t)childItemsCount
{
  return -[NSArray count](self->_childItems, "count");
}

- (void)calculateModelWithChildItemsSpacing:(double)a3 font:(id)a4 maxWidth:(double)a5 buttonContentEdgeInsets:(UIEdgeInsets)a6
{
  double right;
  double left;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  double v23;
  void *j;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  unint64_t v30;
  unint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  NSAttributedStringKey v40;
  id v41;
  _BYTE v42[128];
  _BYTE v43[128];

  right = a6.right;
  left = a6.left;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", -[ChildItemsViewModel childItemsCount](self, "childItemsCount")));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ChildItemsViewModel childItems](self, "childItems"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[ChildItemButton buttonTitleWithChildItem:](ChildItemButton, "buttonTitleWithChildItem:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i)));
        if (v18)
          objc_msgSend(v12, "addObject:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    }
    while (v15);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v19 = v12;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    v23 = 0.0;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        v25 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j);
        v40 = NSFontAttributeName;
        v41 = v11;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1, (_QWORD)v32));
        objc_msgSend(v25, "sizeWithAttributes:", v26);
        v28 = ceil(v27);

        if (v23 <= v28)
          v23 = v28;
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v21);
  }
  else
  {
    v23 = 0.0;
  }

  v29 = left + right + v23;
  if (((id)-[ChildItemsViewModel childItemsCount](self, "childItemsCount") == (id)3
     || (id)-[ChildItemsViewModel childItemsCount](self, "childItemsCount") == (id)5
     || (id)-[ChildItemsViewModel childItemsCount](self, "childItemsCount") == (id)6)
    && a3 + a3 + v29 * 3.0 < a5)
  {
    -[ChildItemsViewModel setNumberOfColumns:](self, "setNumberOfColumns:", 3);
    if (-[ChildItemsViewModel childItemsCount](self, "childItemsCount") <= 3)
      v30 = 1;
    else
      v30 = 2;
  }
  else if ((-[ChildItemsViewModel childItemsCount](self, "childItemsCount", (_QWORD)v32) & 1) != 0
         || a3 + v29 * 2.0 >= a5)
  {
    -[ChildItemsViewModel setNumberOfColumns:](self, "setNumberOfColumns:", 1);
    v30 = -[ChildItemsViewModel childItemsCount](self, "childItemsCount");
  }
  else
  {
    -[ChildItemsViewModel setNumberOfColumns:](self, "setNumberOfColumns:", 2);
    v31 = -[ChildItemsViewModel childItemsCount](self, "childItemsCount");
    v30 = (-[ChildItemsViewModel childItemsCount](self, "childItemsCount") & 1) + (v31 >> 1);
  }
  -[ChildItemsViewModel setNumberOfRows:](self, "setNumberOfRows:", v30, (_QWORD)v32);

}

- (BOOL)isEqual:(id)a3
{
  ChildItemsViewModel *v4;
  uint64_t v5;
  ChildItemsViewModel *v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;

  v4 = (ChildItemsViewModel *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    v5 = objc_opt_class(ChildItemsViewModel);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = -[ChildItemsViewModel numberOfRows](self, "numberOfRows");
      if (v7 == (id)-[ChildItemsViewModel numberOfRows](v6, "numberOfRows")
        && (v8 = -[ChildItemsViewModel numberOfColumns](self, "numberOfColumns"),
            v8 == (id)-[ChildItemsViewModel numberOfColumns](v6, "numberOfColumns")))
      {
        v9 = -[ChildItemsViewModel childItemsCount](self, "childItemsCount");
        v10 = v9 == (id)-[ChildItemsViewModel childItemsCount](v6, "childItemsCount");
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSArray)childItems
{
  return self->_childItems;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (void)setNumberOfRows:(unint64_t)a3
{
  self->_numberOfRows = a3;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (void)setNumberOfColumns:(unint64_t)a3
{
  self->_numberOfColumns = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childItems, 0);
}

@end
