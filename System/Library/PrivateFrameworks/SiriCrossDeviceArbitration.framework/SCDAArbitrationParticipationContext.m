@implementation SCDAArbitrationParticipationContext

- (id)initAdvertisements:(id)a3 decision:(BOOL)a4 requestStartDate:(id)a5 session:(id)a6 voiceTriggerTime:(double)a7 winnerAdvertisement:(id)a8
{
  _BOOL4 v12;
  id v14;
  id v15;
  id v16;
  id v17;
  SCDAArbitrationParticipationContext *v18;
  SCDAArbitrationParticipationContext *v19;
  uint64_t v20;
  NSDate *voiceTriggerDate;
  uint64_t v22;
  objc_super v24;

  v12 = a4;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)SCDAArbitrationParticipationContext;
  v18 = -[SCDAArbitrationParticipationContext init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_cdaId, a6);
    objc_storeStrong((id *)&v19->_requestStartDate, a5);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a7);
    v20 = objc_claimAutoreleasedReturnValue();
    voiceTriggerDate = v19->_voiceTriggerDate;
    v19->_voiceTriggerDate = (NSDate *)v20;

    v22 = 2;
    if (v12)
      v22 = 3;
    v19->_result = v22;
    -[SCDAArbitrationParticipationContext _processAdvertisements:winnerAdvertisement:](v19, "_processAdvertisements:winnerAdvertisement:", v14, v17);
  }

  return v19;
}

- (void)_processAdvertisements:(id)a3 winnerAdvertisement:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  NSArray *v10;
  NSArray *seenAdvertisements;
  NSArray *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  NSArray *v16;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDBCEB8];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithCapacity:", objc_msgSend(v8, "count"));
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __82__SCDAArbitrationParticipationContext__processAdvertisements_winnerAdvertisement___block_invoke;
  v14[3] = &unk_25174A4F8;
  v14[4] = self;
  v15 = v6;
  v10 = v9;
  v16 = v10;
  v13 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);

  seenAdvertisements = self->_seenAdvertisements;
  self->_seenAdvertisements = v10;
  v12 = v10;

}

- (void)updateBoosts:(id)a3 triggerType:(int)a4 lastWin:(unint64_t)a5 lastDecision:(unint64_t)a6
{
  uint64_t v8;
  void *v10;
  uint64_t v11;
  NSNumber *v12;
  NSNumber *msSinceLastWin;
  void *v14;
  uint64_t v15;
  NSNumber *v16;
  NSNumber *msSinceTrigger;
  NSArray *v18;
  NSArray *boosts;
  NSArray *v20;
  NSArray *trumpReasons;
  id v22;

  v8 = *(_QWORD *)&a4;
  v22 = a3;
  if (a5)
  {
    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = mach_absolute_time();
    objc_msgSend(v10, "numberWithUnsignedLongLong:", SCDAMachAbsoluteTimeGetMilliseconds(v11 - a5));
    v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    msSinceLastWin = self->_msSinceLastWin;
    self->_msSinceLastWin = v12;

  }
  if (a6)
  {
    v14 = (void *)MEMORY[0x24BDD16E0];
    v15 = mach_absolute_time();
    objc_msgSend(v14, "numberWithUnsignedLongLong:", SCDAMachAbsoluteTimeGetMilliseconds(v15 - a6));
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    msSinceTrigger = self->_msSinceTrigger;
    self->_msSinceTrigger = v16;

  }
  self->_triggerType = +[SCDAArbitrationParticipationContext _convertTriggerType:](SCDAArbitrationParticipationContext, "_convertTriggerType:", v8);
  +[SCDAArbitrationParticipationContext _convertBoosts:](SCDAArbitrationParticipationContext, "_convertBoosts:", v22);
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  boosts = self->_boosts;
  self->_boosts = v18;

  +[SCDAArbitrationParticipationContext _convertTrumpReason:](SCDAArbitrationParticipationContext, "_convertTrumpReason:", v22);
  v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
  trumpReasons = self->_trumpReasons;
  self->_trumpReasons = v20;

}

- (NSNumber)msSinceLastWin
{
  return self->_msSinceLastWin;
}

- (NSNumber)msSinceTrigger
{
  return self->_msSinceTrigger;
}

- (unint64_t)result
{
  return self->_result;
}

- (unint64_t)triggerType
{
  return self->_triggerType;
}

- (NSArray)trumpReasons
{
  return self->_trumpReasons;
}

- (unsigned)rawGoodnessScore
{
  return self->_rawGoodnessScore;
}

- (NSDate)requestStartDate
{
  return self->_requestStartDate;
}

- (NSDate)voiceTriggerDate
{
  return self->_voiceTriggerDate;
}

- (NSString)cdaId
{
  return self->_cdaId;
}

- (NSArray)seenAdvertisements
{
  return self->_seenAdvertisements;
}

- (NSArray)boosts
{
  return self->_boosts;
}

- (SCDAFAdvertisement)myAdvertisement
{
  return self->_myAdvertisement;
}

