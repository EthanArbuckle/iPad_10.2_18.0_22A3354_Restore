@implementation VSSpeechEngineVoiceResource

- (shared_ptr<SiriTTS::VoiceResource>)resource
{
  void *v2;
  VoiceResource *v3;
  __shared_weak_count *v4;
  shared_ptr<SiriTTS::VoiceResource> result;

  objc_copyCppObjectAtomic(v2, &self->_resource, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setResource:(shared_ptr<SiriTTS::VoiceResource>)a3
{
  objc_copyCppObjectAtomic(&self->_resource, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
}

- (void).cxx_destruct
{
  std::shared_ptr<SiriTTS::PhonemeMapper>::~shared_ptr[abi:ne180100]((uint64_t)&self->_resource);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
