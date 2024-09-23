@implementation NSError(FileExistsCheck)

- (BOOL)isFileExistsError
{
  id v2;
  _BOOL8 v3;

  v2 = (id)objc_msgSend(a1, "domain");
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDD1128]))
    v3 = objc_msgSend(a1, "code") == 17;
  else
    v3 = 0;

  return v3;
}

@end
