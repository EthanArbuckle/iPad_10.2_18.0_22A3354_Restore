@implementation EDComment

- (void)setRowIndex:(int)a3
{
  self->_rowIndex = a3;
}

- (void)setColumnIndex:(int)a3
{
  self->_columnIndex = a3;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDComment;
  -[EDComment description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)rowIndex
{
  return self->_rowIndex;
}

- (int)columnIndex
{
  return self->_columnIndex;
}

- (EDString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_storeStrong((id *)&self->_author, a3);
}

- (BOOL)visible
{
  return self->_visible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_author, 0);
}

@end
