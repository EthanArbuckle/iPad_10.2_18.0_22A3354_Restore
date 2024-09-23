@implementation VMUArchitecture

+ (void)initialize
{
  host_t v2;
  VMUArchitecture *v3;
  uint64_t v4;
  void *v5;
  VMUArchitecture *v6;
  void *v7;
  VMUArchitecture *v8;
  void *v9;
  VMUArchitecture *v10;
  void *v11;
  VMUArchitecture *v12;
  void *v13;
  VMUArchitecture *v14;
  void *v15;
  VMUArchitecture *v16;
  void *v17;
  mach_msg_type_number_t host_info_outCnt;
  integer_t host_info_out[4];
  __int128 v20;
  __int128 v21;

  if (!currentArchitecture)
  {
    v2 = MEMORY[0x1A85A9218](a1, a2);
    v20 = 0u;
    v21 = 0u;
    *(_OWORD *)host_info_out = 0u;
    host_info_outCnt = 12;
    if (!host_info(v2, 1, host_info_out, &host_info_outCnt))
    {
      v3 = [VMUArchitecture alloc];
      v4 = -[VMUArchitecture initWithCpuType:cpuSubtype:](v3, "initWithCpuType:cpuSubtype:", host_info_out[3], v20);
      v5 = (void *)currentArchitecture;
      currentArchitecture = v4;

    }
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], v2);
    v6 = -[VMUArchitecture initWithCpuType:cpuSubtype:]([VMUArchitecture alloc], "initWithCpuType:cpuSubtype:", 18, 0);
    v7 = (void *)ppc32Architecture;
    ppc32Architecture = (uint64_t)v6;

    v8 = -[VMUArchitecture initWithCpuType:cpuSubtype:]([VMUArchitecture alloc], "initWithCpuType:cpuSubtype:", 16777234, 0);
    v9 = (void *)ppc64Architecture;
    ppc64Architecture = (uint64_t)v8;

    v10 = -[VMUArchitecture initWithCpuType:cpuSubtype:]([VMUArchitecture alloc], "initWithCpuType:cpuSubtype:", 7, 3);
    v11 = (void *)x86_32Architecture;
    x86_32Architecture = (uint64_t)v10;

    v12 = -[VMUArchitecture initWithCpuType:cpuSubtype:]([VMUArchitecture alloc], "initWithCpuType:cpuSubtype:", 16777223, 3);
    v13 = (void *)x86_64Architecture;
    x86_64Architecture = (uint64_t)v12;

    v14 = -[VMUArchitecture initWithCpuType:cpuSubtype:]([VMUArchitecture alloc], "initWithCpuType:cpuSubtype:", 12, 0);
    v15 = (void *)armArchitecture;
    armArchitecture = (uint64_t)v14;

    v16 = -[VMUArchitecture initWithCpuType:cpuSubtype:]([VMUArchitecture alloc], "initWithCpuType:cpuSubtype:", 0xFFFFFFFFLL, 0);
    v17 = (void *)anyArchitecture;
    anyArchitecture = (uint64_t)v16;

  }
}

+ (id)currentArchitecture
{
  return (id)currentArchitecture;
}

+ (id)anyArchitecture
{
  return (id)anyArchitecture;
}

+ (id)ppcArchitecture
{
  return (id)ppc32Architecture;
}

+ (id)ppc32Architecture
{
  return (id)ppc32Architecture;
}

+ (id)ppc64Architecture
{
  return (id)ppc64Architecture;
}

+ (id)i386Architecture
{
  return (id)x86_32Architecture;
}

+ (id)x86_32Architecture
{
  return (id)x86_32Architecture;
}

+ (id)x86_64Architecture
{
  return (id)x86_64Architecture;
}

+ (id)armArchitecture
{
  return (id)armArchitecture;
}

