@implementation VMProcessor

- (VMProcessor)init
{
  return (VMProcessor *)-[VMProcessor initForRealTime:](self, "initForRealTime:", 1);
}

- (id)initForRealTime:(BOOL)a3
{
  _BOOL4 v3;
  VMProcessor *v4;
  VMProcessor *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *preparationQueue;
  NSObject *v8;
  _QWORD block[4];
  VMProcessor *v11;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VMProcessor;
  v4 = -[VMProcessor init](&v12, "init");
  v5 = v4;
  if (v4)
  {
    v4->_realTime = v3;
    if (v3)
    {
      pthread_mutex_init(&v4->_renderLock, 0);
      v6 = dispatch_queue_create("com.apple.VoiceMemos.VMProcessorQueue", 0);
      preparationQueue = v5->_preparationQueue;
      v5->_preparationQueue = (OS_dispatch_queue *)v6;

      v8 = v5->_preparationQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100030E70;
      block[3] = &unk_1001AB588;
      v11 = v5;
      dispatch_async(v8, block);

    }
    else
    {
      -[VMProcessor _registerInternalAudioUnits](v4, "_registerInternalAudioUnits");
    }
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[VMProcessor _unprepare](self, "_unprepare");
  if (self->_realTime)
    pthread_mutex_destroy(&self->_renderLock);
  v3.receiver = self;
  v3.super_class = (Class)VMProcessor;
  -[VMProcessor dealloc](&v3, "dealloc");
}

- (void)prepareWithFormat:(AudioStreamBasicDescription *)a3 maxFramesPerRender:(unsigned int)a4
{
  uint64_t v4;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  int v14;
  _OWORD v15[2];
  uint64_t v16;
  _OWORD v17[2];
  uint64_t v18;
  _BYTE v19[40];

  v4 = *(_QWORD *)&a4;
  if (-[VMProcessor debounceMaxFrames](self, "debounceMaxFrames") != a4
    || (-[VMProcessor debounceASBD](self, "debounceASBD"),
        v7 = *(_OWORD *)&a3->mBytesPerPacket,
        v17[0] = *(_OWORD *)&a3->mSampleRate,
        v17[1] = v7,
        v18 = *(_QWORD *)&a3->mBitsPerChannel,
        !sub_100075760((uint64_t)v17, (uint64_t)v19)))
  {
    -[VMProcessor setDebounceMaxFrames:](self, "setDebounceMaxFrames:", v4);
    v8 = *(_OWORD *)&a3->mBytesPerPacket;
    v15[0] = *(_OWORD *)&a3->mSampleRate;
    v15[1] = v8;
    v16 = *(_QWORD *)&a3->mBitsPerChannel;
    -[VMProcessor setDebounceASBD:](self, "setDebounceASBD:", v15);
    v10[1] = 3221225472;
    v9 = *(_OWORD *)&a3->mBytesPerPacket;
    v11 = *(_OWORD *)&a3->mSampleRate;
    v10[0] = _NSConcreteStackBlock;
    v10[2] = sub_100030FC0;
    v10[3] = &unk_1001ABA30;
    v10[4] = self;
    v12 = v9;
    v13 = *(_QWORD *)&a3->mBitsPerChannel;
    v14 = v4;
    -[VMProcessor _performAsynchronousRenderSensitiveAction:](self, "_performAsynchronousRenderSensitiveAction:", v10);
  }
}

- (void)unprepare
{
  _QWORD v2[5];

  *(_QWORD *)&self->_debounceASBD.mBitsPerChannel = 0;
  *(_OWORD *)&self->_debounceASBD.mSampleRate = 0u;
  *(_OWORD *)&self->_debounceASBD.mBytesPerPacket = 0u;
  self->_debounceMaxFrames = 0;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100031188;
  v2[3] = &unk_1001AB588;
  v2[4] = self;
  -[VMProcessor _performAsynchronousRenderSensitiveAction:](self, "_performAsynchronousRenderSensitiveAction:", v2);
}

- (BOOL)_prepareWithFormat:(AudioStreamBasicDescription *)a3 maxFramesPerRender:(unsigned int)a4 error:(id *)a5
{
  _QWORD *v9;
  AudioStreamBasicDescription *p_ioFormat;
  __int128 v11;
  __int128 v12;
  int v13;
  unsigned int v14;
  float v15;
  float v16;
  const char *v17;
  id v18;
  unsigned int v19;
  double mSampleRate;
  char v21;
  UInt32 ioDataSize;
  double outData;
  _QWORD handler[4];
  id v26;
  id location;
  _QWORD v28[5];

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100031438;
  v28[3] = &unk_1001ABA58;
  v28[4] = self;
  v9 = objc_retainBlock(v28);
  p_ioFormat = &self->_ioFormat;
  v11 = *(_OWORD *)&a3->mSampleRate;
  v12 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_QWORD *)&self->_ioFormat.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_ioFormat.mBytesPerPacket = v12;
  *(_OWORD *)&self->_ioFormat.mSampleRate = v11;
  self->_maxFramesPerRender = a4;
  self->_timestamp.mFlags |= 1u;
  v13 = 2;
  do
  {
    v14 = v13;
    v13 *= 2;
  }
  while (v14 < ((double)a3->mSampleRate * 0.01));
  self->_preferredBufferSize = v14;
  self->_utilityBuffer = (AudioBufferList *)sub_1000758C4(a3->mChannelsPerFrame, a4);
  v15 = 1.0;
  if (!self->_enabled)
    v15 = 0.0;
  v16 = 1.0 / (a3->mSampleRate * 0.0500000007);
  self->_processedToCleanRatio = v15;
  self->_crossfadeIncrement = v16;
  if (-[VMProcessor _configureDSPGraphsWithFormat:](self, "_configureDSPGraphsWithFormat:", a5))
  {
    sub_1000757EC(&self->_utilityBuffer->mNumberBuffers, self->_ioFormat.mChannelsPerFrame, self->_maxFramesPerRender, 1);
    sub_100031454((uint64_t)self, self->_maxFramesPerRender, (uint64_t)self->_utilityBuffer);
    -[VMProcessor _updateParameterForAddress:](self, "_updateParameterForAddress:", 0);
    objc_initWeak(&location, self);
    v17 = (const char *)objc_msgSend(CFSTR("com.apple.VoiceMemos.audioParameterUpdate"), "UTF8String");
    v18 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100031564;
    handler[3] = &unk_1001ABA80;
    objc_copyWeak(&v26, &location);
    notify_register_dispatch(v17, &self->_notifyToken, (dispatch_queue_t)&_dispatch_main_q, handler);

    outData = 0.0;
    ioDataSize = 8;
    if (AudioUnitGetProperty(*self->_dspGraphs, 0xCu, 0, 0, &outData, &ioDataSize))
    {
      v19 = 3 * self->_preferredBufferSize;
      mSampleRate = self->_ioFormat.mSampleRate;
    }
    else
    {
      mSampleRate = p_ioFormat->mSampleRate;
      v19 = vcvtad_u64_f64(outData * p_ioFormat->mSampleRate);
    }
    self->_graphLatencyInFrames = v19;
    self->_primingFadeInDurationFrames = (mSampleRate * 0.200000003);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
    v21 = 1;
  }
  else
  {
    v21 = ((uint64_t (*)(_QWORD *))v9[2])(v9);
  }

  return v21;
}

