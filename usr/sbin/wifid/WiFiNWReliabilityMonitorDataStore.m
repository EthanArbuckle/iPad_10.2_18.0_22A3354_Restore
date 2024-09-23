@implementation WiFiNWReliabilityMonitorDataStore

- (WiFiNWReliabilityMonitorDataStore)initWithMetric:(unint64_t)a3 withMaxSamples:(unint64_t)a4
{
  WiFiNWReliabilityMonitorDataStore *v6;
  uint64_t v7;
  NSMutableArray *buffer;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WiFiNWReliabilityMonitorDataStore;
  v6 = -[WiFiNWReliabilityMonitorDataStore init](&v10, "init");
  if (v6
    && (v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array")),
        buffer = v6->_buffer,
        v6->_buffer = (NSMutableArray *)v7,
        buffer,
        v6->_buffer))
  {
    v6->_metric = a3;
    v6->_maxSamples = a4;
  }
  else
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  NSMutableArray *buffer;
  NSMutableArray *v4;
  objc_super v5;

  buffer = self->_buffer;
  if (buffer)
  {
    -[NSMutableArray removeAllObjects](buffer, "removeAllObjects");
    v4 = self->_buffer;
    self->_buffer = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)WiFiNWReliabilityMonitorDataStore;
  -[WiFiNWReliabilityMonitorDataStore dealloc](&v5, "dealloc");
}

- (BOOL)addSample:(id)a3
{
  -[NSMutableArray insertObject:atIndex:](self->_buffer, "insertObject:atIndex:", a3, 0);
  if ((unint64_t)-[NSMutableArray count](self->_buffer, "count") > self->_maxSamples)
    -[NSMutableArray removeLastObject](self->_buffer, "removeLastObject");
  return 1;
}

- (void)getSamples:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  NSMutableArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];

  v4 = (void (**)(id, _QWORD, char *))a3;
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_buffer;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
      if (v14)
        break;
      if (v7 == (id)++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (unint64_t)getCount
{
  return (unint64_t)-[NSMutableArray count](self->_buffer, "count");
}

- (unint64_t)metric
{
  return self->_metric;
}

- (unint64_t)maxSamples
{
  return self->_maxSamples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
