@implementation SCRCMathExpression

+ (id)mathExpressionWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("AXMType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_classForExpressionType:", v5)), "initWithDictionary:", v4);

  return v6;
}

- (SCRCMathExpression)initWithDictionary:(id)a3
{
  id v4;
  SCRCMathExpression *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCRCMathExpression;
  v5 = -[SCRCMathExpression init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AXMIsNumberOverride"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      LOBYTE(v6) = objc_msgSend(v6, "BOOLValue");
    v5->_isNumberOverride = (char)v6;

  }
  return v5;
}

- (NSArray)subExpressions
{
  return 0;
}

- (id)speakableDescription
{
  return -[SCRCMathExpression speakableDescriptionWithSpeakingStyle:](self, "speakableDescriptionWithSpeakingStyle:", 0);
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3
{
  return -[SCRCMathExpression speakableDescriptionWithSpeakingStyle:arePausesAllowed:](self, "speakableDescriptionWithSpeakingStyle:arePausesAllowed:", a3, 1);
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  return 0;
}

- (id)speakableDescriptionAsBinomialCoefficientWithSpeakingStyle:(int64_t)a3
{
  return 0;
}

- (id)dollarCodeDescription
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:](self, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:", 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  return 0;
}

- (id)dollarCodeDescriptionAsMixedNumberFractionWithTreePosition:(id)a3
{
  return 0;
}

- (id)dollarCodeDescriptionAsBinomialCoefficientWithTreePosition:(id)a3 numberOfOuterRadicals:(unint64_t)a4
{
  return 0;
}

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4 openOperator:(id)a5 openOperatorTreePosition:(id)a6 closeOperator:(id)a7 closeOperatorTreePosition:(id)a8
{
  return 0;
}

- (unint64_t)maximumDepth
{
  unint64_t result;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  result = self->_cachedMaximumDepth;
  if (!result)
  {
    -[SCRCMathExpression subExpressions](self, "subExpressions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
      {
        v7 = v6;
        v8 = 0;
        v9 = *(_QWORD *)v14;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v14 != v9)
              objc_enumerationMutation(v5);
            v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "maximumDepth", (_QWORD)v13);
            if (v11 > v8)
              v8 = v11;
            ++v10;
          }
          while (v7 != v10);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v7);
        v12 = v8 + 1;
      }
      else
      {
        v12 = 1;
      }

    }
    else
    {
      v12 = 1;
    }
    self->_cachedMaximumDepth = v12;

    return self->_cachedMaximumDepth;
  }
  return result;
}

- (id)speakableSegmentsUpToDepth:(unint64_t)a3
{
  return -[SCRCMathExpression speakableSegmentsWithSpeakingStyle:upToDepth:](self, "speakableSegmentsWithSpeakingStyle:upToDepth:", 0, a3);
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:](self, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:", a3, a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  -[SCRCMathExpression speakableDescriptionWithSpeakingStyle:](self, "speakableDescriptionWithSpeakingStyle:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v10, "addAttribute:value:range:", CFSTR("kSCRCMathStringAttributeTreePosition"), v7, 0, objc_msgSend(v10, "length"));
    v13[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)speakableSegmentsAsBinomialCoefficientWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5
{
  return 0;
}

- (id)mathMLString
{
  return 0;
}

