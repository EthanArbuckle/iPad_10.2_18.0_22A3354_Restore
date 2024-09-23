@implementation TKVibrationRecorderTouchSurfaceRecordedDataWrapper

- (TKVibrationRecorderTouchSurfaceRecordedDataWrapper)initWithVibrationPatternMaximumDuration:(double)a3
{
  TKVibrationRecorderTouchSurfaceRecordedDataWrapper *v4;
  TKVibrationRecorderTouchSurfaceRecordedDataWrapper *v5;
  double v6;
  void *v7;
  TKVibrationRecorderTouchSurfaceRecordedDataWrapper *v8;
  uint64_t v9;
  NSCopying *displayLinkManagerObserverToken;
  _QWORD v12[4];
  TKVibrationRecorderTouchSurfaceRecordedDataWrapper *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TKVibrationRecorderTouchSurfaceRecordedDataWrapper;
  v4 = -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_vibrationPatternMaximumDuration = a3;
    v4->_maximumFramesPerSecondRate = 60;
    v4->_isWarmUpModeEnabled = 1;
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v5->_warmUpModeDidStartTimestamp = v6;
    +[TKDisplayLinkManager currentDisplayLinkManager](TKDisplayLinkManager, "currentDisplayLinkManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __94__TKVibrationRecorderTouchSurfaceRecordedDataWrapper_initWithVibrationPatternMaximumDuration___block_invoke;
    v12[3] = &unk_24D380388;
    v8 = v5;
    v13 = v8;
    objc_msgSend(v7, "addObserverWithHandler:", v12);
    v9 = objc_claimAutoreleasedReturnValue();
    displayLinkManagerObserverToken = v8->_displayLinkManagerObserverToken;
    v8->_displayLinkManagerObserverToken = (NSCopying *)v9;

  }
  return v5;
}

uint64_t __94__TKVibrationRecorderTouchSurfaceRecordedDataWrapper_initWithVibrationPatternMaximumDuration___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateMaximumFramesPerSecondRate:", a2);
}

- (void)dealloc
{
  void *recordedData;
  objc_super v4;

  recordedData = self->_recordedData;
  if (recordedData)
    free(recordedData);
  v4.receiver = self;
  v4.super_class = (Class)TKVibrationRecorderTouchSurfaceRecordedDataWrapper;
  -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper dealloc](&v4, sel_dealloc);
}

- (void)_prepareRecordedDataBufferForStoringEnoughElementsForRecordingDuration:(double)a3
{
  size_t v4;
  void *recordedData;
  char *v6;

  v4 = vcvtpd_u64_f64((double)self->_maximumFramesPerSecondRate * a3);
  recordedData = self->_recordedData;
  if (recordedData)
  {
    if (self->_recordedDataElementsCount < v4)
    {
      v6 = (char *)malloc_type_realloc(recordedData, 32 * v4, 0x1000040CA85BC40uLL);
      self->_recordedData = v6;
      bzero(&v6[32 * self->_recordedDataElementsCount], 32 * (v4 - self->_recordedDataElementsCount));
      self->_recordedDataElementsCount = v4;
    }
  }
  else
  {
    self->_recordedData = malloc_type_calloc(v4, 0x20uLL, 0x1000040CA85BC40uLL);
    self->_recordedDataElementsCount = v4;
    self->_recordedDataCursor = 0;
  }
}

- (void)_recordFinalDataWithNormalizedTouchLocation:(CGPoint)a3 touchPhase:(int)a4 timeIntervalSinceBeginningOfPattern:(double)a5
{
  uint64_t v5;
  double y;
  double x;
  double maximumFramesPerSecondRate;
  unint64_t v10;
  unint64_t recordedDataElementsCount;
  char *v12;
  unint64_t recordedDataCursor;
  unint64_t *v14;
  unint64_t v15;
  double v17;

  v5 = *(_QWORD *)&a4;
  y = a3.y;
  x = a3.x;
  maximumFramesPerSecondRate = (double)self->_maximumFramesPerSecondRate;
  v10 = vcvtmd_u64_f64(maximumFramesPerSecondRate * a5);
  recordedDataElementsCount = self->_recordedDataElementsCount;
  if (recordedDataElementsCount <= v10)
  {
    v17 = (double)recordedDataElementsCount / maximumFramesPerSecondRate
        + (double)recordedDataElementsCount / maximumFramesPerSecondRate;
    if (v17 < a5)
      v17 = a5 + a5;
    -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper _prepareRecordedDataBufferForStoringEnoughElementsForRecordingDuration:](self, "_prepareRecordedDataBufferForStoringEnoughElementsForRecordingDuration:", v17);
    -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper _recordFinalDataWithNormalizedTouchLocation:touchPhase:timeIntervalSinceBeginningOfPattern:](self, "_recordFinalDataWithNormalizedTouchLocation:touchPhase:timeIntervalSinceBeginningOfPattern:", v5, x, y, a5);
  }
  else
  {
    v12 = (char *)self->_recordedData + 32 * v10;
    *(double *)v12 = x;
    *((_QWORD *)v12 + 1) = *(_QWORD *)&a3.y;
    *((_DWORD *)v12 + 4) = a4;
    *((_QWORD *)v12 + 3) = v10;
    if (v10)
    {
      recordedDataCursor = self->_recordedDataCursor;
      v14 = (unint64_t *)(v12 - 8);
      v15 = v10;
      do
      {
        if (*v14)
          break;
        *v14 = recordedDataCursor;
        v14 -= 4;
        --v15;
      }
      while (v15);
    }
    self->_recordedDataCursor = v10;
  }
}

