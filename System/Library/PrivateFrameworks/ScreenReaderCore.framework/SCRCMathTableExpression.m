@implementation SCRCMathTableExpression

- (BOOL)isMultiRowTable
{
  void *v2;
  BOOL v3;

  -[SCRCMathArrayExpression children](self, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a4;
  -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("math.table.formatter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)SCRCMathTableExpression;
  -[SCRCMathArrayExpression speakableDescriptionWithSpeakingStyle:arePausesAllowed:](&v11, sel_speakableDescriptionWithSpeakingStyle_arePausesAllowed_, a3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCRCMathTableExpression;
  -[SCRCMathArrayExpression speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:](&v9, sel_speakableSegmentsWithSpeakingStyle_upToDepth_treePosition_, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression speakableSegments:withLocalizablePrefix:localizableSuffix:](self, "speakableSegments:withLocalizablePrefix:localizableSuffix:", v6, CFSTR("segment.table.prefix"), CFSTR("segment.table.suffix"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  return -[SCRCMathTableExpression dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:openOperator:openOperatorTreePosition:closeOperator:closeOperatorTreePosition:](self, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:openOperator:openOperatorTreePosition:closeOperator:closeOperatorTreePosition:", a3, a4, 0, 0, 0, 0);
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4 openOperator:(id)a5 openOperatorTreePosition:(id)a6 closeOperator:(id)a7 closeOperatorTreePosition:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  uint64_t v33;
  SCRCMathTableExpression *v34;

  v14 = a4;
  v15 = a5;
  v32 = a6;
  v16 = a7;
  v17 = a8;
  objc_msgSend(MEMORY[0x24BDD1688], "scrcString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = self;
  -[SCRCMathArrayExpression children](self, "children");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  v33 = v20;
  if (v20)
  {
    v21 = 0;
    do
    {
      -[SCRCMathArrayExpression children](v34, "children");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndex:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithString:treePosition:", CFSTR("\n"), v14);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "appendAttributedString:", v24);

      }
      if (v15)
      {
        objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", CFSTR("big"), v32);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "appendAttributedString:", v25);

        objc_msgSend(v15, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:", a3, v32);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "appendAttributedString:", v26);

      }
      objc_msgSend(v14, "indexPathByAddingIndex:", v21);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:", a3, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "appendAttributedString:", v28);

      if (v16)
      {
        objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", CFSTR("big"), v17);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "appendAttributedString:", v29);

        objc_msgSend(v16, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:", a3, v17);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "appendAttributedString:", v30);

      }
      ++v21;
    }
    while (v33 != v21);
  }

  return v18;
}

- (id)mathMLTag
{
  return CFSTR("mtable");
}

- (unint64_t)_numberOfColumns
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SCRCMathArrayExpression children](self, "children", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "children");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v9 > v5)
          v5 = v9;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)numberOfTables
{
  unint64_t result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCRCMathTableExpression;
  result = -[SCRCMathExpression numberOfTables](&v3, sel_numberOfTables);
  if (result <= 1)
    return 1;
  return result;
}

- (id)latexDescriptionInMathMode:(BOOL)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  v4 = (void *)objc_msgSend(CFSTR("\\begin{tabular}{"), "mutableCopy", a3);
  v5 = -[SCRCMathTableExpression _numberOfColumns](self, "_numberOfColumns");
  if (v5)
  {
    v6 = v5;
    do
    {
      objc_msgSend(v4, "appendString:", CFSTR("c"));
      --v6;
    }
    while (v6);
  }
  objc_msgSend(v4, "appendString:", CFSTR("}\n"));
  -[SCRCMathExpression latexDescriptionForChildrenJoinedByString:](self, "latexDescriptionForChildrenJoinedByString:", CFSTR(" \\\\\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v7);

  objc_msgSend(v4, "appendString:", CFSTR("\n\\end{tabular}"));
  return v4;
}

- (BOOL)canBeWrappedInLatexMathIndicators
{
  return 0;
}

@end
