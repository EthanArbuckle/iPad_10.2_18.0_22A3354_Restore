@implementation ICLiveLinkQueueEventContentUpdatedMessage

- (ICLiveLinkQueueEventContentUpdatedMessage)initWithLocalizedTitle:(id)a3 localizedMessage:(id)a4
{
  id v6;
  id v7;
  ICLiveLinkQueueEventContentUpdatedMessage *v8;
  uint64_t v9;
  NSString *localizedTitle;
  uint64_t v11;
  NSString *localizedMessage;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICLiveLinkQueueEventContentUpdatedMessage;
  v8 = -[ICLiveLinkQueueEventContentUpdatedMessage init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    localizedTitle = v8->_localizedTitle;
    v8->_localizedTitle = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    localizedMessage = v8->_localizedMessage;
    v8->_localizedMessage = (NSString *)v11;

  }
  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<ICLiveLinkQueueEventContentUpdatedMessage: %p localizedTitle=\"%@\" localizedMessage=\"%@\">"), self, self->_localizedTitle, self->_localizedMessage);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedMessage
{
  return self->_localizedMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedMessage, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
