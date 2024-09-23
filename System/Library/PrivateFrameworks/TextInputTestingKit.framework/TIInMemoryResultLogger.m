@implementation TIInMemoryResultLogger

- (TIInMemoryResultLogger)init
{
  TIInMemoryResultLogger *v2;
  NSMutableArray *v3;
  NSMutableArray *results;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIInMemoryResultLogger;
  v2 = -[TIInMemoryResultLogger init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    results = v2->_results;
    v2->_results = v3;

  }
  return v2;
}

- (void)addResult:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIInMemoryResultLogger results](self, "results");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSMutableArray)results
{
  return self->_results;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

@end
