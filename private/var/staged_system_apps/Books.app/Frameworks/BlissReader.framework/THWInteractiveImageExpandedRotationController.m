@implementation THWInteractiveImageExpandedRotationController

- (THWInteractiveImageExpandedRotationController)initWithRep:(id)a3 canvas:(id)a4 stageCanvasController:(id)a5
{
  THWInteractiveImageExpandedRotationController *v7;
  THWOverlayableZoomableCanvasController *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THWInteractiveImageExpandedRotationController;
  v7 = -[THWInteractiveImageExpandedRotationController init](&v10, "init", a3, a4);
  if (v7)
  {
    v7->_rep = (THWInteractiveImageWidgetRep *)a3;
    v8 = (THWOverlayableZoomableCanvasController *)a5;
    v7->_duration = 5.0;
    v7->_stageCanvasController = v8;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageExpandedRotationController;
  -[THWInteractiveImageExpandedRotationController dealloc](&v3, "dealloc");
}

- (int)autoRotationMode
{
  return 4;
}

- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  return 1.0;
}

- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double x;
  double y;
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)expandedWillAnimateRotationFromSize:(CGSize)a3 toSize:(CGSize)a4 duration:(double)a5
{
  THWOverlayableZoomableCanvasController *v7;
  id v8;

  -[THWInteractiveImageExpandedRotationController setDuration:](self, "setDuration:", a5, a3.height, a4.width, a4.height);
  -[THWInteractiveImageWidgetRep setRotationDuration:](self->_rep, "setRotationDuration:", a5);
  objc_msgSend(-[THWInteractiveImageWidgetRep layout](self->_rep, "layout"), "invalidateFrame");
  objc_msgSend(-[THWInteractiveImageWidgetRep interactiveCanvasController](self->_rep, "interactiveCanvasController"), "layoutIfNeeded");
  -[TSDInteractiveCanvasController layoutIfNeeded](-[THWOverlayableZoomableCanvasController scrollContainerICC](-[THWInteractiveImageWidgetRep stageCanvasController](self->_rep, "stageCanvasController"), "scrollContainerICC"), "layoutIfNeeded");
  -[TSDInteractiveCanvasController layoutIfNeeded](-[THWOverlayableZoomableCanvasController scrollContentICC](-[THWInteractiveImageWidgetRep stageCanvasController](self->_rep, "stageCanvasController"), "scrollContentICC"), "layoutIfNeeded");
  v7 = -[THWInteractiveImageWidgetRep stageCanvasController](self->_rep, "stageCanvasController");
  v8 = -[THWInteractiveImageWidgetRep layout](self->_rep, "layout");
  objc_msgSend(-[THWInteractiveImageWidgetRep layout](self->_rep, "layout"), "stageFrame");
  objc_msgSend(v8, "rectInRoot:");
  -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](v7, "setNaturalFrame:scale:");
  -[THWInteractiveImageWidgetRep updateDiagramAnimated:](self->_rep, "updateDiagramAnimated:", 1);
  -[THWInteractiveImageWidgetRep setRotationDuration:](self->_rep, "setRotationDuration:", 0.0);
}

- (void)expandedDidTransitionToSize:(CGSize)a3
{
  THWOverlayableZoomableCanvasController *v4;
  id v5;

  objc_msgSend(-[THWInteractiveImageWidgetRep layout](self->_rep, "layout", a3.width, a3.height), "invalidateForSizeChange");
  objc_msgSend(-[THWInteractiveImageWidgetRep layout](self->_rep, "layout"), "invalidateFrame");
  objc_msgSend(-[THWInteractiveImageWidgetRep interactiveCanvasController](self->_rep, "interactiveCanvasController"), "layoutIfNeeded");
  -[TSDInteractiveCanvasController layoutIfNeeded](-[THWOverlayableZoomableCanvasController scrollContainerICC](-[THWInteractiveImageWidgetRep stageCanvasController](self->_rep, "stageCanvasController"), "scrollContainerICC"), "layoutIfNeeded");
  -[TSDInteractiveCanvasController layoutIfNeeded](-[THWOverlayableZoomableCanvasController scrollContentICC](-[THWInteractiveImageWidgetRep stageCanvasController](self->_rep, "stageCanvasController"), "scrollContentICC"), "layoutIfNeeded");
  v4 = -[THWInteractiveImageWidgetRep stageCanvasController](self->_rep, "stageCanvasController");
  v5 = -[THWInteractiveImageWidgetRep layout](self->_rep, "layout");
  objc_msgSend(-[THWInteractiveImageWidgetRep layout](self->_rep, "layout"), "stageFrame");
  objc_msgSend(v5, "rectInRoot:");
  -[THWOverlayableZoomableCanvasController setNaturalFrame:scale:](v4, "setNaturalFrame:scale:");
  -[THWInteractiveImageWidgetRep updateDiagramAnimated:](self->_rep, "updateDiagramAnimated:", 0);
  -[THWExpandedRepController expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:](-[THWInteractiveImageWidgetRep expandedRepController](self->_rep, "expandedRepController"), "expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:", 1, 1);
  -[THWExpandedRepController expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:](-[THWInteractiveImageWidgetRep expandedRepController](self->_rep, "expandedRepController"), "expandedRepControllerInvalidateChildrenInPanel:invalidateWPAuto:", 2, 0);
  -[THWExpandedRepController expandedRepControllerUpdatePanelVisibility](-[THWInteractiveImageWidgetRep expandedRepController](self->_rep, "expandedRepController"), "expandedRepControllerUpdatePanelVisibility");
  -[THWOverlayableZoomableCanvasController updateContainerInfosToDisplay](-[THWInteractiveImageWidgetRep stageCanvasController](self->_rep, "stageCanvasController"), "updateContainerInfosToDisplay");
}

- (THWInteractiveImageWidgetRep)rep
{
  return self->_rep;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (THWOverlayableZoomableCanvasController)stageCanvasController
{
  return self->_stageCanvasController;
}

@end
