@implementation WFPodcastShowContentItem

+ (id)propertyBuilders
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Feed URL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyPath:name:class:", CFSTR("object.feedURL"), v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v5 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Genre"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyPath:name:class:", CFSTR("object.genre"), v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  v8 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Episode Count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyPath:name:class:", CFSTR("object.trackCount"), v9, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v10;
  v11 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Artist"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyPath:name:class:", CFSTR("object.artistName"), v12, objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)ownedTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)contentCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0D14138];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)typeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Podcast"), CFSTR("Podcast"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("Podcasts (plural)"), CFSTR("Podcasts"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d Podcasts"));
}

+ (BOOL)canLowercaseTypeDescription
{
  return 1;
}

- (BOOL)getListSubtitle:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v5 = a3;
    -[WFPodcastShowContentItem podcastObject](self, "podcastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "artistName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))a3 + 2))(v5, v7);

  }
  return 1;
}

- (BOOL)loadsListThumbnailAsynchronously
{
  return 1;
}

- (BOOL)getListThumbnail:(id)a3 forSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__WFPodcastShowContentItem_getListThumbnail_forSize___block_invoke;
    v10[3] = &unk_1E7AF6B58;
    v11 = v7;
    -[WFiTunesObjectContentItem getArtworkForSize:completionHandler:](self, "getArtworkForSize:completionHandler:", v10, width, height);

  }
  return 1;
}

void __53__WFPodcastShowContentItem_getListThumbnail_forSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__WFPodcastShowContentItem_getListThumbnail_forSize___block_invoke_2;
  v6[3] = &unk_1E7AF76F0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __53__WFPodcastShowContentItem_getListThumbnail_forSize___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

@end
