@implementation SAWSUpdateDataStore

void __48__SAWSUpdateDataStore__getWSUpdateArraySnapshot__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (SAWSUpdateDataStore)init
{
  SAWSUpdateDataStore *v2;
  SAWSUpdateDataStore *v3;
  NSMutableArray *wsUpdateArray;
  dispatch_queue_t v5;
  OS_dispatch_queue *wsUpdateCallbackQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SAWSUpdateDataStore;
  v2 = -[SAWSUpdateDataStore init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    wsUpdateArray = v2->_wsUpdateArray;
    v2->_wsUpdateArray = 0;

    v5 = dispatch_queue_create("WS Update Callback Serial queue", 0);
    wsUpdateCallbackQueue = v3->_wsUpdateCallbackQueue;
    v3->_wsUpdateCallbackQueue = (OS_dispatch_queue *)v5;

  }
  return v3;
}

- (void)printFrameRateReportWithStartSampleIndex:(uint64_t)a3 endSampleIndex:(uint64_t)a4 startDisplayIndex:(void *)a5 sampleDataStore:(void *)a6 toStream:
{
  id v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  unint64_t v16;
  int v17;
  NSObject *v18;
  const __CFString *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  double *v40;
  void *v41;
  void *v42;
  double v43;
  id v44;
  double *v45;
  id v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  id v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  int v61;
  double v62;
  double v63;
  double v64;
  double v65;
  const __CFString *v67;
  const __CFString *v68;
  unsigned int v70;
  unint64_t v71;
  const __CFString *v72;
  int v73;
  NSObject *v74;
  int v75;
  NSObject *v76;
  void *v77;
  id v78;
  uint64_t v79;
  double v80;
  void *v81;
  id v82;
  void *v83;
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;

  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (a1)
  {
    if (!v12)
    {
      v14 = *__error();
      _sa_logt();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_DEFAULT, "WARNING: Invalid stream. Bailing", buf, 2u);
      }

      *__error() = v14;
    }
    objc_msgSend(v13, "appendString:", CFSTR("\n\n"));
    if (a3)
      v16 = a3;
    else
      v16 = -1;
    if (v16 < a2)
    {
      v17 = *__error();
      _sa_logt();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B9BE0000, v18, OS_LOG_TYPE_DEFAULT, "WARNING: Start index greater than end index. Bailing", buf, 2u);
      }

      *__error() = v17;
      v19 = CFSTR("Start Index > End Index. Could not print report\n");
      goto LABEL_71;
    }
    objc_msgSend(v11, "sampleTimestamps");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21 <= a2)
    {
      v19 = CFSTR("No WS Updates\n");
LABEL_71:
      objc_msgSend(v13, "appendString:", v19);
      goto LABEL_79;
    }
    objc_msgSend(v11, "sampleTimestamps");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v16 >= v23)
    {
      objc_msgSend(v11, "sampleTimestamps");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = objc_msgSend(v24, "count") - 1;

    }
    objc_msgSend(v11, "sampleTimestamps");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", a2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "machAbsTimeSeconds");
    v28 = v27;

    objc_msgSend(v11, "sampleTimestamps");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "machAbsTimeSeconds");
    v32 = v31;

    v33 = (void *)MEMORY[0x1BCCCC288]();
    v34 = v13;
    objc_opt_self();
    objc_msgSend(v34, "appendString:", CFSTR("----FPS Report Legend:-----\nRaw Instantaneous FPS:\n    30FPS delimiter:    '|'\n    10FPS delimiter:    '+'\n    1FPS delimiter:     '-'\n\nDefer+Work Instantaneous FPS:                'X'\nWork Instantaneous FPS:                      '^'\nEqual Work and Defer+Work Instantaneous FPS: '*'\n"));

    objc_msgSend(v34, "appendString:", CFSTR("\n====Frame Rate Report:====\n\n"));
    *(_QWORD *)buf = 0;
    v86 = buf;
    v87 = 0x3032000000;
    v88 = __Block_byref_object_copy__8;
    v89 = __Block_byref_object_dispose__8;
    v90 = 0;
    v35 = *(NSObject **)(a1 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__SAWSUpdateDataStore__getWSUpdateArraySnapshot__block_invoke;
    block[3] = &unk_1E714A230;
    block[4] = a1;
    block[5] = buf;
    dispatch_sync(v35, block);
    v36 = *((id *)v86 + 5);
    _Block_object_dispose(buf, 8);

    if (v36 && objc_msgSend(v36, "count"))
    {
      v77 = v33;
      +[SAWSUpdateTimeToIndexMapping arrayOfMappingsFromWSUpdataDataArray:andSampleDataStore:](SAWSUpdateTimeToIndexMapping, "arrayOfMappingsFromWSUpdataDataArray:andSampleDataStore:", v36, v11);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v11;
      if (v37)
      {
        v38 = v34;
        objc_msgSend(v38, "printWithFormat:", CFSTR("%29s"), "Frame Length [SampleRange]");
        objc_msgSend(v38, "printWithFormat:", CFSTR("%29s"), "WS Wait Length [SampleRange]");
        objc_msgSend(v38, "printWithFormat:", CFSTR("%29s"), "Defer Length [SampleRange]");
        objc_msgSend(v38, "printWithFormat:", CFSTR("%29s"), "WS Work Length [SampleRange]");
        objc_msgSend(v38, "printWithFormat:", CFSTR("%16s\n"), "Frame Rate");

        if (!objc_msgSend(v36, "count"))
          goto LABEL_77;
        v39 = 0;
        v79 = a4 - a2;
        v81 = v37;
        v82 = v36;
        v80 = v28;
        while (1)
        {
          objc_msgSend(v36, "objectAtIndexedSubscript:", v39);
          v40 = (double *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectAtIndexedSubscript:", v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v41;
          if (v40)
          {
            if (v40[4] < v28)
              goto LABEL_66;
            v43 = v40[1];
          }
          else
          {
            v43 = 0.0;
            if (v28 > 0.0)
              goto LABEL_66;
          }
          if (v43 > v32)
          {

            goto LABEL_77;
          }
          v44 = v38;
          v45 = v40;
          v46 = v42;
          v83 = v46;
          if (v40)
          {
            v47 = v46;
            v48 = v32;
            v49 = v45[1];
            v50 = v45[2] - v49;
            if (v50 > 0.0333333333)
            {
              objc_msgSend(v44, "printWithFormat:", CFSTR("|\nWS Idle: %.2fms\n|\n"), v50 * 1000.0);
              v49 = v45[1];
            }
            objc_msgSend(v44, "printWithFormat:", CFSTR("%13.2f ms"), (v45[4] - v49) * 1000.0);
            objc_msgSend(v47, "printFrameIndexRangeToStream:withTranslationDelta:", v44, v79);
            objc_msgSend(v44, "printWithFormat:", CFSTR("%13.2f ms"), (v45[2] - v45[1]) * 1000.0);
            objc_msgSend(v47, "printWaitIndexRangeToStream:withTranslationDelta:", v44, v79);
            objc_msgSend(v44, "printWithFormat:", CFSTR("%13.2f ms"), (v45[3] - v45[2]) * 1000.0);
            objc_msgSend(v47, "printDeferIndexRangeToStream:withTranslationDelta:", v44, v79);
            objc_msgSend(v44, "printWithFormat:", CFSTR("%13.2f ms"), (v45[4] - v45[3]) * 1000.0);
            objc_msgSend(v47, "printWorkIndexRangeToStream:withTranslationDelta:", v44, v79);
            v51 = v44;
            v52 = v51;
            v53 = (v45[4] - v45[1]) * 1000.0;
            if (v53 == 0.0)
              v54 = 1000.0;
            else
              v54 = 1000.0 / v53;
            v55 = v45[3];
            v56 = v45[4] - v55;
            v57 = 1.0 / (v56 + v55 - v45[2]);
            if (v57 <= 60.0)
              v58 = v57;
            else
              v58 = 60.0;
            v59 = 1.0 / v56;
            if (v59 <= 60.0)
              v60 = v59;
            else
              v60 = 60.0;
            objc_msgSend(v51, "printWithFormat:", CFSTR("%12.2f FPS"), *(_QWORD *)&v54);
            v61 = 0;
            v62 = rint(v58);
            v63 = rint(v60);
            v64 = rint(v54);
            v65 = 0.0;
            do
            {
              if (v63 == v65 && v62 == v65)
                v67 = CFSTR("*");
              else
                v67 = CFSTR("X");
              if (v62 == v65)
                v68 = v67;
              else
                v68 = CFSTR("^");
              if (v62 != v65 && v63 != v65)
              {
                if (v64 < v65)
                {
                  v68 = CFSTR(" ");
                }
                else
                {
                  HIDWORD(v71) = -286331153 * v61;
                  LODWORD(v71) = HIDWORD(v71);
                  v70 = v71 >> 1;
                  HIDWORD(v71) = -858993459 * v61;
                  LODWORD(v71) = HIDWORD(v71);
                  v72 = CFSTR("-");
                  if ((v71 >> 1) < 0x1999999A)
                    v72 = CFSTR("+");
                  if (v70 < 0x8888889)
                    v72 = CFSTR("|");
                  if (v45[2] - v45[1] <= 0.0333333333)
                    v68 = v72;
                  else
                    v68 = CFSTR(" ");
                }
              }
              objc_msgSend(v52, "appendString:", v68);
              v65 = v65 + 1.0;
              ++v61;
            }
            while (v61 != 61);

            objc_msgSend(v52, "appendString:", CFSTR("\n"));
            v32 = v48;
            v28 = v80;
          }
          else
          {
            v73 = *__error();
            _sa_logt();
            v74 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1B9BE0000, v74, OS_LOG_TYPE_DEFAULT, "WARNING: Missing data on current update", buf, 2u);
            }

            *__error() = v73;
          }

          v37 = v81;
          v36 = v82;
LABEL_66:

          if (++v39 >= (unint64_t)objc_msgSend(v36, "count"))
            goto LABEL_77;
        }
      }
      v75 = *__error();
      _sa_logt();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B9BE0000, v76, OS_LOG_TYPE_DEFAULT, "WARNING: Invalid index mapping array. Bailing...", buf, 2u);
      }

      *__error() = v75;
