@implementation VUIDocumentUIConfigurationPopover

- (CGSize)preferredSize
{
  UIBarButtonItem *popOverSourceBarButtonItem;
  double width;
  CGSize result;

  popOverSourceBarButtonItem = self->_popOverSourceBarButtonItem;
  width = self->_preferredSize.width;
  result.height = width;
  result.width = *(double *)&popOverSourceBarButtonItem;
  return result;
}

- (void)setPreferredSize:(CGSize)a3
{
  *(CGSize *)&self->_popOverSourceBarButtonItem = a3;
}

- (CGRect)sourceRect
{
  double height;
  double x;
  double y;
  double width;
  CGRect result;

  height = self->_preferredSize.height;
  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  result.size.height = width;
  result.size.width = y;
  result.origin.y = x;
  result.origin.x = height;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  *(CGRect *)&self->_preferredSize.height = a3;
}

- (unint64_t)popOverArrowDirection
{
  return *(_QWORD *)&self->_presentationAdjustedToSizeClass;
}

- (void)setPopOverArrowDirection:(unint64_t)a3
{
  *(_QWORD *)&self->_presentationAdjustedToSizeClass = a3;
}

- (UIView)sourceView
{
  return (UIView *)self->_popOverArrowDirection;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_popOverArrowDirection, a3);
}

- (UIBarButtonItem)popOverSourceBarButtonItem
{
  return (UIBarButtonItem *)self->_sourceView;
}

- (void)setPopOverSourceBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (BOOL)isPresentationAdjustedToSizeClass
{
  return *(&self->super._presentOnPresentingVC + 1);
}

- (void)setPresentationAdjustedToSizeClass:(BOOL)a3
{
  *(&self->super._presentOnPresentingVC + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_popOverArrowDirection, 0);
}

@end
