@implementation APAdDataResponseTranslator

- (APAdDataResponseTranslator)initWithResponse:(id)a3 forRequester:(id)a4 contentIdentifier:(id)a5 withContext:(id)a6 placement:(int64_t)a7
{
  id v13;
  id v14;
  APAdDataResponseTranslator *v15;
  APAdDataResponseTranslator *v16;
  objc_super v18;

  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)APAdDataResponseTranslator;
  v15 = -[APResponseDataTranslator initWithResponse:forRequester:](&v18, "initWithResponse:forRequester:", a3, a4);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_contentIdentifier, a5);
    objc_storeStrong((id *)&v16->_context, a6);
    v16->_placement = a7;
  }

  return v16;
}

- (id)translate:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  APContentDataInternal *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  APContentDataInternal *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator requester](self, "requester"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](self, "response"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "adOriginalRequesterId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "requestFromRequestID:", v7));

  if (v8)
  {
    v9 = [APContentDataInternal alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](self, "response"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[APAdDataResponseTranslator contentIdentifier](self, "contentIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[APAdDataResponseTranslator context](self, "context"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    v14 = -[APAdDataResponseTranslator placement](self, "placement");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[APAdDataResponseTranslator context](self, "context"));
    objc_msgSend(v15, "maxSize");
    v16 = -[APContentDataInternal initWithAdData:identifier:contextIdentifier:placementType:maxSize:](v9, "initWithAdData:identifier:contextIdentifier:placementType:maxSize:", v10, v11, v13, v14);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[APContentDataInternal content](v16, "content"));
    *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "error"));
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](self, "response"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "adDataResponseIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator response](self, "response"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "adOriginalRequesterId"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[APResponseDataTranslator requester](self, "requester"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "requestIdentifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Ad %@ with original requester id (%@) was returned to wrong requester (%@)"), v18, v20, v22));
    *a3 = (id)objc_claimAutoreleasedReturnValue(+[APLegacyInterfaceError validationErrorWithCode:andReason:](APLegacyInterfaceError, "validationErrorWithCode:andReason:", 4506, v23));

    v16 = 0;
  }

  return v16;
}

- (APContext)context
{
  return self->_context;
}

- (int64_t)placement
{
  return self->_placement;
}

- (NSString)contentIdentifier
{
  return self->_contentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_contentIdentifier, 0);
}

- (void)setContentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contentIdentifier, a3);
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setPlacement:(int64_t)a3
{
  self->_placement = a3;
}

@end
