@implementation WK_RTCEncodedImage

- (scoped_refptr<webrtc::EncodedImageBufferInterface>)encodedData
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  scoped_refptr<webrtc::EncodedImageBufferInterface> v5;
  id v6;

  v3 = v2;
  objc_getAssociatedObject(self, sel_encodedData);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend(v4, "buffer");

  }
  else
  {
    *v3 = 0;

  }
  return v5;
}

- (void)setEncodedData:(scoped_refptr<webrtc::EncodedImageBufferInterface>)a3
{
  WK_RTCWrappedEncodedImageBuffer *v5;
  void (***v6)(_QWORD);
  WK_RTCWrappedEncodedImageBuffer *v7;
  void (***v8)(_QWORD);

  v5 = [WK_RTCWrappedEncodedImageBuffer alloc];
  v6 = *(void (****)(_QWORD))a3.ptr_;
  v8 = v6;
  if (v6)
    (**v6)(v6);
  v7 = -[WK_RTCWrappedEncodedImageBuffer initWithEncodedImageBuffer:](v5, "initWithEncodedImageBuffer:", &v8);
  objc_setAssociatedObject(self, sel_encodedData, v7, (void *)1);

  if (v8)
    (*v8)[1](v8);
}

- (WK_RTCEncodedImage)initWithNativeEncodedImage:(const void *)a3
{
  WK_RTCEncodedImage *v4;
  void (***v5)(_QWORD);
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (***v13)(_QWORD);
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WK_RTCEncodedImage;
  v4 = -[WK_RTCEncodedImage init](&v14, sel_init);
  if (v4)
  {
    v5 = (void (***)(_QWORD))*((_QWORD *)a3 + 17);
    v13 = v5;
    if (v5)
      (**v5)(v5);
    -[WK_RTCEncodedImage setEncodedData:](v4, "setEncodedData:", &v13);
    if (v13)
      (*v13)[1](v13);
    v6 = (void *)MEMORY[0x24BDBCE50];
    -[WK_RTCEncodedImage encodedData](v4, "encodedData");
    v7 = (*(uint64_t (**)())(*(_QWORD *)v12 + 40))();
    -[WK_RTCEncodedImage encodedData](v4, "encodedData");
    objc_msgSend(v6, "dataWithBytesNoCopy:length:freeWhenDone:", v7, (*(uint64_t (**)())(*(_QWORD *)v11 + 48))(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WK_RTCEncodedImage setBuffer:](v4, "setBuffer:", v8);

    if (v11)
      (*(void (**)())(*(_QWORD *)v11 + 8))();
    if (v12)
      (*(void (**)())(*(_QWORD *)v12 + 8))();
    -[WK_RTCEncodedImage setEncodedWidth:](v4, "setEncodedWidth:", *(unsigned int *)a3);
    -[WK_RTCEncodedImage setEncodedHeight:](v4, "setEncodedHeight:", *((unsigned int *)a3 + 1));
    -[WK_RTCEncodedImage setTimeStamp:](v4, "setTimeStamp:", *((unsigned int *)a3 + 38));
    -[WK_RTCEncodedImage setCaptureTimeMs:](v4, "setCaptureTimeMs:", *((_QWORD *)a3 + 2));
    -[WK_RTCEncodedImage setNtpTimeMs:](v4, "setNtpTimeMs:", *((_QWORD *)a3 + 1));
    -[WK_RTCEncodedImage setFlags:](v4, "setFlags:", *((unsigned __int8 *)a3 + 40));
    -[WK_RTCEncodedImage setEncodeStartMs:](v4, "setEncodeStartMs:", *((_QWORD *)a3 + 6));
    -[WK_RTCEncodedImage setEncodeFinishMs:](v4, "setEncodeFinishMs:", *((_QWORD *)a3 + 7));
    -[WK_RTCEncodedImage setFrameType:](v4, "setFrameType:", *((int *)a3 + 6));
    -[WK_RTCEncodedImage setRotation:](v4, "setRotation:", *((unsigned int *)a3 + 7));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)a3 + 9));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WK_RTCEncodedImage setQp:](v4, "setQp:", v9);

    -[WK_RTCEncodedImage setContentType:](v4, "setContentType:", *((unsigned __int8 *)a3 + 32) == 1);
  }
  return v4;
}

