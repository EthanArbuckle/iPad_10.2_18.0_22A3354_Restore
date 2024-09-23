@implementation WDAContent

- (WDAContent)init
{
  WDAContent *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDAContent;
  result = -[WDAContent init](&v3, sel_init);
  if (result)
    result->mTextType = -1;
  return result;
}

- (void)setDrawable:(id)a3
{
  objc_storeWeak((id *)&self->mDrawable, a3);
}

- (void)setTextType:(int)a3
{
  self->mTextType = a3;
}

- (BOOL)hasBounds
{
  return self->mAnchor != 0;
}

- (id)createAnchor
{
  WDAAnchor *v3;
  WDAAnchor *mAnchor;

  v3 = objc_alloc_init(WDAAnchor);
  mAnchor = self->mAnchor;
  self->mAnchor = v3;

  return self->mAnchor;
}

- (WDAAnchor)anchor
{
  return self->mAnchor;
}

- (void)setTextBox:(id)a3 document:(id)a4
{
  WDATextBox *v6;
  WDATextBox *mTextBox;
  id v8;

  v6 = (WDATextBox *)a3;
  v8 = a4;
  objc_msgSend(v8, "addObjPointer:", v6);
  if (self->mTextBox)
    objc_msgSend(v8, "removeObjPointer:");
  else
    objc_msgSend(v8, "addObjPointer:", self);
  mTextBox = self->mTextBox;
  self->mTextBox = v6;

}

- (OADDrawable)drawable
{
  return (OADDrawable *)objc_loadWeakRetained((id *)&self->mDrawable);
}

- (int)textType
{
  return self->mTextType;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[WDAAnchor bounds](self->mAnchor, "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isShape
{
  id WeakRetained;
  char isKindOfClass;

  WeakRetained = objc_loadWeakRetained((id *)&self->mDrawable);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)textBox
{
  return self->mTextBox;
}

- (BOOL)floating
{
  void *v2;
  BOOL v3;

  -[WDAContent anchor](self, "anchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)clearAnchor
{
  WDAAnchor *mAnchor;

  mAnchor = self->mAnchor;
  self->mAnchor = 0;

}

- (id)createTextBoxWithDocument:(id)a3 textType:(int)a4
{
  uint64_t v4;
  id v6;
  WDATextBox *v7;
  WDATextBox *mTextBox;
  WDText *v9;
  WDATextBox *v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_alloc_init(WDATextBox);
  mTextBox = self->mTextBox;
  self->mTextBox = v7;

  -[WDATextBox setDocument:](self->mTextBox, "setDocument:", v6);
  -[WDATextBox setParent:](self->mTextBox, "setParent:", self);
  v9 = -[WDText initWithDocument:textType:]([WDText alloc], "initWithDocument:textType:", v6, v4);
  -[WDATextBox setText:](self->mTextBox, "setText:", v9);
  objc_msgSend(v6, "addObjPointer:", self->mTextBox);
  objc_msgSend(v6, "addObjPointer:", self);
  v10 = self->mTextBox;

  return v10;
}

- (void)setBounds:(CGRect)a3
{
  -[WDAAnchor setBounds:](self->mAnchor, "setBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isLine
{
  _BOOL4 v3;
  id WeakRetained;
  int v5;

  v3 = -[WDAContent isShape](self, "isShape");
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mDrawable);
    v5 = objc_msgSend(WeakRetained, "type");

    LOBYTE(v3) = v5 == 20;
  }
  return v3;
}

- (BOOL)isTopLevelObject
{
  void *v2;
  void *v3;
  BOOL v4;

  -[WDAContent drawable](self, "drawable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (unint64_t)linkedTextBoxSupport
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->mDrawable);
  objc_msgSend(WeakRetained, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 2;
  else
    return 1;
}

- (BOOL)isLinked
{
  void *v3;
  void *v4;
  BOOL v5;

  -[WDATextBox flowId](self->mTextBox, "flowId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WDATextBox flowSequence](self->mTextBox, "flowSequence");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (int)objc_msgSend(v4, "intValue") > 0 || -[WDATextBox nextTextBoxId](self->mTextBox, "nextTextBoxId") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasText
{
  void *v2;
  void *v3;
  int v4;

  -[WDATextBox text](self->mTextBox, "text");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isEmpty") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDAContent;
  -[WDAContent description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mDrawable);
  objc_storeStrong((id *)&self->mTextBox, 0);
  objc_storeStrong((id *)&self->mAnchor, 0);
}

+ (Class)classForType:(unsigned __int16)a3
{
  return (Class)objc_opt_class();
}

@end
