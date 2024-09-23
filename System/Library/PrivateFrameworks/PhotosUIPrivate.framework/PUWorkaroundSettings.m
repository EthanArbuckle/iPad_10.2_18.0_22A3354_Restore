@implementation PUWorkaroundSettings

- (void)setShouldWorkAround54502886:(BOOL)a3
{
  self->_shouldWorkAround54502886 = a3;
}

- (void)setDefaultValues
{
  -[PUWorkaroundSettings setAddRemoveVideoLayer:](self, "setAddRemoveVideoLayer:", 1);
  -[PUWorkaroundSettings setShouldWorkAround54502886:](self, "setShouldWorkAround54502886:", 1);
  -[PUWorkaroundSettings setShouldWorkAround124016315:](self, "setShouldWorkAround124016315:", 1);
  -[PUWorkaroundSettings setShouldWorkAround124981589:](self, "setShouldWorkAround124981589:", 1);
}

- (void)setAddRemoveVideoLayer:(BOOL)a3
{
  self->_addRemoveVideoLayer = a3;
}

+ (PUWorkaroundSettings)sharedInstance
{
  if (sharedInstance_onceToken_103944 != -1)
    dispatch_once(&sharedInstance_onceToken_103944, &__block_literal_global_103945);
  return (PUWorkaroundSettings *)(id)sharedInstance_sharedInstance_103946;
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_addRemoveVideoLayer);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Remove/add video layer on appearance"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v6 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldWorkAround54502886);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("54502886 (1-up Dismissal to Camera)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v8;
  v9 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldWorkAround124016315);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:valueKeyPath:", CFSTR("124016315 (Text Selection Jump)"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v11;
  v12 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_shouldWorkAround124981589);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:valueKeyPath:", CFSTR("124981589 (VK contents rect)"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0D83078];
  v21 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "moduleWithTitle:contents:", CFSTR("Workaround"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __38__PUWorkaroundSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workaroundSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_103946;
  sharedInstance_sharedInstance_103946 = v0;

}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
}

- (BOOL)addRemoveVideoLayer
{
  return self->_addRemoveVideoLayer;
}

- (BOOL)shouldWorkAround54502886
{
  return self->_shouldWorkAround54502886;
}

- (BOOL)shouldWorkAround124016315
{
  return self->_shouldWorkAround124016315;
}

- (void)setShouldWorkAround124016315:(BOOL)a3
{
  self->_shouldWorkAround124016315 = a3;
}

- (BOOL)shouldWorkAround124981589
{
  return self->_shouldWorkAround124981589;
}

- (void)setShouldWorkAround124981589:(BOOL)a3
{
  self->_shouldWorkAround124981589 = a3;
}

@end
