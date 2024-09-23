@implementation VisionCoreValidationUtilities

+ (BOOL)validateObject:(id)a3 isKindOfClass:(Class)a4 basedOnClass:(Class)a5 error:(id *)a6
{
  id v9;
  BOOL v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v9 = a3;
  if (!v9)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", CFSTR("object is nil"));
      v10 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
LABEL_12:
    v10 = 0;
    goto LABEL_13;
  }
  if (a5 && (-[objc_class isSubclassOfClass:](a4, "isSubclassOfClass:", a5) & 1) == 0)
  {
    if (a6)
    {
      v16 = objc_alloc(MEMORY[0x24BDD17C8]);
      NSStringFromClass(a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(a5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("%@ is not a %@"), v17, v18);

      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", v19);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_12;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a6)
    {
      v11 = objc_alloc(MEMORY[0x24BDD17C8]);
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromClass(a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@ is not a %@"), v13, v14);

      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v15);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_12;
  }
  v10 = 1;
LABEL_13:

  return v10;
}

@end
