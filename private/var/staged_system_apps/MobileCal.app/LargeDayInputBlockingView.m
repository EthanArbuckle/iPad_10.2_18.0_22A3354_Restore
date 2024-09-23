@implementation LargeDayInputBlockingView

- (id)description
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];

  v3 = objc_alloc_init((Class)NSMutableString);
  v18.receiver = self;
  v18.super_class = (Class)LargeDayInputBlockingView;
  v4 = -[LargeDayInputBlockingView description](&v18, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayInputBlockingView passthroughViews](self, "passthroughViews"));
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tPassthrough views:"));
  if (v7)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v3, "appendFormat:", CFSTR("\n\t[%@]"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12));
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v10);
    }

  }
  else
  {
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\tNone"));
  }

  return v3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  CGPoint v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[LargeDayInputBlockingView passthroughViews](self, "passthroughViews", a4, 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "bounds");
        -[LargeDayInputBlockingView convertRect:fromView:](self, "convertRect:fromView:", v12);
        v20.x = x;
        v20.y = y;
        if (CGRectContainsPoint(v21, v20))
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (NSArray)passthroughViews
{
  return self->_passthroughViews;
}

- (void)setPassthroughViews:(id)a3
{
  objc_storeStrong((id *)&self->_passthroughViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passthroughViews, 0);
}

@end
