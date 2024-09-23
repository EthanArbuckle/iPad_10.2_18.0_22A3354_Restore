@implementation WK_RTCWrappedEncodedImageBuffer

- (WK_RTCWrappedEncodedImageBuffer)initWithEncodedImageBuffer:(scoped_refptr<webrtc::EncodedImageBufferInterface>)a3
{
  WK_RTCWrappedEncodedImageBuffer *v4;
  EncodedImageBufferInterface *v5;
  EncodedImageBufferInterface *ptr;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WK_RTCWrappedEncodedImageBuffer;
  v4 = -[WK_RTCWrappedEncodedImageBuffer init](&v8, sel_init);
  if (v4)
  {
    v5 = *(EncodedImageBufferInterface **)a3.ptr_;
    if (v5)
      (**(void (***)(EncodedImageBufferInterface *))v5)(v5);
    ptr = v4->_buffer.ptr_;
    if (ptr)
      (*(void (**)(EncodedImageBufferInterface *))(*(_QWORD *)ptr + 8))(ptr);
    v4->_buffer.ptr_ = v5;
  }
  return v4;
}

- (scoped_refptr<webrtc::EncodedImageBufferInterface>)buffer
{
  EncodedImageBufferInterface **v2;
  EncodedImageBufferInterface *ptr;

  ptr = self->_buffer.ptr_;
  *v2 = ptr;
  if (ptr)
    return (scoped_refptr<webrtc::EncodedImageBufferInterface>)(**(uint64_t (***)(EncodedImageBufferInterface *))ptr)(ptr);
  return (scoped_refptr<webrtc::EncodedImageBufferInterface>)ptr;
}

- (void)setBuffer:(scoped_refptr<webrtc::EncodedImageBufferInterface>)a3
{
  EncodedImageBufferInterface *v4;
  EncodedImageBufferInterface *ptr;

  v4 = *(EncodedImageBufferInterface **)a3.ptr_;
  if (*(_QWORD *)a3.ptr_)
    (**(void (***)(_QWORD, SEL))v4)(*(_QWORD *)a3.ptr_, a2);
  ptr = self->_buffer.ptr_;
  if (ptr)
    (*(void (**)(EncodedImageBufferInterface *, SEL))(*(_QWORD *)ptr + 8))(ptr, a2);
  self->_buffer.ptr_ = v4;
}

- (void).cxx_destruct
{
  EncodedImageBufferInterface *ptr;

  ptr = self->_buffer.ptr_;
  if (ptr)
    (*(void (**)(EncodedImageBufferInterface *))(*(_QWORD *)ptr + 8))(ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
