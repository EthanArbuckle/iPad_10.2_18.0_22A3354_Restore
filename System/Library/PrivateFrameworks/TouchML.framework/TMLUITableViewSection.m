@implementation TMLUITableViewSection

- (int64_t)numberOfRows
{
  double v2;

  return objc_msgSend_count(self->_rows, a2, v2);
}

- (id)cellForRow:(int64_t)a3
{
  double v3;

  return (id)objc_msgSend_objectAtIndexedSubscript_(self->_rows, a2, v3, a3);
}

- (NSArray)rows
{
  return self->_rows;
}

- (void)setRows:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_rows, 0);
}

@end
