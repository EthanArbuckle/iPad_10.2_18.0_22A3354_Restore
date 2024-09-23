@implementation NSTextElement

- (NSTextRange)elementRange
{
  return (NSTextRange *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)childElements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSTextContentManager)textContentManager
{
  return (NSTextContentManager *)objc_loadWeak((id *)&self->_textContentManager);
}

- (void)setElementRange:(NSTextRange *)elementRange
{
  objc_setProperty_atomic(self, a2, elementRange, 24);
}

- (NSTextElement)initWithTextContentManager:(NSTextContentManager *)textContentManager
{
  NSTextElement *v4;
  NSTextElement *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSTextElement;
  v4 = -[NSTextElement init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[NSTextElement setTextContentManager:](v4, "setTextContentManager:", textContentManager);
    -[NSTextElement setCoalescingType:](v5, "setCoalescingType:", 0);
  }
  return v5;
}

- (void)setTextContentManager:(NSTextContentManager *)textContentManager
{
  NSTextContentManager **p_textContentManager;
  NSTextContentManager *v5;
  NSArray *v7;
  _QWORD v8[5];

  v5 = self->_textContentManager;
  p_textContentManager = &self->_textContentManager;
  if (v5 != textContentManager)
  {
    objc_storeWeak((id *)p_textContentManager, textContentManager);
    v7 = -[NSTextElement childElements](self, "childElements");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__NSTextElement_setTextContentManager___block_invoke;
    v8[3] = &unk_1E2604918;
    v8[4] = textContentManager;
    -[NSArray enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", v8);
  }
}

- (void)setCoalescingType:(unsigned __int8)a3
{
  self->_coalescingType = a3;
}

- (BOOL)isEndOfDocument
{
  int v3;

  v3 = objc_msgSend(-[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextElement textContentManager](self, "textContentManager"), "documentRange"), "endLocation"), "isEqual:", -[NSTextRange endLocation](-[NSTextElement elementRange](self, "elementRange"), "endLocation"));
  if (v3)
    LOBYTE(v3) = __NSTextElementGetFirstRepresentableChild(self) == 0;
  return v3;
}

- (unsigned)coalescingType
{
  return self->_coalescingType;
}

- (void)dealloc
{
  objc_super v3;

  -[NSTextElement setTextContentManager:](self, "setTextContentManager:", 0);

  v3.receiver = self;
  v3.super_class = (Class)NSTextElement;
  -[NSTextElement dealloc](&v3, sel_dealloc);
}

uint64_t __39__NSTextElement_setTextContentManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTextContentManager:", *(_QWORD *)(a1 + 32));
}

- (BOOL)isBeginningOfDocument
{
  NSTextRange *v3;
  NSTextElement *v4;
  NSTextElement *v5;
  BOOL v6;

  v3 = -[NSTextContentManager documentRange](-[NSTextElement textContentManager](self, "textContentManager"), "documentRange");
  if (v3)
  {
    LODWORD(v3) = objc_msgSend(-[NSTextRange location](v3, "location"), "isEqual:", -[NSTextRange location](-[NSTextElement elementRange](self, "elementRange"), "location"));
    if ((_DWORD)v3)
    {
      v4 = -[NSTextElement parentElement](self, "parentElement");
      if (v4)
      {
        v5 = v4;
        do
        {
          v6 = -[NSTextElement isRepresentedElement](v5, "isRepresentedElement");
          if (v6)
            break;
          v5 = -[NSTextElement parentElement](v5, "parentElement");
        }
        while (v5);
        LOBYTE(v3) = !v6;
      }
      else
      {
        LOBYTE(v3) = 1;
      }
    }
  }
  return (char)v3;
}

- (id)childTextElementForLocation:(id)a3 elementIndex:(int64_t *)a4
{
  NSArray *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  id v11;
  void *v12;

  v6 = -[NSTextElement childElements](self, "childElements");
  if (!-[NSArray count](v6, "count"))
    return 0;
  do
  {
    v7 = -[NSArray count](v6, "count") - 1;
    if (v7 < 0)
    {
LABEL_11:
      v11 = 0;
      goto LABEL_13;
    }
    v8 = 0;
    while (1)
    {
      v9 = v7 - v8;
      if (v7 < v8)
        ++v9;
      v10 = v8 + (v9 >> 1);
      v11 = -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_msgSend(v11, "elementRange");
      if (objc_msgSend(a3, "compare:", objc_msgSend(v12, "location")) == -1)
      {
        v7 = v10 - 1;
        goto LABEL_10;
      }
      if (objc_msgSend(a3, "compare:", objc_msgSend(v12, "endLocation")) == -1)
        break;
      v8 = v10 + 1;
LABEL_10:
      if (v8 > v7)
        goto LABEL_11;
    }
    *a4 = v10;
LABEL_13:
    v6 = (NSArray *)objc_msgSend(v11, "childElements");
  }
  while (-[NSArray count](v6, "count"));
  return v11;
}

- (NSTextElement)init
{
  return -[NSTextElement initWithTextContentManager:](self, "initWithTextContentManager:", 0);
}

- (CGSize)estimatedIntrinsicContentSizeForTextLayoutManager:(id)a3
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = (void *)objc_msgSend(a3, "textContainerForLocation:", -[NSTextRange location](-[NSTextElement elementRange](self, "elementRange"), "location"));
  v5 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v3)
  {
    v6 = v3;
    objc_msgSend(v3, "size");
    if (v7 > 0.0 && v7 < 10000000.0)
    {
      objc_msgSend(v6, "size");
      v5 = v8;
    }
  }
  v9 = v5;
  v10 = v4;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)isRepresentedElement
{
  return 1;
}

- (NSTextElement)parentElement
{
  return 0;
}

+ (int64_t)_searchElements:(id)a3 forLocation:(id)a4
{
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  if (!a3)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSTextElement.m"), 164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("elements != nil"));
    if (a4)
      goto LABEL_3;
LABEL_20:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSTextElement.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location != nil"));
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_20;
LABEL_3:
  v8 = objc_msgSend(a3, "count") - 1;
  if (v8 < 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  v9 = 0;
  while (1)
  {
    v10 = v8 - v9;
    if (v8 < v9)
      ++v10;
    v11 = v9 + (v10 >> 1);
    v12 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", v11);
    v13 = (void *)objc_msgSend(v12, "elementRange");
    if (objc_msgSend(a4, "compare:", objc_msgSend(v13, "location")) == -1)
    {
      v8 = v11 - 1;
      goto LABEL_11;
    }
    if (objc_msgSend(a4, "compare:", objc_msgSend(v13, "endLocation")) == -1)
      break;
    v9 = v11 + 1;
LABEL_11:
    if (v9 > v8)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v12 || v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v12 && objc_msgSend(a3, "indexOfObject:", v12) != v11)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSTextElement.m"), 169, CFSTR("Element %@ at index %ld has invalid index %ld"), v12, objc_msgSend(a3, "indexOfObject:", v12), v11);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSTextElement.m"), 168, CFSTR("Null element returned index %ld"), v11, v15, v16);
  }
  return v11;
}

@end
