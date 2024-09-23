@implementation _UIViewVisitor

- (BOOL)_currentlyVisitingHierarchy
{
  return self->__currentlyVisitingHierarchy;
}

- (BOOL)tracksHierarchy
{
  return self->_tracksHierarchy;
}

- (BOOL)visitMaskViews
{
  return self->_visitMaskViews;
}

+ (void)_startTraversalOfVisitor:(id)a3 withView:(id)a4
{
  void *v8[6];

  v8[5] = *(void **)MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "tracksHierarchy"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_UIViewVisitors.m"), 233, CFSTR("Ancestor tracking visitors are not allowed to be used as requested traversal visitors"));
  if (objc_msgSend(a3, "_prepareToVisitView:changedSubview:previousWindow:previousSuperview:", a4, 0, 0, 0))
  {
    objc_msgSend(a3, "set_currentlyVisitingHierarchy:", 1);
    if ((objc_msgSend(a3, "traversalDirection", a3, 0) & 1) != 0)
    {
      _UIViewVisitorEntertainAscendingVisitors((uint64_t)v8, 1, a4);
    }
    else if ((objc_msgSend(a3, "traversalDirection") & 2) != 0)
    {
      _UIViewVisitorRecursivelyEntertainDescendingVisitors(v8, 1, a4, 0);
    }
    objc_msgSend(a3, "set_currentlyVisitingHierarchy:", 0);
  }
}

- (void)set_currentlyVisitingHierarchy:(BOOL)a3
{
  self->__currentlyVisitingHierarchy = a3;
}

- (unint64_t)traversalDirection
{
  return self->_traversalDirection;
}

- (_UIViewVisitor)initWithTraversalDirection:(unint64_t)a3
{
  _UIViewVisitor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIViewVisitor;
  result = -[_UIViewVisitor init](&v5, sel_init);
  if (result)
  {
    result->_visitMaskViews = 1;
    result->_traversalDirection = a3;
  }
  return result;
}

- (void)setVisitMaskViews:(BOOL)a3
{
  self->_visitMaskViews = a3;
}

- (BOOL)_prepareToVisitView:(id)a3 changedSubview:(id)a4 previousWindow:(id)a5 previousSuperview:(id)a6
{
  return 1;
}

+ (void)_addHierarchyTrackingVisitor:(id)a3
{
  uint64_t *v4;

  if ((objc_msgSend(a3, "traversalDirection") & 1) != 0)
  {
    v4 = &_MergedGlobals_15_6;
  }
  else
  {
    if ((objc_msgSend(a3, "traversalDirection") & 2) == 0)
      return;
    v4 = &qword_1ECD7C6C8;
  }
  if (!*v4)
    *v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  objc_msgSend(a3, "setTracksHierarchy:", 1);
  objc_msgSend((id)*v4, "addObject:", a3);
}

- (void)setTracksHierarchy:(BOOL)a3
{
  self->_tracksHierarchy = a3;
}

+ (void)_removeHierarchyTrackingVisitor:(id)a3
{
  uint64_t *v4;

  if ((objc_msgSend(a3, "traversalDirection") & 1) != 0)
  {
    v4 = &_MergedGlobals_15_6;
LABEL_6:
    objc_msgSend((id)*v4, "removeObject:", a3);
    return;
  }
  if ((objc_msgSend(a3, "traversalDirection") & 2) != 0)
  {
    v4 = &qword_1ECD7C6C8;
    goto LABEL_6;
  }
}

- (BOOL)_visitView:(id)a3
{
  return 1;
}

@end
