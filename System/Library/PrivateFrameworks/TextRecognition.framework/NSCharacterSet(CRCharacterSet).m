@implementation NSCharacterSet(CRCharacterSet)

+ (id)_crUnknownScriptCharacterSet
{
  if (qword_1ED0B4450 != -1)
    dispatch_once(&qword_1ED0B4450, &__block_literal_global_48);
  return (id)qword_1ED0B4458;
}

+ (id)_crJapaneseKoreanAsUnknownScriptCharacterSet
{
  if (qword_1ED0B4460 != -1)
    dispatch_once(&qword_1ED0B4460, &__block_literal_global_51);
  return (id)qword_1ED0B4468;
}

+ (id)_crBiDiMirroredCharacterSet
{
  if (qword_1ED0B4470 != -1)
    dispatch_once(&qword_1ED0B4470, &__block_literal_global_52);
  return (id)qword_1ED0B4478;
}

+ (id)_crBasicArabicCharacterSet
{
  if (qword_1ED0B4480 != -1)
    dispatch_once(&qword_1ED0B4480, &__block_literal_global_55_1);
  return (id)qword_1ED0B4488;
}

+ (id)_crArabicDigitCharacterSet
{
  if (qword_1ED0B4490 != -1)
    dispatch_once(&qword_1ED0B4490, &__block_literal_global_135);
  return (id)qword_1ED0B4498;
}

+ (id)_crArabicDiacriticCharacterSet
{
  if (qword_1ED0B44A0 != -1)
    dispatch_once(&qword_1ED0B44A0, &__block_literal_global_138);
  return (id)qword_1ED0B44A8;
}

+ (id)_crArabicTanweenDiacriticCharacterSet
{
  if (qword_1ED0B44B0 != -1)
    dispatch_once(&qword_1ED0B44B0, &__block_literal_global_157);
  return (id)qword_1ED0B44B8;
}

+ (id)_crArabicCombiningDiacriticCharacterSet
{
  if (qword_1ED0B44C0 != -1)
    dispatch_once(&qword_1ED0B44C0, &__block_literal_global_160);
  return (id)qword_1ED0B44C8;
}

@end
