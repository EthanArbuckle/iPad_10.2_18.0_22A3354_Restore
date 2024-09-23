@implementation SiriNLUSELFRequestLinkData

- (SIRINLUEXTERNALUUID)nlId
{
  return (SIRINLUEXTERNALUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setNlId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (SIRINLUEXTERNALUUID)trpId
{
  return (SIRINLUEXTERNALUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTrpId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)resultCandidateId
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResultCandidateId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)splitCount
{
  return self->_splitCount;
}

- (void)setSplitCount:(unint64_t)a3
{
  self->_splitCount = a3;
}

- (NSString)targetName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTargetName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSUUID)targetUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTargetUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetUUID, 0);
  objc_storeStrong((id *)&self->_targetName, 0);
  objc_storeStrong((id *)&self->_resultCandidateId, 0);
  objc_storeStrong((id *)&self->_trpId, 0);
  objc_storeStrong((id *)&self->_nlId, 0);
}

@end
