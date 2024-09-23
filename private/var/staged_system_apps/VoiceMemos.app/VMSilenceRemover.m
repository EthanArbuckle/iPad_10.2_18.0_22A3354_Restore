@implementation VMSilenceRemover

- (void)setSilenceThreshold:(float)a3
{
  self->_silenceThreshold = a3;
  -[VMSilenceRemover resetCounter](self, "resetCounter");
}

- (void)setCutPadding:(float)a3
{
  -[VMSilenceRemover flush](self, "flush");
  self->_cutPadding = a3;
  self->_cutPaddingInSamples = (int)(self->_sampleRate * a3);
  -[VMSilenceRemover updateContiguousThreshold](self, "updateContiguousThreshold");
  -[VMSilenceRemover resetCounter](self, "resetCounter");
}

- (void)setFadeDuration:(float)a3
{
  -[VMSilenceRemover flush](self, "flush");
  self->_fadeDuration = a3;
  self->_crossfadeDurationInSamples = (int)(self->_sampleRate * a3);
  -[VMSilenceRemover updateContiguousThreshold](self, "updateContiguousThreshold");
  -[VMSilenceRemover resetCounter](self, "resetCounter");
}

- (void)setSingleReadLimitInSeconds:(float)a3
{
  self->_singleReadLimitInSeconds = a3;
  self->_singleReadLimitInSamples = (int)(self->_sampleRate * a3);
}

- (void)updateContiguousThreshold
{
  self->_contiguousSilenceThresholdInSamples = 2 * (self->_cutPaddingInSamples + self->_crossfadeDurationInSamples);
}

- (void)reset
{
  int v3;
  int v4;

  v3 = atomic_load((unsigned int *)&self->_inputBuffer.mFill);
  sub_10002B3AC((uint64_t)&self->_inputBuffer, v3);
  v4 = atomic_load((unsigned int *)&self->_inputBuffer.mFill);
  sub_10002B3AC((uint64_t)&self->_processingBuffer, v4);
  -[VMSilenceRemover resetCounter](self, "resetCounter");
}

- (void)resetCounter
{
  self->counter = 0;
  self->removedCounter = 0;
}

- (VMSilenceRemover)initWithSampleRate:(double)a3 channelCount:(int)a4 error:(id *)a5
{
  VMSilenceRemover *v7;
  VMSilenceRemover *v8;
  VMSilenceRemover *v9;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VMSilenceRemover;
  v7 = -[VMSilenceRemover init](&v12, "init");
  v8 = v7;
  if (v7)
  {
    v7->_sampleRate = a3;
    v7->_channelCount = a4;
    v7->_fadeDuration = 0.0025;
    *(_QWORD *)&v7->_cutPadding = 0x3C03126F3D4CCCCDLL;
    *(int32x2_t *)&v7->_crossfadeDurationInSamples = vmovn_s64(vcvtq_s64_f64(vmulq_n_f64((float64x2_t)xmmword_100186F40, a3)));
    v7->_maxSilenceFramesToRender = (int)(a3 * 0.699999988);
    v7->_silenceRemovalRatio = 0.7;
    -[VMSilenceRemover updateContiguousThreshold](v7, "updateContiguousThreshold");
    if (sub_10003B88C((uint64_t)&v8->_processingBuffer, (int)(v8->_sampleRate * 40.0), v8->_channelCount, a5)
      && sub_10003B88C((uint64_t)&v8->_inputBuffer, 0x8000, v8->_channelCount, a5))
    {
      v8->_preCutBuffer = (float **)sub_100046EBC(v8->_channelCount, (int)v8->_sampleRate, 4);
      operator new();
    }
    v9 = 0;
  }
  else
  {
    v9 = (VMSilenceRemover *)0;
  }

  return v9;
}

- (void)dealloc
{
  void **rmsBuffer;
  void *v4;
  objc_super v5;

  sub_10002ADDC((uint64_t)&self->_processingBuffer);
  sub_10002ADDC((uint64_t)&self->_inputBuffer);
  free(self->_preCutBuffer);
  rmsBuffer = (void **)self->_rmsBuffer;
  if (rmsBuffer)
  {
    v4 = *rmsBuffer;
    if (*rmsBuffer)
    {
      rmsBuffer[1] = v4;
      operator delete(v4);
    }
    operator delete();
  }
  v5.receiver = self;
  v5.super_class = (Class)VMSilenceRemover;
  -[VMSilenceRemover dealloc](&v5, "dealloc");
}

