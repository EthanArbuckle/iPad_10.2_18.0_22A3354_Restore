@implementation searchRow

- (searchRow)init
{
  searchRow *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *columns;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)searchRow;
  v2 = -[searchRow init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    columns = v2->_columns;
    v2->_columns = v3;

    if (!v2->_columns)
    {

      return 0;
    }
  }
  return v2;
}

- (NSMutableDictionary)columns
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setColumns:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

@end
