@implementation GPBCodedOutputStream

- (void)dealloc
{
  objc_super v3;

  -[GPBCodedOutputStream flush](self, "flush");
  -[NSOutputStream close](self->state_.output, "close");

  v3.receiver = self;
  v3.super_class = (Class)GPBCodedOutputStream;
  -[GPBCodedOutputStream dealloc](&v3, "dealloc");
}

- (GPBCodedOutputStream)initWithOutputStream:(id)a3
{
  return -[GPBCodedOutputStream initWithOutputStream:data:](self, "initWithOutputStream:data:", a3, +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", vm_page_size));
}

- (GPBCodedOutputStream)initWithData:(id)a3
{
  return -[GPBCodedOutputStream initWithOutputStream:data:](self, "initWithOutputStream:data:", 0, a3);
}

- (GPBCodedOutputStream)initWithOutputStream:(id)a3 data:(id)a4
{
  GPBCodedOutputStream *v6;
  NSOutputStream *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GPBCodedOutputStream;
  v6 = -[GPBCodedOutputStream init](&v9, "init");
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
  sub_1002BA2A0((uint64_t *)&self->state_, *(uint64_t *)&a3);
}

- (void)writeDouble:(int)a3 value:(double)a4
{
  uint64_t *p_state;
  unsigned int Tag;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 1);
  sub_1002BAA34(p_state, Tag);
  sub_1002BA2A0(p_state, *(uint64_t *)&a4);
}

- (void)writeFloatNoTag:(float)a3
{
  sub_1002BA470((uint64_t *)&self->state_, SLODWORD(a3));
}

- (void)writeFloat:(int)a3 value:(float)a4
{
  uint64_t *p_state;
  unsigned int Tag;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 5);
  sub_1002BAA34(p_state, Tag);
  sub_1002BA470(p_state, SLODWORD(a4));
}

- (void)writeUInt64NoTag:(unint64_t)a3
{
  sub_1002BA590((uint64_t *)&self->state_, a3);
}

- (void)writeUInt64:(int)a3 value:(unint64_t)a4
{
  uint64_t *p_state;
  unsigned int Tag;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 0);
  sub_1002BAA34(p_state, Tag);
  sub_1002BA590(p_state, a4);
}

- (void)writeInt64NoTag:(int64_t)a3
{
  sub_1002BA590((uint64_t *)&self->state_, a3);
}

- (void)writeInt64:(int)a3 value:(int64_t)a4
{
  uint64_t *p_state;
  unsigned int Tag;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 0);
  sub_1002BAA34(p_state, Tag);
  sub_1002BA590(p_state, a4);
}

- (void)writeInt32NoTag:(int)a3
{
  sub_1002BA6C4((uint64_t *)&self->state_, a3);
}

- (void)writeInt32:(int)a3 value:(int)a4
{
  uint64_t *p_state;
  unsigned int Tag;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 0);
  sub_1002BAA34(p_state, Tag);
  sub_1002BA6C4(p_state, a4);
}

- (void)writeFixed64NoTag:(unint64_t)a3
{
  sub_1002BA2A0((uint64_t *)&self->state_, a3);
}

- (void)writeFixed64:(int)a3 value:(unint64_t)a4
{
  uint64_t *p_state;
  unsigned int Tag;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 1);
  sub_1002BAA34(p_state, Tag);
  sub_1002BA2A0(p_state, a4);
}

- (void)writeFixed32NoTag:(unsigned int)a3
{
  sub_1002BA470((uint64_t *)&self->state_, a3);
}

- (void)writeFixed32:(int)a3 value:(unsigned int)a4
{
  uint64_t *p_state;
  unsigned int Tag;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 5);
  sub_1002BAA34(p_state, Tag);
  sub_1002BA470(p_state, a4);
}

