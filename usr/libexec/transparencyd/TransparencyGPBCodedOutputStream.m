@implementation TransparencyGPBCodedOutputStream

- (void)dealloc
{
  objc_super v3;

  -[TransparencyGPBCodedOutputStream flush](self, "flush");
  -[NSOutputStream close](self->state_.output, "close");

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBCodedOutputStream;
  -[TransparencyGPBCodedOutputStream dealloc](&v3, "dealloc");
}

- (TransparencyGPBCodedOutputStream)initWithOutputStream:(id)a3
{
  return -[TransparencyGPBCodedOutputStream initWithOutputStream:data:](self, "initWithOutputStream:data:", a3, +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", vm_page_size));
}

- (TransparencyGPBCodedOutputStream)initWithData:(id)a3
{
  return -[TransparencyGPBCodedOutputStream initWithOutputStream:data:](self, "initWithOutputStream:data:", 0, a3);
}

- (TransparencyGPBCodedOutputStream)initWithOutputStream:(id)a3 data:(id)a4
{
  TransparencyGPBCodedOutputStream *v6;
  NSOutputStream *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TransparencyGPBCodedOutputStream;
  v6 = -[TransparencyGPBCodedOutputStream init](&v9, "init");
  if (v6)
  {
    v6->buffer_ = (NSMutableData *)a4;
    v6->state_.bytes = (char *)objc_msgSend(a4, "mutableBytes");
    v6->state_.size = (unint64_t)objc_msgSend(a4, "length");
    v7 = (NSOutputStream *)a3;
    v6->state_.output = v7;
    -[NSOutputStream open](v7, "open");
  }
  return v6;
}

+ (id)streamWithOutputStream:(id)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithOutputStream:data:", a3, +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", vm_page_size));
}

+ (id)streamWithData:(id)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithData:", a3);
}

- (void)writeDoubleNoTag:(double)a3
{
  sub_1000DCF38((uint64_t *)&self->state_, *(uint64_t *)&a3);
}

- (void)writeDouble:(int)a3 value:(double)a4
{
  uint64_t *p_state;
  unsigned int v6;

  p_state = (uint64_t *)&self->state_;
  v6 = sub_10010B59C(a3, 1);
  sub_1000DD630(p_state, v6);
  sub_1000DCF38(p_state, *(uint64_t *)&a4);
}

- (void)writeFloatNoTag:(float)a3
{
  sub_1000DD108((uint64_t *)&self->state_, SLODWORD(a3));
}

- (void)writeFloat:(int)a3 value:(float)a4
{
  uint64_t *p_state;
  unsigned int v6;

  p_state = (uint64_t *)&self->state_;
  v6 = sub_10010B59C(a3, 5);
  sub_1000DD630(p_state, v6);
  sub_1000DD108(p_state, SLODWORD(a4));
}

- (void)writeUInt64NoTag:(unint64_t)a3
{
  sub_1000DD228((uint64_t *)&self->state_, a3);
}

- (void)writeUInt64:(int)a3 value:(unint64_t)a4
{
  uint64_t *p_state;
  unsigned int v6;

  p_state = (uint64_t *)&self->state_;
  v6 = sub_10010B59C(a3, 0);
  sub_1000DD630(p_state, v6);
  sub_1000DD228(p_state, a4);
}

- (void)writeInt64NoTag:(int64_t)a3
{
  sub_1000DD228((uint64_t *)&self->state_, a3);
}

- (void)writeInt64:(int)a3 value:(int64_t)a4
{
  uint64_t *p_state;
  unsigned int v6;

  p_state = (uint64_t *)&self->state_;
  v6 = sub_10010B59C(a3, 0);
  sub_1000DD630(p_state, v6);
  sub_1000DD228(p_state, a4);
}

- (void)writeInt32NoTag:(int)a3
{
  sub_1000DD35C((uint64_t *)&self->state_, a3);
}

- (void)writeInt32:(int)a3 value:(int)a4
{
  uint64_t *p_state;
  unsigned int v6;

  p_state = (uint64_t *)&self->state_;
  v6 = sub_10010B59C(a3, 0);
  sub_1000DD630(p_state, v6);
  sub_1000DD35C(p_state, a4);
}

