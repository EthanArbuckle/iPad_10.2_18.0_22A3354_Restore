@implementation THWControlContainerLayout

- (void)validate
{
  objc_super v3;

  -[THWControlContainerLayout invalidateFrame](self, "invalidateFrame");
  v3.receiver = self;
  v3.super_class = (Class)THWControlContainerLayout;
  -[THWControlContainerLayout validate](&v3, "validate");
}

- (unint64_t)tag
{
  return (unint64_t)objc_msgSend(-[THWControlContainerLayout info](self, "info"), "tag");
}

- (void)setTag:(unint64_t)a3
{
  objc_msgSend(-[THWControlContainerLayout info](self, "info"), "setTag:", a3);
}

- (unint64_t)index
{
  return (unint64_t)objc_msgSend(-[THWControlContainerLayout info](self, "info"), "index");
}

- (void)setIndex:(unint64_t)a3
{
  objc_msgSend(-[THWControlContainerLayout info](self, "info"), "setIndex:", a3);
}

- (id)childInfosForLayout
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_msgSend(-[THWControlContainerLayout info](self, "info"), "delegate");
  if ((objc_opt_respondsToSelector(v3, "controlContainerChildrenForLayout:") & 1) != 0)
  {
    v4 = objc_msgSend(v3, "controlContainerChildrenForLayout:", self);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v4);
          v10 = TSUProtocolCast(&OBJC_PROTOCOL___TSDInfo, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i));
          if (v10)
          {
            v11 = v10;
            if (!v7)
              v7 = +[NSMutableArray array](NSMutableArray, "array");
            objc_msgSend(v7, "addObject:", v11);
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
      return v7;
    }
  }
  else if ((objc_opt_respondsToSelector(v3, "controlContainerChildInfosForLayout:") & 1) != 0)
  {
    return objc_msgSend(v3, "controlContainerChildInfosForLayout:", self);
  }
  return 0;
}

- (id)wpLayoutParentForLayout:(id)a3
{
  id v5;

  v5 = objc_msgSend(-[THWControlContainerLayout info](self, "info"), "delegate");
  if ((objc_opt_respondsToSelector(v5, "controlContainer:wpLayoutParentForLayout:") & 1) != 0)
    return objc_msgSend(v5, "controlContainer:wpLayoutParentForLayout:", self, a3);
  else
    return 0;
}

- (id)additionalLayouts
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = objc_msgSend(-[THWControlContainerLayout info](self, "info"), "delegate");
  if ((objc_opt_respondsToSelector(v3, "controlContainerChildrenForLayout:") & 1) != 0)
  {
    v4 = objc_msgSend(v3, "controlContainerChildrenForLayout:", self);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v11 = objc_opt_class(TSDLayout);
          *(_QWORD *)&v13 = TSUDynamicCast(v11, v10).n128_u64[0];
          if (v12)
          {
            v14 = v12;
            if (!v7)
              v7 = +[NSMutableArray array](NSMutableArray, "array", v13);
            objc_msgSend(v7, "addObject:", v14, v13);
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16, v13);
      }
      while (v6);
      return v7;
    }
  }
  else if ((objc_opt_respondsToSelector(v3, "controlContainerAdditionalChildLayouts:") & 1) != 0)
  {
    return objc_msgSend(v3, "controlContainerAdditionalChildLayouts:", self);
  }
  return 0;
}

@end
