@implementation PFZlibDataDecompressionOptions

- (void)setCreateBuffer:(id)a3
{
  void *v4;
  id createBuffer;

  v4 = (void *)MEMORY[0x1A1B0CFA4](a3, a2);
  createBuffer = self->_createBuffer;
  self->_createBuffer = v4;

}

- (void)setGrowData:(id)a3
{
  void *v4;
  id growData;

  v4 = (void *)MEMORY[0x1A1B0CFA4](a3, a2);
  growData = self->_growData;
  self->_growData = v4;

}

- (int)windowBits
{
  return self->_windowBits;
}

- (void)setWindowBits:(int)a3
{
  self->_windowBits = a3;
}

- (id)createBuffer
{
  return self->_createBuffer;
}

- (id)growData
{
  return self->_growData;
}

- (BOOL)decompressAllAtOnce
{
  return self->_decompressAllAtOnce;
}

- (void)setDecompressAllAtOnce:(BOOL)a3
{
  self->_decompressAllAtOnce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_growData, 0);
  objc_storeStrong(&self->_createBuffer, 0);
}

+ (id)defaultOptions
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = objc_opt_new();
  *(_DWORD *)(v2 + 12) = -15;
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = &__block_literal_global_11153;

  v4 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = &__block_literal_global_35_11154;

  return (id)v2;
}

void __48__PFZlibDataDecompressionOptions_defaultOptions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "increaseLengthBy:", (unint64_t)objc_msgSend(a2, "length") >> 1);

}

uint64_t __48__PFZlibDataDecompressionOptions_defaultOptions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * objc_msgSend(a2, "length"));
}

@end
