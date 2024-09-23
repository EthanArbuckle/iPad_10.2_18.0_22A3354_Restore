@implementation PICompositionSerializationResult

- (PICompositionSerializationResult)init
{
  PICompositionSerializationResult *v2;
  NSData *v3;
  NSData *data;
  NSString *formatIdentifier;
  NSString *formatVersion;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PICompositionSerializationResult;
  v2 = -[PICompositionSerializationResult init](&v8, sel_init);
  v3 = (NSData *)objc_alloc_init(MEMORY[0x1E0C99D50]);
  data = v2->_data;
  v2->_data = v3;

  formatIdentifier = v2->_formatIdentifier;
  v2->_formatIdentifier = (NSString *)&stru_1E501A310;

  formatVersion = v2->_formatVersion;
  v2->_formatVersion = (NSString *)&stru_1E501A310;

  return v2;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSString)formatIdentifier
{
  return self->_formatIdentifier;
}

- (void)setFormatIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_formatIdentifier, a3);
}

- (NSString)formatVersion
{
  return self->_formatVersion;
}

- (void)setFormatVersion:(id)a3
{
  objc_storeStrong((id *)&self->_formatVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatVersion, 0);
  objc_storeStrong((id *)&self->_formatIdentifier, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
