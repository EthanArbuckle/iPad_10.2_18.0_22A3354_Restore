@implementation PUSharingHeaderController

- (PUSharingHeaderController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSharingHeaderController.m"), 50, CFSTR("%s is not available as initializer"), "-[PUSharingHeaderController init]");

  abort();
}

- (PUSharingHeaderController)initWithDataProvider:(id)a3
{
  id v5;
  PUSharingHeaderController *v6;
  PUSharingHeaderController *v7;
  id v8;
  LPLinkMetadata *v9;
  LPLinkMetadata *linkMetadata;
  void *v12;
  objc_super v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSharingHeaderController.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataProvider"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PUSharingHeaderController;
  v6 = -[PUSharingHeaderController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_dataProvider, v5);
    v8 = objc_alloc_init(MEMORY[0x1E0CC1130]);
    v9 = (LPLinkMetadata *)objc_alloc_init(MEMORY[0x1E0CC11A8]);
    linkMetadata = v7->_linkMetadata;
    v7->_linkMetadata = v9;

    -[LPLinkMetadata setSpecialization:](v7->_linkMetadata, "setSpecialization:", v8);
  }

  return v7;
}

- (void)updateIfNeeded
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  LPImage *icloudLinkImage;
  void *v15;
  void *v16;
  void *v17;
  LPImage *v18;
  LPImage *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  PXDisplayAsset *sharingHeaderFrontAsset;
  PXDisplayAsset *sharingHeaderBackAsset;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  PXDisplayAsset *v31;
  PXDisplayAsset *v32;
  int showingUnmodifiedOriginalThumbnail;
  int v34;
  int v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  LPImage *v39;
  LPImage *placeholderImage;
  void *v41;
  void *v42;
  void *v43;
  LPImage *v44;
  LPImage *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  SEL v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  -[PUSharingHeaderController dataProvider](self, "dataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedSelectedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUSharingHeaderController linkMetadata](self, "linkMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSharingHeaderController.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("linkMetadata"));

  }
  objc_msgSend(v6, "specialization");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSharingHeaderController.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("statusMetadata"));

  }
  -[PUSharingHeaderController _sharingHeaderStatus](self, "_sharingHeaderStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStatus:", v8);
  -[PUSharingHeaderController dataProvider](self, "dataProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTitle:", v10);
  -[PUSharingHeaderController dataProvider](self, "dataProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "shareAsCMM") & 1) != 0)
  {
    -[PUSharingHeaderController dataProvider](self, "dataProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isActionSheet");

    if ((v13 & 1) == 0)
    {
      icloudLinkImage = self->_icloudLinkImage;
      if (!icloudLinkImage)
      {
        v15 = (void *)MEMORY[0x1E0DC3870];
        objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "systemImageNamed:withConfiguration:", CFSTR("link.icloud"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (LPImage *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v17);
        v19 = self->_icloudLinkImage;
        self->_icloudLinkImage = v18;

        icloudLinkImage = self->_icloudLinkImage;
      }
      v62[0] = icloudLinkImage;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAlternateImages:", v20);

      goto LABEL_56;
    }
  }
  else
  {

  }
  -[PUSharingHeaderController dataProvider](self, "dataProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "keyAsset");
  v22 = objc_claimAutoreleasedReturnValue();

  v57 = v10;
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v23;
  }
  objc_msgSend(v6, "alternateImages");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v7;
  if (objc_msgSend(v24, "containsObject:", self->_icloudLinkImage))
  {

    sharingHeaderFrontAsset = self->_sharingHeaderFrontAsset;
    self->_sharingHeaderFrontAsset = 0;

    sharingHeaderBackAsset = self->_sharingHeaderBackAsset;
    self->_sharingHeaderBackAsset = 0;

    v24 = 0;
    self->_showingUnmodifiedOriginalThumbnail = 0;
  }
  v53 = a2;
  -[PUSharingHeaderController dataProvider](self, "dataProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "person");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v28 = objc_claimAutoreleasedReturnValue();
  v59 = v5;
  v56 = (void *)v22;
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    v29 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v29 = objc_claimAutoreleasedReturnValue();
  }
  -[PUSharingHeaderController dataProvider](self, "dataProvider");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v30, "sendAsUnmodifiedOriginals");

  v31 = self->_sharingHeaderFrontAsset;
  v32 = self->_sharingHeaderBackAsset;
  showingUnmodifiedOriginalThumbnail = self->_showingUnmodifiedOriginalThumbnail;
  v55 = v31;
  if (v28 | (unint64_t)v31)
    v34 = objc_msgSend((id)v28, "isEqual:", v31) ^ 1;
  else
    v34 = 0;
  v35 = v29 | v32;
  if (v29 | (unint64_t)v32)
    v35 = objc_msgSend((id)v29, "isEqual:", v32) ^ 1;
  if (showingUnmodifiedOriginalThumbnail != v61)
  {
    v34 = v28 != 0;
    v35 = v29 != 0;
  }
  v54 = v35;
  if (v24)
  {
    v36 = objc_msgSend(v24, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v36 = objc_claimAutoreleasedReturnValue();
  }
  v37 = (void *)v36;
  if (v34)
  {
    objc_storeStrong((id *)&self->_sharingHeaderFrontAsset, (id)v28);
    if (v28)
    {
      if (objc_msgSend((id)v28, "isEqual:", v32))
      {
        if ((unint64_t)objc_msgSend(v24, "count") <= 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", v53, self, CFSTR("PUSharingHeaderController.m"), 134, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previousImagesStack.count > 1"));

        }
        objc_msgSend(v24, "objectAtIndexedSubscript:", 1);
        v38 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        PXLinkPresentationImageForAsset();
        v38 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (!v60)
        goto LABEL_38;
      -[PUSharingHeaderController _linkPresentationImageForPerson:](self, "_linkPresentationImageForPerson:", v60);
      v38 = objc_claimAutoreleasedReturnValue();
    }
    v39 = (LPImage *)v38;
    if (v38)
    {
LABEL_42:
      objc_msgSend(v37, "setObject:atIndexedSubscript:", v39, 0);

      goto LABEL_43;
    }
LABEL_38:
    placeholderImage = self->_placeholderImage;
    if (placeholderImage)
    {
      v39 = placeholderImage;
    }
    else
    {
      v41 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 3);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "systemImageNamed:withConfiguration:", CFSTR("photo"), v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = (LPImage *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithPlatformImage:", v43);
      v45 = self->_placeholderImage;
      self->_placeholderImage = v44;

      v39 = self->_placeholderImage;
      if (!v39)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", v53, self, CFSTR("PUSharingHeaderController.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("frontImage"));

        v39 = 0;
      }
    }
    goto LABEL_42;
  }
