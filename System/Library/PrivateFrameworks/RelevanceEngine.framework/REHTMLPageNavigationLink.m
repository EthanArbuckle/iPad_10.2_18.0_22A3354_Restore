@implementation REHTMLPageNavigationLink

- (REHTMLPageNavigationLink)initWithLocation:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  REHTMLPageNavigationLink *v8;
  uint64_t v9;
  NSString *location;
  uint64_t v11;
  NSString *title;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REHTMLPageNavigationLink;
  v8 = -[REHTMLPageNavigationLink init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    location = v8->_location;
    v8->_location = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v11;

  }
  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
