@implementation WFModalPresentationAnchor

- (WFModalPresentationAnchor)initWithSourceViewController:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  WFModalPresentationAnchor *v14;
  WFModalPresentationAnchor *v15;
  WFModalPresentationAnchor *v16;
  objc_super v18;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3;
  v13 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WFModalPresentationAnchor;
  v14 = -[WFModalPresentationAnchor init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sourceViewController, a3);
    objc_storeStrong((id *)&v15->_sourceView, a4);
    v15->_sourceRect.origin.x = x;
    v15->_sourceRect.origin.y = y;
    v15->_sourceRect.size.width = width;
    v15->_sourceRect.size.height = height;
    v16 = v15;
  }

  return v15;
}

- (UIViewController)sourceViewController
{
  return self->_sourceViewController;
}

- (UIView)sourceView
{
  return self->_sourceView;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_sourceViewController, 0);
}

@end
