@implementation NSCharacterSet

+ (id)crlwp_characterSetWithCharactersInArray:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", v4));

  return v5;
}

+ (id)crlwp_sentenceDelimiterCharacterSet
{
  if (qword_101415108 != -1)
    dispatch_once(&qword_101415108, &stru_101246470);
  return (id)qword_101415100;
}

+ (id)crlwp_breakingSpaceCharacterSet
{
  if (qword_101415118 != -1)
    dispatch_once(&qword_101415118, &stru_101246490);
  return (id)qword_101415110;
}

+ (id)crlwp_invisibleCharacterSet
{
  if (qword_101415128 != -1)
    dispatch_once(&qword_101415128, &stru_1012464B0);
  return (id)qword_101415120;
}

+ (id)crlwp_spaceCharacterSet
{
  if (qword_101415138 != -1)
    dispatch_once(&qword_101415138, &stru_1012464D0);
  return (id)qword_101415130;
}

+ (id)crlwp_smartSingleQuotesCharacterSet
{
  if (qword_101415148 != -1)
    dispatch_once(&qword_101415148, &stru_1012464F0);
  return (id)qword_101415140;
}

+ (id)crlwp_singleLeftQuoteCharacterSet
{
  if (qword_101415158 != -1)
    dispatch_once(&qword_101415158, &stru_101246510);
  return (id)qword_101415150;
}

+ (id)crlwp_singleRightQuoteCharacterSet
{
  if (qword_101415168 != -1)
    dispatch_once(&qword_101415168, &stru_101246530);
  return (id)qword_101415160;
}

+ (id)crlwp_curlyQuotesCharacterSet
{
  if (qword_101415178 != -1)
    dispatch_once(&qword_101415178, &stru_101246550);
  return (id)qword_101415170;
}

+ (id)crlwp_variationSelectorCharacterSet
{
  if (qword_101415188 != -1)
    dispatch_once(&qword_101415188, &stru_101246570);
  return (id)qword_101415180;
}

+ (id)crlwp_allQuotesCharacterSetExcludingLeft
{
  if (qword_101415198 != -1)
    dispatch_once(&qword_101415198, &stru_101246590);
  return (id)qword_101415190;
}

+ (id)crlwp_allQuotesCharacterSetExcludingRight
{
  if (qword_1014151A8 != -1)
    dispatch_once(&qword_1014151A8, &stru_1012465B0);
  return (id)qword_1014151A0;
}

+ (id)crlwp_preSmartSet
{
  return sub_1001B325C(CFSTR("NSCharacterSetAdditions.preSmartSet"), &stru_1012465F0);
}

+ (id)crlwp_postSmartSet
{
  return sub_1001B325C(CFSTR("NSCharacterSetAdditions.postSmartSet"), &stru_101246610);
}

+ (id)crlwp_lineBreakingCharacterSet
{
  return sub_1001B325C(CFSTR("NSCharacterSetAdditions.lineBreakingCharacterSet"), &stru_101246650);
}

@end
