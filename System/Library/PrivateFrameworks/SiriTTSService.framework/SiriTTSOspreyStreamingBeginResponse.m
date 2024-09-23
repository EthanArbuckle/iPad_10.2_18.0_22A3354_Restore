@implementation SiriTTSOspreyStreamingBeginResponse

- (SiriTTSOspreyStreamingBeginResponse)initWithOspreyBeginResponse:(id)a3
{
  id v4;
  SiriTTSOspreyStreamingBeginResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *voiceLanguage;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *voiceName;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *voiceFootprint;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *voiceType;
  void *v26;
  void *v27;
  uint64_t v28;
  NSString *voiceGender;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *resourceLanguage;
  void *v35;
  void *v36;
  void *v37;
  float v38;
  void *v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)SiriTTSOspreyStreamingBeginResponse;
  v5 = -[SiriTTSOspreyStreamingBeginResponse init](&v45, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "meta_info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "voice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "language");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v9 = objc_claimAutoreleasedReturnValue();
    voiceLanguage = v5->_voiceLanguage;
    v5->_voiceLanguage = (NSString *)v9;

    objc_msgSend(v4, "meta_info");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "voice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v13 = objc_claimAutoreleasedReturnValue();
    voiceName = v5->_voiceName;
    v5->_voiceName = (NSString *)v13;

    objc_msgSend(v4, "meta_info");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "voice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "version");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_voiceVersion = objc_msgSend(v17, "integerValue");

    objc_msgSend(v4, "meta_info");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "voice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "quality");
    v20 = objc_claimAutoreleasedReturnValue();
    voiceFootprint = v5->_voiceFootprint;
    v5->_voiceFootprint = (NSString *)v20;

    objc_msgSend(v4, "meta_info");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "voice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "type");
    v24 = objc_claimAutoreleasedReturnValue();
    voiceType = v5->_voiceType;
    v5->_voiceType = (NSString *)v24;

    objc_msgSend(v4, "meta_info");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "voice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "gender");
    v28 = objc_claimAutoreleasedReturnValue();
    voiceGender = v5->_voiceGender;
    v5->_voiceGender = (NSString *)v28;

    objc_msgSend(v4, "meta_info");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "resource");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "language");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v33 = objc_claimAutoreleasedReturnValue();
    resourceLanguage = v5->_resourceLanguage;
    v5->_resourceLanguage = (NSString *)v33;

    objc_msgSend(v4, "meta_info");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "resource");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "version");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_resourceVersion = objc_msgSend(v37, "integerValue");

    objc_msgSend(v4, "streaming_playback_buffer_size_in_seconds");
    v5->_bufferDuration = v38;
    objc_msgSend(v4, "decoder_description");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      objc_msgSend(v39, "audioStreamBasicDescription");
    }
    else
    {
      v44 = 0;
      v42 = 0u;
      v43 = 0u;
    }
    *(_OWORD *)&v5->_asbd.mSampleRate = v42;
    *(_OWORD *)&v5->_asbd.mBytesPerPacket = v43;
    *(_QWORD *)&v5->_asbd.mBitsPerChannel = v44;

  }
  return v5;
}

- (NSString)voiceLanguage
{
  return self->_voiceLanguage;
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (NSString)voiceFootprint
{
  return self->_voiceFootprint;
}

- (NSString)voiceType
{
  return self->_voiceType;
}

- (NSString)voiceGender
{
  return self->_voiceGender;
}

- (int64_t)voiceVersion
{
  return self->_voiceVersion;
}

- (NSString)resourceLanguage
{
  return self->_resourceLanguage;
}

- (int64_t)resourceVersion
{
  return self->_resourceVersion;
}

- (AudioStreamBasicDescription)asbd
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].mBytesPerPacket;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[2].mSampleRate;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(_QWORD *)&retstr->mBitsPerChannel = *(_QWORD *)&self[2].mBitsPerChannel;
  return self;
}

- (double)bufferDuration
{
  return self->_bufferDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceLanguage, 0);
  objc_storeStrong((id *)&self->_voiceGender, 0);
  objc_storeStrong((id *)&self->_voiceType, 0);
  objc_storeStrong((id *)&self->_voiceFootprint, 0);
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_voiceLanguage, 0);
}

@end
