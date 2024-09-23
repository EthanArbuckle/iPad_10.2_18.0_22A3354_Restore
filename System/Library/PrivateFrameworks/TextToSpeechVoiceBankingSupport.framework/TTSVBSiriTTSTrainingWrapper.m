@implementation TTSVBSiriTTSTrainingWrapper

+ (BOOL)isSiriTrainingAvailable
{
  void *v2;
  BOOL v3;

  +[TTSVBSiriTTSTrainingWrapper siriTTSTrainingBundle](TTSVBSiriTTSTrainingWrapper, "siriTTSTrainingBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (NSBundle)siriTTSTrainingBundle
{
  if (siriTTSTrainingBundle_onceToken != -1)
    dispatch_once(&siriTTSTrainingBundle_onceToken, &__block_literal_global);
  return (NSBundle *)(id)siriTTSTrainingBundle__SiriTTSTrainingBundle;
}

void __52__TTSVBSiriTTSTrainingWrapper_siriTTSTrainingBundle__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getSiriTTSTrainerTaskClass_softClass;
  v8 = getSiriTTSTrainerTaskClass_softClass;
  if (!getSiriTTSTrainerTaskClass_softClass)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __getSiriTTSTrainerTaskClass_block_invoke;
    v4[3] = &unk_25198E470;
    v4[4] = &v5;
    __getSiriTTSTrainerTaskClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  if (v1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", v1);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)siriTTSTrainingBundle__SiriTTSTrainingBundle;
    siriTTSTrainingBundle__SiriTTSTrainingBundle = v2;

  }
}

@end
