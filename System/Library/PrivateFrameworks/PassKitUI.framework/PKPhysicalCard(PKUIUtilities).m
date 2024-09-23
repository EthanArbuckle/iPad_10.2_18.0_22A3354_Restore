@implementation PKPhysicalCard(PKUIUtilities)

- (id)artworkImage:()PKUIUtilities
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  void (**v10)(id, _QWORD, void *);

  v4 = a3;
  objc_msgSend(a1, "frontFaceImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v4[2](v4, 0, v6);
  }
  else
  {
    objc_msgSend(a1, "frontFaceImageURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__PKPhysicalCard_PKUIUtilities__artworkImage___block_invoke;
    v9[3] = &unk_1E3E65930;
    v9[4] = a1;
    v10 = v4;
    objc_msgSend(a1, "_downloadImageFromURL:completion:", v7, v9);

    v6 = 0;
  }

  return v6;
}

- (void)_downloadImageFromURL:()PKUIUtilities completion:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D66EA8], "sharedImageAssetDownloader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__PKPhysicalCard_PKUIUtilities___downloadImageFromURL_completion___block_invoke;
  v10[3] = &unk_1E3E66440;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "downloadFromUrl:completionHandler:", v9, v10);

}

@end