LABEL_77:

      v11 = v78;
      v33 = v77;
    }
    else
    {
      objc_msgSend(v34, "appendString:", CFSTR("No WS Updates\n"));
    }

    objc_autoreleasePoolPop(v33);
  }
LABEL_79:

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SAWSUpdateDataStore;
  -[SAWSUpdateDataStore dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wsUpdateCallbackQueue, 0);
  objc_storeStrong((id *)&self->_wsUpdateArray, 0);
}

+ (id)classDictionaryKey
{
  return CFSTR("PAWSUpdateDataStore");
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  NSMutableArray *wsUpdateArray;

  wsUpdateArray = self->_wsUpdateArray;
  if (wsUpdateArray)
    return 8 * -[NSMutableArray count](wsUpdateArray, "count") + 16;
  else
    return 16;
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  NSMutableArray *wsUpdateArray;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SAWSUpdateDataStore classDictionaryKey](SAWSUpdateDataStore, "classDictionaryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SASerializableAddInstanceToSerializationDictionaryWithClassKey(v4, self, v5);

  if (v6)
  {
    wsUpdateArray = self->_wsUpdateArray;
    if (wsUpdateArray)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v8 = wsUpdateArray;
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v14;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v14 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "addSelfToSerializationDictionary:", v4, (_QWORD)v13);
          }
          while (v10 != v12);
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v10);
      }

    }
  }

}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v8;
  NSMutableArray *wsUpdateArray;
  char v10;
  int v12;
  NSObject *v13;
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SAWSUpdateDataStore sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion") != a4)
  {
    v12 = *__error();
    _sa_logt();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[SAWSUpdateDataStore debugDescription](self, "debugDescription");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315650;
      v26 = objc_msgSend(v14, "UTF8String");
      v27 = 2048;
      v28 = -[SAWSUpdateDataStore sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
      v29 = 2048;
      v30 = a4;
      _os_log_error_impl(&dword_1B9BE0000, v13, OS_LOG_TYPE_ERROR, "%s: size %lu != buffer length %lu", buf, 0x20u);

    }
    *__error() = v12;
    -[SAWSUpdateDataStore debugDescription](self, "debugDescription");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = objc_msgSend(v15, "UTF8String");
    -[SAWSUpdateDataStore sizeInBytesForSerializedVersion](self, "sizeInBytesForSerializedVersion");
    _SASetCrashLogMessage(897, "%s: size %lu != buffer length %lu", v17, v18, v19, v20, v21, v22, v16);

    _os_crash();
    __break(1u);
    goto LABEL_12;
  }
  if (!a3)
  {
LABEL_12:
    v23 = CFSTR("Trying to serialize to a NULL location");
    goto LABEL_14;
  }
  if (!v8)
  {
    v23 = CFSTR("No serialization dictionary provided");
LABEL_14:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), v23, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
  *(_QWORD *)a3 = 840627559;
  *((_QWORD *)a3 + 1) = -[NSMutableArray count](self->_wsUpdateArray, "count");
  wsUpdateArray = self->_wsUpdateArray;
  if (wsUpdateArray && -[NSMutableArray count](wsUpdateArray, "count"))
    v10 = SASerializableFillSerializedIndicesWithCollectionOfSerializableInstances((char *)a3 + 16, *((_QWORD *)a3 + 1), self->_wsUpdateArray, v8);
  else
    v10 = 1;

  return v10;
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  const __CFString *v5;
  id v6;

  if (!a3)
  {
    v5 = CFSTR("NULL buffer");
    goto LABEL_6;
  }
  if (*(_QWORD *)a3 != 840627559)
  {
    v5 = CFSTR("Bad SASerializedWSUpdateDataStore magic");
LABEL_6:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v5, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return objc_alloc_init(SAWSUpdateDataStore);
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *wsUpdateArray;
  const __CFString *v15;
  id v16;
  id v17;

  v17 = a5;
  v9 = a6;
  if (!a3)
  {
    v15 = CFSTR("NULL buffer");
    goto LABEL_8;
  }
  if (*(_QWORD *)a3 != 840627559)
  {
    v15 = CFSTR("Bad SASerializedWSUpdateDataStore magic");
LABEL_8:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v15, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  v10 = v9;
  v11 = *((_QWORD *)a3 + 1);
  if (v11)
  {
    v12 = (void *)objc_opt_class();
    SASerializableNewMutableArrayFromIndexList((uint64_t)a3 + 16, v11, v17, v10, v12);
    v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    wsUpdateArray = self->_wsUpdateArray;
    self->_wsUpdateArray = v13;

  }
}

@end
