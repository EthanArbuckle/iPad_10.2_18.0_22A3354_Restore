@implementation SecureChannelAction

- (SecureChannelAction)initWithURL:(id)a3 title:(id)a4 message:(id)a5
{
  id v9;
  id v10;
  id v11;
  SecureChannelAction *v12;
  SecureChannelAction *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SecureChannelAction;
  v12 = -[SecureChannelAction init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeStrong((id *)&v13->_title, a4);
    objc_storeStrong((id *)&v13->_message, a5);
  }

  return v13;
}

- (void)performWithCompletionHandler:(id)a3
{
  +[SecureChannelController runApproverFlowForURL:withCompletion:](SecureChannelController, "runApproverFlowForURL:withCompletion:", self->_url, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *url;
  id v5;

  url = self->_url;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", url, CFSTR("url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("message"));

}

- (SecureChannelAction)initWithCoder:(id)a3
{
  id v4;
  SecureChannelAction *v5;
  uint64_t v6;
  NSURL *url;
  uint64_t v8;
  NSString *title;
  uint64_t v10;
  NSString *message;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SecureChannelAction;
  v5 = -[SecureChannelAction init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v6 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v8 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v10 = objc_claimAutoreleasedReturnValue();
    message = v5->_message;
    v5->_message = (NSString *)v10;

  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