- (int)fillNextBuffer:(AudioBufferList *)a3 frameCount:(int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  float **v11;
  int v12;
  int v13;
  float **v14;
  uint64_t v15;
  float **v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  float **v20;
  float **v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t *v25;
  float v26;
  float **v27;
  uint64_t v28;
  uint64_t v29;
  double *v30;
  float v31;
  float v32;
  float v33;
  int v34;
  int state;
  unint64_t v36;
  unint64_t v37;
  signed int channelCount;
  float v39;
  float v40;
  float **v41;
  uint64_t v42;
  uint64_t v43;
  double *rmsBuffer;
  float v45;
  float silenceThreshold;
  uint64_t v47;
  void **v48;
  float **v49;
  uint64_t v50;
  int v51;
  _DWORD *v52;
  uint64_t v53;
  float **mWritePointers;
  float **v55;
  uint64_t v56;
  int v57;
  _DWORD *v58;
  int v60;
  int v62;
  AudioBufferList *mReadBufferlist;
  float **mReadPointers;
  uint64_t mNumberBuffers;
  void **p_mData;
  void *v67;
  unint64_t v68;
  void **v69;
  void **v70;
  char *v71;
  int v72;
  VMAudioRingBuffer *p_processingBuffer;
  int v74;

  v4 = *(_QWORD *)&a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMSilenceRemover inputProvider](self, "inputProvider"));
  v8 = v7;
  if (!v7)
    goto LABEL_77;
  if (!self->_enabled)
  {
    v62 = atomic_load((unsigned int *)&self->_processingBuffer.mFill);
    if (v62 < 1)
    {
      LODWORD(v10) = objc_msgSend(v7, "fillNextBuffer:frameCount:", a3, v4);
    }
    else
    {
      if (self->_state == 1)
        -[VMSilenceRemover _makeCutAndStartFlush](self, "_makeCutAndStartFlush");
      LODWORD(v10) = -[VMSilenceRemover readFromInternalBuffer:frameCount:offset:](self, "readFromInternalBuffer:frameCount:offset:", a3, v4, 0);
      if ((int)v4 - (int)v10 >= 1)
      {
        mReadBufferlist = self->_inputBuffer.mReadBufferlist;
        mReadPointers = self->_inputBuffer.mReadPointers;
        mNumberBuffers = self->_inputBuffer.mNumberBuffers;
        mReadBufferlist->mNumberBuffers = mNumberBuffers;
        if ((_DWORD)mNumberBuffers)
        {
          p_mData = &mReadBufferlist->mBuffers[0].mData;
          do
          {
            *(p_mData - 1) = (void *)1;
            v67 = *mReadPointers++;
            *p_mData = v67;
            p_mData += 2;
            --mNumberBuffers;
          }
          while (mNumberBuffers);
        }
        if (self->_channelCount)
        {
          v68 = 0;
          v69 = &a3->mBuffers[0].mData;
          v70 = &mReadBufferlist->mBuffers[0].mData;
          do
          {
            v71 = (char *)*v69;
            v69 += 2;
            *v70 = &v71[4 * (int)v10];
            *((_DWORD *)v70 - 1) = 4 * (v4 - v10);
            ++v68;
            v70 += 2;
          }
          while (v68 < self->_channelCount);
        }
        LODWORD(v10) = objc_msgSend(v8, "fillNextBuffer:frameCount:") + v10;
      }
    }
    goto LABEL_78;
  }
  if ((int)v4 < 1)
  {
LABEL_77:
    LODWORD(v10) = 0;
    goto LABEL_78;
  }
  v9 = 0;
  v10 = 0;
  p_processingBuffer = &self->_processingBuffer;
  while (1)
  {
    if (self->_state == 2)
    {
      LODWORD(v10) = -[VMSilenceRemover readFromInternalBuffer:frameCount:offset:](self, "readFromInternalBuffer:frameCount:offset:", a3, (v4 - v10), v10)+ v10;
      goto LABEL_7;
    }
    v74 = 0;
    v11 = -[VMSilenceRemover _getInput:](self, "_getInput:", &v74);
    v12 = v74;
    v9 += v74;
    v13 = atomic_load((unsigned int *)&self->_processingBuffer.mFill);
    if (v12)
      break;
    if (!v13)
      goto LABEL_78;
    state = self->_state;
    if (state == 1)
    {
      -[VMSilenceRemover _makeCutAndStartFlush](self, "_makeCutAndStartFlush");
    }
    else if (!state)
    {
      self->_state = 2;
    }
LABEL_7:
    if ((int)v10 >= (int)v4)
      goto LABEL_78;
  }
  v14 = v11;
  if (v13 < 1)
  {
    if (v74 >= (int)v4 - (int)v10)
      v36 = (v4 - v10);
    else
      v36 = v74;
    if ((int)v36 < 1)
    {
      v15 = 0;
    }
    else
    {
      v37 = 0;
      do
      {
        channelCount = self->_channelCount;
        v39 = 0.0;
        v40 = 0.0;
        if (channelCount >= 1)
        {
          v41 = v14;
          v42 = self->_channelCount;
          do
          {
            v43 = (uint64_t)*v41++;
            v40 = v40 + *(float *)(v43 + 4 * v37);
            --v42;
          }
          while (v42);
        }
        sub_10002B118((uint64_t *)self->_rmsBuffer, (float)(v40 / (float)channelCount) * (float)(v40 / (float)channelCount));
        rmsBuffer = (double *)self->_rmsBuffer;
        v45 = rmsBuffer[5];
        if (v45 > 0.0)
          v39 = sqrtf(v45 / (float)*((int *)rmsBuffer + 7));
        silenceThreshold = self->_silenceThreshold;
        if (v39 < silenceThreshold)
        {
          v53 = self->_channelCount;
          if ((_DWORD)v53)
          {
            mWritePointers = self->_processingBuffer.mWritePointers;
            v55 = v14;
            do
            {
              v56 = (uint64_t)*v55++;
              v57 = *(_DWORD *)(v56 + 4 * v37);
              v58 = *mWritePointers++;
              *v58 = v57;
              --v53;
            }
            while (v53);
          }
          sub_10002B058((uint64_t)p_processingBuffer, 1);
          self->_state = 0;
        }
        else
        {
          v47 = self->_channelCount;
          if ((_DWORD)v47)
          {
            v48 = &a3->mBuffers[0].mData;
            v49 = v14;
            do
            {
              v50 = (uint64_t)*v49++;
              v51 = *(_DWORD *)(v50 + 4 * v37);
              v52 = *v48;
              v48 += 2;
              v52[(int)v10] = v51;
              --v47;
            }
            while (v47);
          }
          v10 = (v10 + 1);
        }
        ++v37;
      }
      while (v39 >= silenceThreshold && v37 < v36);
      v15 = v37;
    }
    goto LABEL_74;
  }
  if (v74 < 1)
  {
    v15 = 0;
    v60 = 0;
    goto LABEL_66;
  }
  v72 = v9;
  v15 = 0;
  v16 = self->_processingBuffer.mWritePointers;
  while (2)
  {
    v17 = v15;
    v18 = self->_channelCount;
    v19 = v18;
    v20 = v14;
    v21 = v16;
    if (!(_DWORD)v18)
    {
      v25 = (uint64_t *)self->_rmsBuffer;
LABEL_20:
      v26 = 0.0;
      goto LABEL_21;
    }
    do
    {
      v22 = (uint64_t)*v20++;
      v23 = *(_DWORD *)(v22 + 4 * v15);
      v24 = (uint64_t)*v21++;
      *(_DWORD *)(v24 + 4 * v15) = v23;
      --v19;
    }
    while (v19);
    v25 = (uint64_t *)self->_rmsBuffer;
    if ((int)v18 < 1)
      goto LABEL_20;
    v26 = 0.0;
    v27 = v14;
    v28 = v18;
    do
    {
      v29 = (uint64_t)*v27++;
      v26 = v26 + *(float *)(v29 + 4 * v15);
      --v28;
    }
    while (v28);
LABEL_21:
    sub_10002B118(v25, (float)(v26 / (float)(int)v18) * (float)(v26 / (float)(int)v18));
    v30 = (double *)self->_rmsBuffer;
    v31 = v30[5];
    v32 = 0.0;
    if (v31 > 0.0)
      v32 = sqrtf(v31 / (float)*((int *)v30 + 7));
    ++v15;
    v33 = self->_silenceThreshold;
    v34 = self->_state;
    if (v34 != 1)
    {
      if (!v34)
      {
        if (v32 >= v33)
        {
          v60 = 3;
          goto LABEL_65;
        }
        if (v13 + v17 >= self->_contiguousSilenceThresholdInSamples)
        {
          v60 = 1;
          goto LABEL_65;
        }
      }
      goto LABEL_29;
    }
    if (v32 < v33)
    {
LABEL_29:
      if (v15 >= v74)
      {
        v60 = 0;
        goto LABEL_65;
      }
      continue;
    }
    break;
  }
  v60 = 2;
