@implementation TTSVBSiriTTSTrainerTask

- (TTSVBSiriTTSTrainerTask)initWithTaskID:(id)a3 localeID:(id)a4 trainingAssetURL:(id)a5 dataAssetURL:(id)a6 inferenceAssetURL:(id)a7 trainingMode:(int64_t)a8 startImmediately:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  TTSVBSiriTTSTrainerTask *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v28.receiver = self;
  v28.super_class = (Class)TTSVBSiriTTSTrainerTask;
  v20 = -[TTSVBSiriTTSTrainerTask init](&v28, sel_init);
  if (v20)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v21 = (void *)getSiriTTSTrainerTaskClass_softClass_0;
    v33 = getSiriTTSTrainerTaskClass_softClass_0;
    if (!getSiriTTSTrainerTaskClass_softClass_0)
    {
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __getSiriTTSTrainerTaskClass_block_invoke_0;
      v29[3] = &unk_25198E470;
      v29[4] = &v30;
      __getSiriTTSTrainerTaskClass_block_invoke_0((uint64_t)v29);
      v21 = (void *)v31[3];
    }
    v22 = objc_retainAutorelease(v21);
    _Block_object_dispose(&v30, 8);
    v23 = (void *)objc_msgSend([v22 alloc], "initWithLanguage:name:", v16, CFSTR("default"));
    objc_msgSend(v23, "setTaskId:", v15);
    objc_msgSend(v17, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTrainingAssetPath:", v24);

    objc_msgSend(v18, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setDataAssetPath:", v25);

    objc_msgSend(v19, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setInferenceAssetPath:", v26);

    objc_msgSend(v23, "setTaskMode:", a8);
    objc_msgSend(v23, "setForceToStart:", a9);
    -[TTSVBSiriTTSTrainerTask setTask:](v20, "setTask:", v23);

  }
  return v20;
}

- (id)description
{
  unint64_t v3;
  const __CFString *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[TTSVBSiriTTSTrainerTask status](self, "status");
  if (v3 > 7)
    v4 = CFSTR("Unknown");
  else
    v4 = *(&off_25198E548 + v3);
  v5 = -[TTSVBSiriTTSTrainerTask trainingStatus](self, "trainingStatus");
  if (v5 > 4)
    v6 = CFSTR("Unknown");
  else
    v6 = *(&off_25198E588 + v5);
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[TTSVBSiriTTSTrainerTask taskID](self, "taskID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TTSVBSiriTTSTrainerTask task](self, "task");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("TTSVBSiriTTSTrainerTask<%p> ID=%@ status=%@ trainingStatus=%@ [underlying Siri=%@]"), self, v8, v4, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)taskID
{
  void *v2;
  void *v3;

  -[TTSVBSiriTTSTrainerTask task](self, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "taskId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)status
{
  void *v3;
  int64_t v4;

  -[TTSVBSiriTTSTrainerTask task](self, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TTSVBSiriTTSTrainerTask _ttsvbStatusForSiriTaskStatus:](self, "_ttsvbStatusForSiriTaskStatus:", objc_msgSend(v3, "taskStatus"));

  return v4;
}

- (int64_t)trainingStatus
{
  void *v3;
  int64_t v4;

  -[TTSVBSiriTTSTrainerTask task](self, "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TTSVBSiriTTSTrainerTask _ttsvbStatusForSiriTrainingStatus:](self, "_ttsvbStatusForSiriTrainingStatus:", objc_msgSend(v3, "trainingStatus"));

  return v4;
}

- (int64_t)currentTaskValue
{
  void *v2;
  int64_t v3;

  -[TTSVBSiriTTSTrainerTask task](self, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentTaskStatusProgressValue");

  return v3;
}

- (int64_t)currentTaskTotal
{
  void *v2;
  int64_t v3;

  -[TTSVBSiriTTSTrainerTask task](self, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "totalTaskStatusProgressValue");

  return v3;
}

- (double)normalizedProgressValue
{
  void *v2;
  float v3;
  double v4;

  -[TTSVBSiriTTSTrainerTask task](self, "task");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "normalizedProgressValue");
  v4 = v3;

  return v4;
}

- (BOOL)isUnfinishedOrPending
{
  unint64_t v2;

  v2 = -[TTSVBSiriTTSTrainerTask status](self, "status");
  return (v2 > 7) | (0x4Fu >> v2) & 1;
}

- (int64_t)_ttsvbStatusForSiriTaskStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  else
    return qword_2487B7110[a3 - 1];
}

- (int64_t)_ttsvbStatusForSiriTrainingStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 0;
  else
    return a3;
}

- (SiriTTSTrainerTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
}

- (TTSVBSiriTTSTrainerTask)initWithSiriTTSTrainerTask:(id)a3
{
  id v4;
  TTSVBSiriTTSTrainerTask *v5;
  TTSVBSiriTTSTrainerTask *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TTSVBSiriTTSTrainerTask;
  v5 = -[TTSVBSiriTTSTrainerTask init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[TTSVBSiriTTSTrainerTask setTask:](v5, "setTask:", v4);

  return v6;
}

@end
