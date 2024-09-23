@implementation _PXSimulatedDelayedMediaRequest

- (_PXSimulatedDelayedMediaRequest)initWithWrappedMediaRequest:(id)a3 delay:(double)a4
{
  _PXSimulatedDelayedMediaRequest *result;

  result = -[_PXSimulatedMediaRequest initWithWrappedMediaRequest:](self, "initWithWrappedMediaRequest:", a3);
  if (result)
    result->_delay = a4;
  return result;
}

- (void)handleOriginalProgress:(double)a3 error:(id)a4 stop:(BOOL *)a5 info:(id)a6
{
  id v10;
  id v11;
  _PXSimulatedDelayedMediaRequest *v12;
  objc_super v13;

  v10 = a4;
  v11 = a6;
  v12 = self;
  objc_sync_enter(v12);
  v12->_originalProgress = a3;
  -[_PXSimulatedDelayedMediaRequest _simulatedProgressForProgress:](v12, "_simulatedProgressForProgress:", a3);
  v13.receiver = v12;
  v13.super_class = (Class)_PXSimulatedDelayedMediaRequest;
  -[_PXSimulatedMediaRequest handleOriginalProgress:error:stop:info:](&v13, sel_handleOriginalProgress_error_stop_info_, v10, a5, v11);
  objc_sync_exit(v12);

}

- (double)_simulatedProgressForProgress:(double)a3
{
  double v4;

  PXFloatDenormalize();
  return v4 * a3;
}

- (void)handleOriginalResult:(id)a3 info:(id)a4
{
  id v7;
  id v8;
  _PXSimulatedDelayedMediaRequest *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void (**v13)(double);
  dispatch_time_t v14;
  _QWORD v15[5];
  _QWORD aBlock[5];
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C48]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
  {
    v17.receiver = v9;
    v17.super_class = (Class)_PXSimulatedDelayedMediaRequest;
    -[_PXSimulatedMediaRequest handleOriginalResult:info:](&v17, sel_handleOriginalResult_info_, v7, v8);
  }
  else
  {
    objc_storeStrong(&v9->_lastOriginalResult, a3);
    objc_storeStrong((id *)&v9->_lastOriginalInfo, a4);
    if (!v9->_didScheduleFinalCallback)
    {
      v12 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __61___PXSimulatedDelayedMediaRequest_handleOriginalResult_info___block_invoke;
      aBlock[3] = &unk_1E513C588;
      aBlock[4] = v9;
      v13 = (void (**)(double))_Block_copy(aBlock);
      v13[2](0.25);
      ((void (*)(void (**)(double), double))v13[2])(v13, 0.5);
      ((void (*)(void (**)(double), double))v13[2])(v13, 0.75);
      v14 = dispatch_time(0, (uint64_t)(v9->_delay * 1000000000.0));
      v15[0] = v12;
      v15[1] = 3221225472;
      v15[2] = __61___PXSimulatedDelayedMediaRequest_handleOriginalResult_info___block_invoke_3;
      v15[3] = &unk_1E5149198;
      v15[4] = v9;
      dispatch_after(v14, MEMORY[0x1E0C80D38], v15);
      v9->_didScheduleFinalCallback = 1;

    }
  }
  objc_sync_exit(v9);

}

- (void)_handleDelayFraction:(double)a3
{
  _PXSimulatedDelayedMediaRequest *v4;
  objc_super v5;
  char v6;

  v4 = self;
  objc_sync_enter(v4);
  v4->_delayFraction = a3;
  -[_PXSimulatedDelayedMediaRequest _simulatedProgressForProgress:](v4, "_simulatedProgressForProgress:", v4->_originalProgress);
  v6 = 0;
  v5.receiver = v4;
  v5.super_class = (Class)_PXSimulatedDelayedMediaRequest;
  -[_PXSimulatedMediaRequest handleOriginalProgress:error:stop:info:](&v5, sel_handleOriginalProgress_error_stop_info_, 0, &v6, 0);
  objc_sync_exit(v4);

}

- (void)_produceFinalCallback
{
  _PXSimulatedDelayedMediaRequest *v2;
  id lastOriginalResult;
  NSDictionary *lastOriginalInfo;
  objc_super v5;

  v2 = self;
  objc_sync_enter(v2);
  -[_PXSimulatedDelayedMediaRequest _handleDelayFraction:](v2, "_handleDelayFraction:", 1.0);
  lastOriginalResult = v2->_lastOriginalResult;
  lastOriginalInfo = v2->_lastOriginalInfo;
  v5.receiver = v2;
  v5.super_class = (Class)_PXSimulatedDelayedMediaRequest;
  -[_PXSimulatedMediaRequest handleOriginalResult:info:](&v5, sel_handleOriginalResult_info_, lastOriginalResult, lastOriginalInfo);
  objc_sync_exit(v2);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastOriginalInfo, 0);
  objc_storeStrong(&self->_lastOriginalResult, 0);
}

@end
