@implementation PBFPosterGalleryDataProvider

+ (id)demoPreviewProvider
{
  if (demoPreviewProvider_onceToken != -1)
    dispatch_once(&demoPreviewProvider_onceToken, &__block_literal_global_39);
  return (id)demoPreviewProvider_demoPreviewProvider;
}

void __51__PBFPosterGalleryDataProvider_demoPreviewProvider__block_invoke()
{
  void *v0;
  void *v1;
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
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  _QWORD v47[4];
  _QWORD v48[4];
  _QWORD v49[4];
  void *v50;
  _QWORD v51[3];
  _QWORD v52[4];
  _QWORD v53[4];
  _QWORD v54[4];
  _QWORD v55[8];

  v55[6] = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_new();
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", CFSTR("Smart Album"), &stru_1E86FC5B8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v1;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", CFSTR("Emoji"), &stru_1E86FC5B8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v2;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", CFSTR("Weather"), &stru_1E86FC5B8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v3;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", CFSTR("Collections"), &stru_1E86FC5B8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v4;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", CFSTR("Pride"), &stru_1E86FC5B8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v5;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", CFSTR("Astronomy"), &stru_1E86FC5B8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addSectionWithIdentifier:localizedTitle:type:items:", CFSTR("Featured Posters"), CFSTR("Featured Posters"), 1, v7);

  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v8;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v9;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v10;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v54[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v0;
  objc_msgSend(v0, "addSectionWithIdentifier:localizedTitle:type:items:", CFSTR("Featured Photos"), CFSTR("Featured Photos"), 0, v12);

  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v14;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v15;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v16;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v53[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addSectionWithIdentifier:localizedTitle:type:items:", CFSTR("Weather & Astronomy"), CFSTR("Weather & Astronomy"), 0, v18);

  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v19;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v20;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v21;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addSectionWithIdentifier:localizedTitle:type:items:", CFSTR("Emoji"), CFSTR("Emoji"), 0, v23);

  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v24;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v25;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v51[2] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSectionWithIdentifier:localizedTitle:type:items:", CFSTR("Pride"), CFSTR("Pride"), 0, v27);

  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, CFSTR("This face is inspired by the colors of the Pan-African Flag. The shapes change as you move, creating a face that's unique to you."));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSectionWithIdentifier:localizedTitle:type:items:", CFSTR("Unity"), CFSTR("Unity"), 2, v29);

  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v30;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v31;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v32;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSectionWithIdentifier:localizedTitle:type:items:", CFSTR("Collections"), CFSTR("Collections"), 0, v34);

  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v35;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v36;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v37;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSectionWithIdentifier:localizedTitle:type:items:", CFSTR("Color"), CFSTR("Color"), 0, v39);

  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v41;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v42;
  +[PBFGenericPosterPreview testPosterPreviewWithLocalizedTitle:description:](PBFGenericPosterPreview, "testPosterPreviewWithLocalizedTitle:description:", &stru_1E86FC5B8, &stru_1E86FC5B8);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = v43;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSectionWithIdentifier:localizedTitle:type:items:", CFSTR("Recents"), CFSTR("Recents"), 0, v44);

  v45 = objc_msgSend(v13, "copy");
  v46 = (void *)demoPreviewProvider_demoPreviewProvider;
  demoPreviewProvider_demoPreviewProvider = v45;

}

- (PBFPosterGalleryDataProvider)init
{
  PBFPosterGalleryDataProvider *v2;
  uint64_t v3;
  NSMutableOrderedSet *orderedSectionIdentifiers;
  uint64_t v5;
  NSMutableDictionary *sectionIdentifierToSectionType;
  uint64_t v7;
  NSMutableDictionary *sectionIdentifierToItems;
  uint64_t v9;
  NSMutableDictionary *posterPreviewForPosterUniqueIdentifier;
  uint64_t v11;
  NSMutableDictionary *sectionIdentifierToLocalizedTitle;
  uint64_t v13;
  NSMutableDictionary *sectionIdentifierToLocalizedSubtitle;
  uint64_t v15;
  NSMutableSet *outstandingSnapshotRequests;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PBFPosterGalleryDataProvider;
  v2 = -[PBFPosterGalleryDataProvider init](&v18, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    orderedSectionIdentifiers = v2->_orderedSectionIdentifiers;
    v2->_orderedSectionIdentifiers = (NSMutableOrderedSet *)v3;

    v5 = objc_opt_new();
    sectionIdentifierToSectionType = v2->_sectionIdentifierToSectionType;
    v2->_sectionIdentifierToSectionType = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    sectionIdentifierToItems = v2->_sectionIdentifierToItems;
    v2->_sectionIdentifierToItems = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    posterPreviewForPosterUniqueIdentifier = v2->_posterPreviewForPosterUniqueIdentifier;
    v2->_posterPreviewForPosterUniqueIdentifier = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    sectionIdentifierToLocalizedTitle = v2->_sectionIdentifierToLocalizedTitle;
    v2->_sectionIdentifierToLocalizedTitle = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    sectionIdentifierToLocalizedSubtitle = v2->_sectionIdentifierToLocalizedSubtitle;
    v2->_sectionIdentifierToLocalizedSubtitle = (NSMutableDictionary *)v13;

    v15 = objc_opt_new();
    outstandingSnapshotRequests = v2->_outstandingSnapshotRequests;
    v2->_outstandingSnapshotRequests = (NSMutableSet *)v15;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[PBFPosterGalleryDataProvider invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PBFPosterGalleryDataProvider;
  -[PBFPosterGalleryDataProvider dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PBFPosterGalleryDataProvider *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[PBFPosterGalleryDataProvider init](+[PBFPosterGalleryDataProvider allocWithZone:](PBFPosterGalleryDataProvider, "allocWithZone:", a3), "init");
  v5 = (void *)-[NSMutableOrderedSet mutableCopy](self->_orderedSectionIdentifiers, "mutableCopy");
  -[PBFPosterGalleryDataProvider setOrderedSectionIdentifiers:](v4, "setOrderedSectionIdentifiers:", v5);

  v6 = (void *)-[NSMutableDictionary mutableCopy](self->_sectionIdentifierToItems, "mutableCopy");
  -[PBFPosterGalleryDataProvider setSectionIdentifierToItems:](v4, "setSectionIdentifierToItems:", v6);

  v7 = (void *)-[NSMutableDictionary mutableCopy](self->_sectionIdentifierToSectionType, "mutableCopy");
  -[PBFPosterGalleryDataProvider setSectionIdentifierToSectionType:](v4, "setSectionIdentifierToSectionType:", v7);

  v8 = (void *)-[NSMutableDictionary mutableCopy](self->_sectionIdentifierToLocalizedTitle, "mutableCopy");
  -[PBFPosterGalleryDataProvider setSectionIdentifierToLocalizedTitle:](v4, "setSectionIdentifierToLocalizedTitle:", v8);

  v9 = (void *)-[NSMutableDictionary mutableCopy](self->_sectionIdentifierToLocalizedSubtitle, "mutableCopy");
  -[PBFPosterGalleryDataProvider setSectionIdentifierToLocalizedSubtitle:](v4, "setSectionIdentifierToLocalizedSubtitle:", v9);

  v10 = (void *)-[NSMutableDictionary mutableCopy](self->_posterPreviewForPosterUniqueIdentifier, "mutableCopy");
  -[PBFPosterGalleryDataProvider setPosterPreviewForPosterUniqueIdentifier:](v4, "setPosterPreviewForPosterUniqueIdentifier:", v10);

  -[PBFPosterGalleryDataProvider setComplicationSnapshotProvider:](v4, "setComplicationSnapshotProvider:", self->_complicationSnapshotProvider);
  -[PBFPosterGalleryDataProvider setSnapshotProvider:](v4, "setSnapshotProvider:", self->_snapshotProvider);
  -[PBFPosterGalleryDataProvider setExtensionProvider:](v4, "setExtensionProvider:", self->_extensionProvider);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PBFGalleryMutableDataProvider *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[PBFPosterGalleryDataProvider init](+[PBFGalleryMutableDataProvider allocWithZone:](PBFGalleryMutableDataProvider, "allocWithZone:", a3), "init");
  v5 = (void *)-[NSMutableOrderedSet mutableCopy](self->_orderedSectionIdentifiers, "mutableCopy");
  -[PBFPosterGalleryDataProvider setOrderedSectionIdentifiers:](v4, "setOrderedSectionIdentifiers:", v5);

  v6 = (void *)-[NSMutableDictionary mutableCopy](self->_sectionIdentifierToItems, "mutableCopy");
  -[PBFPosterGalleryDataProvider setSectionIdentifierToItems:](v4, "setSectionIdentifierToItems:", v6);

  v7 = (void *)-[NSMutableDictionary mutableCopy](self->_sectionIdentifierToSectionType, "mutableCopy");
  -[PBFPosterGalleryDataProvider setSectionIdentifierToSectionType:](v4, "setSectionIdentifierToSectionType:", v7);

  v8 = (void *)-[NSMutableDictionary mutableCopy](self->_sectionIdentifierToLocalizedTitle, "mutableCopy");
  -[PBFPosterGalleryDataProvider setSectionIdentifierToLocalizedTitle:](v4, "setSectionIdentifierToLocalizedTitle:", v8);

  v9 = (void *)-[NSMutableDictionary mutableCopy](self->_sectionIdentifierToLocalizedSubtitle, "mutableCopy");
  -[PBFPosterGalleryDataProvider setSectionIdentifierToLocalizedSubtitle:](v4, "setSectionIdentifierToLocalizedSubtitle:", v9);

  v10 = (void *)-[NSMutableDictionary mutableCopy](self->_posterPreviewForPosterUniqueIdentifier, "mutableCopy");
  -[PBFPosterGalleryDataProvider setPosterPreviewForPosterUniqueIdentifier:](v4, "setPosterPreviewForPosterUniqueIdentifier:", v10);

  -[PBFPosterGalleryDataProvider setComplicationSnapshotProvider:](v4, "setComplicationSnapshotProvider:", self->_complicationSnapshotProvider);
  -[PBFPosterGalleryDataProvider setSnapshotProvider:](v4, "setSnapshotProvider:", self->_snapshotProvider);
  -[PBFPosterGalleryDataProvider setExtensionProvider:](v4, "setExtensionProvider:", self->_extensionProvider);
  return v4;
}

- (unint64_t)numberOfSections
{
  return -[NSMutableOrderedSet count](self->_orderedSectionIdentifiers, "count");
}

- (unint64_t)sectionIndexForIdentifier:(id)a3
{
  return -[NSMutableOrderedSet indexOfObject:](self->_orderedSectionIdentifiers, "indexOfObject:", a3);
}

- (NSOrderedSet)sectionIdentifiers
{
  return (NSOrderedSet *)(id)-[NSMutableOrderedSet copy](self->_orderedSectionIdentifiers, "copy");
}

- (id)sectionIdentifierForIndex:(int64_t)a3
{
  void *v5;

  if (a3 < 0)
  {
    v5 = 0;
  }
  else if (-[NSMutableOrderedSet count](self->_orderedSectionIdentifiers, "count") <= (unint64_t)a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableOrderedSet objectAtIndex:](self->_orderedSectionIdentifiers, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)itemsForSectionWithIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_sectionIdentifierToItems, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)localizedTitleForSectionWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_sectionIdentifierToLocalizedTitle, "objectForKey:", a3);
}

- (id)localizedSubtitleForSectionWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_sectionIdentifierToLocalizedSubtitle, "objectForKey:", a3);
}

