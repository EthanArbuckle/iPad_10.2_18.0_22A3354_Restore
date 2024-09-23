@implementation NSNumber(iCalendarImport)

+ (id)BOOLFromICSString:()iCalendarImport
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TRUE"));
  if ((v4 & 1) != 0 || objc_msgSend(v3, "isEqualToString:", CFSTR("FALSE")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
