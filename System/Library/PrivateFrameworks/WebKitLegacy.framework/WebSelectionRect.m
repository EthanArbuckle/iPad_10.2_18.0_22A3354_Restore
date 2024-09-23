@implementation WebSelectionRect

+ (id)selectionRect
{
  return objc_alloc_init((Class)a1);
}

+ (CGRect)startEdge:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  char v17;
  int v18;
  unsigned int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect result;

  v29 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "count"))
  {
    v10 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    goto LABEL_23;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
LABEL_4:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v6)
        objc_enumerationMutation(a3);
      v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v7);
      if ((objc_msgSend(v8, "containsStart") & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v5)
          goto LABEL_4;
        goto LABEL_12;
      }
    }
    if (v8)
      goto LABEL_13;
  }
LABEL_12:
  v8 = (void *)objc_msgSend(a3, "objectAtIndex:", 0);
LABEL_13:
  objc_msgSend(v8, "rect");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = objc_msgSend(v8, "isHorizontal");
  v18 = objc_msgSend(v8, "writingDirection");
  v19 = v18 + 1;
  if ((v17 & 1) == 0)
  {
    if (v19 >= 2)
    {
      if (v18 != 1)
        goto LABEL_23;
      v12 = v12 + v16 + -1.0;
    }
    v16 = 1.0;
    goto LABEL_23;
  }
  if (v19 < 2)
    goto LABEL_17;
  if (v18 == 1)
  {
    v10 = v10 + v14 + -1.0;
LABEL_17:
    v14 = 1.0;
  }
LABEL_23:
  v20 = v10;
  v21 = v12;
  v22 = v14;
  v23 = v16;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

+ (CGRect)endEdge:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  char v17;
  int v18;
  unsigned int v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect result;

  v29 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "count"))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v25;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(a3);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v7);
        if ((objc_msgSend(v8, "containsEnd") & 1) != 0)
          break;
        if (v5 == ++v7)
        {
          v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v5)
            goto LABEL_4;
          goto LABEL_12;
        }
      }
      if (v8)
        goto LABEL_13;
    }
LABEL_12:
    v8 = (void *)objc_msgSend(a3, "lastObject");
