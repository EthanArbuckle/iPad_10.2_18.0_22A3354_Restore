@implementation UISearchToken(PXNewSearchToken)

+ (id)px_searchTokenWithRepresentedObjectToken:()PXNewSearchToken
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "queryToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userCategory");

  v6 = 0;
  if (v5 && v5 != 13)
  {
    objc_msgSend(v3, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  if (v5 && v5 != 13)

  if ((objc_msgSend(v3, "hasLeadingHashtag") & 1) != 0)
  {
    objc_msgSend(v3, "attributedTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "queryToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v3, "queryToken");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "text");
    }
    else
    {
      objc_msgSend(v3, "attributedTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "string");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0DC3C50], "tokenWithIcon:text:", v7, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRepresentedObject:", v3);

  return v12;
}

@end
