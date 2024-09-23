@implementation RCPlatterMinimalAndromedaWaveformView

- (void)updateSliceFramesForRecordingTime:(double)a3
{
  -[RCPlatterWaveformView updateSliceFrames](self, "updateSliceFrames", a3);
}

- (void)updateSlicesAndFrames
{
  unint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  v3 = -[RCPlatterMinimalWaveformView numberOfSlices](self, "numberOfSlices");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterWaveformView activeSliceQueue](self, "activeSliceQueue"));
  v5 = objc_msgSend(v4, "count");

  if ((id)v3 == v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100059A38;
    v6[3] = &unk_1001AC4F8;
    v6[4] = self;
    -[RCPlatterWaveformView enumerateAllSlices:](self, "enumerateAllSlices:", v6);
  }
  else
  {
    -[RCPlatterMinimalAndromedaWaveformView _appendSlices:](self, "_appendSlices:", v3 - (_QWORD)v5);
  }
}

- (void)_appendSlices:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (a3)
  {
    v4 = a3;
    do
    {
      -[RCPlatterWaveformView appendSliceWithType:](self, "appendSliceWithType:", 0);
      --v4;
    }
    while (v4);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterMinimalAndromedaWaveformView _genericAmplitudes](self, "_genericAmplitudes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterWaveformView activeSliceQueue](self, "activeSliceQueue"));
  v7 = objc_msgSend(v6, "count");
  v8 = objc_msgSend(v5, "count");

  if (v7 == v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterWaveformView activeSliceQueue](self, "activeSliceQueue"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = 0;
      do
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterWaveformView activeSliceQueue](self, "activeSliceQueue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v11));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v11));
        objc_msgSend(v14, "floatValue");
        objc_msgSend(v13, "setAmplitude:", v15);
        objc_msgSend(v13, "setAmplitudeNeedsUpdate:", 0);

        ++v11;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlatterWaveformView activeSliceQueue](self, "activeSliceQueue"));
        v17 = objc_msgSend(v16, "count");

      }
      while (v11 < (unint64_t)v17);
    }
  }
  else
  {
    v18 = OSLogForCategory(kVMLogCategoryDefault);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10010C124(v19, v20, v21, v22, v23, v24, v25, v26);

  }
}

- (id)_genericAmplitudes
{
  return &off_1001B74C0;
}

@end
