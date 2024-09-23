@implementation PMMPredictionNotification

- (PMMPredictionNotification)initWithPredictionUpdateListener:(id)a3
{
  id v4;
  PMMPredictionNotification *v5;
  void *v6;
  uint64_t v7;
  id notificationToken;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PMMPredictionNotification;
  v5 = -[PMMPredictionNotification init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __62__PMMPredictionNotification_initWithPredictionUpdateListener___block_invoke;
    v10[3] = &unk_24D971E38;
    v11 = v4;
    objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.proactive.ProactiveMagicalMoments.PMMPredictionNotification.updatePredictions"), 0, 0, v10);
    v7 = objc_claimAutoreleasedReturnValue();
    notificationToken = v5->_notificationToken;
    v5->_notificationToken = (id)v7;

  }
  return v5;
}

void __62__PMMPredictionNotification_initWithPredictionUpdateListener___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("predictions"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("consumer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unsignedIntegerValue");

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_notificationToken);

  v4.receiver = self;
  v4.super_class = (Class)PMMPredictionNotification;
  -[PMMPredictionNotification dealloc](&v4, sel_dealloc);
}

+ (void)postPredictionUpdate:(id)a3 consumer:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v10 = CFSTR("consumer");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (v5)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, CFSTR("predictions"));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("com.apple.proactive.ProactiveMagicalMoments.PMMPredictionNotification.updatePredictions"), 0, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationToken, 0);
}

@end
