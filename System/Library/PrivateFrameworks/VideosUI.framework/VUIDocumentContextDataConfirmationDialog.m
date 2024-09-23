@implementation VUIDocumentContextDataConfirmationDialog

- (id)jsonData
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", self->_confirmationDialogType, CFSTR("type"));
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", self->_name, CFSTR("nameKey"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSString)confirmationDialogType
{
  return self->_confirmationDialogType;
}

- (void)setConfirmationDialogType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_confirmationDialogType, 0);
}

@end
