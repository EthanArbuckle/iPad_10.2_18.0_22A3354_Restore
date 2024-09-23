@implementation WFAppStoreAppContentItem

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
  void *v22;
  void *v23;
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
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[26];

  v86[24] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Artist"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "block:name:class:", &__block_literal_global_6038, v85, objc_opt_class());
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v84;
  v3 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Price"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath:name:class:", CFSTR("object.price"), v83, objc_opt_class());
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v82;
  v4 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Currency Code"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "keyPath:name:class:", CFSTR("object.currencyCode"), v81, objc_opt_class());
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v86[2] = v80;
  v5 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Formatted Price"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyPath:name:class:", CFSTR("object.formattedPrice"), v79, objc_opt_class());
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v86[3] = v78;
  v6 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Release Date"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyPath:name:class:", CFSTR("object.releaseDate"), v77, objc_opt_class());
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v86[4] = v76;
  v7 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Category"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyPath:name:class:", CFSTR("object.category"), v75, objc_opt_class());
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v86[5] = v74;
  v8 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Description"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyPath:name:class:", CFSTR("object.descriptionText"), v73, objc_opt_class());
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v86[6] = v72;
  v9 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Rating"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "keyPath:name:class:", CFSTR("object.averageRating"), v71, objc_opt_class());
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v86[7] = v70;
  v10 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("# of Ratings"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyPath:name:class:", CFSTR("object.numberOfRatings"), v69, objc_opt_class());
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v86[8] = v68;
  v11 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Rating (This Version)"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "keyPath:name:class:", CFSTR("object.averageRatingLatestVersion"), v67, objc_opt_class());
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v86[9] = v66;
  v12 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("# of Ratings (This Version)"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyPath:name:class:", CFSTR("object.numberOfRatingsLatestVersion"), v65, objc_opt_class());
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v86[10] = v64;
  v13 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Version"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyPath:name:class:", CFSTR("object.version"), v63, objc_opt_class());
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v86[11] = v62;
  v14 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Last Updated"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "keyPath:name:class:", CFSTR("object.lastUpdated"), v61, objc_opt_class());
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v86[12] = v60;
  v15 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Release Notes"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "keyPath:name:class:", CFSTR("object.releaseNotes"), v59, objc_opt_class());
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v86[13] = v58;
  v16 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Content Rating"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "keyPath:name:class:", CFSTR("object.contentRating"), v57, objc_opt_class());
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v86[14] = v56;
  v17 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Minimum OS Version"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "keyPath:name:class:", CFSTR("object.minimumOSVersion"), v55, objc_opt_class());
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v86[15] = v54;
  v18 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Universal"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "keyPath:name:class:", CFSTR("object.isUniversal"), v52, objc_opt_class());
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Is Not Universal"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "negativeName:", v50);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v86[16] = v49;
  v19 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Supports Game Center"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "keyPath:name:class:", CFSTR("object.supportsGameCenter"), v47, objc_opt_class());
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedContentPropertyNameMarker(CFSTR("Does Not Support Game Center"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "negativeName:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v86[17] = v44;
  v20 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Supported Devices"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "keyPath:name:class:", CFSTR("object.supportedDevices"), v43, objc_opt_class());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "multipleValues:", 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v86[18] = v41;
  v21 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Supported Languages"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "keyPath:name:class:", CFSTR("object.supportedLanguages"), v40, objc_opt_class());
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "multipleValues:", 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v86[19] = v38;
  v22 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Screenshot URLs"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "keyPath:name:class:", CFSTR("object.screenshotURLs"), v23, objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "multipleValues:", 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v86[20] = v25;
  v26 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("iPad Screenshot URLs"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "keyPath:name:class:", CFSTR("object.iPadScreenshotURLs"), v27, objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "multipleValues:", 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v86[21] = v29;
  v30 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Download Size"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "block:name:class:", &__block_literal_global_203, v31, objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v86[22] = v32;
  v33 = (void *)MEMORY[0x1E0D13EF8];
  WFLocalizedContentPropertyNameMarker(CFSTR("Bundle Identifier"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "keyPath:name:class:", CFSTR("object.bundleIdentifier"), v34, objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v86[23] = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 24);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  return v37;
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
  return WFDeferrableLocalizedStringWithKey(CFSTR("App Store app"), CFSTR("App Store app"));
}

+ (id)pluralTypeDescription
{
  return WFDeferrableLocalizedStringWithKey(CFSTR("App Store apps"), CFSTR("App Store apps"));
}

+ (id)countDescription
{
  return WFLocalizedPluralString(CFSTR("%d App Store apps"));
}

+ (BOOL)canLowercaseTypeDescription
{
  return 0;
}

void __44__WFAppStoreAppContentItem_propertyBuilders__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v5)(id, void *);
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  objc_msgSend(a2, "object");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D13F80]);
  objc_msgSend(v9, "fileSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithByteCount:", objc_msgSend(v7, "longLongValue"));
  v5[2](v5, v8);

}

void __44__WFAppStoreAppContentItem_propertyBuilders__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
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
  objc_msgSend(a2, "softwareObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "artistID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__WFAppStoreAppContentItem_propertyBuilders__block_invoke_2;
  v11[3] = &unk_1E7AF6C78;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v7, "lookupMediaWithIdentifiers:countryCode:completion:", v9, 0, v11);

}

void __44__WFAppStoreAppContentItem_propertyBuilders__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (BOOL)getListSubtitle:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v5 = a3;
    -[WFAppStoreAppContentItem softwareObject](self, "softwareObject");
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
    -[WFAppStoreAppContentItem softwareObject](self, "softwareObject");
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
    v10[2] = __53__WFAppStoreAppContentItem_getListThumbnail_forSize___block_invoke;
    v10[3] = &unk_1E7AF6B58;
    v11 = v7;
    -[WFiTunesObjectContentItem getArtworkForSize:completionHandler:](self, "getArtworkForSize:completionHandler:", v10, width, height);

  }
  return 1;
}

void __53__WFAppStoreAppContentItem_getListThumbnail_forSize___block_invoke(uint64_t a1, void *a2)
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
  v6[2] = __53__WFAppStoreAppContentItem_getListThumbnail_forSize___block_invoke_2;
  v6[3] = &unk_1E7AF76F0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __53__WFAppStoreAppContentItem_getListThumbnail_forSize___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0DC8070];
  v4[0] = &unk_1E7B8AFC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