- (void)_updateParameterForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  id v10;
  double v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  int v17;
  int v18;
  id v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = v4;
  if (qword_1001ED840 == -1)
  {
    if (v4)
      goto LABEL_3;
  }
  else
  {
    dispatch_once(&qword_1001ED840, &stru_1001ABAA0);
    if (v5)
    {
LABEL_3:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ED838, "objectForKeyedSubscript:", v5));
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "currentValue");
        v9 = v8;
        v10 = objc_msgSend(v7, "address");
        LODWORD(v11) = v9;
        -[VMProcessor _setDSPGraphParameter:address:](self, "_setDSPGraphParameter:address:", v10, v11);
      }
      goto LABEL_13;
    }
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001ED838, "allValues", 0));
  v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v7);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v16, "currentValue");
        v18 = v17;
        v19 = objc_msgSend(v16, "address");
        LODWORD(v20) = v18;
        -[VMProcessor _setDSPGraphParameter:address:](self, "_setDSPGraphParameter:address:", v19, v20);
      }
      v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }
LABEL_13:

}

- (void)_setDSPGraphParameter:(float)a3 address:(unsigned int)a4
{
  unint64_t v7;

  if (self->_dspGraphs && self->_ioFormat.mChannelsPerFrame)
  {
    v7 = 0;
    do
      AudioUnitSetParameter(self->_dspGraphs[v7++], a4, 0, 0, a3, 0);
    while (v7 < self->_ioFormat.mChannelsPerFrame);
  }
}

