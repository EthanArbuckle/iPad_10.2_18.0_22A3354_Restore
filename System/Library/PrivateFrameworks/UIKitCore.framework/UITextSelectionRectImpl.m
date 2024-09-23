@implementation UITextSelectionRectImpl

- (UITextSelectionRectImpl)initWithWebRect:(id)a3
{
  id v4;
  UITextSelectionRectImpl *v5;
  UITextSelectionRectImpl *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITextSelectionRectImpl;
  v5 = -[UITextSelectionRectImpl init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[UITextSelectionRectImpl setWebRect:](v5, "setWebRect:", v4);

  return v6;
}

+ (id)rectWithWebRect:(id)a3
{
  id v3;
  UITextSelectionRectImpl *v4;

  v3 = a3;
  v4 = -[UITextSelectionRectImpl initWithWebRect:]([UITextSelectionRectImpl alloc], "initWithWebRect:", v3);

  return v4;
}

+ (id)rectsWithWebRects:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        +[UITextSelectionRectImpl rectWithWebRect:](UITextSelectionRectImpl, "rectWithWebRect:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (CGRect)rect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[UITextSelectionRectImpl webRect](self, "webRect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (int64_t)writingDirection
{
  void *v2;
  int64_t v3;

  -[UITextSelectionRectImpl webRect](self, "webRect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "writingDirection");

  return v3;
}

- (id)range
{
  return 0;
}

- (BOOL)containsStart
{
  void *v2;
  char v3;

  -[UITextSelectionRectImpl webRect](self, "webRect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsStart");

  return v3;
}

- (BOOL)containsEnd
{
  void *v2;
  char v3;

  -[UITextSelectionRectImpl webRect](self, "webRect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsEnd");

  return v3;
}

- (BOOL)isVertical
{
  void *v2;
  char v3;

  -[UITextSelectionRectImpl webRect](self, "webRect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHorizontal") ^ 1;

  return v3;
}

- (WebSelectionRect)webRect
{
  return self->webRect;
}

- (void)setWebRect:(id)a3
{
  objc_storeStrong((id *)&self->webRect, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->webRect, 0);
}

@end
