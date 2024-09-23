@implementation KmlTlv

- (id)description
{
  id v3;
  id v4;
  void *v5;
  NSString *v6;
  id v7;
  void *v8;
  uint64_t v10;
  objc_super v11;
  objc_super v12;

  v3 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", self->_value, 1);
  if (v3)
  {
    v12.receiver = self;
    v12.super_class = (Class)KmlTlv;
    v4 = -[KmlTlv description](&v12, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %02x = %@ \"%@\"), v5, self->_tag, self->_value, v3);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)KmlTlv;
    v7 = -[KmlTlv description](&v11, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %02x = %@"), v5, self->_tag, self->_value, v10);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
