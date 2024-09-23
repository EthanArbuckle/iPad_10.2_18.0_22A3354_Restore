@implementation CLPCReportingRows

- (CLPCReportingSchema)schema
{
  return self->_schema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rows, 0);
  objc_storeStrong((id *)&self->_schema, 0);
}

- (NSArray)rows
{
  return self->_rows;
}

- (void)setSchema:(id)a3
{
  objc_storeStrong((id *)&self->_schema, a3);
}

- (void)setRows:(id)a3
{
  objc_storeStrong((id *)&self->_rows, a3);
}

- (CLPCReportingRows)init
{
  CLPCReportingRows *v2;
  uint64_t v3;
  CLPCReportingSchema *schema;
  uint64_t v5;
  NSArray *rows;
  CLPCReportingRows *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLPCReportingRows;
  v2 = -[CLPCReportingRows init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    schema = v2->_schema;
    v2->_schema = (CLPCReportingSchema *)v3;

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    rows = v2->_rows;
    v2->_rows = (NSArray *)v5;

    v7 = v2;
  }

  return v2;
}

@end
