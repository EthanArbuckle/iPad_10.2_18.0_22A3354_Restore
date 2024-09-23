@implementation SAThread

- (void)forwardFillMonotonicallyIncreasingData
{
  void *v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  NSObject *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(a1, "threadStates");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v42, v76, 16);
    if (v2)
    {
      v4 = v2;
      v41 = 0;
      v5 = 0;
      v6 = *(_QWORD *)v43;
      *(_QWORD *)&v3 = 134221570;
      v26 = v3;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          v8 = v5;
          if (*(_QWORD *)v43 != v6)
            objc_enumerationMutation(v1);
          v9 = *(_QWORD **)(*((_QWORD *)&v42 + 1) + 8 * i);
          if (v5)
          {
            if (objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "userTimeInNs")
              && (v10 = objc_msgSend(v9, "userTimeInNs"), v10 < objc_msgSend(v8, "userTimeInNs"))
              || objc_msgSend(v9, "systemTimeInNs", v26)
              && (v11 = objc_msgSend(v9, "systemTimeInNs"), v11 < objc_msgSend(v8, "systemTimeInNs"))
              || objc_msgSend(v9, "instructions")
              && (v12 = objc_msgSend(v9, "instructions"), v12 < objc_msgSend(v8, "instructions"))
              || objc_msgSend(v9, "cycles") && (v13 = objc_msgSend(v9, "cycles"), v13 < objc_msgSend(v8, "cycles")))
            {
              v14 = *__error();
              _sa_logt();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                v39 = objc_msgSend(a1, "threadId");
                objc_msgSend(a1, "threadStates");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v40, "count");
                objc_msgSend(v8, "debugDescription");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "debugDescription");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v8, "cpuTimeNs");
                v35 = objc_msgSend(v8, "userTimeInNs");
                v34 = objc_msgSend(v8, "systemTimeInNs");
                v33 = objc_msgSend(v9, "cpuTimeNs");
                v32 = objc_msgSend(v9, "userTimeInNs");
                v31 = objc_msgSend(v9, "systemTimeInNs");
                v30 = objc_msgSend(v8, "instructions");
                v29 = objc_msgSend(v9, "instructions");
                v28 = objc_msgSend(v8, "cycles");
                v25 = objc_msgSend(v9, "cycles");
                *(_DWORD *)buf = v26;
                v47 = v39;
                v48 = 2048;
                v49 = v41 + i;
                v50 = 2048;
                v51 = v24;
                v52 = 2112;
                v53 = v38;
                v54 = 2112;
                v55 = v37;
                v56 = 2048;
                v57 = v36;
                v58 = 2048;
                v59 = v35;
                v60 = 2048;
                v61 = v34;
                v62 = 2048;
                v63 = v33;
                v64 = 2048;
                v65 = v32;
                v66 = 2048;
                v67 = v31;
                v68 = 2048;
                v69 = v30;
                v70 = 2048;
                v71 = v29;
                v72 = 2048;
                v73 = v28;
                v74 = 2048;
                v75 = v25;
                _os_log_debug_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_DEBUG, "Thread 0x%llx monotonically increasing data decreased at index %lu of %lu between %@ and %@:\ncpu time %llu (%llu + %llu) -> %llu (%llu + %llu)\ninstructions %llu -> %llu\ncycles %llu -> %llu", buf, 0x98u);

              }
              *__error() = v14;
            }
            v16 = objc_msgSend(v9, "userTimeInNs", v26);
            if (v16 < objc_msgSend(v8, "userTimeInNs"))
            {
              v17 = objc_msgSend(v8, "userTimeInNs");
              if (v9)
                v9[17] = v17;
            }
            v18 = objc_msgSend(v9, "systemTimeInNs");
            if (v18 < objc_msgSend(v8, "systemTimeInNs"))
            {
              v19 = objc_msgSend(v8, "systemTimeInNs");
              if (v9)
                v9[18] = v19;
            }
            v20 = objc_msgSend(v9, "instructions");
            if (v20 < objc_msgSend(v8, "instructions"))
            {
              v21 = objc_msgSend(v8, "instructions");
              if (v9)
                v9[19] = v21;
            }
            v22 = objc_msgSend(v9, "cycles");
            if (v22 < objc_msgSend(v8, "cycles"))
            {
              v23 = objc_msgSend(v8, "cycles");
              if (v9)
                v9[20] = v23;
            }
          }
          v5 = v9;

        }
        v4 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v42, v76, 16);
        v41 += i;
      }
      while (v4);

    }
  }
}

- (NSArray)threadStates
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)indexOfFirstThreadStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 0;
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  return -[SAThread indexOfFirstThreadStateOnOrAfterTime:sampleIndex:](self, "indexOfFirstThreadStateOnOrAfterTime:sampleIndex:", a3, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resampledleafOfCRootFramesReplacedBySwiftAsync, 0);
  objc_storeStrong((id *)&self->_resampledLeafUserFrame, 0);
  objc_storeStrong((id *)&self->_exitTimestamp, 0);
  objc_storeStrong((id *)&self->_creationTimestamp, 0);
  objc_storeStrong((id *)&self->_threadStates, 0);
}

