@implementation SCRCMathUnderOverExpression

- (SCRCMathUnderOverExpression)initWithDictionary:(id)a3
{
  id v4;
  SCRCMathUnderOverExpression *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCRCMathUnderOverExpression;
  v5 = -[SCRCMathExpression initWithDictionary:](&v13, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AXMUnderObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathUnderOverExpression setUnder:](v5, "setUnder:", v7);

    objc_msgSend(v4, "objectForKey:", CFSTR("AXMOverObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathUnderOverExpression setOver:](v5, "setOver:", v9);

    objc_msgSend(v4, "objectForKey:", CFSTR("AXMBaseObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCRCMathExpression mathExpressionWithDictionary:](SCRCMathExpression, "mathExpressionWithDictionary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathUnderOverExpression setBase:](v5, "setBase:", v11);

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SCRCMathUnderOverExpression;
  -[SCRCMathUnderOverExpression description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathUnderOverExpression under](self, "under");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathUnderOverExpression over](self, "over");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathUnderOverExpression base](self, "base");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" - under %@, over %@, base %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)subExpressions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SCRCMathUnderOverExpression base](self, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathUnderOverExpression under](self, "under");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathUnderOverExpression over](self, "over");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression arrayWithoutNilsFromFirstChild:secondChild:thirdChild:](self, "arrayWithoutNilsFromFirstChild:secondChild:thirdChild:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isRangeSubSuperscript
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[SCRCMathUnderOverExpression base](self, "base");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (-[SCRCMathUnderOverExpression over](self, "over"), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    -[SCRCMathUnderOverExpression under](self, "under");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      LOBYTE(v6) = objc_msgSend(v3, "canBeUsedWithRange");
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v20;

  v4 = a4;
  -[SCRCMathUnderOverExpression base](self, "base");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:", a3, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCRCMathUnderOverExpression under](self, "under");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:", a3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCRCMathUnderOverExpression over](self, "over");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:", a3, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length"))
  {
    -[SCRCMathExpression localizedAttributedStringForKey:](self, "localizedAttributedStringForKey:", CFSTR("empty.content"));
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v13;
  }
  if (-[SCRCMathUnderOverExpression isRangeSubSuperscript](self, "isRangeSubSuperscript"))
  {
    v14 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("range.sub.superscript.formatter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v12;
LABEL_5:
    objc_msgSend(v14, "scrcStringWithFormat:", v15, v8, v10, v20);
LABEL_17:
    v17 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
  if (objc_msgSend(v12, "length") && !objc_msgSend(v10, "length"))
  {
    v16 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("generic.over.formula.formatter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (!objc_msgSend(v12, "length") && objc_msgSend(v10, "length"))
  {
    v14 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("generic.under.formula.formatter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v12, "length") && objc_msgSend(v10, "length"))
  {
    v16 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("generic.over.under.formula.formatter"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v10;
LABEL_16:
    objc_msgSend(v16, "scrcStringWithFormat:", v15, v12, v8, v20);
    goto LABEL_17;
  }
  v17 = v8;
LABEL_18:
  v18 = v17;

  return v18;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  unint64_t v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int64_t v33;
  unint64_t v34;
  void *v35;
  const __CFString *v36;
  const __CFString *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id obj;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v44 = a5;
  if (a4)
  {
    v8 = a4 - 1;
    if (a4 == 1)
    {
      v53.receiver = self;
      v53.super_class = (Class)SCRCMathUnderOverExpression;
      -[SCRCMathExpression speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:](&v53, sel_speakableSegmentsWithSpeakingStyle_upToDepth_treePosition_, a3, 1, v44);
      a4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_40;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    a4 = objc_claimAutoreleasedReturnValue();
    if (-[SCRCMathUnderOverExpression isRangeSubSuperscript](self, "isRangeSubSuperscript"))
    {
      v51 = 0uLL;
      v52 = 0uLL;
      v49 = 0uLL;
      v50 = 0uLL;
      -[SCRCMathExpression localizedSegmentOrderingForKey:](self, "localizedSegmentOrderingForKey:", CFSTR("RangeSubSuperscript"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      if (!v9)
        goto LABEL_39;
      v10 = v9;
      v11 = *(_QWORD *)v50;
      while (1)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v50 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if (objc_msgSend(v13, "isEqualToString:", CFSTR("base")))
          {
            -[SCRCMathUnderOverExpression base](self, "base");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "indexPathByAddingIndex:", 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:", a3, v8, v15);
            v16 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (objc_msgSend(v13, "isEqualToString:", CFSTR("subscript")))
            {
              -[SCRCMathUnderOverExpression under](self, "under");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "indexPathByAddingIndex:", 2);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v14;
              v18 = a3;
              v19 = v8;
              v20 = v15;
              v21 = CFSTR("segment.range.subscript.prefix");
              v22 = CFSTR("segment.range.subscript.suffix");
            }
            else
            {
              if (!objc_msgSend(v13, "isEqualToString:", CFSTR("superscript")))
                continue;
              -[SCRCMathUnderOverExpression over](self, "over");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "indexPathByAddingIndex:", 1);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v14;
              v18 = a3;
              v19 = v8;
              v20 = v15;
              v21 = CFSTR("segment.range.superscript.prefix");
              v22 = CFSTR("segment.range.superscript.suffix");
            }
            objc_msgSend(v17, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:localizablePrefix:localizableSuffix:", v18, v19, v20, v21, v22);
            v16 = objc_claimAutoreleasedReturnValue();
          }
          v23 = (void *)v16;
          objc_msgSend((id)a4, "addObjectsFromArray:", v16);

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
        if (!v10)
        {
LABEL_39:

          goto LABEL_40;
        }
      }
    }
    v47 = 0uLL;
    v48 = 0uLL;
    v45 = 0uLL;
    v46 = 0uLL;
    -[SCRCMathExpression localizedSegmentOrderingForKey:](self, "localizedSegmentOrderingForKey:", CFSTR("UnderOver"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (!v24)
      goto LABEL_39;
    v25 = v24;
    v26 = *(_QWORD *)v46;
LABEL_23:
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v46 != v26)
        objc_enumerationMutation(obj);
      v28 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v27);
      if (objc_msgSend(v28, "isEqualToString:", CFSTR("over")))
      {
        -[SCRCMathUnderOverExpression over](self, "over");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
          break;
      }
      if (!objc_msgSend(v28, "isEqualToString:", CFSTR("base"))
        || (-[SCRCMathUnderOverExpression base](self, "base"),
            v38 = (void *)objc_claimAutoreleasedReturnValue(),
            v38,
            !v38))
      {
        if (!objc_msgSend(v28, "isEqualToString:", CFSTR("under")))
          goto LABEL_37;
        -[SCRCMathUnderOverExpression under](self, "under");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v40)
          goto LABEL_37;
        -[SCRCMathUnderOverExpression under](self, "under");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "indexPathByAddingIndex:", 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v30;
        v33 = a3;
        v34 = v8;
        v35 = v31;
        v36 = CFSTR("segment.under.prefix");
        v37 = CFSTR("segment.under.suffix");
        goto LABEL_35;
      }
      -[SCRCMathUnderOverExpression base](self, "base");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "indexPathByAddingIndex:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:", a3, v8, v31);
      v39 = objc_claimAutoreleasedReturnValue();
LABEL_36:
      v41 = (void *)v39;
      objc_msgSend((id)a4, "addObjectsFromArray:", v39);

LABEL_37:
      if (v25 == ++v27)
      {
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (!v25)
          goto LABEL_39;
        goto LABEL_23;
      }
    }
    -[SCRCMathUnderOverExpression over](self, "over");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "indexPathByAddingIndex:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v30;
    v33 = a3;
    v34 = v8;
    v35 = v31;
    v36 = CFSTR("segment.over.prefix");
    v37 = CFSTR("segment.over.suffix");
LABEL_35:
    objc_msgSend(v32, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:localizablePrefix:localizableSuffix:", v33, v34, v35, v36, v37);
    v39 = objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
LABEL_40:

  return (id)a4;
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v32;

  v6 = a4;
  objc_msgSend(v6, "indexPathByAddingIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathUnderOverExpression base](self, "base");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SCRCMathUnderOverExpression base](self, "base");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:", a3, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithString:treePosition:", &stru_24CB26880, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SCRCMathUnderOverExpression over](self, "over");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

  }
  else
  {
    -[SCRCMathUnderOverExpression under](self, "under");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = v10;
      goto LABEL_12;
    }
  }
  objc_msgSend(MEMORY[0x24BDD1688], "scrcString");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", CFSTR("e"), v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendAttributedString:", v14);

  objc_msgSend(v13, "appendAttributedString:", v10);
  -[SCRCMathUnderOverExpression under](self, "under");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v6, "indexPathByAddingIndex:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", CFSTR("us"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathUnderOverExpression under](self, "under");
    v32 = v7;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:", a3, v16);
    v19 = v6;
    v20 = v10;
    v21 = a3;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", CFSTR("ue"), v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scrcAppendFormat:", CFSTR("%@%@%@"), v17, v22, v23);

    a3 = v21;
    v10 = v20;
    v6 = v19;

    v7 = v32;
  }
  -[SCRCMathUnderOverExpression over](self, "over");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v6, "indexPathByAddingIndex:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", CFSTR("os"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathUnderOverExpression over](self, "over");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:", a3, v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithDollarCode:treePosition:", CFSTR("oe"), v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scrcAppendFormat:", CFSTR("%@%@%@"), v26, v28, v29);

  }
LABEL_12:
  v30 = v13;

  return v30;
}

- (id)mathMLString
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;

  -[SCRCMathUnderOverExpression under](self, "under");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[SCRCMathUnderOverExpression over](self, "over"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    -[SCRCMathUnderOverExpression base](self, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mathMLString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathUnderOverExpression under](self, "under");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mathMLString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathUnderOverExpression over](self, "over");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mathMLString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@%@"), v8, v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWrappedInMathMLTag:", CFSTR("munderover"));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SCRCMathUnderOverExpression under](self, "under");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      -[SCRCMathUnderOverExpression base](self, "base");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mathMLString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCRCMathUnderOverExpression under](self, "under");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mathMLString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@%@"), v8, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v17;
      v18 = CFSTR("munder");
    }
    else
    {
      -[SCRCMathUnderOverExpression over](self, "over");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v14 = &stru_24CB26880;
        return v14;
      }
      v20 = (void *)MEMORY[0x24BDD17C8];
      -[SCRCMathUnderOverExpression base](self, "base");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mathMLString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCRCMathUnderOverExpression over](self, "over");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mathMLString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%@%@"), v8, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v17;
      v18 = CFSTR("mover");
    }
    objc_msgSend(v17, "stringWrappedInMathMLTag:", v18);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)latexMathModeDescription
{
  void *v3;
  SCRCMathExpression *over;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  -[SCRCMathExpression latexDescriptionInMathMode:](self->_base, "latexDescriptionInMathMode:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  over = self->_over;
  if (self->_under)
  {
    if (over)
      return v3;
    objc_msgSend(0, "latexFormatStringAsUnder");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SCRCMathExpression latexFormatStringAsOver](over, "latexFormatStringAsOver");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v5, v3);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }

  return v3;
}

- (SCRCMathExpression)under
{
  return self->_under;
}

- (void)setUnder:(id)a3
{
  objc_storeStrong((id *)&self->_under, a3);
}

- (SCRCMathExpression)over
{
  return self->_over;
}

- (void)setOver:(id)a3
{
  objc_storeStrong((id *)&self->_over, a3);
}

- (SCRCMathExpression)base
{
  return self->_base;
}

- (void)setBase:(id)a3
{
  objc_storeStrong((id *)&self->_base, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_over, 0);
  objc_storeStrong((id *)&self->_under, 0);
}

@end
