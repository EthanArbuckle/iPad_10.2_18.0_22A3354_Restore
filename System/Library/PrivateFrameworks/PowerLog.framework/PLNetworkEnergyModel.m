@implementation PLNetworkEnergyModel

- (PLNetworkEnergyModel)initWithLinkType:(unsigned __int8)a3
{
  char *v4;
  PLNetworkEnergyModel *v5;
  void *v6;
  NSArray *linkDuration;
  NSArray *linkCost;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *linkLevel1Parameters;
  objc_super v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PLNetworkEnergyModel;
  v4 = -[PLNetworkEnergyModel init](&v18, sel_init);
  v5 = (PLNetworkEnergyModel *)v4;
  if (v4)
  {
    *(_QWORD *)(v4 + 20) = 0;
    *(_QWORD *)(v4 + 12) = 0;
    *((_DWORD *)v4 + 9) = 0;
    *(_QWORD *)(v4 + 28) = 0;
    v4[8] = a3;
    *((_QWORD *)v4 + 5) = 0;
    *((_QWORD *)v4 + 6) = 0;
    v6 = (void *)*((_QWORD *)v4 + 7);
    *((_QWORD *)v4 + 7) = &stru_1E41668B0;

    linkDuration = v5->_linkDuration;
    v5->_linkDuration = (NSArray *)&unk_1E416C970;

    linkCost = v5->_linkCost;
    v5->_linkCost = (NSArray *)&unk_1E416C9E8;

    v22[0] = &unk_1E416CA00;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.000002);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    v21[1] = &unk_1E416C4D8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.000005);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v20[1] = &unk_1E416CA18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.000001);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    v19[1] = &unk_1E416CA18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
    v15 = objc_claimAutoreleasedReturnValue();
    linkLevel1Parameters = v5->_linkLevel1Parameters;
    v5->_linkLevel1Parameters = (NSArray *)v15;

  }
  return v5;
}

