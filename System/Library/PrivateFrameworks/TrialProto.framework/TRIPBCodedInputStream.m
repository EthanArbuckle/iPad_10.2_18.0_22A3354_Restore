@implementation TRIPBCodedInputStream

- (void)readMessage:(id)a3 extensionRegistry:(id)a4
{
  uint64_t *p_state;
  int RawVarint64;
  unint64_t currentLimit;
  unint64_t v10;

  p_state = (uint64_t *)&self->state_;
  if (self->state_.recursionDepth >= 0x64)
    RaiseException(-106, 0);
  RawVarint64 = ReadRawVarint64(p_state);
  currentLimit = self->state_.currentLimit;
  v10 = self->state_.bufferPos + RawVarint64;
  if (v10 > currentLimit)
    RaiseException(-102, 0);
  self->state_.currentLimit = v10;
  ++self->state_.recursionDepth;
  objc_msgSend(a3, "mergeFromCodedInputStream:extensionRegistry:", self, a4);
  if (self->state_.lastTag)
    RaiseException(-103, CFSTR("Unexpected tag read"));
  --self->state_.recursionDepth;
  self->state_.currentLimit = currentLimit;
}

- (TRIPBCodedInputStream)initWithData:(id)a3
{
  TRIPBCodedInputStream *v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TRIPBCodedInputStream;
  v4 = -[TRIPBCodedInputStream init](&v9, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    if (v5 != objc_opt_class())
    {
      v8 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TRIPBCodedInputStream initWithData:]"), CFSTR("TRIPBCodedInputStream.m"), 331, CFSTR("Subclassing of TRIPBCodedInputStream is not allowed."));
    }
    v4->buffer_ = (NSData *)a3;
    v4->state_.bytes = (char *)objc_msgSend(a3, "bytes");
    v6 = objc_msgSend(a3, "length");
    v4->state_.bufferSize = v6;
    v4->state_.currentLimit = v6;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIPBCodedInputStream;
  -[TRIPBCodedInputStream dealloc](&v3, sel_dealloc);
}

- (void)checkLastTagWas:(int)a3
{
  if (self->state_.lastTag != a3)
    RaiseException(-103, CFSTR("Unexpected tag read"));
}

- (void)readMapEntry:(id)a3 extensionRegistry:(id)a4 field:(id)a5 parentMessage:(id)a6
{
  uint64_t *p_state;
  int RawVarint64;
  unint64_t currentLimit;
  unint64_t v14;

  p_state = (uint64_t *)&self->state_;
  if (self->state_.recursionDepth >= 0x64)
    RaiseException(-106, 0);
  RawVarint64 = ReadRawVarint64(p_state);
  currentLimit = self->state_.currentLimit;
  v14 = self->state_.bufferPos + RawVarint64;
  if (v14 > currentLimit)
    RaiseException(-102, 0);
  self->state_.currentLimit = v14;
  ++self->state_.recursionDepth;
  TRIPBDictionaryReadEntry(a3, (uint64_t *)self, (uint64_t)a4, a5, a6);
  if (self->state_.lastTag)
    RaiseException(-103, CFSTR("Unexpected tag read"));
  --self->state_.recursionDepth;
  self->state_.currentLimit = currentLimit;
}

- (BOOL)skipField:(int)a3
{
  BOOL result;
  unint64_t v6;
  int RawVarint64;

  if ((~a3 & 6) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBCodedInputStream.m"), 361, CFSTR("Invalid tag"));
  result = 0;
  switch(a3 & 7)
  {
    case 0:
      ReadRawVarint64((uint64_t *)&self->state_);
      goto LABEL_13;
    case 1:
      CheckSize((uint64_t)&self->state_, 8);
      v6 = self->state_.bufferPos + 8;
      goto LABEL_12;
    case 2:
      RawVarint64 = ReadRawVarint64((uint64_t *)&self->state_);
      if (RawVarint64 < 0)
        RaiseException(-100, CFSTR("Field delimited with negative length"));
      CheckSize((uint64_t)&self->state_, RawVarint64);
      v6 = self->state_.bufferPos + RawVarint64;
      goto LABEL_12;
    case 3:
      -[TRIPBCodedInputStream skipMessage](self, "skipMessage");
      if (self->state_.lastTag != (a3 & 0xFFFFFFF8 | 4))
        RaiseException(-103, CFSTR("Unexpected tag read"));
      goto LABEL_13;
    case 5:
      CheckSize((uint64_t)&self->state_, 4);
      v6 = self->state_.bufferPos + 4;
LABEL_12:
      self->state_.bufferPos = v6;
LABEL_13:
      result = 1;
      break;
    default:
      return result;
  }
  return result;
}

- (int)readTag
{
  return TRIPBCodedInputStreamReadTag((uint64_t)&self->state_);
}

- (id)readString
{
  return (id)(id)TRIPBCodedInputStreamReadRetainedString((uint64_t *)&self->state_);
}

+ (id)streamWithData:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithData:", a3);
}

- (void)skipMessage
{
  TRIPBCodedInputStreamState *p_state;
  uint64_t Tag;

  p_state = &self->state_;
  do
    Tag = TRIPBCodedInputStreamReadTag((uint64_t)p_state);
  while ((_DWORD)Tag && -[TRIPBCodedInputStream skipField:](self, "skipField:", Tag));
}

