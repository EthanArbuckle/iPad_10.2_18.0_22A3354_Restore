@implementation SXQuickLookFile

- (SXQuickLookFile)initWithFileURL:(id)a3 shareURL:(id)a4
{
  id v7;
  id v8;
  SXQuickLookFile *v9;
  SXQuickLookFile *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXQuickLookFile;
  v9 = -[SXQuickLookFile init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileURL, a3);
    objc_storeStrong((id *)&v10->_shareURL, a4);
  }

  return v10;
}

- (SXQuickLookFile)initWithFileURL:(id)a3 title:(id)a4 shareURL:(id)a5
{
  id v9;
  SXQuickLookFile *v10;
  SXQuickLookFile *v11;

  v9 = a4;
  v10 = -[SXQuickLookFile initWithFileURL:shareURL:](self, "initWithFileURL:shareURL:", a3, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_title, a4);

  return v11;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSString)title
{
  return self->_title;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
