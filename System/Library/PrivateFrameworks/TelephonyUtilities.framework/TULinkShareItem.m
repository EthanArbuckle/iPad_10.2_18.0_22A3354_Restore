@implementation TULinkShareItem

- (TULinkShareItem)initWithTUConversationLink:(id)a3 title:(id)a4 placeholder:(id)a5
{
  id v8;
  id v9;
  id v10;
  TULinkShareItem *v11;
  TULinkShareItem *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TULinkShareItem;
  v11 = -[TULinkShareItem init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[TULinkShareItem setTuConversationLink:](v11, "setTuConversationLink:", v8);
    -[TULinkShareItem setTitle:](v12, "setTitle:", v9);
    -[TULinkShareItem setPlaceholder:](v12, "setPlaceholder:", v10);
  }

  return v12;
}

- (TULinkShareItem)initWithTUConversationLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  TULinkShareItem *v10;

  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    +[TUConversationLink preferredBaseURL](TUConversationLink, "preferredBaseURL");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v4, "linkName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TULinkShareItem initWithTUConversationLink:title:placeholder:](self, "initWithTUConversationLink:title:placeholder:", v4, v9, v8);

  return v10;
}

- (TUConversationLink)tuConversationLink
{
  return self->_tuConversationLink;
}

- (void)setTuConversationLink:(id)a3
{
  objc_storeStrong((id *)&self->_tuConversationLink, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_tuConversationLink, 0);
}

@end
