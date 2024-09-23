@implementation APOdmlBiomeStream

- (APOdmlBiomeStream)initWithName:(id)a3
{
  id v5;
  APOdmlBiomeStream *v6;
  const char *v7;
  uint64_t v8;
  APOdmlBiomeStream *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  BMStoreConfig *config;
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  BMStoreStream *stream;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)APOdmlBiomeStream;
  v6 = -[APOdmlBiomeStream init](&v27, sel_init);
  v9 = v6;
  if (v6)
  {
    objc_msgSend__applicationSupportDirectory(v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(v10, v11, (uint64_t)CFSTR("odml_biome"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend_newPrivateStreamDefaultConfigurationWithStoreBasePath_(MEMORY[0x1E0D024C0], v13, (uint64_t)v12);
    config = v9->_config;
    v9->_config = (BMStoreConfig *)v14;

    objc_storeStrong((id *)&v9->_streamName, a3);
    v16 = objc_alloc(MEMORY[0x1E0D02790]);
    objc_msgSend_streamName(v9, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_config(v9, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend_initWithPrivateStreamIdentifier_storeConfig_(v16, v23, (uint64_t)v19, v22);
    stream = v9->_stream;
    v9->_stream = (BMStoreStream *)v24;

  }
  return v9;
}

- (void)enumerateEventsWithDictionary:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1B69DEF18;
  v7[3] = &unk_1E6A293F0;
  v8 = v4;
  v5 = v4;
  objc_msgSend_enumerateEvents_(self, v6, (uint64_t)v7);

}

- (void)filterEventsWithDictionary:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v11 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1B69DF028;
  v12[3] = &unk_1E6A29418;
  v13 = v6;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B69DF070;
  v10[3] = &unk_1E6A293F0;
  v7 = v11;
  v8 = v6;
  objc_msgSend_filterEvents_result_(self, v9, (uint64_t)v12, v10);

}

- (void)enumerateEvents:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v4 = a3;
  objc_msgSend_publisher(self, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_enumerateEvents_result_(self, v7, (uint64_t)v8, v4);

}

- (void)filterEvents:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;
  const char *v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend_publisher(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1B69DF1E0;
  v15[3] = &unk_1E6A29440;
  v16 = v6;
  v11 = v6;
  objc_msgSend_filterWithIsIncluded_(v10, v12, (uint64_t)v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_enumerateEvents_result_(self, v14, (uint64_t)v13, v7);
}

- (void)removeAllEvents
{
  objc_msgSend_removeEvents_(self, a2, (uint64_t)&unk_1E6A29480);
}

- (void)removeEventsWithDictionary:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1B69DF2B4;
  v7[3] = &unk_1E6A294A8;
  v8 = v4;
  v5 = v4;
  objc_msgSend_removeEvents_(self, v6, (uint64_t)v7);

}

- (void)removeEvents:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend_stream(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B69DF39C;
  v10[3] = &unk_1E6A294D0;
  v11 = v4;
  v9 = v4;
  objc_msgSend_pruneWithPredicateBlock_(v7, v8, (uint64_t)v10);

}

- (void)writeEvent:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;

  v4 = a3;
  objc_msgSend_stream(self, v5, v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_source(v11, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendEvent_(v9, v10, (uint64_t)v4);

}

- (void)enumerateEvents:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[5];
  _QWORD v15[3];
  char v16;

  v6 = a3;
  v7 = a4;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1B69DF548;
  v14[3] = &unk_1E6A294F8;
  v14[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1B69DF6B0;
  v11[3] = &unk_1E6A29520;
  v8 = v7;
  v12 = v8;
  v13 = v15;
  v10 = (id)objc_msgSend_sinkWithCompletion_shouldContinue_(v6, v9, (uint64_t)v14, v11);

  _Block_object_dispose(v15, 8);
}

- (id)publisher
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  void *v36;

  objc_msgSend_startDate(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_startDate(self, v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v8, v9, v10);
    objc_msgSend_numberWithDouble_(v7, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  objc_msgSend_endDate(self, v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend_endDate(self, v16, v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceReferenceDate(v20, v21, v22);
    objc_msgSend_numberWithDouble_(v19, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = 0;
  }

  objc_msgSend_stream(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_maxEvents(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_reverse(self, v32, v33);
  objc_msgSend_publisherWithStartTime_endTime_maxEvents_lastN_reversed_(v28, v35, (uint64_t)v13, v25, v31, 0, v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

- (id)_applicationSupportDirectory
{
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  char v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByAppendingPathComponent_(v7, v8, (uint64_t)CFSTR("com.apple.ap.promotedcontentd"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v11 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v3, v10, (uint64_t)v9, 1, 0, &v27);
  v12 = v27;
  if ((v11 & 1) != 0)
  {
    v13 = v9;
  }
  else
  {
    OdmlLogForCategory(0xCuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)objc_opt_class();
      v16 = v15;
      v19 = objc_msgSend_code(v12, v17, v18);
      objc_msgSend_localizedFailureReason(v12, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_userInfo(v12, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478851;
      v29 = v15;
      v30 = 2048;
      v31 = v19;
      v32 = 2113;
      v33 = v9;
      v34 = 2113;
      v35 = v22;
      v36 = 2113;
      v37 = v25;
      _os_log_impl(&dword_1B69D6000, v14, OS_LOG_TYPE_ERROR, "[%{private}@] Error %ld creating 'Application Support' subdirectory '%{private}@': %{private}@ %{private}@", buf, 0x34u);

    }
    v13 = 0;
  }

  return v13;
}

- (NSString)streamName
{
  return self->_streamName;
}

- (void)setStreamName:(id)a3
{
  objc_storeStrong((id *)&self->_streamName, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSNumber)maxEvents
{
  return self->_maxEvents;
}

- (void)setMaxEvents:(id)a3
{
  objc_storeStrong((id *)&self->_maxEvents, a3);
}

- (BOOL)reverse
{
  return self->_reverse;
}

- (void)setReverse:(BOOL)a3
{
  self->_reverse = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (BMStoreConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (BMStoreStream)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
  objc_storeStrong((id *)&self->_stream, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_maxEvents, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
}

@end
