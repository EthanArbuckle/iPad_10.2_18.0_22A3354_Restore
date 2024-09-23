@implementation OADTextListStyle

- (OADTextListStyle)initWithDefaults
{
  OADTextListStyle *v2;
  uint64_t v3;
  NSMutableArray *mParagraphProperties;
  int v5;
  OADParagraphProperties *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OADTextListStyle;
  v2 = -[OADTextListStyle init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
    mParagraphProperties = v2->mParagraphProperties;
    v2->mParagraphProperties = (NSMutableArray *)v3;

    v5 = 10;
    do
    {
      v6 = -[OADParagraphProperties initWithDefaults]([OADParagraphProperties alloc], "initWithDefaults");
      -[NSMutableArray addObject:](v2->mParagraphProperties, "addObject:", v6);

      --v5;
    }
    while (v5);
  }
  return v2;
}

- (id)propertiesForListLevel:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mParagraphProperties, "objectAtIndex:", a3 + 1);
}

- (OADTextListStyle)init
{
  OADTextListStyle *v2;
  uint64_t v3;
  NSMutableArray *mParagraphProperties;
  int v5;
  OADParagraphProperties *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OADTextListStyle;
  v2 = -[OADTextListStyle init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
    mParagraphProperties = v2->mParagraphProperties;
    v2->mParagraphProperties = (NSMutableArray *)v3;

    v5 = 10;
    do
    {
      v6 = objc_alloc_init(OADParagraphProperties);
      -[NSMutableArray addObject:](v2->mParagraphProperties, "addObject:", v6);

      --v5;
    }
    while (v5);
  }
  return v2;
}

- (void)setParentTextListStyle:(id)a3
{
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[OADTextListStyle defaultProperties](self, "defaultProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParent:", v5);

  for (i = 0; i != 9; ++i)
  {
    -[OADTextListStyle propertiesForListLevel:](self, "propertiesForListLevel:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertiesForListLevel:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setParent:", v8);

  }
}

- (id)defaultProperties
{
  return (id)-[NSMutableArray objectAtIndex:](self->mParagraphProperties, "objectAtIndex:", 0);
}

- (void)removeUnnecessaryOverrides
{
  uint64_t i;
  void *v4;

  for (i = 0; i != 9; ++i)
  {
    -[OADTextListStyle propertiesForListLevel:](self, "propertiesForListLevel:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeUnnecessaryOverrides");

  }
}

- (void)overrideWithTextStyle:(id)a3
{
  uint64_t i;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  for (i = 0; i != 9; ++i)
  {
    -[OADTextListStyle propertiesForListLevel:](self, "propertiesForListLevel:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "propertiesForListLevel:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "overrideWithProperties:", v6);

  }
}

+ (id)defaultObject
{
  void *v2;
  OADTextListStyle *v3;
  void *v4;

  v2 = (void *)+[OADTextListStyle defaultObject]::defaultObject;
  if (!+[OADTextListStyle defaultObject]::defaultObject)
  {
    v3 = -[OADTextListStyle initWithDefaults]([OADTextListStyle alloc], "initWithDefaults");
    v4 = (void *)+[OADTextListStyle defaultObject]::defaultObject;
    +[OADTextListStyle defaultObject]::defaultObject = (uint64_t)v3;

    v2 = (void *)+[OADTextListStyle defaultObject]::defaultObject;
  }
  return v2;
}

- (void)setPropertiesForListLevel:(unint64_t)a3 properties:(id)a4
{
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->mParagraphProperties, "replaceObjectAtIndex:withObject:", a3, a4);
}

- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3
{
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[OADTextListStyle defaultProperties](self, "defaultProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeParentPreservingEffectiveValues:", v5);

  for (i = 0; i != 9; ++i)
  {
    -[OADTextListStyle propertiesForListLevel:](self, "propertiesForListLevel:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "propertiesForListLevel:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "changeParentPreservingEffectiveValues:", v8);

  }
}

- (void)flatten
{
  uint64_t i;
  void *v4;

  for (i = 0; i != 9; ++i)
  {
    -[OADTextListStyle propertiesForListLevel:](self, "propertiesForListLevel:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flatten");

  }
}

- (void)enumerateParagraphPropertiesUsingBlock:(id)a3
{
  -[NSMutableArray enumerateObjectsUsingBlock:](self->mParagraphProperties, "enumerateObjectsUsingBlock:", a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTextListStyle;
  -[OADTextListStyle description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)language
{
  return self->mLanguage;
}

- (void)setLanguage:(id)a3
{
  objc_storeStrong((id *)&self->mLanguage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLanguage, 0);
  objc_storeStrong((id *)&self->mParagraphProperties, 0);
}

@end
