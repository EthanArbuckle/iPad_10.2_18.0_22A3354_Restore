@implementation UITableView

- (BOOL)hasRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  BOOL v8;

  v4 = a3;
  v5 = v4;
  v8 = 0;
  if (v4)
  {
    if (((unint64_t)objc_msgSend(v4, "section") & 0x8000000000000000) == 0
      && ((unint64_t)objc_msgSend(v5, "row") & 0x8000000000000000) == 0)
    {
      v6 = objc_msgSend(v5, "section");
      if ((uint64_t)v6 < -[UITableView numberOfSections](self, "numberOfSections"))
      {
        v7 = objc_msgSend(v5, "row");
        if ((uint64_t)v7 < -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", objc_msgSend(v5, "section")))v8 = 1;
      }
    }
  }

  return v8;
}

- (BOOL)hasRowsInSectionAtIndex:(int64_t)a3
{
  return -[UITableView numberOfSections](self, "numberOfSections") > a3
      && -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", a3) > 0;
}

- (BOOL)canFocusRowAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  if (-[UITableView hasRowAtIndexPath:](self, "hasRowAtIndexPath:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView delegate](self, "delegate"));
    v6 = objc_opt_respondsToSelector(v5, "tableView:canFocusRowAtIndexPath:");

    if ((v6 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView delegate](self, "delegate"));
      v8 = objc_msgSend(v7, "tableView:canFocusRowAtIndexPath:", self, v4);

    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)indexPathForFirstRow
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = -[UITableView numberOfSections](self, "numberOfSections");
  if (v3 < 1)
  {
LABEL_5:
    v6 = 0;
  }
  else
  {
    v4 = v3;
    v5 = 0;
    while (-[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", v5) < 1)
    {
      if (v4 == ++v5)
        goto LABEL_5;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, v5));
  }
  return v6;
}

- (id)indexPathForLastRow
{
  void *v3;
  uint64_t v4;
  uint64_t v6;

  v3 = -[UITableView numberOfSections](self, "numberOfSections");
  if (v3)
  {
    v4 = (uint64_t)v3;
    while (v4-- >= 1)
    {
      v6 = -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", v4);
      if (v6 >= 1)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6 - 1, v4));
        return v3;
      }
    }
    v3 = 0;
  }
  return v3;
}

- (id)indexPathForFirstRowInSection:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, a3));
  if (!-[UITableView hasRowAtIndexPath:](self, "hasRowAtIndexPath:", v4))
  {

    v4 = 0;
  }
  return v4;
}

- (id)indexPathForLastRowInSection:(int64_t)a3
{
  void *v5;

  if (-[UITableView hasRowsInSectionAtIndex:](self, "hasRowsInSectionAtIndex:"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)-[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", a3) - 1, a3));
  else
    v5 = 0;
  return v5;
}

- (id)indexPathForFirstFocusableRow
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (-[UITableView numberOfSections](self, "numberOfSections") < 1)
  {
LABEL_10:
    v5 = 0;
  }
  else
  {
    v3 = 0;
    while (1)
    {
      if (-[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", v3) >= 1)
      {
        v4 = 0;
        while (1)
        {
          v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v4, v3));
          if (-[UITableView canFocusRowAtIndexPath:](self, "canFocusRowAtIndexPath:", v5))
            break;

          if (++v4 >= -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", v3))
            goto LABEL_9;
        }
        if (v5)
          break;
      }
LABEL_9:
      if (++v3 >= -[UITableView numberOfSections](self, "numberOfSections"))
        goto LABEL_10;
    }
  }
  return v5;
}

- (id)indexPathForRowBeforeIndexPath:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  uint64_t v7;

  v4 = a3;
  if (-[UITableView numberOfSections](self, "numberOfSections"))
  {
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v4, "row") - 1, objc_msgSend(v4, "section")));
      if (!-[UITableView hasRowAtIndexPath:](self, "hasRowAtIndexPath:", v5))
      {
        v6 = (char *)objc_msgSend(v4, "section") + 1;
        while ((uint64_t)--v6 >= 1)
        {
          v7 = objc_claimAutoreleasedReturnValue(-[UITableView indexPathForLastRowInSection:](self, "indexPathForLastRowInSection:", objc_msgSend(v4, "section")));

          v5 = 0;
          if (v7)
          {
            v5 = (void *)v7;
            break;
          }
        }
      }
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForFirstRow](self, "indexPathForFirstRow"));
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)indexPathForFocusableRowBeforeIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  if (v4
    && -[UITableView numberOfSections](self, "numberOfSections")
    && (v5 = (unint64_t)objc_msgSend(v4, "section"), (v5 & 0x8000000000000000) == 0))
  {
    v6 = (char *)v5;
    while (v6 == objc_msgSend(v4, "section"))
    {
      v7 = (uint64_t)objc_msgSend(v4, "row");
      v8 = v7 - 1;
      if (v7 >= 1)
        goto LABEL_9;
LABEL_12:
      v9 = 0;
      v10 = (uint64_t)v6-- <= 0;
      if (v10)
        goto LABEL_16;
    }
    v8 = 0;
LABEL_9:
    while (1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v8, v6));
      if (-[UITableView canFocusRowAtIndexPath:](self, "canFocusRowAtIndexPath:", v9))
        break;

      v10 = v8-- <= 0;
      if (v10)
        goto LABEL_12;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_16:

  return v9;
}

