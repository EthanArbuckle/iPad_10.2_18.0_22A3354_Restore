@implementation SVXSoundUtils

- (SVXSoundUtils)init
{
  SVXSpeechSynthesisUtils *v3;
  void *v4;
  void *v5;
  SVXSoundUtils *v6;

  v3 = objc_alloc_init(SVXSpeechSynthesisUtils);
  +[SVXBundleUtils sharedInstance](SVXBundleUtils, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getSiriVOXFramework");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SVXSoundUtils initWithSpeechSynthesisUtils:resourceURLSupplier:](self, "initWithSpeechSynthesisUtils:resourceURLSupplier:", v3, v5);

  return v6;
}

- (SVXSoundUtils)initWithSpeechSynthesisUtils:(id)a3 resourceURLSupplier:(id)a4
{
  id v7;
  id v8;
  SVXSoundUtils *v9;
  SVXSoundUtils *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SVXSoundUtils;
  v9 = -[SVXSoundUtils init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_speechSynthesisUtils, a3);
    objc_storeStrong((id *)&v10->_resourceURLSupplier, a4);
  }

  return v10;
}

- (int64_t)getIDFromAudioPlaybackRequest:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("_SVXSoundID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  if (v5 <= 6)
    return v5;
  else
    return 0;
}

- (id)createAudioPlaybackRequestFromID:(int64_t)a3 preferences:(id)a4
{
  id v6;
  SVXResourceURLSupplier *resourceURLSupplier;
  __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  int64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;

  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[SVXSoundUtils createAudioPlaybackRequestFromID:preferences:]");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("SVXSoundUtils.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferences != nil"));

  }
  switch(a3)
  {
    case 1:
    case 3:
      resourceURLSupplier = self->_resourceURLSupplier;
      v8 = CFSTR("SiriSummon-b238.wav");
      goto LABEL_7;
    case 2:
      resourceURLSupplier = self->_resourceURLSupplier;
      v8 = CFSTR("SessionInactive-b238.wav");
      goto LABEL_7;
    case 4:
    case 5:
      resourceURLSupplier = self->_resourceURLSupplier;
      v8 = CFSTR("DeviceSetup-b238.wav");
LABEL_7:
      -[__CFString stringByDeletingPathExtension](v8, "stringByDeletingPathExtension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString pathExtension](v8, "pathExtension");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[SVXResourceURLSupplier URLForResource:withExtension:](resourceURLSupplier, "URLForResource:withExtension:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 6:
      -[SVXSpeechSynthesisUtils getOutputVoiceInfoWithAllowsFallback:preferences:](self->_speechSynthesisUtils, "getOutputVoiceInfoWithAllowsFallback:preferences:", 1, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(v9, "languageCode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v9, "gender");
      v19 = CFSTR("Female");
      if (v18 == 1)
        v19 = CFSTR("Male");
      v20 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("%@-%@-%@"), CFSTR("Phatic"), v17, v19);

      v21 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[SVXResourceURLSupplier URLsForResourcesWithExtension:subdirectory:](self->_resourceURLSupplier, "URLsForResourcesWithExtension:subdirectory:", CFSTR("wav"), 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __62__SVXSoundUtils_createAudioPlaybackRequestFromID_preferences___block_invoke;
      v30[3] = &unk_24D24D190;
      v31 = v20;
      v10 = v21;
      v32 = v10;
      v23 = v20;
      objc_msgSend(v22, "enumerateObjectsUsingBlock:", v30);

      v24 = objc_msgSend(v10, "count");
      if (v24)
      {
        objc_msgSend(v10, "objectAtIndex:", arc4random_uniform(v24));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }

LABEL_8:
      if (!v11)
        goto LABEL_10;
      v12 = objc_alloc(MEMORY[0x24BE090F0]);
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __62__SVXSoundUtils_createAudioPlaybackRequestFromID_preferences___block_invoke_2;
      v27[3] = &unk_24D24D1B8;
      v28 = v11;
      v29 = a3;
      v13 = v11;
      v14 = (void *)objc_msgSend(v12, "initWithBuilder:", v27);

      break;
    default:
LABEL_10:
      v14 = 0;
      break;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceURLSupplier, 0);
  objc_storeStrong((id *)&self->_speechSynthesisUtils, 0);
}

void __62__SVXSoundUtils_createAudioPlaybackRequestFromID_preferences___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32));

  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

void __62__SVXSoundUtils_createAudioPlaybackRequestFromID_preferences___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  double v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setItemURL:", v3);
  objc_msgSend(v4, "setNumberOfLoops:", 0);
  LODWORD(v5) = 1.0;
  objc_msgSend(v4, "setVolume:", v5);
  objc_msgSend(v4, "setFadeInDuration:", 0.0);
  objc_msgSend(v4, "setFadeOutDuration:", 0.0);
  v8 = CFSTR("_SVXSoundID");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInfo:", v7);

}

@end