- (void)recordNormalizedTouchLocation:(CGPoint)a3 touchPhase:(int)a4
{
  uint64_t v4;
  double y;
  double x;
  double v8;
  double v9;
  double vibrationPatternDidStartTimestamp;
  double v11;
  double v12;
  unint64_t v13;
  uint64_t *p_recordedDataCursor;
  unint64_t recordedDataCursor;
  uint64_t v16;
  unint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v4 = *(_QWORD *)&a4;
  y = a3.y;
  x = a3.x;
  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v9 = v8;
  vibrationPatternDidStartTimestamp = self->_vibrationPatternDidStartTimestamp;
  if (vibrationPatternDidStartTimestamp < 2.22044605e-16)
  {
    self->_vibrationPatternDidStartTimestamp = v9;
    vibrationPatternDidStartTimestamp = v9;
  }
  if (!self->_recordedData)
  {
    -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper _prepareRecordedDataBufferForStoringEnoughElementsForRecordingDuration:](self, "_prepareRecordedDataBufferForStoringEnoughElementsForRecordingDuration:", self->_vibrationPatternMaximumDuration * 1.2);
    vibrationPatternDidStartTimestamp = self->_vibrationPatternDidStartTimestamp;
  }
  v11 = v9 - vibrationPatternDidStartTimestamp;
  if (v11 >= 0.0)
    v12 = v11;
  else
    v12 = 0.0;
  if (self->_isWarmUpModeEnabled)
  {
    recordedDataCursor = self->_recordedDataCursor;
    p_recordedDataCursor = (uint64_t *)&self->_recordedDataCursor;
    v13 = recordedDataCursor;
    v16 = *(p_recordedDataCursor - 2);
    v17 = 32 * *(p_recordedDataCursor - 1) / 0x28uLL;
    if (recordedDataCursor >= v17)
    {
      TLLogGeneral();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);

      if (v19)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/ToneLibraryUI/Kit/Vibrations/Recorder/Touch-Surface/TKVibrationRecorderTouchSurfaceRecordedDataWrapper.m");
        v20 = objc_claimAutoreleasedReturnValue();
        TLLogGeneral();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject lastPathComponent](v20, "lastPathComponent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 136381443;
          v27 = "-[TKVibrationRecorderTouchSurfaceRecordedDataWrapper recordNormalizedTouchLocation:touchPhase:]";
          v28 = 2113;
          v29 = v22;
          v30 = 2049;
          v31 = 143;
          v32 = 2113;
          v33 = v23;
          _os_log_impl(&dword_2157C4000, v21, OS_LOG_TYPE_DEFAULT, "*** Assertion failure in %{private}s, %{private}@:%{private}lu.\n%{private}@", (uint8_t *)&v26, 0x2Au);

        }
      }
      else
      {
        TLLogGeneral();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper recordNormalizedTouchLocation:touchPhase:].cold.2(v20);
      }

      TLLogGeneral();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper recordNormalizedTouchLocation:touchPhase:].cold.1(p_recordedDataCursor, v24);

      v13 = *p_recordedDataCursor;
    }
    if (v13 < v17)
    {
      v25 = v16 + 40 * v13;
      *(double *)v25 = x;
      *(double *)(v25 + 8) = y;
      *(_DWORD *)(v25 + 16) = v4;
      *(_DWORD *)(v25 + 20) = 0;
      *(_QWORD *)(v25 + 24) = 0;
      *(double *)(v25 + 32) = v12;
      ++*p_recordedDataCursor;
    }
  }
  else
  {
    -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper _recordFinalDataWithNormalizedTouchLocation:touchPhase:timeIntervalSinceBeginningOfPattern:](self, "_recordFinalDataWithNormalizedTouchLocation:touchPhase:timeIntervalSinceBeginningOfPattern:", v4, x, y, v12);
  }
}

