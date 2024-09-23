@implementation NSURL(VisionCore)

- (id)VisionCoreFileSystemPathAndReturnError:()VisionCore
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "filePathURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", CFSTR("file URL was not provided"));
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "fileSystemRepresentation");
  if (!v7)
  {
    if (a3)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("could not obtain file system representation for %@"), v6);
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInternalErrorWithLocalizedDescription:", v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_8;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v7);
LABEL_9:

  return v8;
}

@end
