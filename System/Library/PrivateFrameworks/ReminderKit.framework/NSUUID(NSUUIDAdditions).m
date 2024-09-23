@implementation NSUUID(NSUUIDAdditions)

+ (id)TTZero
{
  if (TTZero_once != -1)
    dispatch_once(&TTZero_once, &__block_literal_global_51);
  return (id)TTZero_zero;
}

- (uint64_t)TTCompare:()NSUUIDAdditions
{
  id v4;
  unsigned __int8 uu2[8];
  uint64_t v7;
  unsigned __int8 uu1[8];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)uu1 = 0;
  v9 = 0;
  *(_QWORD *)uu2 = 0;
  v7 = 0;
  v4 = a3;
  objc_msgSend(a1, "getUUIDBytes:", uu1);
  objc_msgSend(v4, "getUUIDBytes:", uu2);

  return uuid_compare(uu1, uu2);
}

- (id)TTShortDescription
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02X%02X"), LOBYTE(v2[0]), BYTE1(v2[0]));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
