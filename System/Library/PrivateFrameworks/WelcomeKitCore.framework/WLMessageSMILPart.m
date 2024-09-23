@implementation WLMessageSMILPart

- (WLMessageSMILPart)initWithElementName:(id)a3 attributes:(id)a4
{
  id v7;
  id v8;
  WLMessageSMILPart *v9;
  WLMessageSMILPart *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WLMessageSMILPart;
  v9 = -[WLMessageSMILPart init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_elementName, a3);
    objc_storeStrong((id *)&v10->_attributes, a4);
  }

  return v10;
}

- (id)fileName
{
  void *v2;
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", CFSTR("src"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSString)elementName
{
  return self->_elementName;
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_elementName, 0);
}

@end