- (void)writeFixed64NoTag:(unint64_t)a3
{
  sub_1000DCF38((uint64_t *)&self->state_, a3);
}

- (void)writeFixed64:(int)a3 value:(unint64_t)a4
{
  uint64_t *p_state;
  unsigned int v6;

  p_state = (uint64_t *)&self->state_;
  v6 = sub_10010B59C(a3, 1);
  sub_1000DD630(p_state, v6);
  sub_1000DCF38(p_state, a4);
}

- (void)writeFixed32NoTag:(unsigned int)a3
{
  sub_1000DD108((uint64_t *)&self->state_, a3);
}

- (void)writeFixed32:(int)a3 value:(unsigned int)a4
{
  uint64_t *p_state;
  unsigned int v6;

  p_state = (uint64_t *)&self->state_;
  v6 = sub_10010B59C(a3, 5);
  sub_1000DD630(p_state, v6);
  sub_1000DD108(p_state, a4);
}

- (void)writeBoolNoTag:(BOOL)a3
{
  unint64_t position;
  char *bytes;

  position = self->state_.position;
  if (position == self->state_.size)
  {
    sub_1000DF974(&self->state_.bytes);
    position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.position = position + 1;
  bytes[position] = a3;
}

- (void)writeBool:(int)a3 value:(BOOL)a4
{
  uint64_t *p_state;
  unsigned int v7;
  unint64_t position;
  char *bytes;

  p_state = (uint64_t *)&self->state_;
  v7 = sub_10010B59C(a3, 0);
  sub_1000DD630(p_state, v7);
  position = self->state_.position;
  if (position == self->state_.size)
  {
    sub_1000DF974(p_state);
    position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.position = position + 1;
  bytes[position] = a4;
}

- (void)writeStringNoTag:(id)a3
{
  size_t v5;
  const char *CStringPtr;
  unint64_t position;
  size_t v8;
  char *v9;
  size_t v10;

  v5 = (size_t)objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 4);
  sub_1000DD630((uint64_t *)&self->state_, v5);
  if (v5)
  {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a3, 0x8000100u);
    position = self->state_.position;
    v8 = self->state_.size - position;
    if (v8 >= v5)
    {
      v10 = 0;
      v9 = &self->state_.bytes[position];
      if (CStringPtr)
      {
        memcpy(v9, CStringPtr, v5);
      }
      else
      {
        if (!objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v9, v8, &v10, 4, 0, 0, objc_msgSend(a3, "length"), 0))return;
        v5 = v10;
      }
      self->state_.position += v5;
    }
    else if (CStringPtr)
    {
      -[TransparencyGPBCodedOutputStream writeRawPtr:offset:length:](self, "writeRawPtr:offset:length:", CStringPtr);
    }
    else
    {
      -[TransparencyGPBCodedOutputStream writeRawData:](self, "writeRawData:", objc_msgSend(a3, "dataUsingEncoding:", 4));
    }
  }
}

- (void)writeString:(int)a3 value:(id)a4
{
  uint64_t *p_state;
  unsigned int v7;

  p_state = (uint64_t *)&self->state_;
  v7 = sub_10010B59C(a3, 2);
  sub_1000DD630(p_state, v7);
  -[TransparencyGPBCodedOutputStream writeStringNoTag:](self, "writeStringNoTag:", a4);
}

- (void)writeGroupNoTag:(int)a3 value:(id)a4
{
  unsigned int v6;

  objc_msgSend(a4, "writeToCodedOutputStream:", self);
  v6 = sub_10010B59C(a3, 4);
  sub_1000DD630((uint64_t *)&self->state_, v6);
}

- (void)writeGroup:(int)a3 value:(id)a4
{
  uint64_t v5;
  uint64_t *p_state;
  unsigned int v8;

  v5 = *(_QWORD *)&a3;
  p_state = (uint64_t *)&self->state_;
  v8 = sub_10010B59C(a3, 3);
  sub_1000DD630(p_state, v8);
  -[TransparencyGPBCodedOutputStream writeGroupNoTag:value:](self, "writeGroupNoTag:value:", v5, a4);
}

