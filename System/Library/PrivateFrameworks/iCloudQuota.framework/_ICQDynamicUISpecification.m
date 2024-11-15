@implementation _ICQDynamicUISpecification

- (_ICQDynamicUISpecification)initWithRouteURL:(id)a3 pageContentsURL:(id)a4 attributionSuffix:(id)a5
{
  id v9;
  id v10;
  id v11;
  _ICQDynamicUISpecification *v12;
  _ICQDynamicUISpecification *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_ICQDynamicUISpecification;
  v12 = -[_ICQDynamicUISpecification init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_routeURL, a3);
    objc_storeStrong((id *)&v13->_pageContentsURL, a4);
    objc_storeStrong((id *)&v13->_attributionSuffix, a5);
  }

  return v13;
}

- (NSURL)routeURL
{
  return self->_routeURL;
}

- (NSURL)pageContentsURL
{
  return self->_pageContentsURL;
}

- (NSString)attributionSuffix
{
  return self->_attributionSuffix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionSuffix, 0);
  objc_storeStrong((id *)&self->_pageContentsURL, 0);
  objc_storeStrong((id *)&self->_routeURL, 0);
}

@end
