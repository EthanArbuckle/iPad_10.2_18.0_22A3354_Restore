@implementation TRIPBCodedOutputStream

- (void)dealloc
{
  objc_super v3;

  -[NSOutputStream close](self->state_.output, "close");

  v3.receiver = self;
  v3.super_class = (Class)TRIPBCodedOutputStream;
  -[TRIPBCodedOutputStream dealloc](&v3, sel_dealloc);
}

- (TRIPBCodedOutputStream)initWithOutputStream:(id)a3
{
  return -[TRIPBCodedOutputStream initWithOutputStream:data:](self, "initWithOutputStream:data:", a3, objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", *MEMORY[0x1E0C85AD8]));
}

- (TRIPBCodedOutputStream)initWithData:(id)a3
{
  return -[TRIPBCodedOutputStream initWithOutputStream:data:](self, "initWithOutputStream:data:", 0, a3);
}

- (TRIPBCodedOutputStream)initWithOutputStream:(id)a3 data:(id)a4
{
  TRIPBCodedOutputStream *v6;
  NSOutputStream *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TRIPBCodedOutputStream;
  v6 = -[TRIPBCodedOutputStream init](&v9, sel_init);
  if (v6)
  {
    v6->buffer_ = (NSMutableData *)a4;
    v6->state_.bytes = (char *)objc_msgSend(a4, "mutableBytes");
    v6->state_.size = objc_msgSend(a4, "length");
    v7 = (NSOutputStream *)a3;
    v6->state_.output = v7;
    -[NSOutputStream open](v7, "open");
  }
  return v6;
}

+ (id)streamWithOutputStream:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithOutputStream:data:", a3, objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", *MEMORY[0x1E0C85AD8]));
}

+ (id)streamWithData:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithData:", a3);
}

- (void)writeDoubleNoTag:(double)a3
{
  TRIPBWriteRawLittleEndian64((uint64_t)&self->state_, *(uint64_t *)&a3);
}

- (void)writeDouble:(int)a3 value:(double)a4
{
  TRIPBOutputBufferState *p_state;

  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 1);
  TRIPBWriteRawLittleEndian64((uint64_t)p_state, *(uint64_t *)&a4);
}

- (void)writeFloatNoTag:(float)a3
{
  TRIPBWriteRawLittleEndian32((uint64_t)&self->state_, SLODWORD(a3));
}

- (void)writeFloat:(int)a3 value:(float)a4
{
  TRIPBOutputBufferState *p_state;

  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 5);
  TRIPBWriteRawLittleEndian32((uint64_t)p_state, SLODWORD(a4));
}

- (void)writeUInt64NoTag:(unint64_t)a3
{
  TRIPBWriteRawVarint64((uint64_t)&self->state_, a3);
}

- (void)writeUInt64:(int)a3 value:(unint64_t)a4
{
  TRIPBOutputBufferState *p_state;

  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, 8 * a3);
  TRIPBWriteRawVarint64((uint64_t)p_state, a4);
}

- (void)writeInt64NoTag:(int64_t)a3
{
  TRIPBWriteRawVarint64((uint64_t)&self->state_, a3);
}

- (void)writeInt64:(int)a3 value:(int64_t)a4
{
  TRIPBOutputBufferState *p_state;

  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, 8 * a3);
  TRIPBWriteRawVarint64((uint64_t)p_state, a4);
}

- (void)writeInt32NoTag:(int)a3
{
  TRIPBWriteInt32NoTag((uint64_t)&self->state_, a3);
}

- (void)writeInt32:(int)a3 value:(int)a4
{
  TRIPBOutputBufferState *p_state;

  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, 8 * a3);
  TRIPBWriteInt32NoTag((uint64_t)p_state, a4);
}

- (void)writeFixed64NoTag:(unint64_t)a3
{
  TRIPBWriteRawLittleEndian64((uint64_t)&self->state_, a3);
}

- (void)writeFixed64:(int)a3 value:(unint64_t)a4
{
  TRIPBOutputBufferState *p_state;

  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 1);
  TRIPBWriteRawLittleEndian64((uint64_t)p_state, a4);
}

- (void)writeFixed32NoTag:(unsigned int)a3
{
  TRIPBWriteRawLittleEndian32((uint64_t)&self->state_, a3);
}