- (void)enumerateThreadStatesBetweenStartTime:(id)a3 endTime:(id)a4 reverseOrder:(BOOL)a5 withSampleIndex:(BOOL)a6 block:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  BOOL v16;

  v8 = a5;
  v12 = a7;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__SAThread_enumerateThreadStatesBetweenStartTime_endTime_reverseOrder_withSampleIndex_block___block_invoke;
  v14[3] = &unk_1E7148AB8;
  v16 = a6;
  v15 = v12;
  v13 = v12;
  -[SAThread enumerateThreadStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:](self, "enumerateThreadStatesBetweenStartTime:startSampleIndex:endTime:endSampleIndex:reverseOrder:block:", a3, 0x7FFFFFFFFFFFFFFFLL, a4, 0x7FFFFFFFFFFFFFFFLL, v8, v14);

}

- (SAThread)initWithId:(unint64_t)a3
{
  SAThread *v4;
  SAThread *v5;
  NSMutableArray *v6;
  NSMutableArray *threadStates;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SAThread;
  v4 = -[SAThread init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_threadId = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    threadStates = v5->_threadStates;
    v5->_threadStates = v6;

  }
  return v5;
}

+ (id)threadWithId:(uint64_t)a1
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithId:", a2);
}

- (unint64_t)indexOfFirstThreadStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4
{
  id v6;
  NSMutableArray *threadStates;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  if (-[NSMutableArray count](self->_threadStates, "count"))
  {
    if (v6)
    {
      threadStates = self->_threadStates;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __61__SAThread_indexOfFirstThreadStateOnOrAfterTime_sampleIndex___block_invoke;
      v14[3] = &unk_1E7148A68;
      v15 = v6;
      v8 = SABinarySearchArray(threadStates, 1280, (uint64_t)v14);

    }
    else
    {
      v8 = 0;
    }
    if (a4 != 0x7FFFFFFFFFFFFFFFLL && v8 < -[NSMutableArray count](self->_threadStates, "count"))
    {
      do
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_threadStates, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "startSampleIndex") == 0x7FFFFFFFFFFFFFFFLL)
        {

        }
        else
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_threadStates, "objectAtIndexedSubscript:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "endSampleIndex");

          if (v12 >= a4)
            break;
        }
        ++v8;
      }
      while (v8 < -[NSMutableArray count](self->_threadStates, "count"));
    }
    if (v8 >= -[NSMutableArray count](self->_threadStates, "count"))
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v9 = v8;
  }
  else
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

uint64_t __61__SAThread_indexOfFirstThreadStateOnOrAfterTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "startTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "lt:", v5);

  if ((v4 & 1) != 0)
  {
    v6 = -1;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "endTimestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v7, "gt:", v8);

    v6 = v6;
  }

  return v6;
}

