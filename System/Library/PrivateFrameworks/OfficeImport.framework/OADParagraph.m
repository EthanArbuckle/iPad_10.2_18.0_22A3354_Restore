@implementation OADParagraph

- (OADParagraph)init
{
  OADParagraph *v2;
  OADParagraphProperties *v3;
  OADParagraphProperties *mProperties;
  NSMutableArray *v5;
  NSMutableArray *mTextRuns;
  OADCharacterProperties *v7;
  OADCharacterProperties *mParagraphEndCharacterProperties;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OADParagraph;
  v2 = -[OADParagraph init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(OADParagraphProperties);
    mProperties = v2->mProperties;
    v2->mProperties = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mTextRuns = v2->mTextRuns;
    v2->mTextRuns = v5;

    v7 = objc_alloc_init(OADCharacterProperties);
    mParagraphEndCharacterProperties = v2->mParagraphEndCharacterProperties;
    v2->mParagraphEndCharacterProperties = v7;

    -[OADProperties setParent:](v2->mParagraphEndCharacterProperties, "setParent:", v2->mProperties);
  }
  return v2;
}

- (id)properties
{
  return self->mProperties;
}

- (unint64_t)textRunCount
{
  return -[NSMutableArray count](self->mTextRuns, "count");
}

- (id)addRegularTextRun
{
  OADRegularTextRun *v3;
  void *v4;

  v3 = objc_alloc_init(OADRegularTextRun);
  -[OADTextRun properties](v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParent:", self->mProperties);

  -[NSMutableArray addObject:](self->mTextRuns, "addObject:", v3);
  return v3;
}

- (id)textRunAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mTextRuns, "objectAtIndex:", a3);
}

- (id)paragraphEndCharacterProperties
{
  return self->mParagraphEndCharacterProperties;
}

