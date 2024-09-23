@implementation SAPAStyleSample

+ (id)classDictionaryKey
{
  return CFSTR("PASample");
}

- (BOOL)addSelfToBuffer:(void *)a3 bufferLength:(unint64_t)a4 withCompletedSerializationDictionary:(id)a5
{
  id v5;
  id v6;

  v5 = a5;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleSample"), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)addSelfToSerializationDictionary:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleSample"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (unint64_t)sizeInBytesForSerializedVersion
{
  id v2;

  +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Encoding failure"), CFSTR("Trying to encode SAPAStyleSample"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)newInstanceWithoutReferencesFromSerializedBuffer:(const void *)a3 bufferLength:(unint64_t)a4
{
  SAPAStyleSample *v5;
  SAPAStyleSample *v6;
  uint64_t v7;
  SATimestamp *timestamp;
  const __CFString *v10;
  id v11;

  if (!a3)
  {
    v10 = CFSTR("NULL buffer");
    goto LABEL_8;
  }
  if (*(_QWORD *)a3 != 2171757396)
  {
    v10 = CFSTR("Bad SASample magic");
    goto LABEL_8;
  }
  v5 = objc_alloc_init(SAPAStyleSample);
  if (!v5)
  {
    v10 = CFSTR("Could not create new sample from buffer");
LABEL_8:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  v6 = v5;
  +[SATimestamp timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:](SATimestamp, "timestampWithMachAbsTime:machAbsTimeSec:machContTime:machContTimeSec:wallTime:", 0, 0, *((double *)a3 + 1), 0.0, *((double *)a3 + 2));
  v7 = objc_claimAutoreleasedReturnValue();
  timestamp = v6->_timestamp;
  v6->_timestamp = (SATimestamp *)v7;

  return v6;
}

- (void)populateReferencesUsingBuffer:(const void *)a3 bufferLength:(unint64_t)a4 andDeserializationDictionary:(id)a5 andDataBufferDictionary:(id)a6
{
  id v9;
  id v10;
  void *v11;
  char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id Property;
  SEL v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  const __CFString *v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  if (!a3)
  {
    v31 = CFSTR("Passed NULL buffer");
    goto LABEL_24;
  }
  if (*(_QWORD *)a3 != 2171757396)
  {
    v31 = CFSTR("Bad SASample magic");
LABEL_24:
    +[SAException exceptionWithName:reason:userInfo:](SAException, "exceptionWithName:reason:userInfo:", CFSTR("Decoding failure"), v31, 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v32);
  }
  v11 = v10;
  v12 = (char *)a3 + 32;
  v13 = *((_QWORD *)a3 + 3);
  v14 = (void *)objc_opt_class();
  v33 = v9;
  SASerializableNewMutableArrayFromIndexList((uint64_t)v12, v13, v9, v11, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v39;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v39 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v20);
        if (v21)
        {
          Property = objc_getProperty(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v20), v17, 8, 1);
          -[SATaskState applyPAStyleSampleTimestamp:]((uint64_t)Property, self->_timestamp);
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v24 = objc_getProperty(v21, v23, 16, 1);
        }
        else
        {

          v24 = 0;
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
        }
        v25 = v24;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v35 != v28)
                objc_enumerationMutation(v25);
              -[SAThreadState applyPAStyleSampleTimestamp:](*(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i), self->_timestamp);
            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          }
          while (v27);
        }

        ++v20;
      }
      while (v20 != v18);
      v30 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      v18 = v30;
    }
    while (v30);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
