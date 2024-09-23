@implementation VSSpeechCacheAudio

- (NSString)key
{
  return self->_key;
}

- (id)serializedData
{
  void *v3;
  NSArray *timingInfos;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendBytes:length:", &self->_magicVersion, 8);
  objc_msgSend(v3, "appendBytes:length:", &self->_asbd, 40);
  objc_msgSend(v3, "appendBytes:length:", &self->_packetCount, 8);
  v13 = -[NSData length](self->_packetDescriptions, "length");
  objc_msgSend(v3, "appendBytes:length:", &v13, 8);
  objc_msgSend(v3, "appendData:", self->_packetDescriptions);
  v12 = -[NSData length](self->_audioData, "length");
  objc_msgSend(v3, "appendBytes:length:", &v12, 8);
  objc_msgSend(v3, "appendData:", self->_audioData);
  v11 = 0;
  timingInfos = self->_timingInfos;
  if (timingInfos)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", timingInfos, 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v5, "length");
    objc_msgSend(v3, "appendBytes:length:", &v11, 8);
    objc_msgSend(v3, "appendData:", v5);

  }
  else
  {
    objc_msgSend(v3, "appendBytes:length:", &v11, 8);
  }
  -[NSString dataUsingEncoding:](self->_voiceKey, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "length");
  objc_msgSend(v3, "appendBytes:length:", &v10, 8);
  if (v10)
    objc_msgSend(v3, "appendData:", v6);
  -[NSString dataUsingEncoding:](self->_voiceResourceKey, "dataUsingEncoding:", 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "length");
  objc_msgSend(v3, "appendBytes:length:", &v9, 8);
  if (v9)
    objc_msgSend(v3, "appendData:", v7);

  return v3;
}

- (VSSpeechCacheAudio)initWithKey:(id)a3 data:(id)a4
{
  id v7;
  id v8;
  VSSpeechCacheAudio *v9;
  VSSpeechCacheAudio *v10;
  uint64_t v11;
  NSData *packetDescriptions;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSData *audioData;
  uint64_t v17;
  VSAudioData *v18;
  VSAudioData *audio;
  __int128 v20;
  double v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSArray *timingInfos;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  NSString *voiceKey;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSString *voiceResourceKey;
  VSSpeechCacheAudio *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _OWORD v47[2];
  uint64_t v48;
  uint64_t v49;
  objc_super v50;
  uint8_t buf[8];
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v50.receiver = self;
  v50.super_class = (Class)VSSpeechCacheAudio;
  v9 = -[VSSpeechCacheAudio init](&v50, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    objc_msgSend(v8, "getBytes:range:", &v10->_magicVersion, 0, 8);
    if (v10->_magicVersion != 1869641269)
    {
      v38 = 0;
      goto LABEL_13;
    }
    objc_msgSend(v8, "getBytes:range:", &v10->_asbd, 8, 40);
    objc_msgSend(v8, "getBytes:range:", &v10->_packetCount, 48, 8);
    *(_QWORD *)buf = 0;
    objc_msgSend(v8, "getBytes:range:", buf, 56, 8);
    objc_msgSend(v8, "subdataWithRange:", 64, *(_QWORD *)buf);
    v11 = objc_claimAutoreleasedReturnValue();
    packetDescriptions = v10->_packetDescriptions;
    v10->_packetDescriptions = (NSData *)v11;

    v13 = *(_QWORD *)buf;
    v49 = 0;
    objc_msgSend(v8, "getBytes:range:", &v49, *(_QWORD *)buf + 64, 8);
    v14 = v13 + 72;
    objc_msgSend(v8, "subdataWithRange:", v14, v49);
    v15 = objc_claimAutoreleasedReturnValue();
    audioData = v10->_audioData;
    v10->_audioData = (NSData *)v15;

    v17 = v49;
    v18 = (VSAudioData *)objc_alloc_init(MEMORY[0x24BEC0D78]);
    audio = v10->_audio;
    v10->_audio = v18;

    v20 = *(_OWORD *)&v10->_asbd.mBytesPerPacket;
    v47[0] = *(_OWORD *)&v10->_asbd.mSampleRate;
    v47[1] = v20;
    v48 = *(_QWORD *)&v10->_asbd.mBitsPerChannel;
    -[VSAudioData setAsbd:](v10->_audio, "setAsbd:", v47);
    -[VSAudioData setAudioData:](v10->_audio, "setAudioData:", v10->_audioData);
    -[VSAudioData setPacketCount:](v10->_audio, "setPacketCount:", v10->_packetCount);
    -[VSAudioData setPacketDescriptions:](v10->_audio, "setPacketDescriptions:", v10->_packetDescriptions);
    -[VSAudioData duration](v10->_audio, "duration");
    if (v21 < 0.5)
    {
      v39 = (void *)MEMORY[0x24BDBCE88];
      v52 = *MEMORY[0x24BDD0FD8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("duration %.2f second"), *(_QWORD *)&v21);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = v40;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "exceptionWithName:reason:userInfo:", CFSTR("InvalidCache"), CFSTR("Audio duration too short"), v41);
      v42 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v42);
    }
    v46 = 0;
    objc_msgSend(v8, "getBytes:range:", &v46, v17 + v14, 8);
    v22 = v17 + v14 + 8;
    if (v46 >= 1)
    {
      objc_msgSend(v8, "subdataWithRange:", v17 + v14 + 8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x24BDBCF20];
      v25 = objc_opt_class();
      objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v26, v23, 0);
      v27 = objc_claimAutoreleasedReturnValue();
      timingInfos = v10->_timingInfos;
      v10->_timingInfos = (NSArray *)v27;

      v29 = v46;
      v22 += v29;
    }
    v45 = 0;
    objc_msgSend(v8, "getBytes:range:", &v45, v22, 8);
    v30 = v22 + 8;
    if (v45 >= 1)
    {
      objc_msgSend(v8, "subdataWithRange:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v31, 4);
      voiceKey = v10->_voiceKey;
      v10->_voiceKey = (NSString *)v32;

      v34 = v45;
      v30 += v34;
    }
    v44 = 0;
    objc_msgSend(v8, "getBytes:range:", &v44, v30, 8);
    if (v44 >= 1)
    {
      objc_msgSend(v8, "subdataWithRange:", v30 + 8);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v35, 4);
      voiceResourceKey = v10->_voiceResourceKey;
      v10->_voiceResourceKey = (NSString *)v36;

    }
  }
  v38 = v10;