+ (id)architectureWithCpuType:(int)a3 cpuSubtype:(int)a4
{
  return -[VMUArchitecture initWithCpuType:cpuSubtype:]([VMUArchitecture alloc], "initWithCpuType:cpuSubtype:", *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (VMUArchitecture)initWithCpuType:(int)a3 cpuSubtype:(int)a4
{
  VMUArchitecture *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VMUArchitecture;
  result = -[VMUArchitecture init](&v7, sel_init);
  if (result)
  {
    result->_cpuType = a3;
    result->_cpuSubtype = a4;
  }
  return result;
}

- (VMUArchitecture)initWithCoder:(id)a3
{
  id v4;
  VMUArchitecture *v5;
  VMUArchitecture *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VMUArchitecture;
  v5 = -[VMUArchitecture init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v4, "decodeValueOfObjCType:at:size:", "i", &v5->_cpuType, 4);
    objc_msgSend(v4, "decodeValueOfObjCType:at:size:", "i", &v6->_cpuSubtype, 4);
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int *p_cpuType;
  id v5;

  p_cpuType = &self->_cpuType;
  v5 = a3;
  objc_msgSend(v5, "encodeValueOfObjCType:at:", "i", p_cpuType);
  objc_msgSend(v5, "encodeValueOfObjCType:at:", "i", &self->_cpuSubtype);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[VMUArchitecture initWithCpuType:cpuSubtype:](+[VMUArchitecture allocWithZone:](VMUArchitecture, "allocWithZone:", a3), "initWithCpuType:cpuSubtype:", self->_cpuType, self->_cpuSubtype);
}

- (BOOL)isBigEndian
{
  return !-[VMUArchitecture isLittleEndian](self, "isLittleEndian");
}

- (BOOL)isLittleEndian
{
  uint64_t cpuType;
  int v3;
  void *v5;
  void *v6;
  id v7;

  cpuType = self->_cpuType;
  v3 = cpuType & 0xFFFFFF;
  if ((cpuType & 0xFFFFFF) == 7)
    return 1;
  if (v3 != 18)
  {
    if (v3 != 12)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot answer isLittleEndian for cpuType is %d cpuSubtype is %d"), cpuType, self->_cpuSubtype, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", CFSTR("VMUArchitecture unhandled cpuType"), v6, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v7);
    }
    return 1;
  }
  return 0;
}

- (BOOL)is32Bit
{
  return !-[VMUArchitecture is64Bit](self, "is64Bit");
}

- (BOOL)is64Bit
{
  uint64_t cpuType;
  void *v4;
  void *v5;
  id v6;

  cpuType = self->_cpuType;
  if ((cpuType & 0xFF000000) == 0)
    return 0;
  if ((cpuType & 0xFF000000) != 0x1000000)
  {
    v4 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot answer is64Bit for cpuType is %d cpuSubtype is %d"), cpuType, self->_cpuSubtype, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "exceptionWithName:reason:userInfo:", CFSTR("VMUArchitecture unhandled cpuType"), v5, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v6);
  }
  return 1;
}

- (BOOL)isEqualToArchitecture:(id)a3
{
  id v4;
  int cpuType;
  int cpuSubtype;
  BOOL v7;

  v4 = a3;
  cpuType = self->_cpuType;
  if (cpuType == objc_msgSend(v4, "cpuType"))
  {
    cpuSubtype = self->_cpuSubtype;
    v7 = cpuSubtype == objc_msgSend(v4, "cpuSubtype");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[VMUArchitecture isEqualToArchitecture:](self, "isEqualToArchitecture:", v4);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VMUArchitecture;
    v5 = -[VMUArchitecture isEqual:](&v8, sel_isEqual_, v4);
  }
  v6 = v5;

  return v6;
}

- (unint64_t)hash
{
  return self->_cpuSubtype ^ self->_cpuType;
}

- (BOOL)matchesArchitecture:(id)a3
{
  id v4;
  void *v5;
  int cpuType;
  int v7;
  BOOL v8;
  int cpuSubtype;

  v4 = a3;
  v5 = v4;
  if (self->_cpuType == -1 || objc_msgSend(v4, "cpuType") == -1)
    goto LABEL_14;
  cpuType = self->_cpuType;
  if (cpuType == objc_msgSend(v5, "cpuType"))
  {
    v7 = self->_cpuType & 0xFFFFFF;
    if (v7 == 18 || v7 == 12)
    {
      if ((self->_cpuSubtype & 0xFFFFFF) == 0 || (objc_msgSend(v5, "cpuSubtype") & 0xFFFFFF) == 0)
        goto LABEL_14;
    }
    else if (v7 == 7 && ((self->_cpuSubtype & 0xFFFFFF) == 3 || (objc_msgSend(v5, "cpuSubtype") & 0xFFFFFF) == 3))
    {
LABEL_14:
      v8 = 1;
      goto LABEL_15;
    }
    cpuSubtype = self->_cpuSubtype;
    v8 = cpuSubtype == objc_msgSend(v5, "cpuSubtype");
  }
  else
  {
    v8 = 0;
  }
LABEL_15:

  return v8;
}

- (int)cpuType
{
  return self->_cpuType;
}

- (int)cpuSubtype
{
  return self->_cpuSubtype;
}

- (id)description
{
  void *v3;
  uint64_t cpuType;
  uint64_t cpuSubtype;
  const __CFString *v6;
  _BOOL4 v7;
  const __CFString *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  cpuType = self->_cpuType;
  cpuSubtype = self->_cpuSubtype;
  if (-[VMUArchitecture is32Bit](self, "is32Bit"))
    v6 = CFSTR("32b");
  else
    v6 = CFSTR("64b");
  v7 = -[VMUArchitecture isBigEndian](self, "isBigEndian");
  v8 = CFSTR("LittleEndian");
  if (v7)
    v8 = CFSTR("BigEndian");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<VMUArchitecture: %p> 0x%x,0x%x %@ - %@"), self, cpuType, cpuSubtype, v6, v8, 0);
}

@end
