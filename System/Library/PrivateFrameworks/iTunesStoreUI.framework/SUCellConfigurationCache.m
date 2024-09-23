@implementation SUCellConfigurationCache

- (SUCellConfigurationCache)initWithClass:(Class)a3 tableHeight:(double)a4
{
  SUCellConfigurationCache *v6;
  double v7;
  unint64_t i;
  id v9;

  v6 = -[SUCellConfigurationCache init](self, "init");
  if (v6)
  {
    v6->_configurations = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[objc_class minimumRowHeight](a3, "minimumRowHeight");
    for (i = (unint64_t)(ceil(a4 / v7) + 1.0); i; --i)
    {
      v9 = objc_alloc_init(a3);
      -[NSMutableArray addObject:](v6->_configurations, "addObject:", v9);

    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_cellContext = 0;
  self->_configurations = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUCellConfigurationCache;
  -[SUCellConfigurationCache dealloc](&v3, sel_dealloc);
}

- (id)configurationForRow:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_configurations, "objectAtIndex:", a3 % -[NSMutableArray count](self->_configurations, "count"));
}

- (void)reset
{
  uint64_t v3;
  objc_class *v4;
  id v5;

  v3 = -[NSMutableArray count](self->_configurations, "count");
  -[NSMutableArray lastObject](self->_configurations, "lastObject");
  v4 = (objc_class *)objc_opt_class();
  -[NSMutableArray removeAllObjects](self->_configurations, "removeAllObjects");
  for (; v3; --v3)
  {
    v5 = objc_alloc_init(v4);
    -[NSMutableArray addObject:](self->_configurations, "addObject:", v5);

  }
}

- (void)resetLayoutCaches
{
  objc_msgSend(-[SUCellConfigurationCache cellContext](self, "cellContext"), "resetLayoutCaches");
}

- (id)cellContext
{
  return self->_cellContext;
}

- (void)setCellContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
