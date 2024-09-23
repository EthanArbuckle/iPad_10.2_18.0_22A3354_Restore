@implementation searchResults

- (searchResults)init
{
  searchResults *v2;
  NSMutableArray *v3;
  NSMutableArray *rows;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)searchResults;
  v2 = -[searchResults init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    rows = v2->_rows;
    v2->_rows = v3;

    if (!v2->_rows)
    {

      return 0;
    }
  }
  return v2;
}

- (NSMutableArray)rows
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRows:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);
}

@end
