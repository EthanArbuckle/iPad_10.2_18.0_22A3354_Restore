@implementation NSMutableString(ICSWriter)

- (void)_ICSRemoveCharactersFromSet:()ICSWriter
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  while (objc_msgSend(a1, "length"))
  {
    v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v6);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    objc_msgSend(a1, "deleteCharactersInRange:", v4, v5);
  }

}

- (uint64_t)_ICSStripControlChracters
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!_ICSStripControlChracters_sCharSet)
  {
    objc_msgSend(a1, "controlCharacterSet");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_ICSStripControlChracters_sCharSet;
    _ICSStripControlChracters_sCharSet = v3;

    objc_msgSend((id)_ICSStripControlChracters_sCharSet, "invert");
    v5 = (void *)_ICSStripControlChracters_sCharSet;
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formUnionWithCharacterSet:", v6);

    objc_msgSend((id)_ICSStripControlChracters_sCharSet, "invert");
  }
  objc_sync_exit(v2);

  return objc_msgSend(a1, "_ICSRemoveCharactersFromSet:", _ICSStripControlChracters_sCharSet);
}

- (id)controlCharacterSet
{
  if (controlCharacterSet_onceToken != -1)
    dispatch_once(&controlCharacterSet_onceToken, &__block_literal_global_3);
  return (id)controlCharacterSet_controlCharacterSet;
}

- (uint64_t)_ICSEscapePropertyValue
{
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), CFSTR("\\\\"), 0, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR(";"),
    CFSTR("\\;"),
    0,
    0,
    objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR(","), CFSTR("\\,"), 0, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\r\n"), CFSTR("\\n"), 0, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("\\n"), 0, 0, objc_msgSend(a1, "length"));
  return objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\r"), CFSTR("\\n"), 0, 0, objc_msgSend(a1, "length"));
}

- (uint64_t)_ICSEscapeParameterValue
{
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\\"), CFSTR("\\\\"), 0, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR(";"),
    CFSTR("\\;"),
    0,
    0,
    objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR(":"), CFSTR("\\:"), 0, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR(","), CFSTR("\\,"), 0, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\r\n"), CFSTR("\\n"), 0, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("\\n"), 0, 0, objc_msgSend(a1, "length"));
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\r"), CFSTR("\\n"), 0, 0, objc_msgSend(a1, "length"));
  return objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), CFSTR("\\\"), 0, 0, objc_msgSend(a1, "length"));
}

- (uint64_t)_ICSEscapeParameterQuotedValue
{
  objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("\\n"), 0, 0, objc_msgSend(a1, "length"));
  return objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\"), &stru_1E953C148, 0, 0, objc_msgSend(a1, "length"));
}

@end