- (id)firstThreadStateOnOrAfterTime:(id)a3 sampleIndex:(unint64_t)a4
{
  unint64_t v5;
  void *v6;

  v5 = -[SAThread indexOfFirstThreadStateOnOrAfterTime:sampleIndex:](self, "indexOfFirstThreadStateOnOrAfterTime:sampleIndex:", a3, a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_threadStates, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (unint64_t)indexOfLastThreadStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4
{
  NSMutableArray *threadStates;
  uint64_t v8;
  unint64_t v9;
  void *v11;
  void *v12;
  unint64_t v13;
  _QWORD v14[5];

  if (!-[NSMutableArray count](self->_threadStates, "count"))
    return 0x7FFFFFFFFFFFFFFFLL;
  threadStates = self->_threadStates;
  if (a3)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__SAThread_indexOfLastThreadStateOnOrBeforeTime_sampleIndex___block_invoke;
    v14[3] = &unk_1E7148A68;
    v14[4] = a3;
    v8 = SABinarySearchArray(threadStates, 1536, (uint64_t)v14);
    if (!v8)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = -[NSMutableArray count](threadStates, "count");
  }
  v9 = v8 - 1;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
    return v9;
  while (1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_threadStates, "objectAtIndexedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "startSampleIndex") == 0x7FFFFFFFFFFFFFFFLL)
    {

    }
    else
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_threadStates, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "startSampleIndex");

      if (v13 <= a4)
        return v9;
    }
    if (!v9)
      break;
    --v9;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __61__SAThread_indexOfLastThreadStateOnOrBeforeTime_sampleIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v7;
  void *v8;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(a2, "startTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "lt:", v5);

  if ((v4 & 1) != 0)
    return -1;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(a2, "endTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "gt:", v8);

  return v7;
}

- (id)lastThreadStateOnOrBeforeTime:(id)a3 sampleIndex:(unint64_t)a4
{
  unint64_t v5;
  void *v6;

  v5 = -[SAThread indexOfLastThreadStateOnOrBeforeTime:sampleIndex:](self, "indexOfLastThreadStateOnOrBeforeTime:sampleIndex:", a3, a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_threadStates, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)firstThreadStateOnOrAfterTime:(id)a3 withSampleIndex:(BOOL)a4
{
  uint64_t v4;

  if (a4)
    v4 = 0;
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  return -[SAThread firstThreadStateOnOrAfterTime:sampleIndex:](self, "firstThreadStateOnOrAfterTime:sampleIndex:", a3, v4);
}

- (id)lastThreadStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4
{
  unint64_t v5;
  void *v6;

  v5 = -[SAThread indexOfLastThreadStateOnOrBeforeTime:withSampleIndex:](self, "indexOfLastThreadStateOnOrBeforeTime:withSampleIndex:", a3, a4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_threadStates, "objectAtIndexedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (unint64_t)indexOfLastThreadStateOnOrBeforeTime:(id)a3 withSampleIndex:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  v4 = a4;
  v6 = a3;
  -[NSMutableArray lastObject](self->_threadStates, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v4 || (v10 = 0x7FFFFFFFFFFFFFFFLL, v9 = objc_msgSend(v7, "endSampleIndex"), v9 != 0x7FFFFFFFFFFFFFFFLL))
      v10 = -[SAThread indexOfLastThreadStateOnOrBeforeTime:sampleIndex:](self, "indexOfLastThreadStateOnOrBeforeTime:sampleIndex:", v6, v9);
  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (void)enumerateThreadStatesBetweenStartTime:(id)a3 startSampleIndex:(unint64_t)a4 endTime:(id)a5 endSampleIndex:(unint64_t)a6 reverseOrder:(BOOL)a7 block:(id)a8
{
  id v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t (**v20)(_QWORD, _QWORD);
  char v21;
  _QWORD v22[5];
  id v23;

  v14 = a5;
  v15 = a8;
  v16 = -[SAThread indexOfFirstThreadStateOnOrAfterTime:sampleIndex:](self, "indexOfFirstThreadStateOnOrAfterTime:sampleIndex:", a3, a4);
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = v16;
    v18 = -[SAThread indexOfLastThreadStateOnOrBeforeTime:sampleIndex:](self, "indexOfLastThreadStateOnOrBeforeTime:sampleIndex:", v14, a6);
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v19 = v18;
      if (v17 <= v18)
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __109__SAThread_enumerateThreadStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke;
        v22[3] = &unk_1E7148A90;
        v22[4] = self;
        v23 = v15;
        v20 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1BCCCC450](v22);
        if (a7)
        {
          do
          {
            if (v19 + 1 <= v17)
              break;
            v21 = v20[2](v20, v19--);
          }
          while ((v21 & 1) == 0);
        }
        else
        {
          do
          {
            if ((v20[2](v20, v17) & 1) != 0)
              break;
            ++v17;
          }
          while (v17 <= v19);
        }

      }
    }
  }

}

uint64_t __109__SAThread_enumerateThreadStatesBetweenStartTime_startSampleIndex_endTime_endSampleIndex_reverseOrder_block___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v6;

  v6 = 0;
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, unsigned __int8 *))(v3 + 16))(v3, v4, a2, &v6);

  return v6;
}

void __93__SAThread_enumerateThreadStatesBetweenStartTime_endTime_reverseOrder_withSampleIndex_block___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (!*(_BYTE *)(a1 + 40) || (v4 = objc_msgSend(v3, "startSampleIndex"), v5 = v6, v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = v6;
  }

}

