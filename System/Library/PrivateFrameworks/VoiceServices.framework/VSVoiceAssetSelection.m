@implementation VSVoiceAssetSelection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voicePath, 0);
  objc_storeStrong((id *)&self->_builtInVoicePath, 0);
  objc_storeStrong((id *)&self->_trialVoice, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_voiceData, 0);
}

- (VSVoiceAsset)voiceData
{
  return (VSVoiceAsset *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isInstalled
{
  void *v3;
  void *v4;
  BOOL v5;

  -[VSVoiceAssetSelection asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[VSVoiceAssetSelection asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_msgSend(v4, "wasLocal") & 1) != 0 || self->_voicePath != 0;

  }
  else
  {
    v5 = self->_voicePath != 0;
  }

  return v5;
}

- (MAAsset)asset
{
  return (MAAsset *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVoiceData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void)setAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (VSVoiceAssetSelection)init
{
  VSVoiceAssetSelection *v2;
  VSVoiceAssetSelection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSVoiceAssetSelection;
  v2 = -[VSVoiceAssetSelection init](&v5, sel_init);
  v3 = v2;
  if (v2)
    pthread_mutex_init(&v2->_voicePathLock, 0);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_voicePathLock);
  v3.receiver = self;
  v3.super_class = (Class)VSVoiceAssetSelection;
  -[VSVoiceAssetSelection dealloc](&v3, sel_dealloc);
}

- (VSVoiceAssetSelection)initWithTrialVoice:(id)a3
{
  id v5;
  VSVoiceAssetSelection *v6;
  VSVoiceAssetSelection *v7;
  VSVoiceAsset *v8;
  VSVoiceAsset *voiceData;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *voicePath;
  uint64_t v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[VSVoiceAssetSelection init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_trialVoice, a3);
    v8 = objc_alloc_init(VSVoiceAsset);
    voiceData = v7->_voiceData;
    v7->_voiceData = v8;

    -[VSAssetBase setStorage:](v7->_voiceData, "setStorage:", 3);
    objc_msgSend(v5, "language");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v5, "language");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSVoiceAsset setLanguages:](v7->_voiceData, "setLanguages:", v12);

    }
    else
    {
      -[VSVoiceAsset setLanguages:](v7->_voiceData, "setLanguages:", MEMORY[0x1E0C9AA60]);
    }

    objc_msgSend(v5, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSVoiceAsset setName:](v7->_voiceData, "setName:", v13);

    -[VSVoiceAsset setType:](v7->_voiceData, "setType:", objc_msgSend(v5, "type"));
    -[VSVoiceAsset setFootprint:](v7->_voiceData, "setFootprint:", objc_msgSend(v5, "footprint"));
    -[VSVoiceAsset setGender:](v7->_voiceData, "setGender:", objc_msgSend(v5, "gender"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "version"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSAssetBase setContentVersion:](v7->_voiceData, "setContentVersion:", v14);

    if (objc_msgSend(v5, "compatibilityVersion"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "compatibilityVersion"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSAssetBase setCompatibilityVersion:](v7->_voiceData, "setCompatibilityVersion:", v15);

    }
    else
    {
      -[VSAssetBase setCompatibilityVersion:](v7->_voiceData, "setCompatibilityVersion:", 0);
    }
    -[VSVoiceAsset setIsInstalled:](v7->_voiceData, "setIsInstalled:", objc_msgSend(v5, "isLocal"));
    -[VSAssetBase setIsPurgeable:](v7->_voiceData, "setIsPurgeable:", 1);
    -[VSVoiceAsset setIsBuiltInVoice:](v7->_voiceData, "setIsBuiltInVoice:", 0);
    if (objc_msgSend(v5, "assetSize"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "assetSize"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSAssetBase setDownloadSize:](v7->_voiceData, "setDownloadSize:", v16);

    }
    else
    {
      -[VSAssetBase setDownloadSize:](v7->_voiceData, "setDownloadSize:", 0);
    }
    objc_msgSend(v5, "path");
    v17 = objc_claimAutoreleasedReturnValue();
    voicePath = v7->_voicePath;
    v7->_voicePath = (NSString *)v17;

    if (objc_msgSend(v5, "type") == 4)
    {
      v19 = (uint64_t)v7->_voicePath;
      if (v19)
        v19 = +[VSNeuralTTSUtils isNeuralVoiceReady:](VSNeuralTTSUtils, "isNeuralVoiceReady:");
    }
    else
    {
      v19 = 1;
    }
    -[VSVoiceAsset setIsVoiceReadyToUse:](v7->_voiceData, "setIsVoiceReadyToUse:", v19);
  }

  return v7;
}

