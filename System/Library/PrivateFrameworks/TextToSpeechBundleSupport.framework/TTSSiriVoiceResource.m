@implementation TTSSiriVoiceResource

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

- (shared_ptr<SiriTTS::VoiceResource>)siriVoiceResource
{
  VoiceResource **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<SiriTTS::VoiceResource> result;

  cntrl = self->_siriVoiceResource.__cntrl_;
  *v2 = self->_siriVoiceResource.__ptr_;
  v2[1] = (VoiceResource *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (VoiceResource *)self;
  return result;
}

- (void)setSiriVoiceResource:(shared_ptr<SiriTTS::VoiceResource>)a3
{
  std::shared_ptr<SiriTTS::VoiceResource>::operator=[abi:ne180100](&self->_siriVoiceResource.__ptr_, (uint64_t *)a3.__ptr_);
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
  std::shared_ptr<SiriTTS::VoiceResource>::~shared_ptr[abi:ne180100]((uint64_t)&self->_siriVoiceResource);
  objc_storeStrong((id *)&self->_ruleSet, 0);
  objc_storeStrong((id *)&self->_resourceData, 0);
  objc_storeStrong((id *)&self->_resourceString, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
