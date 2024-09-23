@implementation SKDevice

- (id)description
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSPrintF();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unsigned)blePSM
{
  return self->_blePSM;
}

- (void)setBlePSM:(unsigned __int16)a3
{
  self->_blePSM = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