- (void)writeFixed32:(int)a3 value:(unsigned int)a4
{
  TRIPBOutputBufferState *p_state;

  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 5);
  TRIPBWriteRawLittleEndian32((uint64_t)p_state, a4);
}

- (void)writeBoolNoTag:(BOOL)a3
{
  unint64_t position;
  char *bytes;

  position = self->state_.position;
  if (position == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)&self->state_);
    position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.position = position + 1;
  bytes[position] = a3;
}

- (void)writeBool:(int)a3 value:(BOOL)a4
{
  TRIPBOutputBufferState *p_state;
  unint64_t position;
  char *bytes;

  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, 8 * a3);
  position = self->state_.position;
  if (position == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)p_state);
    position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.position = position + 1;
  bytes[position] = a4;
}

- (void)writeStringNoTag:(id)a3
{
  unint64_t v6;
  const char *CStringPtr;
  unint64_t position;
  unint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  v6 = objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 4);
  TRIPBWriteRawVarint32((uint64_t)&self->state_, v6);
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
          v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBCodedOutputStream.m"), 311, CFSTR("Our UTF8 calc was wrong? %tu vs %zd"), v13, v6);
          v6 = v13;
        }
      }
      self->state_.position += v6;
    }
    else if (CStringPtr)
    {
      -[TRIPBCodedOutputStream writeRawPtr:offset:length:](self, "writeRawPtr:offset:length:", CStringPtr, 0, v6);
    }
    else
    {
      v11 = (void *)objc_msgSend(a3, "dataUsingEncoding:", 4);
      if (objc_msgSend(v11, "length") != v6)
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBCodedOutputStream.m"), 322, CFSTR("Strings UTF8 length was wrong? %tu vs %zd"), objc_msgSend(v11, "length"), v6);
      -[TRIPBCodedOutputStream writeRawData:](self, "writeRawData:", v11);
    }
  }
}

- (void)writeString:(int)a3 value:(id)a4
{
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 2);
  -[TRIPBCodedOutputStream writeStringNoTag:](self, "writeStringNoTag:", a4);
}

- (void)writeGroupNoTag:(int)a3 value:(id)a4
{
  objc_msgSend(a4, "writeToCodedOutputStream:", self);
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 4);
}

- (void)writeGroup:(int)a3 value:(id)a4
{
  uint64_t v5;

  v5 = *(_QWORD *)&a3;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 3);
  -[TRIPBCodedOutputStream writeGroupNoTag:value:](self, "writeGroupNoTag:value:", v5, a4);
}

- (void)writeUnknownGroupNoTag:(int)a3 value:(id)a4
{
  objc_msgSend(a4, "writeToCodedOutputStream:", self);
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 4);
}

- (void)writeUnknownGroup:(int)a3 value:(id)a4
{
  uint64_t v5;

  v5 = *(_QWORD *)&a3;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 3);
  -[TRIPBCodedOutputStream writeUnknownGroupNoTag:value:](self, "writeUnknownGroupNoTag:value:", v5, a4);
}

- (void)writeMessageNoTag:(id)a3
{
  TRIPBWriteRawVarint32((uint64_t)&self->state_, objc_msgSend(a3, "serializedSize"));
  objc_msgSend(a3, "writeToCodedOutputStream:", self);
}

- (void)writeMessage:(int)a3 value:(id)a4
{
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 2);
  -[TRIPBCodedOutputStream writeMessageNoTag:](self, "writeMessageNoTag:", a4);
}

- (void)writeBytesNoTag:(id)a3
{
  TRIPBWriteRawVarint32((uint64_t)&self->state_, objc_msgSend(a3, "length"));
  -[TRIPBCodedOutputStream writeRawData:](self, "writeRawData:", a3);
}

- (void)writeBytes:(int)a3 value:(id)a4
{
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 2);
  -[TRIPBCodedOutputStream writeBytesNoTag:](self, "writeBytesNoTag:", a4);
}

- (void)writeUInt32NoTag:(unsigned int)a3
{
  TRIPBWriteRawVarint32((uint64_t)&self->state_, a3);
}

