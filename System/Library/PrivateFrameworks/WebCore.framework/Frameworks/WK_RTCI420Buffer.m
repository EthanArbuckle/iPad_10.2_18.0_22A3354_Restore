@implementation WK_RTCI420Buffer

- (WK_RTCI420Buffer)initWithWidth:(int)a3 height:(int)a4
{
  WK_RTCI420Buffer *v6;
  _DWORD *v7;
  _DWORD *v8;
  int v9;
  int v10;
  unsigned int v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unsigned int *v19;
  unsigned int v20;
  I420BufferInterface *ptr;
  std::string *v23;
  SEL v24;
  int v25;
  int v26;
  const char *v27;
  const char *v28;
  const char *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)WK_RTCI420Buffer;
  v6 = -[WK_RTCI420Buffer init](&v30, sel_init);
  if (!v6)
    return v6;
  v7 = (_DWORD *)operator new();
  v8 = v7;
  v9 = a3 + 2;
  if (a3 >= -1)
    v9 = a3 + 1;
  v10 = v9 >> 1;
  v7[2] = a3;
  v7[3] = a4;
  v7[4] = a3;
  v7[5] = v10;
  v7[6] = v10;
  v11 = a4 + 2;
  if (a4 >= -1)
    v11 = a4 + 1;
  v12 = a4 * a3 + 2 * v10 * (v11 >> 1);
  if (!v12)
  {
    v18 = 0;
LABEL_10:
    *((_QWORD *)v8 + 4) = v18;
    *(_QWORD *)v8 = &unk_24C0B4DF0;
    v8[10] = 0;
    v19 = v8 + 10;
    do
      v20 = __ldxr(v19);
    while (__stxr(v20 + 1, v19));
    ptr = v6->_i420Buffer.ptr_;
    v6->_i420Buffer.ptr_ = (I420BufferInterface *)v8;
    if (ptr)
      (*(void (**)(I420BufferInterface *))(*(_QWORD *)ptr + 8))(ptr);
    return v6;
  }
  v13 = malloc_type_malloc(v12 + 71, 0xB9DC9477uLL);
  if (v13)
  {
    v18 = ((unint64_t)v13 + 71) & 0xFFFFFFFFFFFFFFC0;
    *(_QWORD *)(v18 - 8) = v13;
    goto LABEL_10;
  }
  v23 = rtc::webrtc_checks_impl::FatalLog("/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/rtc_base/memory/aligned_malloc.cc", 66, "memory_pointer", "\t", v14, v15, v16, v17, (uint64_t)"Couldn't allocate memory in AlignedMalloc");
  return -[WK_RTCI420Buffer initWithWidth:height:dataY:dataU:dataV:]((WK_RTCI420Buffer *)v23, v24, v25, v26, v27, v28, v29);
}

- (WK_RTCI420Buffer)initWithWidth:(int)a3 height:(int)a4 dataY:(const char *)a5 dataU:(const char *)a6 dataV:(const char *)a7
{
  webrtc::I420Buffer *v11;
  WK_RTCI420Buffer *v12;
  int v13;
  I420BufferInterface *ptr;
  int v16;
  I420BufferInterface *v17;
  objc_super v18;

  v11 = *(webrtc::I420Buffer **)&a3;
  v18.receiver = self;
  v18.super_class = (Class)WK_RTCI420Buffer;
  v12 = -[WK_RTCI420Buffer init](&v18, sel_init);
  if (v12)
  {
    v13 = (_DWORD)v11 + 2;
    if ((int)v11 >= -1)
      v13 = (_DWORD)v11 + 1;
    webrtc::I420Buffer::Copy(v11, (const unsigned __int8 *)v11, (const unsigned __int8 *)(v13 >> 1), (const unsigned __int8 *)(v13 >> 1), a4, (char *)a5, (char *)a6, (char *)a7, &v17, v16);
    ptr = v12->_i420Buffer.ptr_;
    v12->_i420Buffer.ptr_ = v17;
    if (ptr)
      (*(void (**)(I420BufferInterface *))(*(_QWORD *)ptr + 8))(ptr);
  }
  return v12;
}

- (WK_RTCI420Buffer)initWithWidth:(int)a3 height:(int)a4 strideY:(int)a5 strideU:(int)a6 strideV:(int)a7
{
  WK_RTCI420Buffer *v12;
  uint64_t v13;
  int v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unsigned int *v22;
  unsigned int v23;
  I420BufferInterface *ptr;
  std::string *v26;
  SEL v27;
  objc_super v28;
  scoped_refptr<webrtc::I420BufferInterface> v29;

  v28.receiver = self;
  v28.super_class = (Class)WK_RTCI420Buffer;
  v12 = -[WK_RTCI420Buffer init](&v28, sel_init);
  if (!v12)
    return v12;
  v13 = operator new();
  *(_DWORD *)(v13 + 8) = a3;
  *(_DWORD *)(v13 + 12) = a4;
  *(_DWORD *)(v13 + 16) = a5;
  *(_DWORD *)(v13 + 20) = a6;
  *(_DWORD *)(v13 + 24) = a7;
  v14 = a4 + 2;
  if (a4 >= -1)
    v14 = a4 + 1;
  v15 = a5 * a4 + (a7 + a6) * (v14 >> 1);
  if (!v15)
  {
    v21 = 0;
LABEL_8:
    *(_QWORD *)(v13 + 32) = v21;
    *(_QWORD *)v13 = &unk_24C0B4DF0;
    *(_DWORD *)(v13 + 40) = 0;
    v22 = (unsigned int *)(v13 + 40);
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
    ptr = v12->_i420Buffer.ptr_;
    v12->_i420Buffer.ptr_ = (I420BufferInterface *)v13;
    if (ptr)
      (*(void (**)(I420BufferInterface *))(*(_QWORD *)ptr + 8))(ptr);
    return v12;
  }
  v16 = malloc_type_malloc(v15 + 71, 0xB9DC9477uLL);
  if (v16)
  {
    v21 = ((unint64_t)v16 + 71) & 0xFFFFFFFFFFFFFFC0;
    *(_QWORD *)(v21 - 8) = v16;
    goto LABEL_8;
  }
  v26 = rtc::webrtc_checks_impl::FatalLog("/Library/Caches/com.apple.xbs/Sources/libwebrtc/Source/ThirdParty/libwebrtc/Source/webrtc/rtc_base/memory/aligned_malloc.cc", 66, "memory_pointer", "\t", v17, v18, v19, v20, (uint64_t)"Couldn't allocate memory in AlignedMalloc");
  return -[WK_RTCI420Buffer initWithFrameBuffer:]((WK_RTCI420Buffer *)v26, v27, v29);
}

