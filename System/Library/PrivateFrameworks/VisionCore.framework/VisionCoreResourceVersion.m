@implementation VisionCoreResourceVersion

- (VisionCoreResourceVersion)initWithMajor:(unsigned int)a3 minor:(unsigned int)a4 micro:(unsigned int)a5
{
  VisionCoreResourceVersion *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VisionCoreResourceVersion;
  result = -[VisionCoreResourceVersion init](&v9, sel_init);
  if (result)
  {
    result->_major = a3;
    result->_minor = a4;
    result->_micro = a5;
  }
  return result;
}

- (VisionCoreResourceVersion)initWithMajor:(unsigned int)a3
{
  return -[VisionCoreResourceVersion initWithMajor:minor:micro:](self, "initWithMajor:minor:micro:", *(_QWORD *)&a3, 0, 0);
}

- (VisionCoreResourceVersion)initWithMajor:(unsigned int)a3 minor:(unsigned int)a4
{
  return -[VisionCoreResourceVersion initWithMajor:minor:micro:](self, "initWithMajor:minor:micro:", *(_QWORD *)&a3, *(_QWORD *)&a4, 0);
}

- (BOOL)isValid
{
  void *v3;

  +[VisionCoreResourceVersion invalidVersion](VisionCoreResourceVersion, "invalidVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[VisionCoreResourceVersion isEqual:](self, "isEqual:", v3);

  return (char)self;
}

- (NSString)stringRepresentation
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%u.%u.%u"), -[VisionCoreResourceVersion major](self, "major"), -[VisionCoreResourceVersion minor](self, "minor"), -[VisionCoreResourceVersion micro](self, "micro"));
}

- (BOOL)isEqualToResourceVersion:(id)a3
{
  VisionCoreResourceVersion *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  BOOL v8;

  v4 = (VisionCoreResourceVersion *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v5 = -[VisionCoreResourceVersion major](self, "major");
    if (v5 == -[VisionCoreResourceVersion major](v4, "major")
      && (v6 = -[VisionCoreResourceVersion minor](self, "minor"), v6 == -[VisionCoreResourceVersion minor](v4, "minor")))
    {
      v7 = -[VisionCoreResourceVersion micro](self, "micro");
      v8 = v7 == -[VisionCoreResourceVersion micro](v4, "micro");
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (int64_t)compare:(id)a3
{
  VisionCoreResourceVersion *v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int64_t v9;
  unsigned int v11;
  unsigned int v12;

  v4 = (VisionCoreResourceVersion *)a3;
  if (self == v4)
  {
    v9 = 0;
    goto LABEL_10;
  }
  v5 = -[VisionCoreResourceVersion major](self, "major");
  v6 = -[VisionCoreResourceVersion major](v4, "major");
  if (v5 < v6)
    goto LABEL_5;
  if (v5 > v6)
    goto LABEL_9;
  v7 = -[VisionCoreResourceVersion minor](self, "minor");
  v8 = -[VisionCoreResourceVersion minor](v4, "minor");
  if (v7 < v8)
  {
LABEL_5:
    v9 = -1;
    goto LABEL_10;
  }
  if (v7 > v8)
  {
LABEL_9:
    v9 = 1;
    goto LABEL_10;
  }
  v11 = -[VisionCoreResourceVersion micro](self, "micro");
  v12 = -[VisionCoreResourceVersion micro](v4, "micro");
  if (v11 < v12)
    v9 = -1;
  else
    v9 = v11 > v12;
LABEL_10:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  v3 = -[VisionCoreResourceVersion major](self, "major");
  v4 = ((unint64_t)-[VisionCoreResourceVersion minor](self, "minor") << 16) | (v3 << 32);
  return v4 | -[VisionCoreResourceVersion micro](self, "micro");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[VisionCoreResourceVersion isEqualToResourceVersion:](self, "isEqualToResourceVersion:", v4);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _DWORD v5[3];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5[0] = -[VisionCoreResourceVersion major](self, "major");
  v5[1] = -[VisionCoreResourceVersion minor](self, "minor");
  v5[2] = -[VisionCoreResourceVersion micro](self, "micro");
  objc_msgSend(v4, "encodeArrayOfObjCType:count:at:", "I", 3, v5);

}

- (VisionCoreResourceVersion)initWithCoder:(id)a3
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  v5 = 0;
  objc_msgSend(a3, "decodeArrayOfObjCType:count:at:", "I", 3, &v5);
  return -[VisionCoreResourceVersion initWithMajor:minor:micro:](self, "initWithMajor:minor:micro:", v5, HIDWORD(v5), v6);
}

- (unsigned)major
{
  return self->_major;
}

- (unsigned)minor
{
  return self->_minor;
}

- (unsigned)micro
{
  return self->_micro;
}

+ (id)invalidVersion
{
  if (invalidVersion_onceToken != -1)
    dispatch_once(&invalidVersion_onceToken, &__block_literal_global_69);
  return (id)invalidVersion_invalidVersion;
}

+ (id)versionForStringRepresentation:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v4 = (objc_class *)MEMORY[0x24BDD17A8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithString:", v5);

  v12 = 0;
  v13 = 0;
  v11 = 0;
  v7 = 0;
  if (objc_msgSend(v6, "scanInteger:", &v13))
    v8 = HIDWORD(v13) == 0;
  else
    v8 = 0;
  if (v8)
  {
    if ((objc_msgSend(v6, "isAtEnd") & 1) == 0)
    {
      v7 = 0;
      if (!objc_msgSend(v6, "scanString:intoString:", CFSTR("."), 0))
        goto LABEL_17;
      v7 = 0;
      if (!objc_msgSend(v6, "scanInteger:", &v12) || HIDWORD(v12))
        goto LABEL_17;
      if ((objc_msgSend(v6, "isAtEnd") & 1) == 0)
      {
        v7 = 0;
        if (!objc_msgSend(v6, "scanString:intoString:", CFSTR("."), 0))
          goto LABEL_17;
        v7 = 0;
        if (!objc_msgSend(v6, "scanInteger:", &v11) || HIDWORD(v11))
          goto LABEL_17;
        if (!objc_msgSend(v6, "isAtEnd"))
        {
          v7 = 0;
          goto LABEL_17;
        }
      }
    }
    v9 = objc_alloc((Class)a1);
    v7 = (void *)objc_msgSend(v9, "initWithMajor:minor:micro:", v13, v12, v11);
  }
LABEL_17:

  return v7;
}

+ (id)newerFirstComparator
{
  return &__block_literal_global_7;
}

+ (id)olderFirstComparator
{
  return &__block_literal_global_8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __49__VisionCoreResourceVersion_olderFirstComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __49__VisionCoreResourceVersion_newerFirstComparator__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void __43__VisionCoreResourceVersion_invalidVersion__block_invoke()
{
  VisionCoreResourceVersion *v0;
  void *v1;

  v0 = -[VisionCoreResourceVersion initWithMajor:minor:micro:]([VisionCoreResourceVersion alloc], "initWithMajor:minor:micro:", 0, 0, 0);
  v1 = (void *)invalidVersion_invalidVersion;
  invalidVersion_invalidVersion = (uint64_t)v0;

}

@end
