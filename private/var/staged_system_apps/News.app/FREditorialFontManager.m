@implementation FREditorialFontManager

- (BOOL)registerFontWithURL:(id)a3 error:(id *)a4
{
  return +[FRFont registerFontWithURL:error:](FRFont, "registerFontWithURL:error:", a3, a4);
}

- (void)unregisterFontWithURL:(id)a3
{
  +[FRFont unregisterFontWithURL:](FRFont, "unregisterFontWithURL:", a3);
}

@end
