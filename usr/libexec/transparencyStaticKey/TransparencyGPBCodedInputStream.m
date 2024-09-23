@implementation TransparencyGPBCodedInputStream

+ (id)streamWithData:(id)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithData:", a3);
}

- (TransparencyGPBCodedInputStream)initWithData:(id)a3
{
  TransparencyGPBCodedInputStream *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TransparencyGPBCodedInputStream;
  v4 = -[TransparencyGPBCodedInputStream init](&v7, "init");
  if (v4)
  {
    v4->buffer_ = (NSData *)a3;
    v4->state_.bytes = (char *)objc_msgSend(a3, "bytes");
    v5 = objc_msgSend(a3, "length");
    v4->state_.bufferSize = (unint64_t)v5;
    v4->state_.currentLimit = (unint64_t)v5;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBCodedInputStream;
  -[TransparencyGPBCodedInputStream dealloc](&v3, "dealloc");
}

- (int)readTag
{
  return sub_1000347D8((uint64_t)&self->state_);
}

- (void)checkLastTagWas:(int)a3
{
  if (self->state_.lastTag != a3)
    sub_10003488C(-103, CFSTR("Unexpected tag read"));
}

- (BOOL)skipField:(int)a3
{
  int v5;
  BOOL result;
  unint64_t v7;
  int v8;
  int v9;

  v5 = sub_100023738(a3);
  result = 0;
  switch(v5)
  {
    case 0:
      sub_100034674((uint64_t *)&self->state_);
      goto LABEL_9;
    case 1:
      sub_100034A10(&self->state_.bytes, 8);
      v7 = self->state_.bufferPos + 8;
      goto LABEL_8;
    case 2:
      v8 = sub_100034674((uint64_t *)&self->state_);
      sub_100034A10(&self->state_.bytes, v8);
      v7 = self->state_.bufferPos + v8;
      goto LABEL_8;
    case 3:
      -[TransparencyGPBCodedInputStream skipMessage](self, "skipMessage");
      v9 = sub_100023740(a3);
      if (self->state_.lastTag != sub_100023730(v9, 4))
        sub_10003488C(-103, CFSTR("Unexpected tag read"));
      goto LABEL_9;
    case 5:
      sub_100034A10(&self->state_.bytes, 4);
      v7 = self->state_.bufferPos + 4;
LABEL_8:
      self->state_.bufferPos = v7;
LABEL_9:
      result = 1;
      break;
    default:
      return result;
  }
  return result;
}

- (void)skipMessage
{
  TransparencyGPBCodedInputStreamState *p_state;
  uint64_t v4;

  p_state = &self->state_;
  do
    v4 = sub_1000347D8((uint64_t)p_state);
  while ((_DWORD)v4 && -[TransparencyGPBCodedInputStream skipField:](self, "skipField:", v4));
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
    sub_10003488C(-102, 0);
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

  sub_100034A10(&self->state_.bytes, 8);
  bufferPos = self->state_.bufferPos;
  result = *(double *)&self->state_.bytes[bufferPos];
  self->state_.bufferPos = bufferPos + 8;
  return result;
}

- (float)readFloat
{
  unint64_t bufferPos;
  float result;

  sub_100034A10(&self->state_.bytes, 4);
  bufferPos = self->state_.bufferPos;
  result = *(float *)&self->state_.bytes[bufferPos];
  self->state_.bufferPos = bufferPos + 4;
  return result;
}

- (unint64_t)readUInt64
{
  return sub_100034674((uint64_t *)&self->state_);
}

- (int64_t)readInt64
{
  return sub_100034674((uint64_t *)&self->state_);
}

- (int)readInt32
{
  return sub_100034674((uint64_t *)&self->state_);
}

- (unint64_t)readFixed64
{
  unint64_t bufferPos;
  unint64_t result;

  sub_100034A10(&self->state_.bytes, 8);
  bufferPos = self->state_.bufferPos;
  result = *(_QWORD *)&self->state_.bytes[bufferPos];
  self->state_.bufferPos = bufferPos + 8;
  return result;
}

- (unsigned)readFixed32
{
  unint64_t bufferPos;
  unsigned int result;

  sub_100034A10(&self->state_.bytes, 4);
  bufferPos = self->state_.bufferPos;
  result = *(_DWORD *)&self->state_.bytes[bufferPos];
  self->state_.bufferPos = bufferPos + 4;
  return result;
}

- (BOOL)readBool
{
  return sub_100034674((uint64_t *)&self->state_) != 0;
}

- (id)readString
{
  return (id)(id)sub_100034980((uint64_t *)&self->state_);
}

- (void)readGroup:(int)a3 message:(id)a4 extensionRegistry:(id)a5
{
  unint64_t recursionDepth;

  recursionDepth = self->state_.recursionDepth;
  if (recursionDepth >= 0x64)
  {
    sub_10003488C(-106, 0);
    recursionDepth = self->state_.recursionDepth;
  }
  self->state_.recursionDepth = recursionDepth + 1;
  objc_msgSend(a4, "mergeFromCodedInputStream:extensionRegistry:", self, a5);
  if (self->state_.lastTag != sub_100023730(a3, 4))
    sub_10003488C(-103, CFSTR("Unexpected tag read"));
  --self->state_.recursionDepth;
}

- (void)readUnknownGroup:(int)a3 message:(id)a4
{
  unint64_t recursionDepth;

  recursionDepth = self->state_.recursionDepth;
  if (recursionDepth >= 0x64)
  {
    sub_10003488C(-106, 0);
    recursionDepth = self->state_.recursionDepth;
  }
  self->state_.recursionDepth = recursionDepth + 1;
  objc_msgSend(a4, "mergeFromCodedInputStream:", self);
  if (self->state_.lastTag != sub_100023730(a3, 4))
    sub_10003488C(-103, CFSTR("Unexpected tag read"));
  --self->state_.recursionDepth;
}

- (void)readMessage:(id)a3 extensionRegistry:(id)a4
{
  uint64_t *p_state;
  int v8;
  unint64_t currentLimit;
  unint64_t v10;

  p_state = (uint64_t *)&self->state_;
  if (self->state_.recursionDepth >= 0x64)
    sub_10003488C(-106, 0);
  v8 = sub_100034674(p_state);
  currentLimit = self->state_.currentLimit;
  v10 = self->state_.bufferPos + v8;
  if (v10 > currentLimit)
    sub_10003488C(-102, 0);
  self->state_.currentLimit = v10;
  ++self->state_.recursionDepth;
  objc_msgSend(a3, "mergeFromCodedInputStream:extensionRegistry:", self, a4);
  if (self->state_.lastTag)
    sub_10003488C(-103, CFSTR("Unexpected tag read"));
  --self->state_.recursionDepth;
  self->state_.currentLimit = currentLimit;
}

- (void)readMapEntry:(id)a3 extensionRegistry:(id)a4 field:(id)a5 parentMessage:(id)a6
{
  uint64_t *p_state;
  int v12;
  unint64_t currentLimit;
  unint64_t v14;

  p_state = (uint64_t *)&self->state_;
  if (self->state_.recursionDepth >= 0x64)
    sub_10003488C(-106, 0);
  v12 = sub_100034674(p_state);
  currentLimit = self->state_.currentLimit;
  v14 = self->state_.bufferPos + v12;
  if (v14 > currentLimit)
    sub_10003488C(-102, 0);
  self->state_.currentLimit = v14;
  ++self->state_.recursionDepth;
  sub_1000356A0(a3, (uint64_t *)self, (uint64_t)a4, a5, a6);
  if (self->state_.lastTag)
    sub_10003488C(-103, CFSTR("Unexpected tag read"));
  --self->state_.recursionDepth;
  self->state_.currentLimit = currentLimit;
}

- (id)readBytes
{
  return sub_100034A6C((uint64_t *)&self->state_);
}

- (unsigned)readUInt32
{
  return sub_100034674((uint64_t *)&self->state_);
}

- (int)readEnum
{
  return sub_100034674((uint64_t *)&self->state_);
}

- (int)readSFixed32
{
  unint64_t bufferPos;
  int result;

  sub_100034A10(&self->state_.bytes, 4);
  bufferPos = self->state_.bufferPos;
  result = *(_DWORD *)&self->state_.bytes[bufferPos];
  self->state_.bufferPos = bufferPos + 4;
  return result;
}

- (int64_t)readSFixed64
{
  unint64_t bufferPos;
  int64_t result;

  sub_100034A10(&self->state_.bytes, 8);
  bufferPos = self->state_.bufferPos;
  result = *(_QWORD *)&self->state_.bytes[bufferPos];
  self->state_.bufferPos = bufferPos + 8;
  return result;
}

- (int)readSInt32
{
  unsigned int v2;

  v2 = sub_100034674((uint64_t *)&self->state_);
  return -(v2 & 1) ^ (v2 >> 1);
}

- (int64_t)readSInt64
{
  unint64_t v2;

  v2 = sub_100034674((uint64_t *)&self->state_);
  return -(uint64_t)(v2 & 1) ^ (v2 >> 1);
}

@end
