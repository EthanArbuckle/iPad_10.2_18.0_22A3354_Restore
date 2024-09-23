@implementation SXBookmarkAction

- (SXBookmarkAction)initWithBookmark:(id)a3
{
  id v5;
  SXBookmarkAction *v6;
  SXBookmarkAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXBookmarkAction;
  v6 = -[SXBookmarkAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bookmark, a3);

  return v7;
}

- (NSString)type
{
  return (NSString *)CFSTR("bookmark");
}

- (SXJSONDictionary)analytics
{
  return self->analytics;
}

- (SXBookmark)bookmark
{
  return self->_bookmark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->analytics, 0);
}

@end
