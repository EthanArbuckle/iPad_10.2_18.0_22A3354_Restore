@implementation UITextSelectionRect

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyTransform, 0);
}

- (id)mutableCopy
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _OWORD v16[6];

  -[UITextSelectionRect rect](self, "rect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIMutableTextSelectionRect selectionRectWithRect:fromView:](_UIMutableTextSelectionRect, "selectionRectWithRect:fromView:", v11, v4, v6, v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_setDrawsOwnHighlight:", -[UITextSelectionRect _drawsOwnHighlight](self, "_drawsOwnHighlight"));
  -[UITextSelectionRect _customHandleInfo](self, "_customHandleInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "set_customHandleInfo:", v13);

  objc_msgSend(v12, "setWritingDirection:", -[UITextSelectionRect writingDirection](self, "writingDirection"));
  objc_msgSend(v12, "setContainsStart:", -[UITextSelectionRect containsStart](self, "containsStart"));
  objc_msgSend(v12, "setContainsEnd:", -[UITextSelectionRect containsEnd](self, "containsEnd"));
  objc_msgSend(v12, "setIsVertical:", -[UITextSelectionRect isVertical](self, "isVertical"));
  -[UITextSelectionRect transform](self, "transform");
  v16[0] = v16[3];
  v16[1] = v16[4];
  v16[2] = v16[5];
  objc_msgSend(v12, "setTransform:", v16);
  -[UITextSelectionRect _path](self, "_path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "set_path:", v14);

  return v12;
}

+ (id)startRectFromRects:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count")
    && (objc_msgSend(v3, "lastObject"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(v11, "containsStart", (_QWORD)v14) & 1) != 0)
          {
            v12 = v11;

            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }

    objc_msgSend(v6, "objectAtIndex:", 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_14:

  return v12;
}

+ (CGRect)startEdgeFromRects:(id)a3
{
  void *v3;
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
  double v15;
  CGRect result;

  objc_msgSend(a1, "startRectFromRects:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_startEdgeRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (id)endRectFromRects:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count")
    && (objc_msgSend(v3, "lastObject"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(v11, "containsEnd", (_QWORD)v14) & 1) != 0)
          {
            v12 = v11;

            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }

    objc_msgSend(v6, "lastObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_14:

  return v12;
}

+ (CGRect)endEdgeFromRects:(id)a3
{
  void *v3;
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
  double v15;
  CGRect result;

  objc_msgSend(a1, "endRectFromRects:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_endEdgeRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (id)startCustomSelectionPathFromRects:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "startRectFromRects:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_endCustomSelectionPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)endCustomSelectionPathFromRects:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "endRectFromRects:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_endCustomSelectionPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)startIsHorizontal:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a1, "startRectFromRects:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isVertical") ^ 1;

  return v4;
}

+ (BOOL)endIsHorizontal:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a1, "endRectFromRects:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isVertical") ^ 1;

  return v4;
}

- (UISelectionGrabberCustomPath)_startCustomSelectionPath
{
  void *v3;
  UISelectionGrabberCustomPath *v4;
  NSWritingDirection v5;

  -[UITextSelectionRect _customHandleInfo](self, "_customHandleInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(UISelectionGrabberCustomPath);
    v5 = -[UITextSelectionRect writingDirection](self, "writingDirection");
    if ((unint64_t)(v5 + 1) < 2)
    {
      objc_msgSend(v3, "topLeft");
      -[UISelectionGrabberCustomPath setTopPoint:](v4, "setTopPoint:");
      objc_msgSend(v3, "bottomLeft");
LABEL_7:
      -[UISelectionGrabberCustomPath setBottomPoint:](v4, "setBottomPoint:");
      goto LABEL_8;
    }
    if (v5 == NSWritingDirectionRightToLeft)
    {
      objc_msgSend(v3, "topRight");
      -[UISelectionGrabberCustomPath setTopPoint:](v4, "setTopPoint:");
      objc_msgSend(v3, "bottomRight");
      goto LABEL_7;
    }
  }
  else
  {
    v4 = 0;
  }
LABEL_8:

  return v4;
}

