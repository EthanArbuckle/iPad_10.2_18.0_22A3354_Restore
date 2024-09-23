@implementation SCRCMathRadicalExpression

- (SCRCMathRadicalExpression)initWithDictionary:(id)a3
{
  id v4;
  SCRCMathRadicalExpression *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCRCMathRadicalExpression;
  v5 = -[SCRCMathExpression initWithDictionary:](&v11, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AXMRadicandObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathRadicalExpression setRadicand:](v5, "setRadicand:", v7);

    objc_msgSend(v4, "objectForKey:", CFSTR("AXMRootIndexObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathRadicalExpression setRootIndex:](v5, "setRootIndex:", v9);

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SCRCMathRadicalExpression;
  -[SCRCMathRadicalExpression description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathRadicalExpression radicand](self, "radicand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathRadicalExpression rootIndex](self, "rootIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - radicand %@, root index %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)subExpressions
{
  void *v3;
  void *v4;
  void *v5;

  -[SCRCMathRadicalExpression rootIndex](self, "rootIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathRadicalExpression radicand](self, "radicand");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression arrayWithoutNilsFromFirstChild:secondChild:thirdChild:](self, "arrayWithoutNilsFromFirstChild:secondChild:thirdChild:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_isSquareRoot
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[SCRCMathRadicalExpression rootIndex](self, "rootIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  -[SCRCMathRadicalExpression rootIndex](self, "rootIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isInteger"))
  {
    -[SCRCMathRadicalExpression rootIndex](self, "rootIndex");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue") == 2;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isCubeRoot
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SCRCMathRadicalExpression rootIndex](self, "rootIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInteger"))
  {
    -[SCRCMathRadicalExpression rootIndex](self, "rootIndex");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue") == 3;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a4;
  -[SCRCMathRadicalExpression radicand](self, "radicand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:", a3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SCRCMathRadicalExpression _isSquareRoot](self, "_isSquareRoot"))
  {
    v9 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("square.root.formatter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scrcStringWithFormat:", v10, v8);
  }
  else
  {
    v11 = -[SCRCMathRadicalExpression _isCubeRoot](self, "_isCubeRoot");
    v12 = (void *)MEMORY[0x24BDD1458];
    if (!v11)
    {
      -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("nth.root.formatter"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCRCMathRadicalExpression rootIndex](self, "rootIndex");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:", a3, v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scrcStringWithFormat:", v10, v15, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("cube.root.formatter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scrcStringWithFormat:", v10, v8);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v13;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void **v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  char v27;
  void *v28;
  int v29;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  void *v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = v8;
  if (!a4)
  {
    v11 = 0;
    goto LABEL_22;
  }
  v10 = a4 - 1;
  if (a4 == 1)
  {
    v37.receiver = self;
    v37.super_class = (Class)SCRCMathRadicalExpression;
    -[SCRCMathExpression speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:](&v37, sel_speakableSegmentsWithSpeakingStyle_upToDepth_treePosition_, a3, 1, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  objc_msgSend(v8, "indexPathByAddingIndex:", 0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (-[SCRCMathRadicalExpression _isSquareRoot](self, "_isSquareRoot"))
  {
    -[SCRCMathExpression localizedAttributedStringForKey:treePosition:](self, "localizedAttributedStringForKey:treePosition:", CFSTR("segment.square.root.index"), v12, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v13;
    v14 = (void *)MEMORY[0x24BDBCE30];
    v15 = (void **)v40;
  }
  else
  {
    if (!-[SCRCMathRadicalExpression _isCubeRoot](self, "_isCubeRoot", v12))
    {
      -[SCRCMathRadicalExpression rootIndex](self, "rootIndex");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:localizablePrefix:localizableSuffix:", a3, v10, v12, CFSTR("segment.nth.root.index.prefix"), CFSTR("segment.nth.root.index.suffix"));
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    -[SCRCMathExpression localizedAttributedStringForKey:treePosition:](self, "localizedAttributedStringForKey:treePosition:", CFSTR("segment.cube.root.index"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v13;
    v14 = (void *)MEMORY[0x24BDBCE30];
    v15 = &v39;
  }
  objc_msgSend(v14, "arrayWithObjects:count:", v15, 1);
  v16 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v17 = (void *)v16;

  -[SCRCMathRadicalExpression radicand](self, "radicand");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v9;
  objc_msgSend(v9, "indexPathByAddingIndex:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:localizablePrefix:localizableSuffix:", a3, v10, v19, CFSTR("segment.radicand.prefix"), CFSTR("segment.radicand.suffix"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[SCRCMathExpression localizedSegmentOrderingForKey:](self, "localizedSegmentOrderingForKey:", CFSTR("Radical"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v34 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("radicand"));
        v28 = v20;
        if ((v27 & 1) == 0)
        {
          v29 = objc_msgSend(v26, "isEqualToString:", CFSTR("root index"));
          v28 = v17;
          if (!v29)
            continue;
        }
        objc_msgSend(v11, "addObjectsFromArray:", v28);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v23);
  }

  v9 = v32;
LABEL_22:

  return v11;
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1688], "scrcString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathRadicalExpression rootIndex](self, "rootIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8 == 0;
  if (v8)
    v10 = CFSTR("ixrte");
  else
    v10 = CFSTR("sqrte");
  if (v9)
    v11 = CFSTR("sqrts");
  else
    v11 = CFSTR("ixrts");
  if (a3)
  {
    -[__CFString stringByAppendingFormat:](v11, "stringByAppendingFormat:", CFSTR("%lu"), a3);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v10, "stringByAppendingFormat:", CFSTR("%lu"), a3);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[SCRCMathRadicalExpression rootIndex](self, "rootIndex");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", v11, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v13);

    -[SCRCMathRadicalExpression rootIndex](self, "rootIndex");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = a3 + 1;
    objc_msgSend(v6, "indexPathByAddingIndex:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v17);

    objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", CFSTR("ixrtd"), v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v18);

    -[SCRCMathRadicalExpression radicand](self, "radicand");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathByAddingIndex:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:", v15, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v21);

    objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", v10, v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v22);
  }
  else
  {
    objc_msgSend(v6, "indexPathByAddingIndex:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", v11, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v23);

    -[SCRCMathRadicalExpression radicand](self, "radicand");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathByAddingIndex:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:", a3 + 1, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v26);

    objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", v10, v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendAttributedString:", v27);

  }
  return v7;
}

- (id)mathMLString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SCRCMathRadicalExpression rootIndex](self, "rootIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[SCRCMathRadicalExpression radicand](self, "radicand");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mathMLString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathRadicalExpression rootIndex](self, "rootIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mathMLString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWrappedInMathMLTag:", CFSTR("mroot"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SCRCMathRadicalExpression radicand](self, "radicand");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mathMLString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWrappedInMathMLTag:", CFSTR("msqrt"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)latexMathModeDescription
{
  void *v3;
  SCRCMathExpression *rootIndex;
  void *v5;
  SCRCMathExpression *radicand;
  void *v7;

  v3 = (void *)objc_msgSend(CFSTR("\\sqrt"), "mutableCopy");
  rootIndex = self->_rootIndex;
  if (rootIndex)
  {
    -[SCRCMathExpression latexDescriptionInMathMode:](rootIndex, "latexDescriptionInMathMode:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("[%@]"), v5);

  }
  radicand = self->_radicand;
  if (radicand)
  {
    -[SCRCMathExpression latexDescriptionInMathMode:](radicand, "latexDescriptionInMathMode:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("{%@}"), v7);

  }
  return v3;
}

- (SCRCMathExpression)radicand
{
  return self->_radicand;
}

- (void)setRadicand:(id)a3
{
  objc_storeStrong((id *)&self->_radicand, a3);
}

- (SCRCMathExpression)rootIndex
{
  return self->_rootIndex;
}

- (void)setRootIndex:(id)a3
{
  objc_storeStrong((id *)&self->_rootIndex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootIndex, 0);
  objc_storeStrong((id *)&self->_radicand, 0);
}

@end
