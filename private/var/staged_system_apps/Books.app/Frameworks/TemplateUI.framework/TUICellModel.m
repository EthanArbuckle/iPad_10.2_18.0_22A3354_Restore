@implementation TUICellModel

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)rowSpan
{
  return self->_rowSpan;
}

- (void)setRowSpan:(unint64_t)a3
{
  self->_rowSpan = a3;
}

- (unint64_t)columnSpan
{
  return self->_columnSpan;
}

- (void)setColumnSpan:(unint64_t)a3
{
  self->_columnSpan = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