- (void)writeUInt32:(int)a3 value:(unsigned int)a4
{
  TRIPBOutputBufferState *p_state;

  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, 8 * a3);
  TRIPBWriteRawVarint32((uint64_t)p_state, a4);
}

- (void)writeEnumNoTag:(int)a3
{
  TRIPBWriteRawVarint32((uint64_t)&self->state_, a3);
}

- (void)writeEnum:(int)a3 value:(int)a4
{
  TRIPBOutputBufferState *p_state;

  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, 8 * a3);
  TRIPBWriteRawVarint32((uint64_t)p_state, a4);
}

- (void)writeSFixed32NoTag:(int)a3
{
  TRIPBWriteRawLittleEndian32((uint64_t)&self->state_, a3);
}

- (void)writeSFixed32:(int)a3 value:(int)a4
{
  TRIPBOutputBufferState *p_state;

  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 5);
  TRIPBWriteRawLittleEndian32((uint64_t)p_state, a4);
}

- (void)writeSFixed64NoTag:(int64_t)a3
{
  TRIPBWriteRawLittleEndian64((uint64_t)&self->state_, a3);
}

- (void)writeSFixed64:(int)a3 value:(int64_t)a4
{
  TRIPBOutputBufferState *p_state;

  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (8 * a3) | 1);
  TRIPBWriteRawLittleEndian64((uint64_t)p_state, a4);
}

- (void)writeSInt32NoTag:(int)a3
{
  TRIPBWriteRawVarint32((uint64_t)&self->state_, (2 * a3) ^ (a3 >> 31));
}

- (void)writeSInt32:(int)a3 value:(int)a4
{
  TRIPBOutputBufferState *p_state;

  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, 8 * a3);
  TRIPBWriteRawVarint32((uint64_t)p_state, (2 * a4) ^ (a4 >> 31));
}

- (void)writeSInt64NoTag:(int64_t)a3
{
  TRIPBWriteRawVarint64((uint64_t)&self->state_, (2 * a3) ^ (a3 >> 63));
}

- (void)writeSInt64:(int)a3 value:(int64_t)a4
{
  TRIPBOutputBufferState *p_state;

  p_state = &self->state_;
  TRIPBWriteRawVarint32((uint64_t)&self->state_, 8 * a3);
  TRIPBWriteRawVarint64((uint64_t)p_state, (2 * a4) ^ (a4 >> 63));
}

- (void)writeDoubleArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  uint64_t v8;
  _QWORD v9[5];
  int v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v8 = MEMORY[0x1E0C809B0];
      v16 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __54__TRIPBCodedOutputStream_writeDoubleArray_values_tag___block_invoke;
      v12[3] = &unk_1E2E9B848;
      v12[4] = &v13;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v12);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v14 + 6));
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __54__TRIPBCodedOutputStream_writeDoubleArray_values_tag___block_invoke_2;
      v11[3] = &unk_1E2E9C1B8;
      v11[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__TRIPBCodedOutputStream_writeDoubleArray_values_tag___block_invoke_3;
    v9[3] = &unk_1E2E9C1E0;
    v9[4] = self;
    v10 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v9);
  }
}

uint64_t __54__TRIPBCodedOutputStream_writeDoubleArray_values_tag___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t __54__TRIPBCodedOutputStream_writeDoubleArray_values_tag___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeDoubleNoTag:");
}

uint64_t __54__TRIPBCodedOutputStream_writeDoubleArray_values_tag___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeDouble:value:", *(unsigned int *)(a1 + 40));
}

- (void)writeFloatArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  uint64_t v8;
  _QWORD v9[5];
  int v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v8 = MEMORY[0x1E0C809B0];
      v16 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __53__TRIPBCodedOutputStream_writeFloatArray_values_tag___block_invoke;
      v12[3] = &unk_1E2E9B870;
      v12[4] = &v13;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v12);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v14 + 6));
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __53__TRIPBCodedOutputStream_writeFloatArray_values_tag___block_invoke_2;
      v11[3] = &unk_1E2E9C208;
      v11[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__TRIPBCodedOutputStream_writeFloatArray_values_tag___block_invoke_3;
    v9[3] = &unk_1E2E9C230;
    v9[4] = self;
    v10 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v9);
  }
}

