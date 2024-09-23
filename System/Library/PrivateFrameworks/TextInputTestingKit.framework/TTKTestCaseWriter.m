@implementation TTKTestCaseWriter

+ (id)storeToFile:(id)a3 inputMode:(id)a4 layouts:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[TTKFileSink init:inputMode:layouts:]([TTKFileSink alloc], "init:inputMode:layouts:", v9, v8, v7);

  return v10;
}

+ (id)storeToDir:(id)a3 inputMode:(id)a4 layouts:(id)a5 writeOnFlush:(BOOL)a6 maxTestCasesPerFile:(unsigned int)a7 maxFilesPerDirectory:(unsigned int)a8
{
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  id v13;
  id v14;
  id v15;
  id v16;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v10 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[TTKDirSink init:inputMode:layouts:writeOnFlush:maxTestCasesPerFile:maxFilesPerDirectory:]([TTKDirSink alloc], "init:inputMode:layouts:writeOnFlush:maxTestCasesPerFile:maxFilesPerDirectory:", v15, v14, v13, v10, v9, v8);

  return v16;
}

@end
