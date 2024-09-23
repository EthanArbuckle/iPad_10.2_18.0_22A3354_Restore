@implementation VSPresynthesizedAudioRequest

- (VSPresynthesizedAudioRequest)init
{

  return 0;
}

- (VSPresynthesizedAudioRequest)initWithAudioData:(id)a3 playerStreamDescription:(AudioStreamBasicDescription *)a4
{
  id v7;
  VSPresynthesizedAudioRequest *v8;
  VSPresynthesizedAudioRequest *v9;
  __int128 v10;
  __int128 v11;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSPresynthesizedAudioRequest;
  v8 = -[VSPresynthesizedAudioRequest init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_audioData, a3);
    *(_QWORD *)&v9->_decoderStreamDescription.mBitsPerChannel = 0;
    *(_OWORD *)&v9->_decoderStreamDescription.mSampleRate = VSAudioFormat48khzOpus;
    *(_OWORD *)&v9->_decoderStreamDescription.mBytesPerPacket = unk_1DE1A18C8;
    v11 = *(_OWORD *)&a4->mSampleRate;
    v10 = *(_OWORD *)&a4->mBytesPerPacket;
    *(_QWORD *)&v9->_playerStreamDescription.mBitsPerChannel = *(_QWORD *)&a4->mBitsPerChannel;
    *(_OWORD *)&v9->_playerStreamDescription.mSampleRate = v11;
    *(_OWORD *)&v9->_playerStreamDescription.mBytesPerPacket = v10;
  }

  return v9;
}

- (VSPresynthesizedAudioRequest)initWithAudioData:(id)a3 decoderStreamDescription:(AudioStreamBasicDescription *)a4 playerStreamDescription:(AudioStreamBasicDescription *)a5
{
  id v9;
  VSPresynthesizedAudioRequest *v10;
  VSPresynthesizedAudioRequest *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v17;

  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VSPresynthesizedAudioRequest;
  v10 = -[VSPresynthesizedAudioRequest init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_audioData, a3);
    v12 = *(_OWORD *)&a4->mSampleRate;
    v13 = *(_OWORD *)&a4->mBytesPerPacket;
    *(_QWORD *)&v11->_decoderStreamDescription.mBitsPerChannel = *(_QWORD *)&a4->mBitsPerChannel;
    *(_OWORD *)&v11->_decoderStreamDescription.mBytesPerPacket = v13;
    *(_OWORD *)&v11->_decoderStreamDescription.mSampleRate = v12;
    v14 = *(_OWORD *)&a5->mSampleRate;
    v15 = *(_OWORD *)&a5->mBytesPerPacket;
    *(_QWORD *)&v11->_playerStreamDescription.mBitsPerChannel = *(_QWORD *)&a5->mBitsPerChannel;
    *(_OWORD *)&v11->_playerStreamDescription.mSampleRate = v14;
    *(_OWORD *)&v11->_playerStreamDescription.mBytesPerPacket = v15;
  }

  return v11;
}

