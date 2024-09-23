@implementation NF7816App

- (NF7816App)initWithAid:(id)a3 type:(int64_t)a4
{
  id v7;
  NF7816App *v8;
  NF7816App *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NF7816App;
  v8 = -[NF7816App init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_aid, a3);
    v9->_type = a4;
  }

  return v9;
}

+ (NF7816App)appWithAid:(id)a3 type:(int64_t)a4
{
  id v5;
  NF7816App *v6;

  v5 = a3;
  v6 = -[NF7816App initWithAid:type:]([NF7816App alloc], "initWithAid:type:", v5, a4);

  return v6;
}

- (id)description
{
  unint64_t type;
  uint64_t v3;

  type = self->_type;
  if (type > 4)
    v3 = 0;
  else
    v3 = *((_QWORD *)&off_1002E9928 + type);
  return objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-%@"), self->_aid, v3);
}

- (NSData)aid
{
  return self->_aid;
}

- (void)setAid:(id)a3
{
  objc_storeStrong((id *)&self->_aid, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aid, 0);
}

@end