- (unint64_t)numberOfItemsInSectionWithIdentifier:(id)a3
{
  void *v3;
  unint64_t v4;

  -[NSMutableDictionary objectForKey:](self->_sectionIdentifierToItems, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)previewForPreviewUniqueIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_posterPreviewForPosterUniqueIdentifier, "objectForKey:", a3);
}

- (id)posterPreviewsForPath:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *posterPreviewForPosterUniqueIdentifier;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  posterPreviewForPosterUniqueIdentifier = self->_posterPreviewForPosterUniqueIdentifier;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __54__PBFPosterGalleryDataProvider_posterPreviewsForPath___block_invoke;
  v14 = &unk_1E86F7108;
  v15 = v4;
  v16 = v5;
  v7 = v5;
  v8 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](posterPreviewForPosterUniqueIdentifier, "enumerateKeysAndObjectsUsingBlock:", &v11);
  v9 = (void *)objc_msgSend(v7, "copy", v11, v12, v13, v14);

  return v9;
}

void __54__PBFPosterGalleryDataProvider_posterPreviewsForPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "posterDescriptorLookupInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterDescriptorPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

}

- (id)posterPreviews
{
  void *v3;
  NSMutableDictionary *posterPreviewForPosterUniqueIdentifier;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)objc_opt_new();
  posterPreviewForPosterUniqueIdentifier = self->_posterPreviewForPosterUniqueIdentifier;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PBFPosterGalleryDataProvider_posterPreviews__block_invoke;
  v8[3] = &unk_1E86F7130;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](posterPreviewForPosterUniqueIdentifier, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

uint64_t __46__PBFPosterGalleryDataProvider_posterPreviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (BOOL)sectionShowsTitleLabel:(id)a3
{
  return -[PBFPosterGalleryDataProvider sectionTypeForSectionWithIdentifier:](self, "sectionTypeForSectionWithIdentifier:", a3) == 1;
}

- (BOOL)sectionShowsDescriptionLabel:(id)a3
{
  return -[PBFPosterGalleryDataProvider sectionTypeForSectionWithIdentifier:](self, "sectionTypeForSectionWithIdentifier:", a3) == 2;
}

- (int64_t)sectionTypeForSectionWithIdentifier:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSMutableDictionary objectForKey:](self->_sectionIdentifierToSectionType, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (id)buildSnapshot
{
  id v3;
  void *v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  -[NSMutableOrderedSet array](self->_orderedSectionIdentifiers, "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_orderedSectionIdentifiers;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_sectionIdentifierToItems, "objectForKey:", v10, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "valueForKey:", CFSTR("previewUniqueIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v12, v10);
      }
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_notifyObserversWillUpdate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "dataProviderWillUpdate:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversDidUpdate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_transactionsCount <= 0)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v8, "dataProviderDidUpdate:", self);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (void)_incrementTransactionCount:(BOOL)a3
{
  int64_t transactionsCount;
  BOOL v4;

  transactionsCount = self->_transactionsCount;
  self->_transactionsCount = transactionsCount + 1;
  if (transactionsCount)
    v4 = 1;
  else
    v4 = !a3;
  if (!v4)
    -[PBFPosterGalleryDataProvider _notifyObserversWillUpdate](self, "_notifyObserversWillUpdate", a3);
}

- (void)_decrementTransactionCount:(BOOL)a3
{
  _BOOL4 v3;
  int64_t transactionsCount;
  int64_t *p_transactionsCount;
  int64_t v7;
  void *v9;

  v3 = a3;
  p_transactionsCount = &self->_transactionsCount;
  transactionsCount = self->_transactionsCount;
  v7 = transactionsCount - 1;
  self->_transactionsCount = transactionsCount - 1;
  if (transactionsCount <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFPosterGalleryDataProvider.m"), 330, CFSTR("Transactions unbalanced!"));

    v7 = self->_transactionsCount;
  }
  if (v7 <= 0)
  {
    *p_transactionsCount = 0;
    p_transactionsCount[1] = 0;
    if (v3)
      -[PBFPosterGalleryDataProvider _notifyObserversDidUpdate](self, "_notifyObserversDidUpdate");
  }
}

- (void)_markChangeDidOccur
{
  ++self->_changeCount;
}

- (id)preparedSnapshotForPosterPreview:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:](PBFPosterSnapshotDefinition, "defaultPreviewDefinitionForPreview:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterGalleryDataProvider preparedSnapshotForPosterPreview:context:definition:](self, "preparedSnapshotForPosterPreview:context:definition:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fetchSnapshotForPosterPreview:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[PBFPosterSnapshotDefinition defaultPreviewDefinitionForPreview:](PBFPosterSnapshotDefinition, "defaultPreviewDefinitionForPreview:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterGalleryDataProvider fetchSnapshotForPosterPreview:context:definition:completion:](self, "fetchSnapshotForPosterPreview:context:definition:completion:", v10, v9, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)preparedSnapshotForPosterPreview:(id)a3 context:(id)a4 definition:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a5;
  +[PBFPosterSnapshotRequest snapshotRequestForPreview:context:definition:](PBFPosterSnapshotRequest, "snapshotRequestForPreview:context:definition:", a3, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterGalleryDataProvider snapshotProvider](self, "snapshotProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "posterSnapshotForRequest:definition:error:", v9, v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fetchSnapshotForPosterPreview:(id)a3 context:(id)a4 definition:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSMutableSet *v16;
  NSMutableSet *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  NSMutableSet *v23;
  _PBFSafeAssertion *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _PBFSafeAssertion *v30;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  NSMutableSet *v39;
  id v40;
  id v41;
  id v42;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v10;
  v33 = v11;
  +[PBFPosterSnapshotRequest snapshotRequestForPreview:context:definition:](PBFPosterSnapshotRequest, "snapshotRequestForPreview:context:definition:", v10, v11, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self->_outstandingSnapshotRequests;
  v17 = self->_outstandingSnapshotRequests;
  objc_sync_enter(v17);
  -[NSMutableSet addObject:](v16, "addObject:", v15);
  objc_sync_exit(v17);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
  -[PBFPosterGalleryDataProvider snapshotProvider](self, "snapshotProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __92__PBFPosterGalleryDataProvider_fetchSnapshotForPosterPreview_context_definition_completion___block_invoke;
  v38[3] = &unk_1E86F7158;
  v39 = v16;
  v21 = v18;
  v40 = v21;
  v22 = v15;
  v41 = v22;
  v42 = v13;
  v32 = v13;
  v23 = v16;
  objc_msgSend(v19, "fetchPosterSnapshotForRequest:definition:completion:", v22, v12, v38);
  v24 = [_PBFSafeAssertion alloc];
  v25 = v14;
  objc_msgSend(v14, "previewUniqueIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v20;
  v34[1] = 3221225472;
  v34[2] = __92__PBFPosterGalleryDataProvider_fetchSnapshotForPosterPreview_context_definition_completion___block_invoke_2;
  v34[3] = &unk_1E86F7180;
  v35 = v21;
  v36 = v19;
  v37 = v22;
  v27 = v22;
  v28 = v19;
  v29 = v21;
  v30 = -[BSSimpleAssertion initWithIdentifier:forReason:invalidationBlock:](v24, "initWithIdentifier:forReason:invalidationBlock:", v26, CFSTR("fetchSnapshotForPosterPreview:context:completion: invalidatableAssertion"), v34);

  return v30;
}

void __92__PBFPosterGalleryDataProvider_fetchSnapshotForPosterPreview_context_definition_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  objc_msgSend(*(id *)(a1 + 40), "setFlag:", 1);
  objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 48));
  objc_sync_exit(v6);

  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

void __92__PBFPosterGalleryDataProvider_fetchSnapshotForPosterPreview_context_definition_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "getFlag") & 1) == 0)
  {
    v3 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelRequests:reason:", v4, v5);

  }
}

