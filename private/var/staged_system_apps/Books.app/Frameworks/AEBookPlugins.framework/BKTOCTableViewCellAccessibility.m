@implementation BKTOCTableViewCellAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKTOCTableViewCell");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  unsigned int v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCellAccessibility bkaxTextLabel](self, "bkaxTextLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCellAccessibility bkaxTarget](self, "bkaxTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "detailTextLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessibilityLabel"));

  v7 = AEAXLocString(CFSTR("toc.indentationLevel %ld"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, -[BKTOCTableViewCellAccessibility bkaxIndentationDepth](self, "bkaxIndentationDepth")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCellAccessibility bkaxTarget](self, "bkaxTarget"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pageLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCellAccessibility bkaxTarget](self, "bkaxTarget"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pageLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accessibilityLabel"));

  if (v15)
  {
    if (objc_msgSend(v12, "rangeOfString:", CFSTR(":")) == (id)0x7FFFFFFFFFFFFFFFLL
      && (int)objc_msgSend(v12, "intValue") >= 1)
    {
      v16 = AEAXLocString(CFSTR("page.num %@"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v12));

    }
    else
    {
      v18 = v15;
    }
  }
  else
  {
    v18 = 0;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCellAccessibility bkaxTarget](self, "bkaxTarget"));
  v20 = objc_msgSend(v19, "bkaxIsExcludedFromSample");

  if (v20)
  {
    v21 = AEAXLocString(CFSTR("excluded.from.sample"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  }
  else
  {
    v22 = 0;
  }
  v23 = __IMAccessibilityStringForVariables(v3);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  return v24;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKTOCTableViewCellAccessibility;
  v3 = -[BKTOCTableViewCellAccessibility accessibilityTraits](&v7, "accessibilityTraits");
  objc_opt_class(BKTOCPointAnnotationTableCell);
  if ((objc_opt_isKindOfClass(self, v4) & 1) == 0)
  {
    objc_opt_class(BKTOCRangeAnnotationTableCell);
    if ((objc_opt_isKindOfClass(self, v5) & 1) == 0
      && !-[BKTOCTableViewCellAccessibility bkaxIndentationDepth](self, "bkaxIndentationDepth"))
    {
      v3 |= UIAccessibilityTraitHeader;
    }
  }
  return v3;
}

- (id)accessibilityUserInputLabels
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;
  uint64_t v18;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCellAccessibility bkaxTextLabel](self, "bkaxTextLabel"));
  v5 = objc_msgSend(v4, "length");
  if (v5)
  {
    v6 = v5;
    v18 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("^[[:digit:]]+[[:punct:]]+[[:space:]]+"), 0, &v18));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstMatchInString:options:range:", v4, 0, 0, v6));
    v9 = v8;
    if (v8 && objc_msgSend(v8, "range") != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByTrimmingCharactersInSet:", v12));

      if (objc_msgSend(v13, "length"))
        objc_msgSend(v3, "addObject:", v13);

    }
    objc_msgSend(v3, "addObject:", v4);

  }
  v17.receiver = self;
  v17.super_class = (Class)BKTOCTableViewCellAccessibility;
  v14 = -[BKTOCTableViewCellAccessibility accessibilityUserInputLabels](&v17, "accessibilityUserInputLabels");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (v15)
    objc_msgSend(v3, "addObjectsFromArray:", v15);

  return v3;
}

- (id)bkaxTarget
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v7;

  v7 = 0;
  v3 = objc_opt_class(BKTOCTableViewCell);
  v4 = __IMAccessibilityCastAsClass(v3, self, 1, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v7)
    abort();
  return v5;
}

- (int64_t)bkaxIndentationDepth
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCellAccessibility imaxValueForKey:](self, "imaxValueForKey:", BKNavigationInfoPropertyIndentationLevel));
  v3 = objc_msgSend(v2, "integerValue");

  return (int64_t)v3;
}

- (id)bkaxTextLabel
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCellAccessibility bkaxTarget](self, "bkaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityLabel"));

  return v4;
}

@end
