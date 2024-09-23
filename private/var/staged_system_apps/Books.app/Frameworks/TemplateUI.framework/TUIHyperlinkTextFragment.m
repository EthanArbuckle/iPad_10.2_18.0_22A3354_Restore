@implementation TUIHyperlinkTextFragment

- (TUIHyperlinkTextFragment)initWithURL:(id)a3 fragments:(id)a4
{
  id v6;
  id v7;
  TUIHyperlinkTextFragment *v8;
  NSURL *v9;
  NSURL *url;
  NSArray *v11;
  NSArray *fragments;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIHyperlinkTextFragment;
  v8 = -[TUIHyperlinkTextFragment init](&v14, "init");
  if (v8)
  {
    v9 = (NSURL *)objc_msgSend(v6, "copy");
    url = v8->_url;
    v8->_url = v9;

    v11 = (NSArray *)objc_msgSend(v7, "copy");
    fragments = v8->_fragments;
    v8->_fragments = v11;

  }
  return v8;
}

- (void)appendToBuilder:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSURL *url;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  url = self->_url;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_5C194;
  v11[3] = &unk_23E2C8;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v10, "appendHyperlinkWithURL:block:", url, v11);

}

- (NSURL)url
{
  return self->_url;
}

- (NSArray)fragments
{
  return self->_fragments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragments, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