- (unint64_t)sampleCountInTimestampRangeStart:(id)a3 end:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7 && (objc_msgSend(v6, "le:", v7) & 1) == 0)
  {
    v15 = *__error();
    _sa_logt();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "debugDescription");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = objc_msgSend(v17, "UTF8String");
      objc_msgSend(v8, "debugDescription");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315394;
      v30 = v18;
      v31 = 2080;
      v32 = objc_msgSend(v19, "UTF8String");
      _os_log_error_impl(&dword_1B9BE0000, v16, OS_LOG_TYPE_ERROR, "start time %s after end time %s", buf, 0x16u);

    }
    *__error() = v15;
    objc_msgSend(v6, "debugDescription");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend(v20, "UTF8String");
    objc_msgSend(v8, "debugDescription");
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v22, "UTF8String");
    _SASetCrashLogMessage(243, "start time %s after end time %s", v23, v24, v25, v26, v27, v28, v21);

    _os_crash();
    __break(1u);
  }
  if (-[NSMutableArray count](self->_threadStates, "count")
    && (v9 = -[SAThread indexOfFirstThreadStateOnOrAfterTime:sampleIndex:](self, "indexOfFirstThreadStateOnOrAfterTime:sampleIndex:", v6, 0x7FFFFFFFFFFFFFFFLL), v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v11 = v9;
    v12 = -[SAThread indexOfLastThreadStateOnOrBeforeTime:sampleIndex:](self, "indexOfLastThreadStateOnOrBeforeTime:sampleIndex:", v8, 0x7FFFFFFFFFFFFFFFLL);
    if (v12 >= v11)
      v13 = v12 - v11 + 1;
    else
      v13 = 0;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      v10 = 0;
    else
      v10 = v13;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)cpuTimeForThreadStateIndex:(void *)a3@<X2> inTimestampRangeStart:(void *)a4@<X3> end:(_QWORD *)a5@<X8>
{
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  unint64_t v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;

  v45 = a3;
  v9 = a4;
  a5[1] = 0;
  a5[2] = 0;
  *a5 = 0;
  if (a1)
  {
    objc_msgSend(a1, "threadStates");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 >= a2)
    {
      objc_msgSend(a1, "threadStates");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v13, "endSampleIndex");
      if (a2)
      {
        objc_msgSend(v13, "startTimestamp");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "gt:", v45);

        if (v16)
        {
          objc_msgSend(a1, "threadStates");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectAtIndexedSubscript:", a2 - 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v18, "startSampleIndex") != 0x7FFFFFFFFFFFFFFFLL)
          {
            v21 = v18;
          }
          else
          {
            v19 = a2 - 2;
            while (v19 != -1)
            {
              objc_msgSend(a1, "threadStates");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectAtIndexedSubscript:", v19);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              --v19;
              v18 = v21;
              if (objc_msgSend(v21, "startSampleIndex") != 0x7FFFFFFFFFFFFFFFLL)
                goto LABEL_12;
            }

            v21 = 0;
          }
LABEL_12:
          objc_msgSend(v21, "endTimestamp", v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "lt:", v45);

          if (v23)
          {

            v14 = v44;
          }
          else
          {
            v14 = v44;
            if (v21)
            {
              if (!objc_msgSend(v13, "isIdleWorkQueue")
                || objc_msgSend(v21, "isIdleWorkQueue"))
              {
                v24 = objc_msgSend(v13, "cpuTimeNs");
                *a5 = v24 - objc_msgSend(v21, "cpuTimeNs");
                v25 = objc_msgSend(v13, "instructions");
                a5[1] = v25 - objc_msgSend(v21, "instructions");
                v26 = objc_msgSend(v13, "cycles");
                v27 = v26 - objc_msgSend(v21, "cycles");
LABEL_21:
                a5[2] = v27;
              }
LABEL_23:
              if ((objc_msgSend(v13, "isIdleWorkQueue") & 1) == 0)
              {
                objc_msgSend(a1, "threadStates");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v30, "count") - 1 <= a2)
                {
LABEL_41:

                  goto LABEL_42;
                }
                objc_msgSend(v13, "endTimestamp");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v31, "lt:", v9);

                if (v32)
                {
                  objc_msgSend(a1, "threadStates");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "objectAtIndexedSubscript:", a2 + 1);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if (objc_msgSend(v30, "startSampleIndex") == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      v34 = a2 + 2;
                      while (1)
                      {
                        objc_msgSend(a1, "threadStates");
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        v36 = objc_msgSend(v35, "count") - 1;

                        if (v34 - 1 >= v36)
                          break;
                        objc_msgSend(a1, "threadStates");
                        v37 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v37, "objectAtIndexedSubscript:", v34);
                        v38 = (void *)objc_claimAutoreleasedReturnValue();

                        ++v34;
                        v30 = v38;
                        if (objc_msgSend(v38, "startSampleIndex") != 0x7FFFFFFFFFFFFFFFLL)
                          goto LABEL_35;
                      }

                      v38 = 0;
                    }
                    else
                    {
                      v38 = v30;
                    }
LABEL_35:
                    objc_msgSend(v38, "startTimestamp");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = objc_msgSend(v39, "gt:", v9);

                    if (v40)
                    {

                      v30 = 0;
                      goto LABEL_41;
                    }
                    v30 = v38;
                  }
                  if (v30 && objc_msgSend(v30, "isIdleWorkQueue"))
                  {
                    v41 = objc_msgSend(v30, "cpuTimeNs");
                    *a5 += v41 - objc_msgSend(v13, "cpuTimeNs");
                    v42 = objc_msgSend(v30, "instructions");
                    a5[1] += v42 - objc_msgSend(v13, "instructions");
                    v43 = objc_msgSend(v30, "cycles");
                    a5[2] += v43 - objc_msgSend(v13, "cycles");
                  }
                  goto LABEL_41;
                }
              }
LABEL_42:

              goto LABEL_43;
            }
          }
        }
      }
      objc_msgSend(a1, "creationTimestamp");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
        goto LABEL_23;
      objc_msgSend(a1, "creationTimestamp");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "ge:", v45);

      if (v29)
      {
        *a5 = objc_msgSend(v13, "cpuTimeNs");
        a5[1] = objc_msgSend(v13, "instructions");
        v27 = objc_msgSend(v13, "cycles");
        v21 = 0;
        goto LABEL_21;
      }
      v21 = 0;
      goto LABEL_23;
    }
  }
LABEL_43:

}

