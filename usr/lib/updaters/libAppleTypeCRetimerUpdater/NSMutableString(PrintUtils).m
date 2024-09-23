@implementation NSMutableString(PrintUtils)

- (uint64_t)appendFlag:()PrintUtils field:descStr:
{
  const char *v5;

  v5 = "YES";
  if ((a4 & a3) == 0)
    v5 = "NO";
  return objc_msgSend(a1, "appendFormat:", CFSTR("\t%s: %s\n"), a5, v5);
}

- (uint64_t)appendBool:()PrintUtils descStr:
{
  const char *v4;

  v4 = "NO";
  if (a3)
    v4 = "YES";
  return objc_msgSend(a1, "appendFormat:", CFSTR("\t%s: %s\n"), a4, v4);
}

- (uint64_t)appendValue:()PrintUtils descFunc:descStr:
{
  return objc_msgSend(a1, "appendFormat:", CFSTR("\t%s: %s (%u)\n"), a5, a4(a3), a3);
}

- (void)appendData:()PrintUtils descStr:
{
  id v6;

  objc_msgSend(a3, "byteString");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appendFormat:", CFSTR("\t%s: %@\n"), a4, v6);

}

@end
