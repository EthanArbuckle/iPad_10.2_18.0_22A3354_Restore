@implementation SCDAFParticipation

- (id)initNearMiss
{
  SCDAFParticipation *v2;
  SCDAFParticipation *v3;
  NSDate *v4;
  NSDate *requestStartDate;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SCDAFParticipation;
  v2 = -[SCDAFParticipation init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_result = 1;
    v4 = (NSDate *)objc_alloc_init(MEMORY[0x24BDBCE60]);
    requestStartDate = v3->_requestStartDate;
    v3->_requestStartDate = v4;

  }
  return v3;
}

- (SCDAFParticipation)initWithAdvertisement:(id)a3 boosts:(id)a4 cdaId:(id)a5 rawGoodnessScore:(double)a6 requestStartDate:(id)a7 result:(unint64_t)a8 seenAdvertisements:(id)a9 timeSinceLastTriggerInMilliseconds:(id)a10 timeSinceLastWinInMilliseconds:(id)a11 triggerType:(id)a12 trumpReasons:(id)a13 voiceTriggerDate:(id)a14 winnerAdvertisement:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  SCDAFParticipation *v24;
  SCDAFParticipation *v25;
  id v28;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  objc_super v38;

  v37 = a3;
  v36 = a4;
  v28 = a5;
  v35 = a5;
  v34 = a7;
  v33 = a9;
  v32 = a10;
  v31 = a11;
  v20 = a12;
  v21 = a13;
  v22 = a14;
  v23 = a15;
  v38.receiver = self;
  v38.super_class = (Class)SCDAFParticipation;
  v24 = -[SCDAFParticipation init](&v38, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_advertisement, a3);
    objc_storeStrong((id *)&v25->_boosts, a4);
    objc_storeStrong((id *)&v25->_cdaId, v28);
    v25->_rawGoodnessScore = a6;
    objc_storeStrong((id *)&v25->_requestStartDate, a7);
    v25->_result = a8;
    objc_storeStrong((id *)&v25->_seenAdvertisements, a9);
    objc_storeStrong((id *)&v25->_timeSinceTriggerInMilliseconds, a10);
    objc_storeStrong((id *)&v25->_timeSinceLastWinInMilliseconds, a11);
    objc_storeStrong((id *)&v25->_triggerType, a12);
    objc_storeStrong((id *)&v25->_trumpReasons, a13);
    objc_storeStrong((id *)&v25->_voiceTriggerDate, a14);
    objc_storeStrong((id *)&v25->_winnerAdvertisement, a15);
  }

  return v25;
}