- (EncodedImage)nativeEncodedImage
{
  int64_t *p_var1;
  scoped_refptr<webrtc::EncodedImageBufferInterface> *p_var10;
  void *v7;
  id v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t (**v13)();
  void *v14;
  void *v15;
  void *v16;
  EncodedImage *result;
  EncodedImageBufferInterface *v18;
  uint64_t v19;

  *(_QWORD *)&retstr->var0 = 0;
  retstr->var2 = 0;
  retstr->var3 = 0;
  *(_QWORD *)&retstr->var4 = 4;
  retstr->var6 = 0;
  retstr->var7 = -1;
  retstr->var8.var0 = -1;
  retstr->var9.var1 = 0;
  retstr->var13.__engaged_ = 0;
  retstr->var14.var0.var0 = 0;
  retstr->var14.var1 = 0;
  retstr->var15.var0.__null_state_ = 0;
  retstr->var15.__engaged_ = 0;
  retstr->var16.var0.__null_state_ = 0;
  retstr->var16.__engaged_ = 0;
  retstr->var17.var0.var1.var0.var0 = 0;
  *(_OWORD *)&retstr->var8.var1 = 0u;
  p_var1 = &retstr->var8.var1;
  retstr->var17.var0.var2.var0 = 0;
  retstr->var10.ptr_ = 0;
  p_var10 = &retstr->var10;
  retstr->var9.var0.var0 = 0;
  *(_OWORD *)&retstr->var8.var5 = 0u;
  *(_OWORD *)&retstr->var8.var7 = 0u;
  *(_OWORD *)&retstr->var8.var3 = 0u;
  retstr->var11 = 0;
  *(unint64_t *)((char *)&retstr->var11 + 5) = 0;
  retstr->var17.var0.var0 = &retstr->var17.var0.var1;
  retstr->var18.var0.var0 = 0;
  retstr->var18.var1 = 0;
  retstr->var19.var0.var0 = 0;
  retstr->var19.var1 = 0;
  retstr->var20.var0.var0 = 0;
  *(_WORD *)&retstr->var21 = 1;
  -[WK_RTCEncodedImage encodedData](self, "encodedData");
  if (v19)
  {
    (*(void (**)())(*(_QWORD *)v19 + 8))();
    -[WK_RTCEncodedImage encodedData](self, "encodedData");
    if (v18)
      (**(void (***)())v18)();
    if (p_var10->ptr_)
      (*(void (**)(EncodedImageBufferInterface *))(*(_QWORD *)p_var10->ptr_ + 8))(p_var10->ptr_);
    p_var10->ptr_ = v18;
    retstr->var11 = (*(uint64_t (**)())(*(_QWORD *)v18 + 48))();
    if (v18)
      (*(void (**)())(*(_QWORD *)v18 + 8))();
  }
  else
  {
    -[WK_RTCEncodedImage buffer](self, "buffer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[WK_RTCEncodedImage buffer](self, "buffer");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = operator new();
      *(_QWORD *)v9 = off_24C0BC400;
      *(_QWORD *)(v9 + 8) = v8;
      *(_DWORD *)(v9 + 16) = 0;
      v10 = (unsigned int *)(v9 + 16);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
      do
        v12 = __ldxr(v10);
      while (__stxr(v12 + 1, v10));
      if (p_var10->ptr_)
      {
        (*(void (**)(EncodedImageBufferInterface *))(*(_QWORD *)p_var10->ptr_ + 8))(p_var10->ptr_);
        v13 = *(uint64_t (***)())v9;
      }
      else
      {
        v13 = off_24C0BC400;
      }
      p_var10->ptr_ = (EncodedImageBufferInterface *)v9;
      retstr->var11 = ((uint64_t (*)(uint64_t))v13[6])(v9);
      (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);

    }
  }
  -[WK_RTCEncodedImage buffer](self, "buffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->var11 = objc_msgSend(v14, "length");

  retstr->var0 = -[WK_RTCEncodedImage encodedWidth](self, "encodedWidth");
  retstr->var1 = -[WK_RTCEncodedImage encodedHeight](self, "encodedHeight");
  retstr->var12 = -[WK_RTCEncodedImage timeStamp](self, "timeStamp");
  retstr->var3 = -[WK_RTCEncodedImage captureTimeMs](self, "captureTimeMs");
  retstr->var2 = -[WK_RTCEncodedImage ntpTimeMs](self, "ntpTimeMs");
  retstr->var8.var0 = -[WK_RTCEncodedImage flags](self, "flags");
  *p_var1 = -[WK_RTCEncodedImage encodeStartMs](self, "encodeStartMs");
  retstr->var8.var2 = -[WK_RTCEncodedImage encodeFinishMs](self, "encodeFinishMs");
  retstr->var4 = -[WK_RTCEncodedImage frameType](self, "frameType");
  retstr->var5 = -[WK_RTCEncodedImage rotation](self, "rotation");
  -[WK_RTCEncodedImage qp](self, "qp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[WK_RTCEncodedImage qp](self, "qp");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    retstr->var7 = objc_msgSend(v16, "intValue");

  }
  else
  {
    retstr->var7 = -1;
  }

  result = -[WK_RTCEncodedImage contentType](self, "contentType");
  retstr->var6 = result == (EncodedImage *)1;
  return result;
}

- (NSData)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_buffer, a3);
}

