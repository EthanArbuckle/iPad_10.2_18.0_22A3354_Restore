@implementation TCFontName

- (TCFontName)initWithStyleName:(id)a3 fullName:(id)a4
{
  id v6;
  id v7;
  TCFontName *v8;
  TCFontName *v9;
  uint64_t v10;
  NSString *styleName;
  uint64_t v12;
  NSString *fullName;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TCFontName;
  v8 = -[TCFontName init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      v10 = objc_msgSend(v6, "copy");
      styleName = v9->_styleName;
      v9->_styleName = (NSString *)v10;
    }
    else
    {
      styleName = v8->_styleName;
      v8->_styleName = (NSString *)&stru_24F3BFFF8;
    }

    if (v7)
    {
      v12 = objc_msgSend(v7, "copy");
      fullName = v9->_fullName;
      v9->_fullName = (NSString *)v12;
    }
    else
    {
      fullName = v9->_fullName;
      v9->_fullName = (NSString *)&stru_24F3BFFF8;
    }

  }
  return v9;
}

- (id)equivalentDictionary
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBCE70];
  -[TCFontName fullName](self, "fullName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TCFontName fullName](self, "fullName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24F3BFFF8;
  }
  -[TCFontName styleName](self, "styleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[TCFontName styleName](self, "styleName");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_24F3BFFF8;
  }
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v5, CFSTR("full-name"), v7, CFSTR("style-name"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)

  if (v4)
  return v8;
}

- (TCFontName)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  TCFontName *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("style-name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("full-name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TCFontName initWithStyleName:fullName:](self, "initWithStyleName:fullName:", v5, v6);

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;

  -[TCFontName equivalentDictionary](self, "equivalentDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)styleName
{
  return self->_styleName;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_styleName, 0);
}

@end
