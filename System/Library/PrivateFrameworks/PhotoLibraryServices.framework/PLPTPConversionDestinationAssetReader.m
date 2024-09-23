@implementation PLPTPConversionDestinationAssetReader

- (PLPTPConversionDestinationAssetReader)initWithDestination:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  PLPTPConversionDestinationAssetReader *v9;
  PLPTPConversionDestinationAssetReader *v10;
  void *v12;
  objc_super v13;

  v6 = a3;
  objc_msgSend(v6, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPdFormatConversionManager.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PLPTPConversionDestinationAssetReader;
  v9 = -[PLPTPAssetReader initWithPath:](&v13, sel_initWithPath_, v8);
  v10 = v9;
  if (v9)
    objc_storeStrong((id *)&v9->_destination, a3);

  return v10;
}

- (id)dataSourcePathForDataRange:(_NSRange)a3 error:(id *)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  __uint64_t v12;
  void *v13;
  int v14;
  id v15;
  __uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  _WORD v27[17];
  NSRange v28;
  NSRange v29;

  length = a3.length;
  location = a3.location;
  *(_QWORD *)&v27[13] = *MEMORY[0x1E0C80C00];
  -[PLPTPConversionDestinationAssetReader destination](self, "destination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "usesSinglePassVideoConversion");

  if (!v9)
    goto LABEL_8;
  PLPTPGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v28.location = location;
    v28.length = length;
    NSStringFromRange(v28);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v11;
    v26 = 2048;
    *(_QWORD *)v27 = location + length;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Begin wait for data availability of range %@ (= file size %lu)", buf, 0x16u);

  }
  v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  -[PLPTPConversionDestinationAssetReader destination](self, "destination");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v14 = objc_msgSend(v13, "waitForAvailabilityOfRange:timeout:error:", location, length, dispatch_time(0, 10000000000), &v23);
  v15 = v23;

  v16 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  PLPTPGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v29.location = location;
    v29.length = length;
    NSStringFromRange(v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = v18;
    v26 = 1024;
    *(_DWORD *)v27 = v14;
    v27[2] = 2048;
    *(double *)&v27[3] = (double)(v16 - v12) / 1000000000.0;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "End wait for data availability of range %@: %d (%.3fs)", buf, 0x1Cu);

  }
  if ((v14 & 1) != 0)
  {

LABEL_8:
    -[PLPTPConversionDestinationAssetReader destination](self, "destination");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fileURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  PLPTPGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v15;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Wait for data availability failed %@", buf, 0xCu);
  }

  if (a4)
  {
    v15 = objc_retainAutorelease(v15);
    v20 = 0;
    *a4 = v15;
  }
  else
  {
    v20 = 0;
  }
LABEL_9:

  return v20;
}

- (id)path
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  -[PLPTPConversionDestinationAssetReader destination](self, "destination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "usesSinglePassVideoConversion");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPdFormatConversionManager.m"), 77, CFSTR("Call to method %@ is incompatible with a wrapped single pass video conversion destination"), v11);

  }
  -[PLPTPConversionDestinationAssetReader destination](self, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PHMediaFormatConversionDestination)destination
{
  return (PHMediaFormatConversionDestination *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDestination:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
}

@end
