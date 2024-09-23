@implementation UIStatusBarComposedData

- (UIStatusBarComposedData)initWithRawData:(id *)a3
{
  UIStatusBarComposedData *v4;
  UIStatusBarComposedData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIStatusBarComposedData;
  v4 = -[UIStatusBarComposedData init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      memcpy(&v4->_rawData, a3, sizeof(v4->_rawData));
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  uint64_t i;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithRawData:", -[UIStatusBarComposedData rawData](self, "rawData"));
  -[UIStatusBarComposedData doubleHeightStatus](self, "doubleHeightStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDoubleHeightStatus:", v5);

  for (i = 0; i != 52; ++i)
    objc_msgSend(v4, "setItem:enabled:", i, -[UIStatusBarComposedData isItemEnabled:](self, "isItemEnabled:", i));
  return v4;
}

- ($6C45178016D353444451090973A2A97F)rawData
{
  return ($6C45178016D353444451090973A2A97F *)&self->_rawData;
}

- (BOOL)isItemEnabled:(int)a3
{
  return a3 <= 0x33 && self->_itemEnabled[a3];
}

- (void)setItem:(int)a3 enabled:(BOOL)a4
{
  if (a3 <= 0x33)
    self->_itemEnabled[a3] = a4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (memcmp(&self->_rawData, (const void *)objc_msgSend(v5, "rawData"), 0xF28uLL))
    {
LABEL_3:
      v6 = 0;
LABEL_17:

      goto LABEL_18;
    }
    -[UIStatusBarComposedData doubleHeightStatus](self, "doubleHeightStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleHeightStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    if (v9 == v10)
    {

    }
    else
    {
      v11 = v10;
      v6 = 0;
      if (!v9 || !v10)
      {
LABEL_16:

        goto LABEL_17;
      }
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if ((v12 & 1) == 0)
        goto LABEL_3;
    }
    -[UIStatusBarComposedData systemNavigationItem](self, "systemNavigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemNavigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v13;
    v15 = v14;
    if (v9 == v15)
    {
      v6 = 1;
      v11 = v9;
    }
    else
    {
      v11 = v15;
      v6 = 0;
      if (v9 && v15)
        v6 = objc_msgSend(v9, "isEqual:", v15);
    }
    goto LABEL_16;
  }
  v6 = 0;
LABEL_18:

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIStatusBarComposedData;
  -[UIStatusBarComposedData description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR("\nPrimary breadcrumb override: “%s”"), -[UIStatusBarComposedData rawData](self, "rawData") + 2537);
  objc_msgSend(v4, "appendFormat:", CFSTR("\nSecondary breadcrumb override: “%s”"), -[UIStatusBarComposedData rawData](self, "rawData") + 2793);
  objc_msgSend(v4, "appendFormat:", CFSTR("\nService: “%s”"), -[UIStatusBarComposedData rawData](self, "rawData") + 448);
  if (-[UIStatusBarComposedData isItemEnabled:](self, "isItemEnabled:", 6))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("\nService Enabled? %@"), v5);
  objc_msgSend(v4, "appendFormat:", CFSTR("\nPerson Name: “%s”"), -[UIStatusBarComposedData rawData](self, "rawData") + 3049);
  if (-[UIStatusBarComposedData isItemEnabled:](self, "isItemEnabled:", 8))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("\nPerson Enabled? %@"), v6);
  return v4;
}

- (NSString)doubleHeightStatus
{
  return self->_doubleHeightStatus;
}

- (void)setDoubleHeightStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 3944);
}

- (UISystemNavigationAction)systemNavigationItem
{
  return self->_systemNavigationItem;
}

- (void)setSystemNavigationItem:(id)a3
{
  objc_storeStrong((id *)&self->_systemNavigationItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemNavigationItem, 0);
  objc_storeStrong((id *)&self->_doubleHeightStatus, 0);
}

@end