- (id)speakableSummary
{
  unint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v3 = -[SCRCMathExpression numberOfTables](self, "numberOfTables");
  v4 = (void *)v3;
  if (v3)
  {
    if (v3 == 1)
      v5 = CFSTR("table.summary.single.formatter");
    else
      v5 = CFSTR("table.summary.multiple.formatter");
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v6, v4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)latexDescription
{
  return -[SCRCMathExpression latexDescriptionInMathMode:](self, "latexDescriptionInMathMode:", 0);
}

- (id)latexDescriptionInMathMode:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  -[SCRCMathExpression latexMathModeDescription](self, "latexMathModeDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!a3)
  {
    objc_msgSend(v4, "stringWithMathIndicators");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  return v5;
}

- (id)latexMathModeDescription
{
  return 0;
}

- (NSArray)children
{
  return 0;
}

- (BOOL)isRangeSubSuperscript
{
  return 0;
}

- (BOOL)canBeUsedWithRange
{
  return 0;
}

- (BOOL)isBaseSubSuperscript
{
  return 0;
}

- (BOOL)canBeUsedWithBase
{
  return 0;
}

- (BOOL)isNumber
{
  return 0;
}

- (BOOL)isInteger
{
  return 0;
}

- (int64_t)integerValue
{
  return 0;
}

- (BOOL)isNaturalSuperscript
{
  return 0;
}

- (BOOL)hasSimpleArrayOfChildren
{
  return 0;
}

- (BOOL)isEllipsis
{
  return 0;
}

- (BOOL)isTermSeparator
{
  return 0;
}

- (BOOL)isOperationSymbol
{
  return 0;
}

- (BOOL)isFenceDelimiter
{
  return 0;
}

- (BOOL)isFunctionName
{
  return 0;
}

- (BOOL)isWordOrAbbreviation
{
  return 0;
}

- (unint64_t)fractionLevel
{
  return 0;
}

- (BOOL)isSimpleNumericalFraction
{
  return 0;
}

- (BOOL)beginsWithSpace
{
  return 0;
}

- (BOOL)endsWithSpace
{
  return 0;
}

- (BOOL)isMultiRowTable
{
  return 0;
}

- (BOOL)isUnlinedFraction
{
  return 0;
}

- (BOOL)canFormWordStartingWithExpression:(id)a3
{
  return 0;
}

- (unint64_t)numberOfTables
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SCRCMathExpression subExpressions](self, "subExpressions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "numberOfTables");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSString)latexFormatStringAsOver
{
  return 0;
}

- (NSString)latexFormatStringAsUnder
{
  return 0;
}

- (id)_scrcBundle
{
  if (_scrcBundle_onceToken != -1)
    dispatch_once(&_scrcBundle_onceToken, &__block_literal_global_2);
  return (id)_scrcBundle_ScreenReaderCoreBundle;
}

void __33__SCRCMathExpression__scrcBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.ScreenReaderCore"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_scrcBundle_ScreenReaderCoreBundle;
  _scrcBundle_ScreenReaderCoreBundle = v0;

}

- (id)localizedStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SCRCMathExpression _scrcBundle](self, "_scrcBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_24CB26880, CFSTR("MathExpressionStrings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedAttributedStringForKey:(id)a3
{
  return -[SCRCMathExpression localizedAttributedStringForKey:treePosition:](self, "localizedAttributedStringForKey:treePosition:", a3, 0);
}

- (id)localizedAttributedStringForKey:(id)a3 treePosition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v14 = CFSTR("kSCRCMathStringAttributeTreePosition");
    v15[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v10 = objc_alloc(MEMORY[0x24BDD1458]);
  -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithString:attributes:", v11, v9);

  return v12;
}

- (id)localizedStringForNumber:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = localizedStringForNumber__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&localizedStringForNumber__onceToken, &__block_literal_global_15);
  objc_msgSend((id)localizedStringForNumber__NumberFormatter, "stringFromNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __47__SCRCMathExpression_localizedStringForNumber___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)localizedStringForNumber__NumberFormatter;
  localizedStringForNumber__NumberFormatter = (uint64_t)v0;

}

- (id)localizedSegmentOrderingForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SCRCMathExpression_localizedSegmentOrderingForKey___block_invoke;
  block[3] = &unk_24CB25540;
  block[4] = self;
  if (localizedSegmentOrderingForKey__onceToken != -1)
    dispatch_once(&localizedSegmentOrderingForKey__onceToken, block);
  if (_PathToSegmentOrderingPlist)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (id)localizedSegmentOrderingForKey__SegmentOrderings;
  }
  v6 = v5;
  objc_msgSend(v5, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __53__SCRCMathExpression_localizedSegmentOrderingForKey___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(*(id *)(a1 + 32), "_scrcBundle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", CFSTR("MathExpressionSegmentOrdering"), CFSTR("plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithContentsOfFile:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)localizedSegmentOrderingForKey__SegmentOrderings;
  localizedSegmentOrderingForKey__SegmentOrderings = v3;

}

- (NSArray)siblings
{
  void *v2;
  void *v3;

  -[SCRCMathExpression parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "children");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)arrayWithoutNilsFromFirstChild:(id)a3 secondChild:(id)a4 thirdChild:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
    objc_msgSend(v10, "addObject:", v7);
  if (v8)
    objc_msgSend(v11, "addObject:", v8);
  if (v9)
    objc_msgSend(v11, "addObject:", v9);

  return v11;
}

- (void)_applyTreePositionOfOriginalSegment:(id)a3 toPrefixedOrSuffixedSegment:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v7, "attribute:atIndex:effectiveRange:", CFSTR("kSCRCMathStringAttributeTreePosition"), 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v5, "addAttribute:value:range:", CFSTR("kSCRCMathStringAttributeTreePosition"), v6, 0, objc_msgSend(v5, "length"));

  }
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5 localizablePrefix:(id)a6 localizableSuffix:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v12 = a7;
  v13 = a5;
  -[SCRCMathExpression localizedAttributedStringForKey:](self, "localizedAttributedStringForKey:", a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression localizedAttributedStringForKey:](self, "localizedAttributedStringForKey:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCRCMathExpression speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:prefix:suffix:](self, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:prefix:suffix:", a3, a4, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)speakableSegmentsWithSpeakingStyle:(int64_t)a3 upToDepth:(unint64_t)a4 treePosition:(id)a5 prefix:(id)a6 suffix:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;

  v12 = a7;
  v13 = a6;
  -[SCRCMathExpression speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:](self, "speakableSegmentsWithSpeakingStyle:upToDepth:treePosition:", a3, a4, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression speakableSegments:withPrefix:suffix:](self, "speakableSegments:withPrefix:suffix:", v14, v13, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)speakableSegments:(id)a3 withLocalizablePrefix:(id)a4 localizableSuffix:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a3;
  -[SCRCMathExpression localizedAttributedStringForKey:](self, "localizedAttributedStringForKey:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathExpression localizedAttributedStringForKey:](self, "localizedAttributedStringForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SCRCMathExpression speakableSegments:withPrefix:suffix:](self, "speakableSegments:withPrefix:suffix:", v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)speakableSegments:(id)a3 withPrefix:(id)a4 suffix:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_msgSend(a3, "mutableCopy");
  if (objc_msgSend(v10, "count"))
  {
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v10, "objectAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1688], "scrcStringWithFormat:", CFSTR("%@%@"), v8, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCRCMathExpression _applyTreePositionOfOriginalSegment:toPrefixedOrSuffixedSegment:](self, "_applyTreePositionOfOriginalSegment:toPrefixedOrSuffixedSegment:", v11, v12);
      objc_msgSend(v10, "replaceObjectAtIndex:withObject:", 0, v12);

    }
    if (objc_msgSend(v9, "length"))
    {
      objc_msgSend(v10, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1688], "scrcStringWithFormat:", CFSTR("%@%@"), v13, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCRCMathExpression _applyTreePositionOfOriginalSegment:toPrefixedOrSuffixedSegment:](self, "_applyTreePositionOfOriginalSegment:toPrefixedOrSuffixedSegment:", v13, v14);
      objc_msgSend(v10, "replaceObjectAtIndex:withObject:", objc_msgSend(v10, "count") - 1, v14);

    }
  }

  return v10;
}

