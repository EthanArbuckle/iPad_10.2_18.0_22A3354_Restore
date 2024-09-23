@implementation VisionCoreE5RTProgramLibraryCompilationOptions

- (VisionCoreE5RTProgramLibraryCompilationOptions)init
{
  VisionCoreE5RTProgramLibraryCompilationOptions *v2;
  VisionCoreE5RTProgramLibraryCompilationOptions *v3;
  VisionCoreE5RTProgramLibraryCompilationOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VisionCoreE5RTProgramLibraryCompilationOptions;
  v2 = -[VisionCoreE5RTProgramLibraryCompilationOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_computeDeviceTypes = 0;
    v2->_fullyANEResident = 1;
    v4 = v2;
  }

  return v3;
}

- (BOOL)createE5RTCompilerOptions:(e5rt_e5_compiler_options *)a3 error:(id *)a4
{
  uint64_t v7;
  BOOL v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v7 = e5rt_e5_compiler_options_create();
  if ((_DWORD)v7)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v7);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v9 = -[VisionCoreE5RTProgramLibraryCompilationOptions computeDeviceTypes](self, "computeDeviceTypes");
    if (!v9)
      goto LABEL_11;
    if ((v9 & 7) == 4)
      -[VisionCoreE5RTProgramLibraryCompilationOptions fullyANEResident](self, "fullyANEResident");
    v10 = e5rt_e5_compiler_options_set_compute_device_types_mask();
    if ((_DWORD)v10)
    {
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v10);
        v8 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        return 0;
      }
    }
    else
    {
LABEL_11:
      -[VisionCoreE5RTProgramLibraryCompilationOptions customCompilationOptions](self, "customCompilationOptions", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11
        && (objc_msgSend(objc_retainAutorelease(v11), "UTF8String"),
            v13 = e5rt_e5_compiler_options_set_custom_ane_compiler_options(),
            (_DWORD)v13))
      {
        if (a4)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v13);
          v8 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v8 = 0;
        }
      }
      else
      {
        *a3 = 0;
        v8 = 1;
      }

    }
  }
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (unint64_t)computeDeviceTypes
{
  return self->_computeDeviceTypes;
}

- (void)setComputeDeviceTypes:(unint64_t)a3
{
  self->_computeDeviceTypes = a3;
}

- (BOOL)fullyANEResident
{
  return self->_fullyANEResident;
}

- (void)setFullyANEResident:(BOOL)a3
{
  self->_fullyANEResident = a3;
}

- (NSString)customCompilationOptions
{
  return self->_customCompilationOptions;
}

- (void)setCustomCompilationOptions:(id)a3
{
  self->_customCompilationOptions = (NSString *)a3;
}

@end
