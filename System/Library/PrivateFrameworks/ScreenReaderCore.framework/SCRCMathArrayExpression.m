@implementation SCRCMathArrayExpression

- (SCRCMathArrayExpression)initWithDictionary:(id)a3
{
  id v4;
  SCRCMathArrayExpression *v5;
  void *v6;
  NSArray *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSArray *children;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SCRCMathArrayExpression;
  v5 = -[SCRCMathExpression initWithDictionary:](&v21, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AXMChildren"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12), (_QWORD)v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "setParent:", v5);
            -[NSArray addObject:](v7, "addObject:", v14);
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }

    children = v5->_children;
    v5->_children = v7;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCRCMathArrayExpression;
  -[SCRCMathArrayExpression description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathArrayExpression children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - children %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)children
{
  return (id)-[NSArray copy](self->_children, "copy");
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1688], "scrcString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SCRCMathArrayExpression children](self, "children", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    v12 = 1;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((v12 & 1) == 0)
        {
          if (v4)
            objc_msgSend(MEMORY[0x24BDD1458], "scrcPauseString");
          else
            objc_msgSend(MEMORY[0x24BDD1458], "scrcSpaceString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendAttributedString:", v15);

        }
        objc_msgSend(v14, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:", a3, v4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendAttributedString:", v16);

        v12 = 0;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v12 = 0;
    }
    while (v10);
  }

  return v7;
}

- (id)childSpeakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 parentTreePosition:(id)a5 childIndex:(unint64_t *)a6
{
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = *a6;
  v10 = a5;
  -[SCRCMathArrayExpression children](self, "children");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "indexPathByAddingIndex:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCRCMathArrayExpression prefixForChildAtIndex:](self, "prefixForChildAtIndex:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathArrayExpression suffixForChildAtIndex:](self, "suffixForChildAtIndex:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:prefix:suffix:", a3, a4, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t i;
  objc_super v19;

  v8 = a5;
  if (a4)
  {
    v9 = a4 - 1;
    if (a4 == 1)
    {
      v19.receiver = self;
      v19.super_class = (Class)SCRCMathArrayExpression;
      -[SCRCMathExpression speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:](&v19, sel_speakableSegmentsWithSpeakingStyle_upToDepth_treePosition_, a3, 1, v8);
      a4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      a4 = objc_claimAutoreleasedReturnValue();
      -[SCRCMathArrayExpression children](self, "children");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      for (i = 0; i < v11; ++i)
      {
        -[SCRCMathArrayExpression childSpeakableSegmentsWithSpeakingStyle:upToDepth:parentTreePosition:childIndex:](self, "childSpeakableSegmentsWithSpeakingStyle:upToDepth:parentTreePosition:childIndex:", a3, v9, v8, &i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a4, "addObjectsFromArray:", v12);

      }
      v13 = objc_msgSend((id)a4, "count");
      if (v13 - 1 >= 0)
      {
        v14 = v13;
        do
        {
          objc_msgSend((id)a4, "objectAtIndex:", --v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "length");

          if (!v16)
            objc_msgSend((id)a4, "removeObjectAtIndex:", v14);
        }
        while (v14 > 0);
      }
    }
  }

  return (id)a4;
}

- (id)mathMLString
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SCRCMathArrayExpression children](self, "children", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "mathMLString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  -[SCRCMathArrayExpression mathMLTag](self, "mathMLTag");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathArrayExpression mathMLAttributes](self, "mathMLAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWrappedInMathMLTag:withAttributes:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)hasSimpleArrayOfChildren
{
  return 1;
}

- (NSString)mathMLTag
{
  return 0;
}

- (NSArray)mathMLAttributes
{
  return 0;
}

- (id)localizablePrefixForChildAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)localizableSuffixForChildAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)prefixForChildAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[SCRCMathArrayExpression localizablePrefixForChildAtIndex:](self, "localizablePrefixForChildAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression localizedAttributedStringForKey:](self, "localizedAttributedStringForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)suffixForChildAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[SCRCMathArrayExpression localizableSuffixForChildAtIndex:](self, "localizableSuffixForChildAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression localizedAttributedStringForKey:](self, "localizedAttributedStringForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
}

@end