- (BOOL)isAtEnd
{
  unint64_t bufferPos;

  bufferPos = self->state_.bufferPos;
  return bufferPos == self->state_.bufferSize || bufferPos == self->state_.currentLimit;
}

- (unint64_t)position
{
  return self->state_.bufferPos;
}

- (unint64_t)pushLimit:(unint64_t)a3
{
  unint64_t currentLimit;
  unint64_t v5;

  currentLimit = self->state_.currentLimit;
  v5 = self->state_.bufferPos + a3;
  if (v5 > currentLimit)
    RaiseException(-102, 0);
  self->state_.currentLimit = v5;
  return currentLimit;
}

- (void)popLimit:(unint64_t)a3
{
  self->state_.currentLimit = a3;
}

- (double)readDouble
{
  unint64_t bufferPos;
  double result;

  CheckSize((uint64_t)&self->state_, 8);
  bufferPos = self->state_.bufferPos;
  result = *(double *)&self->state_.bytes[bufferPos];
  self->state_.bufferPos = bufferPos + 8;
  return result;
}

- (float)readFloat
{
  unint64_t bufferPos;
  float result;

  CheckSize((uint64_t)&self->state_, 4);
  bufferPos = self->state_.bufferPos;
  result = *(float *)&self->state_.bytes[bufferPos];
  self->state_.bufferPos = bufferPos + 4;
  return result;
}

- (unint64_t)readUInt64
{
  return ReadRawVarint64((uint64_t *)&self->state_);
}

- (int64_t)readInt64
{
  return ReadRawVarint64((uint64_t *)&self->state_);
}

- (int)readInt32
{
  return ReadRawVarint64((uint64_t *)&self->state_);
}

- (unint64_t)readFixed64
{
  unint64_t bufferPos;
  unint64_t result;

  CheckSize((uint64_t)&self->state_, 8);
  bufferPos = self->state_.bufferPos;
  result = *(_QWORD *)&self->state_.bytes[bufferPos];
  self->state_.bufferPos = bufferPos + 8;
  return result;
}

- (unsigned)readFixed32
{
  unint64_t bufferPos;
  unsigned int result;

  CheckSize((uint64_t)&self->state_, 4);
  bufferPos = self->state_.bufferPos;
  result = *(_DWORD *)&self->state_.bytes[bufferPos];
  self->state_.bufferPos = bufferPos + 4;
  return result;
}

- (BOOL)readBool
{
  return ReadRawVarint64((uint64_t *)&self->state_) != 0;
}

- (void)readGroup:(int)a3 message:(id)a4 extensionRegistry:(id)a5
{
  unint64_t recursionDepth;

  recursionDepth = self->state_.recursionDepth;
  if (recursionDepth >= 0x64)
  {
    RaiseException(-106, 0);
    recursionDepth = self->state_.recursionDepth;
  }
  self->state_.recursionDepth = recursionDepth + 1;
  objc_msgSend(a4, "mergeFromCodedInputStream:extensionRegistry:", self, a5);
  if (self->state_.lastTag != ((8 * a3) | 4))
    RaiseException(-103, CFSTR("Unexpected tag read"));
  --self->state_.recursionDepth;
}

- (void)readUnknownGroup:(int)a3 message:(id)a4
{
  unint64_t recursionDepth;

  recursionDepth = self->state_.recursionDepth;
  if (recursionDepth >= 0x64)
  {
    RaiseException(-106, 0);
    recursionDepth = self->state_.recursionDepth;
  }
  self->state_.recursionDepth = recursionDepth + 1;
  objc_msgSend(a4, "mergeFromCodedInputStream:", self);
  if (self->state_.lastTag != ((8 * a3) | 4))
    RaiseException(-103, CFSTR("Unexpected tag read"));
  --self->state_.recursionDepth;
}

- (id)readBytes
{
  return (id)TRIPBCodedInputStreamReadRetainedBytes((uint64_t *)&self->state_);
}

- (unsigned)readUInt32
{
  return ReadRawVarint64((uint64_t *)&self->state_);
}

- (int)readEnum
{
  return ReadRawVarint64((uint64_t *)&self->state_);
}

- (int)readSFixed32
{
  unint64_t bufferPos;
  int result;

  CheckSize((uint64_t)&self->state_, 4);
  bufferPos = self->state_.bufferPos;
  result = *(_DWORD *)&self->state_.bytes[bufferPos];
  self->state_.bufferPos = bufferPos + 4;
  return result;
}

- (int64_t)readSFixed64
{
  unint64_t bufferPos;
  int64_t result;

  CheckSize((uint64_t)&self->state_, 8);
  bufferPos = self->state_.bufferPos;
  result = *(_QWORD *)&self->state_.bytes[bufferPos];
  self->state_.bufferPos = bufferPos + 8;
  return result;
}

- (int)readSInt32
{
  unsigned int RawVarint64;

  RawVarint64 = ReadRawVarint64((uint64_t *)&self->state_);
  return -(RawVarint64 & 1) ^ (RawVarint64 >> 1);
}

- (int64_t)readSInt64
{
  unint64_t RawVarint64;

  RawVarint64 = ReadRawVarint64((uint64_t *)&self->state_);
  return -(uint64_t)(RawVarint64 & 1) ^ (RawVarint64 >> 1);
}

@end
