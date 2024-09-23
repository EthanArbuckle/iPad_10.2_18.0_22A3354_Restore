@implementation STSSearchResultSection

- (STSSearchResultSection)initWithResultsArray:(id)a3
{
  NSArray *v4;
  STSSearchResultSection *v5;
  NSArray *results;
  objc_super v8;

  v4 = (NSArray *)a3;
  v8.receiver = self;
  v8.super_class = (Class)STSSearchResultSection;
  v5 = -[STSSearchResultSection init](&v8, sel_init);
  results = v5->_results;
  v5->_results = v4;

  return v5;
}

- (id)logResults
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSSearchResultSection results](self, "results");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __36__STSSearchResultSection_logResults__block_invoke;
  v8[3] = &unk_24E745B48;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

void __36__STSSearchResultSection_logResults__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "resultType");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("%@, resultType: %@\n"), v3, v4);

}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
