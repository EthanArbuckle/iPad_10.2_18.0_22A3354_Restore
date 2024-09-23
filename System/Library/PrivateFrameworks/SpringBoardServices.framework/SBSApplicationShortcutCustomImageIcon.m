@implementation SBSApplicationShortcutCustomImageIcon

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  size_t v6;
  xpc_object_t xdict;

  v4 = a3;
  if (v4)
  {
    xdict = v4;
    -[SBSApplicationShortcutCustomImageIcon imageData](self, "imageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");
    if (v6)
      xpc_dictionary_set_data(xdict, "customImageIconImageData", (const void *)objc_msgSend(objc_retainAutorelease(v5), "bytes"), v6);
    xpc_dictionary_set_int64(xdict, "customImageIconDataType", -[SBSApplicationShortcutCustomImageIcon dataType](self, "dataType"));
    xpc_dictionary_set_BOOL(xdict, "customImageIconIsTemplate", -[SBSApplicationShortcutCustomImageIcon isTemplate](self, "isTemplate"));

    v4 = xdict;
  }

}

- (BOOL)isEqual:(id)a3
{
  SBSApplicationShortcutCustomImageIcon *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  SBSApplicationShortcutCustomImageIcon *v8;
  id v9;
  int64_t v10;
  SBSApplicationShortcutCustomImageIcon *v11;
  id v12;
  _BOOL8 v13;
  id v14;
  char v15;
  _QWORD v17[4];
  SBSApplicationShortcutCustomImageIcon *v18;
  _QWORD v19[4];
  SBSApplicationShortcutCustomImageIcon *v20;
  _QWORD v21[4];
  SBSApplicationShortcutCustomImageIcon *v22;

  v4 = (SBSApplicationShortcutCustomImageIcon *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSApplicationShortcutCustomImageIcon imageData](self, "imageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __49__SBSApplicationShortcutCustomImageIcon_isEqual___block_invoke;
    v21[3] = &unk_1E288F278;
    v8 = v4;
    v22 = v8;
    v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v21);

    v10 = -[SBSApplicationShortcutCustomImageIcon dataType](self, "dataType");
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __49__SBSApplicationShortcutCustomImageIcon_isEqual___block_invoke_2;
    v19[3] = &unk_1E288F2A0;
    v11 = v8;
    v20 = v11;
    v12 = (id)objc_msgSend(v5, "appendInteger:counterpart:", v10, v19);
    v13 = -[SBSApplicationShortcutCustomImageIcon isTemplate](self, "isTemplate");
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __49__SBSApplicationShortcutCustomImageIcon_isEqual___block_invoke_3;
    v17[3] = &unk_1E288F2C8;
    v18 = v11;
    v14 = (id)objc_msgSend(v5, "appendBool:counterpart:", v13, v17);
    v15 = objc_msgSend(v5, "isEqual");

  }
  return v15;
}

- (BOOL)isTemplate
{
  return self->_isTemplate;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (int64_t)dataType
{
  return self->_dataType;
}

uint64_t __49__SBSApplicationShortcutCustomImageIcon_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isTemplate");
}

uint64_t __49__SBSApplicationShortcutCustomImageIcon_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataType");
}

uint64_t __49__SBSApplicationShortcutCustomImageIcon_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "imageData");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
}

- (SBSApplicationShortcutCustomImageIcon)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SBSApplicationShortcutCustomImageIcon *v8;
  void *v9;
  const void *bytes_ptr;
  int64_t int64;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    xpc_dictionary_get_value(v4, "customImageIconImageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6
       || (xpc_dictionary_get_value(v5, "customIconPNGData"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      && MEMORY[0x193FF8A34](v6) == MEMORY[0x1E0C812E8])
    {
      v9 = (void *)MEMORY[0x1E0C99D50];
      bytes_ptr = xpc_data_get_bytes_ptr(v6);
      objc_msgSend(v9, "dataWithBytes:length:", bytes_ptr, xpc_data_get_length(v6));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      int64 = xpc_dictionary_get_int64(v5, "customImageIconDataType");
      self = -[SBSApplicationShortcutCustomImageIcon initWithImageData:dataType:isTemplate:](self, "initWithImageData:dataType:isTemplate:", v7, int64, xpc_dictionary_get_BOOL(v5, "customImageIconIsTemplate"));
      v8 = self;
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SBSApplicationShortcutCustomImageIcon)initWithImageData:(id)a3 dataType:(int64_t)a4 isTemplate:(BOOL)a5
{
  id v9;
  id *v10;
  SBSApplicationShortcutCustomImageIcon *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSApplicationShortcutCustomImageIcon;
  v10 = -[SBSApplicationShortcutIcon _initForSubclass](&v13, sel__initForSubclass);
  v11 = (SBSApplicationShortcutCustomImageIcon *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 2, a3);
    v11->_dataType = a4;
    v11->_isTemplate = a5;
  }

  return v11;
}

- (SBSApplicationShortcutCustomImageIcon)initWithImageData:(id)a3 dataType:(int64_t)a4
{
  return -[SBSApplicationShortcutCustomImageIcon initWithImageData:dataType:isTemplate:](self, "initWithImageData:dataType:isTemplate:", a3, a4, 0);
}

- (SBSApplicationShortcutCustomImageIcon)initWithImagePNGData:(id)a3
{
  return -[SBSApplicationShortcutCustomImageIcon initWithImageData:dataType:isTemplate:](self, "initWithImageData:dataType:isTemplate:", a3, 0, 0);
}

- (id)_initForSubclass
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99750];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%s is not a valid initializer. You must call -[%@ initWithImageData:dataType:isTemplate:]."), "-[SBSApplicationShortcutCustomImageIcon _initForSubclass]", v6);

  return -[SBSApplicationShortcutCustomImageIcon initWithImageData:dataType:isTemplate:](self, "initWithImageData:dataType:isTemplate:", 0, 0, 0);
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSApplicationShortcutCustomImageIcon imageData](self, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  v6 = (id)objc_msgSend(v3, "appendInteger:", -[SBSApplicationShortcutCustomImageIcon dataType](self, "dataType"));
  v7 = (id)objc_msgSend(v3, "appendBool:", -[SBSApplicationShortcutCustomImageIcon isTemplate](self, "isTemplate"));
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

@end
