@implementation VisionCoreNamedObjects

- (id)_initWithRetainedDictionary:(id)a3
{
  id v5;
  VisionCoreNamedObjects *v6;
  VisionCoreNamedObjects *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VisionCoreNamedObjects;
  v6 = -[VisionCoreNamedObjects init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_objects, a3);

  return v7;
}

- (VisionCoreNamedObjects)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  VisionCoreNamedObjects *v7;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = (id)objc_msgSend(v4, "copy");

  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  }
  v7 = -[VisionCoreNamedObjects _initWithRetainedDictionary:](self, "_initWithRetainedDictionary:", v6);

  return v7;
}

- (VisionCoreNamedObjects)init
{
  return -[VisionCoreNamedObjects initWithDictionary:](self, "initWithDictionary:", 0);
}

- (VisionCoreNamedObjects)initWithNamedObjects:(id)a3
{
  id v4;
  id v5;
  id *v6;
  id v7;
  void *v8;
  id *v9;
  id v10;
  VisionCoreNamedObjects *v11;
  id *v13;
  id *v14;
  uint64_t v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v13 = (id *)&v15;
  if (v4)
  {
    do
    {
      v6 = v13;
      v14 = v13 + 1;
      v7 = *v6;
      if (!v7)
        break;
      v8 = v7;
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v4);
      v9 = v14;
      v13 = v14 + 1;
      v10 = *v9;

      v4 = v10;
    }
    while (v10);
  }
  v11 = -[VisionCoreNamedObjects initWithDictionary:](self, "initWithDictionary:", v5);

  return v11;
}

- (unint64_t)count
{
  return -[NSDictionary count](self->_objects, "count");
}

- (NSArray)allNames
{
  return -[NSDictionary allKeys](self->_objects, "allKeys");
}

- (__IOSurface)surfaceForName:(id)a3 error:(id *)a4
{
  return -[VisionCoreNamedObjects _surfaceForName:allowingAssociatedObject:error:]((uint64_t)self, a3, 0, a4);
}

- (__IOSurface)surfaceAssociatedWithName:(id)a3 error:(id *)a4
{
  return -[VisionCoreNamedObjects _surfaceForName:allowingAssociatedObject:error:]((uint64_t)self, a3, 1, a4);
}

- (__CVBuffer)pixelBufferForName:(id)a3 error:(id *)a4
{
  id v6;
  __CVBuffer *v7;
  __CVBuffer *v8;
  CFTypeID v9;
  __CVBuffer *v10;
  void *v11;

  v6 = a3;
  -[VisionCoreNamedObjects _objectForName:requiredClass:error:]((uint64_t)self, v6, 0, a4);
  v7 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v9 = CFGetTypeID(v7);
  v10 = v8;
  if (v9 != CVPixelBufferGetTypeID())
  {
    if (a4)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("\"%@\" is not a CVPixelBuffer"), v6);
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_5;
  }
LABEL_6:

  return v10;
}

- (id)dataForName:(id)a3 error:(id *)a4
{
  id v6;
  objc_class *v7;
  void *v8;

  v6 = a3;
  v7 = (objc_class *)objc_opt_class();
  -[VisionCoreNamedObjects _objectForName:requiredClass:error:]((uint64_t)self, v6, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)objectOfClass:(Class)a3 forName:(id)a4 error:(id *)a5
{
  return -[VisionCoreNamedObjects _objectForName:requiredClass:error:]((uint64_t)self, a4, a3, a5);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[VisionCoreMutableNamedObjects initWithDictionary:]([VisionCoreMutableNamedObjects alloc], "initWithDictionary:", self->_objects);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSDictionary countByEnumeratingWithState:objects:count:](self->_objects, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)VisionCoreNamedObjects;
  -[VisionCoreNamedObjects description](&v24, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[NSDictionary allKeys](self->_objects, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_localizedStandardCompare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueForKeyPath:", CFSTR("@max.length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = v8 + 1;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x2207A6494]();
        objc_msgSend(v14, "VisionCore_stringAppendedWithPaddingCharacter:toMinimumLength:", 32, v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](self->_objects, "objectForKey:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("\n    %@: %@"), v16, v17);

        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v10);
  }

  return v4;
}

- (unint64_t)hash
{
  return -[NSDictionary hash](self->_objects, "hash");
}

- (BOOL)isEqual:(id)a3
{
  VisionCoreNamedObjects *v4;
  BOOL v5;

  v4 = (VisionCoreNamedObjects *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[NSDictionary isEqualToDictionary:](self->_objects, "isEqualToDictionary:", v4->_objects);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
}

- (_QWORD)_objectForName:(objc_class *)a3 requiredClass:(_QWORD *)a4 error:
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v7 = a2;
  if (!a1)
  {
    a4 = 0;
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (!a4)
      goto LABEL_11;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("\"%@\" has not been assigned"), v7);
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v9);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    a4 = 0;
    goto LABEL_11;
  }
  if (a3 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a4)
      goto LABEL_11;
    v10 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromClass(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("\"%@\" is not a %@"), v7, v11);

    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  a4 = v8;
LABEL_11:

LABEL_12:
  return a4;
}

