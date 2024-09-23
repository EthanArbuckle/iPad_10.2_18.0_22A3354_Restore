@implementation URMTLStructMemberInternal

- (URMTLStructMemberInternal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)URMTLStructMemberInternal;
  return -[URMTLStructMemberInternal init](&v3, sel_init);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (void)setDataType:(unint64_t)a3
{
  self->_dataType = a3;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (unint64_t)aluType
{
  return self->_aluType;
}

- (void)setAluType:(unint64_t)a3
{
  self->_aluType = a3;
}

- (unint64_t)render_target
{
  return self->_render_target;
}

- (void)setRender_target:(unint64_t)a3
{
  self->_render_target = a3;
}

- (unint64_t)raster_order_group
{
  return self->_raster_order_group;
}

- (void)setRaster_order_group:(unint64_t)a3
{
  self->_raster_order_group = a3;
}

- (unint64_t)argumentIndex
{
  return self->_argumentIndex;
}

- (void)setArgumentIndex:(unint64_t)a3
{
  self->_argumentIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  id v29;

  v4 = a3;
  objc_msgSend_name(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, CFSTR("name"));

  v9 = (void *)MEMORY[0x24BDD16E0];
  v12 = objc_msgSend_offset(self, v10, v11);
  objc_msgSend_numberWithUnsignedInteger_(v9, v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, CFSTR("offset"));

  v16 = (void *)MEMORY[0x24BDD16E0];
  v19 = objc_msgSend_dataType(self, v17, v18);
  objc_msgSend_numberWithUnsignedInteger_(v16, v20, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v21, CFSTR("dataType"));

  v23 = (void *)MEMORY[0x24BDD16E0];
  v26 = objc_msgSend_argumentIndex(self, v24, v25);
  objc_msgSend_numberWithUnsignedInteger_(v23, v27, v26);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v28, (uint64_t)v29, CFSTR("argumentIndex"));

}

- (URMTLStructMemberInternal)initWithCoder:(id)a3
{
  id v4;
  URMTLStructMemberInternal *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;

  v4 = a3;
  v5 = objc_alloc_init(URMTLStructMemberInternal);
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v5, v10, (uint64_t)v9);

  objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v6, CFSTR("offset"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend_unsignedIntegerValue(v12, v13, v14);
  objc_msgSend_setOffset_(v5, v16, v15);

  objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v6, CFSTR("dataType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_unsignedIntegerValue(v18, v19, v20);
  objc_msgSend_setDataType_(v5, v22, v21);

  objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v6, CFSTR("argumentIndex"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_msgSend_unsignedIntegerValue(v24, v25, v26);
  objc_msgSend_setArgumentIndex_(v5, v28, v27);

  return v5;
}

@end
