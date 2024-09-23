@implementation UIStatusBarItem

+ (UIStatusBarItem)itemWithType:(int)a3 idiom:(int64_t)a4
{
  uint64_t v5;
  char *v6;
  id *v7;
  UIStatusBarItem *v8;

  v5 = *(_QWORD *)&a3;
  if (objc_msgSend(a1, "typeIsValid:"))
  {
    v6 = (char *)&_MergedGlobals_1226;
    if (a4 != 3)
      v6 = (char *)&unk_1ECD80678;
    v7 = (id *)&v6[8 * v5];
    v8 = (UIStatusBarItem *)*v7;
    if (!v8)
    {
      v8 = -[UIStatusBarItem initWithType:]([UIStatusBarItem alloc], "initWithType:", v5);
      v8->_idiom = a4;
      objc_storeStrong(v7, v8);
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (BOOL)typeIsValid:(int)a3
{
  return a3 < 0x34;
}

+ (BOOL)itemType:(int)a3 idiom:(int64_t)a4 canBeEnabledForData:(id)a5 style:(id)a6
{
  __objc2_class **v6;
  __objc2_class *v7;

  v6 = &__itemValues;
  if (a4 == 1)
    v6 = &__padItemValues;
  v7 = v6[5 * a3 + 4];
  if (v7)
    return ((uint64_t (*)(id, id))v7)(a5, a6);
  else
    return *(_BYTE *)(objc_msgSend(a5, "rawData") + a3);
}

+ (BOOL)itemType:(int)a3 idiom:(int64_t)a4 appearsInRegion:(int)a5
{
  __objc2_class **v8;
  int v9;
  int *v10;
  __objc2_class **v11;
  int64_t v12;
  __objc2_class **v13;
  int *v14;
  int *v15;
  int *v16;
  __objc2_class **v18;
  int v19;

  if (a4 == 3)
  {
    v8 = &(&__externalItemValues)[5 * a3];
    v9 = *((_DWORD *)v8 + 5);
    v10 = (int *)(v8 + 3);
  }
  else
  {
    if (a4 == 1)
      v11 = &__padItemValues;
    else
      v11 = &__itemValues;
    v12 = +[UIStatusBar _deviceUserInterfaceLayoutDirection](UIStatusBar, "_deviceUserInterfaceLayoutDirection");
    v13 = &v11[5 * a3];
    v14 = (int *)v13 + 5;
    v15 = (int *)(v13 + 3);
    if (v12)
      v16 = (int *)(v13 + 3);
    else
      v16 = (int *)v13 + 5;
    v9 = *v16;
    if (+[UIStatusBar _deviceUserInterfaceLayoutDirection](UIStatusBar, "_deviceUserInterfaceLayoutDirection"))
    {
      v10 = v14;
    }
    else
    {
      v10 = v15;
    }
  }
  if (a5 == 2)
  {
    v18 = &__itemValues;
    if (a4 == 1)
      v18 = &__padItemValues;
    if (a4 == 3)
      v18 = &__externalItemValues;
    v19 = HIDWORD(v18[5 * a3 + 3]);
    return v19 != 0;
  }
  if (a5 == 1)
  {
    v19 = *v10;
    return v19 != 0;
  }
  return !a5 && v9 != 0;
}

+ (BOOL)isItemWithTypeExclusive:(int)a3 outBlacklistItems:(id *)a4 outWhitelistItems:(id *)a5
{
  BOOL result;
  void *v7;
  void *v8;
  id v9;
  id v11;

  result = 0;
  switch(a3)
  {
    case '*':
      if (!a4)
        goto LABEL_11;
      v7 = (void *)MEMORY[0x1E0C99E60];
      v8 = &unk_1E1A9A320;
      goto LABEL_8;
    case '+':
    case ',':
    case '-':
    case '.':
    case '0':
    case '1':
      return result;
    case '/':
      goto LABEL_5;
    case '2':
      if (!a4)
        goto LABEL_11;
      v7 = (void *)MEMORY[0x1E0C99E60];
      v8 = &unk_1E1A9A308;
LABEL_8:
      objc_msgSend(v7, "setWithObject:", v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a4 = v9;
      break;
    case '3':
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E1A9A2D8, &unk_1E1A9A2F0, 0);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        result = 0;
        *a5 = v11;
      }
      else
      {
LABEL_11:
        result = 0;
      }
      break;
    default:
      if (a3 == 36)
LABEL_5:
        result = 1;
      break;
  }
  return result;
}

- (UIStatusBarItem)initWithType:(int)a3
{
  UIStatusBarItem *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarItem;
  result = -[UIStatusBarItem init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (Class)viewClass
{
  int64_t idiom;
  __objc2_class **v3;
  __objc2_class **v4;

  idiom = self->_idiom;
  v3 = &__itemValues;
  if (idiom == 1)
    v3 = &__padItemValues;
  if (idiom == 3)
    v4 = &__externalItemValues;
  else
    v4 = v3;
  return (Class)v4[5 * self->_type];
}

- (int)priority
{
  __objc2_class **v2;
  int64_t idiom;

  v2 = &__itemValues;
  idiom = self->_idiom;
  if (idiom == 1)
    v2 = &__padItemValues;
  if (idiom == 3)
    v2 = &__externalItemValues;
  return (int)v2[5 * self->_type + 2];
}

- (int)leftOrder
{
  unsigned int type;
  int64_t idiom;
  int *v4;
  __objc2_class **v5;
  int64_t v6;
  __objc2_class **v7;
  int *v8;

  type = self->_type;
  idiom = self->_idiom;
  if (idiom == 3)
  {
    v4 = (int *)&(&__externalItemValues)[5 * type] + 5;
  }
  else
  {
    if (idiom == 1)
      v5 = &__padItemValues;
    else
      v5 = &__itemValues;
    v6 = +[UIStatusBar _deviceUserInterfaceLayoutDirection](UIStatusBar, "_deviceUserInterfaceLayoutDirection");
    v7 = &v5[5 * type];
    v8 = (int *)v7 + 5;
    v4 = (int *)(v7 + 3);
    if (!v6)
      v4 = v8;
  }
  return *v4;
}

- (int)rightOrder
{
  unsigned int type;
  int64_t idiom;
  int *v4;
  __objc2_class **v5;
  int64_t v6;
  __objc2_class **v7;
  int *v8;

  type = self->_type;
  idiom = self->_idiom;
  if (idiom == 3)
  {
    v4 = (int *)(&(&__externalItemValues)[5 * type] + 3);
  }
  else
  {
    if (idiom == 1)
      v5 = &__padItemValues;
    else
      v5 = &__itemValues;
    v6 = +[UIStatusBar _deviceUserInterfaceLayoutDirection](UIStatusBar, "_deviceUserInterfaceLayoutDirection");
    v7 = &v5[5 * type];
    v8 = (int *)(v7 + 3);
    v4 = (int *)v7 + 5;
    if (!v6)
      v4 = v8;
  }
  return *v4;
}

- (int)centerOrder
{
  int64_t idiom;
  __objc2_class **v3;
  __objc2_class **v4;

  idiom = self->_idiom;
  v3 = &__itemValues;
  if (idiom == 1)
    v3 = &__padItemValues;
  if (idiom == 3)
    v4 = &__externalItemValues;
  else
    v4 = v3;
  return HIDWORD(v4[5 * self->_type + 3]);
}

- (NSString)indicatorName
{
  __objc2_class **v2;

  if (self->_idiom == 1)
    v2 = &__padItemValues;
  else
    v2 = &__itemValues;
  return (NSString *)v2[5 * self->_type + 1];
}

- (BOOL)appearsOnLeft
{
  return -[UIStatusBarItem leftOrder](self, "leftOrder") != 0;
}

- (BOOL)appearsOnRight
{
  return -[UIStatusBarItem rightOrder](self, "rightOrder") != 0;
}

- (BOOL)appearsOnCenter
{
  return -[UIStatusBarItem centerOrder](self, "centerOrder") != 0;
}

- (BOOL)appearsInRegion:(int)a3
{
  if (a3 == 2)
    return -[UIStatusBarItem appearsOnCenter](self, "appearsOnCenter");
  if (a3 == 1)
    return -[UIStatusBarItem appearsOnRight](self, "appearsOnRight");
  if (a3)
    return 0;
  return -[UIStatusBarItem appearsOnLeft](self, "appearsOnLeft");
}

- (int64_t)comparePriority:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  int64_t v7;

  v4 = a3;
  v5 = -[UIStatusBarItem priority](self, "priority");
  v6 = objc_msgSend(v4, "priority");

  if (v5 >= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 > v6)
    return 1;
  else
    return v7;
}

- (int64_t)compareLeftOrder:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  int64_t v7;

  v4 = a3;
  v5 = -[UIStatusBarItem leftOrder](self, "leftOrder");
  v6 = objc_msgSend(v4, "leftOrder");

  if (v5 >= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 > v6)
    return 1;
  else
    return v7;
}

- (int64_t)compareRightOrder:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  int64_t v7;

  v4 = a3;
  v5 = -[UIStatusBarItem rightOrder](self, "rightOrder");
  v6 = objc_msgSend(v4, "rightOrder");

  if (v5 >= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 > v6)
    return 1;
  else
    return v7;
}

- (int64_t)compareCenterOrder:(id)a3
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  int64_t v7;

  v4 = a3;
  v5 = -[UIStatusBarItem centerOrder](self, "centerOrder");
  v6 = objc_msgSend(v4, "centerOrder");

  if (v5 >= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 > v6)
    return 1;
  else
    return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIStatusBarItem;
  -[UIStatusBarItem description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(-[UIStatusBarItem viewClass](self, "viewClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" [%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIStatusBarItem indicatorName](self, "indicatorName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UIStatusBarItem indicatorName](self, "indicatorName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(":%@"), v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }
  if (-[UIStatusBarItem appearsOnLeft](self, "appearsOnLeft")
    && -[UIStatusBarItem appearsOnRight](self, "appearsOnRight"))
  {
    v9 = CFSTR(" (Left/Right)]");
LABEL_12:
    objc_msgSend(v5, "stringByAppendingString:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
    return v5;
  }
  if (-[UIStatusBarItem appearsOnRight](self, "appearsOnRight"))
  {
    v9 = CFSTR(" (Right)]");
    goto LABEL_12;
  }
  if (-[UIStatusBarItem appearsOnLeft](self, "appearsOnLeft"))
  {
    v9 = CFSTR(" (Left)]");
    goto LABEL_12;
  }
  if (-[UIStatusBarItem appearsOnCenter](self, "appearsOnCenter"))
  {
    v9 = CFSTR(" (Center)]");
    goto LABEL_12;
  }
  return v5;
}

- (int)type
{
  return self->_type;
}

@end
