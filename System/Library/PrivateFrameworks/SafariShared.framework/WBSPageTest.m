@implementation WBSPageTest

- (WBSPageTest)initWithIdentifier:(id)a3 pageURL:(id)a4 expectedResultsURL:(id)a5 dictionary:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WBSPageTest *v15;
  WBSPageTest *v16;
  void *v17;
  void *v18;
  WBSPageTest *v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)WBSPageTest;
  v15 = -[WBSPageTest init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_pageURL, a4);
    objc_storeStrong((id *)&v16->_expectedResultsURL, a5);
    objc_msgSend(v14, "safari_numberForKey:", CFSTR("ViewportHeight"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16->_viewportSize.height = (double)(int)objc_msgSend(v17, "intValue");

    objc_msgSend(v14, "safari_numberForKey:", CFSTR("ViewportWidth"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16->_viewportSize.width = (double)(int)objc_msgSend(v18, "intValue");

    v19 = v16;
  }

  return v16;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (NSURL)expectedResultsURL
{
  return self->_expectedResultsURL;
}

- (CGSize)viewportSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewportSize.width;
  height = self->_viewportSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedResultsURL, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
