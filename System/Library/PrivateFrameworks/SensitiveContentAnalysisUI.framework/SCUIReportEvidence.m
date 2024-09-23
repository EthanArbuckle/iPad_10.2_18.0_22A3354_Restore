@implementation SCUIReportEvidence

- (SCUIReportEvidence)initWithVictimHandle:(id)a3 sensitiveContentMedia:(id)a4 chat:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Not implemented"), 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v10);
}

- (SCUIReportEvidence)initWithVictim:(id)a3 suspects:(id)a4 application:(int64_t)a5
{
  id v9;
  id v10;
  SCUIReportEvidence *v11;
  SCUIReportEvidence *v12;
  uint64_t v13;
  NSArray *suspects;
  uint64_t v15;
  NSDate *reportCreationDate;
  void *v17;
  uint64_t v18;
  NSString *localeIdentifier;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SCUIReportEvidence;
  v11 = -[SCUIReportEvidence init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_victim, a3);
    v13 = objc_msgSend(v10, "copy");
    suspects = v12->_suspects;
    v12->_suspects = (NSArray *)v13;

    v12->_reportingApplication = a5;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = objc_claimAutoreleasedReturnValue();
    reportCreationDate = v12->_reportCreationDate;
    v12->_reportCreationDate = (NSDate *)v15;

    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localeIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    localeIdentifier = v12->_localeIdentifier;
    v12->_localeIdentifier = (NSString *)v18;

  }
  return v12;
}

- (NSDate)incidentDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIncidentDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (NSArray)chatTranscript
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setChatTranscript:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)chatRoomName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setChatRoomName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (int64_t)reportingApplication
{
  return self->_reportingApplication;
}

- (NSDate)reportCreationDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)localeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (SCUIReportVictim)victim
{
  return (SCUIReportVictim *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)suspects
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suspects, 0);
  objc_storeStrong((id *)&self->_victim, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_reportCreationDate, 0);
  objc_storeStrong((id *)&self->_chatRoomName, 0);
  objc_storeStrong((id *)&self->_chatTranscript, 0);
  objc_storeStrong((id *)&self->_incidentDate, 0);
}

@end