- (void)writeBoolNoTag:(BOOL)a3
{
  unint64_t position;
  char *bytes;

  position = self->state_.position;
  if (position == self->state_.size)
  {
    sub_1002BCDE8(&self->state_.bytes);
    position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.position = position + 1;
  bytes[position] = a3;
}

- (void)writeBool:(int)a3 value:(BOOL)a4
{
  uint64_t *p_state;
  unsigned int Tag;
  unint64_t position;
  char *bytes;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 0);
  sub_1002BAA34(p_state, Tag);
  position = self->state_.position;
  if (position == self->state_.size)
  {
    sub_1002BCDE8(p_state);
    position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.position = position + 1;
  bytes[position] = a4;
}

- (void)writeStringNoTag:(id)a3
{
  size_t v6;
  const char *CStringPtr;
  unint64_t position;
  size_t v9;
  char *v10;
  id v11;
  NSAssertionHandler *v12;
  size_t v13;

  v6 = (size_t)objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 4);
  sub_1002BAA34((uint64_t *)&self->state_, v6);
  if (v6)
  {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a3, 0x8000100u);
    position = self->state_.position;
    v9 = self->state_.size - position;
    if (v9 >= v6)
    {
      v13 = 0;
      v10 = &self->state_.bytes[position];
      if (CStringPtr)
      {
        memcpy(v10, CStringPtr, v6);
      }
      else
      {
        if (!objc_msgSend(a3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v10, v9, &v13, 4, 0, 0, objc_msgSend(a3, "length"), 0))return;
        if (v13 != v6)
        {
          v12 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
          -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBCodedOutputStream.m"), 305, CFSTR("Our UTF8 calc was wrong? %tu vs %zd"), v13, v6);
          v6 = v13;
        }
      }
      self->state_.position += v6;
    }
    else if (CStringPtr)
    {
      -[GPBCodedOutputStream writeRawPtr:offset:length:](self, "writeRawPtr:offset:length:", CStringPtr);
    }
    else
    {
      v11 = objc_msgSend(a3, "dataUsingEncoding:", 4);
      if (objc_msgSend(v11, "length") != (id)v6)
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBCodedOutputStream.m"), 316, CFSTR("Strings UTF8 length was wrong? %tu vs %zd"), objc_msgSend(v11, "length"), v6);
      -[GPBCodedOutputStream writeRawData:](self, "writeRawData:", v11);
    }
  }
}

- (void)writeString:(int)a3 value:(id)a4
{
  uint64_t *p_state;
  unsigned int Tag;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 2);
  sub_1002BAA34(p_state, Tag);
  -[GPBCodedOutputStream writeStringNoTag:](self, "writeStringNoTag:", a4);
}

- (void)writeGroupNoTag:(int)a3 value:(id)a4
{
  unsigned int Tag;

  objc_msgSend(a4, "writeToCodedOutputStream:", self);
  Tag = GPBWireFormatMakeTag(a3, 4);
  sub_1002BAA34((uint64_t *)&self->state_, Tag);
}

- (void)writeGroup:(int)a3 value:(id)a4
{
  uint64_t v5;
  uint64_t *p_state;
  unsigned int Tag;

  v5 = *(_QWORD *)&a3;
  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 3);
  sub_1002BAA34(p_state, Tag);
  -[GPBCodedOutputStream writeGroupNoTag:value:](self, "writeGroupNoTag:value:", v5, a4);
}

- (void)writeUnknownGroupNoTag:(int)a3 value:(id)a4
{
  unsigned int Tag;

  objc_msgSend(a4, "writeToCodedOutputStream:", self);
  Tag = GPBWireFormatMakeTag(a3, 4);
  sub_1002BAA34((uint64_t *)&self->state_, Tag);
}

- (void)writeUnknownGroup:(int)a3 value:(id)a4
{
  uint64_t v5;
  uint64_t *p_state;
  unsigned int Tag;

  v5 = *(_QWORD *)&a3;
  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 3);
  sub_1002BAA34(p_state, Tag);
  -[GPBCodedOutputStream writeUnknownGroupNoTag:value:](self, "writeUnknownGroupNoTag:value:", v5, a4);
}

