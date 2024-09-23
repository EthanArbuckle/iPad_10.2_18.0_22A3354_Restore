@implementation PBBulletProperties

+ (id)readBulletProperties:(PptParaProperty9 *)a3 state:(id)a4
{
  id v6;
  void *v7;
  OADAutoNumberBulletProperties *v8;
  int v9;
  void *v10;
  unsigned int v11;
  OADBlipRef *v12;

  v6 = a4;
  v7 = v6;
  if (LOBYTE(a3->var1))
  {
    v8 = -[OADAutoNumberBulletProperties initWithAutoNumberSchemeType:startIndex:]([OADAutoNumberBulletProperties alloc], "initWithAutoNumberSchemeType:startIndex:", objc_msgSend(a1, "readBulletNumberScheme:", *(_DWORD *)&a3->var3 & 0x3F), a3->var3.var1);
  }
  else
  {
    v9 = *((__int16 *)&a3->var0 + 1);
    if (v9 < 0)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v6, "tgtPresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "bulletBlipCount");

      if (v11 >= (unsigned __int16)v9)
        v12 = -[OADBlipRef initWithIndex:name:blip:]([OADBlipRef alloc], "initWithIndex:name:blip:", (unsigned __int16)v9, 0, 0);
      else
        v12 = 0;
      v8 = -[OADImageBulletProperties initWithBlipRef:]([OADImageBulletProperties alloc], "initWithBlipRef:", v12);

    }
  }

  return v8;
}

+ (int)readBulletNumberScheme:(int)a3
{
  if (a3 > 0x28)
    return 1;
  else
    return dword_22A4D34B8[a3];
}

+ (int)readBulletNumberSchemeFromExtended:(unsigned int)a3
{
  return 1;
}

+ (int)writeBulletNumberScheme:(int)a3
{
  if ((a3 - 1) > 0x28)
    return 3;
  else
    return dword_22A4D355C[a3 - 1];
}

@end