- (void)fetchComplicationPreviewImagesForPreview:(id)a3 complicationSnapshotReceivedHandler:(id)a4 errorHandler:(id)a5 completion:(id)a6
{
  void (**v10)(id, _QWORD, id);
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  PBFPosterGalleryDataProvider *v26;
  void (**v27)(id, _QWORD);
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  void (**v32)(id, _QWORD, id);
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, _QWORD, id))a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  +[PBFComplicationSnapshotRequest requestsForPreview:](PBFComplicationSnapshotRequest, "requestsForPreview:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v27 = v12;
    v28 = v11;
    v14 = (void *)objc_msgSend(v13, "mutableCopy");
    v26 = self;
    -[PBFPosterGalleryDataProvider complicationSnapshotProvider](self, "complicationSnapshotProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preparedComplicationSnapshotsForRequests:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v16, "keyEnumerator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v14, "removeObject:", v22);
          if (v10)
          {
            objc_msgSend(v16, "objectForKey:", v22);
            a5 = (id)objc_claimAutoreleasedReturnValue();
            v10[2](v10, v22, a5);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v19);
    }

    if (objc_msgSend(v14, "count"))
    {
      -[PBFPosterGalleryDataProvider complicationSnapshotProvider](v26, "complicationSnapshotProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = MEMORY[0x1E0C809B0];
      if (v10)
      {
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __133__PBFPosterGalleryDataProvider_fetchComplicationPreviewImagesForPreview_complicationSnapshotReceivedHandler_errorHandler_completion___block_invoke;
        v31[3] = &unk_1E86F71A8;
        v25 = v31;
        a5 = &v32;
        v32 = v10;
      }
      else
      {
        v25 = 0;
      }
      v29[0] = v24;
      v29[1] = 3221225472;
      v29[2] = __133__PBFPosterGalleryDataProvider_fetchComplicationPreviewImagesForPreview_complicationSnapshotReceivedHandler_errorHandler_completion___block_invoke_2;
      v29[3] = &unk_1E86F71D0;
      v11 = v28;
      v30 = v28;
      v12 = v27;
      objc_msgSend(v23, "fetchComplicationSnapshotsForRequests:complicationSnapshotReceivedHandler:errorHandler:completionHandler:", v14, v25, v29, v27);

      if (v10)
      goto LABEL_21;
    }

    v12 = v27;
    v11 = v28;
  }
  if (v12)
    v12[2](v12, 0);
