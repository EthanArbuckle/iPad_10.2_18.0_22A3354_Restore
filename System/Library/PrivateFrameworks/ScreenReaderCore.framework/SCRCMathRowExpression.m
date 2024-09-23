@implementation SCRCMathRowExpression

- (BOOL)isNumber
{
  char v3;
  void *v4;
  void *v5;

  if (-[SCRCMathExpression isNumberOverride](self, "isNumberOverride"))
    return 1;
  -[SCRCMathArrayExpression children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "isNumber");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isInteger
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  -[SCRCMathArrayExpression children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
    return 0;
  -[SCRCMathArrayExpression children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInteger");

  return v7;
}

- (int64_t)integerValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[SCRCMathArrayExpression children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
    return 0;
  -[SCRCMathArrayExpression children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (BOOL)isFunctionName
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  -[SCRCMathArrayExpression children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
    return 0;
  -[SCRCMathArrayExpression children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFunctionName");

  return v7;
}

- (BOOL)isWordOrAbbreviation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  -[SCRCMathArrayExpression children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
    return 0;
  -[SCRCMathArrayExpression children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isWordOrAbbreviation");

  return v7;
}

- (BOOL)canBeUsedWithRange
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  -[SCRCMathArrayExpression children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
    return 0;
  -[SCRCMathArrayExpression children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canBeUsedWithRange");

  return v7;
}

- (BOOL)canBeUsedWithBase
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  -[SCRCMathArrayExpression children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
    return 0;
  -[SCRCMathArrayExpression children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canBeUsedWithBase");

  return v7;
}

- (BOOL)beginsWithSpace
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;

  -[SCRCMathArrayExpression children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  -[SCRCMathArrayExpression children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "beginsWithSpace");

  return v7;
}

- (BOOL)endsWithSpace
{
  void *v2;
  void *v3;
  char v4;

  -[SCRCMathArrayExpression children](self, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "endsWithSpace");

  return v4;
}

- (id)_indexesOfCharactersInWords
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  int v11;

  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathArrayExpression children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 + 1 >= v6)
      {
        v9 = 1;
      }
      else
      {
        v9 = 1;
        while (1)
        {
          objc_msgSend(v4, "objectAtIndex:", v7 + v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "canFormWordStartingWithExpression:", v8);

          if (!v11)
            break;
          if (v6 - v7 == ++v9)
          {
            v9 = v6 - v7;
            break;
          }
        }
        if (v9 >= 3)
          objc_msgSend(v3, "addIndexesInRange:", v7, v9);
      }
      v7 += v9;

    }
    while (v7 < v6);
  }

  return v3;
}

- (id)childSpeakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 parentTreePosition:(id)a5 childIndex:(unint64_t *)a6
{
  id v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  __CFString *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  char v40;
  void *v41;
  int v42;
  SCRCMathRowExpression *v44;
  __CFString *v45;
  __CFString *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  __CFString *v50;
  id v51;
  objc_super v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = *a6;
  -[SCRCMathArrayExpression children](self, "children");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  objc_msgSend(v12, "objectAtIndex:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isRangeSubSuperscript");
  if ((v15 | objc_msgSend(v14, "isBaseSubSuperscript")) != 1 || v11 >= v13 - 1)
  {
    v52.receiver = self;
    v52.super_class = (Class)SCRCMathRowExpression;
    -[SCRCMathArrayExpression childSpeakableSegmentsWithSpeakingStyle:upToDepth:parentTreePosition:childIndex:](&v52, sel_childSpeakableSegmentsWithSpeakingStyle_upToDepth_parentTreePosition_childIndex_, a3, a4, v10, a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = self;
    v18 = v12;
    if (v15)
      v19 = CFSTR("segment.range.firstchild.prefix");
    else
      v19 = CFSTR("segment.base.firstchild.prefix");
    v20 = CFSTR("segment.base.firstchild.suffix");
    if (v15)
      v20 = CFSTR("segment.range.firstchild.suffix");
    v21 = CFSTR("segment.base.secondchild.prefix");
    if (v15)
      v21 = CFSTR("segment.range.secondchild.prefix");
    v46 = (__CFString *)v21;
    v22 = CFSTR("segment.base.secondchild.suffix");
    if (v15)
      v22 = CFSTR("segment.range.secondchild.suffix");
    v50 = (__CFString *)v22;
    v23 = v20;
    v24 = v14;
    v25 = v19;
    objc_msgSend(v10, "indexPathByAddingIndex:", v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v24;
    objc_msgSend(v24, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:localizablePrefix:localizableSuffix:", a3, a4, v26, v25, v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v11 + 1;
    *a6 = v11 + 1;
    v49 = v18;
    objc_msgSend(v18, "objectAtIndex:", v11 + 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v46;
    v31 = v50;
    v51 = v10;
    objc_msgSend(v10, "indexPathByAddingIndex:", v28);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v30;
    v45 = v31;
    objc_msgSend(v29, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:localizablePrefix:localizableSuffix:", a3, a4, v32, v30, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    -[SCRCMathExpression localizedSegmentOrderingForKey:](v44, "localizedSegmentOrderingForKey:", CFSTR("RangeAndExpressionAfterRange"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v54 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("range"));
          v41 = v27;
          if ((v40 & 1) == 0)
          {
            v42 = objc_msgSend(v39, "isEqualToString:", CFSTR("expression after range"));
            v41 = v33;
            if (!v42)
              continue;
          }
          objc_msgSend(v17, "addObjectsFromArray:", v41);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
      }
      while (v36);
    }

    v12 = v49;
    v10 = v51;
    v14 = v48;
  }

  return v17;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  uint64_t v4;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v25;
  void *v26;
  unsigned int v27;
  SCRCMathRowExpression *v28;
  id v29;

  v4 = a4;
  -[SCRCMathArrayExpression children](self, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v28 = self;
  -[SCRCMathRowExpression _indexesOfCharactersInWords](self, "_indexesOfCharactersInWords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1688], "scrcString");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v9 = 0;
    v10 = v7 - 1;
    v27 = v4;
    v25 = v7 - 1;
    v26 = v6;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:isPartOfWord:", a3, v4, objc_msgSend(v8, "containsIndex:", v9));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isRangeSubSuperscript");
      if ((v13 | objc_msgSend(v11, "isBaseSubSuperscript")) == 1 && v9 < v10)
      {
        objc_msgSend(v6, "objectAtIndex:", ++v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:isPartOfWord:", a3, v4, objc_msgSend(v8, "containsIndex:", v9));
        v15 = v8;
        v16 = v7;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BDD1458];
        if (v13)
          v19 = CFSTR("range.sub.superscript.with.next.child.formatter");
        else
          v19 = CFSTR("base.sub.superscript.with.next.child.formatter");
        -[SCRCMathExpression localizedStringForKey:](v28, "localizedStringForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "scrcStringWithFormat:", v20, v12, v17);
        v21 = objc_claimAutoreleasedReturnValue();

        v7 = v16;
        v8 = v15;

        v12 = (void *)v21;
        v10 = v25;
        v6 = v26;
        v4 = v27;
      }
      if (objc_msgSend(v12, "length"))
      {
        objc_msgSend(v29, "appendAttributedString:", v12);
        if (v9 < v10 && (objc_msgSend(v8, "containsIndex:", v9) & 1) == 0)
        {
          if ((_DWORD)v4 && objc_msgSend(v12, "scrcContainsPause"))
          {
            objc_msgSend(MEMORY[0x24BDD1458], "scrcPauseString");
            v22 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1458], "scrcSpaceString");
            v22 = objc_claimAutoreleasedReturnValue();
          }
          v23 = (void *)v22;
          objc_msgSend(v29, "appendAttributedString:", v22);

        }
      }

      ++v9;
    }
    while (v9 < v7);
  }

  return v29;
}

- (void)_addSpacingAndChild:(id)a3 toResult:(id)a4 nextChild:(id)a5 previousChild:(id)a6 numberOfOuterRadicals:(unint64_t)a7 treePosition:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  char v18;
  int v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;

  v38 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  if ((objc_msgSend(v38, "isFunctionName") & 1) == 0 && !objc_msgSend(v38, "isWordOrAbbreviation"))
  {
    if (objc_msgSend(v38, "isEllipsis"))
    {
      v20 = objc_msgSend(v15, "isOperationSymbol");
      v19 = objc_msgSend(v14, "isOperationSymbol");
      if ((v20 & 1) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  if (!v15)
  {
    if (v14)
    {
      v19 = objc_msgSend(v14, "beginsWithSpace") ^ 1;
      goto LABEL_15;
    }
LABEL_12:
    v19 = 0;
    goto LABEL_15;
  }
  v17 = objc_msgSend(v15, "endsWithSpace");
  v18 = v17;
  if (v14)
  {
    v19 = objc_msgSend(v14, "beginsWithSpace") ^ 1;
    if ((v18 & 1) != 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  v19 = 0;
  if ((v17 & 1) == 0)
  {
LABEL_14:
    v21 = (void *)MEMORY[0x24BDD1458];
    objc_msgSend(v16, "indexPathByRemovingLastIndex");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "scrcStringWithString:treePosition:", CFSTR(" "), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendAttributedString:", v23);

  }
LABEL_15:
  if (objc_msgSend(v15, "isNumber") && objc_msgSend(v38, "isSimpleNumericalFraction"))
  {
    objc_msgSend(v38, "dollarCodeDescriptionAsMixedNumberFractionWithTreePosition:", v16);
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  if ((!objc_msgSend(v38, "isFenceDelimiter") || (objc_msgSend(v14, "isMultiRowTable") & 1) == 0)
    && (!objc_msgSend(v15, "isMultiRowTable") || (objc_msgSend(v38, "isFenceDelimiter") & 1) == 0))
  {
    if (objc_msgSend(v38, "isMultiRowTable"))
    {
      if (objc_msgSend(v15, "isFenceDelimiter"))
        v25 = v15;
      else
        v25 = 0;
      v37 = v25;
      if (objc_msgSend(v14, "isFenceDelimiter"))
        v26 = v14;
      else
        v26 = 0;
      v27 = v26;
      v28 = objc_msgSend(v16, "indexAtPosition:", objc_msgSend(v16, "length") - 1);
      objc_msgSend(v16, "indexPathByRemovingLastIndex");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "indexPathByAddingIndex:", v28 - 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "indexPathByRemovingLastIndex");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "indexPathByAddingIndex:", v28 + 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v38, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:openOperator:openOperatorTreePosition:closeOperator:closeOperatorTreePosition:", a7, v16, v37, v30, v27, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
LABEL_36:
        objc_msgSend(v13, "appendAttributedString:", v33);

        if (!v19)
          goto LABEL_33;
        goto LABEL_32;
      }
      goto LABEL_30;
    }
    objc_msgSend(v38, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:", a7, v16);
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_35:
    v33 = (void *)v24;
    if (v24)
      goto LABEL_36;
LABEL_30:
    NSLog(CFSTR("AX: VoiceOver: Math: Error: Could not get string for row child %@."), v38);
  }
  if (v19)
  {
LABEL_32:
    v34 = (void *)MEMORY[0x24BDD1458];
    objc_msgSend(v16, "indexPathByRemovingLastIndex");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "scrcStringWithString:treePosition:", CFSTR(" "), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appendAttributedString:", v36);

  }
LABEL_33:

}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t v18;
  id v19;

  v18 = a3;
  v19 = a4;
  objc_msgSend(MEMORY[0x24BDD1688], "scrcString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathArrayExpression children](self, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[SCRCMathArrayExpression children](self, "children");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0;
    v11 = 0;
    do
    {
      if (v10 >= v7 - 1)
      {
        v14 = 0;
        v13 = v10 + 1;
      }
      else
      {
        -[SCRCMathArrayExpression children](self, "children");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v10 + 1;
        objc_msgSend(v12, "objectAtIndex:", v10 + 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v19, "indexPathByAddingIndex:", v10, v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCRCMathRowExpression _addSpacingAndChild:toResult:nextChild:previousChild:numberOfOuterRadicals:treePosition:](self, "_addSpacingAndChild:toResult:nextChild:previousChild:numberOfOuterRadicals:treePosition:", v9, v5, v14, v11, v18, v15);

      v16 = v9;
      v10 = v13;
      v9 = v14;
      v11 = v16;
    }
    while (v13 != v7);

  }
  return v5;
}

- (id)mathMLTag
{
  return CFSTR("mrow");
}

- (id)speakableSummary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[SCRCMathArrayExpression children](self, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v4)
  {
    v15 = 0;
    goto LABEL_14;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v22;
  v8 = 1;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      v10 = v8;
      if (*(_QWORD *)v22 != v7)
        objc_enumerationMutation(v3);
      v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      v8 = objc_msgSend(v11, "isTermSeparator");
      if ((v8 & 1) == 0 && ((v10 ^ 1) & 1) == 0)
        v6 += objc_msgSend(v11, "isTermSeparator") ^ 1;
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v5);

  if (v6 >= 4)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("row.summary.formatter"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathExpression localizedStringForNumber:](self, "localizedStringForNumber:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v3, v14);
    v15 = objc_claimAutoreleasedReturnValue();

LABEL_14:
    goto LABEL_16;
  }
  v15 = 0;
LABEL_16:
  v20.receiver = self;
  v20.super_class = (Class)SCRCMathRowExpression;
  -[SCRCMathExpression speakableSummary](&v20, sel_speakableSummary);
  v16 = objc_claimAutoreleasedReturnValue();
  if (v15 | v16)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v15)
    {
      objc_msgSend(v17, "appendString:", v15);
      if (v16)
      {
        objc_msgSend(v18, "appendString:", CFSTR(", "));
LABEL_22:
        objc_msgSend(v18, "appendString:", v16);
      }
    }
    else if (v16)
    {
      goto LABEL_22;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)latexDescriptionInMathMode:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[SCRCMathArrayExpression children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    v5 = 0;
    goto LABEL_25;
  }
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v7)
  {

    goto LABEL_25;
  }
  v8 = v7;
  v17 = v4;
  v9 = 0;
  v10 = *(_QWORD *)v19;
  v11 = 1;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      objc_msgSend(v13, "latexDescriptionInMathMode:", 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        if (!a3)
        {
          if (v9 & 1 | ((objc_msgSend(v13, "canBeWrappedInLatexMathIndicators") & 1) == 0))
          {
            if ((objc_msgSend(v13, "canBeWrappedInLatexMathIndicators") & 1) != 0)
              goto LABEL_15;
            v15 = v9 ^ 1;
            if (((v9 ^ 1) & 1) != 0)
              goto LABEL_15;
          }
          else
          {
            v15 = v9 ^ 1;
          }
          objc_msgSend(v5, "appendString:", CFSTR("$"));
          v9 = v15;
        }
LABEL_15:
        if ((v11 & 1) == 0)
          objc_msgSend(v5, "appendString:", CFSTR(" "));
        objc_msgSend(v5, "appendString:", v14);
        v11 = 0;
      }

    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v8);

  if ((v9 & 1) != 0)
    objc_msgSend(v5, "appendString:", CFSTR("$"));
  v4 = v17;
LABEL_25:

  return v5;
}

@end
