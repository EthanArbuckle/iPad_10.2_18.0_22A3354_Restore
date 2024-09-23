@implementation WK_RTCWrappedNativeVideoDecoder

- (WK_RTCWrappedNativeVideoDecoder)initWithNativeDecoder:()unique_ptr<webrtc:(std::default_delete<webrtc::VideoDecoder>>)a3 :VideoDecoder
{
  WK_RTCWrappedNativeVideoDecoder *v4;
  WK_RTCWrappedNativeVideoDecoder *v5;
  VideoDecoder *v6;
  VideoDecoder *value;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WK_RTCWrappedNativeVideoDecoder;
  v4 = -[WK_RTCWrappedNativeVideoDecoder init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(VideoDecoder **)a3.__ptr_.__value_;
    *(_QWORD *)a3.__ptr_.__value_ = 0;
    value = v4->_wrappedDecoder.__ptr_.__value_;
    v5->_wrappedDecoder.__ptr_.__value_ = v6;
    if (value)
      (*(void (**)(VideoDecoder *))(*(_QWORD *)value + 8))(value);
  }
  return v5;
}

- (unique_ptr<webrtc::VideoDecoder,)releaseWrappedDecoder
{
  VideoDecoder **v2;
  VideoDecoder *value;

  value = self->_wrappedDecoder.__ptr_.__value_;
  self->_wrappedDecoder.__ptr_.__value_ = 0;
  *v2 = value;
  return (unique_ptr<webrtc::VideoDecoder, std::default_delete<webrtc::VideoDecoder>>)self;
}

- (int64_t)startDecodeWithNumberOfCores:(int)a3
{
  return 0;
}

- (int64_t)releaseDecoder
{
  return 0;
}

- (int64_t)decode:(id)a3 missingFrames:(BOOL)a4 codecSpecificInfo:(id)a5 renderTimeMs:(int64_t)a6
{
  return 0;
}

- (id)implementationName
{
  return 0;
}

- (void).cxx_destruct
{
  VideoDecoder *value;

  value = self->_wrappedDecoder.__ptr_.__value_;
  self->_wrappedDecoder.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(VideoDecoder *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
