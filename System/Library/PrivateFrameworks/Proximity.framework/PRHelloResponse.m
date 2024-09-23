@implementation PRHelloResponse

- (PRHelloResponse)initWithRoseFirmwareVersion:(id)a3 hsiVersionMajor:(unsigned __int8)a4 hsiVersionMinor:(unsigned __int8)a5 hardwareVersion:(unint64_t)a6
{
  id v11;
  PRHelloResponse *v12;
  PRHelloResponse *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PRHelloResponse;
  v12 = -[PRHelloResponse init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_roseFirmwareVersion, a3);
    v13->_hsiVersionMajor = a4;
    v13->_hsiVersionMinor = a5;
    v13->_hardwareVersion = a6;
  }

  return v13;
}

- (PRHelloResponse)initWithHelloResponse:(const void *)a3
{
  PRHelloResponse *v4;
  void *v5;
  std::string *p_p;
  uint64_t v7;
  NSString *roseFirmwareVersion;
  uint64_t v9;
  uint64_t v10;
  NSNumber *addlInfoSize;
  uint64_t v12;
  NSNumber *apFirmwareVersion;
  uint64_t v14;
  NSNumber *dspFirmwareVersion;
  std::string::size_type p_size;
  uint64_t v17;
  NSString *target;
  uint64_t v19;
  NSNumber *calDataVersion;
  uint64_t v21;
  NSNumber *moduleID;
  uint64_t v23;
  NSNumber *modemInitVersion;
  std::string *v25;
  uint64_t v26;
  NSString *extraBytes;
  uint64_t v28;
  NSNumber *boardID;
  std::string __p;
  uint64_t v32;
  uint64_t v33;
  std::string v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)PRHelloResponse;
  v4 = -[PRHelloResponse init](&v35, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    if (*((char *)a3 + 23) < 0)
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
    else
      __p = *(std::string *)a3;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    objc_msgSend(v5, "stringWithUTF8String:", p_p, __p.__r_.__value_.__r.__words[0]);
    v7 = objc_claimAutoreleasedReturnValue();
    roseFirmwareVersion = v4->_roseFirmwareVersion;
    v4->_roseFirmwareVersion = (NSString *)v7;

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v4->_hsiVersionMajor = *((_BYTE *)a3 + 24);
    v4->_hsiVersionMinor = *((_BYTE *)a3 + 25);
    if (*((unsigned __int16 *)a3 + 13) >= 7u)
      v9 = 7;
    else
      v9 = *((unsigned __int16 *)a3 + 13);
    v4->_hardwareVersion = v9;
    if (*((_BYTE *)a3 + 96))
    {
      LODWORD(__p.__r_.__value_.__l.__data_) = *((_DWORD *)a3 + 8);
      WORD2(__p.__r_.__value_.__r.__words[0]) = *((_WORD *)a3 + 18);
      if (*((char *)a3 + 63) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)&__p.__r_.__value_.__r.__words[1], *((const std::string::value_type **)a3 + 5), *((_QWORD *)a3 + 6));
      }
      else
      {
        *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = *(_OWORD *)((char *)a3 + 40);
        v32 = *((_QWORD *)a3 + 7);
      }
      v33 = *((_QWORD *)a3 + 8);
      if (*((char *)a3 + 95) < 0)
        std::string::__init_copy_ctor_external(&v34, *((const std::string::value_type **)a3 + 9), *((_QWORD *)a3 + 10));
      else
        v34 = *(std::string *)((_BYTE *)a3 + 3);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", __p.__r_.__value_.__s.__data_[0], __p.__r_.__value_.__r.__words[0]);
      v10 = objc_claimAutoreleasedReturnValue();
      addlInfoSize = v4->_addlInfoSize;
      v4->_addlInfoSize = (NSNumber *)v10;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)&__p.__r_.__value_.__s.__data_[2]);
      v12 = objc_claimAutoreleasedReturnValue();
      apFirmwareVersion = v4->_apFirmwareVersion;
      v4->_apFirmwareVersion = (NSNumber *)v12;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", WORD2(__p.__r_.__value_.__r.__words[0]));
      v14 = objc_claimAutoreleasedReturnValue();
      dspFirmwareVersion = v4->_dspFirmwareVersion;
      v4->_dspFirmwareVersion = (NSNumber *)v14;

      if (v32 >= 0)
        p_size = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
      else
        p_size = __p.__r_.__value_.__l.__size_;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_size);
      v17 = objc_claimAutoreleasedReturnValue();
      target = v4->_target;
      v4->_target = (NSString *)v17;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", (unsigned __int16)v33);
      v19 = objc_claimAutoreleasedReturnValue();
      calDataVersion = v4->_calDataVersion;
      v4->_calDataVersion = (NSNumber *)v19;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", BYTE2(v33));
      v21 = objc_claimAutoreleasedReturnValue();
      moduleID = v4->_moduleID;
      v4->_moduleID = (NSNumber *)v21;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", HIDWORD(v33));
      v23 = objc_claimAutoreleasedReturnValue();
      modemInitVersion = v4->_modemInitVersion;
      v4->_modemInitVersion = (NSNumber *)v23;

      if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v25 = &v34;
      else
        v25 = (std::string *)v34.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v25);
      v26 = objc_claimAutoreleasedReturnValue();
      extraBytes = v4->_extraBytes;
      v4->_extraBytes = (NSString *)v26;

      if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v34.__r_.__value_.__l.__data_);
      if (SHIBYTE(v32) < 0)
        operator delete((void *)__p.__r_.__value_.__l.__size_);
    }
    if ((*((_QWORD *)a3 + 13) & 0xFF00000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
      v28 = objc_claimAutoreleasedReturnValue();
      boardID = v4->_boardID;
      v4->_boardID = (NSNumber *)v28;

    }
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRHelloResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PRHelloResponse *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roseFirmwareVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PRHelloResponse initWithRoseFirmwareVersion:hsiVersionMajor:hsiVersionMinor:hardwareVersion:](self, "initWithRoseFirmwareVersion:hsiVersionMajor:hsiVersionMinor:hardwareVersion:", v5, objc_msgSend(v4, "decodeIntForKey:", CFSTR("hsiVersionMajor")), objc_msgSend(v4, "decodeIntForKey:", CFSTR("hsiVersionMinor")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("roseHardwareVersion")));

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("addlInfoSize"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRHelloResponse setAddlInfoSize:](v6, "setAddlInfoSize:", v7);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("apFirmwareVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRHelloResponse setApFirmwareVersion:](v6, "setApFirmwareVersion:", v8);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dspFirmwareVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRHelloResponse setDspFirmwareVersion:](v6, "setDspFirmwareVersion:", v9);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("target"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRHelloResponse setTarget:](v6, "setTarget:", v10);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("calDataVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRHelloResponse setCalDataVersion:](v6, "setCalDataVersion:", v11);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("moduleID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRHelloResponse setModuleID:](v6, "setModuleID:", v12);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modemInitVersion"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRHelloResponse setModemInitVersion:](v6, "setModemInitVersion:", v13);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("boardID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRHelloResponse setBoardID:](v6, "setBoardID:", v14);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extraBytes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRHelloResponse setExtraBytes:](v6, "setExtraBytes:", v15);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_roseFirmwareVersion, CFSTR("roseFirmwareVersion"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_hsiVersionMajor, CFSTR("hsiVersionMajor"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_hsiVersionMinor, CFSTR("hsiVersionMinor"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_hardwareVersion, CFSTR("roseHardwareVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_addlInfoSize, CFSTR("addlInfoSize"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_apFirmwareVersion, CFSTR("apFirmwareVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dspFirmwareVersion, CFSTR("dspFirmwareVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_target, CFSTR("target"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_calDataVersion, CFSTR("calDataVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_moduleID, CFSTR("moduleID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_modemInitVersion, CFSTR("modemInitVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_boardID, CFSTR("boardID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_extraBytes, CFSTR("extraBytes"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PRHelloResponse *v4;

  v4 = -[PRHelloResponse initWithRoseFirmwareVersion:hsiVersionMajor:hsiVersionMinor:hardwareVersion:]([PRHelloResponse alloc], "initWithRoseFirmwareVersion:hsiVersionMajor:hsiVersionMinor:hardwareVersion:", self->_roseFirmwareVersion, self->_hsiVersionMajor, self->_hsiVersionMinor, self->_hardwareVersion);
  -[PRHelloResponse setAddlInfoSize:](v4, "setAddlInfoSize:", self->_addlInfoSize);
  -[PRHelloResponse setApFirmwareVersion:](v4, "setApFirmwareVersion:", self->_apFirmwareVersion);
  -[PRHelloResponse setDspFirmwareVersion:](v4, "setDspFirmwareVersion:", self->_dspFirmwareVersion);
  -[PRHelloResponse setTarget:](v4, "setTarget:", self->_target);
  -[PRHelloResponse setCalDataVersion:](v4, "setCalDataVersion:", self->_calDataVersion);
  -[PRHelloResponse setModuleID:](v4, "setModuleID:", self->_moduleID);
  -[PRHelloResponse setModemInitVersion:](v4, "setModemInitVersion:", self->_modemInitVersion);
  -[PRHelloResponse setBoardID:](v4, "setBoardID:", self->_boardID);
  -[PRHelloResponse setExtraBytes:](v4, "setExtraBytes:", self->_extraBytes);
  return v4;
}

- (id)description
{
  NSUInteger v3;
  uint64_t hsiVersionMajor;
  uint64_t hsiVersionMinor;
  NSString *roseFirmwareVersion;
  unint64_t hardwareVersion;
  NSNumber *addlInfoSize;
  NSNumber *apFirmwareVersion;
  NSNumber *dspFirmwareVersion;
  NSString *target;
  NSNumber *moduleID;
  NSNumber *calDataVersion;
  uint64_t v15;

  v3 = -[NSString length](self->_extraBytes, "length");
  hsiVersionMajor = self->_hsiVersionMajor;
  hsiVersionMinor = self->_hsiVersionMinor;
  roseFirmwareVersion = self->_roseFirmwareVersion;
  hardwareVersion = self->_hardwareVersion;
  addlInfoSize = self->_addlInfoSize;
  apFirmwareVersion = self->_apFirmwareVersion;
  dspFirmwareVersion = self->_dspFirmwareVersion;
  target = self->_target;
  calDataVersion = self->_calDataVersion;
  moduleID = self->_moduleID;
  if (v3)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rose FW Version: %@, HSI Major: %d, HSI Minor: %d, Rose HW Version: %lu, Additional Info Size: %@, AP FW Version: %@, DSP FW Version: %@, Target: %@, Cal Data Version: %@, Module ID: %@, Modem Init Version: %@, Board ID: %@, Extra Bytes: %@"), roseFirmwareVersion, hsiVersionMajor, hsiVersionMinor, hardwareVersion, addlInfoSize, apFirmwareVersion, dspFirmwareVersion, target, calDataVersion, moduleID, self->_modemInitVersion, self->_boardID, self->_extraBytes);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rose FW Version: %@, HSI Major: %d, HSI Minor: %d, Rose HW Version: %lu, Additional Info Size: %@, AP FW Version: %@, DSP FW Version: %@, Target: %@, Cal Data Version: %@, Module ID: %@, Modem Init Version: %@, Board ID: %@"), roseFirmwareVersion, hsiVersionMajor, hsiVersionMinor, hardwareVersion, addlInfoSize, apFirmwareVersion, dspFirmwareVersion, target, calDataVersion, moduleID, self->_boardID, self->_modemInitVersion, v15);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "roseFirmwareVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRHelloResponse roseFirmwareVersion](self, "roseFirmwareVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v6, "isEqual:", v7)
      || (v8 = objc_msgSend(v5, "hsiVersionMajor"), v8 != -[PRHelloResponse hsiVersionMajor](self, "hsiVersionMajor"))
      || (v9 = objc_msgSend(v5, "hsiVersionMinor"), v9 != -[PRHelloResponse hsiVersionMinor](self, "hsiVersionMinor"))
      || (v10 = objc_msgSend(v5, "hardwareVersion"), v10 != -[PRHelloResponse hardwareVersion](self, "hardwareVersion")))
    {
      v16 = 0;
LABEL_19:

      goto LABEL_20;
    }
    objc_msgSend(v5, "addlInfoSize");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRHelloResponse addlInfoSize](self, "addlInfoSize");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqual:", v12))
    {
      v16 = 0;
LABEL_44:

      goto LABEL_19;
    }
    objc_msgSend(v5, "apFirmwareVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRHelloResponse apFirmwareVersion](self, "apFirmwareVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "isEqual:", v14))
    {
      v16 = 0;
LABEL_43:

      goto LABEL_44;
    }
    objc_msgSend(v5, "dspFirmwareVersion");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRHelloResponse dspFirmwareVersion](self, "dspFirmwareVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v36, "isEqual:", v15))
    {
      v16 = 0;
LABEL_42:

      goto LABEL_43;
    }
    objc_msgSend(v5, "target");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRHelloResponse target](self, "target");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v35, "isEqual:"))
    {
      v16 = 0;
LABEL_41:

      goto LABEL_42;
    }
    objc_msgSend(v5, "calDataVersion");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRHelloResponse calDataVersion](self, "calDataVersion");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v33, "isEqual:"))
    {
      v16 = 0;
LABEL_40:

      goto LABEL_41;
    }
    objc_msgSend(v5, "moduleID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRHelloResponse moduleID](self, "moduleID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v31, "isEqual:"))
    {
      v16 = 0;
LABEL_39:

      goto LABEL_40;
    }
    objc_msgSend(v5, "modemInitVersion");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRHelloResponse modemInitVersion](self, "modemInitVersion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v29, "isEqual:"))
    {
      v16 = 0;
LABEL_38:

      goto LABEL_39;
    }
    objc_msgSend(v5, "boardID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27
      || (-[PRHelloResponse boardID](self, "boardID"), (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v5, "boardID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRHelloResponse boardID](self, "boardID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v26, "isEqual:", v25))
      {
        v16 = 0;
        goto LABEL_34;
      }
      v23 = 1;
    }
    else
    {
      v20 = 0;
      v23 = 0;
    }
    objc_msgSend(v5, "extraBytes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 || (-[PRHelloResponse extraBytes](self, "extraBytes"), (v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v5, "extraBytes", v18, v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PRHelloResponse extraBytes](self, "extraBytes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v24, "isEqual:", v21);

      if (v22)
      {

        if (!v23)
        {
LABEL_35:
          if (!v27)

          goto LABEL_38;
        }
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {
      v19 = 0;
      v16 = 1;
    }

    if ((v23 & 1) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
  v16 = 0;
LABEL_20:

  return v16;
}

- (NSString)roseFirmwareVersion
{
  return self->_roseFirmwareVersion;
}

- (unsigned)hsiVersionMajor
{
  return self->_hsiVersionMajor;
}

- (unsigned)hsiVersionMinor
{
  return self->_hsiVersionMinor;
}

- (unint64_t)hardwareVersion
{
  return self->_hardwareVersion;
}

- (NSNumber)addlInfoSize
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAddlInfoSize:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSNumber)apFirmwareVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setApFirmwareVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSNumber)dspFirmwareVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDspFirmwareVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)target
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTarget:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSNumber)calDataVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCalDataVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSNumber)moduleID
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setModuleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSNumber)modemInitVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (void)setModemInitVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSNumber)boardID
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBoardID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSString)extraBytes
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setExtraBytes:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraBytes, 0);
  objc_storeStrong((id *)&self->_boardID, 0);
  objc_storeStrong((id *)&self->_modemInitVersion, 0);
  objc_storeStrong((id *)&self->_moduleID, 0);
  objc_storeStrong((id *)&self->_calDataVersion, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_dspFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_apFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_addlInfoSize, 0);
  objc_storeStrong((id *)&self->_roseFirmwareVersion, 0);
}

@end
