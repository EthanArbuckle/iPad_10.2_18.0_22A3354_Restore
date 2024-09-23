@implementation SRCSPhraseMatchResult

- (SRCSPhraseMatchResult)initWithMarkerRange:(id)a3 matchedString:(id)a4 userInfo:(id)a5
{
  id v9;
  id v10;
  id v11;
  SRCSPhraseMatchResult *v12;
  SRCSPhraseMatchResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SRCSPhraseMatchResult;
  v12 = -[SRCSPhraseMatchResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_markerRange, a3);
    objc_storeStrong((id *)&v13->_matchedString, a4);
    objc_storeStrong(&v13->_userInfo, a5);
  }

  return v13;
}

- (int64_t)location
{
  return -[SRCSTextMarkerRangeProtocol nsRange](self->_markerRange, "nsRange");
}

- (id)description
{
  void *v3;
  id userInfo;
  NSString *matchedString;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  userInfo = self->_userInfo;
  matchedString = self->_matchedString;
  v6 = -[SRCSTextMarkerRangeProtocol nsRange](self->_markerRange, "nsRange");
  -[SRCSTextMarkerRangeProtocol nsRange](self->_markerRange, "nsRange");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ (%ld, %ld)"), userInfo, matchedString, v6, v7);
}

- (id)userInfo
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)matchedString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (SRCSTextMarkerRangeProtocol)markerRange
{
  return (SRCSTextMarkerRangeProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markerRange, 0);
  objc_storeStrong((id *)&self->_matchedString, 0);
  objc_storeStrong(&self->_userInfo, 0);
}

@end
