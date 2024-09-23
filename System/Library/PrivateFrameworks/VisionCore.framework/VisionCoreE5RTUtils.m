@implementation VisionCoreE5RTUtils

+ (id)stringsForHandle:(void *)a3 fromCountProc:(void *)a4 stringsProc:(void *)a5 error:(id *)a6
{
  uint64_t v9;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  unint64_t i;
  void *v18;
  unint64_t v19;

  v19 = 0;
  v9 = ((uint64_t (*)(void *, unint64_t *))a4)(a3, &v19);
  if ((_DWORD)v9)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v9);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x24BDBCEC8]);
    v12 = objc_retainAutorelease((id)objc_msgSend(v11, "initWithLength:", 8 * v19));
    v13 = objc_msgSend(v12, "mutableBytes");
    v14 = ((uint64_t (*)(void *, unint64_t, uint64_t))a5)(a3, v19, v13);
    if ((_DWORD)v14)
    {
      if (a6)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v14);
        v15 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v16 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v15 = (void *)objc_msgSend(v16, "initWithCapacity:", v19);
      if (v19)
      {
        for (i = 0; i < v19; ++i)
        {
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", *(_QWORD *)(v13 + 8 * i));
          objc_msgSend(v15, "addObject:", v18);

        }
      }
    }

    return v15;
  }
}

+ (BOOL)getPixelFormatType:(unsigned int *)a3 forSurfaceFormat:(int)a4 error:(id *)a5
{
  uint64_t v7;

  v7 = e5rt_surface_format_to_cvpb_4cc();
  if ((_DWORD)v7)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v7);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    *a3 = 0;
  }
  return (_DWORD)v7 == 0;
}

+ (BOOL)getType:(unint64_t *)a3 ofIOPort:(e5rt_io_port *)a4 error:(id *)a5
{
  uint64_t is_tensor;
  void *v7;
  id v8;
  BOOL result;

  is_tensor = e5rt_io_port_is_tensor();
  if ((_DWORD)is_tensor)
  {
    if (a5)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", is_tensor);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
      v8 = v7;
      result = 0;
      *a5 = v8;
      return result;
    }
  }
  else
  {
    is_tensor = e5rt_io_port_is_surface();
    if ((_DWORD)is_tensor)
    {
      if (a5)
        goto LABEL_3;
    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInternalErrorWithLocalizedDescription:", CFSTR("unsupported I/O port handle type"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
  }
  return 0;
}

+ (BOOL)getTensorDataType:(unint64_t *)a3 forTensorDescriptor:(e5rt_tensor_desc *)a4 error:(id *)a5
{
  uint64_t v7;
  BOOL v8;
  uint64_t component_size;

  v7 = e5rt_tensor_desc_retain_dtype();
  if (!(_DWORD)v7)
  {
    component_size = e5rt_tensor_desc_dtype_get_component_size();
    if ((_DWORD)component_size)
    {
      if (a5)
      {
LABEL_6:
        objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", component_size);
        v8 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
        e5rt_tensor_desc_dtype_release();
        return v8;
      }
    }
    else
    {
      component_size = e5rt_tensor_desc_dtype_get_component_dtype();
      if (!(_DWORD)component_size)
      {
        if (a3)
          *a3 = 196608;
        v8 = 1;
        goto LABEL_15;
      }
      if (a5)
        goto LABEL_6;
    }
    v8 = 0;
    goto LABEL_15;
  }
  if (!a5)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForE5RTLastErrorMessageAndCode:", v7);
  v8 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  return v8;
}

@end
