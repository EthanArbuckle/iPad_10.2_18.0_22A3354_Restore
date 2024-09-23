@implementation PLBBPowerToolService

+ (id)entryEventPointDefinitions
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = CFSTR("bbPowerPointCause");
  objc_msgSend(a1, "entryCauseDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("bbPowerPointCauseHelper");
  v8[0] = v3;
  objc_msgSend(a1, "entryCauseHelperDefinition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryCauseDefinition
{
  uint64_t v2;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[7];
  _QWORD v22[7];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[4];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v25[0] = *MEMORY[0x24BE751D0];
  v2 = *MEMORY[0x24BE751F0];
  v23[0] = *MEMORY[0x24BE751F8];
  v23[1] = v2;
  v24[0] = &unk_24EB64750;
  v24[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v20;
  v25[1] = *MEMORY[0x24BE751E8];
  v21[0] = CFSTR("cause");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "commonTypeDict_StringFormat");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v18;
  v21[1] = CFSTR("causeTimeStamp");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "commonTypeDict_DateFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v16;
  v21[2] = CFSTR("causeDuration");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v14;
  v21[3] = CFSTR("ArmUtil");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v4;
  v21[4] = CFSTR("IsContinuous");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v6;
  v21[5] = CFSTR("PerepherialMax");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v8;
  v21[6] = CFSTR("APExclusion");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)entryCauseHelperDefinition
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v15[0] = *MEMORY[0x24BE751D0];
  v2 = *MEMORY[0x24BE751F0];
  v13[0] = *MEMORY[0x24BE751F8];
  v13[1] = v2;
  v14[0] = &unk_24EB64750;
  v14[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x24BE751E8];
  v11[0] = CFSTR("BBPowerName");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("Value");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryAggregateDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("AggregatedARMUtil");
  objc_msgSend(a1, "entryArmUtil");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryArmUtil
{
  uint64_t v2;
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
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[4];
  _QWORD v24[6];

  v24[4] = *MEMORY[0x24BDAC8D0];
  v23[0] = *MEMORY[0x24BE751D0];
  v2 = *MEMORY[0x24BE751F0];
  v21[0] = *MEMORY[0x24BE751F8];
  v21[1] = v2;
  v22[0] = &unk_24EB64750;
  v22[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v3;
  v23[1] = *MEMORY[0x24BE751E8];
  v19[0] = CFSTR("ArmUtilBucket");
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("ArmUtilCount");
  v20[0] = v5;
  objc_msgSend(MEMORY[0x24BE74FC0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v8;
  v23[2] = *MEMORY[0x24BE751A0];
  v17 = &unk_24EB64760;
  v15 = *MEMORY[0x24BE75198];
  v16 = &unk_24EB64760;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  v23[3] = *MEMORY[0x24BE751A8];
  v14 = CFSTR("ArmUtilCount");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBBPowerToolService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLBBPowerToolService)init
{
  void *v3;
  PLBBPowerToolService *v4;
  objc_super v6;

  if ((objc_msgSend(MEMORY[0x24BE74FD8], "isHomePod") & 1) != 0)
    goto LABEL_9;
  v6.receiver = self;
  v6.super_class = (Class)PLBBPowerToolService;
  self = -[PLOperator init](&v6, sel_init);
  if (self)
  {
    if (objc_msgSend(MEMORY[0x24BE74FD8], "internalBuild"))
    {
      if (objc_msgSend(MEMORY[0x24BE74FB0], "BOOLForKey:", CFSTR("PLBasebandPostProcessing"))
        && objc_msgSend(MEMORY[0x24BE74FB0], "fullMode"))
      {
        objc_msgSend(MEMORY[0x24BE75298], "sharedTelephonyConnection");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "enableDiagLogging");

        goto LABEL_8;
      }
      if (objc_msgSend(MEMORY[0x24BE74FD8], "isBasebandClass:", 1003003))
        goto LABEL_8;
    }
LABEL_9:
    v4 = 0;
    goto LABEL_10;
  }
LABEL_8:
  self = self;
  v4 = self;
LABEL_10:

  return v4;
}

- (void)initOperatorDependancies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[6];

  -[PLBBPowerToolService setExclusionMask:](self, "setExclusionMask:", 0);
  v3 = (void *)objc_opt_new();
  -[PLBBPowerToolService setStartExclusionPeriods:](self, "setStartExclusionPeriods:", v3);

  v4 = (void *)objc_opt_new();
  -[PLBBPowerToolService setEndExclusionPeriods:](self, "setEndExclusionPeriods:", v4);

  objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBPowerToolService setNotToRemoveDate:](self, "setNotToRemoveDate:", v5);

  -[PLBBPowerToolService setSendAWD:](self, "setSendAWD:", 0);
  -[PLBBPowerToolService setDoesCurrPackageHasProblem:](self, "setDoesCurrPackageHasProblem:", 0);
  -[PLBBPowerToolService setDoesPrevPackageHasProblem:](self, "setDoesPrevPackageHasProblem:", 0);
  -[PLBBPowerToolService setIsUIAlertEnabled:](self, "setIsUIAlertEnabled:", 1);
  objc_msgSend(MEMORY[0x24BE74FB0], "doubleForKey:ifNotSet:", CFSTR("ArmUtilityThreshold"), 80.0);
  -[PLBBPowerToolService setArmUtilityThresholdVal:](self, "setArmUtilityThresholdVal:");
  objc_msgSend(MEMORY[0x24BE74FB0], "doubleForKey:ifNotSet:", CFSTR("MagicDeltaThreshold"), 10.0);
  -[PLBBPowerToolService setMagicDeltaThresholdVal:](self, "setMagicDeltaThresholdVal:");
  objc_msgSend(MEMORY[0x24BE74FB0], "doubleForKey:ifNotSet:", CFSTR("OOSDuration"), 80.0);
  -[PLBBPowerToolService setOosDurationVal:](self, "setOosDurationVal:");
  objc_msgSend(MEMORY[0x24BE74FB0], "doubleForKey:ifNotSet:", CFSTR("RRCDisconnected"), 80.0);
  -[PLBBPowerToolService setRrcDisconnectedVal:](self, "setRrcDisconnectedVal:");
  -[PLBBPowerToolService resetAllCounters:](self, "resetAllCounters:", 0);
  objc_msgSend(MEMORY[0x24BE75298], "sharedTelephonyConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_connection, v6);

  v7 = *MEMORY[0x24BE75218];
  objc_msgSend(MEMORY[0x24BE75238], "entryKeyForType:andName:", *MEMORY[0x24BE75218], *MEMORY[0x24BE752F8]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BE74FC8]);
  v10 = MEMORY[0x24BDAC760];
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke;
  v42[3] = &unk_24EB5CDA0;
  v42[4] = self;
  v30 = (void *)v8;
  v11 = (void *)objc_msgSend(v9, "initWithOperator:forEntryKey:withBlock:", self, v8, v42);
  -[PLBBPowerToolService setAudioEventCallback:](self, "setAudioEventCallback:", v11);
  if (objc_msgSend(MEMORY[0x24BE75260], "shouldLogDisplay"))
  {
    objc_msgSend(MEMORY[0x24BE75260], "entryKeyForType:andName:", *MEMORY[0x24BE75230], *MEMORY[0x24BE75370]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v10;
    v41[1] = 3221225472;
    v41[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_2;
    v41[3] = &unk_24EB5CDA0;
    v41[4] = self;
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FC8]), "initWithOperator:forEntryKey:withBlock:", self, v12, v41);
    -[PLBBPowerToolService setDisplayEventCallback:](self, "setDisplayEventCallback:", v13);

  }
  objc_msgSend(MEMORY[0x24BE75288], "entryKeyForType:andName:", v7, *MEMORY[0x24BE75380]);
  v40[0] = v10;
  v40[1] = 3221225472;
  v40[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_3;
  v40[3] = &unk_24EB5CDA0;
  v40[4] = self;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FC8]), "initWithOperator:forEntryKey:withBlock:", self, v33, v40);
  -[PLBBPowerToolService setHotspotEventCallback:](self, "setHotspotEventCallback:");
  objc_msgSend(MEMORY[0x24BE75240], "entryKeyForType:andName:", *MEMORY[0x24BE75210], *MEMORY[0x24BE75308]);
  v39[0] = v10;
  v39[1] = 3221225472;
  v39[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_4;
  v39[3] = &unk_24EB5CDA0;
  v39[4] = self;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FC8]), "initWithOperator:forEntryKey:withBlock:", self, v31, v39);
  -[PLBBPowerToolService setBbHwOtherCallback:](self, "setBbHwOtherCallback:", v14);
  if (objc_msgSend(MEMORY[0x24BE74FB0], "BOOLForKey:", CFSTR("PLBasebandPostProcessing")))
  {
    objc_msgSend(MEMORY[0x24BE75240], "entryKeyForType:andName:", *MEMORY[0x24BE75228], *MEMORY[0x24BE752B8]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x24BE74FC8]);
    v16 = MEMORY[0x24BDAC760];
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_5;
    v38[3] = &unk_24EB5CDA0;
    v38[4] = self;
    v28 = (void *)objc_msgSend(v15, "initWithOperator:forEntryKey:withBlock:", self, v29, v38);
    -[PLBBPowerToolService setMsgLiteCallback:](self, "setMsgLiteCallback:", v28);
    objc_msgSend(MEMORY[0x24BE75240], "entryKeyForType:andName:", v7, *MEMORY[0x24BE752B0]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v16;
    v37[1] = 3221225472;
    v37[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_6;
    v37[3] = &unk_24EB5CDA0;
    v37[4] = self;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FC8]), "initWithOperator:forEntryKey:withBlock:", self, v27, v37);
    -[PLBBPowerToolService setWcdmaRRCCallback:](self, "setWcdmaRRCCallback:", v17);
    objc_msgSend(MEMORY[0x24BE75240], "entryKeyForType:andName:", v7, *MEMORY[0x24BE752A8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v16;
    v36[1] = 3221225472;
    v36[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_7;
    v36[3] = &unk_24EB5CDA0;
    v36[4] = self;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FC8]), "initWithOperator:forEntryKey:withBlock:", self, v18, v36);
    -[PLBBPowerToolService setLteRRCCallback:](self, "setLteRRCCallback:", v19);
    objc_msgSend(MEMORY[0x24BE75240], "entryKeyForType:andName:", *MEMORY[0x24BE75230], *MEMORY[0x24BE752C0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc(MEMORY[0x24BE74FC8]);
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_8;
    v35[3] = &unk_24EB5CDA0;
    v35[4] = self;
    v22 = (void *)objc_msgSend(v21, "initWithOperator:forEntryKey:withBlock:", self, v20, v35);
    -[PLBBPowerToolService setTelActivityCallback:](self, "setTelActivityCallback:", v22);

  }
  v23 = objc_alloc(MEMORY[0x24BE74FD0]);
  objc_msgSend(MEMORY[0x24BE74FF8], "workQueueForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x24BDBC9E8];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_9;
  v34[3] = &unk_24EB5CDA0;
  v34[4] = self;
  v26 = (void *)objc_msgSend(v23, "initWithWorkQueue:forNotification:withBlock:", v24, v25, v34);

  -[PLBBPowerToolService setDailyTaskNotification:](self, "setDailyTaskNotification:", v26);
  -[PLBBPowerToolService setupInitExclusions](self, "setupInitExclusions");

}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleAudioCallback:", a2);
  return result;
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleDisplayCallback:", a2);
  return result;
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleHotspotCallback:", a2);
  return result;
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_4(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleMavBBHwOtherCallback:", a2);
  return result;
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_5(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "msgLiteCallback:", a2);
  return result;
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_6(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "wcdmaRRCCallback:", a2);
  return result;
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_7(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "lteRRCCallback:", a2);
  return result;
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_8(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "telActivityCallback:", a2);
  return result;
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  __CFString *v21;
  uint64_t v22;

  if (objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    v17 = MEMORY[0x24BDAC760];
    v19 = __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_10;
    v20 = &unk_24EB5D208;
    v18 = 3221225472;
    v21 = CFSTR("DailyTasks");
    v22 = v2;
    if (rrcDisconnected_block_invoke_defaultOnce != -1)
      dispatch_once(&rrcDisconnected_block_invoke_defaultOnce, &v17);
    v3 = rrcDisconnected_block_invoke_classDebugEnabled;

    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("DailyTasks notification!"), v17, v18, v19, v20);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBBPowerToolService.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLBBPowerToolService initOperatorDependancies]_block_invoke_9");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v7, v8, 330);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[BBSmartPL triggerBBCoreDump].cold.1((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "submitAWD", v17, v18, v19, v20);
  return objc_msgSend(*(id *)(a1 + 32), "setIsUIAlertEnabled:", 1);
}