- (void)_unprepare
{
  OpaqueAudioComponentInstance **dspGraphs;
  unint64_t mChannelsPerFrame;
  unint64_t i;
  OpaqueAudioComponentInstance *v6;
  void **utilityBuffer;
  int notifyToken;

  dspGraphs = self->_dspGraphs;
  if (dspGraphs)
  {
    mChannelsPerFrame = self->_ioFormat.mChannelsPerFrame;
    if (!(_DWORD)mChannelsPerFrame)
      goto LABEL_8;
    for (i = 0; i < mChannelsPerFrame; ++i)
    {
      v6 = self->_dspGraphs[i];
      if (v6)
      {
        AudioUnitUninitialize(v6);
        AudioComponentInstanceDispose(self->_dspGraphs[i]);
        mChannelsPerFrame = self->_ioFormat.mChannelsPerFrame;
      }
    }
    dspGraphs = self->_dspGraphs;
    if (dspGraphs)
LABEL_8:
      free(dspGraphs);
  }
  utilityBuffer = (void **)self->_utilityBuffer;
  if (utilityBuffer)
    sub_100075940(utilityBuffer, self->_ioFormat.mChannelsPerFrame);
  notifyToken = self->_notifyToken;
  if (notifyToken)
    notify_cancel(notifyToken);
  self->_notifyToken = 0;
  self->_dspGraphs = 0;
  self->_maxFramesPerRender = 0;
  self->_utilityBuffer = 0;
  *(_OWORD *)&self->_ioFormat.mSampleRate = 0u;
  *(_OWORD *)&self->_ioFormat.mBytesPerPacket = 0u;
  *(_QWORD *)&self->_ioFormat.mBitsPerChannel = 0;
  *(_OWORD *)&self->_timestamp.mSampleTime = 0u;
  *(_OWORD *)&self->_timestamp.mRateScalar = 0u;
  *(_OWORD *)&self->_timestamp.mSMPTETime.mSubframes = 0u;
  *(_OWORD *)&self->_timestamp.mSMPTETime.mHours = 0u;
}

- (void)_performAsynchronousRenderSensitiveAction:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *preparationQueue;
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  if (self->_realTime)
  {
    preparationQueue = self->_preparationQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100031A90;
    v7[3] = &unk_1001ABAC8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(preparationQueue, v7);

  }
  else
  {
    v4[2](v4);
  }

}

