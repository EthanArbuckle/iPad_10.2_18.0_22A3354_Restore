@implementation SUDefaultCellCarrierOverrideDownloadPolicy

- (BOOL)isDownloadAllowableForCellular
{
  return 1;
}

- (BOOL)allowExpensiveNetwork
{
  return 1;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if (-[SUDefaultCellCarrierOverrideDownloadPolicy isDownloadAllowableForCellular](self, "isDownloadAllowableForCellular"))
  {
    v4 = CFSTR("YES");
  }
  else
  {
    v4 = CFSTR("NO");
  }
  if (-[SUDefaultDownloadPolicy hasEnoughDiskSpace](self, "hasEnoughDiskSpace"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  if (-[SUDefaultDownloadPolicy isDownloadable](self, "isDownloadable"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (-[SUDefaultDownloadPolicy isDownloadFreeForCellular](self, "isDownloadFreeForCellular"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (-[SUDefaultDownloadPolicy isDownloadAllowableForCellular2G](self, "isDownloadAllowableForCellular2G"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[SUDefaultDownloadPolicy isDownloadAllowableForCellularRoaming](self, "isDownloadAllowableForCellularRoaming"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[SUDefaultDownloadPolicy isDownloadAllowableForWiFi](self, "isDownloadAllowableForWiFi"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("\n            isDownloadAllowableForCellular: %@\n            hasEnoughDiskSpace: %@\n            isDownloadable: %@\n            isDownloadFreeForCellular: %@\n            isDownloadAllowableForCellular2G: %@\n            isDownloadAllowableForCellularRoaming: %@\n            isDownloadAllowableForWiFi: %@\n"), v4, v5, v6, v7, v8, v9, v10);
}

@end