uint64_t __48__PLBBPowerToolService_initOperatorDependancies__block_invoke_10(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  rrcDisconnected_block_invoke_classDebugEnabled = result;
  return result;
}

- (void)writeToHelperTable:(id)a3 WithValue:(double)a4 withDate:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = *MEMORY[0x24BE75230];
  v10 = a5;
  +[PLOperator entryKeyForType:andName:](PLBBPowerToolService, "entryKeyForType:andName:", v9, CFSTR("bbPowerPointCauseHelper"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:withDate:", v11, v10);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=\"%@\"), CFSTR("BBPowerName"), v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBPowerToolService notToRemoveDate](self, "notToRemoveDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSince1970");
  v17 = v16;
  v26[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "entriesForKey:before:timeInterval:count:withFilters:", v11, 1, 1, v18, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator storage](self, "storage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "entryDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "deleteAllEntriesForKey:beforeTimestamp:withFilters:", v11, v22, v23);

  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("BBPowerName"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, CFSTR("Value"));

  -[PLOperator logEntry:](self, "logEntry:", v12);
}

- (void)msgLiteCallback:(id)a3
{
  void *v4;
  double v5;
  unsigned int v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("EventCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  if (v6 == 1010)
  {
    objc_msgSend(v8, "entryDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBPowerToolService writeToHelperTable:WithValue:withDate:](self, "writeToHelperTable:WithValue:withDate:", CFSTR("prachCount"), v7, 0.0);

  }
}

- (void)wcdmaRRCCallback:(id)a3
{
  void *v4;
  double v5;
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  int v12;
  id v13;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("EventCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  v7 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("CurrState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithString:", v8);

  if (v6 == 571)
  {
    if (objc_msgSend(v9, "isEqual:", CFSTR("Disconnected")))
    {
      objc_msgSend(v13, "entryDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0.0;
    }
    else
    {
      v12 = objc_msgSend(v9, "isEqual:", CFSTR("CellDCH"));
      objc_msgSend(v13, "entryDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        v11 = 1.0;
      else
        v11 = 2.0;
    }
    -[PLBBPowerToolService writeToHelperTable:WithValue:withDate:](self, "writeToHelperTable:WithValue:withDate:", CFSTR("wcdmaRRCState"), v10, v11);

  }
}

- (void)lteRRCCallback:(id)a3
{
  void *v4;
  double v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  int v11;
  id v12;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("EventCode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("State"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 == 1606)
  {
    if (objc_msgSend(v7, "isEqual:", CFSTR("Disconnected")))
    {
      objc_msgSend(v12, "entryDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0.0;
    }
    else
    {
      v11 = objc_msgSend(v8, "isEqual:", CFSTR("CellDCH"));
      objc_msgSend(v12, "entryDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v10 = 1.0;
      else
        v10 = 2.0;
    }
    -[PLBBPowerToolService writeToHelperTable:WithValue:withDate:](self, "writeToHelperTable:WithValue:withDate:", CFSTR("lteRRCState"), v9, v10);

  }
}

- (void)telActivityCallback:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("campedRat"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Unknown")))
  {
    objc_msgSend(v12, "entryDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0.0;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("UMTS")))
  {
    objc_msgSend(v12, "entryDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1.0;
  }
  else
  {
    v7 = objc_msgSend(v4, "isEqualToString:", CFSTR("LTE"));
    objc_msgSend(v12, "entryDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v6 = 2.0;
    else
      v6 = 3.0;
  }
  -[PLBBPowerToolService writeToHelperTable:WithValue:withDate:](self, "writeToHelperTable:WithValue:withDate:", CFSTR("campedRat"), v5, v6);

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("signalStrength"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  objc_msgSend(v12, "entryDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBPowerToolService writeToHelperTable:WithValue:withDate:](self, "writeToHelperTable:WithValue:withDate:", CFSTR("strength"), v11, v10);

}

- (void)resetAllCounters:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(v5, "entryDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBBPowerToolService setNotToRemoveDate:](self, "setNotToRemoveDate:", v4);

  }
  -[PLBBPowerToolService setElapsedDenumerator:](self, "setElapsedDenumerator:", 0.0);
  -[PLBBPowerToolService setTotalNormalARMUtility:](self, "setTotalNormalARMUtility:", 0.0);
  -[PLBBPowerToolService setStartSamplingDate:](self, "setStartSamplingDate:", 0);
  if (-[PLBBPowerToolService doesCurrPackageHasProblem](self, "doesCurrPackageHasProblem"))
  {
    -[PLBBPowerToolService setDoesPrevPackageHasProblem:](self, "setDoesPrevPackageHasProblem:", 1);
    -[PLBBPowerToolService setDoesCurrPackageHasProblem:](self, "setDoesCurrPackageHasProblem:", 0);
  }
  else
  {
    -[PLBBPowerToolService setDoesPrevPackageHasProblem:](self, "setDoesPrevPackageHasProblem:", 0);
  }

}

- (void)handleAudioCallback:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Active"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    -[PLBBPowerToolService handleExclusionWithState:withExclusion:](self, "handleExclusionWithState:withExclusion:", v6, 1);
    v4 = v7;
  }

}

- (void)handleDisplayCallback:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Active"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    -[PLBBPowerToolService handleExclusionWithState:withExclusion:](self, "handleExclusionWithState:withExclusion:", v6, 2);
    v4 = v7;
  }

}

- (void)handleHotspotCallback:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Active"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    -[PLBBPowerToolService handleExclusionWithState:withExclusion:](self, "handleExclusionWithState:withExclusion:", v6, 4);
    v4 = v7;
  }

}

- (void)handleExclusionWithState:(BOOL)a3 withExclusion:(unsigned __int8)a4
{
  int v4;
  _BOOL4 v5;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v5 = a3;
  v7 = -[PLBBPowerToolService exclusionMask](self, "exclusionMask");
  if (v5)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBBPowerToolService startExclusionPeriods](self, "startExclusionPeriods");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v8);

    }
    -[PLBBPowerToolService setExclusionMask:](self, "setExclusionMask:", -[PLBBPowerToolService exclusionMask](self, "exclusionMask") | v4);
  }
  else if (v4)
  {
    if (v7)
    {
      -[PLBBPowerToolService setExclusionMask:](self, "setExclusionMask:", -[PLBBPowerToolService exclusionMask](self, "exclusionMask") & ~v4);
      if (!-[PLBBPowerToolService exclusionMask](self, "exclusionMask"))
      {
        -[PLBBPowerToolService endExclusionPeriods](self, "endExclusionPeriods");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v10);

      }
    }
  }
}

- (void)handleMavBBHwOtherCallback:(id)a3
{
  void *v4;
  void *v5;
  double v6;
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
  void *v20;
  CFOptionFlags v21;

  objc_msgSend(a3, "objectForKey:", CFSTR("entry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE752D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[PLBBPowerToolService isPackageValidWithEntry:](self, "isPackageValidWithEntry:", v4))
    {
      -[PLBBPowerToolService collectExtraDataForPackage:](self, "collectExtraDataForPackage:", v4);
      -[PLBBPowerToolService elapsedDenumerator](self, "elapsedDenumerator");
      if (v6 >= 600.0)
      {
        if (-[PLBBPowerToolService doesCurrPeriodHaveProblem:](self, "doesCurrPeriodHaveProblem:", v4)
          && objc_msgSend(MEMORY[0x24BE74FB0], "BOOLForKey:", CFSTR("PLBasebandPostProcessing")))
        {
          if (-[PLBBPowerToolService isUIAlertEnabled](self, "isUIAlertEnabled"))
          {
            v21 = 0;
            CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, CFSTR("BB Power tool button"), CFSTR("Submit bug"), CFSTR("Continue"), 0, 0, &v21);
            -[PLBBPowerToolService setIsUIAlertEnabled:](self, "setIsUIAlertEnabled:", 0);
          }
          -[PLBBPowerToolService setDoesCurrPackageHasProblem:](self, "setDoesCurrPackageHasProblem:", 1);
          goto LABEL_12;
        }
        if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
LABEL_12:
          -[PLBBPowerToolService handleProblemWithEntry:](self, "handleProblemWithEntry:", v4);
LABEL_13:
        -[PLBBPowerToolService resetAllCounters:](self, "resetAllCounters:", v4);
      }
    }
    else
    {
      if (!-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
        goto LABEL_13;
      +[PLOperator entryKeyForType:andName:](PLBBPowerToolService, "entryKeyForType:andName:", *MEMORY[0x24BE75230], CFSTR("bbPowerPointCause"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v7);
      -[PLBBPowerToolService collectExtraDataForPackage:](self, "collectExtraDataForPackage:", v4);
      -[PLBBPowerToolService doesCurrPeriodHaveProblem:](self, "doesCurrPeriodHaveProblem:", v4);
      -[PLBBPowerToolService handleProblemWithEntry:](self, "handleProblemWithEntry:", v4);
      objc_msgSend(v4, "entryDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");
      -[PLBBPowerToolService setStartSamplingDate:](self, "setStartSamplingDate:", v10);

      -[PLBBPowerToolService startSamplingDate](self, "startSamplingDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("causeTimeStamp"));

      v12 = (void *)MEMORY[0x24BDD16E0];
      -[PLBBPowerToolService elapsedDenumerator](self, "elapsedDenumerator");
      objc_msgSend(v12, "numberWithDouble:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("causeDuration"));

      objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("exclusion"), CFSTR("cause"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PLBBPowerToolService doesPrevPackageHasProblem](self, "doesPrevPackageHasProblem"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("IsContinuous"));

      v15 = (void *)MEMORY[0x24BDD16E0];
      -[PLBBPowerToolService gArmUtil](self, "gArmUtil");
      objc_msgSend(v15, "numberWithDouble:");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("ArmUtil"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PLBBPowerToolService gPerepherialMax](self, "gPerepherialMax"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("PerepherialMax"));

      v18 = (void *)MEMORY[0x24BDD16E0];
      -[PLBBPowerToolService startExclusionPeriods](self, "startExclusionPeriods");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, CFSTR("APExclusion"));

      -[PLOperator logEntry:](self, "logEntry:", v8);
      -[PLBBPowerToolService resetAllCounters:](self, "resetAllCounters:", v4);

    }
  }

}

- (BOOL)doesCurrPeriodHaveProblem:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  -[PLBBPowerToolService totalNormalARMUtility](self, "totalNormalARMUtility");
  v6 = v5;
  -[PLBBPowerToolService elapsedDenumerator](self, "elapsedDenumerator");
  v8 = v6 / (v7 * 32768.0);
  -[PLBBPowerToolService setGArmUtil:](self, "setGArmUtil:", v8);
  +[PLOperator entryKeyForType:andName:](PLBBPowerToolService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("AggregatedARMUtil"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v9);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("ArmUtilBucket"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_24EB64A30, CFSTR("ArmUtilCount"));
  -[PLOperator logEntry:](self, "logEntry:", v10);
  -[PLBBPowerToolService armUtilityThresholdVal](self, "armUtilityThresholdVal");
  v13 = v12;
  if (v8 <= v12 && -[PLOperator isDebugEnabled](self, "isDebugEnabled"))
  {
    +[PLOperator entryKeyForType:andName:](PLBBPowerToolService, "entryKeyForType:andName:", *MEMORY[0x24BE75230], CFSTR("bbPowerPointCause"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v14);
    objc_msgSend(v4, "entryDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    -[PLBBPowerToolService setStartSamplingDate:](self, "setStartSamplingDate:", v17);

    -[PLBBPowerToolService startSamplingDate](self, "startSamplingDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("causeTimeStamp"));

    v19 = (void *)MEMORY[0x24BDD16E0];
    -[PLBBPowerToolService elapsedDenumerator](self, "elapsedDenumerator");
    objc_msgSend(v19, "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("causeDuration"));

    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("No problem found"), CFSTR("cause"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PLBBPowerToolService doesPrevPackageHasProblem](self, "doesPrevPackageHasProblem"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("IsContinuous"));

    v22 = (void *)MEMORY[0x24BDD16E0];
    -[PLBBPowerToolService gArmUtil](self, "gArmUtil");
    objc_msgSend(v22, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v23, CFSTR("ArmUtil"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PLBBPowerToolService gPerepherialMax](self, "gPerepherialMax"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, CFSTR("PerepherialMax"));

    v25 = (void *)MEMORY[0x24BDD16E0];
    -[PLBBPowerToolService startExclusionPeriods](self, "startExclusionPeriods");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v27, CFSTR("APExclusion"));

    -[PLOperator logEntry:](self, "logEntry:", v15);
  }

  return v8 > v13;
}

- (void)collectExtraDataForPackage:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BE752E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  -[PLBBPowerToolService elapsedDenumerator](self, "elapsedDenumerator");
  -[PLBBPowerToolService setElapsedDenumerator:](self, "setElapsedDenumerator:", v6 * 0.0000305175781 + v7);
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BE753E8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9 / v6;
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x24BE753E0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = 100.0 - (v12 / v6 * 100.0 + v10 * 100.0);

  -[PLBBPowerToolService totalNormalARMUtility](self, "totalNormalARMUtility");
  -[PLBBPowerToolService setTotalNormalARMUtility:](self, "setTotalNormalARMUtility:", v14 + v6 * v13);
  -[PLBBPowerToolService startSamplingDate](self, "startSamplingDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(v18, "entryDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    -[PLBBPowerToolService setStartSamplingDate:](self, "setStartSamplingDate:", v17);

  }
}

- (void)handleProblemWithEntry:(id)a3
{
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
  uint64_t v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD block[5];

  -[PLBBPowerToolService findCauseWithEntry:](self, "findCauseWithEntry:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLBBPowerToolService, "entryKeyForType:andName:", *MEMORY[0x24BE75230], CFSTR("bbPowerPointCause"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE74FB8]), "initWithEntryKey:", v5);
  -[PLBBPowerToolService startSamplingDate](self, "startSamplingDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("causeTimeStamp"));

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[PLBBPowerToolService elapsedDenumerator](self, "elapsedDenumerator");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("causeDuration"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("cause"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PLBBPowerToolService doesPrevPackageHasProblem](self, "doesPrevPackageHasProblem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("IsContinuous"));

  v11 = (void *)MEMORY[0x24BDD16E0];
  -[PLBBPowerToolService gArmUtil](self, "gArmUtil");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("ArmUtil"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[PLBBPowerToolService gPerepherialMax](self, "gPerepherialMax"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("PerepherialMax"));

  v14 = (void *)MEMORY[0x24BDD16E0];
  -[PLBBPowerToolService startExclusionPeriods](self, "startExclusionPeriods");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("APExclusion"));

  -[PLOperator logEntry:](self, "logEntry:", v6);
  -[PLBBPowerToolService connection](self, "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BDD17C8];
  -[PLBBPowerToolService startSamplingDate](self, "startSamplingDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBPowerToolService elapsedDenumerator](self, "elapsedDenumerator");
  objc_msgSend(v18, "stringWithFormat:", CFSTR("Auto-trigger of core dump by Powerlog: bb-powertool, startTime = %@; duration = %f"),
    v19,
    v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v17, "requestBasebandStateDump:", v21);

  if ((v22 & 1) == 0 && objc_msgSend(MEMORY[0x24BE74FB0], "debugEnabled"))
  {
    v23 = objc_opt_class();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__PLBBPowerToolService_handleProblemWithEntry___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v23;
    if (handleProblemWithEntry__defaultOnce != -1)
      dispatch_once(&handleProblemWithEntry__defaultOnce, block);
    if (handleProblemWithEntry__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("BBPowerTool: BB snapshot failed"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x24BE74FA8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBBPowerToolService.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[PLBBPowerToolService handleProblemWithEntry:]");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 705);

      PLLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        -[BBSmartPL triggerBBCoreDump].cold.1((uint64_t)v24, v29, v30, v31, v32, v33, v34, v35);

    }
  }

}

uint64_t __47__PLBBPowerToolService_handleProblemWithEntry___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE74FB0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleProblemWithEntry__classDebugEnabled = result;
  return result;
}

- (void)resetStructuresWithSnapshot:(CauseSnapshot *)a3 withDuration:(CauseDurations *)a4
{
  a3->var1 = 0.0;
  a3->var2 = 0;
  a3->var0 = 3;
  a4->var0 = 0;
  *(_OWORD *)&a4->var1 = 0u;
  *(_OWORD *)&a4->var3 = 0u;
}

- (id)analazeCauseResultsReturnCause:(CauseDurations *)a3
{
  double var1;
  double v6;
  double v7;
  double var2;
  double v9;
  double v10;
  double var4;
  double v12;
  double v14;
  double v15;
  double v16;

  var1 = a3->var1;
  -[PLBBPowerToolService elapsedDenumerator](self, "elapsedDenumerator");
  v7 = v6;
  var2 = a3->var2;
  -[PLBBPowerToolService elapsedDenumerator](self, "elapsedDenumerator");
  v10 = v9;
  var4 = a3->var4;
  -[PLBBPowerToolService elapsedDenumerator](self, "elapsedDenumerator");
  if (a3->var0 > 50)
    return CFSTR("RACHFail");
  v14 = v12;
  -[PLBBPowerToolService oosDurationVal](self, "oosDurationVal");
  if (var1 / v7 * 100.0 > v15)
    return CFSTR("OOS");
  -[PLBBPowerToolService rrcDisconnectedVal](self, "rrcDisconnectedVal");
  if (var2 / v10 * 100.0 > v16)
    return CFSTR("TcXONotShutting");
  if (var4 / v14 * 100.0 >= 50.0)
    return CFSTR("MarginalCoverage");
  return CFSTR("Unknown");
}

- (void)analazeIntervalWithSnapshot:(CauseSnapshot *)a3 withDuration:(CauseDurations *)a4 withInterval:(double)a5 withEntry:(id)a6
{
  double *p_var1;

  if (!a3->var0)
  {
    p_var1 = &a4->var1;
    goto LABEL_8;
  }
  if (a3->var0 == 1 && !a3->var2)
    a4->var2 = a4->var2 + a5;
  if (a3->var1 < -100.0)
  {
    p_var1 = &a4->var4;
LABEL_8:
    *p_var1 = *p_var1 + a5;
  }
}

- (id)findCauseWithEntry:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  double v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  _OWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLBBPowerToolService, "entryKeyForType:andName:", *MEMORY[0x24BE75230], CFSTR("bbPowerPointCauseHelper"));
  v5 = objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v5;
  objc_msgSend(v6, "entriesForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v4;
  objc_msgSend(v4, "entryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCE60];
  -[PLBBPowerToolService elapsedDenumerator](self, "elapsedDenumerator");
  objc_msgSend(v9, "dateWithTimeInterval:sinceDate:", v8, -v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = 0;
  v38 = 0;
  v35 = 0;
  memset(v34, 0, sizeof(v34));
  -[PLBBPowerToolService resetStructuresWithSnapshot:withDuration:](self, "resetStructuresWithSnapshot:withDuration:", &v36, v34);
  v33 = v11;
  if (!objc_msgSend(v7, "count"))
    goto LABEL_22;
  v12 = 0;
  v13 = 0;
  while (1)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "entryDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "compare:", v11);

    if (v16 == 1)
    {
      objc_msgSend(v14, "entryDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "earlierDate:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", v18);
      v20 = v19;

      objc_msgSend(v14, "entryDate");
      v21 = objc_claimAutoreleasedReturnValue();

      -[PLBBPowerToolService analazeIntervalWithSnapshot:withDuration:withInterval:withEntry:](self, "analazeIntervalWithSnapshot:withDuration:withInterval:withEntry:", &v36, v34, v14, v20);
      v13 = 1;
      v11 = (id)v21;
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("BBPowerName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqualToString:", CFSTR("campedRat")))
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Value"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v36 = (uint64_t)v24;
LABEL_15:

      goto LABEL_16;
    }
    if (objc_msgSend(v22, "isEqualToString:", CFSTR("strength")))
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Value"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v37 = v25;
      goto LABEL_15;
    }
    if (objc_msgSend(v22, "isEqualToString:", CFSTR("prachCount")))
    {
      if ((v13 & 1) != 0)
        ++LODWORD(v34[0]);
    }
    else if (objc_msgSend(v22, "isEqualToString:", CFSTR("wcdmaRRCState"))
           || objc_msgSend(v22, "isEqualToString:", CFSTR("lteRRCState")))
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Value"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "doubleValue");
      v38 = (uint64_t)v26;
      goto LABEL_15;
    }
LABEL_16:
    objc_msgSend(v14, "entryDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "compare:", v8);

    if (v28 == 1)
      goto LABEL_21;
    if (v12 == objc_msgSend(v7, "count") - 1)
      break;

    if (objc_msgSend(v7, "count") <= (unint64_t)++v12)
      goto LABEL_22;
  }
  objc_msgSend(v11, "timeIntervalSinceDate:", v8);
  -[PLBBPowerToolService analazeIntervalWithSnapshot:withDuration:withInterval:withEntry:](self, "analazeIntervalWithSnapshot:withDuration:withInterval:withEntry:", &v36, v34, v14);
LABEL_21:

LABEL_22:
  -[PLBBPowerToolService analazeCauseResultsReturnCause:](self, "analazeCauseResultsReturnCause:", v34);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (BOOL)isPackageValidWithEntry:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  int v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE752C8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE752E8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v7 / v9 * 100.0;

  -[PLBBPowerToolService calculateMaxPerepherialPercentageWithEntry:](self, "calculateMaxPerepherialPercentageWithEntry:", v4);
  v12 = (int)v11;
  -[PLBBPowerToolService setGPerepherialMax:](self, "setGPerepherialMax:", (int)v11);
  -[PLBBPowerToolService armUtilityThresholdVal](self, "armUtilityThresholdVal");
  v14 = v13;
  -[PLBBPowerToolService magicDeltaThresholdVal](self, "magicDeltaThresholdVal");
  v19 = 100.0 - v10 <= v14 - v15
     && (-[PLBBPowerToolService armUtilityThresholdVal](self, "armUtilityThresholdVal"),
         v17 = v16,
         -[PLBBPowerToolService magicDeltaThresholdVal](self, "magicDeltaThresholdVal"),
         v17 - v18 >= (double)v12)
     && -[PLBBPowerToolService isPackageTimeValidWithEntry:](self, "isPackageTimeValidWithEntry:", v4);

  return v19;
}

- (BOOL)isPackageTimeValidWithEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;

  v4 = a3;
  objc_msgSend(v4, "entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE752E8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "doubleValue");
  v8 = v7 * -0.0000305175781;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBBPowerToolService notToRemoveDate](self, "notToRemoveDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  if (v11 == -1)
  {
LABEL_10:
    v15 = 0;
    goto LABEL_17;
  }
  if (-[PLBBPowerToolService containsExclusionsAfterCleanupWithDate:](self, "containsExclusionsAfterCleanupWithDate:", v9))
  {
    -[PLBBPowerToolService startExclusionPeriods](self, "startExclusionPeriods");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "count");
    -[PLBBPowerToolService endExclusionPeriods](self, "endExclusionPeriods");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)objc_msgSend(v14, "count"))
    {

LABEL_7:
      -[PLBBPowerToolService startExclusionPeriods](self, "startExclusionPeriods");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v9, "compare:", v18);
      if (v19 == -1
        && (-[PLBBPowerToolService startExclusionPeriods](self, "startExclusionPeriods"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v13, "objectAtIndexedSubscript:", 0),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v5, "compare:") == 1))
      {
        v20 = 1;
      }
      else
      {
        -[PLBBPowerToolService endExclusionPeriods](self, "endExclusionPeriods");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "compare:", v22) == -1)
        {
          -[PLBBPowerToolService endExclusionPeriods](self, "endExclusionPeriods");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
          v26 = v13;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v5, "compare:", v24) == 1;

          v13 = v26;
        }
        else
        {
          v20 = 0;
        }

        if (v19 != -1)
          goto LABEL_16;
      }

LABEL_16:
      v15 = !v20;
      goto LABEL_17;
    }
    -[PLBBPowerToolService endExclusionPeriods](self, "endExclusionPeriods");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "count");

    if (v16)
      goto LABEL_7;
    goto LABEL_10;
  }
  v15 = 1;
LABEL_17:

  return v15;
}

- (BOOL)containsExclusionsAfterCleanupWithDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;

  v4 = a3;
  -[PLBBPowerToolService startExclusionPeriods](self, "startExclusionPeriods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "count");

  if (v6)
  {
    while (1)
    {
      -[PLBBPowerToolService endExclusionPeriods](self, "endExclusionPeriods");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");
      if (v8)
      {
        -[PLBBPowerToolService endExclusionPeriods](self, "endExclusionPeriods");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "compare:", v6) == -1)
          break;
      }
      -[PLBBPowerToolService endExclusionPeriods](self, "endExclusionPeriods");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v8)
      {

      }
      if (!v10)
        goto LABEL_10;
      -[PLBBPowerToolService startExclusionPeriods](self, "startExclusionPeriods");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectAtIndex:", 0);

      -[PLBBPowerToolService endExclusionPeriods](self, "endExclusionPeriods");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectAtIndex:", 0);

      -[PLBBPowerToolService startExclusionPeriods](self, "startExclusionPeriods");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (!v14)
        goto LABEL_8;
    }

LABEL_10:
    v15 = 1;
  }
  else
  {
LABEL_8:
    v15 = 0;
  }

  return v15;
}

- (double)percentageHistogramFromArray:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  double v11;
  void *v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "doubleValue", (_QWORD)v15);
          v8 = v8 + v10;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }

    objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v4, "count") - 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v11 = v13 / v8 * 100.0;

  }
  else
  {
    v11 = 0.0;
  }

  return v11;
}