uint64_t __53__TRIPBCodedOutputStream_writeFloatArray_values_tag___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t __53__TRIPBCodedOutputStream_writeFloatArray_values_tag___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFloatNoTag:");
}

uint64_t __53__TRIPBCodedOutputStream_writeFloatArray_values_tag___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFloat:value:", *(unsigned int *)(a1 + 40));
}

- (void)writeUInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  uint64_t v8;
  _QWORD v9[5];
  int v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v8 = MEMORY[0x1E0C809B0];
      v16 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __54__TRIPBCodedOutputStream_writeUInt64Array_values_tag___block_invoke;
      v12[3] = &unk_1E2E9B898;
      v12[4] = &v13;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v12);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v14 + 6));
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __54__TRIPBCodedOutputStream_writeUInt64Array_values_tag___block_invoke_2;
      v11[3] = &unk_1E2E9BA50;
      v11[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__TRIPBCodedOutputStream_writeUInt64Array_values_tag___block_invoke_3;
    v9[3] = &unk_1E2E9C258;
    v9[4] = self;
    v10 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v9);
  }
}

uint64_t __54__TRIPBCodedOutputStream_writeUInt64Array_values_tag___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = TRIPBComputeRawVarint64Size(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __54__TRIPBCodedOutputStream_writeUInt64Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeUInt64NoTag:", a2);
}

uint64_t __54__TRIPBCodedOutputStream_writeUInt64Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeUInt64:value:", *(unsigned int *)(a1 + 40), a2);
}

- (void)writeInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  uint64_t v8;
  _QWORD v9[5];
  int v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v8 = MEMORY[0x1E0C809B0];
      v16 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __53__TRIPBCodedOutputStream_writeInt64Array_values_tag___block_invoke;
      v12[3] = &unk_1E2E9B8C0;
      v12[4] = &v13;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v12);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v14 + 6));
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __53__TRIPBCodedOutputStream_writeInt64Array_values_tag___block_invoke_2;
      v11[3] = &unk_1E2E9C280;
      v11[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__TRIPBCodedOutputStream_writeInt64Array_values_tag___block_invoke_3;
    v9[3] = &unk_1E2E9C2A8;
    v9[4] = self;
    v10 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v9);
  }
}

uint64_t __53__TRIPBCodedOutputStream_writeInt64Array_values_tag___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = TRIPBComputeRawVarint64Size(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __53__TRIPBCodedOutputStream_writeInt64Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeInt64NoTag:", a2);
}

uint64_t __53__TRIPBCodedOutputStream_writeInt64Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeInt64:value:", *(unsigned int *)(a1 + 40), a2);
}

- (void)writeInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  uint64_t v8;
  _QWORD v9[5];
  int v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v8 = MEMORY[0x1E0C809B0];
      v16 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __53__TRIPBCodedOutputStream_writeInt32Array_values_tag___block_invoke;
      v12[3] = &unk_1E2E9B8E8;
      v12[4] = &v13;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v12);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v14 + 6));
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __53__TRIPBCodedOutputStream_writeInt32Array_values_tag___block_invoke_2;
      v11[3] = &unk_1E2E9C2D0;
      v11[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__TRIPBCodedOutputStream_writeInt32Array_values_tag___block_invoke_3;
    v9[3] = &unk_1E2E9C2F8;
    v9[4] = self;
    v10 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v9);
  }
}

uint64_t __53__TRIPBCodedOutputStream_writeInt32Array_values_tag___block_invoke(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = 10;
  v3 = 1;
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (a2 >> 28)
    v6 = 5;
  if (a2 >= 0x200000)
    v5 = v6;
  if (a2 >= 0x4000)
    v4 = v5;
  if (a2 >= 0x80)
    v3 = v4;
  if ((a2 & 0x80000000) == 0)
    v2 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t __53__TRIPBCodedOutputStream_writeInt32Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeInt32NoTag:", a2);
}

uint64_t __53__TRIPBCodedOutputStream_writeInt32Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeInt32:value:", *(unsigned int *)(a1 + 40), a2);
}

