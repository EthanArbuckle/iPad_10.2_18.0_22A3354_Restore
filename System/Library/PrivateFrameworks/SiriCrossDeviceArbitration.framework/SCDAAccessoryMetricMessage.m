@implementation SCDAAccessoryMetricMessage

- (SCDAAccessoryMetricMessage)initWithMetricData:(id)a3
{
  id v4;
  SCDAAccessoryMetricMessage *v5;
  SCDAAccessoryMetricMessage *v6;
  SCDAAccessoryMetricMessage *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCDAAccessoryMetricMessage;
  v5 = -[SCDAAccessoryMetricMessage init](&v9, sel_init);
  v6 = v5;
  if (v5
    && !-[SCDAAccessoryMetricMessage _decodeMetricDataPayload:decodedPayload:](v5, "_decodeMetricDataPayload:decodedPayload:", v4, &v5->_metric))
  {
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (SCDAAccessoryMetricMessage)initWithDataPayload:(id)a3
{
  id v4;
  SCDAAccessoryMetricMessage *v5;
  SCDAAccessoryMetricMessage *v6;
  SCDAAccessoryMetricMessage *v7;
  _BOOL4 v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCDAAccessoryMetricMessage;
  v5 = -[SCDAAccessoryMetricMessage init](&v10, sel_init);
  v6 = v5;
  if (!v5)
  {
LABEL_4:
    v7 = v6;
    goto LABEL_6;
  }
  -[SCDAAccessoryMetricMessage _extractMetricDataFromDataPayload:](v5, "_extractMetricDataFromDataPayload:", v4);
  v7 = (SCDAAccessoryMetricMessage *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[SCDAAccessoryMetricMessage _decodeMetricDataPayload:decodedPayload:](v6, "_decodeMetricDataPayload:decodedPayload:", v7, &v6->_metric);

    if (!v8)
    {
      v7 = 0;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return v7;
}

- (id)messageAsData
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  objc_msgSend(v3, "appendBytes:length:", &self->_metric, 1064);
  return v3;
}

- (MyriadMetricsDataV2)messageAsStruct
{
  return (MyriadMetricsDataV2 *)memcpy(retstr, &self->_metric, sizeof(MyriadMetricsDataV2));
}

- (unsigned)version
{
  return self->_metric.version;
}

- (unint64_t)sessionId
{
  return self->_metric.sessionId;
}

- (unsigned)eventType
{
  return self->_metric.eventType;
}

- (unint64_t)requestType
{
  return self->_metric.requestType;
}

- (unsigned)state
{
  return self->_metric.state;
}

- (double)advDelay
{
  return self->_metric.advDelay;
}

- (double)advInterval
{
  return self->_metric.advInterval;
}

- (BOOL)coordinationAllowed
{
  return self->_metric.coordinationAllowed != 0;
}

- (unsigned)winnerGoodnessScore
{
  return self->_metric.winnerGoodnessScore;
}

- (unsigned)winnerProductType
{
  return self->_metric.winnerProductType;
}

- (unsigned)winnerDeviceClass
{
  return self->_metric.winnerDeviceClass;
}

- (BOOL)homepodInvolved
{
  return self->_metric.homepodInvolved != 0;
}

- (BOOL)previousDecision
{
  return self->_metric.previousDecision != 0;
}

- (double)previousDecisionTime
{
  return self->_metric.previousDecisionTime;
}

- (unsigned)deviceGroup
{
  return self->_metric.deviceGroup;
}

- (BOOL)decision
{
  return self->_metric.decision != 0;
}

- (BOOL)lateToElection
{
  return self->_metric.lateToElection != 0;
}

- (unsigned)electionParticipantCount
{
  return self->_metric.electionParticipantCount;
}

- (char)electionParticipantGoodnessScore
{
  return (char *)self->_metric.electionParticipantGoodnessScore;
}

- (char)electionParticipantDeviceType
{
  return (char *)self->_metric.electionParticipantDeviceType;
}

- (char)electionParticipantProductType
{
  return (char *)self->_metric.electionParticipantProductType;
}

- (unint64_t)deviceElectionParticipantIdLowBits
{
  return self->_metric.deviceElectionParticipantIdLowBits;
}

- (unint64_t)deviceElectionParticipantIdHighBits
{
  return self->_metric.deviceElectionParticipantIdHighBits;
}

- (unint64_t)deviceRotatedElectionParticipantIdLowBits
{
  return self->_metric.deviceRotatedElectionParticipantIdLowBits;
}

- (unint64_t)deviceRotatedElectionParticipantIdHighBits
{
  return self->_metric.deviceRotatedElectionParticipantIdHighBits;
}

- (unint64_t)electionParticipantIdLowBits
{
  return self->_metric.electionParticipantIdLowBits;
}

- (unint64_t)electionParticipantIdHighBits
{
  return self->_metric.electionParticipantIdHighBits;
}

- (id)_extractMetricDataFromDataPayload:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  +[SCDAMetrics sharedInstance](SCDAMetrics, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMyriadMetricsMessage:", v3);

  if (v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", scdaAccessoryMetricsMessageKey);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_decodeMetricDataPayload:(id)a3 decodedPayload:(MyriadMetricsDataV2 *)a4
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  unsigned __int8 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "length"))
  {
    v10 = SCDALogContextAnalytics;
    if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SCDAAccessoryMetricMessage _decodeMetricDataPayload:decodedPayload:]";
      v20 = 2112;
      v21 = v7;
      v13 = "%s Invalid analytics data payload: %@";
      v14 = v10;
      v15 = 22;
      goto LABEL_14;
    }
LABEL_7:
    v11 = 0;
    goto LABEL_12;
  }
  v17 = 0;
  objc_msgSend(v7, "getBytes:range:", &v17, 0, 1);
  v8 = v17;
  if (!v17)
  {
    v12 = SCDALogContextAnalytics;
    if (os_log_type_enabled((os_log_t)SCDALogContextAnalytics, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[SCDAAccessoryMetricMessage _decodeMetricDataPayload:decodedPayload:]";
      v20 = 1024;
      LODWORD(v21) = 0;
      v13 = "%s Analytics data has a invalid version %d";
      v14 = v12;
      v15 = 18;
LABEL_14:
      _os_log_error_impl(&dword_246211000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  bzero(a4, 0x428uLL);
  if (v8 == 1)
    v9 = 232;
  else
    v9 = 1064;
  v11 = -[SCDAAccessoryMetricMessage _decodeMetricDataPayload:into:expectedPayloadSize:](self, "_decodeMetricDataPayload:into:expectedPayloadSize:", v7, a4, v9);
LABEL_12:

  return v11;
}

- (BOOL)_decodeMetricDataPayload:(id)a3 into:(MyriadMetricsDataV2 *)a4 expectedPayloadSize:(unint64_t)a5
{
  id v7;
  unint64_t v8;
  id v9;
  const void *v10;

  v7 = a3;
  v8 = objc_msgSend(v7, "length");
  if (v8 < a5)
    a5 = v8;
  v9 = objc_retainAutorelease(v7);
  v10 = (const void *)objc_msgSend(v9, "bytes");

  memcpy(a4, v10, a5);
  return 1;
}

@end