- (unint64_t)maximumFractionLevelOfSubExpressions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SCRCMathExpression subExpressions](self, "subExpressions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "fractionLevel") > v5)
          v5 = objc_msgSend(v8, "fractionLevel");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)fenceDelimiters
{
  if (fenceDelimiters_onceToken != -1)
    dispatch_once(&fenceDelimiters_onceToken, &__block_literal_global_25);
  return (id)fenceDelimiters_Delimiters;
}

void __37__SCRCMathExpression_fenceDelimiters__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24CB30568);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)fenceDelimiters_Delimiters;
  fenceDelimiters_Delimiters = v0;

}

- (id)latexIdentifierForIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  if (latexIdentifierForIdentifier__onceToken != -1)
    dispatch_once(&latexIdentifierForIdentifier__onceToken, &__block_literal_global_41);
  objc_msgSend((id)latexIdentifierForIdentifier___IdentifierLookupTable, "objectForKey:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = v3;

  return v4;
}

void __51__SCRCMathExpression_latexIdentifierForIdentifier___block_invoke()
{
  void *v0;

  v0 = (void *)latexIdentifierForIdentifier___IdentifierLookupTable;
  latexIdentifierForIdentifier___IdentifierLookupTable = (uint64_t)&unk_24CB30598;

}

- (id)latexIdentifierForFenceOperator:(id)a3 isClosingOperator:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a4;
  v6 = a3;
  -[SCRCMathExpression fenceDelimiters](self, "fenceDelimiters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "containsObject:", v6))
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    -[SCRCMathExpression latexIdentifierForIdentifier:](self, "latexIdentifierForIdentifier:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v4)
      objc_msgSend(v8, "stringWithFormat:", CFSTR("\\right%@"), v9);
    else
      objc_msgSend(v8, "stringWithFormat:", CFSTR("\\left%@"), v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SCRCMathExpression latexIdentifierForIdentifier:](self, "latexIdentifierForIdentifier:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)latexDescriptionForChildrenJoinedByString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SCRCMathExpression children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "latexDescriptionInMathMode:", 0, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "componentsJoinedByString:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)canBeWrappedInLatexMathIndicators
{
  return 1;
}

+ (Class)_classForExpressionType:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Row")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Identifier")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Operator")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("SubSuperScript")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Space")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Text")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Fraction")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("UnderOver")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("RootOperation")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("TableCell")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("TableRow")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Table")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Fenced")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("LongDivision")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Number")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("Multiscript")))
  {
    v4 = (void *)objc_opt_class();
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (SCRCMathExpression)parent
{
  return (SCRCMathExpression *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (BOOL)isNumberOverride
{
  return self->_isNumberOverride;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
}

+ (void)setPathToSegmentOrderingPlist:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)_PathToSegmentOrderingPlist != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&_PathToSegmentOrderingPlist, a3);
    v4 = v5;
  }

}

@end
