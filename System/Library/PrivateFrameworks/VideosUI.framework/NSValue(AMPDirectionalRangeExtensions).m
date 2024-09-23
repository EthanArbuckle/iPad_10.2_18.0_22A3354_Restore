@implementation NSValue(AMPDirectionalRangeExtensions)

+ (id)valueWithDirectionalRange:()AMPDirectionalRangeExtensions
{
  uint64_t v3;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = *a3;
  v3 = *((unsigned __int8 *)a3 + 24);
  v6 = *((_QWORD *)a3 + 2);
  v7 = v3;
  objc_msgSend(a1, "value:withObjCType:", &v5, "[4q]");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)valueWithRange:()AMPDirectionalRangeExtensions direction:hasMixedDirectionality:
{
  _QWORD v7[5];

  v7[4] = *MEMORY[0x1E0C80C00];
  v7[0] = a3;
  v7[1] = a4;
  v7[2] = a5;
  v7[3] = a6;
  objc_msgSend(a1, "value:withObjCType:", v7, "[4q]");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)directionalRangeValue
{
  uint64_t result;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  result = objc_msgSend(a1, "getValue:size:", &v5, 32);
  *(_OWORD *)a2 = v5;
  v4 = v7;
  *(_QWORD *)(a2 + 16) = v6;
  *(_BYTE *)(a2 + 24) = v4 != 0;
  return result;
}

@end