LABEL_65:
  v9 = v72;
LABEL_66:
  sub_10002B058((uint64_t)p_processingBuffer, v15);
  if (self->_state == 1)
    -[VMSilenceRemover _discardSilenceFrames](self, "_discardSilenceFrames");
  switch(v60)
  {
    case 3:
      self->_state = 2;
      break;
    case 2:
      -[VMSilenceRemover _makeCutAndStartFlush](self, "_makeCutAndStartFlush");
      break;
    case 1:
      -[VMSilenceRemover _advanceToOverThresholdState](self, "_advanceToOverThresholdState");
      break;
  }
LABEL_74:
  -[VMSilenceRemover consumeInput:](self, "consumeInput:", v15);
  if (v9 <= self->_singleReadLimitInSamples || self->_state != 1)
    goto LABEL_7;
LABEL_78:

  return v10;
}

- (int)readFromInternalBuffer:(AudioBufferList *)a3 frameCount:(int)a4 offset:(int)a5
{
  VMAudioRingBuffer *p_processingBuffer;
  int v7;
  _BOOL4 v8;
  int v9;

  p_processingBuffer = &self->_processingBuffer;
  v7 = atomic_load((unsigned int *)&self->_processingBuffer.mFill);
  v8 = v7 > a4;
  if (v7 >= a4)
    v9 = a4;
  else
    v9 = v7;
  sub_10003C8E8((uint64_t)p_processingBuffer, (uint64_t)a3, v9, a5);
  self->_state = 2 * v8;
  return v9;
}

