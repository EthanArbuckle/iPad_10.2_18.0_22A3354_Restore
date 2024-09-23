@implementation WK_RTCMutableI420Buffer

- (char)mutableDataY
{
  return (char *)(*(uint64_t (**)(I420BufferInterface *))(*(_QWORD *)self->super._i420Buffer.ptr_ + 136))(self->super._i420Buffer.ptr_);
}

- (char)mutableDataU
{
  return (char *)(*(uint64_t (**)(I420BufferInterface *))(*(_QWORD *)self->super._i420Buffer.ptr_ + 144))(self->super._i420Buffer.ptr_);
}

- (char)mutableDataV
{
  return (char *)(*(uint64_t (**)(I420BufferInterface *))(*(_QWORD *)self->super._i420Buffer.ptr_ + 152))(self->super._i420Buffer.ptr_);
}

@end
