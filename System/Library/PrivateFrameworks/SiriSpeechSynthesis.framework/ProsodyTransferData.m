@implementation ProsodyTransferData

- (ProsodyTransferData)init
{
  ProsodyTransferData *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ProsodyTransferData;
  result = -[ProsodyTransferData init](&v3, sel_init);
  if (result)
    result->_asbd.mSampleRate = 16000.0;
  return result;
}

- (AudioStreamBasicDescription)asbd
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mBitsPerChannel;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(_QWORD *)&retstr->mBitsPerChannel = *(_QWORD *)&self[1].mBytesPerFrame;
  return self;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->mSampleRate;
  v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_QWORD *)&self->_asbd.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_asbd.mSampleRate = v3;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
}

- (NSData)waveData
{
  return self->_waveData;
}

- (void)setWaveData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UserVoiceProfile)userVoiceProfile
{
  return self->_userVoiceProfile;
}

- (void)setUserVoiceProfile:(id)a3
{
  objc_storeStrong((id *)&self->_userVoiceProfile, a3);
}

- (NSString)userVoiceProfileUrl
{
  return self->_userVoiceProfileUrl;
}

- (void)setUserVoiceProfileUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVoiceProfileUrl, 0);
  objc_storeStrong((id *)&self->_userVoiceProfile, 0);
  objc_storeStrong((id *)&self->_waveData, 0);
}

@end
