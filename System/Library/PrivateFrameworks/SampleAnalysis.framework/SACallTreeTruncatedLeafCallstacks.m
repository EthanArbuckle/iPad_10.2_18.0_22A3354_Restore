@implementation SACallTreeTruncatedLeafCallstacks

- (BOOL)isTruncatedLeafCallstack
{
  return 1;
}

+ (id)callTreeFrameWithFrame:(id)a3 startSampleIndex:(unint64_t)a4 sampleCount:(unint64_t)a5 isLeafFrame:(BOOL)a6
{
  id v6;
  int v7;
  NSObject *v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id result;
  uint8_t buf[4];
  uint64_t v20;

  v6 = a3;
  v7 = *__error();
  _sa_logt();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "debugDescription");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315138;
    v20 = objc_msgSend(v9, "UTF8String");
    _os_log_error_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_ERROR, "SACallTreeTruncatedLeafCallstacks using wrong creator for %s", buf, 0xCu);

  }
  *__error() = v7;
  objc_msgSend(v6, "debugDescription");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v10, "UTF8String");
  _SASetCrashLogMessage(327, "SACallTreeTruncatedLeafCallstacks using wrong creator for %s", v12, v13, v14, v15, v16, v17, v11);

  result = (id)_os_crash();
  __break(1u);
  return result;
}

- (SACallTreeTruncatedLeafCallstacks)initWithFrame:(id)a3 startSampleIndex:(unint64_t)a4 sampleCount:(unint64_t)a5 otherCallTreeDescription:(id)a6
{
  id v11;
  SACallTreeTruncatedLeafCallstacks *v12;
  SACallTreeTruncatedLeafCallstacks *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)SACallTreeTruncatedLeafCallstacks;
  v12 = -[SACallTreeFrame initWithFrame:startSampleIndex:sampleCount:isLeafFrame:](&v15, sel_initWithFrame_startSampleIndex_sampleCount_isLeafFrame_, a3, a4, a5, 1);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_otherCallTreeDescription, a6);

  return v13;
}

+ (id)callTreeFrameWithFrame:(uint64_t)a3 startSampleIndex:(uint64_t)a4 sampleCount:(void *)a5 otherCallTreeDescription:
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a2;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_self()), "initWithFrame:startSampleIndex:sampleCount:otherCallTreeDescription:", v9, a3, a4, v8);

  return v10;
}

- (void)writeJSONDictionaryEntriesToStream:(id)a3
{
  NSString *otherCallTreeDescription;
  id v5;
  id v6;

  otherCallTreeDescription = self->_otherCallTreeDescription;
  v5 = a3;
  SAJSONWriteDictionaryFirstEntry(v5, (uint64_t)CFSTR("otherCallTree"), otherCallTreeDescription);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SACallTreeNode sampleCount](self, "sampleCount"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  SAJSONWriteDictionaryEntry(v5, CFSTR("count"), v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherCallTreeDescription, 0);
}

@end