LABEL_21:

}

uint64_t __133__PBFPosterGalleryDataProvider_fetchComplicationPreviewImagesForPreview_complicationSnapshotReceivedHandler_errorHandler_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __133__PBFPosterGalleryDataProvider_fetchComplicationPreviewImagesForPreview_complicationSnapshotReceivedHandler_errorHandler_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;

  v5 = a2;
  v6 = a3;
  PBFLogGallery();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __133__PBFPosterGalleryDataProvider_fetchComplicationPreviewImagesForPreview_complicationSnapshotReceivedHandler_errorHandler_completion___block_invoke_2_cold_1((uint64_t)v5, (uint64_t)v6, v7);

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (id)preparedComplicationPreviewImagesForPreview:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[PBFComplicationSnapshotRequest requestsForPreview:](PBFComplicationSnapshotRequest, "requestsForPreview:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFPosterGalleryDataProvider complicationSnapshotProvider](self, "complicationSnapshotProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preparedComplicationSnapshotsForRequests:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)acquireExtensionInstance:(id)a3 reason:(id)a4 error:(id *)a5
{
  return (id)-[PFPosterExtensionProvider acquireInstanceForExtensionWithIdentifier:reason:error:](self->_extensionProvider, "acquireInstanceForExtensionWithIdentifier:reason:error:", a3, a4, a5);
}