LABEL_13:

  return v38;
}

- (VSSpeechCacheAudio)initWithKey:(id)a3 audio:(id)a4 wordTimingInfo:(id)a5 voiceKey:(id)a6 voiceResourceKey:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  VSSpeechCacheAudio *v17;
  VSSpeechCacheAudio *v18;
  uint64_t v19;
  NSData *audioData;
  uint64_t v21;
  NSData *packetDescriptions;
  id v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  objc_super v28;

  v24 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)VSSpeechCacheAudio;
  v17 = -[VSSpeechCacheAudio init](&v28, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_magicVersion = 1869641269;
    objc_storeStrong((id *)&v17->_key, a3);
    objc_storeStrong((id *)&v18->_audio, a4);
    if (v13)
    {
      objc_msgSend(v13, "asbd");
    }
    else
    {
      v27 = 0;
      v25 = 0u;
      v26 = 0u;
    }
    *(_OWORD *)&v18->_asbd.mSampleRate = v25;
    *(_OWORD *)&v18->_asbd.mBytesPerPacket = v26;
    *(_QWORD *)&v18->_asbd.mBitsPerChannel = v27;
    objc_msgSend(v13, "audioData");
    v19 = objc_claimAutoreleasedReturnValue();
    audioData = v18->_audioData;
    v18->_audioData = (NSData *)v19;

    v18->_packetCount = objc_msgSend(v13, "packetCount");
    objc_msgSend(v13, "packetDescriptions");
    v21 = objc_claimAutoreleasedReturnValue();
    packetDescriptions = v18->_packetDescriptions;
    v18->_packetDescriptions = (NSData *)v21;

    objc_storeStrong((id *)&v18->_timingInfos, a5);
    objc_storeStrong((id *)&v18->_voiceKey, a6);
    objc_storeStrong((id *)&v18->_voiceResourceKey, a7);
  }

  return v18;
}

- (int64_t)magicVersion
{
  return self->_magicVersion;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (NSArray)timingInfos
{
  return self->_timingInfos;
}

- (NSString)voiceKey
{
  return self->_voiceKey;
}

- (NSString)voiceResourceKey
{
  return self->_voiceResourceKey;
}

- (VSAudioData)audio
{
  return self->_audio;
}

- (NSData)audioData
{
  return self->_audioData;
}

- (void)setAudioData:(id)a3
{
  objc_storeStrong((id *)&self->_audioData, a3);
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

- (int64_t)packetCount
{
  return self->_packetCount;
}

- (void)setPacketCount:(int64_t)a3
{
  self->_packetCount = a3;
}

- (NSData)packetDescriptions
{
  return self->_packetDescriptions;
}

- (void)setPacketDescriptions:(id)a3
{
  objc_storeStrong((id *)&self->_packetDescriptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packetDescriptions, 0);
  objc_storeStrong((id *)&self->_audioData, 0);
  objc_storeStrong((id *)&self->_audio, 0);
  objc_storeStrong((id *)&self->_voiceResourceKey, 0);
  objc_storeStrong((id *)&self->_voiceKey, 0);
  objc_storeStrong((id *)&self->_timingInfos, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
