@implementation NSData(UIKitAdditions)

- (id)_uiSaveContentsToTemporaryFile
{
  void *v2;
  int v3;
  id v4;
  id v5;
  int v7;

  v7 = -1;
  _UITemporaryFileWithUniqueName(CFSTR("uidata"), 0, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v7 == -1)
  {
    v5 = 0;
  }
  else
  {
    v4 = objc_retainAutorelease(a1);
    write(v3, (const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
    close(v7);
    v5 = v2;
  }

  return v5;
}

@end
