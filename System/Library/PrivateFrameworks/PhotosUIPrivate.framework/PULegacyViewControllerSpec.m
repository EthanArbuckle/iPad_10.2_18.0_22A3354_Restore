@implementation PULegacyViewControllerSpec

+ (id)specForIdiom:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 0:
    case 1:
    case 3:
      objc_msgSend(a1, "phoneSpec", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
    case 4:
      objc_msgSend(a1, "padSpec", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(a1, "visionOSSpec", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

+ (id)phoneSpec
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PULegacyViewControllerSpec.m"), 41, CFSTR("Method %s is a responsibility of subclass %@"), "+[PULegacyViewControllerSpec phoneSpec]", v6);

  abort();
}

+ (id)padSpec
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PULegacyViewControllerSpec.m"), 46, CFSTR("Method %s is a responsibility of subclass %@"), "+[PULegacyViewControllerSpec padSpec]", v6);

  abort();
}

+ (id)visionOSSpec
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PULegacyViewControllerSpec.m"), 51, CFSTR("Method %s is a responsibility of subclass %@"), "+[PULegacyViewControllerSpec visionOSSpec]", v6);

  abort();
}

@end
