@implementation TSTWPTokenAttachmentAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTWPTokenAttachment");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSWPAttachmentAccessibility, a2);
}

- (BOOL)tsaxIsMovingReferenceToken
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543887);
}

- (void)tsaxSetMovingReferenceToken:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543887, a3);
}

- (id)_tsaxExpressionNode
{
  return -[TSTWPTokenAttachmentAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("expressionNode"));
}

- (id)_tsaxReferenceNode
{
  id v2;
  Class v3;

  v2 = -[TSTWPTokenAttachmentAccessibility _tsaxExpressionNode](self, "_tsaxExpressionNode");
  v3 = NSClassFromString(CFSTR("TSTReferenceNode"));
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    return v2;
  else
    return 0;
}

- (TSTTableRepAccessibility)_tsaxTableRep
{
  TSWPEditingControllerAccessibility *v2;
  void *v3;
  Class v4;
  char v6;

  v2 = -[TSWPRepAccessibility tsaxEditingController](-[TSWPAttachmentAccessibility tsaxParentTextRep](self, "tsaxParentTextRep"), "tsaxEditingController");
  v6 = 0;
  v3 = (void *)objc_opt_class(TSTFormulaTextEditingControllerAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v2, 1, &v6);
  if (v6)
    abort();
  return (TSTTableRepAccessibility *)-[objc_class tsaxTableRep](v4, "tsaxTableRep");
}

- (NSString)tsaxFormulaPlainText
{
  return (NSString *)-[TSTWPTokenAttachmentAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("formulaPlainText"));
}

- (NSString)tsaxRoleDescription
{
  id v2;
  Class v3;
  Class v5;
  const __CFString *v6;
  Class v7;
  Class v8;

  v2 = -[TSTWPTokenAttachmentAccessibility _tsaxExpressionNode](self, "_tsaxExpressionNode");
  v3 = NSClassFromString(CFSTR("TSTReferenceNode"));
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    if ((objc_msgSend(v2, "tsaxBoolValueForKey:", CFSTR("isBlankForKeyboardInsertion")) & 1) != 0)
      return (NSString *)&stru_43D7D8;
    if (objc_msgSend(v2, "tsaxBoolValueForKey:", CFSTR("isRange")))
      v6 = CFSTR("formula.token.range.role.description");
    else
      v6 = CFSTR("formula.token.cell.role.description");
    return TSAccessibilityLocalizedString((uint64_t)v6);
  }
  v5 = NSClassFromString(CFSTR("TSTFunctionNode"));
  if ((objc_opt_isKindOfClass(v2, v5) & 1) != 0)
  {
    v6 = CFSTR("formula.token.function.role.description");
    return TSAccessibilityLocalizedString((uint64_t)v6);
  }
  v7 = NSClassFromString(CFSTR("TSTArgumentPlaceholderNode"));
  if ((objc_opt_isKindOfClass(v2, v7) & 1) != 0)
  {
    v6 = CFSTR("formula.token.function.argument.placeholder.role.description");
    return TSAccessibilityLocalizedString((uint64_t)v6);
  }
  v8 = NSClassFromString(CFSTR("TSTFunctionEndNode"));
  if ((objc_opt_isKindOfClass(v2, v8) & 1) != 0)
    return (NSString *)&stru_43D7D8;
  else
    return 0;
}

- (NSString)tsaxLabel
{
  id v3;
  Class v4;
  NSString *v6;
  Class v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;
  char *v12;
  char *v13;
  char *v14;
  id v15;
  char v16;

  v3 = -[TSTWPTokenAttachmentAccessibility _tsaxExpressionNode](self, "_tsaxExpressionNode");
  v4 = NSClassFromString(CFSTR("TSTReferenceNode"));
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0
    && objc_msgSend(v3, "tsaxBoolValueForKey:", CFSTR("isBlankForKeyboardInsertion")))
  {
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("formula.token.blank.for.keyboard.insertion.title"));
  }
  v6 = -[TSTWPTokenAttachmentAccessibility tsaxFormulaPlainText](self, "tsaxFormulaPlainText");
  v7 = NSClassFromString(CFSTR("TSTFunctionEndNode"));
  if ((objc_opt_isKindOfClass(v3, v7) & 1) != 0)
  {
    v8 = objc_msgSend(v3, "tsaxValueForKey:", CFSTR("functionNode"));
    v16 = 0;
    v9 = (objc_class *)objc_opt_class(NSString);
    v10 = (void *)__TSAccessibilityCastAsClass(v9, (uint64_t)objc_msgSend(v8, "tsaxValueForKey:", CFSTR("formulaPlainText")), 1, &v16);
    if (v16)
      abort();
    v11 = v10;
    v12 = (char *)objc_msgSend(v10, "length");
    if (v12)
    {
      v13 = v12;
      v14 = v12 - 1;
      if (!objc_msgSend(objc_msgSend(v11, "substringFromIndex:", v12 - 1), "isEqualToString:", CFSTR("(")))return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("formula.token.function.end.title.format %@")), v11);
      v15 = objc_msgSend(v11, "substringToIndex:", v14);
      if (v13 != (_BYTE *)&dword_0 + 1)
      {
        v11 = v15;
        return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("formula.token.function.end.title.format %@")), v11);
      }
    }
  }
  return v6;
}

- (NSArray)tsaxReferencedCells
{
  return 0;
}

- (BOOL)tsaxHasMenu
{
  return -[TSTWPTokenAttachmentAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("hasMenu"));
}

- (CGRect)tsaxMenuFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSTWPTokenAttachmentAccessibility tsaxCGRectValueForKey:](self, "tsaxCGRectValueForKey:", CFSTR("menuRect"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

@end
