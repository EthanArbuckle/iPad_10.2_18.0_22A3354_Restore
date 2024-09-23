@implementation NSError(VisionCoreE5RT)

+ (id)VisionCoreErrorForE5RTLastErrorMessageAndCode:()VisionCoreE5RT
{
  void *last_error_message;
  void *v6;

  last_error_message = (void *)e5rt_get_last_error_message();
  if (last_error_message)
    last_error_message = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", last_error_message);
  objc_msgSend(a1, "VisionCoreErrorForE5RTErrorCode:localizedDescription:", a3, last_error_message);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)VisionCoreErrorForE5RTErrorCode:()VisionCoreE5RT localizedDescription:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = objc_alloc(MEMORY[0x24BDD16A8]);
  v8 = MEMORY[0x2207A61AC](a3);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%s (%@)"), v8, v9);

  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v10, "appendString:", CFSTR(" - "));
    objc_msgSend(v10, "appendString:", v6);
  }
  objc_msgSend(a1, "VisionCoreErrorForFailedOperationWithLocalizedDescription:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)VisionCoreErrorForUnsupportedE5RTIOPortType:()VisionCoreE5RT
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  v5 = CFSTR("VisionCoreE5RTIOPortTypeUnknown");
  if (a3 == 1)
    v5 = CFSTR("VisionCoreE5RTIOPortTypeTensor");
  if (a3 == 2)
    v5 = CFSTR("VisionCoreE5RTIOPortTypeSurface");
  v6 = v5;
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("unsupported I/O port handle type %@"), v6);

  objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInternalErrorWithLocalizedDescription:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
