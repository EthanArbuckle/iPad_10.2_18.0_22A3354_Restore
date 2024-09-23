@implementation PPSHistogramDimension

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PPSHistogramDimension)initWithCoder:(id)a3
{
  id v4;
  PPSHistogramDimension *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *edges;
  uint64_t v12;
  NSString *metricName;
  double v14;
  double v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PPSHistogramDimension;
  v5 = -[PPSHistogramDimension init](&v17, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("edges"));
    v10 = objc_claimAutoreleasedReturnValue();
    edges = v5->_edges;
    v5->_edges = (NSArray *)v10;

    v5->_isCategoryDimension = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCategory"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metric"));
    v12 = objc_claimAutoreleasedReturnValue();
    metricName = v5->_metricName;
    v5->_metricName = (NSString *)v12;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("minRange"));
    v5->_range.min = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxRange"));
    v5->_range.max = v15;
    v5->_size = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("size"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_edges, CFSTR("edges"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isCategoryDimension, CFSTR("isCategory"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metricName, CFSTR("metric"));
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("minRange"), self->_range.min);
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("maxRange"), self->_range.max);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_size, CFSTR("size"));

}

- (PPSHistogramDimension)initWithBinCount:(unint64_t)a3 range:(id)a4 metricName:(id)a5
{
  double var1;
  double var0;
  id v10;
  PPSHistogramDimension *v11;
  PPSHistogramDimension *v12;
  void *v13;
  unint64_t v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  NSArray *edges;
  objc_super v21;

  var1 = a4.var1;
  var0 = a4.var0;
  v10 = a5;
  if (!a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("invalid number of bins (0)"));
  if (var1 <= var0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("invalid dimension range (max < min)"));
  v21.receiver = self;
  v21.super_class = (Class)PPSHistogramDimension;
  v11 = -[PPSHistogramDimension init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_size = a3;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v15 = (var1 - var0) / (double)a3;
    v16 = var0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v17);

      v16 = v15 + v16;
      ++v14;
    }
    while (v14 <= v12->_size);
    v18 = objc_msgSend(v13, "copy");
    edges = v12->_edges;
    v12->_edges = (NSArray *)v18;

    objc_storeStrong((id *)&v12->_metricName, a5);
    v12->_range.min = var0;
    v12->_range.max = var1;
    v12->_isCategoryDimension = 0;

  }
  return v12;
}

- (PPSHistogramDimension)initWithCategories:(id)a3 metricName:(id)a4
{
  id v6;
  id v7;
  PPSHistogramDimension *v8;
  uint64_t v9;
  NSArray *edges;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPSHistogramDimension;
  v8 = -[PPSHistogramDimension init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    edges = v8->_edges;
    v8->_edges = (NSArray *)v9;

    v8->_isCategoryDimension = 1;
    objc_storeStrong((id *)&v8->_metricName, a4);
    v8->_range.min = 0.0;
    v8->_range.max = 0.0;
    v8->_size = objc_msgSend(v6, "count");
  }

  return v8;
}

- (PPSHistogramDimension)initWithEdges:(id)a3 metricName:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  PPSHistogramDimension *v11;
  PPSHistogramDimension *v12;
  PPSHistogramDimension *v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  if ((unint64_t)objc_msgSend(v7, "count") <= 1)
  {
    v9 = (void *)MEMORY[0x24BDBCE88];
    v10 = objc_msgSend(v7, "count");
    objc_msgSend(v9, "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("at least two edges are required (%lu)"), v10);
  }
  v19.receiver = self;
  v19.super_class = (Class)PPSHistogramDimension;
  v11 = -[PPSHistogramDimension init](&v19, sel_init);
  v12 = v11;
  v13 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_edges, a3);
    v13->_isCategoryDimension = 0;
    objc_storeStrong((id *)&v12->_metricName, a4);
    v13->_range.min = 0.0;
    v13->_range.max = 0.0;
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v13->_range.min = v15;
      objc_msgSend(v7, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "doubleValue");
      v13->_range.max = v17;

    }
    v13->_size = objc_msgSend(v7, "count") - 1;
  }

  return v13;
}

- (unint64_t)extent
{
  _BOOL4 v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[PPSHistogramDimension isCategoryDimension](self, "isCategoryDimension");
  v4 = -[PPSHistogramDimension size](self, "size");
  v5 = 1;
  if (!v3)
    v5 = 2;
  return v4 + v5;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  -[PPSHistogramDimension edges](self, "edges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("edges"));

  -[PPSHistogramDimension metricName](self, "metricName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("metric"));

  v6 = (void *)MEMORY[0x24BDD16E0];
  -[PPSHistogramDimension range](self, "range");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("minRange"));

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[PPSHistogramDimension range](self, "range");
  objc_msgSend(v8, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("maxRange"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[PPSHistogramDimension size](self, "size"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("size"));

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (BOOL)isEqualToHistogramDimension:(id)a3
{
  PPSHistogramDimension *v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v4 = (PPSHistogramDimension *)a3;
  if (self == v4)
  {
    v16 = 1;
  }
  else
  {
    v5 = -[PPSHistogramDimension size](self, "size");
    if (v5 == -[PPSHistogramDimension size](v4, "size")
      && (-[PPSHistogramDimension range](self, "range"), v7 = v6, -[PPSHistogramDimension range](v4, "range"), v7 == v8)
      && (-[PPSHistogramDimension range](self, "range"),
          v10 = v9,
          -[PPSHistogramDimension range](v4, "range"),
          v10 == v11))
    {
      -[PPSHistogramDimension metricName](self, "metricName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSHistogramDimension metricName](v4, "metricName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", v13))
      {
        -[PPSHistogramDimension edges](self, "edges");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPSHistogramDimension edges](v4, "edges");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToArray:", v15);

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (id)JSONRepresentation
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v2 = (void *)MEMORY[0x24BDD1608];
  -[PPSHistogramDimension dictionary](self, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    PPSReaderLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PPSTimeSeries JSONRepresentation].cold.1((uint64_t)v5, v6);

  }
  return v4;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSHistogramDimension description](self, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;

  -[PPSHistogramDimension dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;

  -[PPSHistogramDimension edges](self, "edges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PPSHistogramDimension metricName](self, "metricName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[PPSHistogramDimension range](self, "range");
  v8 = v7;
  -[PPSHistogramDimension range](self, "range");
  v10 = v4 ^ ((unint64_t)(v6 ^ (unint64_t)v8 ^ (unint64_t)v9) << 32);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PPSHistogramDimension *v4;
  BOOL v5;

  v4 = (PPSHistogramDimension *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PPSHistogramDimension isEqualToHistogramDimension:](self, "isEqualToHistogramDimension:", v4);
  }

  return v5;
}

- (NSArray)edges
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isCategoryDimension
{
  return self->_isCategoryDimension;
}

- (NSString)metricName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)range
{
  double v2;
  double v3;
  _QWORD v4[2];
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (unint64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricName, 0);
  objc_storeStrong((id *)&self->_edges, 0);
}

@end
