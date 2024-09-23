@implementation NSData(Binary)

- (unint64_t)readBinaryValueAtBit:()Binary numberOfBits:
{
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  unsigned int v14;

  v7 = (_QWORD *)MEMORY[0x1E0C99778];
  if (a4 >= 0x41)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The total parameter must not exceed 64 bits, got %lui"), a4);
  v8 = a4 + a3;
  if (a4 + a3 > 8 * objc_msgSend(a1, "length"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v7, CFSTR("Bit position and total exceed capacity"));
  v9 = (v8 - 1) >> 3;
  v10 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
  if (v9 - (a3 >> 3) == -1)
  {
    v11 = 0;
  }
  else
  {
    v11 = 0;
    v12 = (unsigned __int8 *)(v10 + (a3 >> 3));
    v13 = v9 - (a3 >> 3) + 1;
    do
    {
      v14 = *v12++;
      v11 = v14 | (v11 << 8);
      --v13;
    }
    while (v13);
  }
  return (v11 >> (~(v8 - 1) & 7)) & ((unint64_t)exp2((double)a4) - 1);
}

@end