LABEL_43:
  if (v54)
  {
    objc_storeStrong((id *)&self->_sharingHeaderBackAsset, (id)v29);
    if (!v29)
      goto LABEL_52;
    if (objc_msgSend((id)v29, "isEqual:", v55))
    {
      if (!objc_msgSend(v24, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", v53, self, CFSTR("PUSharingHeaderController.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previousImagesStack.count > 0"));

      }
      objc_msgSend(v24, "objectAtIndexedSubscript:", 0);
      v46 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PXLinkPresentationImageForAsset();
      v46 = objc_claimAutoreleasedReturnValue();
    }
    v47 = (void *)v46;
    if (v46)
    {
      objc_msgSend(v37, "setObject:atIndexedSubscript:", v46, 1);

    }
    else
    {
LABEL_52:
      objc_msgSend(v37, "removeObjectAtIndex:", 1);
    }
  }
  self->_showingUnmodifiedOriginalThumbnail = v61;
  if ((objc_msgSend(v24, "isEqualToArray:", v37) & 1) == 0)
    objc_msgSend(v6, "setAlternateImages:", v37);

  v7 = v58;
  v5 = v59;
  v10 = v57;
LABEL_56:

}

- (id)_sharingHeaderStatus
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;
  __CFString *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  void *v41;
  int v42;
  __CFString *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  int isKindOfClass;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
  void *v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  void *v67;
  __CFString *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  __CFString *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  SEL v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint64_t v122;
  _BYTE v123[128];
  _QWORD v124[4];

  v124[2] = *MEMORY[0x1E0C80C00];
  -[PUSharingHeaderController dataProvider](self, "dataProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isActionSheet");

  if (v5)
  {
    -[PUSharingHeaderController dataProvider](self, "dataProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedSubtitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v7);
    else
      v8 = 0;
    goto LABEL_88;
  }
  v110 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUSharingHeaderController dataProvider](self, "dataProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "orderedSelectedAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v122 = 0;
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  -[PUSharingHeaderController dataProvider](self, "dataProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "assetTypeCount");
  }
  else
  {
    v122 = 0;
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
  }

  v111 = *((_QWORD *)&v120 + 1);
  -[PUSharingHeaderController dataProvider](self, "dataProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = objc_msgSend(v13, "preferredExportFormat");

  -[PUSharingHeaderController dataProvider](self, "dataProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "shareAsCMM");

  if (v15)
  {
    PXLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v16);

  }
  -[PUSharingHeaderController dataProvider](self, "dataProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "sendAsAssetBundles");

  if ((v18 & 1) != 0)
  {
    v19 = CFSTR("SHARING_HEADER_ALL_PHOTOS_DATA");
LABEL_16:
    PULocalizedString(v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v22);

    goto LABEL_17;
  }
  -[PUSharingHeaderController dataProvider](self, "dataProvider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "sendAsUnmodifiedOriginals");

  if (v21)
  {
    if (objc_msgSend(v10, "count") == 1)
      v19 = CFSTR("SHARING_HEADER_UNMODIFIED_ORIGINALS");
    else
      v19 = CFSTR("SHARING_HEADER_UNMODIFIED_ORIGINALS_MULTIPLE");
    goto LABEL_16;
  }
LABEL_17:
  if (!objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "showSingleVideoDurationInShareSheetHeader");

    if (v24)
    {
      if (objc_msgSend(v10, "count") == 1 && *((_QWORD *)&v118 + 1) && !(_QWORD)v119)
      {
        objc_msgSend(v10, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "duration");
        PXLocalizedVideoDuration();
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v26);
      }
    }
  }
  -[PUSharingHeaderController dataProvider](self, "dataProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "excludeCaption");
  if (*((_QWORD *)&v121 + 1))
    v29 = v28;
  else
    v29 = 1;

  -[PUSharingHeaderController dataProvider](self, "dataProvider");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "excludeAccessibilityDescription");

  if (v29 == 1)
  {
    v31 = 0;
  }
  else
  {
    objc_msgSend(v7, "addObject:", CFSTR("{CaptionIcon}"));
    -[PUSharingHeaderController createTextAttachmentForGlyphImageWithName:](self, "createTextAttachmentForGlyphImageWithName:", CFSTR("quote.bubble"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "image");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "baselineOffsetFromBottom");
    v35 = v34;
    objc_msgSend(v33, "alignmentRectInsets");
    v37 = v36 - v35 + 1.0;
    objc_msgSend(v32, "bounds");
    objc_msgSend(v33, "size");
    objc_msgSend(v32, "setBounds:", 0.0, v37, v38, v39);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v32);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v40 = v113;
  if (!*((_QWORD *)&v120 + 1))
    goto LABEL_50;
  -[PUSharingHeaderController dataProvider](self, "dataProvider");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "excludeLocation");

  if (!v42)
  {
    objc_msgSend(v10, "firstObject");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v10, "firstObject");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "photoLibrary");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "librarySpecificFetchOptions");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v124[0] = v51;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 1);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v124[1] = v52;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 2);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v50, "setSortDescriptors:", v53);
      v107 = v10;
      v109 = v50;
      objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAssets:withType:options:", v10, 3, v50);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "sharingHeaderLocationDisplayStyle");

      v108 = v54;
      if (!v57)
      {
LABEL_52:
        if (v111 == 1)
          v68 = CFSTR("SHARING_HEADER_LOCATION_ON");
        else
          v68 = CFSTR("SHARING_HEADER_LOCATION_ON_MULTIPLE");
        PULocalizedString(v68);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v107;
        goto LABEL_72;
      }
      v104 = v53;
      v105 = v48;
      v106 = v31;
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v58 = v54;
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v114, v123, 16);
      if (v59)
      {
        v60 = v59;
        v61 = *(_QWORD *)v115;
        while (2)
        {
          for (i = 0; i != v60; ++i)
          {
            if (*(_QWORD *)v115 != v61)
              objc_enumerationMutation(v58);
            objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1) + 8 * i), "localizedLocationNames");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "addObjectsFromArray:", v63);
            if ((unint64_t)objc_msgSend(v55, "count") >= 2 && v57 == 1)
            {

              v40 = v113;
              v48 = v105;
              v31 = v106;
              v53 = v104;
              goto LABEL_52;
            }
            v64 = objc_msgSend(v55, "count");

            if (v64 >= 2 && v57 == 2)
              goto LABEL_48;
          }
          v60 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v114, v123, 16);
          if (v60)
            continue;
          break;
        }
      }
