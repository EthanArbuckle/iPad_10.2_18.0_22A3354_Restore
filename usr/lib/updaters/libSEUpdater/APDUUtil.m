@implementation APDUUtil

+ (id)getAPDUWithCla:(unsigned __int8)a3 ins:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 payload:(id)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;

  v7 = a6;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = a7;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", objc_msgSend(v11, "length") + 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appendU8:", v10);
  objc_msgSend(v12, "appendU8:", v9);
  objc_msgSend(v12, "appendU8:", v8);
  objc_msgSend(v12, "appendU8:", v7);
  objc_msgSend(v12, "appendU8:", objc_msgSend(v11, "length"));
  if (v11)
    objc_msgSend(v12, "appendData:", v11);

  return v12;
}

+ (CApdu)getCXXApduWithCla:(SEL)a3 ins:(unsigned __int8)a4 p1:(unsigned __int8)a5 p2:(unsigned __int8)a6 payload:(unsigned __int8)a7
{
  CApdu *result;
  id v10;

  objc_msgSend(a2, "getAPDUWithCla:ins:p1:p2:payload:", a4, a5, a6, a7, a8);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  SERestoreInfo::CApdu::CApdu((SERestoreInfo::CApdu *)retstr, (const unsigned __int8 *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 0);

  return result;
}

@end
