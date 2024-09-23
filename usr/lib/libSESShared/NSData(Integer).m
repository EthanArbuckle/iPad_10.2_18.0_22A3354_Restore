@implementation NSData(Integer)

- (uint64_t)u8:()Integer
{
  return *(unsigned __int8 *)(objc_msgSend(objc_retainAutorelease(a1), "bytes") + a3);
}

- (uint64_t)u16LE:()Integer
{
  return *(unsigned __int16 *)(objc_msgSend(objc_retainAutorelease(a1), "bytes") + a3);
}

- (uint64_t)u16BE:()Integer
{
  return bswap32(*(unsigned __int16 *)(objc_msgSend(objc_retainAutorelease(a1), "bytes") + a3)) >> 16;
}

- (uint64_t)u32LE:()Integer
{
  return *(unsigned int *)(objc_msgSend(objc_retainAutorelease(a1), "bytes") + a3);
}

- (uint64_t)u32BE:()Integer
{
  return bswap32(*(_DWORD *)(objc_msgSend(objc_retainAutorelease(a1), "bytes") + a3));
}

- (uint64_t)s32BE:()Integer
{
  return bswap32(*(_DWORD *)(objc_msgSend(objc_retainAutorelease(a1), "bytes") + a3));
}

- (uint64_t)u64LE:()Integer
{
  return *(_QWORD *)(objc_msgSend(objc_retainAutorelease(a1), "bytes") + a3);
}

- (unint64_t)u64BE:()Integer
{
  return bswap64(*(_QWORD *)(objc_msgSend(objc_retainAutorelease(a1), "bytes") + a3));
}

+ (id)withU16BE:()Integer
{
  id v4;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 2);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_WORD *)objc_msgSend(v4, "mutableBytes") = __rev16(a3);
  return v4;
}

@end
