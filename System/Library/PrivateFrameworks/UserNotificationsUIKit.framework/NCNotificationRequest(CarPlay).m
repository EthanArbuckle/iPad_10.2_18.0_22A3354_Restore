@implementation NCNotificationRequest(CarPlay)

- (id)carPlayTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a1, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "length"))
  {
    objc_msgSend(a1, "content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customHeader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(a1, "content");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "defaultHeader");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      v3 = v8;
    }

    v3 = v7;
  }
  return v3;
}

- (id)carPlaySubTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(a1, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "length"))
  {
    objc_msgSend(a1, "content");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      objc_msgSend(a1, "content");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "customHeader");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        objc_msgSend(a1, "content");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "defaultHeader");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        v3 = v11;
      }

      v3 = v10;
    }
  }
  return v3;
}

- (id)carPlayMessage
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "carPlayAttributedMessage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)carPlayAttributedMessage
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "content");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "attributedMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