- (WK_RTCI420Buffer)initWithFrameBuffer:(scoped_refptr<webrtc::I420BufferInterface>)a3
{
  WK_RTCI420Buffer *v4;
  I420BufferInterface *v5;
  I420BufferInterface *ptr;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WK_RTCI420Buffer;
  v4 = -[WK_RTCI420Buffer init](&v8, sel_init);
  if (v4)
  {
    v5 = *(I420BufferInterface **)a3.ptr_;
    if (v5)
      (**(void (***)(I420BufferInterface *))v5)(v5);
    ptr = v4->_i420Buffer.ptr_;
    if (ptr)
      (*(void (**)(I420BufferInterface *))(*(_QWORD *)ptr + 8))(ptr);
    v4->_i420Buffer.ptr_ = v5;
  }
  return v4;
}

- (int)width
{
  return (*(uint64_t (**)(I420BufferInterface *))(*(_QWORD *)self->_i420Buffer.ptr_ + 40))(self->_i420Buffer.ptr_);
}

- (int)height
{
  return (*(uint64_t (**)(I420BufferInterface *))(*(_QWORD *)self->_i420Buffer.ptr_ + 48))(self->_i420Buffer.ptr_);
}

- (int)strideY
{
  return (*(uint64_t (**)(I420BufferInterface *))(*(_QWORD *)self->_i420Buffer.ptr_ + 112))(self->_i420Buffer.ptr_);
}

- (int)strideU
{
  return (*(uint64_t (**)(I420BufferInterface *))(*(_QWORD *)self->_i420Buffer.ptr_ + 120))(self->_i420Buffer.ptr_);
}

- (int)strideV
{
  return (*(uint64_t (**)(I420BufferInterface *))(*(_QWORD *)self->_i420Buffer.ptr_ + 128))(self->_i420Buffer.ptr_);
}

- (int)chromaWidth
{
  int v2;
  int v3;

  v2 = (*(uint64_t (**)(I420BufferInterface *, SEL))(*(_QWORD *)self->_i420Buffer.ptr_ + 40))(self->_i420Buffer.ptr_, a2);
  v3 = v2 + 2;
  if (v2 >= -1)
    v3 = v2 + 1;
  return v3 >> 1;
}

- (int)chromaHeight
{
  int v2;
  int v3;

  v2 = (*(uint64_t (**)(I420BufferInterface *, SEL))(*(_QWORD *)self->_i420Buffer.ptr_ + 48))(self->_i420Buffer.ptr_, a2);
  v3 = v2 + 2;
  if (v2 >= -1)
    v3 = v2 + 1;
  return v3 >> 1;
}

- (const)dataY
{
  return (const char *)(*(uint64_t (**)(I420BufferInterface *))(*(_QWORD *)self->_i420Buffer.ptr_ + 136))(self->_i420Buffer.ptr_);
}

- (const)dataU
{
  return (const char *)(*(uint64_t (**)(I420BufferInterface *))(*(_QWORD *)self->_i420Buffer.ptr_ + 144))(self->_i420Buffer.ptr_);
}

- (const)dataV
{
  return (const char *)(*(uint64_t (**)(I420BufferInterface *))(*(_QWORD *)self->_i420Buffer.ptr_ + 152))(self->_i420Buffer.ptr_);
}

- (scoped_refptr<webrtc::I420BufferInterface>)nativeI420Buffer
{
  I420BufferInterface **v2;
  I420BufferInterface *ptr;

  ptr = self->_i420Buffer.ptr_;
  *v2 = ptr;
  if (ptr)
    return (scoped_refptr<webrtc::I420BufferInterface>)(**(uint64_t (***)(I420BufferInterface *))ptr)(ptr);
  return (scoped_refptr<webrtc::I420BufferInterface>)ptr;
}

- (void)close
{
  I420BufferInterface *ptr;

  ptr = self->_i420Buffer.ptr_;
  if (ptr)
    (*(void (**)(I420BufferInterface *, SEL))(*(_QWORD *)ptr + 8))(ptr, a2);
  self->_i420Buffer.ptr_ = 0;
}

- (void).cxx_destruct
{
  I420BufferInterface *ptr;

  ptr = self->_i420Buffer.ptr_;
  if (ptr)
    (*(void (**)(I420BufferInterface *))(*(_QWORD *)ptr + 8))(ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