- (id)indexPathForRowAfterIndexPath:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  uint64_t v7;

  v4 = a3;
  if (-[UITableView numberOfSections](self, "numberOfSections"))
  {
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v4, "row") + 1, objc_msgSend(v4, "section")));
      if (!-[UITableView hasRowAtIndexPath:](self, "hasRowAtIndexPath:", v5))
      {
        v6 = (char *)objc_msgSend(v4, "section") + 1;
        while ((uint64_t)v6 < -[UITableView numberOfSections](self, "numberOfSections"))
        {
          v7 = objc_claimAutoreleasedReturnValue(-[UITableView indexPathForFirstRowInSection:](self, "indexPathForFirstRowInSection:", v6));

          v5 = 0;
          ++v6;
          if (v7)
          {
            v5 = (void *)v7;
            break;
          }
        }
      }
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForFirstRow](self, "indexPathForFirstRow"));
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)indexPathForFocusableRowAfterIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  char *v6;
  char *v7;
  NSInteger v8;
  char *v9;
  void *v10;

  v4 = a3;
  if (v4
    && (v5 = -[UITableView numberOfSections](self, "numberOfSections"), (uint64_t)objc_msgSend(v4, "section") < v5)
    && (v6 = (char *)objc_msgSend(v4, "section"), (uint64_t)v6 < v5))
  {
    v7 = v6;
    while (1)
    {
      v8 = -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", v7);
      v9 = v7 == objc_msgSend(v4, "section") ? (char *)objc_msgSend(v4, "row") + 1 : 0;
      if ((uint64_t)v9 < v8)
        break;
LABEL_11:
      v10 = 0;
      if (++v7 == (char *)v5)
        goto LABEL_14;
    }
    while (1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v9, v7));
      if (-[UITableView canFocusRowAtIndexPath:](self, "canFocusRowAtIndexPath:", v10))
        break;

      if ((char *)v8 == ++v9)
        goto LABEL_11;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_14:

  return v10;
}

- (id)indexPathForClosestRowToIndexPath:(id)a3
{
  return -[UITableView _indexPathForClosestRowToIndexPath:focusable:](self, "_indexPathForClosestRowToIndexPath:focusable:", a3, 0);
}

- (id)indexPathForClosestFocusableRowToIndexPath:(id)a3
{
  return -[UITableView _indexPathForClosestRowToIndexPath:focusable:](self, "_indexPathForClosestRowToIndexPath:focusable:", a3, 1);
}

- (id)distanceFromIndexPath:(id)a3 toIndexPath:(id)a4
{
  void *v5;
  id v7;
  id v8;
  _BYTE *v9;
  _BYTE *v10;
  int64_t v11;
  unint64_t v12;

  v5 = 0;
  if (a3 && a4)
  {
    v7 = a4;
    v8 = a3;
    v9 = objc_msgSend(v7, "section");
    v10 = objc_msgSend(v8, "section");
    if (v9 - v10 >= 0)
      v11 = v9 - v10;
    else
      v11 = v10 - v9;
    v12 = -[UITableView numberOfRowsFromIndexPath:toFromIndexPath:](self, "numberOfRowsFromIndexPath:toFromIndexPath:", v8, v7);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v12, v11));
  }
  return v5;
}