LABEL_48:

      v65 = objc_msgSend(v55, "count");
      if (objc_msgSend(v55, "count"))
      {
        objc_msgSend(v55, "objectAtIndexedSubscript:", 0);
        v66 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v66 = 0;
      }
      v10 = v107;
      v40 = v113;
      if ((unint64_t)objc_msgSend(v55, "count") < 2)
      {
        v69 = 0;
      }
      else
      {
        objc_msgSend(v55, "objectAtIndexedSubscript:", 1);
        v69 = objc_claimAutoreleasedReturnValue();
      }
      v31 = v106;
      v112 = (void *)v69;
      if (v65 == 1)
      {
        if (v66)
        {
          PULocalizedString(CFSTR("SHARING_HEADER_ONE_LOCATION"));
          v70 = v66;
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          PUStringWithValidatedFormat();
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          v66 = v70;
          goto LABEL_69;
        }
      }
      else if (v66 | v69)
      {
        if (v65 == 2)
        {
          v31 = v106;
          v53 = v104;
          if (v66 && v69)
          {
            PULocalizedString(CFSTR("SHARING_HEADER_TWO_LOCATIONS"));
            v72 = v66;
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            PUStringWithValidatedFormat();
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            v66 = v72;
          }
          else
          {
            if (v66)
              v94 = (void *)v66;
            else
              v94 = (void *)v69;
            v95 = v94;
            if (!v95)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v100 = v66;
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "handleFailureInMethod:object:file:lineNumber:description:", v110, self, CFSTR("PUSharingHeaderController.m"), 318, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locationName"));

              v66 = v100;
            }
            PULocalizedString(CFSTR("SHARING_HEADER_ONE_LOCATION_AND_MORE"));
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            PUStringWithValidatedFormat();
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            v40 = v113;
          }
          v48 = v105;
          goto LABEL_71;
        }
        if (v65 < 3)
        {
          v44 = 0;
          v31 = v106;
        }
        else
        {
          v48 = v105;
          if (v66 && v69)
          {
            PULocalizedString(CFSTR("SHARING_HEADER_TWO_LOCATIONS_AND_N_MORE"));
            v92 = v66;
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            PUStringWithValidatedFormat();
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            v66 = v92;
            v31 = v106;
            goto LABEL_70;
          }
          if (v66)
            v97 = (void *)v66;
          else
            v97 = (void *)v69;
          v98 = v97;
          if (!v98)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v102 = v66;
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "handleFailureInMethod:object:file:lineNumber:description:", v110, self, CFSTR("PUSharingHeaderController.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locationName"));

            v66 = v102;
          }
          PULocalizedString(CFSTR("SHARING_HEADER_ONE_LOCATION_AND_N_MORE"));
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          PUStringWithValidatedFormat();
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v106;

          v40 = v113;
        }