- (void)writeUInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  uint64_t v8;
  _QWORD v9[5];
  int v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v8 = MEMORY[0x1E0C809B0];
      v16 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __54__TRIPBCodedOutputStream_writeUInt32Array_values_tag___block_invoke;
      v12[3] = &unk_1E2E9B910;
      v12[4] = &v13;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v12);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v14 + 6));
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __54__TRIPBCodedOutputStream_writeUInt32Array_values_tag___block_invoke_2;
      v11[3] = &unk_1E2E9BA78;
      v11[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__TRIPBCodedOutputStream_writeUInt32Array_values_tag___block_invoke_3;
    v9[3] = &unk_1E2E9C320;
    v9[4] = self;
    v10 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v9);
  }
}

uint64_t __54__TRIPBCodedOutputStream_writeUInt32Array_values_tag___block_invoke(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = 1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (a2 >> 28)
    v5 = 5;
  if (a2 >= 0x200000)
    v4 = v5;
  if (a2 >= 0x4000)
    v3 = v4;
  if (a2 >= 0x80)
    v2 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t __54__TRIPBCodedOutputStream_writeUInt32Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeUInt32NoTag:", a2);
}

uint64_t __54__TRIPBCodedOutputStream_writeUInt32Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeUInt32:value:", *(unsigned int *)(a1 + 40), a2);
}

- (void)writeFixed64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  uint64_t v8;
  _QWORD v9[5];
  int v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v8 = MEMORY[0x1E0C809B0];
      v16 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __55__TRIPBCodedOutputStream_writeFixed64Array_values_tag___block_invoke;
      v12[3] = &unk_1E2E9B898;
      v12[4] = &v13;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v12);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v14 + 6));
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __55__TRIPBCodedOutputStream_writeFixed64Array_values_tag___block_invoke_2;
      v11[3] = &unk_1E2E9BA50;
      v11[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__TRIPBCodedOutputStream_writeFixed64Array_values_tag___block_invoke_3;
    v9[3] = &unk_1E2E9C258;
    v9[4] = self;
    v10 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v9);
  }
}

uint64_t __55__TRIPBCodedOutputStream_writeFixed64Array_values_tag___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t __55__TRIPBCodedOutputStream_writeFixed64Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFixed64NoTag:", a2);
}

uint64_t __55__TRIPBCodedOutputStream_writeFixed64Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFixed64:value:", *(unsigned int *)(a1 + 40), a2);
}

- (void)writeFixed32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  uint64_t v8;
  _QWORD v9[5];
  int v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v8 = MEMORY[0x1E0C809B0];
      v16 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __55__TRIPBCodedOutputStream_writeFixed32Array_values_tag___block_invoke;
      v12[3] = &unk_1E2E9B910;
      v12[4] = &v13;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v12);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v14 + 6));
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __55__TRIPBCodedOutputStream_writeFixed32Array_values_tag___block_invoke_2;
      v11[3] = &unk_1E2E9BA78;
      v11[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__TRIPBCodedOutputStream_writeFixed32Array_values_tag___block_invoke_3;
    v9[3] = &unk_1E2E9C320;
    v9[4] = self;
    v10 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v9);
  }
}

uint64_t __55__TRIPBCodedOutputStream_writeFixed32Array_values_tag___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t __55__TRIPBCodedOutputStream_writeFixed32Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFixed32NoTag:", a2);
}

uint64_t __55__TRIPBCodedOutputStream_writeFixed32Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFixed32:value:", *(unsigned int *)(a1 + 40), a2);
}

- (void)writeSInt32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  uint64_t v8;
  _QWORD v9[5];
  int v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v8 = MEMORY[0x1E0C809B0];
      v16 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __54__TRIPBCodedOutputStream_writeSInt32Array_values_tag___block_invoke;
      v12[3] = &unk_1E2E9B8E8;
      v12[4] = &v13;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v12);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v14 + 6));
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __54__TRIPBCodedOutputStream_writeSInt32Array_values_tag___block_invoke_2;
      v11[3] = &unk_1E2E9C2D0;
      v11[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__TRIPBCodedOutputStream_writeSInt32Array_values_tag___block_invoke_3;
    v9[3] = &unk_1E2E9C2F8;
    v9[4] = self;
    v10 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v9);
  }
}

uint64_t __54__TRIPBCodedOutputStream_writeSInt32Array_values_tag___block_invoke(uint64_t result, int a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (2 * a2) ^ (a2 >> 31);
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (v2 >> 28)
    v5 = 5;
  if (v2 >= 0x200000)
    v4 = v5;
  if (v2 >= 0x4000)
    v3 = v4;
  if (v2 >= 0x80)
    v6 = v3;
  else
    v6 = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v6;
  return result;
}

