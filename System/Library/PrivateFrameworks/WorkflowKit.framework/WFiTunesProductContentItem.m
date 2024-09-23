@implementation WFiTunesProductContentItem

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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[12];

  v42[10] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Artist"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "block:name:class:", &__block_literal_global_5232, v41, objc_opt_class());
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v40;
  v3 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Price"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath:name:class:", CFSTR("object.price"), v39, objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v38;
  v4 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Currency Code"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPath:name:class:", CFSTR("object.currencyCode"), v37, objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v36;
  v5 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Formatted Price"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyPath:name:class:", CFSTR("object.formattedPrice"), v35, objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v34;
  v6 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Release Date"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyPath:name:class:", CFSTR("object.releaseDate"), v33, objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v32;
  v7 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Genre"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyPath:name:class:", CFSTR("mediaTrackObject.genre"), v31, objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v30;
  v8 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Duration"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyPath:name:class:", CFSTR("mediaTrackObject.duration"), v29, objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v28;
  v9 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Streamable"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyPath:name:class:", CFSTR("mediaTrackObject.streamable"), v26, objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Streamable"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "displayName:", v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not Streamable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "negativeName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v12;
  v13 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Explicit"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyPath:name:class:", CFSTR("mediaTrackObject.explicit"), v14, objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not Explicit"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "negativeName:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42[8] = v18;
  v19 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Description"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "keyPath:name:class:", CFSTR("object.descriptionText"), v20, objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[9] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 10);
  v23 = (id)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)stringConversionBehavior
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D13ED8];
  WFLocalizedString(CFSTR("Name and Store URL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coercingToStringWithDescription:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

+ (id)outputTypes
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFiTunesProductContentItem;
  objc_msgSendSuper2(&v6, sel_outputTypes);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D14020], "typeWithClassName:frameworkName:location:", CFSTR("MPMediaItem"), CFSTR("MediaPlayer"), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetByAddingObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __46__WFiTunesProductContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a2, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "artistID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__WFiTunesProductContentItem_propertyBuilders__block_invoke_2;
  v11[3] = &unk_1E7AF6C78;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v7, "lookupMediaWithIdentifiers:countryCode:completion:", v9, 0, v11);

}

void __46__WFiTunesProductContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (id)mediaTrackObject
{
  void *v2;
  void *v3;
  id v4;

  -[WFiTunesObjectContentItem object](self, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

- (BOOL)getListSubtitle:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v5 = a3;
    -[WFiTunesProductContentItem storeObject](self, "storeObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "artistName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))a3 + 2))(v5, v7);

  }
  return 1;
}

- (BOOL)getListAltText:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v5 = a3;
    -[WFiTunesProductContentItem storeObject](self, "storeObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "formattedPrice");
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
    v10[2] = __55__WFiTunesProductContentItem_getListThumbnail_forSize___block_invoke;
    v10[3] = &unk_1E7AF6B58;
    v11 = v7;
    -[WFiTunesObjectContentItem getArtworkForSize:completionHandler:](self, "getArtworkForSize:completionHandler:", v10, width, height);

  }
  return 1;
}

void __55__WFiTunesProductContentItem_getListThumbnail_forSize___block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __55__WFiTunesProductContentItem_getListThumbnail_forSize___block_invoke_2;
  v6[3] = &unk_1E7AF76F0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __55__WFiTunesProductContentItem_getListThumbnail_forSize___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

@end