- (void)writeMessageNoTag:(id)a3
{
  sub_1002BAA34((uint64_t *)&self->state_, objc_msgSend(a3, "serializedSize"));
  objc_msgSend(a3, "writeToCodedOutputStream:", self);
}

- (void)writeMessage:(int)a3 value:(id)a4
{
  uint64_t *p_state;
  unsigned int Tag;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 2);
  sub_1002BAA34(p_state, Tag);
  -[GPBCodedOutputStream writeMessageNoTag:](self, "writeMessageNoTag:", a4);
}

- (void)writeBytesNoTag:(id)a3
{
  sub_1002BAA34((uint64_t *)&self->state_, objc_msgSend(a3, "length"));
  -[GPBCodedOutputStream writeRawData:](self, "writeRawData:", a3);
}

- (void)writeBytes:(int)a3 value:(id)a4
{
  uint64_t *p_state;
  unsigned int Tag;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 2);
  sub_1002BAA34(p_state, Tag);
  -[GPBCodedOutputStream writeBytesNoTag:](self, "writeBytesNoTag:", a4);
}

- (void)writeUInt32NoTag:(unsigned int)a3
{
  sub_1002BAA34((uint64_t *)&self->state_, a3);
}

- (void)writeUInt32:(int)a3 value:(unsigned int)a4
{
  sub_1002BAD90((uint64_t *)&self->state_, a3, a4);
}

- (void)writeEnumNoTag:(int)a3
{
  sub_1002BA6C4((uint64_t *)&self->state_, a3);
}

- (void)writeEnum:(int)a3 value:(int)a4
{
  uint64_t *p_state;
  unsigned int Tag;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 0);
  sub_1002BAA34(p_state, Tag);
  sub_1002BA6C4(p_state, a4);
}

- (void)writeSFixed32NoTag:(int)a3
{
  sub_1002BA470((uint64_t *)&self->state_, a3);
}

- (void)writeSFixed32:(int)a3 value:(int)a4
{
  uint64_t *p_state;
  unsigned int Tag;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 5);
  sub_1002BAA34(p_state, Tag);
  sub_1002BA470(p_state, a4);
}

- (void)writeSFixed64NoTag:(int64_t)a3
{
  sub_1002BA2A0((uint64_t *)&self->state_, a3);
}

- (void)writeSFixed64:(int)a3 value:(int64_t)a4
{
  uint64_t *p_state;
  unsigned int Tag;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 1);
  sub_1002BAA34(p_state, Tag);
  sub_1002BA2A0(p_state, a4);
}

- (void)writeSInt32NoTag:(int)a3
{
  sub_1002BAA34((uint64_t *)&self->state_, (2 * a3) ^ (a3 >> 31));
}

- (void)writeSInt32:(int)a3 value:(int)a4
{
  uint64_t *p_state;
  unsigned int Tag;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 0);
  sub_1002BAA34(p_state, Tag);
  sub_1002BAA34(p_state, (2 * a4) ^ (a4 >> 31));
}

- (void)writeSInt64NoTag:(int64_t)a3
{
  sub_1002BA590((uint64_t *)&self->state_, (2 * a3) ^ (a3 >> 63));
}