LABEL_69:
        v48 = v105;
LABEL_70:
        v53 = v104;
LABEL_71:

LABEL_72:
        v45 = CFSTR("location.fill");
        goto LABEL_73;
      }
      PULocalizedString(CFSTR("SHARING_HEADER_LOCATION_ON"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_69;
    }
LABEL_50:
    v67 = 0;
    goto LABEL_75;
  }
  if (objc_msgSend(v10, "count") == 1)
    v43 = CFSTR("SHARING_HEADER_LOCATION_OFF");
  else
    v43 = CFSTR("SHARING_HEADER_LOCATION_OFF_MULTIPLE");
  PULocalizedString(v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = CFSTR("location.slash");
LABEL_73:
  PULocalizedString(CFSTR("SHARING_HEADER_LOCATION_STRING_WITH_LOCATION_ICON_PREFIX"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  PUStringWithValidatedFormat();
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUSharingHeaderController createTextAttachmentForGlyphImageWithName:](self, "createTextAttachmentForGlyphImageWithName:", v45, CFSTR("{LocationIcon}"), v44);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "image");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "alignmentRectInsets");
  v79 = v78;
  objc_msgSend(v76, "bounds");
  objc_msgSend(v77, "size");
  objc_msgSend(v76, "setBounds:", 0.0, v79, v80, v81);
  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v76);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    objc_msgSend(v7, "addObject:", v75);

  }
