@implementation OCXSummary

+ (void)readSummary:(id)a3 package:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(a4, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v6);

  objc_msgSend(v5, "creator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAuthor:", v7);

  objc_msgSend(v5, "keywords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setKeywords:", v8);

  objc_msgSend(v5, "description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setComments:", v9);

}

@end
