@implementation SAWSUpdateTimeToIndexMapping

- (unint64_t)frameStartSampleIndex
{
  if (-[SAWSUpdateTimeToIndexMapping waitStartSampleIndex](self, "waitStartSampleIndex") != -1)
    return -[SAWSUpdateTimeToIndexMapping waitStartSampleIndex](self, "waitStartSampleIndex");
  if (-[SAWSUpdateTimeToIndexMapping deferStartSampleIndex](self, "deferStartSampleIndex") == -1)
    return -[SAWSUpdateTimeToIndexMapping workStartSampleIndex](self, "workStartSampleIndex");
  return -[SAWSUpdateTimeToIndexMapping deferStartSampleIndex](self, "deferStartSampleIndex");
}

- (unint64_t)numFrameIndices
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[SAWSUpdateTimeToIndexMapping numWaitIndices](self, "numWaitIndices");
  v4 = -[SAWSUpdateTimeToIndexMapping numDeferIndices](self, "numDeferIndices") + v3;
  return v4 + -[SAWSUpdateTimeToIndexMapping numWorkIndices](self, "numWorkIndices");
}

- (unint64_t)frameEndSampleIndex
{
  unint64_t result;
  unint64_t v4;

  result = -[SAWSUpdateTimeToIndexMapping frameStartSampleIndex](self, "frameStartSampleIndex");
  if (result != -1)
  {
    v4 = -[SAWSUpdateTimeToIndexMapping frameStartSampleIndex](self, "frameStartSampleIndex");
    return v4 + -[SAWSUpdateTimeToIndexMapping numFrameIndices](self, "numFrameIndices") - 1;
  }
  return result;
}

- (unint64_t)waitEndSampleIndex
{
  unint64_t result;
  unint64_t v4;

  result = -[SAWSUpdateTimeToIndexMapping waitStartSampleIndex](self, "waitStartSampleIndex");
  if (result != -1)
  {
    v4 = -[SAWSUpdateTimeToIndexMapping waitStartSampleIndex](self, "waitStartSampleIndex");
    return v4 + -[SAWSUpdateTimeToIndexMapping numWaitIndices](self, "numWaitIndices") - 1;
  }
  return result;
}

- (unint64_t)deferEndSampleIndex
{
  unint64_t result;
  unint64_t v4;

  result = -[SAWSUpdateTimeToIndexMapping deferStartSampleIndex](self, "deferStartSampleIndex");
  if (result != -1)
  {
    v4 = -[SAWSUpdateTimeToIndexMapping deferStartSampleIndex](self, "deferStartSampleIndex");
    return v4 + -[SAWSUpdateTimeToIndexMapping numDeferIndices](self, "numDeferIndices") - 1;
  }
  return result;
}

- (unint64_t)workEndSampleIndex
{
  unint64_t result;
  unint64_t v4;

  result = -[SAWSUpdateTimeToIndexMapping workStartSampleIndex](self, "workStartSampleIndex");
  if (result != -1)
  {
    v4 = -[SAWSUpdateTimeToIndexMapping workStartSampleIndex](self, "workStartSampleIndex");
    return v4 + -[SAWSUpdateTimeToIndexMapping numWorkIndices](self, "numWorkIndices") - 1;
  }
  return result;
}

- (SAWSUpdateTimeToIndexMapping)initWithWSUpdateData:(id)a3 andSampleDataStore:(id)a4 andHintIndex:(unint64_t)a5
{
  double *v8;
  id v9;
  void *v10;
  SAWSUpdateTimeToIndexMapping *v11;
  char *v12;
  unint64_t *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  objc_super v19;

  v8 = (double *)a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v19.receiver = self;
    v19.super_class = (Class)SAWSUpdateTimeToIndexMapping;
    v12 = -[SAWSUpdateTimeToIndexMapping init](&v19, sel_init);
    v13 = (unint64_t *)v12;
    if (v12)
    {
      *(_OWORD *)(v12 + 40) = xmmword_1B9CC2CF0;
      *(_OWORD *)(v12 + 24) = xmmword_1B9CC2CF0;
      v14 = v12 + 24;
      v15 = v12 + 32;
      v16 = v12 + 16;
      *(_OWORD *)(v12 + 8) = xmmword_1B9CC2CF0;
      v17 = v12 + 8;
      _getIndexRangeForTimestamps((unint64_t *)v12 + 1, (_QWORD *)v12 + 2, v10, a5, v8[1], v8[2]);
      if (*v17 != -1)
        a5 = *v16 + *v17;
      _getIndexRangeForTimestamps(v13 + 3, v13 + 4, v10, a5, v8[2], v8[3]);
      if (*v14 != -1)
        a5 = *v15 + *v14;
      _getIndexRangeForTimestamps(v13 + 5, v13 + 6, v10, a5, v8[3], v8[4]);
    }
    self = v13;
    v11 = self;
  }

  return v11;
}

