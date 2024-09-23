@implementation MovingAverage

- (MovingAverage)initWithSize:(unint64_t)a3 withScalingFactor:(float)a4
{
  MovingAverage *v6;
  MovingAverage *v7;
  NSMutableArray *v8;
  NSMutableArray *values;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MovingAverage;
  v6 = -[MovingAverage init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_arraySize = a3;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    values = v7->_values;
    v7->_values = v8;

    v7->_currentAverage = 0.0;
    v7->_scalingFactor = a4;
  }
  return v7;
}

- (float)add:(float)a3 overflow:(BOOL)a4
{
  float currentAverage;
  float v8;
  double v9;
  void *v10;
  float v11;
  NSMutableArray *values;
  void *v13;
  float result;

  currentAverage = self->_currentAverage;
  v8 = currentAverage * (float)(unint64_t)-[NSMutableArray count](self->_values, "count");
  if (-[NSMutableArray count](self->_values, "count") == self->_arraySize && !a4)
  {
    -[NSMutableArray lastObject](self->_values, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v8 = v8 - v11;

    -[NSMutableArray removeLastObject](self->_values, "removeLastObject");
  }
  values = self->_values;
  *(float *)&v9 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObject:atIndex:](values, "insertObject:atIndex:", v13, 0);

  result = (float)(v8 + a3) / (float)(unint64_t)-[NSMutableArray count](self->_values, "count");
  self->_currentAverage = result;
  return result;
}

- (float)getAvg
{
  return self->_currentAverage;
}

- (float)getStdDev
{
  unint64_t v3;
  float result;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSMutableArray count](self->_values, "count");
  result = -1.0;
  if (v3 >= self->_arraySize)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_values;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      v9 = 0.0;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "doubleValue", (_QWORD)v12);
          v9 = v9 + (v11 - self->_currentAverage) * (v11 - self->_currentAverage);
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }
    else
    {
      v9 = 0.0;
    }

    return sqrt(v9 / (double)(unint64_t)-[NSMutableArray count](self->_values, "count"));
  }
  return result;
}

- (id)description
{
  unint64_t v3;
  void *v4;
  NSMutableArray *values;
  float v6;
  double v7;
  float v8;
  float v9;
  double v10;
  float v11;
  uint64_t v13;

  v3 = -[NSMutableArray count](self->_values, "count");
  v4 = (void *)MEMORY[0x24BDD17C8];
  if (v3 > 9)
  {
    -[MovingAverage getAvg](self, "getAvg");
    v10 = (float)(v9 / self->_scalingFactor);
    -[MovingAverage getStdDev](self, "getStdDev");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Avg: %.3f, Stddev: %.3f"), *(_QWORD *)&v10, (float)(v11 / self->_scalingFactor), v13);
  }
  else
  {
    values = self->_values;
    -[MovingAverage getAvg](self, "getAvg");
    v7 = (float)(v6 / self->_scalingFactor);
    -[MovingAverage getStdDev](self, "getStdDev");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("Values: %@, Avg: %.3f, Stddev: %.3f"), values, *(_QWORD *)&v7, (float)(v8 / self->_scalingFactor));
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
