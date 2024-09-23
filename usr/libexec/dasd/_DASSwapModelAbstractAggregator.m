@implementation _DASSwapModelAbstractAggregator

- (_DASSwapModelAbstractAggregator)initWithAlgorithms:(id)a3
{
  id v4;
  _DASSwapModelAbstractAggregator *v5;
  NSArray *v6;
  NSArray *algorithms;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DASSwapModelAbstractAggregator;
  v5 = -[_DASSwapModelAbstractAggregator init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    algorithms = v5->_algorithms;
    v5->_algorithms = v6;

  }
  return v5;
}

- (id)scoresForAllApplicationsAtDate:(id)a3
{
  return 0;
}

- (double)scoreForApplication:(id)a3 atDate:(id)a4
{
  return 0.0;
}

- (void)updateScores
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_algorithms;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "updateScores", (_QWORD)v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (NSArray)algorithms
{
  return self->_algorithms;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algorithms, 0);
}

@end
