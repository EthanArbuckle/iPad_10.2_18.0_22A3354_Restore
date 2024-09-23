@implementation VFXIESProfile

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_setName_(self, a2, 0, v2);

  sub_1B18D5448((void **)&self->_iesInfo);
  v4.receiver = self;
  v4.super_class = (Class)VFXIESProfile;
  -[VFXIESProfile dealloc](&v4, sel_dealloc);
}

+ (VFXIESProfile)profileWithURL:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if ((sub_1B18D4AD8(a3, (uint64_t)(v4 + 1), v5, v6) & 1) != 0)
  {
    v14 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v7, v8, v9);
    v4[14] = (id)objc_msgSend_UUIDString(v14, v15, v16, v17);
    return (VFXIESProfile *)v4;
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: failed to load ies from %@"), v8, v9, v10, v11, v12, v13, (uint64_t)a3);

    return 0;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t anglesHCount;
  size_t v6;
  void *v7;
  uint64_t anglesVCount;
  size_t v9;
  void *v10;
  uint64_t candalaValuesCount;
  size_t v12;
  void *v13;

  v4 = objc_alloc_init((Class)objc_opt_class());
  anglesHCount = self->_iesInfo.anglesHCount;
  if ((int)anglesHCount >= 1)
  {
    v6 = 4 * anglesHCount;
    v7 = malloc_type_malloc(4 * anglesHCount, 0x9A184B11uLL);
    v4[10] = v7;
    memcpy(v7, self->_iesInfo.anglesH, v6);
  }
  anglesVCount = self->_iesInfo.anglesVCount;
  if ((int)anglesVCount >= 1)
  {
    v9 = 4 * anglesVCount;
    v10 = malloc_type_malloc(4 * anglesVCount, 0x518CF102uLL);
    v4[11] = v10;
    memcpy(v10, self->_iesInfo.anglesV, v9);
  }
  candalaValuesCount = self->_iesInfo.candalaValuesCount;
  if ((int)candalaValuesCount >= 1)
  {
    v12 = 4 * candalaValuesCount;
    v13 = malloc_type_malloc(4 * candalaValuesCount, 0xDF688693uLL);
    v4[12] = v13;
    memcpy(v13, self->_iesInfo.candalaValues, v12);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t anglesHCount;
  uint64_t anglesVCount;
  size_t v7;
  _QWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  const char *v16;

  anglesHCount = self->_iesInfo.anglesHCount;
  anglesVCount = self->_iesInfo.anglesVCount;
  v7 = 4 * self->_iesInfo.candalaValuesCount;
  v8 = malloc_type_malloc(4 * anglesHCount + 4 * anglesVCount + v7 + 72, 0xB74C91B2uLL);
  *(_OWORD *)v8 = *(_OWORD *)&self->_iesInfo.totalLights;
  v9 = *(_OWORD *)&self->_iesInfo.anglesHCount;
  v10 = *(_OWORD *)&self->_iesInfo.length;
  v11 = *(_OWORD *)&self->_iesInfo.maxHAngle;
  v8[8] = *(_QWORD *)&self->_iesInfo.inputWatts;
  *((_OWORD *)v8 + 2) = v9;
  *((_OWORD *)v8 + 3) = v10;
  *((_OWORD *)v8 + 1) = v11;
  memcpy(v8 + 9, self->_iesInfo.anglesH, 4 * anglesHCount);
  memcpy((char *)v8 + 4 * anglesHCount + 72, self->_iesInfo.anglesV, 4 * anglesVCount);
  memcpy((char *)v8 + 4 * anglesHCount + 4 * anglesVCount + 72, self->_iesInfo.candalaValues, v7);
  v13 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v12, (uint64_t)v8, 4 * anglesHCount + 4 * anglesVCount + v7 + 72, 1);
  objc_msgSend_encodeObject_forKey_(a3, v14, v13, (uint64_t)CFSTR("iesData"));
  objc_msgSend_encodeObject_forKey_(a3, v15, (uint64_t)self->_name, (uint64_t)CFSTR("name"));
  objc_msgSend_encodeObject_forKey_(a3, v16, (uint64_t)self->_identifier, (uint64_t)CFSTR("identifier"));
}

- (VFXIESProfile)initWithCoder:(id)a3
{
  char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  size_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  size_t v41;
  char *v42;
  void *v43;
  char *v44;
  void *v45;
  void *v46;
  objc_super v48;

  v48.receiver = self;
  v48.super_class = (Class)VFXIESProfile;
  v4 = -[VFXIESProfile init](&v48, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("name"));
    objc_msgSend_setName_(v4, v8, v7, v9);
    v10 = objc_opt_class();
    *((_QWORD *)v4 + 14) = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, (uint64_t)CFSTR("name"));
    v12 = objc_opt_class();
    v14 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v13, v12, (uint64_t)CFSTR("iesData"));
    v18 = objc_msgSend_bytes(v14, v15, v16, v17);
    if ((unint64_t)objc_msgSend_length(v14, v19, v20, v21) >= 0x48)
    {
      v29 = *(_OWORD *)(v18 + 48);
      v30 = *(_QWORD *)(v18 + 64);
      v31 = *(_OWORD *)(v18 + 16);
      *(_OWORD *)(v4 + 40) = *(_OWORD *)(v18 + 32);
      *(_OWORD *)(v4 + 8) = *(_OWORD *)v18;
      *((_QWORD *)v4 + 9) = v30;
      *(_OWORD *)(v4 + 56) = v29;
      *(_OWORD *)(v4 + 24) = v31;
      v32 = *((int *)v4 + 11);
      v33 = 4 * *((int *)v4 + 10);
      v34 = *((int *)v4 + 12);
      if (v33 + 4 * v32 + 4 * v34 + 72 == objc_msgSend_length(v14, v22, v23, v24))
      {
        v41 = 4 * v34;
        v42 = (char *)(v18 + 72);
        v43 = malloc_type_malloc(v33, 0x258C5631uLL);
        *((_QWORD *)v4 + 10) = v43;
        memcpy(v43, v42, v33);
        v44 = &v42[v33];
        v45 = malloc_type_malloc(4 * v32, 0xE71EC9E4uLL);
        *((_QWORD *)v4 + 11) = v45;
        memcpy(v45, v44, 4 * v32);
        v46 = malloc_type_malloc(v41, 0x904F2763uLL);
        *((_QWORD *)v4 + 12) = v46;
        memcpy(v46, &v44[4 * v32], v41);
      }
      else
      {
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: ies corrupted data"), v35, v36, v37, v38, v39, v40, (uint64_t)v48.receiver);
      }
    }
    else
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: invalid IES data"), v23, v24, v25, v26, v27, v28, (uint64_t)v48.receiver);
      return 0;
    }
  }
  return (VFXIESProfile *)v4;
}

- (const)_infoHangle
{
  return &self->_iesInfo;
}

- (NSString)identifier
{
  return self->_identifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

@end
