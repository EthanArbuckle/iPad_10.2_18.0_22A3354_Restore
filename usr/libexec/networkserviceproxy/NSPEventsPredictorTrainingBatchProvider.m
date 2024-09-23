@implementation NSPEventsPredictorTrainingBatchProvider

- (id)featuresAtIndex:(int64_t)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSPEventsPredictorTrainingInput *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  const char *v31;

  v5 = nplog_obj(self, a2, a3);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v30 = 134217984;
    v31 = (const char *)a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "featureAtIndex: %ld Begin", (uint8_t *)&v30, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_inputShape, "objectAtIndexedSubscript:", 1));
  v8 = objc_msgSend(v7, "unsignedIntValue");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData prepareMLData:startAt:dataShape:](NSPCoreData, "prepareMLData:startAt:dataShape:", self->_trainingData, a3, self->_inputShape));
  if (v11)
  {
    +[NSPCoreData printMLMultiArray:](NSPCoreData, "printMLMultiArray:", v11);
    v14 = objc_claimAutoreleasedReturnValue(+[NSPCoreData normalizeData:](NSPCoreData, "normalizeData:", v11));
    if (v14)
    {
      +[NSPCoreData printMLMultiArray:](NSPCoreData, "printMLMultiArray:", v14);
      v15 = objc_claimAutoreleasedReturnValue(+[NSPCoreData prepareMLData:startAt:dataShape:](NSPCoreData, "prepareMLData:startAt:dataShape:", self->_trainingData, v8 + a3, self->_targetShape));
      +[NSPCoreData printMLMultiArray:](NSPCoreData, "printMLMultiArray:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPCoreData normalizeData:](NSPCoreData, "normalizeData:", v15));
      if (v18)
      {
        v19 = +[NSPCoreData printMLMultiArray:](NSPCoreData, "printMLMultiArray:", v18);
        v22 = nplog_obj(v19, v20, v21);
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v30 = 134217984;
          v31 = (const char *)a3;
          _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "featureAtIndex: %ld End ", (uint8_t *)&v30, 0xCu);
        }

        v24 = -[NSPEventsPredictorTrainingInput initWithLstm_input:sequential_TimeDistributedDense_dense_BiasAdd_true:]([NSPEventsPredictorTrainingInput alloc], "initWithLstm_input:sequential_TimeDistributedDense_dense_BiasAdd_true:", v14, v18);
      }
      else
      {
        v28 = nplog_obj(0, v16, v17);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          v30 = 136315138;
          v31 = "-[NSPEventsPredictorTrainingBatchProvider featuresAtIndex:]";
          _os_log_fault_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "%s called with null normalizedNextEvent", (uint8_t *)&v30, 0xCu);
        }

        v24 = 0;
      }

    }
    else
    {
      v27 = nplog_obj(0, v12, v13);
      v15 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        v30 = 136315138;
        v31 = "-[NSPEventsPredictorTrainingBatchProvider featuresAtIndex:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "%s called with null normalizedPrevEvents", (uint8_t *)&v30, 0xCu);
      }
      v24 = 0;
    }

  }
  else
  {
    v26 = nplog_obj(0, v9, v10);
    v14 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v30 = 136315138;
      v31 = "-[NSPEventsPredictorTrainingBatchProvider featuresAtIndex:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "%s called with null prevEvents", (uint8_t *)&v30, 0xCu);
    }
    v24 = 0;
  }

  return v24;
}

- (id)init:(id)a3 inputShape:(id)a4 targetShape:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSPEventsPredictorTrainingBatchProvider *v25;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  NSPEventsPredictorTrainingBatchProvider *v37;
  char *v38;
  void *v39;
  objc_super v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "count");
  v12 = objc_msgSend(v10, "count");
  if (v11 == v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));

    if (v15 != v16)
    {
      v20 = nplog_obj(v17, v18, v19);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
        *(_DWORD *)buf = 138412546;
        v42 = v22;
        v43 = 2112;
        v44 = v23;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "The targetShape and inputShape not compatible (%@ vs %@)", buf, 0x16u);

      }
      goto LABEL_6;
    }
    v27 = objc_msgSend(v8, "count");
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 1));
    v29 = objc_msgSend(v28, "unsignedIntValue") + 1;

    if (v27 != (id)v29)
    {
      v40.receiver = self;
      v40.super_class = (Class)NSPEventsPredictorTrainingBatchProvider;
      v37 = -[NSPEventsPredictorTrainingBatchProvider init](&v40, "init");
      -[NSPEventsPredictorTrainingBatchProvider setTrainingData:](v37, "setTrainingData:", v8);
      -[NSPEventsPredictorTrainingBatchProvider setInputShape:](v37, "setInputShape:", v9);
      -[NSPEventsPredictorTrainingBatchProvider setTargetShape:](v37, "setTargetShape:", v10);
      v38 = (char *)objc_msgSend(v8, "count");
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 1));
      -[NSPEventsPredictorTrainingBatchProvider setCount:](v37, "setCount:", &v38[~(unint64_t)objc_msgSend(v39, "unsignedIntValue")]);

      self = v37;
      v25 = self;
      goto LABEL_7;
    }
    v33 = nplog_obj(v30, v31, v32);
    v21 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v42 = objc_msgSend(v8, "count");
      v34 = "Insufficient number of NSP events for training %lu";
      v35 = v21;
      v36 = 12;
LABEL_13:
      _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
    }
  }
  else
  {
    v24 = nplog_obj(v12, v13, v14);
    v21 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v42 = objc_msgSend(v9, "count");
      v43 = 2048;
      v44 = objc_msgSend(v10, "count");
      v34 = "The targetShape dimensions not same as inputShape dimensions. (%lu vs %lu)";
      v35 = v21;
      v36 = 22;
      goto LABEL_13;
    }
  }
LABEL_6:

  v25 = 0;
LABEL_7:

  return v25;
}

- (NSArray)trainingData
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTrainingData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)inputShape
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInputShape:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)targetShape
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTargetShape:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetShape, 0);
  objc_storeStrong((id *)&self->_inputShape, 0);
  objc_storeStrong((id *)&self->_trainingData, 0);
}

@end
