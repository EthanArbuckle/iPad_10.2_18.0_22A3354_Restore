@implementation CLDurianVersionNumberUtilities

+ (unint64_t)getNumberFromString:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  if (objc_msgSend(v3, "count") == (id)3)
    return +[CLDurianVersionNumberUtilities constructVersionNumberWithMajor:minor:build:](CLDurianVersionNumberUtilities, "constructVersionNumberWithMajor:minor:build:", objc_msgSend(objc_msgSend(v3, "objectAtIndexedSubscript:", 0), "integerValue"), objc_msgSend(objc_msgSend(v3, "objectAtIndexedSubscript:", 1), "integerValue"), objc_msgSend(objc_msgSend(v3, "objectAtIndexedSubscript:", 2), "integerValue"));
  else
    return 0;
}

+ (id)getStringFromNumber:(unint64_t)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu.%llu.%llu"), +[CLDurianVersionNumberUtilities getMajor:](CLDurianVersionNumberUtilities, "getMajor:"), +[CLDurianVersionNumberUtilities getMinor:](CLDurianVersionNumberUtilities, "getMinor:", a3), +[CLDurianVersionNumberUtilities getBuild:](CLDurianVersionNumberUtilities, "getBuild:", a3));
}

+ (unint64_t)constructVersionNumberWithMajor:(unint64_t)a3 minor:(unint64_t)a4 build:(unint64_t)a5
{
  return ((a3 & 0xF) << 16) | ((a4 & 0xF) << 12) | a5 & 0xFFF;
}

+ (unint64_t)getMajor:(unint64_t)a3
{
  return (a3 >> 16) & 0xF;
}

+ (unint64_t)getMinor:(unint64_t)a3
{
  return (unsigned __int16)a3 >> 12;
}

+ (unint64_t)getBuild:(unint64_t)a3
{
  return a3 & 0xFFF;
}

@end