uint64_t __54__TRIPBCodedOutputStream_writeSInt32Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSInt32NoTag:", a2);
}

uint64_t __54__TRIPBCodedOutputStream_writeSInt32Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSInt32:value:", *(unsigned int *)(a1 + 40), a2);
}

- (void)writeSInt64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  uint64_t v8;
  _QWORD v9[5];
  int v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v8 = MEMORY[0x1E0C809B0];
      v16 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __54__TRIPBCodedOutputStream_writeSInt64Array_values_tag___block_invoke;
      v12[3] = &unk_1E2E9B8C0;
      v12[4] = &v13;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v12);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v14 + 6));
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __54__TRIPBCodedOutputStream_writeSInt64Array_values_tag___block_invoke_2;
      v11[3] = &unk_1E2E9C280;
      v11[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__TRIPBCodedOutputStream_writeSInt64Array_values_tag___block_invoke_3;
    v9[3] = &unk_1E2E9C2A8;
    v9[4] = self;
    v10 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v9);
  }
}

uint64_t __54__TRIPBCodedOutputStream_writeSInt64Array_values_tag___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = TRIPBComputeRawVarint64Size((2 * a2) ^ (a2 >> 63));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __54__TRIPBCodedOutputStream_writeSInt64Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSInt64NoTag:", a2);
}

uint64_t __54__TRIPBCodedOutputStream_writeSInt64Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSInt64:value:", *(unsigned int *)(a1 + 40), a2);
}

- (void)writeSFixed64Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  uint64_t v8;
  _QWORD v9[5];
  int v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v8 = MEMORY[0x1E0C809B0];
      v16 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __56__TRIPBCodedOutputStream_writeSFixed64Array_values_tag___block_invoke;
      v12[3] = &unk_1E2E9B8C0;
      v12[4] = &v13;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v12);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v14 + 6));
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __56__TRIPBCodedOutputStream_writeSFixed64Array_values_tag___block_invoke_2;
      v11[3] = &unk_1E2E9C280;
      v11[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__TRIPBCodedOutputStream_writeSFixed64Array_values_tag___block_invoke_3;
    v9[3] = &unk_1E2E9C2A8;
    v9[4] = self;
    v10 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v9);
  }
}

uint64_t __56__TRIPBCodedOutputStream_writeSFixed64Array_values_tag___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t __56__TRIPBCodedOutputStream_writeSFixed64Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSFixed64NoTag:", a2);
}

uint64_t __56__TRIPBCodedOutputStream_writeSFixed64Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSFixed64:value:", *(unsigned int *)(a1 + 40), a2);
}

- (void)writeSFixed32Array:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  uint64_t v8;
  _QWORD v9[5];
  int v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v8 = MEMORY[0x1E0C809B0];
      v16 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __56__TRIPBCodedOutputStream_writeSFixed32Array_values_tag___block_invoke;
      v12[3] = &unk_1E2E9B8E8;
      v12[4] = &v13;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v12);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v14 + 6));
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __56__TRIPBCodedOutputStream_writeSFixed32Array_values_tag___block_invoke_2;
      v11[3] = &unk_1E2E9C2D0;
      v11[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__TRIPBCodedOutputStream_writeSFixed32Array_values_tag___block_invoke_3;
    v9[3] = &unk_1E2E9C2F8;
    v9[4] = self;
    v10 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v9);
  }
}

uint64_t __56__TRIPBCodedOutputStream_writeSFixed32Array_values_tag___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t __56__TRIPBCodedOutputStream_writeSFixed32Array_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSFixed32NoTag:", a2);
}

uint64_t __56__TRIPBCodedOutputStream_writeSFixed32Array_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSFixed32:value:", *(unsigned int *)(a1 + 40), a2);
}

