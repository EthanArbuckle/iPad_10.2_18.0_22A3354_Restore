@implementation BIHistogram

- (BIHistogram)initWithBinLabelGenerator:(id)a3 allLabels:(id)a4
{
  return -[BIHistogram initWithBinLabelGenerator:allLabels:histogramValues:](self, "initWithBinLabelGenerator:allLabels:histogramValues:", a3, a4, 0);
}

- (BIHistogram)initWithBinLabelGenerator:(id)a3 allLabels:(id)a4 histogramValues:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned int *v11;
  char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  void *v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BIHistogram *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *j;
  id v43;
  void *v44;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _BYTE v56[128];
  _BYTE v57[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v55.receiver = self;
  v55.super_class = (Class)BIHistogram;
  v11 = -[BIHistogram init](&v55, "init");
  if (!v11)
  {
    v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v26)
      sub_10001D844(v26, v27, v28, v29, v30, v31, v32, v33);
    goto LABEL_17;
  }
  v12 = sub_10001714C("bihistogram");
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)*((_QWORD *)v11 + 4);
  *((_QWORD *)v11 + 4) = v13;

  if (!v8)
  {
    if (os_log_type_enabled(*((os_log_t *)v11 + 4), OS_LOG_TYPE_ERROR))
      sub_10001E554();
    goto LABEL_17;
  }
  v11[6] = 0;
  if (v10)
  {
    v46 = v9;
    v15 = objc_msgSend(v10, "mutableCopy");
    v16 = (void *)*((_QWORD *)v11 + 1);
    *((_QWORD *)v11 + 1) = v15;

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v17 = *((id *)v11 + 1);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v11 + 1), "objectForKeyedSubscript:", v22));
          v24 = objc_msgSend(v23, "unsignedIntValue");

          if ((v11[6] + (unint64_t)v24) >> 32)
          {
            if (os_log_type_enabled(*((os_log_t *)v11 + 4), OS_LOG_TYPE_ERROR))
              sub_10001E5AC();

            v34 = 0;
            v9 = v46;
            goto LABEL_30;
          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)v11 + 1), "objectForKeyedSubscript:", v22));
          v11[6] += objc_msgSend(v25, "unsignedIntValue");

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
        if (v19)
          continue;
        break;
      }
    }

    v9 = v46;
    goto LABEL_22;
  }
  v35 = objc_alloc_init((Class)NSMutableDictionary);
  v36 = (void *)*((_QWORD *)v11 + 1);
  *((_QWORD *)v11 + 1) = v35;

  if (!*((_QWORD *)v11 + 1))
  {
    if (os_log_type_enabled(*((os_log_t *)v11 + 4), OS_LOG_TYPE_ERROR))
      sub_10001E580();
LABEL_17:
    v34 = 0;
    goto LABEL_30;
  }
LABEL_22:
  v37 = objc_autoreleasePoolPush();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v38 = v9;
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v40; j = (char *)j + 1)
      {
        if (*(_QWORD *)v48 != v41)
          objc_enumerationMutation(v38);
        objc_msgSend(*((id *)v11 + 1), "setObject:forKeyedSubscript:", &off_10002F560, *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j));
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v40);
  }

  objc_autoreleasePoolPop(v37);
  v43 = objc_msgSend(v8, "copy");
  v44 = (void *)*((_QWORD *)v11 + 2);
  *((_QWORD *)v11 + 2) = v43;

  v34 = v11;
LABEL_30:

  return v34;
}

- (BOOL)insertValue:(id)a3 error:(id *)a4
{
  return -[BIHistogram insertValue:thisManyTimes:error:](self, "insertValue:thisManyTimes:error:", a3, &off_10002F578, a4);
}

- (BOOL)insertValue:(id)a3 thisManyTimes:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NSErrorUserInfoKey v20;
  const __CFString *v21;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v9, "unsignedIntValue");
  if (!v10)
    goto LABEL_9;
  v11 = v10;
  if (!__CFADD__(self->_totalCount, v10))
  {
    v14 = objc_autoreleasePoolPush();
    v15 = (*((uint64_t (**)(void))self->_labelGen + 2))();
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v17, "unsignedIntValue") + v11));

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_histogram, "setObject:forKeyedSubscript:", v18, v16);
    self->_totalCount += v11;

    objc_autoreleasePoolPop(v14);
LABEL_9:
    v13 = 1;
    goto LABEL_10;
  }
  if (a5)
  {
    v20 = NSLocalizedDescriptionKey;
    v21 = CFSTR("Histogram count reached max capacity.                                             Normalized histogram will be unreliable");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 34, v12));

  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    sub_10001E5D8();
  v13 = 0;
LABEL_10:

  return v13;
}

- (void)removeValue:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSObject *logger;
  unsigned int totalCount;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unsigned int v24;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = (*((uint64_t (**)(void))self->_labelGen + 2))();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v7));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v7));
    if (v10)
    {
      v11 = (void *)v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_histogram, "objectForKeyedSubscript:", v7));
      v13 = objc_msgSend(v12, "unsignedIntValue");

      if (!v13)
        goto LABEL_4;
    }
    else
    {

      v13 = 0;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v13 - 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_histogram, "setObject:forKeyedSubscript:", v16, v7);
    --self->_totalCount;

    goto LABEL_8;
  }
LABEL_4:
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
  {
    totalCount = self->_totalCount;
    v17 = 138413058;
    v18 = v4;
    v19 = 2112;
    v20 = v7;
    v21 = 1024;
    v22 = 0;
    v23 = 1024;
    v24 = totalCount;
    _os_log_error_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_ERROR, "Can't remove Value %@ Label %@ Count %u TotalCount %u", (uint8_t *)&v17, 0x22u);
  }
LABEL_8:

  objc_autoreleasePoolPop(v5);
}

- (id)copyHistogram
{
  return -[NSMutableDictionary copy](self->_histogram, "copy");
}

- (id)copyHistogramWithNormalizedCounts
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  void *context;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = -[NSMutableDictionary mutableCopy](self->_histogram, "mutableCopy");
  if (self->_totalCount)
  {
    context = objc_autoreleasePoolPush();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v9));
          objc_msgSend(v10, "floatValue");
          *(float *)&v12 = v11 / (float)self->_totalCount;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v12));
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

    objc_autoreleasePoolPop(context);
  }
  else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG))
  {
    sub_10001E604();
  }
  return v3;
}

- (void)printHistogram
{
  NSMutableDictionary *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  NSObject *logger;
  uint64_t v9;
  NSMutableDictionary *histogram;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  unsigned int v21;
  _BYTE v22[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_histogram;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
        {
          v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          histogram = self->_histogram;
          v11 = logger;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](histogram, "objectForKeyedSubscript:", v9));
          v13 = objc_msgSend(v12, "unsignedIntValue");
          *(_DWORD *)buf = 138412546;
          v19 = v9;
          v20 = 1024;
          v21 = v13;
          _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Bin %@ Value %u", buf, 0x12u);

        }
      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v5);
  }

}

- (unsigned)getTotalCount
{
  return self->_totalCount;
}

- (void)reset
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_histogram, "allKeys", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_histogram, "setObject:forKeyedSubscript:", &off_10002F560, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  self->_totalCount = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong(&self->_labelGen, 0);
  objc_storeStrong((id *)&self->_histogram, 0);
}

@end