- (VSPresynthesizedAudioRequest)initWithIdentifier:(id)a3
{
  id v5;
  VSPresynthesizedAudioRequest *v6;
  VSPresynthesizedAudioRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSPresynthesizedAudioRequest;
  v6 = -[VSPresynthesizedAudioRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (id)logText
{
  return VSLoggingStringForUtterance(self->_text, -[VSPresynthesizedAudioRequest canLogRequestText](self, "canLogRequestText"));
}

- (BOOL)hasValidAudio
{
  NSData *audioData;
  AudioFormatID mFormatID;

  audioData = self->_audioData;
  if (audioData)
  {
    audioData = -[NSData length](audioData, "length");
    if (audioData)
    {
      mFormatID = self->_decoderStreamDescription.mFormatID;
      LOBYTE(audioData) = (mFormatID == 1869641075 || mFormatID == 1819304813)
                       && self->_playerStreamDescription.mFormatID == 1819304813;
    }
  }
  return (char)audioData;
}

- (void)setAccessoryID:(id)a3
{
  NSUUID *v4;
  NSUUID *accessoryID;

  if (a3)
    self->_enqueue = 1;
  v4 = (NSUUID *)objc_msgSend(a3, "copy");
  accessoryID = self->_accessoryID;
  self->_accessoryID = v4;

}

- (void)encodeWithCoder:(id)a3
{
  AudioStreamBasicDescription *p_decoderStreamDescription;
  id v5;

  p_decoderStreamDescription = &self->_decoderStreamDescription;
  v5 = a3;
  objc_msgSend(v5, "encodeValueOfObjCType:at:", "{AudioStreamBasicDescription=dIIIIIIII}", p_decoderStreamDescription);
  objc_msgSend(v5, "encodeValueOfObjCType:at:", "{AudioStreamBasicDescription=dIIIIIIII}", &self->_playerStreamDescription);
  objc_msgSend(v5, "encodeObject:forKey:", self->_audioData, CFSTR("_audioData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientBundleIdentifier, CFSTR("_clientBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_text, CFSTR("_text"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryID, CFSTR("_accessoryID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_siriRequestId, CFSTR("_siriRequestId"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_audioSessionID, CFSTR("_audioSessionID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enqueue, CFSTR("_enqueue"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_requestCreatedTimestamp, CFSTR("_requestCreatedTimestamp"));

}

- (VSPresynthesizedAudioRequest)initWithCoder:(id)a3
{
  id v4;
  VSPresynthesizedAudioRequest *v5;
  VSPresynthesizedAudioRequest *v6;
  uint64_t v7;
  NSData *audioData;
  uint64_t v9;
  NSString *clientBundleIdentifier;
  uint64_t v11;
  NSString *text;
  uint64_t v13;
  NSString *identifier;
  uint64_t v15;
  NSUUID *accessoryID;
  uint64_t v17;
  NSUUID *siriRequestId;
  _OWORD v20[2];
  uint64_t v21;
  _OWORD v22[2];
  uint64_t v23;

  v4 = a3;
  v22[0] = VSAudioFormat48khzOpus;
  v22[1] = unk_1DE1A18C8;
  v23 = 0;
  v20[0] = VSAudioFormat48khzPCM;
  v20[1] = unk_1DE1A1878;
  v21 = 16;
  v5 = -[VSPresynthesizedAudioRequest initWithAudioData:decoderStreamDescription:playerStreamDescription:](self, "initWithAudioData:decoderStreamDescription:playerStreamDescription:", 0, v22, v20);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v4, "decodeValueOfObjCType:at:size:", "{AudioStreamBasicDescription=dIIIIIIII}", &v5->_decoderStreamDescription, 40);
    objc_msgSend(v4, "decodeValueOfObjCType:at:size:", "{AudioStreamBasicDescription=dIIIIIIII}", &v6->_playerStreamDescription, 40);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_audioData"));
    v7 = objc_claimAutoreleasedReturnValue();
    audioData = v6->_audioData;
    v6->_audioData = (NSData *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientBundleIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    clientBundleIdentifier = v6->_clientBundleIdentifier;
    v6->_clientBundleIdentifier = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_text"));
    v11 = objc_claimAutoreleasedReturnValue();
    text = v6->_text;
    v6->_text = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accessoryID"));
    v15 = objc_claimAutoreleasedReturnValue();
    accessoryID = v6->_accessoryID;
    v6->_accessoryID = (NSUUID *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_siriRequestId"));
    v17 = objc_claimAutoreleasedReturnValue();
    siriRequestId = v6->_siriRequestId;
    v6->_siriRequestId = (NSUUID *)v17;

    v6->_audioSessionID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_audioSessionID"));
    v6->_enqueue = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_enqueue"));
    v6->_requestCreatedTimestamp = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_requestCreatedTimestamp"));
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VSPresynthesizedAudioRequest *v4;
  NSData *audioData;
  __int128 v6;
  __int128 v7;
  _OWORD v9[2];
  uint64_t v10;
  _OWORD v11[2];
  uint64_t v12;

  v4 = [VSPresynthesizedAudioRequest alloc];
  audioData = self->_audioData;
  v6 = *(_OWORD *)&self->_decoderStreamDescription.mBytesPerPacket;
  v11[0] = *(_OWORD *)&self->_decoderStreamDescription.mSampleRate;
  v11[1] = v6;
  v12 = *(_QWORD *)&self->_decoderStreamDescription.mBitsPerChannel;
  v7 = *(_OWORD *)&self->_playerStreamDescription.mBytesPerPacket;
  v9[0] = *(_OWORD *)&self->_playerStreamDescription.mSampleRate;
  v9[1] = v7;
  v10 = *(_QWORD *)&self->_playerStreamDescription.mBitsPerChannel;
  return -[VSPresynthesizedAudioRequest initWithAudioData:decoderStreamDescription:playerStreamDescription:](v4, "initWithAudioData:decoderStreamDescription:playerStreamDescription:", audioData, v11, v9);
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *clientBundleIdentifier;
  uint64_t audioSessionID;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_decoderStreamDescription.mFormatID == 1869641075)
    v4 = CFSTR("Opus");
  else
    v4 = CFSTR("PCM");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_decoderStreamDescription.mSampleRate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@kHz"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_playerStreamDescription.mSampleRate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("PCM%@KHz"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3940];
  clientBundleIdentifier = self->_clientBundleIdentifier;
  audioSessionID = self->_audioSessionID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSData length](self->_audioData, "length"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_requestCreatedTimestamp);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSPresynthesizedAudioRequest logText](self, "logText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("sessionId %u, clientId %@, %@ bytes, input format %@, output format %@, requestCreatedTime %@, text '%@', identifier: %@, accessoryID:%@"), audioSessionID, clientBundleIdentifier, v13, v6, v9, v14, v15, self->_identifier, self->_accessoryID);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (BOOL)canLogRequestText
{
  return 1;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (NSData)audioData
{
  return self->_audioData;
}

- (AudioStreamBasicDescription)decoderStreamDescription
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[2].mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[3].mSampleRate;
  return self;
}

- (AudioStreamBasicDescription)playerStreamDescription
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[3].mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[4].mSampleRate;
  return self;
}

- (BOOL)enqueue
{
  return self->_enqueue;
}

- (void)setEnqueue:(BOOL)a3
{
  self->_enqueue = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSUUID)siriRequestId
{
  return self->_siriRequestId;
}

- (void)setSiriRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_siriRequestId, a3);
}

- (unint64_t)requestCreatedTimestamp
{
  return self->_requestCreatedTimestamp;
}

- (void)setRequestCreatedTimestamp:(unint64_t)a3
{
  self->_requestCreatedTimestamp = a3;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void)setClientBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSUUID)accessoryID
{
  return self->_accessoryID;
}

- (unint64_t)pcmDataSize
{
  return self->_pcmDataSize;
}

- (void)setPcmDataSize:(unint64_t)a3
{
  self->_pcmDataSize = a3;
}

- (id)stopHandler
{
  return self->_stopHandler;
}

- (void)setStopHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopHandler, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_siriRequestId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_audioData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