- (void)writeUnknownGroupNoTag:(int)a3 value:(id)a4
{
  unsigned int v6;

  objc_msgSend(a4, "writeToCodedOutputStream:", self);
  v6 = sub_10010B59C(a3, 4);
  sub_1000DD630((uint64_t *)&self->state_, v6);
}

- (void)writeUnknownGroup:(int)a3 value:(id)a4
{
  uint64_t v5;
  uint64_t *p_state;
  unsigned int v8;

  v5 = *(_QWORD *)&a3;
  p_state = (uint64_t *)&self->state_;
  v8 = sub_10010B59C(a3, 3);
  sub_1000DD630(p_state, v8);
  -[TransparencyGPBCodedOutputStream writeUnknownGroupNoTag:value:](self, "writeUnknownGroupNoTag:value:", v5, a4);
}

- (void)writeMessageNoTag:(id)a3
{
  sub_1000DD630((uint64_t *)&self->state_, objc_msgSend(a3, "serializedSize"));
  objc_msgSend(a3, "writeToCodedOutputStream:", self);
}

- (void)writeMessage:(int)a3 value:(id)a4
{
  uint64_t *p_state;
  unsigned int v7;

  p_state = (uint64_t *)&self->state_;
  v7 = sub_10010B59C(a3, 2);
  sub_1000DD630(p_state, v7);
  -[TransparencyGPBCodedOutputStream writeMessageNoTag:](self, "writeMessageNoTag:", a4);
}

- (void)writeBytesNoTag:(id)a3
{
  sub_1000DD630((uint64_t *)&self->state_, objc_msgSend(a3, "length"));
  -[TransparencyGPBCodedOutputStream writeRawData:](self, "writeRawData:", a3);
}

- (void)writeBytes:(int)a3 value:(id)a4
{
  uint64_t *p_state;
  unsigned int v7;

  p_state = (uint64_t *)&self->state_;
  v7 = sub_10010B59C(a3, 2);
  sub_1000DD630(p_state, v7);
  -[TransparencyGPBCodedOutputStream writeBytesNoTag:](self, "writeBytesNoTag:", a4);
}

- (void)writeUInt32NoTag:(unsigned int)a3
{
  sub_1000DD630((uint64_t *)&self->state_, a3);
}

- (void)writeUInt32:(int)a3 value:(unsigned int)a4
{
  sub_1000DD98C((uint64_t *)&self->state_, a3, a4);
}

- (void)writeEnumNoTag:(int)a3
{
  sub_1000DD35C((uint64_t *)&self->state_, a3);
}

- (void)writeEnum:(int)a3 value:(int)a4
{
  uint64_t *p_state;
  unsigned int v6;

  p_state = (uint64_t *)&self->state_;
  v6 = sub_10010B59C(a3, 0);
  sub_1000DD630(p_state, v6);
  sub_1000DD35C(p_state, a4);
}

- (void)writeSFixed32NoTag:(int)a3
{
  sub_1000DD108((uint64_t *)&self->state_, a3);
}

- (void)writeSFixed32:(int)a3 value:(int)a4
{
  uint64_t *p_state;
  unsigned int v6;

  p_state = (uint64_t *)&self->state_;
  v6 = sub_10010B59C(a3, 5);
  sub_1000DD630(p_state, v6);
  sub_1000DD108(p_state, a4);
}

- (void)writeSFixed64NoTag:(int64_t)a3
{
  sub_1000DCF38((uint64_t *)&self->state_, a3);
}

- (void)writeSFixed64:(int)a3 value:(int64_t)a4
{
  uint64_t *p_state;
  unsigned int v6;

  p_state = (uint64_t *)&self->state_;
  v6 = sub_10010B59C(a3, 1);
  sub_1000DD630(p_state, v6);
  sub_1000DCF38(p_state, a4);
}

- (void)writeSInt32NoTag:(int)a3
{
  sub_1000DD630((uint64_t *)&self->state_, (2 * a3) ^ (a3 >> 31));
}

