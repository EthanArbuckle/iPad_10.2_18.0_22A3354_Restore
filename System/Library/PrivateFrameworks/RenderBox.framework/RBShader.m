@implementation RBShader

- (RBShader)initWithLibrary:(id)a3 function:(id)a4
{
  RBShader *v6;
  RBShader *v7;
  RBShaderLibrary *p;
  os_unfair_lock_s *v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int v13;
  Function *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RBShader;
  v6 = -[RBShader init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    p = v6->_library._p;
    if (p != a3)
    {

      v7->_library._p = (RBShaderLibrary *)a3;
    }
    if (a3)
      v9 = (os_unfair_lock_s *)*((_QWORD *)a3 + 1);
    else
      v9 = 0;
    RB::CustomShader::Library::intern_function(v9, (NSString *)a4, (uint64_t *)&v15);
    v10 = (uint64_t)v7->_fn_args.function._p;
    v7->_fn_args.function._p = v15;
    v15 = (Function *)v10;
    if (v10)
    {
      v11 = (unsigned int *)(v10 + 8);
      do
      {
        v12 = __ldxr(v11);
        v13 = v12 - 1;
      }
      while (__stlxr(v13, v11));
      if (!v13)
      {
        __dmb(9u);
        (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
      }
    }
    v7->_type = -1;
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  RBShaderLibrary *p;
  RBShaderLibrary *v6;
  unsigned int *v7;
  Function *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int *v12;
  unsigned int v13;
  const RB::CustomShader::Value *p_args;
  uint64_t v15;
  const void **v16;
  uint64_t v17;
  unint64_t size;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  RB::CustomShader::Value *v22;
  unint64_t v23;
  uint64_t v24;

  v4 = objc_opt_new();
  p = self->_library._p;
  v6 = *(RBShaderLibrary **)(v4 + 8);
  if (v6 != p)
  {

    *(_QWORD *)(v4 + 8) = p;
  }
  v7 = *(unsigned int **)(v4 + 16);
  v8 = self->_fn_args.function._p;
  if (v7 != (unsigned int *)v8)
  {
    if (v7)
    {
      v9 = v7 + 2;
      do
      {
        v10 = __ldxr(v9);
        v11 = v10 - 1;
      }
      while (__stlxr(v11, v9));
      if (!v11)
      {
        __dmb(9u);
        (*(void (**)(unsigned int *))(*(_QWORD *)v7 + 8))(v7);
      }
      v8 = self->_fn_args.function._p;
    }
    if (v8)
    {
      v12 = (unsigned int *)((char *)v8 + 8);
      do
        v13 = __ldxr(v12);
      while (__stxr(v13 + 1, v12));
    }
    *(_QWORD *)(v4 + 16) = v8;
  }
  p_args = (const RB::CustomShader::Value *)&self->_fn_args.args;
  v15 = *(_QWORD *)(v4 + 128);
  if (*(_QWORD *)(v4 + 120))
    v16 = *(const void ***)(v4 + 120);
  else
    v16 = (const void **)(v4 + 24);
  if (v15)
  {
    v17 = 24 * v15;
    do
    {
      RB::CustomShader::Value::reset_data(v16);
      v16 += 3;
      v17 -= 24;
    }
    while (v17);
  }
  *(_QWORD *)(v4 + 128) = 0;
  size = self->_fn_args.args._size;
  if (self->_fn_args.args._p_2)
    p_args = (const RB::CustomShader::Value *)self->_fn_args.args._p_2;
  if (*(_QWORD *)(v4 + 136) < size)
  {
    RB::vector<RB::CustomShader::Value,4ul,unsigned long>::reserve_slow((void *)(v4 + 24), self->_fn_args.args._size);
    v19 = *(_QWORD *)(v4 + 128);
  }
  else
  {
    v19 = 0;
    v20 = 0;
    if (!size)
      goto LABEL_29;
  }
  v21 = *(_QWORD *)(v4 + 120);
  if (!v21)
    v21 = v4 + 24;
  v22 = (RB::CustomShader::Value *)(v21 + 24 * v19);
  v23 = size;
  do
  {
    v24 = RB::CustomShader::Value::Value(v22, p_args);
    p_args = (const RB::CustomShader::Value *)((char *)p_args + 24);
    v22 = (RB::CustomShader::Value *)(v24 + 24);
    --v23;
  }
  while (v23);
  v20 = *(_QWORD *)(v4 + 128);
LABEL_29:
  *(_QWORD *)(v4 + 128) = v20 + size;
  *(_DWORD *)(v4 + 144) = self->_type;
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->_type == *((_DWORD *)a3 + 36)
      && self->_library._p == (RBShaderLibrary *)*((_QWORD *)a3 + 1)
      && RB::CustomShader::Closure::operator==((uint64_t *)&self->_fn_args, (uint64_t *)a3 + 2);
}

- (unint64_t)hash
{
  return *((unsigned int *)self->_fn_args.function._p + 8);
}

- (RBShaderLibrary)library
{
  return self->_library._p;
}

- (NSString)function
{
  return (NSString *)*((_QWORD *)self->_fn_args.function._p + 3);
}

- (unint64_t)numberOfArguments
{
  return self->_fn_args.args._size;
}

- (void)removeAllArguments
{
  unint64_t size;
  const void **p_2;
  uint64_t v5;

  size = self->_fn_args.args._size;
  if (self->_fn_args.args._p_2)
    p_2 = (const void **)self->_fn_args.args._p_2;
  else
    p_2 = (const void **)&self->_fn_args.args;
  if (size)
  {
    v5 = 24 * size;
    do
    {
      RB::CustomShader::Value::reset_data(p_2);
      p_2 += 3;
      v5 -= 24;
    }
    while (v5);
  }
  self->_fn_args.args._size = 0;
}

- (void)setArgumentBytes:(const void *)a3 atIndex:(unint64_t)a4 type:(unsigned int)a5 count:(unint64_t)a6 flags:(unsigned int)a7
{
  char v7;
  unsigned __int8 v9;
  void *p_2;
  unint64_t v14;
  _BYTE *p;
  _BYTE *v16;

  v7 = a7;
  v9 = a5;
  RB::CustomShader::Closure::ensure_arg((RB::CustomShader::Closure *)&self->_fn_args, a4);
  p_2 = self->_fn_args.args._p_2;
  if (!p_2)
    p_2 = &self->_fn_args.args;
  v14 = 3 * a4;
  RB::CustomShader::Value::set_bytes((uint64_t)p_2 + 8 * v14, v9, a6, (const UInt8 *)a3);
  p = self->_fn_args.args._p_2;
  if (!p)
    p = self->_fn_args.args._p;
  p[8 * v14 + 7] = p[8 * v14 + 7] & 0xFE | v7 & 1;
  v16 = self->_fn_args.args._p_2;
  if (!v16)
    v16 = self->_fn_args.args._p;
  v16[8 * v14 + 7] = v16[8 * v14 + 7] & 0xFD | v7 & 2;
}

- (void)setArgumentData:(id)a3 atIndex:(unint64_t)a4 type:(unsigned int)a5 flags:(unsigned int)a6
{
  char v6;
  unsigned __int8 v7;
  void *p_2;
  unint64_t v12;
  _BYTE *p;
  _BYTE *v14;

  v6 = a6;
  v7 = a5;
  RB::CustomShader::Closure::ensure_arg((RB::CustomShader::Closure *)&self->_fn_args, a4);
  p_2 = self->_fn_args.args._p_2;
  if (!p_2)
    p_2 = &self->_fn_args.args;
  v12 = 3 * a4;
  RB::CustomShader::Value::set_data((uint64_t)p_2 + 8 * v12, v7, (const __CFData *)a3);
  p = self->_fn_args.args._p_2;
  if (!p)
    p = self->_fn_args.args._p;
  p[8 * v12 + 7] = p[8 * v12 + 7] & 0xFE | v6 & 1;
  v14 = self->_fn_args.args._p_2;
  if (!v14)
    v14 = self->_fn_args.args._p;
  v14[8 * v12 + 7] = v14[8 * v12 + 7] & 0xFD | v6 & 2;
}

- (void)setArgumentColorSpace:(int)a3 atIndex:(unint64_t)a4
{
  __int16 v7;
  char *p_args;

  RB::CustomShader::Closure::ensure_arg((RB::CustomShader::Closure *)&self->_fn_args, a4);
  v7 = rb_color_space(a3);
  p_args = (char *)&self->_fn_args.args;
  if (self->_fn_args.args._p_2)
    p_args = (char *)self->_fn_args.args._p_2;
  *(_WORD *)&p_args[24 * a4 + 5] = v7;
}

- ($B8E3DD8A8954C8C133399D0883B251E3)argumentAtIndex:(SEL)a3
{
  char *p_args;
  char *v6;
  int v7;
  int v8;
  int v9;
  $B8E3DD8A8954C8C133399D0883B251E3 *result;

  if (self->_fn_args.args._size <= a4)
    RB::precondition_failure((RB *)"invalid argument index: %ld", a3, a4);
  p_args = (char *)&self->_fn_args.args;
  if (self->_fn_args.args._p_2)
    p_args = (char *)self->_fn_args.args._p_2;
  v6 = &p_args[24 * a4];
  v7 = v6[7];
  v8 = v7 << 31 >> 31;
  if ((v7 & 2) != 0)
    v9 = 3;
  else
    v9 = 1;
  retstr->var0 = v6[4];
  retstr->var1 = v8 & v9;
  retstr->var2 = *(unsigned int *)v6;
  retstr->var3 = RB::CustomShader::Value::data_ptr((RB::CustomShader::Value *)v6);
  result = ($B8E3DD8A8954C8C133399D0883B251E3 *)rb_color_space(*(_WORD *)(v6 + 5));
  retstr->var4 = (int)result;
  return result;
}

- (id)encodedDataForDelegate:(id)a3 error:(id *)a4
{
  _QWORD *v6;
  unsigned int *v7;
  unsigned int v8;
  Closure *p_fn_args;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  void *v21;
  id v22[2];
  _QWORD v23[5];
  void *v24[4];
  __int128 v25;
  char v26;
  id *v27;
  _QWORD *v28;
  uint64_t v29;
  _DWORD v30[24];

  v22[0] = &unk_24C228DC8;
  v22[1] = a3;
  v6 = RB::ObjcEncoderDelegate::font_set(v22);
  memset(v24, 0, sizeof(v24));
  v25 = 0u;
  v26 = 0;
  v27 = v22;
  if (v6)
  {
    v7 = (unsigned int *)(v6 + 1);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  v28 = v6;
  v29 = 0;
  RB::UntypedTable::UntypedTable((RB::UntypedTable *)v30, 0, 0, 0, 0, 0);
  p_fn_args = &self->_fn_args;
  do
  {
    v10 = __ldxr((unsigned int *)&RB::Encoder::_last_encoder_id);
    v11 = v10 + 1;
  }
  while (__stxr(v11, (unsigned int *)&RB::Encoder::_last_encoder_id));
  v30[20] = v11;
  v30[21] = 0;
  RB::CustomShader::Closure::prepare_encode((RB::CustomShader::Closure *)p_fn_args, (RB::Encoder *)v24);
  RB::Encoder::prepare_fonts((RB::Encoder *)v24);
  RB::ProtobufEncoder::encode_varint(v24, 0xAuLL);
  RB::ProtobufEncoder::begin_length_delimited(v24);
  RB::CustomShader::Closure::encode((RB::CustomShader::Function **)p_fn_args, (RB::Encoder *)v24);
  RB::ProtobufEncoder::end_length_delimited(v24);
  v12 = operator new();
  v13 = v24[0];
  *(void **)v12 = v24[0];
  v21 = v24[1];
  *(_OWORD *)(v12 + 8) = *(_OWORD *)&v24[1];
  memset(v24, 0, 24);
  v14 = objc_alloc(MEMORY[0x24BDBCE50]);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = ___ZN2RB19ObjcEncoderDelegate16encode_message_fIZ41__RBShader_encodedDataForDelegate_error__E3__2Z41__RBShader_encodedDataForDelegate_error__E3__3EEP6NSDataRKT_RKT0__block_invoke;
  v23[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
  v23[4] = v12;
  v15 = (id)objc_msgSend(v14, "initWithBytesNoCopy:length:deallocator:", v13, v21, v23);
  RB::UntypedTable::~UntypedTable((RB::UntypedTable *)v30);
  v16 = v28;
  if (v28)
  {
    v17 = (unsigned int *)(v28 + 1);
    do
    {
      v18 = __ldxr(v17);
      v19 = v18 - 1;
    }
    while (__stlxr(v19, v17));
    if (!v19)
    {
      __dmb(9u);
      (*(void (**)(_QWORD *))(*v16 + 8))(v16);
    }
  }
  if (v24[3])
    free(v24[3]);
  if (v24[0])
    free(v24[0]);
  if (a4 && !v15 && !*a4)
    *a4 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("RBCodableError"), -1, 0);
  return v15;
}

+ (id)decodedObjectWithData:(id)a3 delegate:(id)a4 error:(id *)a5
{
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t i;
  int v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[40];
  char v24[4096];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  _BYTE *v32;
  uint64_t *v33;
  _BYTE v34[80];
  void *v35[2];
  _OWORD v36[2];
  unsigned __int8 v37[16];
  int v38;
  char v39;
  uint64_t v40;

  MEMORY[0x24BDAC7A8](a1, a2);
  v6 = v5;
  v8 = v7;
  v40 = *MEMORY[0x24BDAC8D0];
  v22 = v9;
  v10 = (void *)objc_opt_new();
  RB::Heap::Heap((RB::Heap *)v23, v24, 4096, 0);
  v11 = v10;
  v12 = objc_msgSend(v8, "bytes", &unk_24C228D90, v22, 0);
  v13 = objc_msgSend(v8, "length");
  v25 = v12;
  v26 = v12 + v13;
  v27 = 0;
  v28 = 0;
  v30 = 0;
  v29 = 0;
  v32 = v23;
  v33 = &v21;
  v31 = 0;
  RB::UntypedTable::UntypedTable((RB::UntypedTable *)v34, 0, 0, 0, 0, 0);
  memset(v36, 0, sizeof(v36));
  *(_OWORD *)v35 = 0u;
  uuid_clear(v37);
  v38 = 0;
  v39 = 1;
  for (i = RB::ProtobufDecoder::next_field((RB::ProtobufDecoder *)&v25);
        i;
        i = RB::ProtobufDecoder::next_field((RB::ProtobufDecoder *)&v25))
  {
    if ((i >> 3) == 15)
    {
      RB::Decoder::push_shared((char *)&v25, i);
    }
    else if ((i >> 3) == 1)
    {
      RB::CustomShader::Closure::decode((RB::CustomShader::Closure *)(v11 + 16), (RB::Decoder *)&v25);
    }
    else
    {
      RB::ProtobufDecoder::skip_field((RB::ProtobufDecoder *)&v25, i);
    }
  }
  v15 = v31;
  v16 = v25;
  v17 = v26;
  RB::ObjectTable::~ObjectTable((RB::ObjectTable *)((char *)v36 + 8));
  if (v35[0])
    free(v35[0]);
  RB::UntypedTable::~UntypedTable((RB::UntypedTable *)v34);
  if (v28)
    free(v28);

  if (v15 || v16 > v17)
  {
    if (v6 && !*v6)
    {
      v19 = 0;
      *v6 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("RBCodableError"), -1, 0);
    }
    else
    {
      v19 = 0;
    }
    v18 = v10;
  }
  else
  {
    v18 = 0;
    v19 = v10;
  }
  RB::Heap::~Heap((RB::Heap *)v23);

  return v19;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  vector<RB::CustomShader::Value, 4UL, unsigned long> *p_args;
  Value *p_2;
  const void **v5;
  unint64_t v6;
  Function *p;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;

  p_args = &self->_fn_args.args;
  p_2 = self->_fn_args.args._p_2;
  if (p_2)
    v5 = (const void **)p_2;
  else
    v5 = (const void **)p_args;
  if (self->_fn_args.args._size)
  {
    v6 = 0;
    do
    {
      RB::CustomShader::Value::reset_data(v5);
      ++v6;
      v5 += 3;
    }
    while (v6 < self->_fn_args.args._size);
    p_2 = self->_fn_args.args._p_2;
  }
  if (p_2)
    free(p_2);
  p = self->_fn_args.function._p;
  if (p)
  {
    v8 = (unsigned int *)((char *)p + 8);
    do
    {
      v9 = __ldxr(v8);
      v10 = v9 - 1;
    }
    while (__stlxr(v10, v8));
    if (!v10)
    {
      __dmb(9u);
      (*(void (**)(Function *, SEL))(*(_QWORD *)p + 8))(p, a2);
    }
  }

}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 17) = 4;
  return self;
}

@end
