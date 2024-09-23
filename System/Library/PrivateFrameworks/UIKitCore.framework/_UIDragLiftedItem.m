@implementation _UIDragLiftedItem

- (UIView)previewContainer
{
  return self->_previewContainer;
}

- (void)setPreviewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_previewContainer, a3);
}

- (_UIPlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (UITargetedDragPreview)targetedPreview
{
  return self->_targetedPreview;
}

- (void)setTargetedPreview:(id)a3
{
  objc_storeStrong((id *)&self->_targetedPreview, a3);
}

- (BOOL)sourceViewWasAdded
{
  return self->_sourceViewWasAdded;
}

- (void)setSourceViewWasAdded:(BOOL)a3
{
  self->_sourceViewWasAdded = a3;
}

- (double)liftAlpha
{
  return self->_liftAlpha;
}

- (void)setLiftAlpha:(double)a3
{
  self->_liftAlpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetedPreview, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_previewContainer, 0);
}

@end
