@implementation PXStoryPPTResultsAggregate

- (PXStoryPPTResultsAggregate)init
{
  PXStoryPPTResultsAggregate *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *measureInfos;
  NSMutableDictionary *v5;
  NSMutableDictionary *extraResultsDictionaryRepresentation;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXStoryPPTResultsAggregate;
  v2 = -[PXStoryPPTResultsAggregate init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    measureInfos = v2->_measureInfos;
    v2->_measureInfos = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    extraResultsDictionaryRepresentation = v2->_extraResultsDictionaryRepresentation;
    v2->_extraResultsDictionaryRepresentation = v5;

  }
  return v2;
}

- (void)addValue:(double)a3 metric:(int64_t)a4 forMeasure:(id)a5 configuration:(id)a6
{
  id v11;
  _PXStoryPPTMeasureInfo *v12;
  _PXStoryPPTMeasureInfo *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a5;
  v11 = a6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_measureInfos, "objectForKeyedSubscript:", v16);
  v12 = (_PXStoryPPTMeasureInfo *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    if (-[_PXStoryPPTMeasureInfo metric](v12, "metric") != a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPPTResultsAggregate.m"), 41, CFSTR("metric mismatch for %@:%@"), v16, v11);

    }
  }
  else
  {
    v13 = -[_PXStoryPPTMeasureInfo initWithMetric:]([_PXStoryPPTMeasureInfo alloc], "initWithMetric:", a4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_measureInfos, "setObject:forKeyedSubscript:", v13, v16);
  }
  -[PXStoryPPTResultsAggregate _addExtraResultsValue:metric:forMeasure:configuration:](self, "_addExtraResultsValue:metric:forMeasure:configuration:", a4, v16, v11, a3);
  -[_PXStoryPPTMeasureInfo statistics](v13, "statistics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addValue:", a3);

}

- (void)_addExtraResultsValue:(double)a3 metric:(int64_t)a4 forMeasure:(id)a5 configuration:(id)a6
{
  id v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *extraResultsDictionaryRepresentation;
  void *v16;
  void *v17;
  id v18;

  v18 = a5;
  v11 = a6;
  switch(a4)
  {
    case 1:
      if (a3 >= 0.1)
      {
        v12 = CFSTR("s");
      }
      else
      {
        a3 = a3 * 1000.0;
        v12 = CFSTR("ms");
      }
      break;
    case 2:
      v12 = CFSTR("fps");
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPPTResultsAggregate.m"), 53, CFSTR("Code which should be unreachable has been reached"));

      abort();
    default:
      v12 = 0;
      a3 = 0.0;
      break;
  }
  -[PXStoryPPTResultsAggregate _keyForMeasure:configuration:](self, "_keyForMeasure:configuration:", v18, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_extraResultsDictionaryRepresentation, "setObject:forKeyedSubscript:", v14, v13);

  extraResultsDictionaryRepresentation = self->_extraResultsDictionaryRepresentation;
  objc_msgSend(v13, "stringByAppendingString:", CFSTR("Units"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](extraResultsDictionaryRepresentation, "setObject:forKeyedSubscript:", v12, v16);

}

- (id)_keyForMeasure:(id)a3 configuration:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a4;
  v8 = [v5 alloc];
  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E5149688);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E5149688);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("sub:%@:%@"), v9, v10);
  return v11;
}

- (NSDictionary)extraResultsDictionaryRepresentation
{
  NSMutableDictionary *measureInfos;
  _QWORD v5[5];

  measureInfos = self->_measureInfos;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__PXStoryPPTResultsAggregate_extraResultsDictionaryRepresentation__block_invoke;
  v5[3] = &unk_1E512A550;
  v5[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](measureInfos, "enumerateKeysAndObjectsUsingBlock:", v5);
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_extraResultsDictionaryRepresentation, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraResultsDictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_measureInfos, 0);
}

void __66__PXStoryPPTResultsAggregate_extraResultsDictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "statistics");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v19, "mean");
  objc_msgSend(v7, "_addExtraResultsValue:metric:forMeasure:configuration:", objc_msgSend(v5, "metric"), v6, CFSTR("mean"), v8);
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v19, "standardDeviation");
  objc_msgSend(v9, "_addExtraResultsValue:metric:forMeasure:configuration:", objc_msgSend(v5, "metric"), v6, CFSTR("stdDev"), v10);
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v19, "min");
  objc_msgSend(v11, "_addExtraResultsValue:metric:forMeasure:configuration:", objc_msgSend(v5, "metric"), v6, CFSTR("min"), v12);
  v13 = *(void **)(a1 + 32);
  objc_msgSend(v19, "max");
  objc_msgSend(v13, "_addExtraResultsValue:metric:forMeasure:configuration:", objc_msgSend(v5, "metric"), v6, CFSTR("max"), v14);
  v15 = *(void **)(a1 + 32);
  objc_msgSend(v19, "first");
  v17 = v16;
  v18 = objc_msgSend(v5, "metric");

  objc_msgSend(v15, "_addExtraResultsValue:metric:forMeasure:configuration:", v18, v6, CFSTR("first"), v17);
}

@end
