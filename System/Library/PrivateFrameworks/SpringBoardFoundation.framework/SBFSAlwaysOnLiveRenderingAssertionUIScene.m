@implementation SBFSAlwaysOnLiveRenderingAssertionUIScene

- (SBFSAlwaysOnLiveRenderingAssertionUIScene)initWithScene:(id)a3
{
  id v4;
  id *v5;
  SBFSAlwaysOnLiveRenderingAssertionUIScene *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBFSAlwaysOnLiveRenderingAssertionUIScene;
  v5 = -[SBFAlwaysOnLiveRenderingSceneBLSAttributesProvider _init](&v8, sel__init);
  v6 = (SBFSAlwaysOnLiveRenderingAssertionUIScene *)v5;
  if (v5)
    objc_storeWeak(v5 + 1, v4);

  return v6;
}

- (id)assertionAttributes
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D00FB0], "requestLiveUpdatingForScene:", WeakRetained);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0D00FB8], "requestUnrestrictedFramerateForScene:", WeakRetained);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
}

@end
