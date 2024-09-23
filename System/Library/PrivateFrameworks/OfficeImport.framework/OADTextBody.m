@implementation OADTextBody

- (OADTextBody)init
{
  OADTextBody *v2;
  OADTextBodyProperties *v3;
  OADTextBodyProperties *mProperties;
  NSMutableArray *v5;
  NSMutableArray *mParagraphs;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OADTextBody;
  v2 = -[OADTextBody init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(OADTextBodyProperties);
    mProperties = v2->mProperties;
    v2->mProperties = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mParagraphs = v2->mParagraphs;
    v2->mParagraphs = v5;

  }
  return v2;
}

- (id)addParagraph
{
  OADParagraph *v3;

  v3 = objc_alloc_init(OADParagraph);
  -[NSMutableArray addObject:](self->mParagraphs, "addObject:", v3);
  return v3;
}

- (id)properties
{
  return self->mProperties;
}

- (id)findFirstTextRunOfClass:(Class)a3
{
  unsigned int i;
  void *v6;
  void *v7;

  for (i = 0; -[NSMutableArray count](self->mParagraphs, "count") > (unint64_t)i; ++i)
  {
    -[NSMutableArray objectAtIndex:](self->mParagraphs, "objectAtIndex:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "findFirstTextRunOfClass:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      return v7;
  }
  v7 = 0;
  return v7;
}

- (void)setParentTextListStyle:(id)a3
{
  id v4;
  OADTextListStyle *mTextListStyle;
  OADTextListStyle *v6;
  OADTextListStyle *v7;
  id v8;

  v4 = a3;
  mTextListStyle = self->mTextListStyle;
  v8 = v4;
  if (!mTextListStyle)
  {
    v6 = objc_alloc_init(OADTextListStyle);
    v7 = self->mTextListStyle;
    self->mTextListStyle = v6;

    -[NSMutableArray makeObjectsPerformSelector:withObject:](self->mParagraphs, "makeObjectsPerformSelector:withObject:", sel_setParentTextListStyle_, self->mTextListStyle);
    mTextListStyle = self->mTextListStyle;
    v4 = v8;
  }
  -[OADTextListStyle setParentTextListStyle:](mTextListStyle, "setParentTextListStyle:", v4);

}

- (void)removeUnnecessaryOverrides
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;

  v3 = -[NSMutableArray count](self->mParagraphs, "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->mParagraphs, "objectAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeUnnecessaryOverrides");

    }
  }
  -[OADTextListStyle removeUnnecessaryOverrides](self->mTextListStyle, "removeUnnecessaryOverrides");
  -[OADTextBodyProperties removeUnnecessaryOverrides](self->mProperties, "removeUnnecessaryOverrides");
}

- (id)textListStyle
{
  return self->mTextListStyle;
}

- (id)overrideTextListStyle
{
  OADTextListStyle *mTextListStyle;
  OADTextListStyle *v4;
  OADTextListStyle *v5;

  mTextListStyle = self->mTextListStyle;
  if (!mTextListStyle)
  {
    v4 = objc_alloc_init(OADTextListStyle);
    v5 = self->mTextListStyle;
    self->mTextListStyle = v4;

    -[NSMutableArray makeObjectsPerformSelector:withObject:](self->mParagraphs, "makeObjectsPerformSelector:withObject:", sel_setParentTextListStyle_, self->mTextListStyle);
    mTextListStyle = self->mTextListStyle;
  }
  return mTextListStyle;
}

- (unint64_t)paragraphCount
{
  return -[NSMutableArray count](self->mParagraphs, "count");
}

- (id)paragraphAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mParagraphs, "objectAtIndex:", a3);
}

- (BOOL)isEmpty
{
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  unint64_t i;
  void *v7;
  char v8;

  v3 = -[NSMutableArray count](self->mParagraphs, "count");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    for (i = 0; i != v4; v5 = i >= v4)
    {
      -[NSMutableArray objectAtIndex:](self->mParagraphs, "objectAtIndex:", i);
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

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->mProperties, a3);
}

- (unint64_t)nonEmptyParagraphCount
{
  uint64_t v3;
  unint64_t v4;
  unsigned int v5;
  void *v6;

  if (!-[NSMutableArray count](self->mParagraphs, "count"))
    return 0;
  v3 = 0;
  LODWORD(v4) = 0;
  v5 = 1;
  do
  {
    -[NSMutableArray objectAtIndex:](self->mParagraphs, "objectAtIndex:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v4 + (objc_msgSend(v6, "isEmpty") ^ 1);

    v3 = v5;
  }
  while (-[NSMutableArray count](self->mParagraphs, "count") > (unint64_t)v5++);
  return v4;
}

- (void)removeAllParagraphs
{
  -[NSMutableArray removeAllObjects](self->mParagraphs, "removeAllObjects");
}

- (unint64_t)newLineCount
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
  v2 = self->mParagraphs;
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
        v3 += objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "lineBreakCount", (_QWORD)v8) + 1;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return v3;
}

