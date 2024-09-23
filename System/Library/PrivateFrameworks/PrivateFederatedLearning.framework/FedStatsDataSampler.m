@implementation FedStatsDataSampler

+ (id)samplerWithCount:(unint64_t)a3
{
  FedStatsDataSampler *v4;
  void *v5;

  v4 = objc_alloc_init(FedStatsDataSampler);
  -[FedStatsDataSampler setTotal:](v4, "setTotal:", 0);
  -[FedStatsDataSampler setCount:](v4, "setCount:", a3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FedStatsDataSampler setResults:](v4, "setResults:", v5);

  return v4;
}

- (void)addItem:(id)a3
{
  id v4;
  unint64_t v5;
  signed int v6;
  BOOL v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = -[FedStatsDataSampler total](self, "total") + 1;
    -[FedStatsDataSampler setTotal:](self, "setTotal:", v5);
    if (v5 <= -[FedStatsDataSampler count](self, "count"))
    {
      -[FedStatsDataSampler results](self, "results");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);
    }
    else
    {
      v6 = arc4random_uniform(-[FedStatsDataSampler total](self, "total"));
      v7 = -[FedStatsDataSampler count](self, "count") > v6;
      v4 = v9;
      if (!v7)
        goto LABEL_8;
      -[FedStatsDataSampler results](self, "results");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v6, v9);
    }

    v4 = v9;
  }
LABEL_8:

}

- (void)addItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[FedStatsDataSampler addItem:](self, "addItem:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (id)pickSamplesFrom:(id)a3 length:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[FedStatsDataSampler samplerWithCount:](FedStatsDataSampler, "samplerWithCount:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addItems:", v5);

  objc_msgSend(v6, "getResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)total
{
  return self->_total;
}

- (void)setTotal:(unint64_t)a3
{
  self->_total = a3;
}

- (NSMutableArray)results
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
}

@end
