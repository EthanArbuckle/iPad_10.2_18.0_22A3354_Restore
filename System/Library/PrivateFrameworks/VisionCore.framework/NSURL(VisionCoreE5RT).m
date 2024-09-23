@implementation NSURL(VisionCoreE5RT)

- (uint64_t)VisionCoreE5RTPathAndReturnError:()VisionCoreE5RT
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id v8;
  void *v9;

  v4 = objc_retainAutorelease(a1);
  v5 = objc_msgSend(v4, "fileSystemRepresentation");
  v6 = v5;
  if (a3 && !v5)
  {
    v7 = objc_msgSend(v4, "isFileURL");
    v8 = objc_alloc(MEMORY[0x24BDD17C8]);
    if ((v7 & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@ cannot be resolved into a file system pathname"), v4);
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", v9);
    }
    else
    {
      v9 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@ does not specify a file"), v4);
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v9);
    }
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

@end
