@implementation AVVCStartRecordSettings(debugDescription)

- (id)debugDescription
{
  void *v2;
  int v3;
  const __CFString *v4;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("[streamHandleId = %d]"), objc_msgSend(a1, "streamID"));
  objc_msgSend(v2, "appendFormat:", CFSTR("[startHostTime = %llu]"), objc_msgSend(a1, "startHostTime"));
  objc_msgSend(v2, "appendFormat:", CFSTR("[startAlert = %d]"), objc_msgSend(a1, "startAlert"));
  objc_msgSend(v2, "appendFormat:", CFSTR("[stopAlert = %d]"), objc_msgSend(a1, "stopAlert"));
  objc_msgSend(v2, "appendFormat:", CFSTR("[stopOnErrorAlert = %d]"), objc_msgSend(a1, "stopOnErrorAlert"));
  v3 = objc_msgSend(a1, "skipAlert");
  v4 = CFSTR("NO");
  if (v3)
    v4 = CFSTR("YES");
  objc_msgSend(v2, "appendFormat:", CFSTR("[skipAlert = %@]"), v4);
  return v2;
}

@end
