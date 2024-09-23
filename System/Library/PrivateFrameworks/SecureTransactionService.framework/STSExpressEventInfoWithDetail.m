@implementation STSExpressEventInfoWithDetail

- (STSExpressEventInfoWithDetail)initWithState:(unsigned int)a3 detail:(id)a4
{
  uint64_t v5;
  id v7;
  STSExpressEventInfoWithDetail *v8;
  STSExpressEventInfoWithDetail *v9;
  objc_super v11;

  v5 = *(_QWORD *)&a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)STSExpressEventInfoWithDetail;
  v8 = -[STSExpressEventInfo initWithState:](&v11, sel_initWithState_, v5);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_detail, a4);

  return v9;
}

- (NSString)detail
{
  return self->_detail;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
}

@end
