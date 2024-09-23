@implementation REExportedTable

- (REExportedTable)init
{
  REExportedTable *v2;
  REExportedTable *v3;
  NSArray *header;
  uint64_t v5;
  NSMutableArray *data;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)REExportedTable;
  v2 = -[REExportedTable init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    header = v2->_header;
    v2->_header = (NSArray *)MEMORY[0x24BDBD1A8];

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    data = v3->_data;
    v3->_data = (NSMutableArray *)v5;

    v3->_sortable = 1;
  }
  return v3;
}

- (unint64_t)rowsCount
{
  return -[NSMutableArray count](self->_data, "count");
}

- (id)rowAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_data, "objectAtIndexedSubscript:", a3);
}

- (void)addRow:(id)a3
{
  -[NSMutableArray addObject:](self->_data, "addObject:", a3);
}

- (NSArray)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_storeStrong((id *)&self->_header, a3);
}

- (BOOL)sortable
{
  return self->_sortable;
}

- (void)setSortable:(BOOL)a3
{
  self->_sortable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