- (void)writeSInt32:(int)a3 value:(int)a4
{
  uint64_t *p_state;
  unsigned int v6;

  p_state = (uint64_t *)&self->state_;
  v6 = sub_10010B59C(a3, 0);
  sub_1000DD630(p_state, v6);
  sub_1000DD630(p_state, (2 * a4) ^ (a4 >> 31));
}

- (void)writeSInt64NoTag:(int64_t)a3
{
  sub_1000DD228((uint64_t *)&self->state_, (2 * a3) ^ (a3 >> 63));
}

- (void)writeSInt64:(int)a3 value:(int64_t)a4
{
  uint64_t *p_state;
  unsigned int v6;

  p_state = (uint64_t *)&self->state_;
  v6 = sub_10010B59C(a3, 0);
  sub_1000DD630(p_state, v6);
  sub_1000DD228(p_state, (2 * a4) ^ (a4 >> 63));
}

- (void)writeDoubleArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  _QWORD v8[5];
  int v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000DDCB4;
      v11[3] = &unk_100244AB0;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1000DD630((uint64_t *)&self->state_, a5);
      sub_1000DD630((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000DDCD4;
      v10[3] = &unk_100244AD8;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DDCDC;
    v8[3] = &unk_100244B00;
    v8[4] = self;
    v9 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v8);
  }
}

- (void)writeFloatArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  _QWORD v8[5];
  int v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000DDE48;
      v11[3] = &unk_100244B28;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1000DD630((uint64_t *)&self->state_, a5);
      sub_1000DD630((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000DDE68;
      v10[3] = &unk_100244B50;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DDE70;
    v8[3] = &unk_100244B78;
    v8[4] = self;
    v9 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v8);
  }
}

- (void)writeUInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  _QWORD v8[5];
  int v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000DDFDC;
      v11[3] = &unk_100244BA0;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1000DD630((uint64_t *)&self->state_, a5);
      sub_1000DD630((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000DE018;
      v10[3] = &unk_100244BC8;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DE024;
    v8[3] = &unk_100244BF0;
    v8[4] = self;
    v9 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v8);
  }
}

- (void)writeInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  _QWORD v8[5];
  int v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000DE194;
      v11[3] = &unk_100244C18;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1000DD630((uint64_t *)&self->state_, a5);
      sub_1000DD630((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000DE1CC;
      v10[3] = &unk_100244C40;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DE1D8;
    v8[3] = &unk_100244C68;
    v8[4] = self;
    v9 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v8);
  }
}

- (void)writeInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  _QWORD v8[5];
  int v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000DE348;
      v11[3] = &unk_100244C90;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1000DD630((uint64_t *)&self->state_, a5);
      sub_1000DD630((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000DE3E4;
      v10[3] = &unk_100244CB8;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DE3F0;
    v8[3] = &unk_100244CE0;
    v8[4] = self;
    v9 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v8);
  }
}

- (void)writeUInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  _QWORD v8[5];
  int v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000DE560;
      v11[3] = &unk_100244D08;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1000DD630((uint64_t *)&self->state_, a5);
      sub_1000DD630((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000DE5E4;
      v10[3] = &unk_100244D30;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DE5F0;
    v8[3] = &unk_100244D58;
    v8[4] = self;
    v9 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v8);
  }
}

- (void)writeFixed64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  _QWORD v8[5];
  int v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000DE760;
      v11[3] = &unk_100244BA0;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1000DD630((uint64_t *)&self->state_, a5);
      sub_1000DD630((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000DE778;
      v10[3] = &unk_100244BC8;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DE784;
    v8[3] = &unk_100244BF0;
    v8[4] = self;
    v9 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v8);
  }
}

- (void)writeFixed32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  _QWORD v8[5];
  int v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000DE8F4;
      v11[3] = &unk_100244D08;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1000DD630((uint64_t *)&self->state_, a5);
      sub_1000DD630((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000DE90C;
      v10[3] = &unk_100244D30;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DE918;
    v8[3] = &unk_100244D58;
    v8[4] = self;
    v9 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v8);
  }
}

