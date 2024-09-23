@implementation IPAPhotoAdjustment

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IPAPhotoAdjustment;
  v4 = -[IPAAdjustment copyWithZone:](&v6, sel_copyWithZone_, a3);
  *((_BYTE *)v4 + 32) = self->_enabled;
  objc_storeStrong((id *)v4 + 5, self->_maskUUID);
  objc_storeStrong((id *)v4 + 6, self->_autoSettings);
  return v4;
}

- (void)setMaskUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  NSString *maskUUID;
  IPAPhotoAdjustment *v9;
  SEL v10;
  id v11;

  v4 = a3;
  v5 = v4;
  v11 = v4;
  if (v4 && (v6 = objc_msgSend(v4, "length"), v5 = v11, !v6))
  {
    v9 = (IPAPhotoAdjustment *)_PFAssertFailHandler();
    -[IPAPhotoAdjustment _debugDescriptionSuffix](v9, v10);
  }
  else
  {
    v7 = (NSString *)objc_msgSend(v5, "copy");
    maskUUID = self->_maskUUID;
    self->_maskUUID = v7;

  }
}

- (id)_debugDescriptionSuffix
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("enabled=%d"), self->_enabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_maskUUID)
    objc_msgSend(v3, "appendFormat:", CFSTR(" maskUUID=%@"), self->_maskUUID);
  if (self->_autoSettings)
    objc_msgSend(v4, "appendFormat:", CFSTR(" autoSettings=<%@:%p count:%lu>"), objc_opt_class(), self->_autoSettings, -[NSDictionary count](self->_autoSettings, "count"));
  return v4;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)maskUUID
{
  return self->_maskUUID;
}

- (NSDictionary)autoSettings
{
  return self->_autoSettings;
}

- (void)setAutoSettings:(id)a3
{
  objc_storeStrong((id *)&self->_autoSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoSettings, 0);
  objc_storeStrong((id *)&self->_maskUUID, 0);
}

@end
