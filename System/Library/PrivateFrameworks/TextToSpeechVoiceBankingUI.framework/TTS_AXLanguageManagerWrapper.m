@implementation TTS_AXLanguageManagerWrapper

+ (id)dialectForLanguageId:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  TTS_AXDialectMapWrapper *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v4 = (void *)getAXLanguageManagerClass_softClass;
  v14 = getAXLanguageManagerClass_softClass;
  if (!getAXLanguageManagerClass_softClass)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getAXLanguageManagerClass_block_invoke;
    v10[3] = &unk_25199F008;
    v10[4] = &v11;
    __getAXLanguageManagerClass_block_invoke((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v5, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dialectForLanguageID:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[TTS_AXDialectMapWrapper initWithDialectMap:]([TTS_AXDialectMapWrapper alloc], "initWithDialectMap:", v7);
  return v8;
}

@end