- (SCDAFParticipation)initWithAdvertisement:(id)a3 alarmState:(id)a4 boosts:(id)a5 cdaId:(id)a6 device:(id)a7 mediaState:(id)a8 nearbyDevices:(id)a9 rawGoodnessScore:(double)a10 requestId:(id)a11 requestStartDate:(id)a12 result:(unint64_t)a13 seenAdvertisements:(id)a14 timeSinceLastTriggerInMilliseconds:(id)a15 timeSinceLastWinInMilliseconds:(id)a16 timerState:(id)a17 triggerType:(id)a18 trumpReasons:(id)a19 userRequestText:(id)a20 voiceTriggerDate:(id)a21 winnerAdvertisement:(id)a22
{
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  SCDAFParticipation *v34;
  SCDAFParticipation *v35;
  SCDAFDevice *v36;
  SCDAFDevice *device;
  id v40;
  id v41;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  objc_super v55;

  v52 = a3;
  v40 = a4;
  v51 = a4;
  v41 = a5;
  v49 = a5;
  v47 = a6;
  v45 = a7;
  v43 = a8;
  v54 = a9;
  v53 = a11;
  v50 = a12;
  v48 = a14;
  v46 = a15;
  v44 = a16;
  v28 = a17;
  v29 = a18;
  v30 = a19;
  v31 = a20;
  v32 = a21;
  v33 = a22;
  v55.receiver = self;
  v55.super_class = (Class)SCDAFParticipation;
  v34 = -[SCDAFParticipation init](&v55, sel_init);
  v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_advertisement, a3);
    objc_storeStrong((id *)&v35->_alarmState, v40);
    objc_storeStrong((id *)&v35->_boosts, v41);
    objc_storeStrong((id *)&v35->_cdaId, a6);
    objc_storeStrong((id *)&v35->_device, a7);
    objc_storeStrong((id *)&v35->_mediaState, a8);
    objc_storeStrong((id *)&v35->_nearbyDevices, a9);
    v35->_rawGoodnessScore = a10;
    objc_storeStrong((id *)&v35->_requestId, a11);
    objc_storeStrong((id *)&v35->_requestStartDate, a12);
    v35->_result = a13;
    objc_storeStrong((id *)&v35->_seenAdvertisements, a14);
    objc_storeStrong((id *)&v35->_timeSinceTriggerInMilliseconds, a15);
    objc_storeStrong((id *)&v35->_timeSinceLastWinInMilliseconds, a16);
    objc_storeStrong((id *)&v35->_timerState, a17);
    objc_storeStrong((id *)&v35->_triggerType, a18);
    objc_storeStrong((id *)&v35->_trumpReasons, a19);
    objc_storeStrong((id *)&v35->_voiceTriggerDate, a21);
    objc_storeStrong((id *)&v35->_userRequestText, a20);
    objc_storeStrong((id *)&v35->_winnerAdvertisement, a22);
    v36 = objc_alloc_init(SCDAFDevice);
    device = v35->_device;
    v35->_device = v36;

  }
  return v35;
}

