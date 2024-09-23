@implementation SNConnectionAnalysisInfo

- (SNConnectionAnalysisInfo)initWithConnectionURL:(id)a3 interfaceIndex:(int)a4 sendBufferSize:(id)a5 wwanPreferred:(BOOL)a6 connectionType:(id)a7 policyId:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  SNConnectionAnalysisInfo *v19;
  SNConnectionAnalysisInfo *v20;
  uint64_t v21;
  NSNumber *sendBufferSize;
  uint64_t v23;
  NSString *policyId;
  objc_super v26;

  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v26.receiver = self;
  v26.super_class = (Class)SNConnectionAnalysisInfo;
  v19 = -[SNConnectionAnalysisInfo init](&v26, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_connectionURL, a3);
    v20->_interfaceIndex = a4;
    v21 = objc_msgSend(v16, "copy");
    sendBufferSize = v20->_sendBufferSize;
    v20->_sendBufferSize = (NSNumber *)v21;

    v20->_wwanPreferred = a6;
    objc_storeStrong((id *)&v20->_connectionType, a7);
    v23 = objc_msgSend(v18, "copy");
    policyId = v20->_policyId;
    v20->_policyId = (NSString *)v23;

  }
  return v20;
}

- (NSURL)connectionURL
{
  return self->_connectionURL;
}

- (int)interfaceIndex
{
  return self->_interfaceIndex;
}

- (NSNumber)sendBufferSize
{
  return self->_sendBufferSize;
}

- (BOOL)wwanPreferred
{
  return self->_wwanPreferred;
}

- (SNConnectionType)connectionType
{
  return self->_connectionType;
}

- (NSString)policyId
{
  return self->_policyId;
}

- (void)setPolicyId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyId, 0);
  objc_storeStrong((id *)&self->_connectionType, 0);
  objc_storeStrong((id *)&self->_sendBufferSize, 0);
  objc_storeStrong((id *)&self->_connectionURL, 0);
}

@end
