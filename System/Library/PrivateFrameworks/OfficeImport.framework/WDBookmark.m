@implementation WDBookmark

- (WDBookmark)initWithParagraph:(id)a3 name:(id)a4 type:(int)a5
{
  id v9;
  WDBookmark *v10;
  WDBookmark *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WDBookmark;
  v10 = -[WDRun initWithParagraph:](&v13, sel_initWithParagraph_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->mName, a4);
    v11->mBookmarkType = a5;
  }

  return v11;
}

- (int)runType
{
  return 12;
}

- (id)name
{
  return self->mName;
}

- (int)bookmarkType
{
  return self->mBookmarkType;
}

- (void)setBookmarkType:(int)a3
{
  self->mBookmarkType = a3;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->mName, a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDBookmark;
  -[WDRun description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
}

@end
