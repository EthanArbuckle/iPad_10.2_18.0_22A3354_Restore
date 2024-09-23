@implementation FPOutputFormatterPerfdata

- (void)startAtTime:(id)a3
{
  objc_storeStrong((id *)&self->_startTime, a3);
}

- (void)printProcessHeader:(id)a3
{
  pdwriter_new_group(self->_writer, a2, a3);
}

- (void)printProcessTotal:(id)a3 forProcess:(id)a4
{
  pdwriter *writer;
  uint64_t v7;
  id v8;
  pdwriter *v9;
  id v10;
  pdwriter *v11;
  id v12;
  char __str[11];

  writer = self->_writer;
  v7 = pdunit_B;
  v8 = a4;
  pdwriter_new_value(writer, "total_memory", v7, (double)(unint64_t)objc_msgSend(a3, "unsignedLongLongValue"));
  v9 = self->_writer;
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name")));
  pdwriter_record_variable_str(v9, "process", objc_msgSend(v10, "UTF8String"));

  v11 = self->_writer;
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name")));
  pdwriter_record_variable_str(v11, "procname", objc_msgSend(v12, "UTF8String"));

  LODWORD(v11) = objc_msgSend(v8, "pid");
  snprintf(__str, 0xBuLL, "%d", (_DWORD)v11);
  pdwriter_record_label_str(self->_writer, "pid", __str);
  pdwriter_record_tag(self->_writer, pdtag_summary);
}

- (void)printProcessCategories:(id)a3 total:(id *)a4 forProcess:(id)a5
{
  NSMutableDictionary *v6;
  NSMutableDictionary *currentProcessTotals;
  NSMutableDictionary *v8;
  NSMutableDictionary *currentProcessAuxDatas;
  id v10;

  v10 = a3;
  v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  currentProcessTotals = self->_currentProcessTotals;
  self->_currentProcessTotals = v6;

  v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  currentProcessAuxDatas = self->_currentProcessAuxDatas;
  self->_currentProcessAuxDatas = v8;

  sub_1000196B4((uint64_t)self, v10);
}

- (void)printSharedCategories:(id)a3 sharedWith:(id)a4 forProcess:(id)a5 hasProcessView:(BOOL)a6 total:(id *)a7
{
  sub_1000196B4((uint64_t)self, a3);
}

- (void)printSharedCache:(id)a3 categories:(id)a4 sharedWith:(id)a5 total:(id *)a6
{
  -[FPOutputFormatterPerfdata printSharedCategories:sharedWith:forProcess:hasProcessView:total:](self, "printSharedCategories:sharedWith:forProcess:hasProcessView:total:", a4, a5, 0, 0, a6);
}

- (void)printProcessAuxData:(id)a3 forProcess:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void **v15;
  pdwriter *writer;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSMutableDictionary *currentProcessTotals;
  NSMutableDictionary *currentProcessAuxDatas;
  id v24;
  NSMutableDictionary *obj;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v24 = a3;
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "name")));
  v7 = objc_msgSend(v6, "UTF8String");

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_currentProcessTotals;
  v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v26 = *(_QWORD *)v28;
    v10 = pdunit_B;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v26)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_currentProcessTotals, "objectForKeyedSubscript:", v12));
        v14 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_currentProcessAuxDatas, "objectForKeyedSubscript:", v12));
        v15 = (void **)v14;
        writer = self->_writer;
        if (v14)
          v17 = *(void **)(v14 + 16);
        else
          v17 = 0;
        if (v17)
          v18 = v17;
        else
          v18 = v12;
        v19 = objc_retainAutorelease(v18);
        v20 = v17;
        pdwriter_new_value(writer, objc_msgSend(v19, "UTF8String"), v10, (double)(unint64_t)objc_msgSend(v13, "unsignedLongLongValue"));

        pdwriter_record_variable_str(self->_writer, "process", v7);
        pdwriter_record_variable_str(self->_writer, "procname", v7);
        if (v15)
          sub_100019B50((uint64_t)self, v15[1], 0);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v9 = v21;
    }
    while (v21);
  }

  currentProcessTotals = self->_currentProcessTotals;
  self->_currentProcessTotals = 0;

  currentProcessAuxDatas = self->_currentProcessAuxDatas;
  self->_currentProcessAuxDatas = 0;

  sub_100019D20((uint64_t)self, v24, "aux_data", (uint64_t)v7);
}

- (void)printSummaryCategories:(id)a3 total:(id *)a4 hadErrors:(BOOL)a5
{
  void *v5;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *i;
  id *v12;
  id *v13;
  void *v14;
  id v15;
  void *v16;
  pdwriter *writer;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v8 = a3;
  pdwriter_new_group(self->_writer, v9, v10);
  v22 = pdunit_B;
  pdwriter_new_value(self->_writer, "total_memory", pdunit_B, (double)(a4->var1 + a4->var0));
  pdwriter_record_variable_str(self->_writer, "process", "ALL_PROCESSES");
  pdwriter_record_variable_str(self->_writer, "procname", "ALL_PROCESSES");
  pdwriter_record_tag(self->_writer, pdtag_summary);
  if (v8)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v8;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (!v23)
      goto LABEL_18;
    v21 = *(_QWORD *)v26;
    while (1)
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(obj);
        v12 = (id *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i)));
        v13 = sub_10001D9B4(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (v14)
        {
          v15 = sub_10001DA3C((uint64_t)v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
          writer = self->_writer;
          if (v16)
          {
            v18 = v16;
            v19 = 0;
            goto LABEL_12;
          }
        }
        else
        {
          writer = self->_writer;
        }
        v20 = sub_10001D980((uint64_t)v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v20);
        v5 = v16;
        v18 = 0;
        v19 = 1;
LABEL_12:
        pdwriter_new_value(writer, objc_msgSend(objc_retainAutorelease(v16), "UTF8String"), v22, (double)((unint64_t)objc_msgSend(v12, "totalDirtySize")+ (unint64_t)objc_msgSend(v12, "totalSwappedSize")));
        if (v19)

        pdwriter_record_variable_str(self->_writer, "process", "ALL_PROCESSES");
        pdwriter_record_variable_str(self->_writer, "procname", "ALL_PROCESSES");
        if (v14)
          sub_100019B50((uint64_t)self, v14, 0);

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (!v23)
      {
LABEL_18:

        break;
      }
    }
  }

}

- (void)printGlobalAuxData:(id)a3
{
  sub_100019D20((uint64_t)self, a3, "aux_data", (uint64_t)"ALL_PROCESSES");
}

- (void)endAtTime:(id)a3
{
  pdwriter *writer;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  writer = self->_writer;
  v5 = pdunit_ms;
  v6 = sub_10001935C((unint64_t)a3);
  v7 = sub_10001935C((unint64_t)self->_startTime);
  pdwriter_new_value(writer, "gather_duration", v5, (double)((v6 - v7) / 0xF4240));
  pdwriter_record_tag(self->_writer, pdtag_context);
}

- (void)close
{
  pdwriter_close(self->_writer, a2);
  self->_writer = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_currentProcessAuxDatas, 0);
  objc_storeStrong((id *)&self->_currentProcessTotals, 0);
}

@end
