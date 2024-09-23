@implementation VFXFileAsset

- (VFXFileAsset)initWithFileNamed:(id)a3 entityObject:(id)a4
{
  VFXFileAsset *v5;
  NSString *v6;
  const char *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VFXFileAsset;
  v5 = -[VFXCoreAsset initWithEntityObject:](&v10, sel_initWithEntityObject_, a4);
  if (v5)
  {
    v6 = (NSString *)a3;
    v5->_filename = v6;
    objc_msgSend_setName_(v5, v7, (uint64_t)v6, v8);
  }
  return v5;
}

- (NSString)filename
{
  return self->_filename;
}

- (id)absolutePath
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_entityObject(self, a2, v2, v3);
  return (id)MEMORY[0x1E0DE7D20](v4, sel_textureAbsolutePath, v5, v6);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXFileAsset;
  -[VFXCoreAsset dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VFXFileAsset;
  v4 = -[VFXCoreAsset copyWithZone:](&v9, sel_copyWithZone_, a3);

  v4[7] = (id)objc_msgSend_filename(self, v5, v6, v7);
  return v4;
}

- (id)copyWithFilename:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;

  v5 = objc_msgSend_copy(self, a2, (uint64_t)a3, v3);
  v6 = (_QWORD *)v5;
  if (v5)
  {

    v6[7] = a3;
  }
  return v6;
}

- (VFXFileAsset)initWithCoder:(id)a3
{
  VFXFileAsset *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *PathComponent;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VFXFileAsset;
  v4 = -[VFXCoreAsset initWithCoder:](&v19, sel_initWithCoder_);
  if (v4)
  {
    v5 = objc_opt_class();
    v7 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("filename"));
    if (v7)
    {
      v8 = v7;
    }
    else
    {
      v9 = objc_opt_class();
      v11 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v10, v9, (uint64_t)CFSTR("path"));
      if (v11)
      {
        PathComponent = v11;
        if (objc_msgSend_hasPrefix_(v11, v12, (uint64_t)CFSTR("/"), v13))
          PathComponent = (void *)objc_msgSend_lastPathComponent(PathComponent, v15, v16, v17);
        v8 = PathComponent;
      }
      else
      {
        v8 = &stru_1E63FD500;
      }
    }
    v4->_filename = &v8->isa;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *filename;
  objc_super v6;

  filename = self->_filename;
  if (filename)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)filename, (uint64_t)CFSTR("filename"));
  v6.receiver = self;
  v6.super_class = (Class)VFXFileAsset;
  -[VFXCoreAsset encodeWithCoder:](&v6, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