- (SCDAFParticipation)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  SCDAFParticipation *v5;
  void *v6;
  SCDAFAdvertisement *v7;
  void *v8;
  uint64_t v9;
  SCDAFAdvertisement *advertisement;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSArray *boosts;
  void *v18;
  char v19;
  void *v20;
  SCDAFDevice *v21;
  uint64_t v22;
  uint64_t v23;
  SCDAFDevice *device;
  void *v25;
  uint64_t v26;
  NSDate *requestStartDate;
  void *v28;
  char v29;
  uint64_t v30;
  NSDate *voiceTriggerDate;
  void *v32;
  uint64_t v33;
  NSArray *seenAdvertisements;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSArray *nearbyDevices;
  void *v40;
  void *v41;
  uint64_t v42;
  NSString *userRequestText;
  void *v44;
  SCDAFAdvertisement *v45;
  void *v46;
  uint64_t v47;
  SCDAFAdvertisement *winnerAdvertisement;
  void *v49;
  char v50;
  void *v51;
  uint64_t v52;
  NSString *requestId;
  void *v54;
  char v55;
  void *v56;
  uint64_t v57;
  NSString *cdaId;
  void *v59;
  char v60;
  uint64_t v61;
  NSNumber *alarmState;
  void *v63;
  char v64;
  uint64_t v65;
  NSNumber *timerState;
  void *v67;
  char v68;
  uint64_t v69;
  NSNumber *mediaState;
  void *v71;
  char v72;
  uint64_t v73;
  NSNumber *triggerType;
  void *v75;
  char v76;
  uint64_t v77;
  NSNumber *timeSinceLastWinInMilliseconds;
  void *v79;
  char v80;
  uint64_t v81;
  NSNumber *timeSinceTriggerInMilliseconds;
  _QWORD v84[4];
  id v85;
  objc_super v86;

  v4 = a3;
  v86.receiver = self;
  v86.super_class = (Class)SCDAFParticipation;
  v5 = -[SCDAFParticipation init](&v86, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("winnerAdvertisement"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SCDAFAdvertisement alloc];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("advertisement"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SCDAFAdvertisement initWithDictionaryRepresentation:](v7, "initWithDictionaryRepresentation:", v8);
      advertisement = v5->_advertisement;
      v5->_advertisement = (SCDAFAdvertisement *)v9;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("result"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("result"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_result = objc_msgSend(v13, "integerValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("boosts"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("boosts"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[SCDAFBoost boostsArrayWithDictionaryRepresentation:](SCDAFBoost, "boostsArrayWithDictionaryRepresentation:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      boosts = v5->_boosts;
      v5->_boosts = (NSArray *)v16;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawGoodnessScore"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v19 = objc_opt_isKindOfClass();

    if ((v19 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rawGoodnessScore"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_rawGoodnessScore = (double)objc_msgSend(v20, "integerValue");

    }
    v21 = [SCDAFDevice alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("device"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = -[SCDAFDevice initWithDictionaryRepresentation:](v21, "initWithDictionaryRepresentation:", v22);
    device = v5->_device;
    v5->_device = (SCDAFDevice *)v23;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestStartDate"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v22) = objc_opt_isKindOfClass();

    if ((v22 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestStartDate"));
      v26 = objc_claimAutoreleasedReturnValue();
      requestStartDate = v5->_requestStartDate;
      v5->_requestStartDate = (NSDate *)v26;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestStartDate"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v29 = objc_opt_isKindOfClass();

    if ((v29 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("voiceTriggerDate"));
      v30 = objc_claimAutoreleasedReturnValue();
      voiceTriggerDate = v5->_voiceTriggerDate;
      v5->_voiceTriggerDate = (NSDate *)v30;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("seenAdvertisements"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCDAFAdvertisement advertisementsArrayWithDictionaryRepresentation:](SCDAFAdvertisement, "advertisementsArrayWithDictionaryRepresentation:", v32);
    v33 = objc_claimAutoreleasedReturnValue();
    seenAdvertisements = v5->_seenAdvertisements;
    v5->_seenAdvertisements = (NSArray *)v33;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trumpReasons"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v84[0] = MEMORY[0x24BDAC760];
      v84[1] = 3221225472;
      v84[2] = __55__SCDAFParticipation_initWithDictionaryRepresentation___block_invoke;
      v84[3] = &unk_25175B3B0;
      v85 = v35;
      objc_msgSend(v36, "enumerateObjectsUsingBlock:", v84);

    }
    objc_storeStrong((id *)&v5->_trumpReasons, v35);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nearbyDevices"));
    v37 = objc_claimAutoreleasedReturnValue();
    +[SCDAFDevice devicesArrayWithDictionaryRepresentation:](SCDAFDevice, "devicesArrayWithDictionaryRepresentation:", v37);
    v38 = objc_claimAutoreleasedReturnValue();
    nearbyDevices = v5->_nearbyDevices;
    v5->_nearbyDevices = (NSArray *)v38;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userRequestText"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    LOBYTE(v37) = objc_opt_isKindOfClass();

    if ((v37 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userRequestText"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "copy");
      userRequestText = v5->_userRequestText;
      v5->_userRequestText = (NSString *)v42;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("winnerAdvertisement"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      v45 = [SCDAFAdvertisement alloc];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("winnerAdvertisement"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = -[SCDAFAdvertisement initWithDictionaryRepresentation:](v45, "initWithDictionaryRepresentation:", v46);
      winnerAdvertisement = v5->_winnerAdvertisement;
      v5->_winnerAdvertisement = (SCDAFAdvertisement *)v47;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestId"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v50 = objc_opt_isKindOfClass();

    if ((v50 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestId"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "copy");
      requestId = v5->_requestId;
      v5->_requestId = (NSString *)v52;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdaId"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v55 = objc_opt_isKindOfClass();

    if ((v55 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cdaId"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "copy");
      cdaId = v5->_cdaId;
      v5->_cdaId = (NSString *)v57;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alarmState"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v60 = objc_opt_isKindOfClass();

    if ((v60 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alarmState"));
      v61 = objc_claimAutoreleasedReturnValue();
      alarmState = v5->_alarmState;
      v5->_alarmState = (NSNumber *)v61;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timerState"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v64 = objc_opt_isKindOfClass();

    if ((v64 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timerState"));
      v65 = objc_claimAutoreleasedReturnValue();
      timerState = v5->_timerState;
      v5->_timerState = (NSNumber *)v65;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaState"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v68 = objc_opt_isKindOfClass();

    if ((v68 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaState"));
      v69 = objc_claimAutoreleasedReturnValue();
      mediaState = v5->_mediaState;
      v5->_mediaState = (NSNumber *)v69;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerType"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v72 = objc_opt_isKindOfClass();

    if ((v72 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("triggerType"));
      v73 = objc_claimAutoreleasedReturnValue();
      triggerType = v5->_triggerType;
      v5->_triggerType = (NSNumber *)v73;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceLastWinInMilliseconds"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v76 = objc_opt_isKindOfClass();

    if ((v76 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceLastWinInMilliseconds"));
      v77 = objc_claimAutoreleasedReturnValue();
      timeSinceLastWinInMilliseconds = v5->_timeSinceLastWinInMilliseconds;
      v5->_timeSinceLastWinInMilliseconds = (NSNumber *)v77;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceTriggerInMilliseconds"));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v80 = objc_opt_isKindOfClass();

    if ((v80 & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timeSinceTriggerInMilliseconds"));
      v81 = objc_claimAutoreleasedReturnValue();
      timeSinceTriggerInMilliseconds = v5->_timeSinceTriggerInMilliseconds;
      v5->_timeSinceTriggerInMilliseconds = (NSNumber *)v81;

    }
  }

  return v5;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SCDAFParticipation dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dictionaryRepresentation
{
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCDAFParticipation advertisement](self, "advertisement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SCDAFParticipation advertisement](self, "advertisement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("advertisement"));

  }
  -[SCDAFParticipation winnerAdvertisement](self, "winnerAdvertisement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SCDAFParticipation winnerAdvertisement](self, "winnerAdvertisement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("winnerAdvertisement"));

  }
  -[SCDAFParticipation seenAdvertisements](self, "seenAdvertisements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SCDAFParticipation seenAdvertisements](self, "seenAdvertisements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCDAFAdvertisement arrayDictionaryRepresentation:](SCDAFAdvertisement, "arrayDictionaryRepresentation:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("seenAdvertisements"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SCDAFParticipation result](self, "result"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("result"));

  v14 = (void *)MEMORY[0x24BDD16E0];
  -[SCDAFParticipation rawGoodnessScore](self, "rawGoodnessScore");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("rawGoodnessScore"));

  -[SCDAFParticipation device](self, "device");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SCDAFParticipation device](self, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("device"));

  }
  -[SCDAFParticipation requestStartDate](self, "requestStartDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[SCDAFParticipation requestStartDate](self, "requestStartDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("requestStartDate"));

  }
  -[SCDAFParticipation voiceTriggerDate](self, "voiceTriggerDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[SCDAFParticipation voiceTriggerDate](self, "voiceTriggerDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("voiceTriggerDate"));

  }
  -[SCDAFParticipation userRequestText](self, "userRequestText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v24)
  {
    -[SCDAFParticipation userRequestText](self, "userRequestText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("userRequestText"));

  }
  -[SCDAFParticipation trumpReasons](self, "trumpReasons");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27)
  {
    -[SCDAFParticipation trumpReasons](self, "trumpReasons");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("trumpReasons"));

  }
  -[SCDAFParticipation nearbyDevices](self, "nearbyDevices");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");

  if (v30)
  {
    -[SCDAFParticipation nearbyDevices](self, "nearbyDevices");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCDAFDevice arrayDictionaryRepresentation:](SCDAFDevice, "arrayDictionaryRepresentation:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("nearbyDevices"));

  }
  -[SCDAFParticipation boosts](self, "boosts");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");

  if (v34)
  {
    -[SCDAFParticipation boosts](self, "boosts");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCDAFBoost arrayDictionaryRepresentation:](SCDAFBoost, "arrayDictionaryRepresentation:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("boosts"));

  }
  -[SCDAFParticipation requestId](self, "requestId");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "length");

  if (v38)
  {
    -[SCDAFParticipation requestId](self, "requestId");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("requestId"));

  }
  -[SCDAFParticipation cdaId](self, "cdaId");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "length");

  if (v41)
  {
    -[SCDAFParticipation cdaId](self, "cdaId");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("cdaId"));

  }
  -[SCDAFParticipation alarmState](self, "alarmState");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("alarmState"));

  -[SCDAFParticipation timerState](self, "timerState");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("timerState"));

  -[SCDAFParticipation mediaState](self, "mediaState");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("mediaState"));

  -[SCDAFParticipation triggerType](self, "triggerType");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("triggerType"));

  -[SCDAFParticipation timeSinceLastWinInMilliseconds](self, "timeSinceLastWinInMilliseconds");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("timeSinceLastWinInMilliseconds"));

  -[SCDAFParticipation timeSinceTriggerInMilliseconds](self, "timeSinceTriggerInMilliseconds");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("timeSinceTriggerInMilliseconds"));

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  return v49;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double rawGoodnessScore;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD16E0];
  rawGoodnessScore = self->_rawGoodnessScore;
  v8 = a3;
  objc_msgSend(v4, "numberWithDouble:", rawGoodnessScore);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("rawGoodnessScore"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_requestStartDate, CFSTR("requestStartDate"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_voiceTriggerDate, CFSTR("voiceTriggerDate"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_userRequestText, CFSTR("userRequestText"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_result);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("result"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_device, CFSTR("device"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_advertisement, CFSTR("advertisement"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_winnerAdvertisement, CFSTR("winnerAdvertisement"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_seenAdvertisements, CFSTR("seenAdvertisements"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_boosts, CFSTR("boosts"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_trumpReasons, CFSTR("trumpReasons"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_nearbyDevices, CFSTR("nearbyDevices"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_requestId, CFSTR("requestId"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_cdaId, CFSTR("cdaId"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_alarmState, CFSTR("alarmState"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_timerState, CFSTR("timerState"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_mediaState, CFSTR("mediaState"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_triggerType, CFSTR("triggerType"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_timeSinceLastWinInMilliseconds, CFSTR("timeSinceLastWinInMilliseconds"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_timeSinceTriggerInMilliseconds, CFSTR("timeSinceTriggerInMilliseconds"));

}

- (SCDAFParticipation)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SCDAFParticipation *v9;
  float v10;
  void *v12;
  void *v13;
  void *v14;
  SCDAFParticipation *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawGoodnessScore"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestStartDate"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("voiceTriggerDate"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userRequestText"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("result"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("device"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("advertisement"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("winnerAdvertisement"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("seenAdvertisements"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("trumpReasons"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("boosts"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("nearbyDevices"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cdaId"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alarmState"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timerState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaState"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("triggerType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeSinceLastWinInMilliseconds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeSinceTriggerInMilliseconds"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [SCDAFParticipation alloc];
  objc_msgSend(v27, "floatValue");
  v15 = -[SCDAFParticipation initWithAdvertisement:alarmState:boosts:cdaId:device:mediaState:nearbyDevices:rawGoodnessScore:requestId:requestStartDate:result:seenAdvertisements:timeSinceLastTriggerInMilliseconds:timeSinceLastWinInMilliseconds:timerState:triggerType:trumpReasons:userRequestText:voiceTriggerDate:winnerAdvertisement:](v9, "initWithAdvertisement:alarmState:boosts:cdaId:device:mediaState:nearbyDevices:rawGoodnessScore:requestId:requestStartDate:result:seenAdvertisements:timeSinceLastTriggerInMilliseconds:timeSinceLastWinInMilliseconds:timerState:triggerType:trumpReasons:userRequestText:voiceTriggerDate:winnerAdvertisement:", v19, v5, v18, v17, v20, v16, v10, v13, v4, v28, objc_msgSend(v22, "integerValue"), v25, v8, v7, v12,
          v6,
          v14,
          v26,
          v23,
          v24);

  return v15;
}

- (double)rawGoodnessScore
{
  return self->_rawGoodnessScore;
}

- (void)setRawGoodnessScore:(double)a3
{
  self->_rawGoodnessScore = a3;
}

- (unint64_t)result
{
  return self->_result;
}

- (void)setResult:(unint64_t)a3
{
  self->_result = a3;
}

- (NSNumber)timeSinceLastWinInMilliseconds
{
  return self->_timeSinceLastWinInMilliseconds;
}

- (void)setTimeSinceLastWinInMilliseconds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)timeSinceTriggerInMilliseconds
{
  return self->_timeSinceTriggerInMilliseconds;
}

- (void)setTimeSinceTriggerInMilliseconds:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)cdaId
{
  return self->_cdaId;
}

- (void)setCdaId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)trumpReasons
{
  return self->_trumpReasons;
}

- (void)setTrumpReasons:(id)a3
{
  objc_storeStrong((id *)&self->_trumpReasons, a3);
}

- (NSArray)seenAdvertisements
{
  return self->_seenAdvertisements;
}

- (void)setSeenAdvertisements:(id)a3
{
  objc_storeStrong((id *)&self->_seenAdvertisements, a3);
}

- (NSArray)boosts
{
  return self->_boosts;
}

- (void)setBoosts:(id)a3
{
  objc_storeStrong((id *)&self->_boosts, a3);
}

- (SCDAFDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSDate)requestStartDate
{
  return self->_requestStartDate;
}

- (void)setRequestStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_requestStartDate, a3);
}

- (NSDate)voiceTriggerDate
{
  return self->_voiceTriggerDate;
}

- (void)setVoiceTriggerDate:(id)a3
{
  objc_storeStrong((id *)&self->_voiceTriggerDate, a3);
}

- (SCDAFAdvertisement)advertisement
{
  return self->_advertisement;
}

- (void)setAdvertisement:(id)a3
{
  objc_storeStrong((id *)&self->_advertisement, a3);
}

- (SCDAFAdvertisement)winnerAdvertisement
{
  return self->_winnerAdvertisement;
}

- (void)setWinnerAdvertisement:(id)a3
{
  objc_storeStrong((id *)&self->_winnerAdvertisement, a3);
}

- (NSNumber)alarmState
{
  return self->_alarmState;
}

- (void)setAlarmState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)mediaState
{
  return self->_mediaState;
}

- (void)setMediaState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)timerState
{
  return self->_timerState;
}

- (void)setTimerState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)userRequestText
{
  return self->_userRequestText;
}

- (void)setUserRequestText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)nearbyDevices
{
  return self->_nearbyDevices;
}

- (void)setNearbyDevices:(id)a3
{
  objc_storeStrong((id *)&self->_nearbyDevices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyDevices, 0);
  objc_storeStrong((id *)&self->_userRequestText, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_timerState, 0);
  objc_storeStrong((id *)&self->_mediaState, 0);
  objc_storeStrong((id *)&self->_alarmState, 0);
  objc_storeStrong((id *)&self->_winnerAdvertisement, 0);
  objc_storeStrong((id *)&self->_advertisement, 0);
  objc_storeStrong((id *)&self->_voiceTriggerDate, 0);
  objc_storeStrong((id *)&self->_requestStartDate, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_boosts, 0);
  objc_storeStrong((id *)&self->_seenAdvertisements, 0);
  objc_storeStrong((id *)&self->_trumpReasons, 0);
  objc_storeStrong((id *)&self->_cdaId, 0);
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_timeSinceTriggerInMilliseconds, 0);
  objc_storeStrong((id *)&self->_timeSinceLastWinInMilliseconds, 0);
}

void __55__SCDAFParticipation_initWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_msgSend(v6, "integerValue");
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
