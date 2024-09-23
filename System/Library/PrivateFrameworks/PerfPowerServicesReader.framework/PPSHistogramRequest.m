@implementation PPSHistogramRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PPSHistogramRequest)initWithCoder:(id)a3
{
  id v4;
  PPSHistogramRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *dimensions;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PPSHistogramRequest;
  v5 = -[PPSDataRequest initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("dimensions"));
    v9 = objc_claimAutoreleasedReturnValue();
    dimensions = v5->_dimensions;
    v5->_dimensions = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PPSHistogramRequest;
  v4 = a3;
  -[PPSDataRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_dimensions, CFSTR("dimensions"), v5.receiver, v5.super_class);

}

- (PPSHistogramRequest)initWithDimensions:(id)a3 predicate:(id)a4 timeFilter:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  PPSHistogramRequest *v20;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v9, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v17), "metricName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  v19 = (void *)objc_msgSend(v12, "copy");
  v22.receiver = self;
  v22.super_class = (Class)PPSHistogramRequest;
  v20 = -[PPSDataRequest initWithRequestType:metrics:predicate:timeFilter:](&v22, sel_initWithRequestType_metrics_predicate_timeFilter_, 1, v19, v10, v11);

  if (v20)
    objc_storeStrong((id *)&v20->_dimensions, a3);

  return v20;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *dimensions;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSArray *obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = objc_opt_class();
  v5 = -[PPSDataRequest requestType](self, "requestType");
  -[PPSDataRequest metrics](self, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSDataRequest predicate](self, "predicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSDataRequest timeFilter](self, "timeFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { type: %ld, metrics: %@, predicate: %@, timeFilter: %@ "), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  dimensions = self->_dimensions;
  if (dimensions)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = dimensions;
    v32 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v40 != v31)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v12, "edges");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");

          if (v14)
          {
            v33 = i;
            objc_msgSend(v9, "appendString:", CFSTR("edges:["));
            v37 = 0u;
            v38 = 0u;
            v35 = 0u;
            v36 = 0u;
            objc_msgSend(v12, "edges");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v16)
            {
              v17 = v16;
              v18 = 0;
              v19 = *(_QWORD *)v36;
              do
              {
                v20 = 0;
                v34 = v18;
                v21 = v18 + 1;
                do
                {
                  if (*(_QWORD *)v36 != v19)
                    objc_enumerationMutation(v15);
                  objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v20), "doubleValue");
                  objc_msgSend(v9, "appendFormat:", CFSTR("%f"), v22);
                  objc_msgSend(v12, "edges");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v23, "count");

                  if (v21 + v20 != v24)
                    objc_msgSend(v9, "appendString:", CFSTR(", "));
                  ++v20;
                }
                while (v17 != v20);
                v18 = v34 + v17;
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              }
              while (v17);
            }

            objc_msgSend(v9, "appendString:", CFSTR("]"));
            i = v33;
          }
          else
          {
            v25 = objc_msgSend(v12, "size");
            objc_msgSend(v12, "range");
            v27 = v26;
            objc_msgSend(v12, "range");
            objc_msgSend(v9, "appendFormat:", CFSTR("binCount:%lu minRange:%f maxRange:%f"), v25, v27, v28);
          }
        }
        v32 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v32);
    }

  }
  objc_msgSend(v9, "appendString:", CFSTR(" }>"));
  return v9;
}

- (NSArray)dimensions
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensions, 0);
}

@end
