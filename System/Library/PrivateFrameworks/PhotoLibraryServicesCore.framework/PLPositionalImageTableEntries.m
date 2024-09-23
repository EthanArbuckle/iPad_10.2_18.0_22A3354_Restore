@implementation PLPositionalImageTableEntries

- (void)enumerateImageIndexes:(id)a3 formatSideLength:(int)a4
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  PLPositionalImageTableEntries *v7;
  id v8;
  int v9;

  v6[1] = 3221225472;
  v6[2] = __72__PLPositionalImageTableEntries_enumerateImageIndexes_formatSideLength___block_invoke;
  v6[3] = &unk_1E3768718;
  v9 = a4;
  v7 = self;
  v8 = a3;
  v5.receiver = v7;
  v5.super_class = (Class)PLPositionalImageTableEntries;
  v6[0] = MEMORY[0x1E0C809B0];
  v4 = v8;
  -[PLPositionalTableEntries enumerateIndexes:](&v5, sel_enumerateIndexes_, v6);

}

uint64_t __72__PLPositionalImageTableEntries_enumerateImageIndexes_formatSideLength___block_invoke(uint64_t a1, __n128 a2, __n128 a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  int v8;

  if (a5)
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "entryLength");
    a2.n128_u32[0] = *(_DWORD *)(a5 + v7 - 12);
    a3.n128_u32[0] = *(_DWORD *)(a5 + v7 - 8);
    a2.n128_f64[0] = (double)a2.n128_u64[0];
    a3.n128_f64[0] = (double)a3.n128_u64[0];
    v8 = *(_DWORD *)(a1 + 48);
    if (a2.n128_f64[0] > (double)v8)
      a2.n128_f64[0] = (double)v8;
    if (a3.n128_f64[0] > (double)v8)
      a3.n128_f64[0] = (double)v8;
  }
  else
  {
    a2.n128_u64[0] = *MEMORY[0x1E0C9D820];
    a3.n128_u64[0] = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
  }
  return (*(uint64_t (**)(__n128, __n128))(*(_QWORD *)(a1 + 40) + 16))(a2, a3);
}

@end
