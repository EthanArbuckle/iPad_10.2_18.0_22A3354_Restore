@implementation _PXVisualDiagnosticsPageConfiguration

- (_PXVisualDiagnosticsPageConfiguration)initWithConfiguration:(id)a3
{
  id v4;
  _PXVisualDiagnosticsPageConfiguration *v5;
  CGFloat v6;
  CGFloat v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXVisualDiagnosticsPageConfiguration;
  v5 = -[_PXVisualDiagnosticsPageConfiguration init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "defaultPageSize");
    v5->_pageSize.width = v6;
    v5->_pageSize.height = v7;
  }

  return v5;
}

- (CGSize)pageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pageSize.width;
  height = self->_pageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPageSize:(CGSize)a3
{
  self->_pageSize = a3;
}

@end
