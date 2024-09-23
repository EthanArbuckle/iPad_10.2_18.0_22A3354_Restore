@implementation SXWebContentLinkTapEvent

- (SXWebContentLinkTapEvent)initWithIdentifier:(id)a3 destinationURL:(id)a4
{
  id v6;
  SXWebContentLinkTapEvent *v7;
  uint64_t v8;
  NSString *identifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SXWebContentLinkTapEvent;
  v7 = -[SXLinkTapEvent initWithDestinationURL:analytics:](&v11, sel_initWithDestinationURL_analytics_, a4, 0);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

  }
  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
