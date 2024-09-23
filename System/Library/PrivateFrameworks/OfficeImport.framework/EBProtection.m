@implementation EBProtection

+ (id)edProtectionFromXlXf:(XlXf *)a3
{
  if (!a3)
    return 0;
  +[EDProtection protectionWithHidden:locked:](EDProtection, "protectionWithHidden:locked:", a3->var25, a3->var24);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)edProtectionFromXlGraphicsInfo:(void *)a3
{
  if (!a3)
    return 0;
  +[EDProtection protectionWithHidden:locked:](EDProtection, "protectionWithHidden:locked:", 0, *((unsigned __int8 *)a3 + 76));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)edProtectionFromXlDXfProtect:(XlDXfProtect *)a3
{
  if (!a3)
    return 0;
  +[EDProtection protectionWithHidden:locked:](EDProtection, "protectionWithHidden:locked:", a3->var1, a3->var0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)writeProtection:(id)a3 toXlXf:(XlXf *)a4
{
  id v5;
  id v6;

  v5 = a3;
  if (a4)
  {
    a4->var37 = v5 != 0;
    if (v5)
    {
      v6 = v5;
      a4->var25 = objc_msgSend(v5, "isHidden");
      a4->var24 = objc_msgSend(v6, "isLocked");
      v5 = v6;
    }
  }

}

+ (void)writeProtection:(id)a3 toXlGraphicsInfo:(void *)a4
{
  id v5;
  id v6;

  v5 = a3;
  if (v5 && a4)
  {
    v6 = v5;
    *((_BYTE *)a4 + 76) = objc_msgSend(v5, "isLocked");
    v5 = v6;
  }

}

+ (XlDXfProtect)xlDXfProtectFromEDProtection:(id)a3
{
  id v3;
  XlDXfProtect *v4;

  v3 = a3;
  if (v3)
  {
    v4 = (XlDXfProtect *)operator new();
    XlDXfProtect::XlDXfProtect(v4);
    v4->var1 = objc_msgSend(v3, "isHidden");
    v4->var1 = objc_msgSend(v3, "isLocked");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
