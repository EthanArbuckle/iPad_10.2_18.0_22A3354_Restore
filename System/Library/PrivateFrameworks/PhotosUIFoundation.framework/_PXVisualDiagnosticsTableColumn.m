@implementation _PXVisualDiagnosticsTableColumn

- (_PXVisualDiagnosticsTableColumn)init
{
  _PXVisualDiagnosticsTableColumn *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PXVisualDiagnosticsTableColumn;
  result = -[_PXVisualDiagnosticsTableColumn init](&v3, sel_init);
  if (result)
    result->_width = 100.0;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
