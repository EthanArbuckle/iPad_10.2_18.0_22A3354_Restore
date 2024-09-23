@implementation BKTOCRangeAnnotationTableCellAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKTOCRangeAnnotationTableCell");
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
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  objc_super v13;
  objc_super v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCellAccessibility aeHighlightedTextLabel](self, "aeHighlightedTextLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityLabel"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCellAccessibility aeHighlightStyleName](self, "aeHighlightStyleName"));
  if (objc_msgSend(v5, "length"))
  {
    v14.receiver = self;
    v14.super_class = (Class)BKTOCRangeAnnotationTableCellAccessibility;
    v6 = -[BKTOCRangeAnnotationTableCellAccessibility accessibilityLabel](&v14, "accessibilityLabel");
    v7 = objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BKTOCRangeAnnotationTableCellAccessibility;
    v9 = -[BKTOCRangeAnnotationTableCellAccessibility accessibilityLabel](&v13, "accessibilityLabel");
    v7 = objc_claimAutoreleasedReturnValue(v9);
  }
  v8 = (void *)v7;
  v10 = __IMAccessibilityStringForVariables(v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (id)accessibilityUserInputLabels
{
  id v3;
  void *v4;
  void *v5;
  __n128 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;
  char v14;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCellAccessibility aeHighlightedTextLabel](self, "aeHighlightedTextLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessibilityLabel"));

  if (objc_msgSend(v5, "length"))
    objc_msgSend(v3, "addObject:", v5);
  v14 = 0;
  v6 = objc_opt_class(BKTOCAnnotationTableCellAccessibility);
  v7 = __IMAccessibilityCastAsSafeCategory(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bkaxNoteLabelText"));

  if (objc_msgSend(v9, "length"))
    objc_msgSend(v3, "addObject:", v9);
  v13.receiver = self;
  v13.super_class = (Class)BKTOCRangeAnnotationTableCellAccessibility;
  v10 = -[BKTOCRangeAnnotationTableCellAccessibility accessibilityUserInputLabels](&v13, "accessibilityUserInputLabels");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v11)
    objc_msgSend(v3, "addObjectsFromArray:", v11);

  return v3;
}

- (id)accessibilityCustomContent
{
  NSMutableArray *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v3 = objc_opt_new(NSMutableArray);
  v4 = objc_alloc((Class)NSMutableAttributedString);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCellAccessibility aeHighlightedTextLabel](self, "aeHighlightedTextLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "annotationAttributedString"));
  v7 = objc_msgSend(v4, "initWithAttributedString:", v6);

  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v7, "addAttributes:range:", &off_1CD518, 0, objc_msgSend(v7, "length"));
    v8 = objc_msgSend(v7, "length");
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_E7CC4;
    v16[3] = &unk_1C1B78;
    v9 = v7;
    v17 = v9;
    objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 2, v16);
    v10 = objc_alloc((Class)NSAttributedString);
    v11 = AEAXLocString(CFSTR("highlight.context.custom.content.name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_msgSend(v10, "initWithString:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AXCustomContent customContentWithAttributedLabel:attributedValue:](AXCustomContent, "customContentWithAttributedLabel:attributedValue:", v13, v9));
    -[NSMutableArray addObject:](v3, "addObject:", v14);

  }
  return v3;
}

- (id)aeHighlightedTextLabel
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  *(_QWORD *)&v3 = objc_opt_class(AEHighlightedTextLabel).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCRangeAnnotationTableCellAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("highlightedTextLabel"), v3));
  v7 = __IMAccessibilityCastAsClass(v5, v6, 1, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v10)
    abort();
  return v8;
}

- (id)aeHighlightStyleName
{
  id v2;
  void *v3;
  void *v4;
  __n128 v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = -[BKTOCRangeAnnotationTableCellAccessibility aeHighlightedTextLabel](self, "aeHighlightedTextLabel", objc_opt_class(AEAnnotationAccessibility).n128_f64[0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotation"));
  v6 = __IMAccessibilityCastAsSafeCategory(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imaxWholeAnnotationDescription"));
  return v8;
}

@end
