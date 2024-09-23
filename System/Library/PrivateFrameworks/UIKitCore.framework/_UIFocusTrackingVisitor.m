@implementation _UIFocusTrackingVisitor

- (BOOL)_visitView:(id)a3
{
  _BOOL4 subviewAddedToHierarchy;
  uint64_t v6;
  unint64_t countOfFocusedAncestorTrackingViewsInSubtree;

  subviewAddedToHierarchy = self->_subviewAddedToHierarchy;
  v6 = objc_msgSend(a3, "_countOfFocusedAncestorTrackingViewsInSubtree");
  countOfFocusedAncestorTrackingViewsInSubtree = self->_countOfFocusedAncestorTrackingViewsInSubtree;
  if (!subviewAddedToHierarchy)
    countOfFocusedAncestorTrackingViewsInSubtree = -(uint64_t)countOfFocusedAncestorTrackingViewsInSubtree;
  objc_msgSend(a3, "_setCountOfFocusedAncestorTrackingViewsInSubtree:", countOfFocusedAncestorTrackingViewsInSubtree + v6);
  return 1;
}

- (BOOL)_prepareToVisitView:(id)a3 changedSubview:(id)a4 previousWindow:(id)a5 previousSuperview:(id)a6
{
  uint64_t v9;

  v9 = objc_msgSend(a4, "_countOfFocusedAncestorTrackingViewsInSubtree");
  if (v9)
  {
    self->_subviewAddedToHierarchy = objc_msgSend(a4, "superview") == (_QWORD)a3;
    self->_countOfFocusedAncestorTrackingViewsInSubtree = objc_msgSend(a4, "_countOfFocusedAncestorTrackingViewsInSubtree");
  }
  return v9 != 0;
}

@end
