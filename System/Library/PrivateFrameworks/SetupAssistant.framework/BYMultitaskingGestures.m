@implementation BYMultitaskingGestures

- (BYMultitaskingGestures)init
{
  void *v3;
  BYMultitaskingGestures *v4;

  +[BYPreferencesController buddyPreferencesExcludedFromBackup](BYPreferencesController, "buddyPreferencesExcludedFromBackup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BYMultitaskingGestures initWithPreferencesController:](self, "initWithPreferencesController:", v3);

  return v4;
}

- (BYMultitaskingGestures)initWithPreferencesController:(id)a3
{
  id v5;
  BYMultitaskingGestures *v6;
  BYMultitaskingGestures *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BYMultitaskingGestures;
  v6 = -[BYMultitaskingGestures init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_preferencesController, a3);

  return v7;
}

- (BOOL)multitaskingWasCompleted
{
  void *v2;
  char v3;

  -[BYMultitaskingGestures preferencesController](self, "preferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("MultitaskingWasCompleted"));

  return v3;
}

- (BOOL)multitaskingWasTurnedOff
{
  void *v2;
  char v3;

  -[BYMultitaskingGestures preferencesController](self, "preferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("MultitaskingWasTurnedOff"));

  return v3;
}

- (void)setMultitaskingWasTurnedOff:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[BYMultitaskingGestures preferencesController](self, "preferencesController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("MultitaskingWasCompleted"));

  -[BYMultitaskingGestures preferencesController](self, "preferencesController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("MultitaskingWasTurnedOff"));

}

- (BYPreferencesController)preferencesController
{
  return self->_preferencesController;
}

- (void)setPreferencesController:(id)a3
{
  objc_storeStrong((id *)&self->_preferencesController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferencesController, 0);
}

@end