- (BOOL)_configureDSPGraphsWithFormat:(id *)a3
{
  double mSampleRate;
  UInt32 mBitsPerChannel;
  size_t mChannelsPerFrame;
  UInt32 mReserved;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD *v17;
  void *v18;
  signed int v19;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  OSStatus v23;
  OSStatus v24;
  OSStatus v25;
  signed int v26;
  OpaqueAudioComponentInstance *v27;
  signed int v28;
  OpaqueAudioComponentInstance *v29;
  signed int v30;
  OSStatus v31;
  OSStatus v32;
  signed int v33;
  size_t v35;
  uint64_t v36;
  void *v37;
  _QWORD *v38;
  UInt32 v39;
  void *v40;
  double v41;
  __int128 v42;
  UInt32 v43;
  int v44;
  UInt32 v45;
  UInt32 v46;
  _QWORD v47[2];
  unsigned int outData;
  void *v49;
  void *v50;
  void *inData;
  _QWORD v52[4];
  id v53;
  __int128 v54;

  mSampleRate = self->_ioFormat.mSampleRate;
  v54 = *(_OWORD *)&self->_ioFormat.mFormatID;
  mChannelsPerFrame = self->_ioFormat.mChannelsPerFrame;
  mBitsPerChannel = self->_ioFormat.mBitsPerChannel;
  mReserved = self->_ioFormat.mReserved;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = NSTemporaryDirectory();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v12, 1, a3));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("tmp.dspg")));

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1000321A0;
  v52[3] = &unk_1001AB588;
  v16 = v13;
  v53 = v16;
  v17 = objc_retainBlock(v52);
  inData = v15;
  if (+[VMDSPGraph writeGraphTextToFile:samplerate:bufferSize:error:](VMDSPGraph, "writeGraphTextToFile:samplerate:bufferSize:error:", v15, (int)mSampleRate, self->_preferredBufferSize, a3))
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[VMDSPGraph propertyStrip](VMDSPGraph, "propertyStrip"));
    v50 = v40;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[VMDSPGraph auStrip](VMDSPGraph, "auStrip"));
    v49 = v18;
    outData = self->_preferredBufferSize;
    self->_dspGraphs = (OpaqueAudioComponentInstance **)malloc_type_calloc(mChannelsPerFrame, 8uLL, 0x2004093837F09uLL);
    v47[0] = sub_1000321E8;
    v47[1] = self;
    if ((_DWORD)mChannelsPerFrame)
    {
      v19 = sub_1000756F4(0x61756678u, 0x64737067u, self->_dspGraphs);
      if (sub_1000755F4(v19, a3))
      {
        v20 = 0;
        v39 = mReserved;
        v38 = v17;
        v35 = mChannelsPerFrame;
        v36 = 8 * mChannelsPerFrame;
        v21 = 8;
        v22 = 1;
        v37 = v18;
        do
        {
          v23 = AudioUnitSetProperty(self->_dspGraphs[v21 / 8 - 1], 0x64737067u, 0, 0, &inData, 8u);
          if (!sub_1000755F4(v23, a3))
            break;
          v24 = AudioUnitSetProperty(self->_dspGraphs[v21 / 8 - 1], 0x70727370u, 0, 0, &v50, 8u);
          if (!sub_1000755F4(v24, a3))
            break;
          v25 = AudioUnitSetProperty(self->_dspGraphs[v21 / 8 - 1], 0x61757370u, 0, 0, &v49, 8u);
          if (!sub_1000755F4(v25, a3))
            break;
          v26 = sub_100075AB4(self->_dspGraphs[v21 / 8 - 1], &outData);
          if (!sub_1000755F4(v26, a3))
            break;
          v27 = self->_dspGraphs[v21 / 8 - 1];
          v41 = mSampleRate;
          v42 = v54;
          v43 = mBitsPerChannel >> 3;
          v44 = 1;
          v45 = mBitsPerChannel;
          v46 = v39;
          v28 = sub_100075740(v27, &v41, 1);
          if (!sub_1000755F4(v28, a3))
          {
            v17 = v38;
            break;
          }
          v29 = self->_dspGraphs[v21 / 8 - 1];
          v41 = mSampleRate;
          v42 = v54;
          v43 = mBitsPerChannel >> 3;
          v44 = 1;
          v45 = mBitsPerChannel;
          v46 = v39;
          v30 = sub_100075740(v29, &v41, 0);
          if (!sub_1000755F4(v30, a3)
            || (v31 = AudioUnitSetProperty(self->_dspGraphs[v21 / 8 - 1], 0x17u, 1u, 0, v47, 0x10u),
                !sub_1000755F4(v31, a3)))
          {
            v17 = v38;
            v18 = v37;
            break;
          }
          v32 = AudioUnitInitialize(self->_dspGraphs[v21 / 8 - 1]);
          v17 = v38;
          v18 = v37;
          if (!sub_1000755F4(v32, a3))
            break;
          if (v36 == v21)
            goto LABEL_17;
          v20 = v22 >= v35;
          v33 = sub_1000756F4(0x61756678u, 0x64737067u, &self->_dspGraphs[v21 / 8]);
          v21 += 8;
          ++v22;
        }
        while (sub_1000755F4(v33, a3));
      }
      else
      {
        v20 = 0;
      }
    }
    else
    {
LABEL_17:
      v20 = 1;
    }
    ((void (*)(_QWORD *))v17[2])(v17);

  }
  else
  {
    ((void (*)(_QWORD *))v17[2])(v17);
    v20 = 0;
  }

  return v20;
}

- (void)_registerInternalAudioUnits
{
  if (qword_1001ED848 != -1)
    dispatch_once(&qword_1001ED848, &stru_1001ABAE8);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (OS_dispatch_queue)preparationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 256, 1);
}

- (void)setPreparationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (AudioStreamBasicDescription)debounceASBD
{
  __int128 v3;

  *(_QWORD *)&retstr->mBitsPerChannel = *(_QWORD *)&self[7].mBytesPerPacket;
  v3 = *(_OWORD *)&self[7].mSampleRate;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[6].mBytesPerFrame;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  return self;
}

- (void)setDebounceASBD:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->mSampleRate;
  v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_QWORD *)&self->_debounceASBD.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_debounceASBD.mSampleRate = v3;
  *(_OWORD *)&self->_debounceASBD.mBytesPerPacket = v4;
}

- (unsigned)debounceMaxFrames
{
  return self->_debounceMaxFrames;
}

- (void)setDebounceMaxFrames:(unsigned int)a3
{
  self->_debounceMaxFrames = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preparationQueue, 0);
}

@end
