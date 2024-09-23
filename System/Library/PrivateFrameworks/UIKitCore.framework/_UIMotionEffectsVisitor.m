@implementation _UIMotionEffectsVisitor

- (BOOL)_prepareToVisitView:(id)a3 changedSubview:(id)a4 previousWindow:(id)a5 previousSuperview:(id)a6
{
  uint64_t v9;

  v9 = objc_msgSend(a4, "_countOfMotionEffectsInSubtree");
  if (v9)
  {
    self->_subviewAddedToHierarchy = objc_msgSend(a4, "superview") == (_QWORD)a3;
    self->_countOfMotionEffectsInSubview = objc_msgSend(a4, "_countOfMotionEffectsInSubtree");
  }
  return v9 != 0;
}

- (BOOL)_visitView:(id)a3
{
  _BOOL4 subviewAddedToHierarchy;
  uint64_t v6;
  unint64_t countOfMotionEffectsInSubview;

  subviewAddedToHierarchy = self->_subviewAddedToHierarchy;
  v6 = objc_msgSend(a3, "_countOfMotionEffectsInSubtree");
  countOfMotionEffectsInSubview = self->_countOfMotionEffectsInSubview;
  if (!subviewAddedToHierarchy)
    countOfMotionEffectsInSubview = -(uint64_t)countOfMotionEffectsInSubview;
  objc_msgSend(a3, "_setCountOfMotionEffectsInSubtree:", countOfMotionEffectsInSubview + v6);
  return 1;
}

@end
