@implementation TSTFormulaInteractiveCanvasControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTFormulaInteractiveCanvasController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDInteractiveCanvasControllerAccessibility, a2);
}

- (id)tsaxFormulaEditingTextRep
{
  return -[TSTFormulaInteractiveCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("p_formulaEditingTextRep"));
}

@end
