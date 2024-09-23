@implementation NSCoder(_UIHyperCoding)

- (uint64_t)_ui_encodeVector:()_UIHyperCoding count:forKey:
{
  void *v1;
  unint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v5 = MEMORY[0x1E0C80A78](a1).n128_u64[0];
  if (v3)
  {
    v6 = (_QWORD *)((char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
    do
    {
      v7 = *v2++;
      *v6++ = bswap64(v7);
      --v3;
    }
    while (v3);
  }
  return objc_msgSend(v1, "encodeBytes:length:forKey:", (char *)v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v4, v5);
}

- (void)_ui_decodeVectorForKey:()_UIHyperCoding returnedCount:
{
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v12;
  _QWORD aBlock[6];
  uint64_t v14;

  v14 = 0;
  v7 = objc_retainAutorelease(a1);
  v8 = objc_msgSend(v7, "decodeBytesForKey:returnedLength:", a3, &v14);
  v9 = v14;
  if ((v14 & 7) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("_UIHyperBase.m"), 353, CFSTR("length (%lu) must be a multiple of the size of CFSwappedFloat64 (%lu)"), v14, 8);

    v9 = v14;
  }
  v10 = v9 >> 3;
  *a4 = v10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__NSCoder__UIHyperCoding___ui_decodeVectorForKey_returnedCount___block_invoke;
  aBlock[3] = &__block_descriptor_48_e9_v16__0_d8l;
  aBlock[4] = v10;
  aBlock[5] = v8;
  return _Block_copy(aBlock);
}

- (uint64_t)_ui_encodeNSUIntegerVector:()_UIHyperCoding count:forKey:
{
  size_t v7;
  const void *v8;
  char *v9;
  uint64_t v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = 8 * a4;
  MEMORY[0x1E0C80A78](a1);
  v9 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v10)
    memcpy((char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v8, v7);
  else
    v7 = 0;
  return objc_msgSend(a1, "encodeBytes:length:forKey:", v9, v7, a5);
}

- (void)_ui_decodeNSUIntegerVectorForKey:()_UIHyperCoding returnedCount:
{
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v12;
  _QWORD aBlock[6];
  uint64_t v14;

  v14 = 0;
  v7 = objc_retainAutorelease(a1);
  v8 = objc_msgSend(v7, "decodeBytesForKey:returnedLength:", a3, &v14);
  v9 = v14;
  if ((v14 & 7) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("_UIHyperBase.m"), 376, CFSTR("length (%lu) must be a multiple of the size of uint64_t (%lu)"), v14, 8);

    v9 = v14;
  }
  v10 = v9 >> 3;
  *a4 = v10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__NSCoder__UIHyperCoding___ui_decodeNSUIntegerVectorForKey_returnedCount___block_invoke;
  aBlock[3] = &__block_descriptor_48_e9_v16__0_Q8l;
  aBlock[4] = v10;
  aBlock[5] = v8;
  return _Block_copy(aBlock);
}

@end
