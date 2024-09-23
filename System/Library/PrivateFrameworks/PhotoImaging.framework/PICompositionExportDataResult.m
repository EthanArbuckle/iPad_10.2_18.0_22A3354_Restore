@implementation PICompositionExportDataResult

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
