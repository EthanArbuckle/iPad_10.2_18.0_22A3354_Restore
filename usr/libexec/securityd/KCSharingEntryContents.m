@implementation KCSharingEntryContents

- (KCSharingEntryContents)initWithContents:(id)a3 fullyDecoded:(BOOL)a4
{
  id v7;
  KCSharingEntryContents *v8;
  KCSharingEntryContents *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)KCSharingEntryContents;
  v8 = -[KCSharingEntryContents init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_contents, a3);
    v9->_fullyDecoded = a4;
  }

  return v9;
}

- (id)contents
{
  return self->_contents;
}

- (BOOL)isFullyDecoded
{
  return self->_fullyDecoded;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contents, 0);
}

@end
