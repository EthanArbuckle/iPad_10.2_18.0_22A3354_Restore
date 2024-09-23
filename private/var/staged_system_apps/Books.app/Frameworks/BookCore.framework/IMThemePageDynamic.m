@implementation IMThemePageDynamic

- (id)stableIdentifier
{
  return CFSTR("epub-dynamic");
}

- (int64_t)epubTheme
{
  return 1;
}

- (BOOL)isNight:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle") == (char *)&dword_0 + 2;

  return v4;
}

@end