- (void)_advanceToOverThresholdState
{
  sub_100075A50((uint64_t *)self->_processingBuffer.mReadPointers, 0, (uint64_t *)self->_preCutBuffer, 0, self->_channelCount, self->_cutPaddingInSamples + self->_crossfadeDurationInSamples);
  self->_state = 1;
  self->_currentSilenceRemovedCounter = 0;
}

- (void)_discardSilenceFrames
{
  uint64_t v2;
  unint64_t v3;
  signed int v4;
  int maxSilenceFramesToRender;
  float v6;
  unsigned int v7;
  unint64_t v8;

  v2 = self->_crossfadeDurationInSamples + (uint64_t)self->_cutPaddingInSamples;
  v3 = self->_currentSilenceRemovedCounter + v2;
  v4 = atomic_load((unsigned int *)&self->_processingBuffer.mFill);
  maxSilenceFramesToRender = self->_maxSilenceFramesToRender;
  v6 = (float)(1.0 - self->_silenceRemovalRatio) * (float)(v3 + v4);
  if (v6 > (float)maxSilenceFramesToRender)
    v6 = (float)maxSilenceFramesToRender;
  if ((int)v2 <= (int)v6 - self->_cutPaddingInSamples)
    LODWORD(v2) = (int)v6 - self->_cutPaddingInSamples;
  v7 = atomic_load((unsigned int *)&self->_processingBuffer.mFill);
  v8 = v7 - v2;
  if ((int)v8 >= 1)
  {
    sub_10002B3AC((uint64_t)&self->_processingBuffer, v7 - v2);
    *(int64x2_t *)&self->removedCounter = vaddq_s64(*(int64x2_t *)&self->removedCounter, vdupq_n_s64(v8));
  }
}

