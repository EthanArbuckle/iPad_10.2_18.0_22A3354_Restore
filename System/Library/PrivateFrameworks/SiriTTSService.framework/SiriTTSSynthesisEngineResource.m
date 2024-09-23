@implementation SiriTTSSynthesisEngineResource

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
  objc_storeStrong((id *)&self->_mimeType, a3);
}

- (shared_ptr<SiriTTS::VoiceResource>)handle
{
  void *v2;
  VoiceResource *v3;
  __shared_weak_count *v4;
  shared_ptr<SiriTTS::VoiceResource> result;

  objc_copyCppObjectAtomic(v2, &self->_handle, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setHandle:(shared_ptr<SiriTTS::VoiceResource>)a3
{
  objc_copyCppObjectAtomic(&self->_handle, a3.__ptr_, (void (__cdecl *)(void *, const void *))__assign_helper_atomic_property_);
}

- (void).cxx_destruct
{
  std::shared_ptr<SiriTTS::PhonemeMapper>::~shared_ptr[abi:ne180100]((uint64_t)&self->_handle);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
