@implementation TRIExperimentPostLaunchRecorder

- (TRIExperimentPostLaunchRecorder)initWithStorage:(id)a3 logger:(id)a4
{
  id v7;
  id v8;
  TRIExperimentPostLaunchRecorder *v9;
  TRIExperimentPostLaunchRecorder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TRIExperimentPostLaunchRecorder;
  v9 = -[TRIExperimentPostLaunchRecorder init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storage, a3);
    objc_storeStrong((id *)&v10->_logger, a4);
  }

  return v10;
}

+ (id)recorderFromContext:(id)a3
{
  id v3;
  TRIExperimentPostLaunchLogger *v4;
  void *v5;
  TRIExperimentPostLaunchLogger *v6;
  TRIExperimentPostLaunchRecorder *v7;
  void *v8;
  TRIExperimentPostLaunchRecorder *v9;

  v3 = a3;
  v4 = [TRIExperimentPostLaunchLogger alloc];
  objc_msgSend(v3, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TRIExperimentPostLaunchLogger initWithClient:](v4, "initWithClient:", v5);

  v7 = [TRIExperimentPostLaunchRecorder alloc];
  objc_msgSend(v3, "experimentHistoryDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[TRIExperimentPostLaunchRecorder initWithStorage:logger:](v7, "initWithStorage:logger:", v8, v6);
  return v9;
}

- (void)recordEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  v4 = a3;
  v8 = 0;
  -[TRIExperimentPostLaunchRecorder storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "storeExperimentEvent:wasNewEvent:", v4, &v8);

  if (v6 && v8)
  {
    -[TRIExperimentPostLaunchRecorder logger](self, "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logExperimentPostLaunchEvent:", v4);

  }
}

- (TRIExperimentPostLaunchStoring)storage
{
  return self->_storage;
}

- (TRIExperimentPostLaunchLogging)logger
{
  return self->_logger;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
