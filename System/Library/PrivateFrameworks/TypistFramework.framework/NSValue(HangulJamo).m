@implementation NSValue(HangulJamo)

+ (id)valueWithHangulJamoTransformationData:()HangulJamo
{
  uint64_t v4;

  v4 = a3;
  objc_msgSend(a1, "valueWithBytes:objCType:", &v4, "{?=ii}");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)hangulJamoTransformationDataValue
{
  uint64_t v2;

  v2 = 0;
  objc_msgSend(a1, "getValue:", &v2);
  return v2;
}

+ (uint64_t)hangulJamoTransformationDataValueWithJamoType:()HangulJamo direction:
{
  return objc_msgSend(MEMORY[0x24BDD1968], "valueWithHangulJamoTransformationData:", a3 | (unint64_t)(a4 << 32));
}

@end