- (id)key
{
  void *v2;
  void *v3;

  -[VSVoiceAssetSelection voiceData](self, "voiceData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "voiceKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)descriptiveKey
{
  void *v2;
  void *v3;

  -[VSVoiceAssetSelection voiceData](self, "voiceData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptiveKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)voicePath
{
  _opaque_pthread_mutex_t *p_voicePathLock;
  NSString **p_voicePath;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSString *builtInVoicePath;
  NSString *v19;

  p_voicePathLock = &self->_voicePathLock;
  pthread_mutex_lock(&self->_voicePathLock);
  p_voicePath = &self->_voicePath;
  if (!self->_voicePath)
  {
    -[VSVoiceAssetSelection asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[VSVoiceAssetSelection asset](self, "asset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "getLocalUrl");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "path");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        -[VSVoiceAssetSelection voiceData](self, "voiceData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "languages");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.tmp"), v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByAppendingPathComponent:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14
          || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v16 = objc_msgSend(v15, "fileExistsAtPath:", v14),
              v15,
              v17 = v14,
              (v16 & 1) == 0))
        {
          v17 = v8;
        }
        objc_storeStrong((id *)p_voicePath, v17);

      }
      goto LABEL_10;
    }
    builtInVoicePath = self->_builtInVoicePath;
    if (builtInVoicePath)
    {
      v19 = builtInVoicePath;
      v8 = *p_voicePath;
      *p_voicePath = v19;
LABEL_10:

    }
  }
  pthread_mutex_unlock(p_voicePathLock);
  return *p_voicePath;
}

- (unint64_t)size
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v9;

  -[VSVoiceAssetSelection asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D4DF10]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if ((v7 & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VSMobileAssetsManager.m"), 211, CFSTR("negative size"));

  }
  return v7;
}

- (BOOL)isDownloading
{
  void *v3;
  void *v4;
  BOOL v5;

  -[VSVoiceAssetSelection asset](self, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[VSVoiceAssetSelection asset](self, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "state") == 4;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)preferenceScore
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  float v15;
  double v16;

  -[VSVoiceAssetSelection voiceData](self, "voiceData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "type");

  switch(v4)
  {
    case 1:
      v5 = 1000.0;
      break;
    case 2:
      v5 = 2000.0;
      break;
    case 3:
      v5 = 3000.0;
      break;
    case 4:
      -[VSVoiceAssetSelection voiceData](self, "voiceData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isVoiceReadyToUse");

      if (v7)
        v5 = 4000.0;
      else
        v5 = 0.0;
      break;
    default:
      v5 = 0.0;
      break;
  }
  -[VSVoiceAssetSelection voiceData](self, "voiceData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "footprint");

  if (v9 == 3)
  {
    v10 = 300.0;
    v12 = v5 + 300.0;
  }
  else
  {
    v10 = v5 + 200.0;
    v11 = v5 + 100.0;
    if (v9 != 1)
      v11 = v5;
    if (v9 == 2)
      v12 = v5 + 200.0;
    else
      v12 = v11;
  }
  -[VSVoiceAssetSelection voiceData](self, "voiceData", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contentVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v12 + v15 / 2147483650.0;

  return v16;
}

- (VSTrialVoice)trialVoice
{
  return (VSTrialVoice *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTrialVoice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)builtInVoicePath
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBuiltInVoicePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setVoicePath:(id)a3
{
  objc_storeStrong((id *)&self->_voicePath, a3);
}

- (_opaque_pthread_mutex_t)voicePathLock
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[1].__sig;
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self->__opaque[40];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  v4 = *(_OWORD *)&self[1].__opaque[24];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[1].__opaque[8];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setVoicePathLock:(_opaque_pthread_mutex_t *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->__sig;
  v4 = *(_OWORD *)&a3->__opaque[8];
  v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_voicePathLock.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_voicePathLock.__opaque[40] = v5;
  *(_OWORD *)&self->_voicePathLock.__sig = v3;
  *(_OWORD *)&self->_voicePathLock.__opaque[8] = v4;
}

@end
