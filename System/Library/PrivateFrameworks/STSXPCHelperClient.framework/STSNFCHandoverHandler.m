@implementation STSNFCHandoverHandler

- (STSNFCHandoverHandler)init
{
  STSNFCHandoverHandler *v2;
  NSMutableData *v3;
  NSMutableData *apduBuffer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STSNFCHandoverHandler;
  v2 = -[STSNFCHandoverHandler init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    apduBuffer = v2->_apduBuffer;
    v2->_apduBuffer = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseBuffer, 0);
  objc_storeStrong((id *)&self->_apduBuffer, 0);
}

@end
