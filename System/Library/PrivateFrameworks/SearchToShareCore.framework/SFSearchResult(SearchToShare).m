@implementation SFSearchResult(SearchToShare)

- (id)sts_badge
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "badge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)sts_searchProviderImage
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)sts_videoDuration
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "descriptionText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sts_providerName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)sts_appProviderName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "punchout");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)sts_providerHostPageURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hostPageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (double)sts_providerIconSize
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "image");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;

  return v4;
}

- (id)sts_userReportRequest
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userReportRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)sts_providerIconWithScale:()SearchToShare completion:
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(id, void *);
  double v15;

  v6 = a4;
  objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(v7, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageWithData:scale:", v10, a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (v6)
      v6[2](v6, v11);
  }
  else
  {
    objc_msgSend(v7, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __70__SFSearchResult_SearchToShare__sts_providerIconWithScale_completion___block_invoke;
    v13[3] = &unk_24E745BD0;
    v15 = a2;
    v14 = v6;
    objc_msgSend(v12, "loadImageDataWithCompletionHandler:", v13);

  }
}

- (id)sts_descriptionText
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_sts_cardSectionWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "descriptionText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_sts_cardSectionWithClass:()SearchToShare
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  if (!a3)
    return 0;
  objc_msgSend(a1, "inlineCard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cardSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __59__SFSearchResult_SearchToShare___sts_cardSectionWithClass___block_invoke;
  v12[3] = &__block_descriptor_40_e30_B32__0__SFCardSection_8Q16_B24lu32l8;
  v12[4] = a3;
  v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v12);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  objc_msgSend(a1, "inlineCard");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cardSections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