- (void)writeBoolArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  uint64_t v8;
  _QWORD v9[5];
  int v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v8 = MEMORY[0x1E0C809B0];
      v16 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __52__TRIPBCodedOutputStream_writeBoolArray_values_tag___block_invoke;
      v12[3] = &unk_1E2E9B938;
      v12[4] = &v13;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v12);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v14 + 6));
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __52__TRIPBCodedOutputStream_writeBoolArray_values_tag___block_invoke_2;
      v11[3] = &unk_1E2E9C348;
      v11[4] = self;
      objc_msgSend(a4, "enumerateValuesWithBlock:", v11);
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__TRIPBCodedOutputStream_writeBoolArray_values_tag___block_invoke_3;
    v9[3] = &unk_1E2E9C370;
    v9[4] = self;
    v10 = a3;
    objc_msgSend(a4, "enumerateValuesWithBlock:", v9);
  }
}

uint64_t __52__TRIPBCodedOutputStream_writeBoolArray_values_tag___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t __52__TRIPBCodedOutputStream_writeBoolArray_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeBoolNoTag:", a2);
}

uint64_t __52__TRIPBCodedOutputStream_writeBoolArray_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeBool:value:", *(unsigned int *)(a1 + 40), a2);
}

- (void)writeEnumArray:(int)a3 values:(id)a4 tag:(unsigned int)a5
{
  uint64_t v8;
  _QWORD v9[5];
  int v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (a5)
  {
    if (objc_msgSend(a4, "count", *(_QWORD *)&a3))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v8 = MEMORY[0x1E0C809B0];
      v16 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __52__TRIPBCodedOutputStream_writeEnumArray_values_tag___block_invoke;
      v12[3] = &unk_1E2E9B8E8;
      v12[4] = &v13;
      objc_msgSend(a4, "enumerateRawValuesWithBlock:", v12);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, a5);
      TRIPBWriteRawVarint32((uint64_t)&self->state_, *((_DWORD *)v14 + 6));
      v11[0] = v8;
      v11[1] = 3221225472;
      v11[2] = __52__TRIPBCodedOutputStream_writeEnumArray_values_tag___block_invoke_2;
      v11[3] = &unk_1E2E9C2D0;
      v11[4] = self;
      objc_msgSend(a4, "enumerateRawValuesWithBlock:", v11);
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__TRIPBCodedOutputStream_writeEnumArray_values_tag___block_invoke_3;
    v9[3] = &unk_1E2E9C2F8;
    v9[4] = self;
    v10 = a3;
    objc_msgSend(a4, "enumerateRawValuesWithBlock:", v9);
  }
}

uint64_t __52__TRIPBCodedOutputStream_writeEnumArray_values_tag___block_invoke(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = 1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (a2 >> 28)
    v5 = 5;
  if (a2 >= 0x200000)
    v4 = v5;
  if (a2 >= 0x4000)
    v3 = v4;
  if (a2 >= 0x80)
    v2 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t __52__TRIPBCodedOutputStream_writeEnumArray_values_tag___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeEnumNoTag:", a2);
}

uint64_t __52__TRIPBCodedOutputStream_writeEnumArray_values_tag___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeEnum:value:", *(unsigned int *)(a1 + 40), a2);
}

- (void)writeStringArray:(int)a3 values:(id)a4
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v5 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
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
        -[TRIPBCodedOutputStream writeString:value:](self, "writeString:value:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
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
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v5 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
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
        -[TRIPBCodedOutputStream writeMessage:value:](self, "writeMessage:value:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
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
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v5 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
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
        -[TRIPBCodedOutputStream writeBytes:value:](self, "writeBytes:value:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
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
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v5 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
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
        -[TRIPBCodedOutputStream writeGroup:value:](self, "writeGroup:value:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
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
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v5 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x1E0C80C00];
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
        -[TRIPBCodedOutputStream writeUnknownGroup:value:](self, "writeUnknownGroup:value:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (void)writeMessageSetExtension:(int)a3 value:(id)a4
{
  TRIPBOutputBufferState *p_state;
  unint64_t position;
  char *bytes;
  unint64_t v10;
  char *v11;
  unint64_t v12;
  char *v13;

  p_state = &self->state_;
  position = self->state_.position;
  if (position == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)&self->state_);
    position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.position = position + 1;
  bytes[position] = 11;
  v10 = self->state_.position;
  if (v10 == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)p_state);
    v10 = self->state_.position;
  }
  v11 = self->state_.bytes;
  self->state_.position = v10 + 1;
  v11[v10] = 16;
  TRIPBWriteRawVarint32((uint64_t)p_state, a3);
  -[TRIPBCodedOutputStream writeMessage:value:](self, "writeMessage:value:", 3, a4);
  v12 = self->state_.position;
  if (v12 == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)p_state);
    v12 = self->state_.position;
  }
  v13 = self->state_.bytes;
  self->state_.position = v12 + 1;
  v13[v12] = 12;
}

