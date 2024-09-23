@implementation SASSpeechRecognized(SiriUIFoundationAdditions)

- (uint64_t)sruif_isUtterance
{
  return 1;
}

- (uint64_t)sruif_isUserUtterance
{
  return 1;
}

- (uint64_t)sruif_waitsForConfirmation
{
  return 1;
}

- (void)sruif_setRecognitionWithCorrectedSpeech:()SiriUIFoundationAdditions
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BE81610];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setText:", v5);

  v7 = objc_alloc_init(MEMORY[0x24BE81570]);
  v15[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTokens:", v8);

  v9 = objc_alloc_init(MEMORY[0x24BE81580]);
  v14 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInterpretations:", v10);

  v11 = objc_alloc_init(MEMORY[0x24BE81588]);
  v13 = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPhrases:", v12);

  objc_msgSend(a1, "setRecognition:", v11);
}

@end
