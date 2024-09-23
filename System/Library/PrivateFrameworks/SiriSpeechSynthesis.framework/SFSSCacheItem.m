@implementation SFSSCacheItem

- (SFSSCacheItem)initWithText:(id)a3 voiceName:(id)a4 voiceKey:(id)a5 resourceKey:(id)a6 asbd:(AudioStreamBasicDescription *)a7 rawAudio:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  SFSSCacheItem *v19;
  uint64_t v20;
  NSString *text;
  uint64_t v22;
  NSString *voiceKey;
  uint64_t v24;
  NSString *resourceKey;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  NSString *key;
  objc_super v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)SFSSCacheItem;
  v19 = -[SFSSCacheItem init](&v31, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    text = v19->_text;
    v19->_text = (NSString *)v20;

    v22 = objc_msgSend(v16, "copy");
    voiceKey = v19->_voiceKey;
    v19->_voiceKey = (NSString *)v22;

    v24 = objc_msgSend(v17, "copy");
    resourceKey = v19->_resourceKey;
    v19->_resourceKey = (NSString *)v24;

    v26 = *(_OWORD *)&a7->mSampleRate;
    v27 = *(_OWORD *)&a7->mBytesPerPacket;
    *(_QWORD *)&v19->_asbd.mBitsPerChannel = *(_QWORD *)&a7->mBitsPerChannel;
    *(_OWORD *)&v19->_asbd.mSampleRate = v26;
    *(_OWORD *)&v19->_asbd.mBytesPerPacket = v27;
    objc_storeStrong((id *)&v19->_rawAudio, a8);
    +[SFSSCacheItem generateCacheKey:text:](SFSSCacheItem, "generateCacheKey:text:", v15, v19->_text);
    v28 = objc_claimAutoreleasedReturnValue();
    key = v19->_key;
    v19->_key = (NSString *)v28;

  }
  return v19;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)voiceKey
{
  return self->_voiceKey;
}

- (NSString)resourceKey
{
  return self->_resourceKey;
}

- (AudioStreamBasicDescription)asbd
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[2].mSampleRate;
  return self;
}

- (NSArray)rawAudio
{
  return self->_rawAudio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawAudio, 0);
  objc_storeStrong((id *)&self->_resourceKey, 0);
  objc_storeStrong((id *)&self->_voiceKey, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)generateCacheKey:(id)a3 text:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(":"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
