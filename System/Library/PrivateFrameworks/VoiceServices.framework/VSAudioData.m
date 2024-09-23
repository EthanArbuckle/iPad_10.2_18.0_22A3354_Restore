@implementation VSAudioData

- (VSAudioData)init
{
  VSAudioData *v2;
  uint64_t v3;
  NSMutableData *mutableAudioData;
  uint64_t v5;
  NSMutableData *mutableDescription;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSAudioData;
  v2 = -[VSAudioData init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v3 = objc_claimAutoreleasedReturnValue();
    mutableAudioData = v2->_mutableAudioData;
    v2->_mutableAudioData = (NSMutableData *)v3;

    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v5 = objc_claimAutoreleasedReturnValue();
    mutableDescription = v2->_mutableDescription;
    v2->_mutableDescription = (NSMutableData *)v5;

  }
  return v2;
}

- (double)duration
{
  unint64_t v3;
  double v4;
  void *v5;
  double v6;
  unint64_t v7;
  double v8;
  unint64_t v9;
  double v10;
  double v12;
  int v13;
  double v14;
  int v15;
  int v16;
  double v17;
  int v18;
  double v19;
  int v20;

  -[VSAudioData asbd](self, "asbd");
  if (v20 == 1819304813)
  {
    -[VSAudioData asbd](self, "asbd");
    -[VSAudioData asbd](self, "asbd");
    LODWORD(v3) = v18;
    v4 = 0.0;
    if (v19 * (double)v3 != 0.0)
    {
      -[VSAudioData audioData](self, "audioData");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (double)(unint64_t)objc_msgSend(v5, "length");
      -[VSAudioData asbd](self, "asbd");
      -[VSAudioData asbd](self, "asbd");
      LODWORD(v7) = v16;
      v4 = v6 / (v17 * (double)v7);

    }
  }
  else
  {
    -[VSAudioData asbd](self, "asbd");
    v4 = 0.0;
    if (v15 == 1869641075)
    {
      -[VSAudioData asbd](self, "asbd");
      if (v14 != 0.0)
      {
        v8 = (double)-[VSAudioData packetCount](self, "packetCount", v14);
        -[VSAudioData asbd](self, "asbd");
        LODWORD(v9) = v13;
        v10 = v8 * (double)v9;
        -[VSAudioData asbd](self, "asbd");
        return v10 / v12;
      }
    }
  }
  return v4;
}

- (unsigned)totalFrames
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v8;
  int v9;
  unsigned int v10;
  int v11;

  -[VSAudioData asbd](self, "asbd");
  if (v11 == 1819304813)
  {
    -[VSAudioData audioData](self, "audioData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");
    -[VSAudioData asbd](self, "asbd");
    v5 = v4 / v10;

  }
  else
  {
    -[VSAudioData asbd](self, "asbd");
    if (v9 == 1869641075)
    {
      v6 = -[VSAudioData packetCount](self, "packetCount");
      -[VSAudioData asbd](self, "asbd");
      return v8 * v6;
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VSAudioData *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v10[2];
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v4 = -[VSAudioData init](+[VSAudioData allocWithZone:](VSAudioData, "allocWithZone:", a3), "init");
  if (v4)
  {
    -[VSAudioData asbd](self, "asbd");
    v10[0] = v12;
    v10[1] = v13;
    v11 = v14;
    -[VSAudioData setAsbd:](v4, "setAsbd:", v10);
    -[VSAudioData audioData](self, "audioData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    -[VSAudioData setAudioData:](v4, "setAudioData:", v6);

    -[VSAudioData setPacketCount:](v4, "setPacketCount:", -[VSAudioData packetCount](self, "packetCount"));
    -[VSAudioData packetDescriptions](self, "packetDescriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    -[VSAudioData setPacketDescriptions:](v4, "setPacketDescriptions:", v8);

  }
  return v4;
}

- (void)concatenateWithAudio:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  _OWORD v17[2];
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  int v22;

  v4 = a3;
  -[VSAudioData asbd](self, "asbd");
  if (!v22)
  {
    if (v4)
    {
      objc_msgSend(v4, "asbd");
    }
    else
    {
      v21 = 0;
      v19 = 0u;
      v20 = 0u;
    }
    v17[0] = v19;
    v17[1] = v20;
    v18 = v21;
    -[VSAudioData setAsbd:](self, "setAsbd:", v17);
  }
  -[VSAudioData audioData](self, "audioData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  v7 = -[VSAudioData packetCount](self, "packetCount");
  -[VSAudioData mutableAudioData](self, "mutableAudioData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendData:", v9);

  -[VSAudioData setPacketCount:](self, "setPacketCount:", -[VSAudioData packetCount](self, "packetCount") + objc_msgSend(v4, "packetCount"));
  -[VSAudioData mutableDescription](self, "mutableDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "packetDescriptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendData:", v11);

  -[VSAudioData mutableDescription](self, "mutableDescription");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "mutableBytes");

  if (v7 < -[VSAudioData packetCount](self, "packetCount"))
  {
    v14 = 16 * v7;
    do
    {
      -[VSAudioData mutableDescription](self, "mutableDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");

      if (v14 >= v16)
        break;
      *(_QWORD *)(v13 + v14) += v6;
      ++v7;
      v14 += 16;
    }
    while (v7 < -[VSAudioData packetCount](self, "packetCount"));
  }

}

- (void)setAudioData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSAudioData mutableAudioData](self, "mutableAudioData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setData:", v4);

}

- (void)setPacketDescriptions:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSAudioData mutableDescription](self, "mutableDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setData:", v4);

}

- (void)encodeWithCoder:(id)a3
{
  NSMutableData *mutableAudioData;
  id v5;

  mutableAudioData = self->_mutableAudioData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mutableAudioData, CFSTR("audioData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mutableDescription, CFSTR("packetDescription"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_packetCount, CFSTR("packetCount"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_asbd, 40, CFSTR("asbd"));

}

- (VSAudioData)initWithCoder:(id)a3
{
  id v4;
  VSAudioData *v5;
  void *v6;
  uint64_t v7;
  NSMutableData *mutableAudioData;
  void *v9;
  uint64_t v10;
  NSMutableData *mutableDescription;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VSAudioData;
  v5 = -[VSAudioData init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");
    mutableAudioData = v5->_mutableAudioData;
    v5->_mutableAudioData = (NSMutableData *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("packetDescription"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mutableCopy");
    mutableDescription = v5->_mutableDescription;
    v5->_mutableDescription = (NSMutableData *)v10;

    v5->_packetCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("packetCount"));
    v12 = objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("asbd"), 0);
    v13 = *(_QWORD *)(v12 + 32);
    v14 = *(_OWORD *)(v12 + 16);
    *(_OWORD *)&v5->_asbd.mSampleRate = *(_OWORD *)v12;
    *(_OWORD *)&v5->_asbd.mBytesPerPacket = v14;
    *(_QWORD *)&v5->_asbd.mBitsPerChannel = v13;
  }

  return v5;
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

- (int64_t)packetCount
{
  return self->_packetCount;
}

- (void)setPacketCount:(int64_t)a3
{
  self->_packetCount = a3;
}

- (NSMutableData)mutableAudioData
{
  return self->_mutableAudioData;
}

- (void)setMutableAudioData:(id)a3
{
  objc_storeStrong((id *)&self->_mutableAudioData, a3);
}

- (NSMutableData)mutableDescription
{
  return self->_mutableDescription;
}

- (void)setMutableDescription:(id)a3
{
  objc_storeStrong((id *)&self->_mutableDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableDescription, 0);
  objc_storeStrong((id *)&self->_mutableAudioData, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