- (void)relinquishExtensionInstance:(id)a3 reason:(id)a4
{
  -[PFPosterExtensionProvider relinquishExtensionInstanceWithIdentifier:reason:](self->_extensionProvider, "relinquishExtensionInstanceWithIdentifier:reason:", a3, a4);
}

- (void)invalidate
{
  NSMutableSet *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = self->_outstandingSnapshotRequests;
  objc_sync_enter(v3);
  if (-[NSMutableSet count](self->_outstandingSnapshotRequests, "count"))
  {
    -[PBFPosterGalleryDataProvider snapshotProvider](self, "snapshotProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelRequests:reason:", self->_outstandingSnapshotRequests, CFSTR("PBFPosterGalleryDataProvider invalidated"));

    -[NSMutableSet removeAllObjects](self->_outstandingSnapshotRequests, "removeAllObjects");
  }
  objc_sync_exit(v3);

  -[PBFPosterGalleryDataProvider complicationSnapshotProvider](self, "complicationSnapshotProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[PBFPosterGalleryDataProvider snapshotProvider](self, "snapshotProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "purgeSnapshotCacheForType:", 1);

  -[PBFPosterGalleryDataProvider snapshotProvider](self, "snapshotProvider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "purgeSnapshotCacheForType:", 2);

}

- (NSMutableOrderedSet)orderedSectionIdentifiers
{
  return self->_orderedSectionIdentifiers;
}

- (void)setOrderedSectionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_orderedSectionIdentifiers, a3);
}

