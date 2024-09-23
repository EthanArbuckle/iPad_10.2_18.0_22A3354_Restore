@implementation OADBaseFontCollection

- (id)baseFontForId:(int)a3
{
  void *v3;

  if (a3 == 2)
  {
    -[OADBaseFontCollection complexScriptFont](self, "complexScriptFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[OADBaseFontCollection eastAsianFont](self, "eastAsianFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[OADBaseFontCollection latinFont](self, "latinFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)setBaseFont:(id)a3 forId:(int)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = v6;
  switch(a4)
  {
    case 2:
      -[OADBaseFontCollection setComplexScriptFont:](self, "setComplexScriptFont:", v6);
      break;
    case 1:
      -[OADBaseFontCollection setEastAsianFont:](self, "setEastAsianFont:", v6);
      break;
    case 0:
      -[OADBaseFontCollection setLatinFont:](self, "setLatinFont:", v6);
      break;
  }

}

- (BOOL)isEqualToBaseFontCollection:(id)a3
{
  id v4;
  objc_object *v5;
  objc_object *v6;
  objc_object *v7;
  objc_object *v8;
  objc_object *v9;
  objc_object *v10;
  char v11;

  v4 = a3;
  if (v4)
  {
    -[OADBaseFontCollection latinFont](self, "latinFont");
    v5 = (objc_object *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "latinFont");
    v6 = (objc_object *)objc_claimAutoreleasedReturnValue();
    if (TCObjectEqual(v5, v6))
    {
      -[OADBaseFontCollection eastAsianFont](self, "eastAsianFont");
      v7 = (objc_object *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "eastAsianFont");
      v8 = (objc_object *)objc_claimAutoreleasedReturnValue();
      if (TCObjectEqual(v7, v8))
      {
        -[OADBaseFontCollection complexScriptFont](self, "complexScriptFont");
        v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "complexScriptFont");
        v10 = (objc_object *)objc_claimAutoreleasedReturnValue();
        v11 = TCObjectEqual(v9, v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEmpty
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[OADBaseFontCollection latinFont](self, "latinFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[OADBaseFontCollection eastAsianFont](self, "eastAsianFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v4 = 0;
    }
    else
    {
      -[OADBaseFontCollection complexScriptFont](self, "complexScriptFont");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v6 == 0;

    }
  }

  return v4;
}

- (NSString)latinFont
{
  return self->_latinFont;
}

- (void)setLatinFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)eastAsianFont
{
  return self->_eastAsianFont;
}

- (void)setEastAsianFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)complexScriptFont
{
  return self->_complexScriptFont;
}

- (void)setComplexScriptFont:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complexScriptFont, 0);
  objc_storeStrong((id *)&self->_eastAsianFont, 0);
  objc_storeStrong((id *)&self->_latinFont, 0);
}

@end
