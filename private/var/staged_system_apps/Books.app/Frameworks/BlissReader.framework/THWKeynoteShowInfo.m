@implementation THWKeynoteShowInfo

- (THWKeynoteShowInfo)initWithContext:(id)a3 geometry:(id)a4 sourceURL:(id)a5 drmContext:(id)a6
{
  THWKeynoteShowInfo *v8;
  THWKeynoteShowInfo *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)THWKeynoteShowInfo;
  v8 = -[THWKeynoteShowInfo initWithContext:geometry:](&v11, "initWithContext:geometry:", a3, a4);
  v9 = v8;
  if (v8)
  {
    -[THWKeynoteShowInfo setSourceURL:](v8, "setSourceURL:", a5);
    -[THWKeynoteShowInfo setDrmContext:](v9, "setDrmContext:", a6);
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteShowInfo;
  -[THWKeynoteShowInfo dealloc](&v3, "dealloc");
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THWKeynoteShowLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THWKeynoteShowRep, a2);
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void)setSourceURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (PFDContext)drmContext
{
  return self->_drmContext;
}

- (void)setDrmContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
