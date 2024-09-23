@implementation NSError(VisionCore)

+ (id)VisionCoreErrorWithDomain:()VisionCore code:userInfo:
{
  void *v2;

  objc_msgSend(a1, "errorWithDomain:code:userInfo:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "logInternalError:", v2);
  return v2;
}

+ (uint64_t)VisionCoreErrorWithCode:()VisionCore userInfo:
{
  return objc_msgSend(a1, "VisionCoreErrorWithDomain:code:userInfo:", CFSTR("com.apple.VisionCore"), a3, a4);
}

+ (id)VisionCoreErrorWithCode:()VisionCore localizedDescription:underlyingError:
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v8 = (objc_class *)MEMORY[0x24BDBCE70];
  v9 = a5;
  v10 = a4;
  v11 = [v8 alloc];
  v12 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", v10, *MEMORY[0x24BDD0FC8], v9, *MEMORY[0x24BDD1398], 0);

  objc_msgSend(a1, "VisionCoreErrorWithCode:userInfo:", a3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (uint64_t)VisionCoreErrorWithCode:()VisionCore localizedDescription:
{
  return objc_msgSend(a1, "VisionCoreErrorWithCode:localizedDescription:underlyingError:", a3, a4, 0);
}

+ (uint64_t)VisionCoreErrorForInvalidArgumentWithLocalizedDescription:()VisionCore
{
  return objc_msgSend(a1, "VisionCoreErrorWithCode:localizedDescription:", 2, a3);
}

+ (uint64_t)VisionCoreErrorForInternalErrorWithLocalizedDescription:()VisionCore
{
  return objc_msgSend(a1, "VisionCoreErrorWithCode:localizedDescription:", 1, a3);
}

+ (uint64_t)VisionCoreErrorForUnavailableResourceWithLocalizedDescription:()VisionCore
{
  return objc_msgSend(a1, "VisionCoreErrorWithCode:localizedDescription:", 3, a3);
}

+ (id)VisionCoreErrorForUnavailableDescriptorIdentifier:()VisionCore version:
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithFormat:", CFSTR("%@ %@ is not available - ensure correct version specified."), v8, v7);

  objc_msgSend(a1, "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)VisionCoreErrorForUnknownProcessingDescriptorIdentifier:()VisionCore
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x24BDD17C8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:", CFSTR("unknown processing descriptor \"%@\"), v5);

  objc_msgSend(a1, "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)VisionCoreErrorForCorruptedResourceWithLocalizedDescription:()VisionCore
{
  return objc_msgSend(a1, "VisionCoreErrorWithCode:localizedDescription:", 4, a3);
}

+ (uint64_t)VisionCoreErrorForInvalidOperationWithLocalizedDescription:()VisionCore
{
  return objc_msgSend(a1, "VisionCoreErrorWithCode:localizedDescription:", 5, a3);
}

+ (uint64_t)VisionCoreErrorForFailedOperationWithLocalizedDescription:()VisionCore
{
  return objc_msgSend(a1, "VisionCoreErrorWithCode:localizedDescription:", 6, a3);
}

+ (id)_VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:()VisionCore
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x24BDBCE70];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithObjectsAndKeys:", v5, *MEMORY[0x24BDD0FC8], 0);

  objc_msgSend(a1, "VisionCoreErrorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], -108, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)VisionCoreErrorForMemoryAllocationFailure
{
  return objc_msgSend(a1, "VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:", 0);
}

+ (id)VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:()VisionCore
{
  id v4;
  __CFString *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(CFSTR("Unable to allocate memory"), "stringByAppendingFormat:", CFSTR(" - %@"), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("Unable to allocate memory");
  }
  objc_msgSend(a1, "_VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)VisionCoreErrorForMemoryAllocationFailureOfSize:()VisionCore
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unable to allocate %lu bytes"), a3);
  objc_msgSend(a1, "_VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)VisionCoreErrorForMemoryAllocationFailureOfElementCount:()VisionCore size:
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unable to allocate %lu bytes for %lu elements of size %lu"), a4 * a3, a3, a4);
  objc_msgSend(a1, "_VisionCoreErrorForMemoryAllocationFailureWithLocalizedDescription:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)VisionCoreErrorForCVReturnCode:()VisionCore localizedDescription:
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a4, *MEMORY[0x24BDD0FC8], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "VisionCoreErrorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)VisionCoreErrorForKernelReturnCode:()VisionCore localizedDescription:
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a4, *MEMORY[0x24BDD0FC8], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "VisionCoreErrorWithDomain:code:userInfo:", *MEMORY[0x24BDD1010], a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)VisionCoreErrorForEspressoReturnStatus:()VisionCore localizedDescription:
{
  id v6;
  void *v7;
  uint64_t status_string;
  id v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%d"), a3);
  status_string = espresso_get_status_string();
  if (status_string)
    objc_msgSend(v7, "appendFormat:", CFSTR(": %s"), status_string);
  if (objc_msgSend(v6, "length"))
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@ (%@)"), v6, v7);
  else
    v9 = v7;
  v10 = v9;

  objc_msgSend(a1, "_VisionCoreEspressoErrorWithLocalizedDescription:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)VisionCoreErrorForEspressoErrorInfo:()VisionCore localizedDescription:
{
  id v8;
  id v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v8 = a5;
  v9 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (a3 >= 3)
    v10 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("plan phase %u"), a3);
  else
    v10 = off_24E1DB9D8[(int)a3];
  v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%s (%@)"), a4, v10);

  if (v8)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@ - %@"), v8, v11);

    v11 = (void *)v12;
  }
  objc_msgSend(a1, "_VisionCoreEspressoErrorWithLocalizedDescription:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)VisionCoreErrorForFailedEspressoPlan:()VisionCore localizedDescription:
{
  id v5;
  uint64_t error_info;
  uint64_t v7;
  void *v8;

  v5 = a4;
  error_info = espresso_plan_get_error_info();
  objc_msgSend(a1, "VisionCoreErrorForEspressoErrorInfo:localizedDescription:", error_info, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)logInternalError:()VisionCore
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  if (a3)
  {
    v3 = a3;
    v4 = objc_msgSend(v3, "code");
    objc_msgSend(v3, "localizedDescription");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v14, "cStringUsingEncoding:", 1);
    objc_msgSend(v3, "localizedFailureReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_retainAutorelease(v5);
    v13 = objc_msgSend(v6, "cStringUsingEncoding:", 1);
    VisionCoreValidatedLog(v13, (uint64_t)CFSTR("Error code: %llu; description: %s; reason: %s"),
      v7,
      v8,
      v9,
      v10,
      v11,
      v12,
      v4);

  }
}

@end