- (void)insertState:(uint64_t)a3 atIndex:
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  _BYTE *v14;
  void *v15;
  _BYTE *v16;
  void *v17;
  void *v18;
  _QWORD v19[6];
  _QWORD v20[4];
  id v21;
  id v22;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1[1], "insertObject:atIndex:", v5, a3);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a3, objc_msgSend(a1[1], "count") - a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v9 = a1[1];
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __32__SAThread_insertState_atIndex___block_invoke;
    v20[3] = &unk_1E7148AE0;
    v11 = v7;
    v21 = v11;
    v12 = v8;
    v22 = v12;
    objc_msgSend(v9, "enumerateObjectsAtIndexes:options:usingBlock:", v6, 0, v20);
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __32__SAThread_insertState_atIndex___block_invoke_2;
    v19[3] = &unk_1E7148B30;
    v19[4] = a1;
    v19[5] = a3;
    v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x1BCCCC450](v19);
    ((void (**)(_QWORD, id))v13)[2](v13, v11);
    objc_msgSend(v5, "dispatchQueue");
    v14 = (_BYTE *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      +[SARecipeState stateWithThread:threadStateIndex:]((uint64_t)SADispatchQueueState, a1, a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14[24])
        v16 = 0;
      else
        v16 = v14 + 24;
      -[SARecipe insertState:hasConcurrentExecution:]((uint64_t)v14, v15, v16);

    }
    ((void (**)(_QWORD, id))v13)[2](v13, v12);
    objc_msgSend(v5, "swiftTask");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      +[SARecipeState stateWithThread:threadStateIndex:]((uint64_t)SASwiftTaskState, a1, a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SARecipe insertState:hasConcurrentExecution:]((uint64_t)v17, v18, 0);

    }
  }

}

void __32__SAThread_insertState_atIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "dispatchQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  objc_msgSend(v5, "swiftTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

void __32__SAThread_insertState_atIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "states");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = v7;
        v11[1] = 3221225472;
        v11[2] = __32__SAThread_insertState_atIndex___block_invoke_3;
        v11[3] = &unk_1E7148B08;
        v10 = *(_QWORD *)(a1 + 40);
        v11[4] = *(_QWORD *)(a1 + 32);
        v11[5] = v10;
        objc_msgSend(v9, "enumerateObjectsWithOptions:usingBlock:", 2, v11);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

void __32__SAThread_insertState_atIndex___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;

  v10 = a2;
  objc_msgSend(v10, "thread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);

  v8 = v10;
  if (v6 == v7)
  {
    if ((unint64_t)objc_msgSend(v10, "threadStateIndex") >= *(_QWORD *)(a1 + 40))
    {
      v9 = objc_msgSend(v10, "threadStateIndex");
      v8 = v10;
      if (v10)
        v10[2] = v9 + 1;
    }
    else
    {
      *a4 = 1;
      v8 = v10;
    }
  }

}

- (id)patchedStackForTruncatedStack:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  char v7;
  id v8;
  SAFrame *v9;
  SAFrame *v10;
  SAFrame *parentFrame;
  SAFrame *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  BOOL v23;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  char v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  int v35;
  NSObject *v36;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  NSObject *v42;
  id v43;
  void *v44;
  id v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  SAThread *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isTruncatedBacktraceFrame");

  if ((v7 & 1) == 0)
  {
    v41 = *__error();
    _sa_logt();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v3 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v3, "debugDescription");
      v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      v67 = objc_msgSend(v43, "UTF8String");
      _os_log_error_impl(&dword_1B9BE0000, v42, OS_LOG_TYPE_ERROR, "%s is not a truncated frame", buf, 0xCu);

    }
    *__error() = v41;
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "debugDescription");
    v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v46 = objc_msgSend(v45, "UTF8String");
    _SASetCrashLogMessage(454, "%s is not a truncated frame", v47, v48, v49, v50, v51, v52, v46);

    _os_crash();
    __break(1u);
    goto LABEL_46;
  }
  if (self->_resampledLeafUserFrame)
  {
    v65 = objc_msgSend(v5, "count");
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v61 = self;
    v9 = self->_resampledLeafUserFrame;
    if (v9)
    {
      v10 = v9;
      do
      {
        objc_msgSend(v8, "insertObject:atIndex:", v10, 0);
        parentFrame = v10->_parentFrame;
        v12 = parentFrame;

        v10 = v12;
      }
      while (parentFrame);
    }
    v62 = objc_msgSend(v8, "count");
    if (v62)
    {
      v13 = 0;
      v3 = 0;
      v14 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        v63 = v14;
        v64 = v3;
        if (v65 < 2)
        {
          v16 = 0;
        }
        else
        {
          v15 = 0;
          while (1)
          {
            v16 = v15 + 1;
            v17 = v5;
            objc_msgSend(v5, "objectAtIndexedSubscript:", v15 + 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "address");
            objc_msgSend(v8, "objectAtIndexedSubscript:", v13 + v15);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "address");

            if (v19 != v21)
              break;
            if (v16 >= v62 - v13)
              goto LABEL_16;
            v22 = v15 + 2;
            ++v15;
            v5 = v17;
            if (v22 >= v65)
              goto LABEL_17;
          }
          v16 = v15;
LABEL_16:
          v5 = v17;
        }
LABEL_17:
        v14 = v63;
        v3 = v64;
        if (v16)
          v23 = v16 >= v64;
        else
          v23 = 0;
        if (v23)
        {
          v14 = v13;
          v3 = v16;
        }
        ++v13;
      }
      while (v13 != v62);
      if (v3)
      {
LABEL_27:
        if (v14 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v8, "removeObjectsInRange:", v14, v62 - v14);
          objc_msgSend(v5, "subarrayWithRange:", 1, v65 - 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObjectsFromArray:", v25);

          v26 = v8;
LABEL_41:
          v28 = v26;

          goto LABEL_42;
        }
LABEL_46:
        v53 = *__error();
        _sa_logt();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v67 = v3;
          v68 = 2048;
          v69 = 0x7FFFFFFFFFFFFFFFLL;
          _os_log_error_impl(&dword_1B9BE0000, v54, OS_LOG_TYPE_ERROR, "best match length is %lu, but index is %lu", buf, 0x16u);
        }

        *__error() = v53;
        _SASetCrashLogMessage(516, "best match length is %lu, but index is %lu", v55, v56, v57, v58, v59, v60, v3);
        _os_crash();
        __break(1u);
      }
    }
    if ((unint64_t)objc_msgSend(v5, "count") >= 3)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v27, "isKernel") & 1) != 0)
      {

      }
      else
      {
        if (objc_msgSend(v5, "count") == 3)
        {

        }
        else
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", 3);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isKernel");

          if ((v30 & 1) == 0)
            goto LABEL_38;
        }
        objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "address");
        objc_msgSend(v8, "lastObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "address");

        if (v32 == v34)
        {
          v14 = v62 - 1;
          v3 = 1;
          goto LABEL_27;
        }
      }
    }