- (void)writeSInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  _QWORD v8[5];
  int v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000DEA88;
      v11[3] = &unk_100244C90;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1000DD630((uint64_t *)&self->state_, a5);
      sub_1000DD630((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000DEB1C;
      v10[3] = &unk_100244CB8;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DEB28;
    v8[3] = &unk_100244CE0;
    v8[4] = self;
    v9 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v8);
  }
}

- (void)writeSInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  _QWORD v8[5];
  int v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000DEC98;
      v11[3] = &unk_100244C18;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1000DD630((uint64_t *)&self->state_, a5);
      sub_1000DD630((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000DECE0;
      v10[3] = &unk_100244C40;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DECEC;
    v8[3] = &unk_100244C68;
    v8[4] = self;
    v9 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v8);
  }
}

- (void)writeSFixed64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  _QWORD v8[5];
  int v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000DEE5C;
      v11[3] = &unk_100244C18;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1000DD630((uint64_t *)&self->state_, a5);
      sub_1000DD630((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000DEE74;
      v10[3] = &unk_100244C40;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DEE80;
    v8[3] = &unk_100244C68;
    v8[4] = self;
    v9 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v8);
  }
}

- (void)writeSFixed32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  _QWORD v8[5];
  int v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000DEFF0;
      v11[3] = &unk_100244C90;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1000DD630((uint64_t *)&self->state_, a5);
      sub_1000DD630((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000DF008;
      v10[3] = &unk_100244CB8;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DF014;
    v8[3] = &unk_100244CE0;
    v8[4] = self;
    v9 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v8);
  }
}

- (void)writeBoolArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  _QWORD v8[5];
  int v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000DF184;
      v11[3] = &unk_100244D80;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1000DD630((uint64_t *)&self->state_, a5);
      sub_1000DD630((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000DF19C;
      v10[3] = &unk_100244DA8;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DF1A8;
    v8[3] = &unk_100244DD0;
    v8[4] = self;
    v9 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v8);
  }
}