- (void)didStopRecording
{
  void *v3;
  NSCopying *displayLinkManagerObserverToken;

  if (self->_displayLinkManagerObserverToken)
  {
    +[TKDisplayLinkManager currentDisplayLinkManager](TKDisplayLinkManager, "currentDisplayLinkManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserverWithToken:", self->_displayLinkManagerObserverToken);

    displayLinkManagerObserverToken = self->_displayLinkManagerObserverToken;
    self->_displayLinkManagerObserverToken = 0;

  }
}

- (BOOL)getNormalizedTouchLocation:(CGPoint *)a3 touchPhase:(int *)a4 forTimeInterval:(double)a5
{
  unint64_t v5;
  unint64_t recordedDataCursor;
  _QWORD *recordedData;
  unint64_t v8;
  int v9;
  BOOL result;
  char *v11;
  CGPoint v12;

  v5 = vcvtmd_u64_f64((double)self->_maximumFramesPerSecondRate * a5);
  recordedDataCursor = self->_recordedDataCursor;
  if (recordedDataCursor < v5
    || (recordedData = self->_recordedData, v8 = recordedData[4 * v5 + 3], v8 > recordedDataCursor))
  {
    v9 = 0;
    result = 0;
    if (!a3)
      goto LABEL_5;
    goto LABEL_4;
  }
  v11 = (char *)&recordedData[4 * v8];
  v12 = *(CGPoint *)v11;
  v9 = *((_DWORD *)v11 + 4);
  result = 1;
  if (a3)
LABEL_4:
    *a3 = v12;
LABEL_5:
  if (a4)
    *a4 = v9;
  return result;
}

- (void)_updateMaximumFramesPerSecondRate:(id)a3
{
  id v4;
  double v5;
  double v6;
  unint64_t v7;
  unint64_t recordedDataCursor;
  double *v9;
  NSCopying *displayLinkManagerObserverToken;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_isWarmUpModeEnabled)
  {
    if (self->_displayLinkHasRefreshedAtLeastOnce)
    {
      v11[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      if (v5 - self->_warmUpModeDidStartTimestamp >= 0.5)
      {
        recordedDataCursor = self->_recordedDataCursor;
        if (recordedDataCursor)
        {
          memcpy((char *)v11 - ((40 * recordedDataCursor + 15) & 0xFFFFFFFFFFFFFFF0), self->_recordedData, 40 * recordedDataCursor);
          -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper _prepareRecordedDataBufferForStoringEnoughElementsForRecordingDuration:](self, "_prepareRecordedDataBufferForStoringEnoughElementsForRecordingDuration:", self->_vibrationPatternMaximumDuration * 1.2);
          bzero(self->_recordedData, 32 * self->_recordedDataElementsCount);
          self->_recordedDataCursor = 0;
          v9 = (double *)((char *)&v11[2] - ((40 * recordedDataCursor + 15) & 0xFFFFFFFFFFFFFFF0));
          do
          {
            -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper _recordFinalDataWithNormalizedTouchLocation:touchPhase:timeIntervalSinceBeginningOfPattern:](self, "_recordFinalDataWithNormalizedTouchLocation:touchPhase:timeIntervalSinceBeginningOfPattern:", *(unsigned int *)v9, *(v9 - 2), *(v9 - 1), v9[2]);
            v9 += 5;
            --recordedDataCursor;
          }
          while (recordedDataCursor);
        }
        else
        {
          -[TKVibrationRecorderTouchSurfaceRecordedDataWrapper _prepareRecordedDataBufferForStoringEnoughElementsForRecordingDuration:](self, "_prepareRecordedDataBufferForStoringEnoughElementsForRecordingDuration:", self->_vibrationPatternMaximumDuration * 1.2);
        }
        v4 = v11[0];
        self->_isWarmUpModeEnabled = 0;
        if (self->_displayLinkManagerObserverToken)
        {
          objc_msgSend(v11[0], "removeObserverWithToken:");
          displayLinkManagerObserverToken = self->_displayLinkManagerObserverToken;
          self->_displayLinkManagerObserverToken = 0;

          v4 = v11[0];
        }
      }
      else
      {
        objc_msgSend(v11[0], "duration");
        v4 = v11[0];
        v7 = vcvtpd_u64_f64(1.0 / v6);
        if (self->_maximumFramesPerSecondRate < v7)
          self->_maximumFramesPerSecondRate = v7;
      }
    }
    else
    {
      self->_displayLinkHasRefreshedAtLeastOnce = 1;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLinkManagerObserverToken, 0);
}

- (void)recordNormalizedTouchLocation:(uint64_t *)a1 touchPhase:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_2157C4000, a2, OS_LOG_TYPE_ERROR, "Couldn't not handle recording touch location in warm up mode with index %lu.", (uint8_t *)&v3, 0xCu);
}

- (void)recordNormalizedTouchLocation:(os_log_t)log touchPhase:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2157C4000, log, OS_LOG_TYPE_ERROR, "*** Assertion failure.", v1, 2u);
}

@end