- (double)calculateMaxPerepherialPercentageWithEntry:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  _QWORD *v14;
  void *v15;
  double v16;
  void *v18;
  double v19;
  void *v20;
  double v21;
  double v22;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE753F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x24BE74FD8], "isBasebandClass:", 1003001) & 1) != 0
    || (objc_msgSend(MEMORY[0x24BE74FD8], "isBasebandClass:", 1003002) & 1) != 0
    || objc_msgSend(MEMORY[0x24BE74FD8], "isBasebandClass:", 1003003))
  {
    -[PLBBPowerToolService percentageHistogramFromArray:](self, "percentageHistogramFromArray:", v5);
    v7 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE752E0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLBBPowerToolService percentageHistogramFromArray:](self, "percentageHistogramFromArray:", v8);
    if (v7 < v9)
      v7 = v9;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE753F0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLBBPowerToolService percentageHistogramFromArray:](self, "percentageHistogramFromArray:", v10);
    if (v7 < v11)
      v7 = v11;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE752D8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLBBPowerToolService percentageHistogramFromArray:](self, "percentageHistogramFromArray:", v12);
    if (v7 < v13)
      v7 = v13;
    v14 = (_QWORD *)MEMORY[0x24BE75400];
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE753D0]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLBBPowerToolService percentageHistogramFromArray:](self, "percentageHistogramFromArray:", v18);
    v7 = v19;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE753C0]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLBBPowerToolService percentageHistogramFromArray:](self, "percentageHistogramFromArray:", v20);
    if (v7 < v21)
      v7 = v21;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE753C8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLBBPowerToolService percentageHistogramFromArray:](self, "percentageHistogramFromArray:", v12);
    if (v7 < v22)
      v7 = v22;
    v14 = (_QWORD *)MEMORY[0x24BE753D8];
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLBBPowerToolService percentageHistogramFromArray:](self, "percentageHistogramFromArray:", v15);
  if (v7 < v16)
    v7 = v16;

  return v7;
}

