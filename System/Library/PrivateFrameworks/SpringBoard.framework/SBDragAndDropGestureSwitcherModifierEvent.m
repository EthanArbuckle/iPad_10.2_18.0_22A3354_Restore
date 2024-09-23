@implementation SBDragAndDropGestureSwitcherModifierEvent

- (int64_t)type
{
  return 4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  uint64_t v5;
  void *v6;
  CGSize size;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBDragAndDropGestureSwitcherModifierEvent;
  v4 = -[SBGestureSwitcherModifierEvent copyWithZone:](&v9, sel_copyWithZone_, a3);
  *((_QWORD *)v4 + 20) = self->_dropAction;
  v5 = -[NSString copy](self->_draggedSceneIdentifier, "copy");
  v6 = (void *)*((_QWORD *)v4 + 21);
  *((_QWORD *)v4 + 21) = v5;

  size = self->_platterViewFrame.size;
  *(CGPoint *)(v4 + 200) = self->_platterViewFrame.origin;
  *(CGSize *)(v4 + 216) = size;
  *((_QWORD *)v4 + 23) = *(_QWORD *)&self->_platterScale;
  return v4;
}

- (int64_t)dropAction
{
  return self->_dropAction;
}

- (void)setDropAction:(int64_t)a3
{
  self->_dropAction = a3;
}

- (NSString)draggedSceneIdentifier
{
  return self->_draggedSceneIdentifier;
}

- (void)setDraggedSceneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_draggedSceneIdentifier, a3);
}

- (int64_t)draggedSceneLayoutRole
{
  return self->_draggedSceneLayoutRole;
}

- (void)setDraggedSceneLayoutRole:(int64_t)a3
{
  self->_draggedSceneLayoutRole = a3;
}

- (CGRect)platterViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_platterViewFrame.origin.x;
  y = self->_platterViewFrame.origin.y;
  width = self->_platterViewFrame.size.width;
  height = self->_platterViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPlatterViewFrame:(CGRect)a3
{
  self->_platterViewFrame = a3;
}

- (double)platterScale
{
  return self->_platterScale;
}

- (void)setPlatterScale:(double)a3
{
  self->_platterScale = a3;
}

- (BOOL)hasPreviewLifted
{
  return self->_previewHasLifted;
}

- (void)setPreviewHasLifted:(BOOL)a3
{
  self->_previewHasLifted = a3;
}

- (BOOL)hasPlatterized
{
  return self->_platterized;
}

- (void)setPlatterized:(BOOL)a3
{
  self->_platterized = a3;
}

- (BOOL)isWindowDrag
{
  return self->_windowDrag;
}

- (void)setWindowDrag:(BOOL)a3
{
  self->_windowDrag = a3;
}

- (BOOL)isSwitcherDrag
{
  return self->_switcherDrag;
}

- (void)setSwitcherDrag:(BOOL)a3
{
  self->_switcherDrag = a3;
}

- (SBSwitcherDropRegionContext)switcherDropRegionContext
{
  return self->_switcherDropRegionContext;
}

- (void)setSwitcherDropRegionContext:(id)a3
{
  objc_storeStrong((id *)&self->_switcherDropRegionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switcherDropRegionContext, 0);
  objc_storeStrong((id *)&self->_draggedSceneIdentifier, 0);
}

@end
