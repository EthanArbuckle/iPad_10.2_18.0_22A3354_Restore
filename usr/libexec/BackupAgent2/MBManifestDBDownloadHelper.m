@implementation MBManifestDBDownloadHelper

- (id)fileHandleWithPath:(id)a3 flags:(int)a4 mode:(unsigned __int16)a5 error:(id *)a6
{
  MBKeyBag *keybag;
  MBProperties *properties;
  id v9;
  void *v10;
  void *v11;
  MBRestoreFileHandle *v12;

  properties = self->_properties;
  keybag = self->_keybag;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MBProperties manifestEncryptionKey](properties, "manifestEncryptionKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MBEncryptedFileHandle encryptedFileHandleForRestoreWithPath:keybag:key:error:](MBEncryptedFileHandle, "encryptedFileHandleForRestoreWithPath:keybag:key:error:", v9, keybag, v10, a6));

  if (v11)
    v12 = -[MBRestoreFileHandle initWithEngine:fileHandle:file:]([MBRestoreFileHandle alloc], "initWithEngine:fileHandle:file:", 0, v11, 0);
  else
    v12 = 0;

  return v12;
}

- (MBProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (MBKeyBag)keybag
{
  return self->_keybag;
}

- (void)setKeybag:(id)a3
{
  objc_storeStrong((id *)&self->_keybag, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