LABEL_38:
    v35 = *__error();
    _sa_logt();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      -[SAThread debugDescription](v61, "debugDescription");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "debugDescription");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "debugDescription");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v67 = (uint64_t)v38;
      v68 = 2112;
      v69 = (uint64_t)v39;
      v70 = 2112;
      v71 = v40;
      _os_log_debug_impl(&dword_1B9BE0000, v36, OS_LOG_TYPE_DEBUG, "%@ no matching frames in resampled stack:%@\nvs\n%@", buf, 0x20u);

    }
    *__error() = v35;
    v26 = v5;
    goto LABEL_41;
  }
  v28 = v5;
LABEL_42:

  return v28;
}

- (BOOL)isProcessorIdleThread
{
  unsigned __int8 *v2;
  int v3;

  -[NSMutableArray lastObject](self->_threadStates, "lastObject");
  v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = v2[40] >> 7;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (NSString)debugDescription
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Thread 0x%llx"), self->_threadId);
}

- (unint64_t)threadId
{
  return self->_threadId;
}

- (SATimestamp)creationTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 32, 1);
}

- (SATimestamp)exitTimestamp
{
  return (SATimestamp *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)isGlobalForcedIdle
{
  return self->_isGlobalForcedIdle;
}

- (BOOL)isMainThread
{
  return self->_isMainThread;
}

+ (id)classDictionaryKey
{
  return CFSTR("SAThread");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  return 8 * -[NSMutableArray count](self->_threadStates, "count") + 48;
}

- (BOOL)addSelfToBuffer:(id *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  uint64_t v5;
  id v9;
  char v10;
  unsigned int v11;
  unsigned int *v12;
  NSObject *v14;
  id v15;
  id v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  NSObject *v37;
  id v38;
  uint64_t v39;
  int v40;
  unint64_t v41;
  id v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  _BYTE v53[24];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (-[SAThread sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v5 = *__error();
    _sa_logt();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[SAThread debugDescription](self, "debugDescription");
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v51 = objc_msgSend(v15, "UTF8String");
      v52 = 2048;
      *(_QWORD *)v53 = -[SAThread sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_WORD *)&v53[8] = 2048;
      *(_QWORD *)&v53[10] = a4;
      _os_log_error_impl(&dword_1B9BE0000, v14, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v5;
    -[SAThread debugDescription](self, "debugDescription");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    -[SAThread sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(3768, "%s: size %lu != buffer length %lu", v18, v19, v20, v21, v22, v23, v17);

    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  *(_WORD *)&a3->var0 = 769;
  *(_QWORD *)(&a3->var1 + 1) = self->_threadId;
  v10 = BYTE6(a3->var4) & 0xFE | self->_isGlobalForcedIdle;
  BYTE6(a3->var4) = v10;
  BYTE6(a3->var4) = v10 & 0xFD | (2 * self->_isMainThread);
  *(unint64_t *)((char *)&a3->var2 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_creationTimestamp, v9);
  *(unint64_t *)((char *)&a3->var3 + 2) = SASerializableIndexForPointerFromSerializationDictionary(self->_exitTimestamp, v9);
  if ((unint64_t)-[NSMutableArray count](self->_threadStates, "count") >= 0xFFFFFFFF)
  {
LABEL_8:
    v24 = *__error();
    _sa_logt();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      -[SAThread debugDescription](self, "debugDescription");
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v27 = objc_msgSend(v26, "UTF8String");
      v28 = -[NSMutableArray count](self->_threadStates, "count");
      *(_DWORD *)buf = 136315394;
      v51 = v27;
      v52 = 2048;
      *(_QWORD *)v53 = v28;
      _os_log_error_impl(&dword_1B9BE0000, v25, OS_LOG_TYPE_ERROR, "%s has %lu states", buf, 0x16u);

    }
    *__error() = v24;
    -[SAThread debugDescription](self, "debugDescription");
    a3 = ($D861F1FA08E8FC41A5785E3813195A1D *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v29 = -[$D861F1FA08E8FC41A5785E3813195A1D UTF8String](a3, "UTF8String");
    -[NSMutableArray count](self->_threadStates, "count");
    _SASetCrashLogMessage(3782, "%s has %lu states", v30, v31, v32, v33, v34, v35, v29);

    _os_crash();
    __break(1u);
LABEL_11:
    v36 = *__error();
    _sa_logt();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      -[SAThread debugDescription](self, "debugDescription");
      v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v39 = objc_msgSend(v38, "UTF8String");
      v40 = *(_DWORD *)((char *)&a3->var4 + 2);
      v41 = -[SAThread sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      *(_DWORD *)buf = 136315906;
      v51 = v39;
      v52 = 1024;
      *(_DWORD *)v53 = v40;
      *(_WORD *)&v53[4] = 2048;
      *(_QWORD *)&v53[6] = v5;
      *(_WORD *)&v53[14] = 2048;
      *(_QWORD *)&v53[16] = v41;
      _os_log_error_impl(&dword_1B9BE0000, v37, OS_LOG_TYPE_ERROR, "%s: after serializing (with %u threadStates), ended with length %ld, should be %lu", buf, 0x26u);

    }
    *__error() = v36;
    -[SAThread debugDescription](self, "debugDescription");
    v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v43 = objc_msgSend(v42, "UTF8String");
    -[SAThread sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(3789, "%s: after serializing (with %u threadStates), ended with length %ld, should be %lu", v44, v45, v46, v47, v48, v49, v43);

    _os_crash();
    __break(1u);
  }
  v11 = -[NSMutableArray count](self->_threadStates, "count");
  *(_DWORD *)((char *)&a3->var4 + 2) = v11;
  SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances(&a3->var5, v11, self->_threadStates, v9);
  v12 = &a3->var5 + 2 * *(unsigned int *)((char *)&a3->var4 + 2);
  v5 = 8 * *(unsigned int *)((char *)&a3->var4 + 2) + 48;
  if (v5 != -[SAThread sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion"))
    goto LABEL_11;
  *(_QWORD *)v12 = SASerializableIndexForPointerFromSerializationDictionary(self->_resampledLeafUserFrame, v9);
  *((_QWORD *)v12 + 1) = SASerializableIndexForPointerFromSerializationDictionary(self->_resampledleafOfCRootFramesReplacedBySwiftAsync, v9);

  return 1;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "classDictionaryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    -[SATimestamp addSelfToSerializationDictionary:](self->_creationTimestamp, "addSelfToSerializationDictionary:", v4);
    -[SATimestamp addSelfToSerializationDictionary:](self->_exitTimestamp, "addSelfToSerializationDictionary:", v4);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_threadStates;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "addSelfToSerializationDictionary:", v4, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[SAFrame addSelfToSerializationDictionary:](self->_resampledLeafUserFrame, "addSelfToSerializationDictionary:", v4);
    -[SAFrame addSelfToSerializationDictionary:](self->_resampledleafOfCRootFramesReplacedBySwiftAsync, "addSelfToSerializationDictionary:", v4);
  }

}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  uint64_t v5;
  id result;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  unint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)a3 >= 4u)
    goto LABEL_11;
  if (a4 <= 0x1F)
  {
    v7 = *__error();
    _sa_logt();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v25 = a4;
      v26 = 2048;
      v27 = 32;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThread struct %lu", buf, 0x16u);
    }

    *__error() = v7;
    _SASetCrashLogMessage(3818, "bufferLength %lu < serialized SAThread struct %lu", v8, v9, v10, v11, v12, v13, a4);
    _os_crash();
    __break(1u);
    goto LABEL_8;
  }
  v5 = (uint64_t)a3;
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 26) + 32 > a4)
  {
LABEL_8:
    v14 = *__error();
    _sa_logt();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_DWORD *)(v5 + 26);
      *(_DWORD *)buf = 134218240;
      v25 = a4;
      v26 = 1024;
      LODWORD(v27) = v16;
      _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThread struct with %u thread states", buf, 0x12u);
    }

    *__error() = v14;
    _SASetCrashLogMessage(3819, "bufferLength %lu < serialized SAThread struct with %u thread states", v17, v18, v19, v20, v21, v22, a4);
    _os_crash();
    __break(1u);
LABEL_11:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAThread version"), 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
  +[SAThread threadWithId:]((uint64_t)SAThread, *(_QWORD *)((char *)a3 + 2));
  result = (id)objc_claimAutoreleasedReturnValue();
  *((_BYTE *)result + 16) = *(_BYTE *)(v5 + 30) & 1;
  *((_BYTE *)result + 17) = (*(_BYTE *)(v5 + 30) & 2) != 0;
  return result;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  SATimestamp *v14;
  SATimestamp *creationTimestamp;
  unint64_t v16;
  void *v17;
  SATimestamp *v18;
  SATimestamp *exitTimestamp;
  char *v20;
  uint64_t v21;
  void *v22;
  NSMutableArray *v23;
  NSMutableArray *threadStates;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  SAFrame *v28;
  SAFrame *resampledLeafUserFrame;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  SAFrame *v33;
  SAFrame *resampledleafOfCRootFramesReplacedBySwiftAsync;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  NSObject *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  NSObject *v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  NSObject *v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  uint8_t buf[4];
  unint64_t v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v70 = a5;
  v10 = a6;
  if (*(unsigned __int8 *)a3 >= 4u)
    goto LABEL_22;
  if (a4 <= 0x1F)
  {
    v35 = *__error();
    _sa_logt();
    a3 = (const void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v72 = a4;
      v73 = 2048;
      v74 = 32;
      _os_log_error_impl(&dword_1B9BE0000, (os_log_t)a3, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThread struct %lu", buf, 0x16u);
    }

    *__error() = v35;
    _SASetCrashLogMessage(3833, "bufferLength %lu < serialized SAThread struct %lu", v36, v37, v38, v39, v40, v41, a4);
    _os_crash();
    __break(1u);
    goto LABEL_13;
  }
  if (8 * (unint64_t)*(unsigned int *)((char *)a3 + 26) + 32 > a4)
  {
LABEL_13:
    v42 = *__error();
    _sa_logt();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v44 = *(_DWORD *)((char *)a3 + 26);
      *(_DWORD *)buf = 134218240;
      v72 = a4;
      v73 = 1024;
      LODWORD(v74) = v44;
      _os_log_error_impl(&dword_1B9BE0000, v43, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThread struct with %u thread states", buf, 0x12u);
    }

    *__error() = v42;
    _SASetCrashLogMessage(3834, "bufferLength %lu < serialized SAThread struct with %u thread states", v45, v46, v47, v48, v49, v50, a4);
    _os_crash();
    __break(1u);
    goto LABEL_16;
  }
  v11 = v10;
  v12 = *(_QWORD *)((char *)a3 + 10);
  v13 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v12, v70, v11, v13, 0);
  v14 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  creationTimestamp = self->_creationTimestamp;
  self->_creationTimestamp = v14;

  v16 = *(_QWORD *)((char *)a3 + 18);
  v17 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v16, v70, v11, v17, 0);
  v18 = (SATimestamp *)objc_claimAutoreleasedReturnValue();
  exitTimestamp = self->_exitTimestamp;
  self->_exitTimestamp = v18;

  v20 = (char *)a3 + 32;
  v21 = *(unsigned int *)((char *)a3 + 26);
  v22 = (void *)objc_opt_class();
  SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 32, v21, v70, v11, v22);
  v23 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  threadStates = self->_threadStates;
  self->_threadStates = v23;

  if (*((unsigned __int8 *)a3 + 1) < 2u)
    goto LABEL_9;
  v25 = *(unsigned int *)((char *)a3 + 26);
  if (8 * v25 + 40 > a4)
  {
LABEL_16:
    v51 = *__error();
    _sa_logt();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = *(_DWORD *)((char *)a3 + 26);
      *(_DWORD *)buf = 134218240;
      v72 = a4;
      v73 = 1024;
      LODWORD(v74) = v53;
      _os_log_error_impl(&dword_1B9BE0000, v52, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThread v2 struct with %u thread states", buf, 0x12u);
    }

    *__error() = v51;
    _SASetCrashLogMessage(3844, "bufferLength %lu < serialized SAThread v2 struct with %u thread states", v54, v55, v56, v57, v58, v59, a4);
    _os_crash();
    __break(1u);
LABEL_19:
    v60 = *__error();
    _sa_logt();
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      v62 = *(_DWORD *)((char *)a3 + 26);
      *(_DWORD *)buf = 134218240;
      v72 = a4;
      v73 = 1024;
      LODWORD(v74) = v62;
      _os_log_error_impl(&dword_1B9BE0000, v61, OS_LOG_TYPE_ERROR, "bufferLength %lu < serialized SAThread v3 struct with %u thread states", buf, 0x12u);
    }

    *__error() = v60;
    _SASetCrashLogMessage(3850, "bufferLength %lu < serialized SAThread v3 struct with %u thread states", v63, v64, v65, v66, v67, v68, a4);
    _os_crash();
    __break(1u);
LABEL_22:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), CFSTR("Unknown SAThread version"), 0);
    v69 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v69);
  }
  v26 = *(_QWORD *)&v20[8 * v25];
  v27 = (void *)objc_opt_class();
  _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v26, v70, v11, v27, 0);
  v28 = (SAFrame *)objc_claimAutoreleasedReturnValue();
  resampledLeafUserFrame = self->_resampledLeafUserFrame;
  self->_resampledLeafUserFrame = v28;

  if (*((unsigned __int8 *)a3 + 1) >= 3u)
  {
    v30 = *(unsigned int *)((char *)a3 + 26);
    if (8 * v30 + 48 <= a4)
    {
      v31 = *(_QWORD *)&v20[8 * v30 + 8];
      v32 = (void *)objc_opt_class();
      _SASerializableInstanceForIndexUsingDeserializationDictionaryAndDataBufferDictionaryAndClass(v31, v70, v11, v32, 0);
      v33 = (SAFrame *)objc_claimAutoreleasedReturnValue();
      resampledleafOfCRootFramesReplacedBySwiftAsync = self->_resampledleafOfCRootFramesReplacedBySwiftAsync;
      self->_resampledleafOfCRootFramesReplacedBySwiftAsync = v33;

      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_9:

}

@end
