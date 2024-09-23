@implementation WFUSC2257Tag

+ (id)twoTwoFiveSevenTag
{
  return CFSTR("TwoTwoFiveSevenWebFilterTag");
}

+ (id)unitedStatesCodeTag
{
  return CFSTR("UnitedStatesCodeWebFilterTag");
}

- (WFUSC2257Tag)tagWithWebpage:(id)a3
{
  void *v3;
  int v4;
  int v5;
  WFUSC2257Tag *v6;

  v3 = (void *)objc_msgSend(a3, "pageContent");
  v4 = objc_msgSend(v3, "WF_containsWord:", CFSTR("2257"));
  if ((objc_msgSend(v3, "WF_containsWord:", CFSTR("U.S.C")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v3, "WF_containsWord:", CFSTR("USC"));
    if ((v5 | v4) != 1)
      return 0;
  }
  v6 = (WFUSC2257Tag *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (v4)
  {
    -[WFUSC2257Tag appendString:](v6, "appendString:", objc_msgSend((id)objc_opt_class(), "twoTwoFiveSevenTag"));
    -[WFUSC2257Tag appendString:](v6, "appendString:", CFSTR(" "));
  }
  if (v5)
  {
    -[WFUSC2257Tag appendString:](v6, "appendString:", objc_msgSend((id)objc_opt_class(), "unitedStatesCodeTag"));
    -[WFUSC2257Tag appendString:](v6, "appendString:", CFSTR(" "));
  }
  return v6;
}

@end
