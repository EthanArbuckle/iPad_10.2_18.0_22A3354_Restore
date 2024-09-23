@implementation VisionCoreMutableNamedObjects

- (VisionCoreMutableNamedObjects)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  VisionCoreMutableNamedObjects *v7;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = (id)objc_msgSend(v4, "mutableCopy");

  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  }
  v7 = -[VisionCoreNamedObjects _initWithRetainedDictionary:](self, "_initWithRetainedDictionary:", v6);

  return v7;
}

- (VisionCoreMutableNamedObjects)initWithCapacity:(unint64_t)a3
{
  void *v4;
  VisionCoreMutableNamedObjects *v5;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", a3);
  v5 = -[VisionCoreNamedObjects _initWithRetainedDictionary:](self, "_initWithRetainedDictionary:", v4);

  return v5;
}

- (BOOL)assignSurface:(__IOSurface *)a3 toName:(id)a4 error:(id *)a5
{
  return -[VisionCoreMutableNamedObjects _assignObject:ofKind:toName:error:]((uint64_t)self, a3, CFSTR("IOSurfaceRef"), a4, a5);
}

- (BOOL)assignPixelBuffer:(__CVBuffer *)a3 toName:(id)a4 error:(id *)a5
{
  return -[VisionCoreMutableNamedObjects _assignObject:ofKind:toName:error:]((uint64_t)self, a3, CFSTR("CVPixelBufferRef"), a4, a5);
}

- (BOOL)assignData:(id)a3 toName:(id)a4 error:(id *)a5
{
  return -[VisionCoreMutableNamedObjects _assignObject:ofKind:toName:error:]((uint64_t)self, a3, CFSTR("NSData"), a4, a5);
}

- (BOOL)assignObject:(id)a3 toName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  objc_class *Class;
  void *v11;

  v8 = a4;
  v9 = a3;
  Class = object_getClass(v9);
  NSStringFromClass(Class);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = -[VisionCoreMutableNamedObjects _assignObject:ofKind:toName:error:]((uint64_t)self, v9, v11, v8, a5);

  return (char)a5;
}

- (void)removeAssignmentForName:(id)a3
{
  -[NSDictionary removeObjectForKey:](self->super._objects, "removeObjectForKey:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[VisionCoreNamedObjects initWithDictionary:]([VisionCoreNamedObjects alloc], "initWithDictionary:", self->super._objects);
}

- (uint64_t)_assignObject:(void *)a3 ofKind:(void *)a4 toName:(_QWORD *)a5 error:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        if (a5)
        {
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("\"%@\" has already been assigned %@"), v11, v9);
          objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", v13);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        a1 = 0;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 8), "setObject:forKey:", v9, v11);
        a1 = 1;
      }
    }
    else
    {
      if (!a5)
      {
        a1 = 0;
        goto LABEL_11;
      }
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@ cannot be nil"), v10);
      objc_msgSend(MEMORY[0x24BDD1540], "VisionCoreErrorForInvalidArgumentWithLocalizedDescription:", v12);
      a1 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
LABEL_11:

  return a1;
}

@end