- (PLNetworkEnergyModel)initWithLinkType:(unsigned __int8)a3 withTaskUUID:(id)a4
{
  uint64_t v5;
  id v7;
  PLNetworkEnergyModel *v8;
  PLNetworkEnergyModel *v9;

  v5 = a3;
  v7 = a4;
  v8 = -[PLNetworkEnergyModel initWithLinkType:](self, "initWithLinkType:", v5);
  v9 = v8;
  if (v7 && v8)
    objc_storeStrong((id *)&v8->_taskUUID, a4);

  return v9;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLNetworkEnergyModel powerlevel1Duration](self, "powerlevel1Duration");
  v5 = v4;
  -[PLNetworkEnergyModel powerlevel2Duration](self, "powerlevel2Duration");
  v7 = v6;
  -[PLNetworkEnergyModel powerlevel3Duration](self, "powerlevel3Duration");
  v9 = v8;
  v10 = -[PLNetworkEnergyModel linkType](self, "linkType");
  -[PLNetworkEnergyModel overallBytes](self, "overallBytes");
  v12 = v11;
  -[PLNetworkEnergyModel overallDuration](self, "overallDuration");
  v14 = v13;
  -[PLNetworkEnergyModel getEnergy](self, "getEnergy");
  v16 = v15;
  -[PLNetworkEnergyModel taskUUID](self, "taskUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("powerlevel1Duration=%f, powerlevel2Duration=%f, powerlevel3Duration=%f, linkType=%d, overallBytes=%f, overallDuration=%f TotalEnergy=%f, taskID=%@"), v5, v7, v9, v10, v12, v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)updateWithBytes:(double)a3 withDuration:(double)a4
{
  double v7;
  double v8;

  -[PLNetworkEnergyModel setUpdateCount:](self, "setUpdateCount:", -[PLNetworkEnergyModel updateCount](self, "updateCount") + 1);
  -[PLNetworkEnergyModel overallDuration](self, "overallDuration");
  -[PLNetworkEnergyModel setOverallDuration:](self, "setOverallDuration:", v7 + a4);
  -[PLNetworkEnergyModel overallBytes](self, "overallBytes");
  -[PLNetworkEnergyModel setOverallBytes:](self, "setOverallBytes:", v8 + a3);
  -[PLNetworkEnergyModel computeLevel1TimeWithBytes:](self, "computeLevel1TimeWithBytes:", a3);
  -[PLNetworkEnergyModel updateAllLevelTimesWithLevel1Time:withUpdateDuration:](self, "updateAllLevelTimesWithLevel1Time:withUpdateDuration:");
}

- (double)getEnergy
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;

  -[PLNetworkEnergyModel powerlevel1Duration](self, "powerlevel1Duration");
  v4 = v3;
  -[PLNetworkEnergyModel linkCost](self, "linkCost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;
  -[PLNetworkEnergyModel powerlevel2Duration](self, "powerlevel2Duration");
  v11 = v10;
  -[PLNetworkEnergyModel linkCost](self, "linkCost");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v11 * v15 + v4 * v9;
  -[PLNetworkEnergyModel powerlevel3Duration](self, "powerlevel3Duration");
  v18 = v17;
  -[PLNetworkEnergyModel linkCost](self, "linkCost");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  v23 = (v16 + v18 * v22) / 3600.0;

  return v23;
}

- (double)computeLevel1TimeWithBytes:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  -[PLNetworkEnergyModel linkLevel1Parameters](self, "linkLevel1Parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;
  -[PLNetworkEnergyModel linkLevel1Parameters](self, "linkLevel1Parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13 + a3 * v9;

  return v14;
}

- (void)updateAllLevelTimesWithLevel1Time:(double)a3 withUpdateDuration:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  -[PLNetworkEnergyModel linkDuration](self, "linkDuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  -[PLNetworkEnergyModel linkDuration](self, "linkDuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  if (a4 >= a3)
    v17 = a3;
  else
    v17 = a4;
  -[PLNetworkEnergyModel powerlevel1Duration](self, "powerlevel1Duration");
  -[PLNetworkEnergyModel setPowerlevel1Duration:](self, "setPowerlevel1Duration:", v17 + v18);
  v19 = a4 - a3;
  v20 = fmax(v19, 0.0);
  if (v11 >= v20)
    v21 = v20;
  else
    v21 = v11;
  -[PLNetworkEnergyModel powerlevel2Duration](self, "powerlevel2Duration");
  -[PLNetworkEnergyModel setPowerlevel2Duration:](self, "setPowerlevel2Duration:", v21 + v22);
  v23 = fmax(v19 - v11, 0.0);
  if (v16 >= v23)
    v24 = v23;
  else
    v24 = v16;
  -[PLNetworkEnergyModel powerlevel3Duration](self, "powerlevel3Duration");
  -[PLNetworkEnergyModel setPowerlevel3Duration:](self, "setPowerlevel3Duration:", v24 + v25);
}

- (void)reportEnergyToPowerlogWithClientID:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  _QWORD v16[6];
  _QWORD v17[7];

  v3 = a3;
  v17[6] = *MEMORY[0x1E0C80C00];
  -[PLNetworkEnergyModel getEnergy](self, "getEnergy");
  v16[0] = CFSTR("Energy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v16[1] = CFSTR("UpdateCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[PLNetworkEnergyModel updateCount](self, "updateCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v6;
  v16[2] = CFSTR("OverallBytes");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[PLNetworkEnergyModel overallBytes](self, "overallBytes");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v8;
  v16[3] = CFSTR("OverallDuration");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PLNetworkEnergyModel overallDuration](self, "overallDuration");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v10;
  v16[4] = CFSTR("LinkType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v11;
  v16[5] = CFSTR("taskUUID");
  -[PLNetworkEnergyModel taskUUID](self, "taskUUID");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = &stru_1E41668B0;
  if (v12)
    v14 = (const __CFString *)v12;
  v17[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent(v3, CFSTR("NetworkEnergyModel"), v15);
}

- (double)powerlevel1Duration
{
  return self->_powerlevel1Duration;
}

- (void)setPowerlevel1Duration:(double)a3
{
  self->_powerlevel1Duration = a3;
}

- (double)powerlevel2Duration
{
  return self->_powerlevel2Duration;
}

- (void)setPowerlevel2Duration:(double)a3
{
  self->_powerlevel2Duration = a3;
}

- (double)powerlevel3Duration
{
  return self->_powerlevel3Duration;
}

- (void)setPowerlevel3Duration:(double)a3
{
  self->_powerlevel3Duration = a3;
}

- (unsigned)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(unsigned __int8)a3
{
  self->_linkType = a3;
}

- (double)overallBytes
{
  return self->_overallBytes;
}

- (void)setOverallBytes:(double)a3
{
  self->_overallBytes = a3;
}

- (double)overallDuration
{
  return self->_overallDuration;
}

- (void)setOverallDuration:(double)a3
{
  self->_overallDuration = a3;
}

- (unsigned)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(unsigned int)a3
{
  self->_updateCount = a3;
}

- (NSString)taskUUID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTaskUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSArray)linkCost
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLinkCost:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSArray)linkDuration
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLinkDuration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSArray)linkLevel1Parameters
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLinkLevel1Parameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkLevel1Parameters, 0);
  objc_storeStrong((id *)&self->_linkDuration, 0);
  objc_storeStrong((id *)&self->_linkCost, 0);
  objc_storeStrong((id *)&self->_taskUUID, 0);
}

@end
