@implementation PKApplicationMessageContentDefault

+ (id)createWithGroup:(id)a3 action:(id)a4 icon:(id)a5 title:(id)a6 body:(id)a7
{
  id v12;
  id *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PKApplicationMessageContentDefault *v18;
  PKApplicationMessageContentDefault *v19;
  _QWORD *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  objc_super v26;

  v12 = a5;
  v13 = 0;
  if (a3 && a6)
  {
    v14 = a7;
    v15 = a6;
    v16 = a3;
    v17 = a4;
    objc_opt_self();
    v18 = [PKApplicationMessageContentDefault alloc];
    v19 = v18;
    if (v18)
    {
      v26.receiver = v18;
      v26.super_class = (Class)PKApplicationMessageContent;
      v20 = objc_msgSendSuper2(&v26, sel_init);
      v13 = (id *)v20;
      if (v20)
        v20[1] = 0;
    }
    else
    {
      v13 = 0;
    }

    objc_storeStrong(v13 + 2, a3);
    objc_storeStrong(v13 + 3, a4);

    objc_storeStrong(v13 + 4, a5);
    v21 = objc_msgSend(v15, "copy");

    v22 = v13[5];
    v13[5] = (id)v21;

    v23 = objc_msgSend(v14, "copy");
    v24 = v13[6];
    v13[6] = (id)v23;

  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKApplicationMessageContentDefault)initWithCoder:(id)a3
{
  id v4;
  PKApplicationMessageContentDefault *v5;
  uint64_t v6;
  uint64_t v7;
  PKApplicationMessageIcon *icon;
  uint64_t v9;
  NSString *title;
  uint64_t v11;
  NSString *body;
  PKApplicationMessageContentDefault *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKApplicationMessageContentDefault;
  v5 = -[PKApplicationMessageContent initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
    v7 = objc_claimAutoreleasedReturnValue();
    icon = v5->_icon;
    v5->_icon = (PKApplicationMessageIcon *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("title"));
    v9 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v9;

    if (!v5->_title)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKApplicationMessageContentDefault"), 0, 0);
      objc_msgSend(v4, "failWithError:", v14);

      v13 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("body"));
    v11 = objc_claimAutoreleasedReturnValue();
    body = v5->_body;
    v5->_body = (NSString *)v11;

  }
  v13 = v5;
LABEL_6:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKApplicationMessageContentDefault;
  v4 = a3;
  -[PKApplicationMessageContent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_icon, CFSTR("icon"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("title"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_body, CFSTR("body"));

}

- (PKApplicationMessageIcon)icon
{
  return self->_icon;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
