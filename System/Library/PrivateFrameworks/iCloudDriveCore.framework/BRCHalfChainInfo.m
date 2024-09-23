@implementation BRCHalfChainInfo

- (BRCHalfChainInfo)initWithRecord:(id)a3 ckInfo:(id)a4
{
  id v7;
  id v8;
  BRCHalfChainInfo *v9;
  BRCHalfChainInfo *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BRCHalfChainInfo;
  v9 = -[BRCHalfChainInfo init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_record, a3);
    objc_storeStrong((id *)&v10->_ckInfo, a4);
  }

  return v10;
}

- (CKRecord)record
{
  return self->_record;
}

- (void)setRecord:(id)a3
{
  objc_storeStrong((id *)&self->_record, a3);
}

- (BRFieldCKInfo)ckInfo
{
  return self->_ckInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ckInfo, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