- (void)writeEnumArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  _QWORD v8[5];
  int v9;
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000DF318;
      v11[3] = &unk_100244C90;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateRawValuesWithBlock:", v11);
      sub_1000DD630((uint64_t *)&self->state_, a5);
      sub_1000DD630((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000DF370;
      v10[3] = &unk_100244CB8;
      v10[4] = self;
      objc_msgSend(a4, "enumerateRawValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000DF37C;
    v8[3] = &unk_100244CE0;
    v8[4] = self;
    v9 = a3;
    objc_msgSend(a4, "enumerateRawValuesWithBlock:", v8);
  }
}

- (void)writeStringArray:(int)a3 values:(id)a4
{
  uint64_t v5;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v5 = *(_QWORD *)&a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(a4);
        -[TransparencyGPBCodedOutputStream writeString:value:](self, "writeString:value:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (void)writeMessageArray:(int)a3 values:(id)a4
{
  uint64_t v5;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v5 = *(_QWORD *)&a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(a4);
        -[TransparencyGPBCodedOutputStream writeMessage:value:](self, "writeMessage:value:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (void)writeBytesArray:(int)a3 values:(id)a4
{
  uint64_t v5;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v5 = *(_QWORD *)&a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(a4);
        -[TransparencyGPBCodedOutputStream writeBytes:value:](self, "writeBytes:value:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (void)writeGroupArray:(int)a3 values:(id)a4
{
  uint64_t v5;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v5 = *(_QWORD *)&a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(a4);
        -[TransparencyGPBCodedOutputStream writeGroup:value:](self, "writeGroup:value:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (void)writeUnknownGroupArray:(int)a3 values:(id)a4
{
  uint64_t v5;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v5 = *(_QWORD *)&a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(a4);
        -[TransparencyGPBCodedOutputStream writeUnknownGroup:value:](self, "writeUnknownGroup:value:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (void)writeMessageSetExtension:(int)a3 value:(id)a4
{
  uint64_t *p_state;
  unsigned int v8;
  unsigned int v9;

  p_state = (uint64_t *)&self->state_;
  v8 = sub_10010B59C(1, 3);
  sub_1000DD630(p_state, v8);
  sub_1000DD98C(p_state, 2, a3);
  -[TransparencyGPBCodedOutputStream writeMessage:value:](self, "writeMessage:value:", 3, a4);
  v9 = sub_10010B59C(1, 4);
  sub_1000DD630(p_state, v9);
}

- (void)writeRawMessageSetExtension:(int)a3 value:(id)a4
{
  uint64_t *p_state;
  unsigned int v8;
  unsigned int v9;

  p_state = (uint64_t *)&self->state_;
  v8 = sub_10010B59C(1, 3);
  sub_1000DD630(p_state, v8);
  sub_1000DD98C(p_state, 2, a3);
  -[TransparencyGPBCodedOutputStream writeBytes:value:](self, "writeBytes:value:", 3, a4);
  v9 = sub_10010B59C(1, 4);
  sub_1000DD630(p_state, v9);
}

- (void)flush
{
  if (self->state_.output)
    sub_1000DF974(&self->state_.bytes);
}

- (void)writeRawByte:(unsigned __int8)a3
{
  unint64_t position;
  char *bytes;

  position = self->state_.position;
  if (position == self->state_.size)
  {
    sub_1000DF974(&self->state_.bytes);
    position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.position = position + 1;
  bytes[position] = a3;
}

- (void)writeRawData:(id)a3
{
  -[TransparencyGPBCodedOutputStream writeRawPtr:offset:length:](self, "writeRawPtr:offset:length:", objc_msgSend(a3, "bytes"), 0, objc_msgSend(a3, "length"));
}

- (void)writeRawPtr:(const void *)a3 offset:(unint64_t)a4 length:(unint64_t)a5
{
  TransparencyGPBOutputBufferState *p_state;
  unint64_t size;
  unint64_t position;
  unint64_t v12;
  char *v13;
  char *v14;
  void *v15;
  unint64_t v16;

  if (a3 && a5)
  {
    size = self->state_.size;
    p_state = &self->state_;
    position = self->state_.position;
    v12 = size - position;
    v13 = &self->state_.bytes[position];
    v14 = (char *)a3 + a4;
    v15 = (void *)(a5 - (size - position));
    if (a5 <= size - position)
    {
      memcpy(v13, v14, a5);
      self->state_.position += a5;
    }
    else
    {
      memcpy(v13, v14, size - position);
      v16 = v12 + a4;
      self->state_.position = size;
      sub_1000DF974(p_state);
      if ((unint64_t)v15 <= self->state_.size)
      {
        memcpy(self->state_.bytes, (char *)a3 + v16, (size_t)v15);
        self->state_.position = (unint64_t)v15;
      }
      else if ((void *)-[NSOutputStream write:maxLength:](self->state_.output, "write:maxLength:", (char *)a3 + v16, v15) != v15)
      {
        +[NSException raise:format:](NSException, "raise:format:", CFSTR("WriteFailed"), &stru_1002508B8);
      }
    }
  }
}

- (void)writeTag:(unsigned int)a3 format:(int)a4
{
  uint64_t *p_state;
  unsigned int v5;

  p_state = (uint64_t *)&self->state_;
  v5 = sub_10010B59C(a3, a4);
  sub_1000DD630(p_state, v5);
}

- (void)writeRawVarint32:(int)a3
{
  sub_1000DD630((uint64_t *)&self->state_, a3);
}

- (void)writeRawVarintSizeTAs32:(unint64_t)a3
{
  sub_1000DD630((uint64_t *)&self->state_, a3);
}

- (void)writeRawVarint64:(int64_t)a3
{
  sub_1000DD228((uint64_t *)&self->state_, a3);
}

- (void)writeRawLittleEndian32:(int)a3
{
  sub_1000DD108((uint64_t *)&self->state_, a3);
}

- (void)writeRawLittleEndian64:(int64_t)a3
{
  sub_1000DCF38((uint64_t *)&self->state_, a3);
}

@end