- (id)addFooterField
{
  OADFooterField *v3;
  void *v4;

  v3 = objc_alloc_init(OADFooterField);
  -[OADTextRun properties](v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParent:", self->mProperties);

  -[NSMutableArray addObject:](self->mTextRuns, "addObject:", v3);
  return v3;
}

- (id)addSlideNumberField
{
  PDSlideNumberField *v3;
  void *v4;

  v3 = objc_alloc_init(PDSlideNumberField);
  -[OADTextRun properties](v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParent:", self->mProperties);

  -[NSMutableArray addObject:](self->mTextRuns, "addObject:", v3);
  return v3;
}

- (id)findFirstTextRunOfClass:(Class)a3
{
  unsigned int v4;
  uint64_t v5;
  void *v6;
  char isKindOfClass;
  void *v8;

  v4 = 0;
  while (-[NSMutableArray count](self->mTextRuns, "count", a3) > (unint64_t)v4)
  {
    v5 = v4;
    -[NSMutableArray objectAtIndex:](self->mTextRuns, "objectAtIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    v4 = v5 + 1;
    if ((isKindOfClass & 1) != 0)
    {
      -[NSMutableArray objectAtIndex:](self->mTextRuns, "objectAtIndex:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    }
  }
  v8 = 0;
  return v8;
}

- (void)setParentTextListStyle:(id)a3
{
  OADParagraphProperties *mProperties;
  void *v5;
  id v6;

  v6 = a3;
  mProperties = self->mProperties;
  objc_msgSend(v6, "propertiesForListLevel:", -[OADParagraphProperties level](mProperties, "level"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADProperties setParent:](mProperties, "setParent:", v5);

}

- (void)removeUnnecessaryOverrides
{
  unint64_t v3;
  unint64_t v4;
  uint64_t i;
  void *v6;

  -[OADCharacterProperties removeUnnecessaryOverrides](self->mParagraphEndCharacterProperties, "removeUnnecessaryOverrides");
  v3 = -[OADParagraph textRunCount](self, "textRunCount");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      -[OADParagraph textRunAtIndex:](self, "textRunAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeUnnecessaryOverrides");

    }
  }
  -[OADParagraphProperties removeUnnecessaryOverrides](self->mProperties, "removeUnnecessaryOverrides");
}

- (id)addTextLineBreak
{
  OADTextLineBreak *v3;
  void *v4;

  v3 = objc_alloc_init(OADTextLineBreak);
  -[OADTextRun properties](v3, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParent:", self->mProperties);

  -[NSMutableArray addObject:](self->mTextRuns, "addObject:", v3);
  return v3;
}

- (BOOL)isEmpty
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;
  unint64_t i;
  void *v7;
  char v8;

  v3 = -[OADParagraph textRunCount](self, "textRunCount");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    for (i = 0; i != v4; v5 = i >= v4)
    {
      -[OADParagraph textRunAtIndex:](self, "textRunAtIndex:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEmpty");

      if ((v8 & 1) == 0)
        break;
      ++i;
    }
  }
  else
  {
    return 1;
  }
  return v5;
}

- (unint64_t)characterCount
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;

  v3 = -[OADParagraph textRunCount](self, "textRunCount");
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  for (i = 0; i != v4; ++i)
  {
    -[OADParagraph textRunAtIndex:](self, "textRunAtIndex:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 += objc_msgSend(v7, "characterCount");

  }
  return v5;
}

- (void)removeAllTextRuns
{
  -[NSMutableArray removeAllObjects](self->mTextRuns, "removeAllObjects");
}

- (unint64_t)lineBreakCount
{
  NSMutableArray *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->mTextRuns;
  v3 = 0;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_opt_class();
        v3 += objc_opt_isKindOfClass() & 1;
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return v3;
}

- (id)addGenericTextFieldWithGuid:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  OADGenericTextField *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = -[OADGenericTextField initWithGuid:type:]([OADGenericTextField alloc], "initWithGuid:type:", v6, v7);
  -[OADTextRun properties](v8, "properties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setParent:", self->mProperties);

  -[NSMutableArray addObject:](self->mTextRuns, "addObject:", v8);
  return v8;
}

- (id)addDateTimeFieldWithFormat:(int)a3
{
  uint64_t v3;
  OADDateTimeField *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc_init(OADDateTimeField);
  -[OADTextRun properties](v5, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setParent:", self->mProperties);

  -[OADDateTimeField setFormat:](v5, "setFormat:", v3);
  -[NSMutableArray addObject:](self->mTextRuns, "addObject:", v5);
  return v5;
}

- (void)setParagraphEndCharacterProperties:(id)a3
{
  objc_storeStrong((id *)&self->mParagraphEndCharacterProperties, a3);
}

- (BOOL)hasBulletCharacterProperties
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[OADParagraph isEmpty](self, "isEmpty"))
    return 0;
  -[OADParagraph textRunAtIndex:](self, "textRunAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5 != 0;

  return v3;
}

- (id)bulletCharacterProperties
{
  void *v2;
  void *v3;

  -[OADParagraph textRunAtIndex:](self, "textRunAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "propertiesForListLevel:", -[OADParagraphProperties level](self->mProperties, "level"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADParagraph changeParentParagraphPropertiesPreservingEffectiveValues:](self, "changeParentParagraphPropertiesPreservingEffectiveValues:", v4);

}

- (void)changeParentParagraphPropertiesPreservingEffectiveValues:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[OADProperties changeParentPreservingEffectiveValues:](self->mProperties, "changeParentPreservingEffectiveValues:", v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->mTextRuns;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "properties", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "changeParentPreservingEffectiveValues:", self->mProperties);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[OADProperties changeParentPreservingEffectiveValues:](self->mParagraphEndCharacterProperties, "changeParentPreservingEffectiveValues:", self->mProperties);
}

- (void)applyProperties:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[OADParagraph properties](self, "properties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "propertiesForListLevel:", (int)objc_msgSend(v4, "level"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overrideWithProperties:", v5);

}

- (BOOL)isSimilarToParagraph:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v5 = -[OADParagraph textRunCount](self, "textRunCount");
  if (objc_msgSend(v4, "textRunCount") == v5)
  {
    if (v5)
    {
      v6 = 0;
      v7 = 0;
      while (1)
      {
        -[OADParagraph textRunAtIndex:](self, "textRunAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "textRunAtIndex:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_opt_class();
        if (v10 != objc_opt_class())
          break;
        v11 = objc_msgSend(v8, "isSimilarToTextRun:", v9);

        if ((v11 & 1) != 0)
        {
          v6 = ++v7 >= v5;
          if (v5 != v7)
            continue;
        }
        goto LABEL_11;
      }

    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
LABEL_11:

  return v6;
}

- (id)plainText
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  v4 = -[OADParagraph textRunCount](self, "textRunCount");
  if (v4)
  {
    v5 = 0;
    do
    {
      -[OADParagraph textRunAtIndex:](self, "textRunAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEmpty") & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v3, "appendString:", CFSTR("\n"));
      }
      else
      {
        objc_msgSend(v6, "text");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v7);

      }
      ++v5;
    }
    while (v4 != v5);
  }
  return v3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADParagraph;
  -[OADParagraph description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mParagraphEndCharacterProperties, 0);
  objc_storeStrong((id *)&self->mTextRuns, 0);
  objc_storeStrong((id *)&self->mProperties, 0);
}

@end