LABEL_75:
  if (v40 == 2)
  {
    v82 = CFSTR("SHARING_HEADER_FORMAT_COMPATIBLE");
    goto LABEL_79;
  }
  if (v40 == 1)
  {
    v82 = CFSTR("SHARING_HEADER_FORMAT_CURRENT");
LABEL_79:
    PULocalizedString(v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v83);

  }
  if (objc_msgSend(v7, "count"))
  {
    PULocalizedString(CFSTR("SHARING_HEADER_SUBTITLE_SEPARATOR"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v85);
    if (v31)
    {
      v86 = objc_msgSend(v85, "rangeOfString:", CFSTR("{CaptionIcon}"));
      objc_msgSend(v8, "replaceCharactersInRange:withAttributedString:", v86, v87, v31);
      objc_msgSend(v85, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{CaptionIcon}"), CFSTR(" "));
      v88 = objc_claimAutoreleasedReturnValue();

      v85 = (void *)v88;
    }
    if (v67)
    {
      v89 = objc_msgSend(v85, "rangeOfString:", CFSTR("{LocationIcon}"));
      objc_msgSend(v8, "replaceCharactersInRange:withAttributedString:", v89, v90, v67);
    }

  }
  else
  {
    v8 = v31;
  }

LABEL_88:
  return v8;
}

- (id)createTextAttachmentForGlyphImageWithName:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0DC1350];
  v4 = *MEMORY[0x1E0DC4A88];
  v5 = a3;
  objc_msgSend(v3, "preferredFontForTextStyle:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:scale:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "imageWithRenderingMode:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC12B0]), "initWithData:ofType:", 0, 0);
  objc_msgSend(v10, "setImage:", v9);

  return v10;
}

- (id)_linkPresentationImageForPerson:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUSharingHeaderController.m"), 402, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("person"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  v7 = objc_opt_class();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__PUSharingHeaderController__linkPresentationImageForPerson___block_invoke;
  v12[3] = &unk_1E589ECF8;
  v13 = v5;
  v8 = v5;
  objc_msgSend(v6, "registerObjectOfClass:visibility:loadHandler:", v7, 0, v12);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC1178]), "initWithItemProvider:properties:placeholderImage:", v6, 0, 0);

  return v9;
}

- (PUSharingHeaderDataProvider)dataProvider
{
  return (PUSharingHeaderDataProvider *)objc_loadWeakRetained((id *)&self->_dataProvider);
}

- (LPLinkMetadata)linkMetadata
{
  return self->_linkMetadata;
}

- (void)setLinkMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_linkMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkMetadata, 0);
  objc_destroyWeak((id *)&self->_dataProvider);
  objc_storeStrong((id *)&self->_sharingHeaderBackAsset, 0);
  objc_storeStrong((id *)&self->_sharingHeaderFrontAsset, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_icloudLinkImage, 0);
}

uint64_t __61__PUSharingHeaderController__linkPresentationImageForPerson___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0D7B690]);
  v5 = *(_QWORD *)(a1 + 32);
  PLPhysicalScreenScale();
  v7 = (void *)objc_msgSend(v4, "initWithPerson:targetSize:displayScale:", v5, 40.0, 40.0, v6);
  objc_msgSend(v7, "setDeliveryMode:", 1);
  objc_msgSend(MEMORY[0x1E0D7B698], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__PUSharingHeaderController__linkPresentationImageForPerson___block_invoke_2;
  v11[3] = &unk_1E58AA608;
  v12 = v3;
  v9 = v3;
  objc_msgSend(v8, "requestFaceCropForOptions:resultHandler:", v7, v11);

  return 0;
}

void __61__PUSharingHeaderController__linkPresentationImageForPerson___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D7C5B8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315394;
      v7 = "-[PUSharingHeaderController _linkPresentationImageForPerson:]_block_invoke_2";
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "%s: Error fetching thumbnail image data: %@", (uint8_t *)&v6, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

+ (PUSharingHeaderController)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PUSharingHeaderController.m"), 54, CFSTR("%s is not available as initializer"), "+[PUSharingHeaderController new]");

  abort();
}

@end