- (SCDAFAdvertisement)winnerAdvertisement
{
  return self->_winnerAdvertisement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_winnerAdvertisement, 0);
  objc_storeStrong((id *)&self->_myAdvertisement, 0);
  objc_storeStrong((id *)&self->_boosts, 0);
  objc_storeStrong((id *)&self->_seenAdvertisements, 0);
  objc_storeStrong((id *)&self->_cdaId, 0);
  objc_storeStrong((id *)&self->_voiceTriggerDate, 0);
  objc_storeStrong((id *)&self->_requestStartDate, 0);
  objc_storeStrong((id *)&self->_trumpReasons, 0);
  objc_storeStrong((id *)&self->_msSinceTrigger, 0);
  objc_storeStrong((id *)&self->_msSinceLastWin, 0);
}

void __82__SCDAArbitrationParticipationContext__processAdvertisements_winnerAdvertisement___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_alloc_init(MEMORY[0x24BE92098]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v11, "pHash"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAdvertHash:", v4);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v11, "userConfidence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConfidence:", objc_msgSend(v5, "integerValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v11, "deviceClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceClass:", objc_msgSend(v6, "integerValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v11, "deviceGroup"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceGroup:", objc_msgSend(v7, "integerValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v11, "goodness"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGoodnessScore:", objc_msgSend(v8, "integerValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v11, "productType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProductType:", objc_msgSend(v9, "integerValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", objc_msgSend(v11, "tieBreaker"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTieBreaker:", objc_msgSend(v10, "integerValue"));

  if (objc_msgSend(v11, "isMe"))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(v11, "rawAudioGoodnessScore");
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), v3);
  }
  if (*(id *)(a1 + 40) == v11)
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), v3);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);

}

+ (unint64_t)_convertTriggerType:(int)a3
{
  if ((a3 - 1) > 7)
    return 0;
  else
    return qword_2462437D0[a3 - 1];
}

+ (id)_convertLastActivationTime:(double)a3
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemUptime");
  v6 = v5;

  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (v6 - a3) * 1000.0);
}

+ (id)_convertTrumpReason:(id)a3
{
  id v3;
  unsigned int v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isTrump") && (v4 = objc_msgSend(v3, "trumpReason"), v4 <= 8))
    v5 = *(&off_25174A518 + v4);
  else
    v5 = (void *)MEMORY[0x24BDBD1A8];

  return v5;
}

+ (id)_convertBoosts:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  float v7;
  id v8;
  void *v9;
  float v10;
  id v11;
  void *v12;
  float v13;
  id v14;
  void *v15;
  float v16;
  id v17;
  void *v18;
  float v19;
  id v20;
  void *v21;
  float v22;
  id v23;
  void *v24;
  float v25;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "deviceBoost"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BE920A0]);
    objc_msgSend(v5, "setKind:", 0);
    objc_msgSend(v5, "setType:", 0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v3, "deviceBoost"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    objc_msgSend(v5, "setBoostValue:", v7);

    objc_msgSend(v4, "addObject:", v5);
  }
  if (objc_msgSend(v3, "recentAlarmBoost"))
  {
    v8 = objc_alloc_init(MEMORY[0x24BE920A0]);
    objc_msgSend(v8, "setKind:", 6);
    objc_msgSend(v8, "setType:", 0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v3, "recentAlarmBoost"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "floatValue");
    objc_msgSend(v8, "setBoostValue:", v10);

    objc_msgSend(v4, "addObject:", v8);
  }
  if (objc_msgSend(v3, "recentMotionBoost"))
  {
    v11 = objc_alloc_init(MEMORY[0x24BE920A0]);
    objc_msgSend(v11, "setKind:", 4);
    objc_msgSend(v11, "setType:", 0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v3, "recentMotionBoost"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    objc_msgSend(v11, "setBoostValue:", v13);

    objc_msgSend(v4, "addObject:", v11);
  }
  if (objc_msgSend(v3, "recentUnlockBoost"))
  {
    v14 = objc_alloc_init(MEMORY[0x24BE920A0]);
    objc_msgSend(v14, "setKind:", 1);
    objc_msgSend(v14, "setType:", 0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v3, "recentUnlockBoost"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    objc_msgSend(v14, "setBoostValue:", v16);

    objc_msgSend(v4, "addObject:", v14);
  }
  if (objc_msgSend(v3, "recentPlaybackBoost"))
  {
    v17 = objc_alloc_init(MEMORY[0x24BE920A0]);
    objc_msgSend(v17, "setKind:", 5);
    objc_msgSend(v17, "setType:", 0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v3, "recentPlaybackBoost"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    objc_msgSend(v17, "setBoostValue:", v19);

    objc_msgSend(v4, "addObject:", v17);
  }
  if (objc_msgSend(v3, "recentSiriRequestBoost"))
  {
    v20 = objc_alloc_init(MEMORY[0x24BE920A0]);
    objc_msgSend(v20, "setKind:", 3);
    objc_msgSend(v20, "setType:", 0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v3, "recentSiriRequestBoost"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    objc_msgSend(v20, "setBoostValue:", v22);

    objc_msgSend(v4, "addObject:", v20);
  }
  if (objc_msgSend(v3, "recentRaiseToWakeBoost"))
  {
    v23 = objc_alloc_init(MEMORY[0x24BE920A0]);
    objc_msgSend(v23, "setKind:", 2);
    objc_msgSend(v23, "setType:", 0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v3, "recentRaiseToWakeBoost"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "floatValue");
    objc_msgSend(v23, "setBoostValue:", v25);

    objc_msgSend(v4, "addObject:", v23);
  }

  return v4;
}

@end
