@implementation CLPCReportingSchema

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
  objc_storeStrong((id *)&self->stagedColumns, 0);
}

- (NSArray)columns
{
  return self->_columns;
}

- (CLPCReportingSchema)init
{
  CLPCReportingSchema *v2;
  CLPCReportingSchema *v3;
  uint64_t v4;
  NSArray *columns;
  uint64_t v6;
  NSMutableArray *stagedColumns;
  CLPCReportingSchema *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLPCReportingSchema;
  v2 = -[CLPCReportingSchema init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_schemaID = 0;
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    columns = v3->_columns;
    v3->_columns = (NSArray *)v4;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    stagedColumns = v3->stagedColumns;
    v3->stagedColumns = (NSMutableArray *)v6;

    v8 = v3;
  }

  return v3;
}

- (void)stageColumn:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
    objc_msgSend(*(id *)(a1 + 8), "addObject:", v3);

}

- (void)finalizeColumns
{
  uint64_t v2;
  void *v3;
  void *v4;

  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", *(_QWORD *)(a1 + 8));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v2;

    v4 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

  }
}

- (unint64_t)schemaID
{
  return self->_schemaID;
}

- (void)setSchemaID:(unint64_t)a3
{
  self->_schemaID = a3;
}

@end
