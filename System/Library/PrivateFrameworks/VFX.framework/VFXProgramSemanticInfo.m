@implementation VFXProgramSemanticInfo

+ (id)infoWithSemantic:(id)a3 options:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  v6 = objc_alloc_init((Class)a1);
  objc_msgSend_setSemantic_(v6, v7, (uint64_t)a3, v8);
  objc_msgSend_setOptions_(v6, v9, (uint64_t)a4, v10);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;

  v6 = objc_msgSend_semantic(self, a2, (uint64_t)a3, v3);
  objc_msgSend_encodeObject_forKey_(a3, v7, v6, (uint64_t)CFSTR("semantic"));
  v11 = objc_msgSend_options(self, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(a3, v12, v11, (uint64_t)CFSTR("options"));
}

- (VFXProgramSemanticInfo)initWithCoder:(id)a3
{
  VFXProgramSemanticInfo *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VFXProgramSemanticInfo;
  v4 = -[VFXProgramSemanticInfo init](&v16, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("semantic"));
    objc_msgSend_setSemantic_(v4, v8, v7, v9);
    v10 = objc_opt_class();
    v12 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, (uint64_t)CFSTR("options"));
    objc_msgSend_setOptions_(v4, v13, v12, v14);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXProgramSemanticInfo;
  -[VFXProgramSemanticInfo dealloc](&v3, sel_dealloc);
}

- (NSString)semantic
{
  return self->_semantic;
}

- (void)setSemantic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
