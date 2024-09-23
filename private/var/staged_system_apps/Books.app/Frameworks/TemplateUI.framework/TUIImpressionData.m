@implementation TUIImpressionData

- (TUIImpressionData)initWithUUID:(id)a3 identifier:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  TUIImpressionData *v11;
  uint64_t v12;
  TUIIdentifier *identifier;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUIImpressionData;
  v11 = -[TUIImpressionData init](&v15, "init");
  if (v11)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tui_identifierByPrependingUUID:", v8));
    identifier = v11->_identifier;
    v11->_identifier = (TUIIdentifier *)v12;

    objc_storeStrong(&v11->_data, a5);
  }

  return v11;
}

+ (id)newImpressionWithUUID:(id)a3 identifier:(id)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  if (!a3 || !a4 || !a5)
    return 0;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithUUID:identifier:data:", v10, v9, v8);

  return v11;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (id)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_data, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
