@implementation PRSL2FeatureVectorProcessingContext

- (PRSL2FeatureVectorProcessingContext)initWithFeatureOrder:(id)a3 withInflation:(unint64_t)a4 withInflatedIndexToSize:(id)a5
{
  id v8;
  PRSL2FeatureVectorProcessingContext *v9;
  unint64_t v10;
  unsigned __int16 *v11;
  unsigned __int16 *v12;
  __CFSet *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  _WORD *v18;
  unsigned __int16 v19;
  void *v20;
  void *v21;
  unint64_t j;
  PRSL2FeatureVectorProcessingContext *v24;
  id v25;
  id value;
  uint64_t v27;
  objc_super v28;

  v8 = a3;
  v25 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PRSL2FeatureVectorProcessingContext;
  v9 = -[PRSL2FeatureVectorProcessingContext init](&v28, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "count") + a4;
    v9->_expandedFeatureCount = v10;
    v11 = (unsigned __int16 *)malloc_type_malloc(2 * v10, 0x27BB816FuLL);
    v12 = v11;
    if (v10)
      memset(v11, 255, 2 * v10);
    v13 = +[PRSL2FeatureVector getL2FeatureSet](PRSL2FeatureVector, "getL2FeatureSet", v9);
    v14 = objc_msgSend(v8, "count");
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      for (i = 0; i != v15; ++i)
      {
        value = 0;
        v27 = 0;
        objc_msgSend(v8, "objectAtIndexedSubscript:", i);
        value = (id)objc_claimAutoreleasedReturnValue();
        LOWORD(v27) = 0;
        BYTE2(v27) = 0;
        v18 = CFSetGetValue(v13, &value);
        if (v18)
        {
          v19 = v18[4];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", i);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            for (j = 0; j <= objc_msgSend(v21, "unsignedLongLongValue"); ++j)
              v12[v16 + j] = v19;
            v16 += j;
          }
          else
          {
            v12[v16++] = v19;
          }

        }
        else
        {
          +[SSADEventReporter reportBadDirectivesForModelType:](SSADEventReporter, "reportBadDirectivesForModelType:", 0);
        }

      }
    }
    v9 = v24;
    v24->_expandedFeatureExecutionOrder = v12;
  }

  return v9;
}

- (void)dealloc
{
  unsigned __int16 *expandedFeatureExecutionOrder;
  objc_super v4;

  expandedFeatureExecutionOrder = self->_expandedFeatureExecutionOrder;
  if (expandedFeatureExecutionOrder)
    free(expandedFeatureExecutionOrder);
  v4.receiver = self;
  v4.super_class = (Class)PRSL2FeatureVectorProcessingContext;
  -[PRSL2FeatureVectorProcessingContext dealloc](&v4, sel_dealloc);
}

- (unsigned)expandedFeatureExecutionOrder
{
  return self->_expandedFeatureExecutionOrder;
}

- (void)setExpandedFeatureExecutionOrder:(unsigned __int16 *)a3
{
  self->_expandedFeatureExecutionOrder = a3;
}

- (unint64_t)expandedFeatureCount
{
  return self->_expandedFeatureCount;
}

- (void)setExpandedFeatureCount:(unint64_t)a3
{
  self->_expandedFeatureCount = a3;
}

@end
