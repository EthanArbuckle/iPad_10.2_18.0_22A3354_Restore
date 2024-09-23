@implementation TTSWrappedAudioQueueBuffer

- (AudioQueueBuffer)aqBuffer
{
  return self->_aqBuffer;
}

- (void)setAqBuffer:(AudioQueueBuffer *)a3
{
  self->_aqBuffer = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (AudioTimeStamp)queuedTimeStamp
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self->mSMPTETime.mHours;
  *(_OWORD *)&retstr->mSampleTime = *(_OWORD *)&self->mSMPTETime.mSubframes;
  *(_OWORD *)&retstr->mRateScalar = v3;
  v4 = *(_OWORD *)&self[1].mRateScalar;
  *(_OWORD *)&retstr->mSMPTETime.mSubframes = *(_OWORD *)&self[1].mSampleTime;
  *(_OWORD *)&retstr->mSMPTETime.mHours = v4;
  return self;
}

- (void)setQueuedTimeStamp:(AudioTimeStamp *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->mSampleTime;
  v4 = *(_OWORD *)&a3->mRateScalar;
  v5 = *(_OWORD *)&a3->mSMPTETime.mHours;
  *(_OWORD *)&self->_queuedTimeStamp.mSMPTETime.mSubframes = *(_OWORD *)&a3->mSMPTETime.mSubframes;
  *(_OWORD *)&self->_queuedTimeStamp.mSMPTETime.mHours = v5;
  *(_OWORD *)&self->_queuedTimeStamp.mSampleTime = v3;
  *(_OWORD *)&self->_queuedTimeStamp.mRateScalar = v4;
}

- (unint64_t)byteSize
{
  return self->_byteSize;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
