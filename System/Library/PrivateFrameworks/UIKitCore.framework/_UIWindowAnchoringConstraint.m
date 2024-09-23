@implementation _UIWindowAnchoringConstraint

- (BOOL)_addToEngine:(id)a3 integralizationAdjustment:(double)a4 mutuallyExclusiveConstraints:(id *)a5
{
  UIWindow *window;
  char v10;
  BOOL v11;
  objc_super v13;

  window = self->_window;
  if ((dyld_program_sdk_at_least() & 1) != 0
    || window
    && -[UIView _forceLayoutEngineSolutionInRationalEdges](window, "_forceLayoutEngineSolutionInRationalEdges"))
  {
    v10 = 1;
  }
  else
  {
    -[UIWindow _setIsLoweringAnchoringConstraints:](self->_window, "_setIsLoweringAnchoringConstraints:", 1);
    v10 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)_UIWindowAnchoringConstraint;
  v11 = -[_UIWindowAnchoringConstraint _addToEngine:integralizationAdjustment:mutuallyExclusiveConstraints:](&v13, sel__addToEngine_integralizationAdjustment_mutuallyExclusiveConstraints_, a3, a5, a4);
  if ((v10 & 1) == 0)
    -[UIWindow _setIsLoweringAnchoringConstraints:](self->_window, "_setIsLoweringAnchoringConstraints:", 0);
  return v11;
}

@end