- (id)firstParagraphEffects
{
  void *v3;
  void *v4;
  void *v5;

  if (-[OADTextBody paragraphCount](self, "paragraphCount"))
  {
    -[OADTextBody paragraphAtIndex:](self, "paragraphAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "properties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 && objc_msgSend(v4, "hasEffects"))
    {
      objc_msgSend(v4, "effects");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)applyTextListStyle:(id)a3
{
  OADTextListStyle *v4;
  OADTextListStyle *mTextListStyle;
  id v6;

  v6 = a3;
  if (!self->mTextListStyle)
  {
    v4 = objc_alloc_init(OADTextListStyle);
    mTextListStyle = self->mTextListStyle;
    self->mTextListStyle = v4;

    -[OADTextListStyle overrideWithTextStyle:](self->mTextListStyle, "overrideWithTextStyle:", v6);
  }
  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->mParagraphs, "makeObjectsPerformSelector:withObject:", sel_applyProperties_, v6);

}

- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3 ownTextListStyle:(BOOL)a4
{
  _BOOL4 v4;
  OADTextListStyle *v6;
  OADTextListStyle *mTextListStyle;
  OADTextListStyle *v8;
  OADTextListStyle *v9;
  OADTextListStyle *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (OADTextListStyle *)a3;
  mTextListStyle = self->mTextListStyle;
  if (mTextListStyle)
  {
    self->mTextListStyle = 0;

  }
  if (v4)
  {
    v8 = objc_alloc_init(OADTextListStyle);
    v9 = self->mTextListStyle;
    self->mTextListStyle = v8;

    -[OADTextListStyle setParentTextListStyle:](self->mTextListStyle, "setParentTextListStyle:", v6);
    if (-[OADTextBody propagateActualTextStyleToTextListStyle](self, "propagateActualTextStyleToTextListStyle"))
      -[OADTextListStyle changeParentTextListStylePreservingEffectiveValues:](self->mTextListStyle, "changeParentTextListStylePreservingEffectiveValues:", v6);
    v10 = self->mTextListStyle;

    v6 = v10;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v11 = self->mParagraphs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "changeParentTextListStylePreservingEffectiveValues:", v6, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)removeTrailingNewlines
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = -[NSMutableArray count](self->mParagraphs, "count");
  if (v3 - 1 >= 0)
  {
    v4 = v3;
    while (1)
    {
      -[NSMutableArray objectAtIndex:](self->mParagraphs, "objectAtIndex:", --v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v5, "isEmpty"))
        break;
      -[NSMutableArray removeLastObject](self->mParagraphs, "removeLastObject");

      if (v4 <= 0)
        return;
    }

  }
}

- (void)removeLeadingNewlines
{
  NSMutableArray *i;
  id v4;

  for (i = self->mParagraphs; -[NSMutableArray count](i, "count"); i = self->mParagraphs)
  {
    -[NSMutableArray objectAtIndex:](self->mParagraphs, "objectAtIndex:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEmpty") & 1) == 0)
    {

      return;
    }
    -[NSMutableArray removeObjectAtIndex:](self->mParagraphs, "removeObjectAtIndex:", 0);

  }
}

- (void)removeLastParagraphIfEmpty
{
  id v3;

  if (-[NSMutableArray count](self->mParagraphs, "count"))
  {
    -[NSMutableArray lastObject](self->mParagraphs, "lastObject");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isEmpty"))
      -[NSMutableArray removeLastObject](self->mParagraphs, "removeLastObject");

  }
}

- (void)flattenProperties
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;

  -[OADProperties flatten](self->mProperties, "flatten");
  v3 = -[NSMutableArray count](self->mParagraphs, "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->mParagraphs, "objectAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "properties");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "flatten");

    }
  }
  -[OADTextListStyle flatten](self->mTextListStyle, "flatten");
}

- (BOOL)propagateActualTextStyleToTextListStyle
{
  void *v3;
  unint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  -[OADTextBody textListStyle](self, "textListStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[OADTextBody paragraphCount](self, "paragraphCount");
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      -[OADTextBody paragraphAtIndex:](self, "paragraphAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "properties");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "level");

      if ((_DWORD)i != v8)
      {

        goto LABEL_10;
      }
      v9 = objc_msgSend(v6, "textRunCount");

      if (v9 != 1)
        goto LABEL_10;
    }
    for (j = 0; j != v4; ++j)
    {
      -[OADTextBody paragraphAtIndex:](self, "paragraphAtIndex:", j);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "properties");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "propertiesForListLevel:", j);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "overrideWithProperties:", v12);
      objc_msgSend(v11, "textRunAtIndex:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "properties");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "overrideWithCharacterProperties:", v15);

    }
    v16 = 1;
  }
  else
  {
LABEL_10:
    v16 = 0;
  }

  return v16;
}

- (BOOL)isSimilarToTextBody:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  unint64_t i;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "paragraphCount");
  if (objc_msgSend(v4, "paragraphCount") == v5)
  {
    if (v5)
    {
      v6 = 0;
      for (i = 0; i != v5; v6 = i >= v5)
      {
        -[OADTextBody paragraphAtIndex:](self, "paragraphAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "paragraphAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isSimilarToParagraph:", v9);

        if ((v10 & 1) == 0)
          break;
        ++i;
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

  return v6;
}

- (id)plainText
{
  void *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  v4 = -[NSMutableArray count](self->mParagraphs, "count");
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->mParagraphs, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEmpty") & 1) == 0)
      {
        if ((v5 & 1) != 0)
          objc_msgSend(v3, "appendString:", CFSTR("\n"));
        objc_msgSend(v7, "plainText");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v8);

        v5 = 1;
      }

      ++v6;
    }
    while (v4 != v6);
  }
  return v3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTextBody;
  -[OADTextBody description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTextListStyle, 0);
  objc_storeStrong((id *)&self->mParagraphs, 0);
  objc_storeStrong((id *)&self->mProperties, 0);
}

- (void)addParagraphsFromTextBody:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->mParagraphs, "addObjectsFromArray:", *((_QWORD *)a3 + 2));
}

@end