- (int)encodedWidth
{
  return self->_encodedWidth;
}

- (void)setEncodedWidth:(int)a3
{
  self->_encodedWidth = a3;
}

- (int)encodedHeight
{
  return self->_encodedHeight;
}

- (void)setEncodedHeight:(int)a3
{
  self->_encodedHeight = a3;
}

- (int64_t)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(int64_t)a3
{
  self->_timeStamp = a3;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (void)setDuration:(unint64_t)a3
{
  self->_duration = a3;
}

- (int64_t)captureTimeMs
{
  return self->_captureTimeMs;
}

- (void)setCaptureTimeMs:(int64_t)a3
{
  self->_captureTimeMs = a3;
}

- (int64_t)ntpTimeMs
{
  return self->_ntpTimeMs;
}

- (void)setNtpTimeMs:(int64_t)a3
{
  self->_ntpTimeMs = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned __int8)a3
{
  self->_flags = a3;
}

- (int64_t)encodeStartMs
{
  return self->_encodeStartMs;
}

- (void)setEncodeStartMs:(int64_t)a3
{
  self->_encodeStartMs = a3;
}

- (int64_t)encodeFinishMs
{
  return self->_encodeFinishMs;
}

- (void)setEncodeFinishMs:(int64_t)a3
{
  self->_encodeFinishMs = a3;
}

- (unint64_t)frameType
{
  return self->_frameType;
}

- (void)setFrameType:(unint64_t)a3
{
  self->_frameType = a3;
}

- (int64_t)rotation
{
  return self->_rotation;
}

- (void)setRotation:(int64_t)a3
{
  self->_rotation = a3;
}

- (NSNumber)qp
{
  return self->_qp;
}

- (void)setQp:(id)a3
{
  objc_storeStrong((id *)&self->_qp, a3);
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (BOOL)completeFrame
{
  return self->_completeFrame;
}

- (void)setCompleteFrame:(BOOL)a3
{
  self->_completeFrame = a3;
}

- (int)temporalIndex
{
  return self->_temporalIndex;
}

- (void)setTemporalIndex:(int)a3
{
  self->_temporalIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qp, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
