@implementation NSMutableArray(OSASanitizerCondensor)

- (void)addPart:()OSASanitizerCondensor
{
  void *v4;
  char v5;
  id v6;

  v6 = a3;
  if (!objc_msgSend(a1, "count")
    || !objc_msgSend(v6, "isEqualToString:", CFSTR("*"))
    || (objc_msgSend(a1, "lastObject"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("*")),
        v4,
        (v5 & 1) == 0))
  {
    objc_msgSend(a1, "addObject:", v6);
  }

}

@end
