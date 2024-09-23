@implementation WDFontTable

- (WDFontTable)init
{
  WDFontTable *v2;
  OITSUNoCopyDictionary *v3;
  OITSUNoCopyDictionary *mFontTable;
  NSMutableArray *v5;
  NSMutableArray *mFontsInOrderOfInsertion;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WDFontTable;
  v2 = -[WDFontTable init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(OITSUNoCopyDictionary);
    mFontTable = v2->mFontTable;
    v2->mFontTable = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mFontsInOrderOfInsertion = v2->mFontsInOrderOfInsertion;
    v2->mFontsInOrderOfInsertion = v5;

    -[WDFontTable fontWithName:create:](v2, "fontWithName:create:", CFSTR("Times New Roman"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPitch:", 2);
    objc_msgSend(v7, "setFontFamily:", 1);
    objc_msgSend(v7, "setCharacterSet:", 0);
    -[WDFontTable fontWithName:create:](v2, "fontWithName:create:", CFSTR("Symbol"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setPitch:", 2);
    objc_msgSend(v8, "setFontFamily:", 1);
    objc_msgSend(v8, "setCharacterSet:", 2);
    -[WDFontTable fontWithName:create:](v2, "fontWithName:create:", CFSTR("Arial"), 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setPitch:", 2);
    objc_msgSend(v9, "setFontFamily:", 2);
    objc_msgSend(v9, "setCharacterSet:", 0);

  }
  return v2;
}

- (id)fontWithName:(id)a3 create:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    -[OITSUNoCopyDictionary objectForKey:](self->mFontTable, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v4 || v7)
    {
      v9 = v7;
    }
    else
    {
      -[WDFontTable createFontWithName:](self, "createFontWithName:", v6);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)createFontWithName:(id)a3
{
  id v4;
  void *v5;
  WDFont *v6;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[OITSUNoCopyDictionary objectForKey:](self->mFontTable, "objectForKey:", v5);
    v6 = (WDFont *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = -[WDFont initWithName:]([WDFont alloc], "initWithName:", v5);
      -[OITSUNoCopyDictionary setObject:forKey:](self->mFontTable, "setObject:forKey:", v6, v5);
      -[NSMutableArray addObject:](self->mFontsInOrderOfInsertion, "addObject:", v6);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)fontWithName:(id)a3
{
  -[WDFontTable fontWithName:create:](self, "fontWithName:create:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)clear
{
  -[OITSUNoCopyDictionary removeAllObjects](self->mFontTable, "removeAllObjects");
}

- (unint64_t)count
{
  return -[OITSUNoCopyDictionary count](self->mFontTable, "count");
}

- (id)fonts
{
  return (id)-[NSMutableArray objectEnumerator](self->mFontsInOrderOfInsertion, "objectEnumerator");
}

- (unint64_t)indexOfFont:(id)a3
{
  return -[NSMutableArray indexOfObjectIdenticalTo:](self->mFontsInOrderOfInsertion, "indexOfObjectIdenticalTo:", a3);
}

- (id)fontAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->mFontsInOrderOfInsertion, "objectAtIndexedSubscript:", a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDFontTable;
  -[WDFontTable description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFontsInOrderOfInsertion, 0);
  objc_storeStrong((id *)&self->mFontTable, 0);
}

@end
