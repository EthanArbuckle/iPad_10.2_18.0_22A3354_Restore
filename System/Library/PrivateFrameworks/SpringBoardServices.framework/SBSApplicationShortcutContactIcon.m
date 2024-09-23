@implementation SBSApplicationShortcutContactIcon

- (SBSApplicationShortcutContactIcon)initWithContactIdentifier:(id)a3
{
  id v4;
  SBSApplicationShortcutContactIcon *v5;
  uint64_t v6;
  NSString *contactIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSApplicationShortcutContactIcon;
  v5 = -[SBSApplicationShortcutIcon _initForSubclass](&v9, sel__initForSubclass);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v6;

  }
  return v5;
}

- (SBSApplicationShortcutContactIcon)initWithFirstName:(id)a3 lastName:(id)a4
{
  id v6;
  id v7;
  SBSApplicationShortcutContactIcon *v8;
  uint64_t v9;
  NSString *firstName;
  uint64_t v11;
  NSString *lastName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBSApplicationShortcutContactIcon;
  v8 = -[SBSApplicationShortcutIcon _initForSubclass](&v14, sel__initForSubclass);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    firstName = v8->_firstName;
    v8->_firstName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    lastName = v8->_lastName;
    v8->_lastName = (NSString *)v11;

  }
  return v8;
}

- (SBSApplicationShortcutContactIcon)initWithFirstName:(id)a3 lastName:(id)a4 imageData:(id)a5
{
  id v8;
  id v9;
  id v10;
  SBSApplicationShortcutContactIcon *v11;
  uint64_t v12;
  NSString *firstName;
  uint64_t v14;
  NSString *lastName;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBSApplicationShortcutContactIcon;
  v11 = -[SBSApplicationShortcutIcon _initForSubclass](&v17, sel__initForSubclass);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    firstName = v11->_firstName;
    v11->_firstName = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    lastName = v11->_lastName;
    v11->_lastName = (NSString *)v14;

    objc_storeStrong((id *)&v11->_imageData, a5);
  }

  return v11;
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
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%s is not a valid initializer. You must call -[%@ initWithContactIdentifier:]."), "-[SBSApplicationShortcutContactIcon _initForSubclass]", v6);

  return -[SBSApplicationShortcutContactIcon initWithContactIdentifier:](self, "initWithContactIdentifier:", 0);
}

- (BOOL)isEqual:(id)a3
{
  SBSApplicationShortcutContactIcon *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  SBSApplicationShortcutContactIcon *v8;
  id v9;
  void *v10;
  SBSApplicationShortcutContactIcon *v11;
  id v12;
  void *v13;
  SBSApplicationShortcutContactIcon *v14;
  id v15;
  void *v16;
  id v17;
  char v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  SBSApplicationShortcutContactIcon *v24;
  _QWORD v25[4];
  SBSApplicationShortcutContactIcon *v26;
  _QWORD v27[4];
  SBSApplicationShortcutContactIcon *v28;
  _QWORD v29[4];
  SBSApplicationShortcutContactIcon *v30;

  v4 = (SBSApplicationShortcutContactIcon *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSApplicationShortcutContactIcon contactIdentifier](self, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __45__SBSApplicationShortcutContactIcon_isEqual___block_invoke;
    v29[3] = &unk_1E288EEB0;
    v8 = v4;
    v30 = v8;
    v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v29);

    -[SBSApplicationShortcutContactIcon firstName](self, "firstName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __45__SBSApplicationShortcutContactIcon_isEqual___block_invoke_2;
    v27[3] = &unk_1E288EEB0;
    v11 = v8;
    v28 = v11;
    v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", v10, v27);

    -[SBSApplicationShortcutContactIcon lastName](self, "lastName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __45__SBSApplicationShortcutContactIcon_isEqual___block_invoke_3;
    v25[3] = &unk_1E288EEB0;
    v14 = v11;
    v26 = v14;
    v15 = (id)objc_msgSend(v5, "appendObject:counterpart:", v13, v25);

    -[SBSApplicationShortcutContactIcon imageData](self, "imageData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v7;
    v21 = 3221225472;
    v22 = __45__SBSApplicationShortcutContactIcon_isEqual___block_invoke_4;
    v23 = &unk_1E288F278;
    v24 = v14;
    v17 = (id)objc_msgSend(v5, "appendObject:counterpart:", v16, &v20);

    v18 = objc_msgSend(v5, "isEqual", v20, v21, v22, v23);
  }

  return v18;
}

uint64_t __45__SBSApplicationShortcutContactIcon_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "contactIdentifier");
}

uint64_t __45__SBSApplicationShortcutContactIcon_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "firstName");
}

uint64_t __45__SBSApplicationShortcutContactIcon_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "lastName");
}

uint64_t __45__SBSApplicationShortcutContactIcon_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "imageData");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSApplicationShortcutContactIcon contactIdentifier](self, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[SBSApplicationShortcutContactIcon lastName](self, "lastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  v8 = objc_msgSend(v3, "hash");
  return v8;
}

- (SBSApplicationShortcutContactIcon)initWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  SBSApplicationShortcutContactIcon *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  const void *bytes_ptr;

  v4 = a3;
  if (!v4)
    goto LABEL_18;
  BSDeserializeStringFromXPCDictionaryWithKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    BSDeserializeStringFromXPCDictionaryWithKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      BSDeserializeStringFromXPCDictionaryWithKey();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        BSDeserializeStringFromXPCDictionaryWithKey();
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;

      BSDeserializeStringFromXPCDictionaryWithKey();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        BSDeserializeStringFromXPCDictionaryWithKey();
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v14 = v13;

      xpc_dictionary_get_value(v4, "contactIconImageData");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v15
         || (xpc_dictionary_get_value(v4, "contactImageData"), (v15 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        && MEMORY[0x193FF8A34](v15) == MEMORY[0x1E0C812E8])
      {
        v18 = (void *)MEMORY[0x1E0C99D50];
        bytes_ptr = xpc_data_get_bytes_ptr(v15);
        objc_msgSend(v18, "dataWithBytes:length:", bytes_ptr, xpc_data_get_length(v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        self = -[SBSApplicationShortcutContactIcon initWithFirstName:lastName:imageData:](self, "initWithFirstName:lastName:imageData:", v10, v14, v17);
        v16 = 1;
      }
      else
      {
        v16 = 0;
        v17 = 0;
      }

      if (v16)
        goto LABEL_5;
LABEL_18:
      v6 = 0;
      goto LABEL_19;
    }
  }
  self = -[SBSApplicationShortcutContactIcon initWithContactIdentifier:](self, "initWithContactIdentifier:", v5);

LABEL_5:
  self = self;
  v6 = self;
LABEL_19:

  return v6;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  size_t v9;
  xpc_object_t xdict;

  v4 = a3;
  if (v4)
  {
    xdict = v4;
    -[SBSApplicationShortcutContactIcon contactIdentifier](self, "contactIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    BSSerializeStringToXPCDictionaryWithKey();

    -[SBSApplicationShortcutContactIcon firstName](self, "firstName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BSSerializeStringToXPCDictionaryWithKey();

    -[SBSApplicationShortcutContactIcon lastName](self, "lastName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    BSSerializeStringToXPCDictionaryWithKey();

    -[SBSApplicationShortcutContactIcon imageData](self, "imageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");
    if (v9)
      xpc_dictionary_set_data(xdict, "contactIconImageData", (const void *)objc_msgSend(objc_retainAutorelease(v8), "bytes"), v9);

    v4 = xdict;
  }

}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end
