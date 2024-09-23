@implementation WFSectionForGlyph

void __WFSectionForGlyph_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v6 = objc_msgSend(a2, "unsignedIntegerValue");
  v7 = v6;
  v8 = &unk_1E60040D8;
  if (v6 == 1)
    v8 = &unk_1E60040F0;
  if (v6 == 2)
    v8 = &unk_1E6004108;
  v11 = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v11, "containsObject:", v9);

  if (v10)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
    *a4 = 1;
  }

}

@end