- (UISelectionGrabberCustomPath)_endCustomSelectionPath
{
  void *v3;
  UISelectionGrabberCustomPath *v4;
  NSWritingDirection v5;

  -[UITextSelectionRect _customHandleInfo](self, "_customHandleInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(UISelectionGrabberCustomPath);
    v5 = -[UITextSelectionRect writingDirection](self, "writingDirection");
    if ((unint64_t)(v5 + 1) < 2)
    {
      objc_msgSend(v3, "topRight");
      -[UISelectionGrabberCustomPath setTopPoint:](v4, "setTopPoint:");
      objc_msgSend(v3, "bottomRight");
LABEL_7:
      -[UISelectionGrabberCustomPath setBottomPoint:](v4, "setBottomPoint:");
      goto LABEL_8;
    }
    if (v5 == NSWritingDirectionRightToLeft)
    {
      objc_msgSend(v3, "topLeft");
      -[UISelectionGrabberCustomPath setTopPoint:](v4, "setTopPoint:");
      objc_msgSend(v3, "bottomLeft");
      goto LABEL_7;
    }
  }
  else
  {
    v4 = 0;
  }
LABEL_8:

  return v4;
}

- (CGRect)_startEdgeRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  NSWritingDirection v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[UITextSelectionRect rect](self, "rect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[UITextSelectionRect isVertical](self, "isVertical");
  v12 = -[UITextSelectionRect writingDirection](self, "writingDirection");
  if ((unint64_t)(v12 + 1) >= 2)
  {
    if (v12 == NSWritingDirectionRightToLeft)
    {
      if (v11)
      {
        v6 = v6 + v10 + -1.0;
        v10 = 1.0;
      }
      else
      {
        v4 = v4 + v8 + -1.0;
        v8 = 1.0;
      }
    }
  }
  else if (v11)
  {
    v10 = 1.0;
  }
  else
  {
    v8 = 1.0;
  }
  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_endEdgeRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  NSWritingDirection v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[UITextSelectionRect rect](self, "rect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[UITextSelectionRect isVertical](self, "isVertical");
  v12 = -[UITextSelectionRect writingDirection](self, "writingDirection");
  if ((unint64_t)(v12 + 1) >= 2)
  {
    v13 = 1.0;
    if (v11)
      v14 = v8;
    else
      v14 = 1.0;
    if (!v11)
      v13 = v10;
    if (v12 == NSWritingDirectionRightToLeft)
    {
      v8 = v14;
      v10 = v13;
    }
  }
  else if (v11)
  {
    v6 = v6 + v10 + -1.0;
    v10 = 1.0;
  }
  else
  {
    v4 = v4 + v8 + -1.0;
    v8 = 1.0;
  }
  v15 = v4;
  v16 = v6;
  v17 = v8;
  v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)rect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSWritingDirection)writingDirection
{
  return 0;
}

- (id)range
{
  return 0;
}

- (UITextSelectionRectImpl)_isImpl
{
  UITextSelectionRect *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return (UITextSelectionRectImpl *)v3;
}

- (BOOL)containsEnd
{
  return 0;
}

- (BOOL)containsStart
{
  return 0;
}

- (BOOL)isVertical
{
  return 0;
}

- (BOOL)_drawsOwnHighlight
{
  return 0;
}

- (UIBezierPath)_path
{
  return 0;
}

- (UITextSelectionRectCustomHandleInfo)_customHandleInfo
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  UITextSelectionRect *v5;
  UITextSelectionRect *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  NSWritingDirection v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v28;
  CGAffineTransform v29;
  CGAffineTransform t1;
  CGRect v31;
  CGRect v32;

  v5 = (UITextSelectionRect *)a3;
  if (self == v5)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[UITextSelectionRect _path](self, "_path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 || (-[UITextSelectionRect _path](v6, "_path"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        -[UITextSelectionRect _path](self, "_path");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextSelectionRect _path](v6, "_path");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

        if (v7)
        {

          if (!v10)
            goto LABEL_19;
        }
        else
        {

          if ((v10 & 1) == 0)
            goto LABEL_19;
        }
      }
      -[UITextSelectionRect transform](self, "transform");
      if (v6)
        -[UITextSelectionRect transform](v6, "transform");
      else
        memset(&v29, 0, sizeof(v29));
      if (CGAffineTransformEqualToTransform(&t1, &v29))
      {
        -[UITextSelectionRect rect](self, "rect");
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v19 = v18;
        -[UITextSelectionRect rect](v6, "rect");
        v32.origin.x = v20;
        v32.origin.y = v21;
        v32.size.width = v22;
        v32.size.height = v23;
        v31.origin.x = v13;
        v31.origin.y = v15;
        v31.size.width = v17;
        v31.size.height = v19;
        if (CGRectEqualToRect(v31, v32))
        {
          v24 = -[UITextSelectionRect writingDirection](self, "writingDirection");
          if (v24 == -[UITextSelectionRect writingDirection](v6, "writingDirection"))
          {
            v25 = -[UITextSelectionRect containsStart](self, "containsStart");
            if (v25 == -[UITextSelectionRect containsStart](v6, "containsStart"))
            {
              v26 = -[UITextSelectionRect containsEnd](self, "containsEnd");
              if (v26 == -[UITextSelectionRect containsEnd](v6, "containsEnd"))
              {
                v28 = -[UITextSelectionRect isVertical](self, "isVertical");
                v11 = v28 ^ -[UITextSelectionRect isVertical](v6, "isVertical") ^ 1;
                goto LABEL_20;
              }
            }
          }
        }
      }