- (void)submitAWD
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  double v23;
  unsigned int v24;
  void *v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unsigned __int8 v32;
  char v33;
  unsigned int v34;
  unsigned int v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  int v41;
  int v42;
  unsigned int v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  int v47;
  unsigned int v48;
  int v49;
  unsigned int v50;
  _OWORD *v51;
  _OWORD *v52;
  id v53;
  BOOL v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  unsigned int v61;
  unint64_t v62;
  PLBBPowerToolService *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _OWORD v69[3];
  _OWORD v70[3];
  _OWORD v71[3];
  _OWORD v72[3];
  _OWORD v73[3];
  _OWORD v74[3];
  _OWORD v75[3];
  _OWORD v76[3];
  _OWORD v77[10];
  int v78;
  _OWORD v79[10];
  int v80;
  _OWORD v81[10];
  int v82;
  _OWORD v83[10];
  int v84;
  _OWORD v85[10];
  int v86;
  _OWORD v87[10];
  int v88;
  _OWORD v89[10];
  int v90;
  _OWORD v91[10];
  int v92;
  _BYTE v93[128];
  _OWORD v94[25];
  int v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2B20]), "initWithComponentId:andBlockOnConfiguration:", 31, 1);
  v4 = objc_msgSend(v3, "newMetricContainerWithIdentifier:", 2031617);
  v5 = (void *)v4;
  if (v4)
  {
    v58 = (void *)v4;
    v59 = v3;
    v60 = objc_alloc_init(MEMORY[0x24BED1F20]);
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDateWithTimeIntervalSinceNow:", -86400.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "monotonicDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    v9 = v8;
    objc_msgSend(v7, "timeIntervalSince1970");
    v11 = v10 - v9;

    v12 = 0x24EB5C000uLL;
    +[PLOperator entryKeyForType:andName:](PLBBPowerToolService, "entryKeyForType:andName:", *MEMORY[0x24BE75200], CFSTR("AggregatedARMUtil"));
    v13 = objc_claimAutoreleasedReturnValue();
    -[PLOperator storage](self, "storage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)v13;
    objc_msgSend(v14, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v13, 86400.0, v9, v11);
    v15 = objc_claimAutoreleasedReturnValue();

    v56 = (void *)v15;
    objc_msgSend(MEMORY[0x24BE74FB8], "summarizeAggregateEntries:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = 0;
    memset(v94, 0, sizeof(v94));
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v93, 16);
    if (v17)
    {
      v18 = v17;
      v63 = self;
      v19 = *(_QWORD *)v66;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v66 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ArmUtilBucket"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "doubleValue");
          v24 = v23;

          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ArmUtilCount"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "doubleValue");
          *((_DWORD *)v94 + v24) = (int)v26;

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v93, 16);
      }
      while (v18);
      self = v63;
      v12 = 0x24EB5C000;
    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(v60, "setArmUtilityPDFs:count:", v94, 101);
    objc_msgSend(*(id *)(v12 + 2048), "entryKeyForType:andName:", *MEMORY[0x24BE75230], CFSTR("bbPowerPointCause"));
    v27 = objc_claimAutoreleasedReturnValue();
    -[PLOperator storage](self, "storage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)v27;
    objc_msgSend(v28, "entriesForKey:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v92 = 0;
    memset(v91, 0, sizeof(v91));
    v90 = 0;
    memset(v89, 0, sizeof(v89));
    v88 = 0;
    memset(v87, 0, sizeof(v87));
    v86 = 0;
    memset(v85, 0, sizeof(v85));
    v84 = 0;
    memset(v83, 0, sizeof(v83));
    v82 = 0;
    memset(v81, 0, sizeof(v81));
    v80 = 0;
    memset(v79, 0, sizeof(v79));
    v78 = 0;
    memset(v77, 0, sizeof(v77));
    memset(v76, 0, sizeof(v76));
    memset(v75, 0, sizeof(v75));
    memset(v74, 0, sizeof(v74));
    memset(v73, 0, sizeof(v73));
    memset(v72, 0, sizeof(v72));
    memset(v71, 0, sizeof(v71));
    memset(v70, 0, sizeof(v70));
    memset(v69, 0, sizeof(v69));
    v64 = v29;
    if (objc_msgSend(v29, "count") != -1)
    {
      v30 = 0;
      v31 = 0;
      v62 = 0;
      v32 = 0;
      v33 = 0;
      v34 = 0;
      v35 = 1;
      while (1)
      {
        v36 = v31;
        if (objc_msgSend(v64, "count") == v30)
          goto LABEL_24;
        objc_msgSend(v64, "objectAtIndexedSubscript:", v30);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("ArmUtil"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "doubleValue");
        v24 = v39;

        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("cause"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35 == 1)
        {
          v33 = 0;
          v32 = 1;
          v34 = v24;
          LODWORD(v62) = 1;
          HIDWORD(v62) = v24;
        }
        else
        {
          v61 = v34;
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("IsContinuous"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "BOOLValue");

          if (!v41)
          {

            v34 = v61;
LABEL_24:
            if (v34 <= 0x3C)
              v47 = 60;
            else
              v47 = v34;
            ++*((_DWORD *)v77 + (v47 - 60));
            v48 = 120 * v32;
            if (v48 >= 0xB)
              v48 = 11;
            ++*((_DWORD *)v69 + v48);
            v33 = 1;
            v34 = v24;
            v32 = 1;
            goto LABEL_30;
          }
          v42 = objc_msgSend(v31, "isEqualToString:", v36);
          v43 = v62;
          v44 = HIDWORD(v62);
          if (v42)
          {
            v44 = (v24 + HIDWORD(v62) * v62) / (v62 + 1);
            v43 = v62 + 1;
          }
          else
          {
            v33 = 1;
          }
          v62 = __PAIR64__(v44, v43);
          v45 = v24 + v61 * v32;
          v46 = ++v32;
          v34 = v45 / v46;
        }

        if ((v33 & 1) == 0)
          goto LABEL_53;
LABEL_30:
        if (v31)
        {
          if (HIDWORD(v62) <= 0x3C)
            v49 = 60;
          else
            v49 = HIDWORD(v62);
          if (120 * v32 >= 0xB)
            v50 = 11;
          else
            v50 = 120 * v32;
          if ((objc_msgSend(v31, "isEqualToString:", CFSTR("RACHFail")) & 1) != 0)
          {
            v51 = v76;
            v52 = v91;
            goto LABEL_51;
          }
          if ((objc_msgSend(v31, "isEqualToString:", CFSTR("OOS")) & 1) != 0)
          {
            v51 = v75;
            v52 = v89;
            goto LABEL_51;
          }
          if ((objc_msgSend(v31, "isEqualToString:", CFSTR("TcXONotShutting")) & 1) != 0)
          {
            v51 = v74;
            v52 = v87;
            goto LABEL_51;
          }
          if ((objc_msgSend(v31, "isEqualToString:", CFSTR("MarginalCoverage")) & 1) != 0)
          {
            v51 = v73;
            v52 = v85;
            goto LABEL_51;
          }
          if ((objc_msgSend(v31, "isEqualToString:", CFSTR("Background")) & 1) != 0)
          {
            v51 = v72;
            v52 = v83;
            goto LABEL_51;
          }
          if ((objc_msgSend(v31, "isEqualToString:", CFSTR("struckInDCH")) & 1) != 0)
          {
            v51 = v71;
            v52 = v81;
            goto LABEL_51;
          }
          if (objc_msgSend(v31, "isEqualToString:", CFSTR("Unknown")))
          {
            v51 = v70;
            v52 = v79;
LABEL_51:
            v33 = 0;
            ++*((_DWORD *)v52 + (v49 - 60));
            ++*((_DWORD *)v51 + v50);
          }
          else
          {
            v33 = 0;
          }
          LODWORD(v62) = 1;
          HIDWORD(v62) = v24;
        }
LABEL_53:
        v53 = v36;

        v30 = v35;
        v54 = objc_msgSend(v64, "count") + 1 > (unint64_t)v35++;
        v31 = v53;
        if (!v54)
          goto LABEL_57;
      }
    }
    v53 = 0;
LABEL_57:
    v3 = v59;
    objc_msgSend(v60, "setTimestamp:", objc_msgSend(v59, "getAWDTimestamp"));
    objc_msgSend(v60, "setCauseCodeRACHFailARMUtilitys:count:", v91, 41);
    objc_msgSend(v60, "setCauseCodeRACHFailDurations:count:", v76, 12);
    objc_msgSend(v60, "setCauseCodeOOSARMUtilitys:count:", v89, 41);
    objc_msgSend(v60, "setCauseCodeOOSDurations:count:", v75, 12);
    objc_msgSend(v60, "setCauseCodeTcXONotShuttingARMUtilitys:count:", v87, 41);
    objc_msgSend(v60, "setCauseCodeTcXONotShuttingDurations:count:", v74, 12);
    objc_msgSend(v60, "setCauseCodeMarginalCoverageARMUtilitys:count:", v85, 41);
    objc_msgSend(v60, "setCauseCodeMarginalCoverageDurations:count:", v73, 12);
    objc_msgSend(v60, "setCauseCodeBackgroundActivityARMUtilitys:count:", v83, 41);
    objc_msgSend(v60, "setCauseCodeBackgroundActivityDurations:count:", v72, 12);
    objc_msgSend(v60, "setCauseCodeStruckInDCHARMUtilitys:count:", v81, 41);
    objc_msgSend(v60, "setCauseCodeStruckInDCHDurations:count:", v71, 12);
    objc_msgSend(v60, "setCauseCodeUnknownARMUtilitys:count:", v79, 41);
    objc_msgSend(v60, "setCauseCodeUnknownDurations:count:", v70, 12);
    v5 = v58;
    objc_msgSend(v58, "setMetric:", v60);
    objc_msgSend(v59, "submitMetric:", v58);

  }
}

- (unsigned)exclusionMask
{
  return self->_exclusionMask;
}

- (void)setExclusionMask:(unsigned __int8)a3
{
  self->_exclusionMask = a3;
}

- (PLEntryNotificationOperatorComposition)audioEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAudioEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLEntryNotificationOperatorComposition)displayEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDisplayEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLEntryNotificationOperatorComposition)hotspotEventCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHotspotEventCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLEntryNotificationOperatorComposition)bbHwOtherCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBbHwOtherCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLEntryNotificationOperatorComposition)msgLiteCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMsgLiteCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (PLEntryNotificationOperatorComposition)wcdmaRRCCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setWcdmaRRCCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (PLEntryNotificationOperatorComposition)lteRRCCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLteRRCCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (PLEntryNotificationOperatorComposition)telActivityCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTelActivityCallback:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (PLNSNotificationOperatorComposition)dailyTaskNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDailyTaskNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSMutableArray)startExclusionPeriods
{
  return (NSMutableArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setStartExclusionPeriods:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSMutableArray)endExclusionPeriods
{
  return (NSMutableArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setEndExclusionPeriods:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (double)elapsedDenumerator
{
  return self->_elapsedDenumerator;
}

- (void)setElapsedDenumerator:(double)a3
{
  self->_elapsedDenumerator = a3;
}

- (double)totalNormalARMUtility
{
  return self->_totalNormalARMUtility;
}

- (void)setTotalNormalARMUtility:(double)a3
{
  self->_totalNormalARMUtility = a3;
}

- (double)armUtilityThresholdVal
{
  return self->_armUtilityThresholdVal;
}

- (void)setArmUtilityThresholdVal:(double)a3
{
  self->_armUtilityThresholdVal = a3;
}

- (double)magicDeltaThresholdVal
{
  return self->_magicDeltaThresholdVal;
}

- (void)setMagicDeltaThresholdVal:(double)a3
{
  self->_magicDeltaThresholdVal = a3;
}

- (double)oosDurationVal
{
  return self->_oosDurationVal;
}

- (void)setOosDurationVal:(double)a3
{
  self->_oosDurationVal = a3;
}

- (double)rrcDisconnectedVal
{
  return self->_rrcDisconnectedVal;
}

- (void)setRrcDisconnectedVal:(double)a3
{
  self->_rrcDisconnectedVal = a3;
}

- (NSDate)startSamplingDate
{
  return (NSDate *)objc_getProperty(self, a2, 200, 1);
}

- (void)setStartSamplingDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (PLTelephonyConnection)connection
{
  return (PLTelephonyConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (double)gArmUtil
{
  return self->_gArmUtil;
}

- (void)setGArmUtil:(double)a3
{
  self->_gArmUtil = a3;
}

- (int)gPerepherialMax
{
  return self->_gPerepherialMax;
}

- (void)setGPerepherialMax:(int)a3
{
  self->_gPerepherialMax = a3;
}

- (NSDate)notToRemoveDate
{
  return (NSDate *)objc_getProperty(self, a2, 224, 1);
}

- (void)setNotToRemoveDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (BOOL)sendAWD
{
  return self->_sendAWD;
}

- (void)setSendAWD:(BOOL)a3
{
  self->_sendAWD = a3;
}

- (BOOL)doesCurrPackageHasProblem
{
  return self->_doesCurrPackageHasProblem;
}

- (void)setDoesCurrPackageHasProblem:(BOOL)a3
{
  self->_doesCurrPackageHasProblem = a3;
}

- (BOOL)doesPrevPackageHasProblem
{
  return self->_doesPrevPackageHasProblem;
}

- (void)setDoesPrevPackageHasProblem:(BOOL)a3
{
  self->_doesPrevPackageHasProblem = a3;
}

- (BOOL)isUIAlertEnabled
{
  return self->_isUIAlertEnabled;
}

- (void)setIsUIAlertEnabled:(BOOL)a3
{
  self->_isUIAlertEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notToRemoveDate, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_startSamplingDate, 0);
  objc_storeStrong((id *)&self->_endExclusionPeriods, 0);
  objc_storeStrong((id *)&self->_startExclusionPeriods, 0);
  objc_storeStrong((id *)&self->_dailyTaskNotification, 0);
  objc_storeStrong((id *)&self->_telActivityCallback, 0);
  objc_storeStrong((id *)&self->_lteRRCCallback, 0);
  objc_storeStrong((id *)&self->_wcdmaRRCCallback, 0);
  objc_storeStrong((id *)&self->_msgLiteCallback, 0);
  objc_storeStrong((id *)&self->_bbHwOtherCallback, 0);
  objc_storeStrong((id *)&self->_hotspotEventCallback, 0);
  objc_storeStrong((id *)&self->_displayEventCallback, 0);
  objc_storeStrong((id *)&self->_audioEventCallback, 0);
}

@end
