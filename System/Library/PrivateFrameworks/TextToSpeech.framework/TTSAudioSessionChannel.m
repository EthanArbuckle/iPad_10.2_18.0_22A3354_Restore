@implementation TTSAudioSessionChannel

+ (id)channelWithChannel:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend_setChannel_(v4, v5, (uint64_t)v3, v6, v7);

  return v4;
}

+ (id)convertChannels:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint8_t v32;
  _BYTE v33[15];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = v3;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v34, (uint64_t)v38, 16);
  if (v11)
  {
    v16 = v11;
    v17 = *(_QWORD *)v35;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v9);
        v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v18);
        objc_msgSend_channel(v19, v12, v13, v14, v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_channel(v19, v21, v22, v23, v24);
        v25 = objc_claimAutoreleasedReturnValue();
        v29 = v25;
        if (v20)
        {
          objc_msgSend_addObject_(v8, v26, (uint64_t)v25, v27, v28);
LABEL_8:

          goto LABEL_10;
        }

        if (!v29)
        {
          AXTTSLogCommon();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            sub_1A3AB2434(&v32, v33, v29);
          goto LABEL_8;
        }
LABEL_10:
        ++v18;
      }
      while (v16 != v18);
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v34, (uint64_t)v38, 16);
      v16 = v30;
    }
    while (v30);
  }

  return v8;
}

- (TTSAudioSessionChannel)init
{
  TTSAudioSessionChannel *v2;
  TTSAudioSessionChannel *v3;
  TTSAudioSessionChannel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TTSAudioSessionChannel;
  v2 = -[TTSAudioSessionChannel init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_channelNumber = 0x7FFFFFFFFFFFFFFFLL;
    v2->_channelLabel = -1;
    v4 = v2;
  }

  return v3;
}

- (unsigned)channelLabel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;

  if (self->_channelLabel != -1)
    return self->_channelLabel;
  objc_msgSend_channel(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_channelLabel(v6, v7, v8, v9, v10);

  return v11;
}

- (unint64_t)channelNumber
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  if (self->_channelNumber != 0x7FFFFFFFFFFFFFFFLL)
    return self->_channelNumber;
  objc_msgSend_channel(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_channelNumber(v5, v6, v7, v8, v9);

  return v10;
}

- (NSString)channelName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString *channelName;
  NSString *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  channelName = self->_channelName;
  if (channelName)
  {
    v6 = channelName;
  }
  else
  {
    objc_msgSend_channel(self, a2, v2, v3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_channelName(v7, v8, v9, v10, v11);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSString)owningPortUID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString *owningPortUID;
  NSString *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  owningPortUID = self->_owningPortUID;
  if (owningPortUID)
  {
    v6 = owningPortUID;
  }
  else
  {
    objc_msgSend_channel(self, a2, v2, v3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_owningPortUID(v7, v8, v9, v10, v11);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char isEqual;
  unint64_t channelNumber;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self->_channelNumber == 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend_channelNumber(v4, v5, v6, v7, v8) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_channel(self, v5, v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_channel(v4, v10, v11, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v9, v15, (uint64_t)v14, v16, v17);

    }
    else
    {
      channelNumber = self->_channelNumber;
      isEqual = channelNumber == objc_msgSend_channelNumber(v4, v5, v6, v7, v8);
    }
  }
  else
  {
    isEqual = 0;
  }

  return isEqual;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend_setChannel_(self, a2, 0, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)TTSAudioSessionChannel;
  -[TTSAudioSessionChannel dealloc](&v5, sel_dealloc);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_channel(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v12, (uint64_t)CFSTR("TTSAudioSessionChannel -> %@"), v13, v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (AVAudioSessionChannelDescription)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_storeStrong((id *)&self->_channel, a3);
}

- (void)setChannelName:(id)a3
{
  objc_storeStrong((id *)&self->_channelName, a3);
}

- (void)setChannelNumber:(unint64_t)a3
{
  self->_channelNumber = a3;
}

- (void)setChannelLabel:(unsigned int)a3
{
  self->_channelLabel = a3;
}

- (void)setOwningPortUID:(id)a3
{
  objc_storeStrong((id *)&self->_owningPortUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owningPortUID, 0);
  objc_storeStrong((id *)&self->_channelName, 0);
  objc_storeStrong((id *)&self->_channel, 0);
}

@end