- (void)writeRawMessageSetExtension:(int)a3 value:(id)a4
{
  TRIPBOutputBufferState *p_state;
  unint64_t position;
  char *bytes;
  unint64_t v10;
  char *v11;
  unint64_t v12;
  char *v13;

  p_state = &self->state_;
  position = self->state_.position;
  if (position == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)&self->state_);
    position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.position = position + 1;
  bytes[position] = 11;
  v10 = self->state_.position;
  if (v10 == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)p_state);
    v10 = self->state_.position;
  }
  v11 = self->state_.bytes;
  self->state_.position = v10 + 1;
  v11[v10] = 16;
  TRIPBWriteRawVarint32((uint64_t)p_state, a3);
  -[TRIPBCodedOutputStream writeBytes:value:](self, "writeBytes:value:", 3, a4);
  v12 = self->state_.position;
  if (v12 == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)p_state);
    v12 = self->state_.position;
  }
  v13 = self->state_.bytes;
  self->state_.position = v12 + 1;
  v13[v12] = 12;
}

- (void)flush
{
  if (self->state_.output)
    TRIPBRefreshBuffer((uint64_t)&self->state_);
}

- (void)writeRawByte:(unsigned __int8)a3
{
  unint64_t position;
  char *bytes;

  position = self->state_.position;
  if (position == self->state_.size)
  {
    TRIPBRefreshBuffer((uint64_t)&self->state_);
    position = self->state_.position;
  }
  bytes = self->state_.bytes;
  self->state_.position = position + 1;
  bytes[position] = a3;
}

- (void)writeRawData:(id)a3
{
  -[TRIPBCodedOutputStream writeRawPtr:offset:length:](self, "writeRawPtr:offset:length:", objc_msgSend(a3, "bytes"), 0, objc_msgSend(a3, "length"));
}

- (void)writeRawPtr:(const void *)a3 offset:(unint64_t)a4 length:(unint64_t)a5
{
  TRIPBOutputBufferState *p_state;
  unint64_t size;
  unint64_t position;
  unint64_t v12;
  char *v13;
  char *v14;
  size_t v15;
  unint64_t v16;

  if (a3 && a5)
  {
    size = self->state_.size;
    p_state = &self->state_;
    position = self->state_.position;
    v12 = size - position;
    v13 = &self->state_.bytes[position];
    v14 = (char *)a3 + a4;
    v15 = a5 - (size - position);
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
      TRIPBRefreshBuffer((uint64_t)p_state);
      if (v15 <= self->state_.size)
      {
        memcpy(self->state_.bytes, (char *)a3 + v16, v15);
        self->state_.position = v15;
      }
      else if (-[NSOutputStream write:maxLength:](self->state_.output, "write:maxLength:", (char *)a3 + v16, v15) != v15)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WriteFailed"), &stru_1E2E9CC90);
      }
    }
  }
}

- (void)writeTag:(unsigned int)a3 format:(int)a4
{
  TRIPBWriteRawVarint32((uint64_t)&self->state_, a4 | (8 * a3));
}

- (void)writeRawVarint32:(int)a3
{
  TRIPBWriteRawVarint32((uint64_t)&self->state_, a3);
}

- (void)writeRawVarintSizeTAs32:(unint64_t)a3
{
  TRIPBWriteRawVarint32((uint64_t)&self->state_, a3);
}

- (void)writeRawVarint64:(int64_t)a3
{
  TRIPBWriteRawVarint64((uint64_t)&self->state_, a3);
}

- (void)writeRawLittleEndian32:(int)a3
{
  TRIPBWriteRawLittleEndian32((uint64_t)&self->state_, a3);
}

- (void)writeRawLittleEndian64:(int64_t)a3
{
  TRIPBWriteRawLittleEndian64((uint64_t)&self->state_, a3);
}

@end
