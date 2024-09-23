@implementation SCROBrailleLineVirtualStatus

- (void)dealloc
{
  char *cells;
  objc_super v4;

  cells = self->_cells;
  if (cells)
    free(cells);
  v4.receiver = self;
  v4.super_class = (Class)SCROBrailleLineVirtualStatus;
  -[SCROBrailleLineVirtualStatus dealloc](&v4, sel_dealloc);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (int)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int)a3
{
  self->_alignment = a3;
}

- (int64_t)length
{
  return self->_length;
}

- (void)setLength:(int64_t)a3
{
  self->_length = a3;
}

- (char)cells
{
  return self->_cells;
}

- (void)setCells:(char *)a3
{
  self->_cells = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
