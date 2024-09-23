@implementation VFXMTLResourceBinding

- (VFXMTLResourceBinding)init
{
  VFXMTLResourceBinding *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXMTLResourceBinding;
  result = -[VFXMTLResourceBinding init](&v3, sel_init);
  *(_DWORD *)&result->_indices.vertexIndex = -1;
  result->_usedResources = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXMTLResourceBinding;
  -[VFXMTLResourceBinding dealloc](&v3, sel_dealloc);
}

- (int64_t)type
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_type(self->_binding, a2, v2, v3);
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  objc_class *v6;
  NSString *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;

  v5 = (void *)objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v11 = objc_msgSend_name(self->_binding, v8, v9, v10);
  objc_msgSend_appendFormat_(v5, v12, (uint64_t)CFSTR("<%@: %p> \"%@\"), v13, v7, self, v11);
  return v5;
}

- (NSString)name
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_name(self->_binding, a2, v2, v3);
}

- (void)setNeedsRenderResource:(BOOL)a3
{
  self->_needsRenderResource = a3;
}

- (BOOL)needsRenderResource
{
  return self->_needsRenderResource;
}

- (NSMutableArray)usedResources
{
  NSMutableArray *result;
  id v4;
  const char *v5;
  uint64_t v6;

  result = self->_usedResources;
  if (!result)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
    result = (NSMutableArray *)objc_msgSend_initWithCapacity_(v4, v5, 0, v6);
    self->_usedResources = result;
  }
  return result;
}

- (id)bindBlock
{
  return self->_bindBlock;
}

- (void)setBindBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MTLBinding)binding
{
  return self->_binding;
}

- (void)setBinding:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (MTLArgumentEncoder)argumentEncoder
{
  return self->_argumentEncoder;
}

- (void)setArgumentEncoder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