- (unint64_t)numberOfRowsFromIndexPath:(id)a3 toFromIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  id v19;
  id v20;
  _BYTE *v21;
  char *v22;
  NSInteger v23;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = objc_msgSend(v6, "compare:", v7);
    v10 = v6;
    v11 = v8;
    if (v9 != (id)-1)
    {
      if (v9 != (id)1)
      {
        v15 = 0;
        v12 = 0;
        v13 = 0;
        goto LABEL_23;
      }
      v10 = v8;
      v11 = v6;
    }
    v12 = v10;
    v13 = v11;
    v14 = (char *)objc_msgSend(v12, "section");
    if ((uint64_t)v14 > (uint64_t)objc_msgSend(v13, "section"))
    {
      v15 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v15 = 0;
    while (1)
    {
      if (-[UITableView hasRowsInSectionAtIndex:](self, "hasRowsInSectionAtIndex:", v14))
      {
        v16 = (char *)objc_msgSend(v13, "section");
        v17 = (char *)objc_msgSend(v12, "section");
        v18 = v17;
        if (v14 == v16)
        {
          v19 = objc_msgSend(v13, "row");
          v20 = v19;
          if (v14 != v18)
          {
            v15 = &v15[(_QWORD)v19];
            goto LABEL_22;
          }
          v21 = objc_msgSend(v12, "row");
          v22 = &v15[(_QWORD)v20];
        }
        else
        {
          if (v14 != v17)
          {
            v15 = &v15[-[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", v14)];
            goto LABEL_22;
          }
          v23 = -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", objc_msgSend(v12, "section"));
          v21 = objc_msgSend(v12, "row");
          v22 = &v15[v23];
        }
        v15 = (char *)(v22 - v21);
      }
LABEL_22:
      if ((uint64_t)v14++ >= (uint64_t)objc_msgSend(v13, "section"))
        goto LABEL_23;
    }
  }
  if (v6)
    v7 = v6;
  v15 = (char *)objc_msgSend(v7, "row");
LABEL_24:

  return (unint64_t)v15;
}

- (id)_indexPathForClosestRowToIndexPath:(id)a3 focusable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  id v12;
  int v13;
  id v14;
  int v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v22;
  void *v23;
  id v24;
  void *v25;

  v4 = a4;
  v6 = a3;
  if (!-[UITableView _hasRowAtIndexPath:focusable:](self, "_hasRowAtIndexPath:focusable:", v6, v4))
  {
    v8 = objc_claimAutoreleasedReturnValue(-[UITableView _indexPathForRowBeforeIndexPath:focusable:](self, "_indexPathForRowBeforeIndexPath:focusable:", v6, v4));
    v9 = objc_claimAutoreleasedReturnValue(-[UITableView _indexPathForRowAfterIndexPath:focusable:](self, "_indexPathForRowAfterIndexPath:focusable:", v6, v4));
    v10 = (void *)v9;
    if (!(v9 | v8))
    {
      v7 = 0;
LABEL_20:

      goto LABEL_21;
    }
    if ((v8 != 0) != (v9 != 0))
    {
      v11 = v9 == 0;
LABEL_16:
      if (v11)
        v20 = (void *)v8;
      else
        v20 = v10;
      v7 = v20;
      goto LABEL_20;
    }
    if (v9)
    {
      v12 = objc_msgSend((id)v9, "section");
      v13 = v12 == objc_msgSend(v6, "section");
      if (v8)
      {
LABEL_9:
        v14 = objc_msgSend((id)v8, "section");
        v15 = v14 == objc_msgSend(v6, "section");
        goto LABEL_12;
      }
    }
    else
    {
      v13 = 0;
      if (v8)
        goto LABEL_9;
    }
    v15 = 0;
LABEL_12:
    if (v15 == v13)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathsForVisibleRows](self, "indexPathsForVisibleRows"));
      v17 = objc_msgSend(v16, "containsObject:", v10);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathsForVisibleRows](self, "indexPathsForVisibleRows"));
      v19 = objc_msgSend(v18, "containsObject:", v8);

      if (v17 == v19)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView distanceFromIndexPath:toIndexPath:](self, "distanceFromIndexPath:toIndexPath:", v6, v8));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView distanceFromIndexPath:toIndexPath:](self, "distanceFromIndexPath:toIndexPath:", v6, v10));
        v24 = objc_msgSend(v23, "row");
        if ((uint64_t)v24 >= (uint64_t)objc_msgSend(v22, "row"))
          v25 = (void *)v8;
        else
          v25 = v10;
        v7 = v25;

        goto LABEL_20;
      }
      v11 = v17 == 0;
    }
    else
    {
      v11 = v13 == 0;
    }
    goto LABEL_16;
  }
  v7 = v6;
LABEL_21:

  return v7;
}

- (id)_indexPathForRowAfterIndexPath:(id)a3 focusable:(BOOL)a4
{
  void *v4;

  if (a4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForFocusableRowAfterIndexPath:](self, "indexPathForFocusableRowAfterIndexPath:", a3));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForRowAfterIndexPath:](self, "indexPathForRowAfterIndexPath:", a3));
  return v4;
}

- (id)_indexPathForRowBeforeIndexPath:(id)a3 focusable:(BOOL)a4
{
  void *v4;

  if (a4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForFocusableRowBeforeIndexPath:](self, "indexPathForFocusableRowBeforeIndexPath:", a3));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForRowBeforeIndexPath:](self, "indexPathForRowBeforeIndexPath:", a3));
  return v4;
}

- (BOOL)_hasRowAtIndexPath:(id)a3 focusable:(BOOL)a4
{
  if (a4)
    return -[UITableView canFocusRowAtIndexPath:](self, "canFocusRowAtIndexPath:", a3);
  else
    return -[UITableView hasRowAtIndexPath:](self, "hasRowAtIndexPath:", a3);
}

@end
