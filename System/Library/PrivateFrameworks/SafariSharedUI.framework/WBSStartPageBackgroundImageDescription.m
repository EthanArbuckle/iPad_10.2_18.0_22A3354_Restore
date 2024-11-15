@implementation WBSStartPageBackgroundImageDescription

- (WBSStartPageBackgroundImageDescription)initWithURL:(id)a3 luminance:(double)a4
{
  id v7;
  WBSStartPageBackgroundImageDescription *v8;
  WBSStartPageBackgroundImageDescription *v9;
  WBSStartPageBackgroundImageDescription *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSStartPageBackgroundImageDescription;
  v8 = -[WBSStartPageBackgroundImageDescription init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_url, a3);
    v9->_luminance = a4;
    v10 = v9;
  }

  return v9;
}

- (NSURL)url
{
  return self->_url;
}

- (double)luminance
{
  return self->_luminance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
