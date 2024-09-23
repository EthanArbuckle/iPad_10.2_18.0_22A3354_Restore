@implementation NSUUID(CRDT_Additions)

- (void)mergeWith:()CRDT_Additions
{
  id v4;
  id v5;

  v5 = a3;
  if ((objc_msgSend(a1, "isEqual:") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Cannot merge NSUUID with different value."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }

}

- (uint64_t)deltaSince:()CRDT_Additions in:
{
  return 0;
}

+ (id)CR_repeatedCharUUID:()CRDT_Additions
{
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v4[0] = 0x101010101010101 * a3;
  v4[1] = v4[0];
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v4);
}

+ (id)CR_zero
{
  if (CR_zero_once != -1)
    dispatch_once(&CR_zero_once, &__block_literal_global_48);
  return (id)CR_zero_zero;
}

- (uint64_t)CR_compare:()CRDT_Additions
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

- (id)CR_shortDescription
{
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  v2[1] = 0;
  objc_msgSend(a1, "getUUIDBytes:", v2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02X%02X"), LOBYTE(v2[0]), BYTE1(v2[0]));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)initWithCRCoder:()CRDT_Additions
{
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeUUIDFromUUIDIndex:", objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("UUIDIndex")));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = 0;
  v8[1] = 0;
  objc_msgSend(v5, "getUUIDBytes:", v8);
  v6 = objc_msgSend(a1, "initWithUUIDBytes:", v8);

  return v6;
}

- (void)encodeWithCRCoder:()CRDT_Additions
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeUInt64:forKey:", objc_msgSend(v4, "encodeUUIDIndexFromUUID:", a1), CFSTR("UUIDIndex"));

}

@end
