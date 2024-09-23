@implementation TTSMauiVoiceResource

- (NSString)resourceName
{
  return self->_resourceName;
}

- (void)setResourceName:(id)a3
{
  objc_storeStrong((id *)&self->_resourceName, a3);
}

- (NSString)resourceString
{
  return self->_resourceString;
}

- (void)setResourceString:(id)a3
{
  objc_storeStrong((id *)&self->_resourceString, a3);
}

- (NSData)resourceData
{
  return self->_resourceData;
}

- (void)setResourceData:(id)a3
{
  objc_storeStrong((id *)&self->_resourceData, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (_VE_HSAFE)voiceResourceHandle
{
  uint64_t v2;
  void *pHandleData;
  _VE_HSAFE result;

  v2 = *(_QWORD *)&self->_voiceResourceHandle.u32Check;
  pHandleData = self->_voiceResourceHandle.pHandleData;
  result.u32Check = v2;
  result.pHandleData = pHandleData;
  return result;
}

- (void)setVoiceResourceHandle:(_VE_HSAFE)a3
{
  self->_voiceResourceHandle = a3;
}

- (TTSRuleset)ruleSet
{
  return self->_ruleSet;
}

- (void)setRuleSet:(id)a3
{
  objc_storeStrong((id *)&self->_ruleSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleSet, 0);
  objc_storeStrong((id *)&self->_resourceData, 0);
  objc_storeStrong((id *)&self->_resourceString, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
}

@end
