@implementation WFAlertPresentationSource

- (WFAlertPresentationSource)init
{
  return -[WFAlertPresentationSource initWithSourceView:sourceRect:barButtonItem:](self, "initWithSourceView:sourceRect:barButtonItem:", 0, 0, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
}

- (WFAlertPresentationSource)initWithSourceView:(id)a3 sourceRect:(CGRect)a4 barButtonItem:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  id v13;
  WFAlertPresentationSource *v14;
  WFAlertPresentationSource *v15;
  WFAlertPresentationSource *v16;
  objc_super v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = a3;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFAlertPresentationSource;
  v14 = -[WFAlertPresentationSource init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_sourceView, a3);
    v15->_sourceRect.origin.x = x;
    v15->_sourceRect.origin.y = y;
    v15->_sourceRect.size.width = width;
    v15->_sourceRect.size.height = height;
    objc_storeStrong((id *)&v15->_barButtonItem, a5);
    v15->_permittedArrowDirections = 15;
    v16 = v15;
  }

  return v15;
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

- (UIView)sourceView
{
  return self->_sourceView;
}

- (UIBarButtonItem)barButtonItem
{
  return self->_barButtonItem;
}

- (unint64_t)permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (void)setPermittedArrowDirections:(unint64_t)a3
{
  self->_permittedArrowDirections = a3;
}

- (BOOL)canOverlapSourceViewRect
{
  return self->_canOverlapSourceViewRect;
}

- (void)setCanOverlapSourceViewRect:(BOOL)a3
{
  self->_canOverlapSourceViewRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barButtonItem, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
}

+ (id)sourceWithView:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  if (v4)
  {
    objc_msgSend(v4, "bounds");
  }
  else
  {
    v6 = *MEMORY[0x24BDBF070];
    v7 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v8 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v9 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  v10 = (void *)objc_msgSend(v5, "initWithSourceView:sourceRect:barButtonItem:", v4, 0, v6, v7, v8, v9);

  return v10;
}

+ (id)sourceWithView:(id)a3 rect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSourceView:sourceRect:barButtonItem:", v9, 0, x, y, width, height);

  return v10;
}

+ (id)sourceWithBarButtonItem:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (void *)objc_msgSend(v5, "initWithSourceView:sourceRect:barButtonItem:", 0, v4, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));

  return v6;
}

@end
