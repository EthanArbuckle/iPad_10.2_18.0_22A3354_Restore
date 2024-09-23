@implementation WK_RTCWrappedNativeVideoEncoder

- (WK_RTCWrappedNativeVideoEncoder)initWithNativeEncoder:()unique_ptr<webrtc:(std::default_delete<webrtc::VideoEncoder>>)a3 :VideoEncoder
{
  WK_RTCWrappedNativeVideoEncoder *v4;
  WK_RTCWrappedNativeVideoEncoder *v5;
  VideoEncoder *v6;
  VideoEncoder *value;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WK_RTCWrappedNativeVideoEncoder;
  v4 = -[WK_RTCWrappedNativeVideoEncoder init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(VideoEncoder **)a3.__ptr_.__value_;
    *(_QWORD *)a3.__ptr_.__value_ = 0;
    value = v4->_wrappedEncoder.__ptr_.__value_;
    v5->_wrappedEncoder.__ptr_.__value_ = v6;
    if (value)
      (*(void (**)(VideoEncoder *))(*(_QWORD *)value + 8))(value);
  }
  return v5;
}

- (unique_ptr<webrtc::VideoEncoder,)releaseWrappedEncoder
{
  VideoEncoder **v2;
  VideoEncoder *value;

  value = self->_wrappedEncoder.__ptr_.__value_;
  self->_wrappedEncoder.__ptr_.__value_ = 0;
  *v2 = value;
  return (unique_ptr<webrtc::VideoEncoder, std::default_delete<webrtc::VideoEncoder>>)self;
}

- (int64_t)startEncodeWithSettings:(id)a3 numberOfCores:(int)a4
{
  return 0;
}

- (int64_t)releaseEncoder
{
  return 0;
}

- (int64_t)encode:(id)a3 codecSpecificInfo:(id)a4 frameTypes:(id)a5
{
  return 0;
}

- (int)setBitrate:(unsigned int)a3 framerate:(unsigned int)a4
{
  return 0;
}

- (id)implementationName
{
  return 0;
}

- (id)scalingSettings
{
  return 0;
}

- (void).cxx_destruct
{
  VideoEncoder *value;

  value = self->_wrappedEncoder.__ptr_.__value_;
  self->_wrappedEncoder.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(VideoEncoder *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
