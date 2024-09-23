@implementation HDSHSleepApneaControlServer

- (HDSHSleepApneaControlServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 analyzer:(id)a7 analysisScheduler:(id)a8
{
  id v14;
  id v15;
  id v16;
  HDSHSleepApneaControlServer *v17;
  HDSHSleepApneaControlServer *v18;
  uint64_t v19;
  HDProfile *profile;
  objc_super v22;

  v14 = a5;
  v15 = a7;
  v16 = a8;
  v22.receiver = self;
  v22.super_class = (Class)HDSHSleepApneaControlServer;
  v17 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v22, sel_initWithUUID_configuration_client_delegate_, a3, a4, v14, a6);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_analyzer, a7);
    objc_storeStrong((id *)&v18->_analysisScheduler, a8);
    objc_msgSend(v14, "profile");
    v19 = objc_claimAutoreleasedReturnValue();
    profile = v18->_profile;
    v18->_profile = (HDProfile *)v19;

  }
  return v18;
}

- (void)remote_forceBreathingDisturbanceAnalysis
{
  -[HDSHBreathingDisturbanceAnalyzer performBreathingDisturbanceAnalysisWithIsForced:date:numberOfAnalysisAttempts:](self->_analyzer, "performBreathingDisturbanceAnalysisWithIsForced:date:numberOfAnalysisAttempts:", 1, 0, 0);
}

- (void)remote_overridePreviousTimeIntervalWithTimeInterval:(double)a3
{
  -[HDSHBreathingDisturbanceAnalysisScheduler overrideAnalysisTimeIntervalAndResetActivityWithTimeInterval:](self->_analysisScheduler, "overrideAnalysisTimeIntervalAndResetActivityWithTimeInterval:", a3);
}

- (void)remote_getBreathingDisturbanceSamplesInDateInterval:(id)a3 completion:(id)a4
{
  HDSHBreathingDisturbanceAnalyzer *analyzer;
  HDProfile *profile;
  id v8;
  void (*v9)(void);
  id v10;

  if (a3)
  {
    analyzer = self->_analyzer;
    profile = self->_profile;
    v8 = a4;
    -[HDSHBreathingDisturbanceAnalyzer fetchSamplesWithAnalysisInterval:profile:error:](analyzer, "fetchSamplesWithAnalysisInterval:profile:error:", a3, profile, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id))a4 + 2))(v8);

  }
  else
  {
    v9 = (void (*)(void))*((_QWORD *)a4 + 2);
    v10 = a4;
    v9();
  }

}

- (id)_clientRemoteObjectProxy
{
  void *v2;
  void *v3;
  void *v4;

  -[HDStandardTaskServer client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HDSHBreathingDisturbanceAnalyzer *v17;
  void *v18;
  HDSHBreathingDisturbanceAnalyzer *v19;
  HDSHSleepApneaControlServer *v20;
  HDSHBreathingDisturbanceAnalyzer *v21;
  HDSHSleepApneaControlServer *v22;
  HDSHBreathingDisturbanceAnalyzer *v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "profileExtensionWithIdentifier:", *MEMORY[0x24BEA99B8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = [HDSHBreathingDisturbanceAnalyzer alloc];
    objc_msgSend(v13, "profile");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HDSHBreathingDisturbanceAnalyzer initWithProfile:](v17, "initWithProfile:", v18);

    v20 = [HDSHSleepApneaControlServer alloc];
    objc_msgSend(v16, "breathingDisturbanceAnalysisScheduler");
    v21 = (HDSHBreathingDisturbanceAnalyzer *)objc_claimAutoreleasedReturnValue();
    v22 = -[HDSHSleepApneaControlServer initWithUUID:configuration:client:delegate:analyzer:analysisScheduler:](v20, "initWithUUID:configuration:client:delegate:analyzer:analysisScheduler:", v11, v12, v13, v14, v19, v21);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:format:", 3, CFSTR("Profile extension not found for class %@"), objc_opt_class());
    v24 = (HDSHBreathingDisturbanceAnalyzer *)(id)objc_claimAutoreleasedReturnValue();
    v21 = v24;
    if (v24)
    {
      if (a7)
      {
        v21 = objc_retainAutorelease(v24);
        v22 = 0;
        *a7 = v21;
      }
      else
      {
        _HKLogDroppedError();
        v22 = 0;
      }
      v19 = v21;
    }
    else
    {
      v19 = 0;
      v22 = 0;
    }
  }

  return v22;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x24BEA99C8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_analysisScheduler, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
}

@end