- (NSMutableDictionary)sectionIdentifierToSectionType
{
  return self->_sectionIdentifierToSectionType;
}

- (void)setSectionIdentifierToSectionType:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIdentifierToSectionType, a3);
}

- (NSMutableDictionary)sectionIdentifierToItems
{
  return self->_sectionIdentifierToItems;
}

- (void)setSectionIdentifierToItems:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIdentifierToItems, a3);
}

- (NSMutableDictionary)posterPreviewForPosterUniqueIdentifier
{
  return self->_posterPreviewForPosterUniqueIdentifier;
}

- (void)setPosterPreviewForPosterUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_posterPreviewForPosterUniqueIdentifier, a3);
}

- (NSMutableDictionary)sectionIdentifierToLocalizedTitle
{
  return self->_sectionIdentifierToLocalizedTitle;
}

- (void)setSectionIdentifierToLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIdentifierToLocalizedTitle, a3);
}

- (NSMutableDictionary)sectionIdentifierToLocalizedSubtitle
{
  return self->_sectionIdentifierToLocalizedSubtitle;
}

- (void)setSectionIdentifierToLocalizedSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIdentifierToLocalizedSubtitle, a3);
}

- (PBFPosterSnapshotProviding)snapshotProvider
{
  return self->_snapshotProvider;
}

- (void)setSnapshotProvider:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotProvider, a3);
}

- (PBFComplicationSnapshotProviding)complicationSnapshotProvider
{
  return self->_complicationSnapshotProvider;
}

- (void)setComplicationSnapshotProvider:(id)a3
{
  objc_storeStrong((id *)&self->_complicationSnapshotProvider, a3);
}

- (PFPosterExtensionProvider)extensionProvider
{
  return self->_extensionProvider;
}

- (void)setExtensionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_extensionProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionProvider, 0);
  objc_storeStrong((id *)&self->_complicationSnapshotProvider, 0);
  objc_storeStrong((id *)&self->_snapshotProvider, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierToLocalizedSubtitle, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierToLocalizedTitle, 0);
  objc_storeStrong((id *)&self->_posterPreviewForPosterUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierToItems, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierToSectionType, 0);
  objc_storeStrong((id *)&self->_orderedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_outstandingSnapshotRequests, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __133__PBFPosterGalleryDataProvider_fetchComplicationPreviewImagesForPreview_complicationSnapshotReceivedHandler_errorHandler_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_ERROR, "Error fetching request %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