- (void)_makeCutAndStartFlush
{
  uint64_t *mReadPointers;
  uint64_t channelCount;
  uint64_t v5;
  float **preCutBuffer;
  uint64_t crossfadeDurationInSamples;
  uint64_t cutPaddingInSamples;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  mReadPointers = (uint64_t *)self->_processingBuffer.mReadPointers;
  sub_100075A50((uint64_t *)self->_preCutBuffer, 0, mReadPointers, 0, self->_channelCount, self->_cutPaddingInSamples);
  channelCount = self->_channelCount;
  if ((_DWORD)channelCount)
  {
    v5 = 0;
    preCutBuffer = self->_preCutBuffer;
    crossfadeDurationInSamples = self->_crossfadeDurationInSamples;
    cutPaddingInSamples = self->_cutPaddingInSamples;
    do
    {
      if ((int)crossfadeDurationInSamples >= 1)
      {
        v9 = 0;
        v10 = mReadPointers[v5] + 4 * cutPaddingInSamples;
        v11 = (uint64_t)&preCutBuffer[v5][cutPaddingInSamples];
        do
        {
          *(float *)(v10 + 4 * v9) = (float)(*(float *)(v10 + 4 * v9)
                                           * (float)((float)(int)v9 / (float)(int)crossfadeDurationInSamples))
                                   + (float)(*(float *)(v11 + 4 * v9)
                                           * (float)(1.0
                                                   - (float)((float)(int)v9 / (float)(int)crossfadeDurationInSamples)));
          ++v9;
        }
        while (crossfadeDurationInSamples != v9);
      }
      ++v5;
    }
    while (v5 != channelCount);
  }
  self->_state = 2;
}

- (void)flush
{
  if (self->_state == 1)
    -[VMSilenceRemover _makeCutAndStartFlush](self, "_makeCutAndStartFlush");
  self->_state = 2;
}

- (void)consumeInput:(int)a3
{
  sub_10002B3AC((uint64_t)&self->_inputBuffer, a3);
}

- (float)_getInput:(int *)a3
{
  void *v5;
  void *v6;
  int v7;
  AudioBufferList *mWriteBufferlist;
  float **mWritePointers;
  uint64_t mNumberBuffers;
  void **p_mData;
  void *v12;
  int v13;
  int v14;
  float **mReadPointers;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMSilenceRemover inputProvider](self, "inputProvider"));
  v6 = v5;
  if (v5)
  {
    v7 = atomic_load((unsigned int *)&self->_inputBuffer.mFill);
    if (v7 <= 2047)
    {
      mWriteBufferlist = self->_inputBuffer.mWriteBufferlist;
      mWritePointers = self->_inputBuffer.mWritePointers;
      mNumberBuffers = self->_inputBuffer.mNumberBuffers;
      mWriteBufferlist->mNumberBuffers = mNumberBuffers;
      if ((_DWORD)mNumberBuffers)
      {
        p_mData = &mWriteBufferlist->mBuffers[0].mData;
        do
        {
          *(p_mData - 1) = (void *)0x400000000001;
          v12 = *mWritePointers++;
          *p_mData = v12;
          p_mData += 2;
          --mNumberBuffers;
        }
        while (mNumberBuffers);
      }
      v13 = objc_msgSend(v5, "fillNextBuffer:frameCount:");
      self->counter += v13;
      sub_10002B058((uint64_t)&self->_inputBuffer, v13);
    }
    v14 = atomic_load((unsigned int *)&self->_inputBuffer.mFill);
    *a3 = v14;
    mReadPointers = self->_inputBuffer.mReadPointers;
  }
  else
  {
    mReadPointers = 0;
  }

  return mReadPointers;
}

- (unint64_t)samplesRemoved
{
  return self->removedCounter;
}

- (float)saved
{
  if ((float)((float)self->removedCounter / (float)self->counter) == INFINITY)
    return 0.0;
  else
    return (float)self->removedCounter / (float)self->counter;
}

- (float)cutPadding
{
  return self->_cutPadding;
}

- (float)silenceThreshold
{
  return self->_silenceThreshold;
}

- (float)fadeDuration
{
  return self->_fadeDuration;
}

- (float)singleReadLimitInSeconds
{
  return self->_singleReadLimitInSeconds;
}

- (VMAudioProvider)inputProvider
{
  return (VMAudioProvider *)objc_loadWeakRetained((id *)&self->_inputProvider);
}

- (void)setInputProvider:(id)a3
{
  objc_storeWeak((id *)&self->_inputProvider, a3);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (unsigned)channelCount
{
  return self->_channelCount;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inputProvider);
}

- (id).cxx_construct
{
  *((_DWORD *)self + 12) = 0;
  *((_DWORD *)self + 28) = 0;
  return self;
}

@end
