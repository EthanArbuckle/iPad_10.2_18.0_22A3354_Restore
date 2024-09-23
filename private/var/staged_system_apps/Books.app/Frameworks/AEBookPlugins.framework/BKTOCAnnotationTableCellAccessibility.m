@implementation BKTOCAnnotationTableCellAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKTOCAnnotationTableCell");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (id)bkaxNoteLabelText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCellAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_noteLabel")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityLabel"));

  return v3;
}

- (id)accessibilityLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v3 = AEAXLocString(CFSTR("annotation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCellAccessibility bkaxNoteLabelText](self, "bkaxNoteLabelText"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCellAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_dateLabel")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessibilityLabel"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCAnnotationTableCellAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_pageLabel")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessibilityLabel"));

  if (objc_msgSend(v9, "length"))
  {
    v10 = AEAXLocString(CFSTR("page.num %@"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v9));

    v9 = (void *)v12;
  }
  v13 = __IMAccessibilityStringForVariables(v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  return v14;
}

@end
