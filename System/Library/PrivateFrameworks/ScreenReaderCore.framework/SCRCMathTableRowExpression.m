@implementation SCRCMathTableRowExpression

- (id)dollarCodeDescriptionWithNumberOfOuterRadicals:(unint64_t)a3 treePosition:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1688], "scrcString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCRCMathArrayExpression children](self, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    for (i = 0; i != v9; ++i)
    {
      -[SCRCMathArrayExpression children](self, "children");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (i)
      {
        objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithString:treePosition:", CFSTR(" "), v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendAttributedString:", v13);

      }
      objc_msgSend(v6, "indexPathByAddingIndex:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dollarCodeDescriptionWithNumberOfOuterRadicals:treePosition:", a3, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendAttributedString:", v15);

    }
  }

  return v7;
}

- (id)mathMLTag
{
  return CFSTR("mtr");
}

- (id)latexDescriptionInMathMode:(BOOL)a3
{
  return -[SCRCMathExpression latexDescriptionForChildrenJoinedByString:](self, "latexDescriptionForChildrenJoinedByString:", CFSTR(" & "));
}

- (BOOL)canBeWrappedInLatexMathIndicators
{
  return 0;
}

@end