LABEL_13:
    objc_msgSend(v8, "rect");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v17 = objc_msgSend(v8, "isHorizontal");
    v18 = objc_msgSend(v8, "writingDirection");
    v19 = v18 + 1;
    if ((v17 & 1) != 0)
    {
      if (v19 >= 2)
      {
        if (v18 == 1)
          v14 = 1.0;
      }
      else
      {
        v10 = v10 + v14 + -1.0;
        v14 = 1.0;
      }
    }
    else if (v19 >= 2)
    {
      if (v18 == 1)
        v16 = 1.0;
    }
    else
    {
      v12 = v12 + v16 + -1.0;
      v16 = 1.0;
    }
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v20 = v10;
  v21 = v12;
  v22 = v14;
  v23 = v16;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (WebSelectionRect)init
{
  WebSelectionRect *v2;
  WebSelectionRect *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebSelectionRect;
  v2 = -[WebSelectionRect init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WebSelectionRect setRect:](v2, "setRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[WebSelectionRect setWritingDirection:](v3, "setWritingDirection:", 0);
    -[WebSelectionRect setIsLineBreak:](v3, "setIsLineBreak:", 0);
    -[WebSelectionRect setIsFirstOnLine:](v3, "setIsFirstOnLine:", 0);
    -[WebSelectionRect setIsLastOnLine:](v3, "setIsLastOnLine:", 0);
    -[WebSelectionRect setContainsStart:](v3, "setContainsStart:", 0);
    -[WebSelectionRect setContainsEnd:](v3, "setContainsEnd:", 0);
    -[WebSelectionRect setIsInFixedPosition:](v3, "setIsInFixedPosition:", 0);
    -[WebSelectionRect setIsHorizontal:](v3, "setIsHorizontal:", 0);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = +[WebSelectionRect selectionRect](WebSelectionRect, "selectionRect", a3);
  -[WebSelectionRect rect](self, "rect");
  objc_msgSend(v4, "setRect:");
  objc_msgSend(v4, "setWritingDirection:", -[WebSelectionRect writingDirection](self, "writingDirection"));
  objc_msgSend(v4, "setIsLineBreak:", -[WebSelectionRect isLineBreak](self, "isLineBreak"));
  objc_msgSend(v4, "setIsFirstOnLine:", -[WebSelectionRect isFirstOnLine](self, "isFirstOnLine"));
  objc_msgSend(v4, "setIsLastOnLine:", -[WebSelectionRect isLastOnLine](self, "isLastOnLine"));
  objc_msgSend(v4, "setContainsStart:", -[WebSelectionRect containsStart](self, "containsStart"));
  objc_msgSend(v4, "setContainsEnd:", -[WebSelectionRect containsEnd](self, "containsEnd"));
  objc_msgSend(v4, "setIsInFixedPosition:", -[WebSelectionRect isInFixedPosition](self, "isInFixedPosition"));
  objc_msgSend(v4, "setIsHorizontal:", -[WebSelectionRect isHorizontal](self, "isHorizontal"));
  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  _BOOL4 v19;
  const __CFString *v20;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WebSelectionRect rect](self, "rect");
  v5 = v4;
  -[WebSelectionRect rect](self, "rect");
  v7 = v6;
  -[WebSelectionRect rect](self, "rect");
  v9 = v8;
  -[WebSelectionRect rect](self, "rect");
  v11 = v10;
  if (-[WebSelectionRect writingDirection](self, "writingDirection"))
    v12 = CFSTR("[RTL]");
  else
    v12 = CFSTR("[LTR]");
  if (-[WebSelectionRect isLineBreak](self, "isLineBreak"))
    v13 = CFSTR(" [BR]");
  else
    v13 = &stru_1E9D6EC48;
  if (-[WebSelectionRect isFirstOnLine](self, "isFirstOnLine"))
    v14 = CFSTR(" [FIRST]");
  else
    v14 = &stru_1E9D6EC48;
  if (-[WebSelectionRect isLastOnLine](self, "isLastOnLine"))
    v15 = CFSTR(" [LAST]");
  else
    v15 = &stru_1E9D6EC48;
  if (-[WebSelectionRect containsStart](self, "containsStart"))
    v16 = CFSTR(" [START]");
  else
    v16 = &stru_1E9D6EC48;
  if (-[WebSelectionRect containsEnd](self, "containsEnd"))
    v17 = CFSTR(" [END]");
  else
    v17 = &stru_1E9D6EC48;
  if (-[WebSelectionRect isInFixedPosition](self, "isInFixedPosition"))
    v18 = CFSTR(" [FIXED]");
  else
    v18 = &stru_1E9D6EC48;
  v19 = -[WebSelectionRect isHorizontal](self, "isHorizontal");
  v20 = CFSTR(" [VERTICAL]");
  if (v19)
    v20 = &stru_1E9D6EC48;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<WebSelectionRect: %p> : { %.1f,%.1f,%.1f,%.1f } %@%@%@%@%@%@%@%@"), self, v5, v7, v9, v11, v12, v13, v14, v15, v16, v17, v18, v20);
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->m_rect.origin.x;
  y = self->m_rect.origin.y;
  width = self->m_rect.size.width;
  height = self->m_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->m_rect = a3;
}

- (int)writingDirection
{
  return self->m_writingDirection;
}

- (void)setWritingDirection:(int)a3
{
  self->m_writingDirection = a3;
}

- (BOOL)isLineBreak
{
  return self->m_isLineBreak;
}

- (void)setIsLineBreak:(BOOL)a3
{
  self->m_isLineBreak = a3;
}

- (BOOL)isFirstOnLine
{
  return self->m_isFirstOnLine;
}

- (void)setIsFirstOnLine:(BOOL)a3
{
  self->m_isFirstOnLine = a3;
}

- (BOOL)isLastOnLine
{
  return self->m_isLastOnLine;
}

- (void)setIsLastOnLine:(BOOL)a3
{
  self->m_isLastOnLine = a3;
}

- (BOOL)containsStart
{
  return self->m_containsStart;
}

- (void)setContainsStart:(BOOL)a3
{
  self->m_containsStart = a3;
}

- (BOOL)containsEnd
{
  return self->m_containsEnd;
}

- (void)setContainsEnd:(BOOL)a3
{
  self->m_containsEnd = a3;
}

- (BOOL)isInFixedPosition
{
  return self->m_isInFixedPosition;
}

- (void)setIsInFixedPosition:(BOOL)a3
{
  self->m_isInFixedPosition = a3;
}

- (BOOL)isHorizontal
{
  return self->m_isHorizontal;
}

- (void)setIsHorizontal:(BOOL)a3
{
  self->m_isHorizontal = a3;
}

@end
