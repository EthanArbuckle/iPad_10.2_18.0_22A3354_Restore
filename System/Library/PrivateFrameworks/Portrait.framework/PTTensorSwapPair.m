@implementation PTTensorSwapPair

- (PTTensorSwapPair)initWithIOSurfaces:(__IOSurface *)a3 names:(id)a4
{
  id v6;
  PTTensorSwapPair *v7;
  PTTensorSwapPair *v8;
  uint64_t v9;
  const __CFAllocator *v10;
  NSString **names;
  char v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  NSString *v16;
  PTTensorSwapPair *v17;
  objc_super v19;
  uint8_t v20[4];
  _DWORD v21[7];

  *(_QWORD *)&v21[5] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PTTensorSwapPair;
  v7 = -[PTTensorSwapPair init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    v9 = 0;
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    names = v7->_names;
    v12 = 1;
    do
    {
      v13 = v12;
      if (CVPixelBufferCreateWithIOSurface(v10, a3[v9], 0, &v8->_tensorPair[v9]))
      {
        _PTLogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[PTTensorSwapPair initWithIOSurfaces:names:].cold.1(v20, v21, v14);

      }
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = names[v9];
      names[v9] = (NSString *)v15;

      v12 = 0;
      v9 = 1;
    }
    while ((v13 & 1) != 0);
    v17 = v8;
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v3;
  __CVBuffer **tensorPair;
  char v5;
  char v6;
  __CVBuffer *v7;
  objc_super v8;

  v3 = 0;
  tensorPair = self->_tensorPair;
  v5 = 1;
  do
  {
    v6 = v5;
    v7 = tensorPair[v3];
    if (v7)
      CVPixelBufferRelease(v7);
    v5 = 0;
    v3 = 1;
  }
  while ((v6 & 1) != 0);
  v8.receiver = self;
  v8.super_class = (Class)PTTensorSwapPair;
  -[PTTensorSwapPair dealloc](&v8, sel_dealloc);
}

- (__CVBuffer)tensorWithIndex:(int)a3
{
  int v3;

  v3 = a3 & 1;
  if (a3 < 0)
    v3 = -v3;
  return self->_tensorPair[v3];
}

- (id)tensorNameWithIndex:(int)a3
{
  int v3;

  v3 = a3 & 1;
  if (a3 < 0)
    v3 = -v3;
  return self->_names[v3];
}

- (void).cxx_destruct
{
  uint64_t v3;

  v3 = 16;
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + v3), 0);
    v3 -= 8;
  }
  while (v3);
}

- (void)initWithIOSurfaces:(NSObject *)a3 names:.cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "status == noErr";
  OUTLINED_FUNCTION_0_2(&dword_1C9281000, a3, (uint64_t)a3, "Assertion failed %s", a1);
}

@end