+ (id)arrayOfMappingsFromWSUpdataDataArray:(id)a3 andSampleDataStore:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SAWSUpdateTimeToIndexMapping *v16;
  SAWSUpdateTimeToIndexMapping *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  int v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[16];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      v13 = -1;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14);
          v16 = [SAWSUpdateTimeToIndexMapping alloc];
          v17 = -[SAWSUpdateTimeToIndexMapping initWithWSUpdateData:andSampleDataStore:andHintIndex:](v16, "initWithWSUpdateData:andSampleDataStore:andHintIndex:", v15, v7, v13, (_QWORD)v26);
          if (-[SAWSUpdateTimeToIndexMapping frameStartSampleIndex](v17, "frameStartSampleIndex") != -1)
          {
            v18 = -[SAWSUpdateTimeToIndexMapping frameStartSampleIndex](v17, "frameStartSampleIndex");
            v13 = -[SAWSUpdateTimeToIndexMapping numFrameIndices](v17, "numFrameIndices") + v18;
          }
          objc_msgSend(v8, "addObject:", v17);

          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v11);
    }

    v19 = objc_msgSend(v8, "count");
    if (v19 == objc_msgSend(v9, "count"))
    {
      v20 = v8;
    }
    else
    {
      v23 = *__error();
      _sa_logt();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B9BE0000, v24, OS_LOG_TYPE_DEFAULT, "WARNING: Different number of index mappings and WS updates. Bailing...", buf, 2u);
      }

      v20 = 0;
      *__error() = v23;
    }

  }
  else
  {
    v21 = *__error();
    _sa_logt();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9BE0000, v22, OS_LOG_TYPE_DEFAULT, "WARNING: Nil update data array or data store", buf, 2u);
    }

    v20 = 0;
    *__error() = v21;
  }

  return v20;
}

- (void)printFrameIndexRangeToStream:(id)a3 withTranslationDelta:(int64_t)a4
{
  id v6;

  v6 = a3;
  _printSampleRangeForIndices(v6, -[SAWSUpdateTimeToIndexMapping frameStartSampleIndex](self, "frameStartSampleIndex"), -[SAWSUpdateTimeToIndexMapping numFrameIndices](self, "numFrameIndices"), a4);

}

- (void)printWaitIndexRangeToStream:(id)a3 withTranslationDelta:(int64_t)a4
{
  id v6;

  v6 = a3;
  _printSampleRangeForIndices(v6, -[SAWSUpdateTimeToIndexMapping waitStartSampleIndex](self, "waitStartSampleIndex"), -[SAWSUpdateTimeToIndexMapping numWaitIndices](self, "numWaitIndices"), a4);

}

- (void)printDeferIndexRangeToStream:(id)a3 withTranslationDelta:(int64_t)a4
{
  id v6;

  v6 = a3;
  _printSampleRangeForIndices(v6, -[SAWSUpdateTimeToIndexMapping deferStartSampleIndex](self, "deferStartSampleIndex"), -[SAWSUpdateTimeToIndexMapping numDeferIndices](self, "numDeferIndices"), a4);

}

- (void)printWorkIndexRangeToStream:(id)a3 withTranslationDelta:(int64_t)a4
{
  id v6;

  v6 = a3;
  _printSampleRangeForIndices(v6, -[SAWSUpdateTimeToIndexMapping workStartSampleIndex](self, "workStartSampleIndex"), -[SAWSUpdateTimeToIndexMapping numWorkIndices](self, "numWorkIndices"), a4);

}

- (unint64_t)waitStartSampleIndex
{
  return self->_waitStartSampleIndex;
}

- (unint64_t)numWaitIndices
{
  return self->_numWaitIndices;
}

- (unint64_t)deferStartSampleIndex
{
  return self->_deferStartSampleIndex;
}

- (unint64_t)numDeferIndices
{
  return self->_numDeferIndices;
}

- (unint64_t)workStartSampleIndex
{
  return self->_workStartSampleIndex;
}

- (unint64_t)numWorkIndices
{
  return self->_numWorkIndices;
}

@end
