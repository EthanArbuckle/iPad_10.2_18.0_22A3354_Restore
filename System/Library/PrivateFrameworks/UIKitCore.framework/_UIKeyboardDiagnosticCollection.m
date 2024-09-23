@implementation _UIKeyboardDiagnosticCollection

+ (double)_matDurationToSeconds:(unint64_t)a3
{
  if (qword_1ECD7C960 != -1)
    dispatch_once(&qword_1ECD7C960, &__block_literal_global_6);
  return *(double *)&qword_1ECD7C968 * (double)a3;
}

+ (BOOL)_processIsEntitledForDiagnosticCollection
{
  if (qword_1ECD7C970 != -1)
    dispatch_once(&qword_1ECD7C970, &__block_literal_global_6);
  return _MergedGlobals_927;
}

+ (id)_diagnosticQueue
{
  if (qword_1ECD7C980 != -1)
    dispatch_once(&qword_1ECD7C980, &__block_literal_global_9);
  return (id)qword_1ECD7C978;
}

+ (void)_requestTailspinWithDescription:(id)a3 startMAT:(unint64_t)a4 endMAT:(unint64_t)a5 ifExceedsThresholdSec:(double)a6
{
  id v9;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (MEMORY[0x1E0D1D238])
  {
    if (+[_UIKeyboardDiagnosticCollection _processIsEntitledForDiagnosticCollection](_UIKeyboardDiagnosticCollection, "_processIsEntitledForDiagnosticCollection"))
    {
      +[_UIKeyboardDiagnosticCollection _matDurationToSeconds:](_UIKeyboardDiagnosticCollection, "_matDurationToSeconds:", a5 - a4);
      if (v10 > a6)
      {
        v11 = v10;
        _UIKeyboardLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v20 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
          v21 = 2048;
          v22 = v11;
          v23 = 2048;
          v24 = a6;
          _os_log_error_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "%s took %f which exceeded the threshold of %f. Attempting to save tailspin using DiagnosticPipeline.", buf, 0x20u);
        }

        +[_UIKeyboardDiagnosticCollection _diagnosticQueue](_UIKeyboardDiagnosticCollection, "_diagnosticQueue");
        v13 = objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __105___UIKeyboardDiagnosticCollection__requestTailspinWithDescription_startMAT_endMAT_ifExceedsThresholdSec___block_invoke;
        v14[3] = &unk_1E16B1E18;
        v16 = v11;
        v17 = a4;
        v18 = a5;
        v15 = v9;
        dispatch_async(v13, v14);

      }
    }
  }

}

@end
