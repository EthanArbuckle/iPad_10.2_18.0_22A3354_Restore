@implementation _UIInertPreviewingContext

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIInertPreviewingContext)initWithSourceView:(id)a3
{
  id v5;
  _UIInertPreviewingContext *v6;
  _UIInertPreviewingContext *v7;
  CGSize v8;
  UIGestureRecognizer *v9;
  UIGestureRecognizer *failureRelationshipGestureRecognizer;
  _UIInertPreviewingContext *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIInertPreviewingContext;
  v6 = -[_UIInertPreviewingContext init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceView, a3);
    v8 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v7->_sourceRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v7->_sourceRect.size = v8;
    v9 = objc_alloc_init(UIGestureRecognizer);
    failureRelationshipGestureRecognizer = v7->_failureRelationshipGestureRecognizer;
    v7->_failureRelationshipGestureRecognizer = v9;

    v11 = v7;
  }

  return v7;
}

- (UIGestureRecognizer)previewingGestureRecognizerForFailureRelationship
{
  return self->_failureRelationshipGestureRecognizer;
}

- (CGRect)preferredSourceViewRectInCoordinateSpace:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (UIViewControllerPreviewingDelegate)delegate
{
  return (UIViewControllerPreviewingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (UIView)customViewForInteractiveHighlight
{
  return self->_customViewForInteractiveHighlight;
}

- (void)setCustomViewForInteractiveHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_customViewForInteractiveHighlight, a3);
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_customViewForInteractiveHighlight, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_failureRelationshipGestureRecognizer, 0);
}

@end
