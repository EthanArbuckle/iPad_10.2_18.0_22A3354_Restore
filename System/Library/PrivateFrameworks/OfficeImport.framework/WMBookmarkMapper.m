@implementation WMBookmarkMapper

- (WMBookmarkMapper)initWithWDBookmark:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  WMBookmarkMapper *v8;
  uint64_t v9;
  NSString *mName;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WMBookmarkMapper;
  v8 = -[CMMapper initWithParent:](&v12, sel_initWithParent_, v7);
  if (v8)
  {
    v8->mBookmarkType = objc_msgSend(v6, "bookmarkType");
    objc_msgSend(v6, "name");
    v9 = objc_claimAutoreleasedReturnValue();
    mName = v8->mName;
    v8->mName = (NSString *)v9;

  }
  return v8;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  if (!self->mBookmarkType)
  {
    v7 = v5;
    +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addChild:", v6);
    -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3CF458, v6, self->mName);

    v5 = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
}

@end
