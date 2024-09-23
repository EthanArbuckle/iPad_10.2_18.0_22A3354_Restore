@implementation _HUDGraph

- (_HUDGraph)initWithName:(id)a3 min:(double)a4 max:(double)a5
{
  id v8;
  _HUDGraph *v9;
  uint64_t v10;
  NSMutableArray *statistics;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HUDGraph;
  v9 = -[_HUDRow initWithName:](&v13, sel_initWithName_, v8);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
    v10 = objc_claimAutoreleasedReturnValue();
    statistics = v9->_statistics;
    v9->_statistics = (NSMutableArray *)v10;

    v9->_min = a4;
    v9->_max = a5;
  }

  return v9;
}

- (NSMutableArray)statistics
{
  return self->_statistics;
}

- (void)setStatistics:(id)a3
{
  objc_storeStrong((id *)&self->_statistics, a3);
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
}

@end
