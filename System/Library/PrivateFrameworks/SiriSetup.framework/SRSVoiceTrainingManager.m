@implementation SRSVoiceTrainingManager

- (SRSVoiceTrainingManager)initWithLanguageCode:(id)a3
{
  id v4;
  SRSVoiceTrainingManager *v5;
  uint64_t v6;
  SSRVTUITrainingManager *trainingManager;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRSVoiceTrainingManager;
  v5 = -[SRSVoiceTrainingManager init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEAFEA8], "trainingManagerWithLocaleID:withAppDomain:", v4, *MEMORY[0x24BEAFEC0]);
    v6 = objc_claimAutoreleasedReturnValue();
    trainingManager = v5->_trainingManager;
    v5->_trainingManager = (SSRVTUITrainingManager *)v6;

    -[SSRVTUITrainingManager setDelegate:](v5->_trainingManager, "setDelegate:", v5);
  }

  return v5;
}

- (void)trainUtterance:(int64_t)a3 shouldUseASR:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  SSRVTUITrainingManager *trainingManager;
  id v10;
  _QWORD v11[5];
  id v12;

  v5 = a4;
  v8 = a5;
  trainingManager = self->_trainingManager;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__SRSVoiceTrainingManager_trainUtterance_shouldUseASR_completion___block_invoke;
  v11[3] = &unk_24EFCFDD0;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  -[SSRVTUITrainingManager trainUtterance:shouldUseASR:completion:](trainingManager, "trainUtterance:shouldUseASR:completion:", a3, v5, v11);

}

uint64_t __66__SRSVoiceTrainingManager_trainUtterance_shouldUseASR_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "convertStatus:");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)startRMS
{
  -[SSRVTUITrainingManager startRMS](self->_trainingManager, "startRMS");
}

- (void)stopRMS
{
  -[SSRVTUITrainingManager stopRMS](self->_trainingManager, "stopRMS");
}

- (id)voiceProfile
{
  return (id)-[SSRVTUITrainingManager voiceProfile](self->_trainingManager, "voiceProfile");
}

- (void)cancelTrainingForSessionId:(int64_t)a3
{
  -[SSRVTUITrainingManager cancelTrainingForID:](self->_trainingManager, "cancelTrainingForID:", a3);
}

- (void)cleanupWithCompletion:(id)a3
{
  id v3;

  v3 = (id)-[SSRVTUITrainingManager cleanupWithCompletion:](self->_trainingManager, "cleanupWithCompletion:", a3);
}

- (void)VTUITrainingManagerFeedLevel:(float)a3
{
  double v4;
  id v5;

  -[SRSVoiceTrainingManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "audioLevelDidChange:", v4);

}

- (int64_t)convertStatus:(int)a3
{
  uint64_t v3;

  v3 = (a3 - 1);
  if (v3 < 7)
    return v3 + 1;
  else
    return 0;
}

- (SRSTrainingManagerDelegate)delegate
{
  return (SRSTrainingManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trainingManager, 0);
}

@end