- (IOSurfaceRef)_surfaceForName:(int)a3 allowingAssociatedObject:(_QWORD *)a4 error:
{
  id v7;
  __CVBuffer *v8;
  __CVBuffer *v9;
  CFTypeID v10;
  IOSurfaceRef IOSurface;
  const __CFString *v12;
  void *v13;

  v7 = a2;
  if (!a1)
  {
    IOSurface = 0;
    goto LABEL_14;
  }
  -[VisionCoreNamedObjects _objectForName:requiredClass:error:](a1, v7, 0, a4);
  v8 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    goto LABEL_12;
  v10 = CFGetTypeID(v8);
  IOSurface = v9;
  if (v10 != IOSurfaceGetTypeID())
  {
    if (a3)
    {
      if (v10 == CVPixelBufferGetTypeID())
      {
        IOSurface = CVPixelBufferGetIOSurface(v9);
        if (IOSurface)
          goto LABEL_13;
      }
      if (!a4)
        goto LABEL_12;
      v12 = CFSTR("\"%@\" cannot provide an IOSurface");
    }
    else
    {
      if (!a4)
      {
LABEL_12:
        IOSurface = 0;
        goto LABEL_13;
      }
      v12 = CFSTR("\"%@\" is not an IOSurface");
    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", v12, v7);
    objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForUnavailableResourceWithLocalizedDescription:", v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
LABEL_13:

LABEL_14:
  return IOSurface;
}

- (BOOL)accessReadOnlyDataForName:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t (**v9)(id, void *, id *);
  void *v10;
  __IOSurface *v11;
  __IOSurface *v12;
  size_t AllocSize;
  void *v14;
  void *v15;
  _QWORD v17[4];
  uint64_t (**v18)(id, void *, id *);
  size_t v19;

  v8 = a3;
  v9 = (uint64_t (**)(id, void *, id *))a4;
  -[VisionCoreNamedObjects dataForName:error:](self, "dataForName:error:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    LOBYTE(a5) = v9[2](v9, v10, a5);
  }
  else
  {
    v11 = -[VisionCoreNamedObjects surfaceAssociatedWithName:error:](self, "surfaceAssociatedWithName:error:", v8, 0);
    if (v11)
    {
      v12 = v11;
      AllocSize = IOSurfaceGetAllocSize(v11);
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __90__VisionCoreNamedObjects_DataAccessUtilities__accessReadOnlyDataForName_usingBlock_error___block_invoke;
      v17[3] = &unk_24E1DB830;
      v19 = AllocSize;
      v18 = v9;
      v14 = (void *)MEMORY[0x2207A662C](v17);
      LOBYTE(a5) = VisionCorePerformWithLockedIOSurface(v12, 1u, v14, a5);

    }
    else if (a5)
    {
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Assigned object with name: %@ is either doesn't exist or                                                                exists but the type is neither NSData nor IOSurface"), v8);
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInternalErrorWithLocalizedDescription:", v15);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a5) = 0;
    }
  }

  return (char)a5;
}

- (BOOL)accessReadOnlyDataForNames:(id)a3 usingBlock:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __IOSurface *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *BaseAddress;
  void *v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t (**v30)(id, void *, id *);
  id v31;
  id v32;
  id obj;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  v30 = (uint64_t (**)(id, void *, id *))a4;
  v32 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v31, "count"));
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v31;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v7)
  {
    v34 = *(_QWORD *)v44;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v34)
        objc_enumerationMutation(obj);
      v9 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v8);
      v42 = 0;
      -[VisionCoreNamedObjects dataForName:error:](self, "dataForName:error:", v9, &v42);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v42;
      v12 = v11;
      if (v10)
      {
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v10, v9);
      }
      else
      {
        v41 = v11;
        v13 = -[VisionCoreNamedObjects surfaceAssociatedWithName:error:](self, "surfaceAssociatedWithName:error:", v9, &v41);
        v14 = v41;

        if (!v13)
        {
          if (a5)
          {
            v14 = objc_retainAutorelease(v14);
            *a5 = v14;
          }
          goto LABEL_18;
        }
        v15 = IOSurfaceLock(v13, 1u, 0);
        if ((_DWORD)v15)
        {
          if (a5)
          {
            v21 = objc_alloc(MEMORY[0x24BDD17C8]);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v15);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("Could not unlock IOSurfaceRef %p (%@)"), v13, v22);

            objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForKernelReturnCode:localizedDescription:", v15, v23);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

          }
LABEL_18:

          v20 = 0;
          goto LABEL_19;
        }
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = __91__VisionCoreNamedObjects_DataAccessUtilities__accessReadOnlyDataForNames_usingBlock_error___block_invoke;
        v40[3] = &__block_descriptor_40_e5_v8__0l;
        v40[4] = v13;
        v12 = (void *)MEMORY[0x2207A662C](v40);
        v16 = (void *)MEMORY[0x2207A662C]();
        objc_msgSend(v32, "addObject:", v16);

        v17 = objc_alloc(MEMORY[0x24BDBCE50]);
        BaseAddress = IOSurfaceGetBaseAddress(v13);
        v19 = (void *)objc_msgSend(v17, "initWithBytesNoCopy:length:freeWhenDone:", BaseAddress, IOSurfaceGetAllocSize(v13), 0);
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v19, v9);

      }
      if (v7 == ++v8)
      {
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  v20 = v30[2](v30, v35, a5);
LABEL_19:

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v24 = v32;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v37 != v26)
          objc_enumerationMutation(v24);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i) + 16))();
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
    }
    while (v25);
  }

  return v20;
}

void __91__VisionCoreNamedObjects_DataAccessUtilities__accessReadOnlyDataForNames_usingBlock_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = IOSurfaceUnlock(*(IOSurfaceRef *)(a1 + 32), 1u, 0);
  if ((_DWORD)v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    VisionCoreValidatedLog((uint64_t)v10, (uint64_t)CFSTR("Could not unlock IOSurfaceRef %p (%@)"), v4, v5, v6, v7, v8, v9, v3);

  }
}

uint64_t __90__VisionCoreNamedObjects_DataAccessUtilities__accessReadOnlyDataForName_usingBlock_error___block_invoke(uint64_t a1, __IOSurface *a2)
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", IOSurfaceGetBaseAddress(a2), *(_QWORD *)(a1 + 40), 0);
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v4;
}

@end