- (void)writeSInt64:(int)a3 value:(int64_t)a4
{
  uint64_t *p_state;
  unsigned int Tag;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, 0);
  sub_1002BAA34(p_state, Tag);
  sub_1002BA590(p_state, (2 * a4) ^ (a4 >> 63));
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
      v11[2] = sub_1002BB0B8;
      v11[3] = &unk_1003648B8;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1002BAA34((uint64_t *)&self->state_, a5);
      sub_1002BAA34((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1002BB0D8;
      v10[3] = &unk_100365450;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002BB0E0;
    v8[3] = &unk_100365478;
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
      v11[2] = sub_1002BB24C;
      v11[3] = &unk_100364840;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1002BAA34((uint64_t *)&self->state_, a5);
      sub_1002BAA34((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1002BB26C;
      v10[3] = &unk_1003654A0;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002BB274;
    v8[3] = &unk_1003654C8;
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
      v11[2] = sub_1002BB3E0;
      v11[3] = &unk_100364868;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1002BAA34((uint64_t *)&self->state_, a5);
      sub_1002BAA34((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1002BB41C;
      v10[3] = &unk_100364B70;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002BB428;
    v8[3] = &unk_1003654F0;
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
      v11[2] = sub_1002BB598;
      v11[3] = &unk_100364890;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1002BAA34((uint64_t *)&self->state_, a5);
      sub_1002BAA34((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1002BB5D4;
      v10[3] = &unk_100365518;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002BB5E0;
    v8[3] = &unk_100365540;
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
      v11[2] = sub_1002BB750;
      v11[3] = &unk_100364818;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1002BAA34((uint64_t *)&self->state_, a5);
      sub_1002BAA34((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1002BB7EC;
      v10[3] = &unk_100365568;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002BB7F8;
    v8[3] = &unk_100365590;
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
      v11[2] = sub_1002BB968;
      v11[3] = &unk_1003647F0;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1002BAA34((uint64_t *)&self->state_, a5);
      sub_1002BAA34((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1002BB9EC;
      v10[3] = &unk_100364B98;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002BB9F8;
    v8[3] = &unk_1003655B8;
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
      v11[2] = sub_1002BBB68;
      v11[3] = &unk_100364868;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1002BAA34((uint64_t *)&self->state_, a5);
      sub_1002BAA34((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1002BBB88;
      v10[3] = &unk_100364B70;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002BBB94;
    v8[3] = &unk_1003654F0;
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
      v11[2] = sub_1002BBD04;
      v11[3] = &unk_1003647F0;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1002BAA34((uint64_t *)&self->state_, a5);
      sub_1002BAA34((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1002BBD24;
      v10[3] = &unk_100364B98;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002BBD30;
    v8[3] = &unk_1003655B8;
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
      v11[2] = sub_1002BBEA0;
      v11[3] = &unk_100364818;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1002BAA34((uint64_t *)&self->state_, a5);
      sub_1002BAA34((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1002BBF34;
      v10[3] = &unk_100365568;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002BBF40;
    v8[3] = &unk_100365590;
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
      v11[2] = sub_1002BC0B0;
      v11[3] = &unk_100364890;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1002BAA34((uint64_t *)&self->state_, a5);
      sub_1002BAA34((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1002BC0F8;
      v10[3] = &unk_100365518;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002BC104;
    v8[3] = &unk_100365540;
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
      v11[2] = sub_1002BC274;
      v11[3] = &unk_100364890;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1002BAA34((uint64_t *)&self->state_, a5);
      sub_1002BAA34((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1002BC294;
      v10[3] = &unk_100365518;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002BC2A0;
    v8[3] = &unk_100365540;
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
      v11[2] = sub_1002BC410;
      v11[3] = &unk_100364818;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1002BAA34((uint64_t *)&self->state_, a5);
      sub_1002BAA34((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1002BC430;
      v10[3] = &unk_100365568;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002BC43C;
    v8[3] = &unk_100365590;
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
      v11[2] = sub_1002BC5AC;
      v11[3] = &unk_1003647C8;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      sub_1002BAA34((uint64_t *)&self->state_, a5);
      sub_1002BAA34((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1002BC5CC;
      v10[3] = &unk_1003655E0;
      v10[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002BC5D8;
    v8[3] = &unk_100365608;
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
      v11[2] = sub_1002BC748;
      v11[3] = &unk_100364818;
      v11[4] = &v12;
      objc_msgSend(a4, "enumerateRawValuesWithBlock:", v11);
      sub_1002BAA34((uint64_t *)&self->state_, a5);
      sub_1002BAA34((uint64_t *)&self->state_, *((_DWORD *)v13 + 6));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1002BC7E4;
      v10[3] = &unk_100365568;
      v10[4] = self;
      objc_msgSend(a4, "enumerateRawValuesWithBlock:", v10);
      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002BC7F0;
    v8[3] = &unk_100365590;
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
        -[GPBCodedOutputStream writeString:value:](self, "writeString:value:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
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
        -[GPBCodedOutputStream writeMessage:value:](self, "writeMessage:value:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
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
        -[GPBCodedOutputStream writeBytes:value:](self, "writeBytes:value:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
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
        -[GPBCodedOutputStream writeGroup:value:](self, "writeGroup:value:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
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
        -[GPBCodedOutputStream writeUnknownGroup:value:](self, "writeUnknownGroup:value:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
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
  unsigned int Tag;
  unsigned int v9;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(1, 3);
  sub_1002BAA34(p_state, Tag);
  sub_1002BAD90(p_state, 2, a3);
  -[GPBCodedOutputStream writeMessage:value:](self, "writeMessage:value:", 3, a4);
  v9 = GPBWireFormatMakeTag(1, 4);
  sub_1002BAA34(p_state, v9);
}

- (void)writeRawMessageSetExtension:(int)a3 value:(id)a4
{
  uint64_t *p_state;
  unsigned int Tag;
  unsigned int v9;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(1, 3);
  sub_1002BAA34(p_state, Tag);
  sub_1002BAD90(p_state, 2, a3);
  -[GPBCodedOutputStream writeBytes:value:](self, "writeBytes:value:", 3, a4);
  v9 = GPBWireFormatMakeTag(1, 4);
  sub_1002BAA34(p_state, v9);
}

- (void)flush
{
  if (self->state_.output)
    sub_1002BCDE8(&self->state_.bytes);
}

- (void)writeRawByte:(unsigned __int8)a3
{
  unint64_t position;
  char *bytes;

  position = self->state_.position;
  if (position == self->state_.size)
  {
    sub_1002BCDE8(&self->state_.bytes);
    position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.position = position + 1;
  bytes[position] = a3;
}

- (void)writeRawData:(id)a3
{
  -[GPBCodedOutputStream writeRawPtr:offset:length:](self, "writeRawPtr:offset:length:", objc_msgSend(a3, "bytes"), 0, objc_msgSend(a3, "length"));
}

- (void)writeRawPtr:(const void *)a3 offset:(unint64_t)a4 length:(unint64_t)a5
{
  GPBOutputBufferState *p_state;
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
      sub_1002BCDE8(p_state);
      if ((unint64_t)v15 <= self->state_.size)
      {
        memcpy(self->state_.bytes, (char *)a3 + v16, (size_t)v15);
        self->state_.position = (unint64_t)v15;
      }
      else if ((void *)-[NSOutputStream write:maxLength:](self->state_.output, "write:maxLength:", (char *)a3 + v16, v15) != v15)
      {
        +[NSException raise:format:](NSException, "raise:format:", CFSTR("WriteFailed"), &stru_100366D80);
      }
    }
  }
}

- (void)writeTag:(unsigned int)a3 format:(int)a4
{
  uint64_t *p_state;
  unsigned int Tag;

  p_state = (uint64_t *)&self->state_;
  Tag = GPBWireFormatMakeTag(a3, a4);
  sub_1002BAA34(p_state, Tag);
}

- (void)writeRawVarint32:(int)a3
{
  sub_1002BAA34((uint64_t *)&self->state_, a3);
}

- (void)writeRawVarintSizeTAs32:(unint64_t)a3
{
  sub_1002BAA34((uint64_t *)&self->state_, a3);
}

- (void)writeRawVarint64:(int64_t)a3
{
  sub_1002BA590((uint64_t *)&self->state_, a3);
}

- (void)writeRawLittleEndian32:(int)a3
{
  sub_1002BA470((uint64_t *)&self->state_, a3);
}

- (void)writeRawLittleEndian64:(int64_t)a3
{
  sub_1002BA2A0((uint64_t *)&self->state_, a3);
}

@end