LABEL_19:
      LOBYTE(v11) = 0;
LABEL_20:

      goto LABEL_21;
    }
    LOBYTE(v11) = 0;
  }
LABEL_21:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  v3 = (void *)MEMORY[0x1E0CB3B18];
  -[UITextSelectionRect rect](self, "rect");
  objc_msgSend(v3, "valueWithCGRect:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  v6 = 257 * (257 * v5 + -[UITextSelectionRect writingDirection](self, "writingDirection"));
  v7 = 257 * (v6 + -[UITextSelectionRect containsStart](self, "containsStart"));
  v8 = 257 * (v7 + -[UITextSelectionRect containsEnd](self, "containsEnd"));
  v9 = v8 + -[UITextSelectionRect isVertical](self, "isVertical") + 0x1060F140F0601;
  -[UITextSelectionRect _path](self, "_path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");

  return v11;
}

- (CGAffineTransform)transform
{
  void *v5;
  CGAffineTransform *result;
  void *v7;
  uint64_t v8;
  __int128 v9;
  void *v10;

  -[UITextSelectionRect _transform](self, "_transform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UITextSelectionRect _transform](self, "_transform");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v10 = v7;
      objc_msgSend(v7, "CGAffineTransformValue");
      v7 = v10;
    }
    else
    {
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tx = 0u;
      *(_OWORD *)&retstr->a = 0u;
    }

  }
  else
  {
    v8 = MEMORY[0x1E0C9BAA8];
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v9;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v8 + 32);
  }
  return result;
}

- (void)_appendToPath:(CGPath *)a3 cornerRadius:(double)a4 edgeInsets:(UIEdgeInsets)a5
{
  double right;
  double left;
  double top;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  const CGAffineTransform *v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double bottom;
  CGAffineTransform m;
  CGAffineTransform v30;
  _OWORD v31[3];

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  -[UITextSelectionRect rect](self, "rect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v31[0] = *MEMORY[0x1E0C9BAA8];
  v31[1] = v19;
  v31[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UITextSelectionRect transform](self, "transform");
  if (CGAffineTransformIsIdentity(&v30))
  {
    v20 = 0;
  }
  else
  {
    v20 = (const CGAffineTransform *)v31;
    -[UITextSelectionRect transform](self, "transform");
  }
  -[UITextSelectionRect _path](self, "_path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    memset(&m, 0, sizeof(m));
    CGAffineTransformMakeTranslation(&m, v12, v14);
    -[UITextSelectionRect _path](self, "_path");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGPathAddPath(a3, &m, (CGPathRef)objc_msgSend(v22, "CGPath"));

  }
  else if (!-[UITextSelectionRect _drawsOwnHighlight](self, "_drawsOwnHighlight"))
  {
    v23 = left + v12;
    v24 = top + v14;
    v25 = v16 - (left + right);
    v26 = v18 - (top + bottom);
    if (a4 <= 2.22044605e-16)
    {
      CGPathAddRect(a3, v20, *(CGRect *)&v23);
    }
    else
    {
      v27 = fmin(a4, v25 * 0.5);
      CGPathAddRoundedRect(a3, v20, *(CGRect *)&v23, v27, v27);
    }
  }
}

- (NSValue)_transform
{
  return self->_legacyTransform;
}

- (void)_setTransform:(id)a3
{
  objc_storeStrong((id *)&self->_legacyTransform, a3);
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

@end
