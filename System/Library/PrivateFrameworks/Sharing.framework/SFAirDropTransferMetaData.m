@implementation SFAirDropTransferMetaData

- (SFAirDropTransferMetaData)initWithInformation:(id)a3
{
  id v4;
  SFAirDropTransferMetaData *v5;
  SFAirDropTransferMetaData *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t i;
  void *v16;
  __CFString *v17;
  void *v18;
  __CFString *v19;
  __CFString *PreferredIdentifierForTag;
  void *v21;
  uint64_t v22;
  id smallPreviewImage;
  uint64_t v24;
  id previewImage;
  void *v26;
  void *v27;
  CGImageRef CGImageWithDataOrURL;
  id senderIcon;
  uint64_t v30;
  NSString *senderBundleID;
  uint64_t v32;
  NSString *senderComputerName;
  uint64_t v34;
  NSString *senderEmail;
  uint64_t v36;
  NSString *senderEmailHash;
  uint64_t v38;
  NSString *senderCompositeName;
  uint64_t v40;
  NSString *senderFirstName;
  uint64_t v42;
  NSString *senderLastName;
  uint64_t v44;
  NSString *senderID;
  void *v46;
  CFStringRef v47;
  NSString *contactIdentifier;
  SFAirDropTransferMetaData *v50;
  void *v51;
  id obj;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)SFAirDropTransferMetaData;
  v5 = -[SFAirDropTransferMetaData init](&v58, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SFAirDropTransferMetaData setTransferTypes:](v5, "setTransferTypes:", 2);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VerifiableIdentity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_verifiableIdentity = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SenderIsMe"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_senderIsMe = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AutoAccept"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v6;
    v6->_canAutoAccept = objc_msgSend(v9, "BOOLValue");

    v51 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Files"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (id)objc_opt_new();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v55;
      v14 = (const __CFString *)*MEMORY[0x1E0CA5A88];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v55 != v13)
            objc_enumerationMutation(obj);
          v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "mutableCopy");
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("FileType"));
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (UTTypeIsDynamic(v17))
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("FileName"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "pathExtension");
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
            PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v14, v19, 0);

            objc_msgSend(v16, "setObject:forKeyedSubscript:", PreferredIdentifierForTag, CFSTR("FileType"));
          }
          objc_msgSend(v53, "addObject:", v16);

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      }
      while (v12);
    }

    v6 = v50;
    objc_storeStrong((id *)&v50->_rawFiles, v53);
    v4 = v51;
    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("ItemsDescription"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropTransferMetaData setItemsDescription:](v50, "setItemsDescription:", v21);

    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("SmallFileIcon"));
    v22 = objc_claimAutoreleasedReturnValue();
    smallPreviewImage = v50->_smallPreviewImage;
    v50->_smallPreviewImage = (id)v22;

    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("FileIcon"));
    v24 = objc_claimAutoreleasedReturnValue();
    previewImage = v50->_previewImage;
    v50->_previewImage = (id)v24;

    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("SenderIcon"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      CGImageWithDataOrURL = createCGImageWithDataOrURL(v26);
      senderIcon = v50->_senderIcon;
      v50->_senderIcon = CGImageWithDataOrURL;
    }
    else
    {
      senderIcon = v50->_senderIcon;
      v50->_senderIcon = 0;
    }

    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("BundleID"));
    v30 = objc_claimAutoreleasedReturnValue();
    senderBundleID = v50->_senderBundleID;
    v50->_senderBundleID = (NSString *)v30;

    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("SenderComputerName"));
    v32 = objc_claimAutoreleasedReturnValue();
    senderComputerName = v50->_senderComputerName;
    v50->_senderComputerName = (NSString *)v32;

    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("SenderEmail"));
    v34 = objc_claimAutoreleasedReturnValue();
    senderEmail = v50->_senderEmail;
    v50->_senderEmail = (NSString *)v34;

    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("SenderEmailHash"));
    v36 = objc_claimAutoreleasedReturnValue();
    senderEmailHash = v50->_senderEmailHash;
    v50->_senderEmailHash = (NSString *)v36;

    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("SenderCompositeName"));
    v38 = objc_claimAutoreleasedReturnValue();
    senderCompositeName = v50->_senderCompositeName;
    v50->_senderCompositeName = (NSString *)v38;

    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("SenderFirstName"));
    v40 = objc_claimAutoreleasedReturnValue();
    senderFirstName = v50->_senderFirstName;
    v50->_senderFirstName = (NSString *)v40;

    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("SenderLastName"));
    v42 = objc_claimAutoreleasedReturnValue();
    senderLastName = v50->_senderLastName;
    v50->_senderLastName = (NSString *)v42;

    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("SenderID"));
    v44 = objc_claimAutoreleasedReturnValue();
    senderID = v50->_senderID;
    v50->_senderID = (NSString *)v44;

    objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("SenderNode"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = SFNodeCopyContactIdentifier((uint64_t)v46);
      contactIdentifier = v50->_contactIdentifier;
      v50->_contactIdentifier = &v47->isa;

    }
  }

  return v6;
}

- (SFAirDropTransferMetaData)initWithTransferTypes:(int64_t)a3 canAutoAccept:(BOOL)a4 didAutoAccept:(BOOL)a5 verifiableIdentity:(BOOL)a6 senderIsMe:(BOOL)a7 contactIdentifier:(id)a8 senderBundleID:(id)a9 senderComputerName:(id)a10 senderEmail:(id)a11 senderEmailHash:(id)a12 senderCompositeName:(id)a13 senderFirstName:(id)a14 senderLastName:(id)a15 senderID:(id)a16 senderIcon:(id)a17 smallPreviewImage:(id)a18 previewImage:(id)a19 itemsDescription:(id)a20 itemsDescriptionAdvanced:(id)a21 items:(id)a22 rawFiles:(id)a23
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  SFAirDropTransferMetaData *v29;
  SFAirDropTransferMetaData *v30;
  SFAirDropTransferMetaData *v31;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  objc_super v50;

  v49 = a8;
  v48 = a9;
  v47 = a10;
  v46 = a11;
  v45 = a12;
  v44 = a13;
  v43 = a14;
  v42 = a15;
  v41 = a16;
  v40 = a17;
  v23 = a18;
  v24 = a19;
  v25 = a20;
  v26 = a21;
  v27 = a22;
  v28 = a23;
  v50.receiver = self;
  v50.super_class = (Class)SFAirDropTransferMetaData;
  v29 = -[SFAirDropTransferMetaData init](&v50, sel_init);
  v30 = v29;
  if (v29)
  {
    v29->_transferTypes = a3;
    v29->_canAutoAccept = a4;
    v29->_didAutoAccept = a5;
    v29->_verifiableIdentity = a6;
    v29->_senderIsMe = a7;
    objc_storeStrong((id *)&v29->_contactIdentifier, a8);
    objc_storeStrong((id *)&v30->_senderBundleID, a9);
    objc_storeStrong((id *)&v30->_senderComputerName, a10);
    objc_storeStrong((id *)&v30->_senderEmail, a11);
    objc_storeStrong((id *)&v30->_senderEmailHash, a12);
    objc_storeStrong((id *)&v30->_senderCompositeName, a13);
    objc_storeStrong((id *)&v30->_senderFirstName, a14);
    objc_storeStrong((id *)&v30->_senderLastName, a15);
    objc_storeStrong((id *)&v30->_senderID, a16);
    objc_storeStrong(&v30->_senderIcon, a17);
    objc_storeStrong(&v30->_smallPreviewImage, a18);
    objc_storeStrong(&v30->_previewImage, a19);
    objc_storeStrong((id *)&v30->_itemsDescription, a20);
    objc_storeStrong((id *)&v30->_itemsDescriptionAdvanced, a21);
    objc_storeStrong((id *)&v30->_items, a22);
    objc_storeStrong((id *)&v30->_rawFiles, a23);
    v31 = v30;
  }

  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAirDropTransferMetaData)initWithCoder:(id)a3
{
  id v4;
  SFAirDropTransferMetaData *v5;
  SFAirDropTransferMetaData *v6;

  v4 = a3;
  v5 = -[SFAirDropTransferMetaData init](self, "init");
  v6 = v5;
  if (v5)
    -[SFAirDropTransferMetaData updateUsingCoder:](v5, "updateUsingCoder:", v4);

  return v6;
}

- (void)updateUsingCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *contactIdentifier;
  NSString *v7;
  NSString *senderBundleID;
  NSString *v9;
  NSString *senderComputerName;
  NSString *v11;
  NSString *senderEmail;
  NSString *v13;
  NSString *senderEmailHash;
  NSString *v15;
  NSString *senderCompositeName;
  NSString *v17;
  NSString *senderFirstName;
  NSString *v19;
  NSString *senderLastName;
  NSString *v21;
  NSString *senderID;
  const __CFData *v23;
  const __CFData *v24;
  CGImageRef CGImageWithData;
  id senderIcon;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFData *v35;
  CGImageRef v36;
  id smallPreviewImage;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const __CFData *v46;
  CGImageRef v47;
  id previewImage;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  NSString *v58;
  NSString *itemsDescription;
  void *v60;
  void *v61;
  void *v62;
  NSDictionary *v63;
  NSDictionary *itemsDescriptionAdvanced;
  void *v65;
  void *v66;
  void *v67;
  NSSet *v68;
  NSSet *items;
  void *v70;
  void *v71;
  void *v72;
  NSArray *v73;
  NSArray *rawFiles;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD v79[2];
  _QWORD v80[4];

  v80[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_transferTypes = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("transferTypes"));
  self->_canAutoAccept = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canAutoAccept"));
  self->_didAutoAccept = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("didAutoAccept"));
  self->_verifiableIdentity = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("verifiableIdentity"));
  self->_senderIsMe = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("senderIsMe"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderBundleID"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  senderBundleID = self->_senderBundleID;
  self->_senderBundleID = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderComputerName"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  senderComputerName = self->_senderComputerName;
  self->_senderComputerName = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderEmail"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  senderEmail = self->_senderEmail;
  self->_senderEmail = v11;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderEmailHash"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  senderEmailHash = self->_senderEmailHash;
  self->_senderEmailHash = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderCompositeName"));
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  senderCompositeName = self->_senderCompositeName;
  self->_senderCompositeName = v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderFirstName"));
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  senderFirstName = self->_senderFirstName;
  self->_senderFirstName = v17;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderLastName"));
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  senderLastName = self->_senderLastName;
  self->_senderLastName = v19;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderID"));
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  senderID = self->_senderID;
  self->_senderID = v21;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_senderIconData"));
  v23 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    CGImageWithData = createCGImageWithData(v23);
    senderIcon = self->_senderIcon;
    self->_senderIcon = CGImageWithData;

    if (!self->_senderIcon)
    {
      airdrop_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[SFAirDropTransferMetaData updateUsingCoder:].cold.3(v27, v28, v29, v30, v31, v32, v33, v34);

    }
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_smallPreviewImageData"));
  v35 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = createCGImageWithData(v35);
    smallPreviewImage = self->_smallPreviewImage;
    self->_smallPreviewImage = v36;

    if (!self->_smallPreviewImage)
    {
      airdrop_log();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        -[SFAirDropTransferMetaData updateUsingCoder:].cold.2(v38, v39, v40, v41, v42, v43, v44, v45);

    }
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_previewImageData"));
  v46 = (const __CFData *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    v47 = createCGImageWithData(v46);
    previewImage = self->_previewImage;
    self->_previewImage = v47;

    if (!self->_previewImage)
    {
      airdrop_log();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        -[SFAirDropTransferMetaData updateUsingCoder:].cold.1(v49, v50, v51, v52, v53, v54, v55, v56);

    }
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemsDescription"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (NSString *)objc_msgSend(v57, "copy");
  itemsDescription = self->_itemsDescription;
  self->_itemsDescription = v58;

  v60 = (void *)MEMORY[0x1E0C99E60];
  v80[0] = objc_opt_class();
  v80[1] = objc_opt_class();
  v80[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 3);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setWithArray:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v62, CFSTR("itemsDescriptionAdvanced"));
  v63 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  itemsDescriptionAdvanced = self->_itemsDescriptionAdvanced;
  self->_itemsDescriptionAdvanced = v63;

  v65 = (void *)MEMORY[0x1E0C99E60];
  v79[0] = objc_opt_class();
  v79[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setWithArray:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v67, CFSTR("items"));
  v68 = (NSSet *)objc_claimAutoreleasedReturnValue();
  items = self->_items;
  self->_items = v68;

  v70 = (void *)MEMORY[0x1E0C99E60];
  v75 = objc_opt_class();
  v76 = objc_opt_class();
  v77 = objc_opt_class();
  v78 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 4);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setWithArray:", v71, v75, v76, v77);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v72, CFSTR("rawFiles"));
  v73 = (NSArray *)objc_claimAutoreleasedReturnValue();
  rawFiles = self->_rawFiles;
  self->_rawFiles = v73;

}

- (void)encodeWithCoder:(id)a3
{
  id senderIcon;
  __CFData *v5;
  id smallPreviewImage;
  __CFData *v7;
  id previewImage;
  __CFData *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeInt64:forKey:", self->_transferTypes, CFSTR("transferTypes"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_canAutoAccept, CFSTR("canAutoAccept"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_didAutoAccept, CFSTR("didAutoAccept"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_verifiableIdentity, CFSTR("verifiableIdentity"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_senderIsMe, CFSTR("senderIsMe"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_contactIdentifier, CFSTR("contactIdentifier"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_senderBundleID, CFSTR("senderBundleID"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_senderComputerName, CFSTR("senderComputerName"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_senderEmail, CFSTR("senderEmail"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_senderEmailHash, CFSTR("senderEmailHash"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_senderCompositeName, CFSTR("senderCompositeName"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_senderFirstName, CFSTR("senderFirstName"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_senderLastName, CFSTR("senderLastName"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_senderID, CFSTR("senderID"));
  senderIcon = self->_senderIcon;
  if (senderIcon)
  {
    v5 = copyImageData(senderIcon, 0);
    objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("_senderIconData"));

  }
  smallPreviewImage = self->_smallPreviewImage;
  if (smallPreviewImage)
  {
    v7 = copyImageData(smallPreviewImage, 0);
    objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("_smallPreviewImageData"));

  }
  previewImage = self->_previewImage;
  if (previewImage)
  {
    v9 = copyImageData(previewImage, 0);
    objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("_previewImageData"));

  }
  objc_msgSend(v10, "encodeObject:forKey:", self->_itemsDescription, CFSTR("itemsDescription"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_itemsDescriptionAdvanced, CFSTR("itemsDescriptionAdvanced"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_items, CFSTR("items"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_rawFiles, CFSTR("rawFiles"));

}

- (id)description
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v13;

  objc_opt_class();
  SFAirDropTransferTypesToString(self->_transferTypes);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v3 = 0;

  NSAppendPrintF();
  v4 = v3;

  NSAppendPrintF();
  v5 = v4;

  NSAppendPrintF();
  v6 = v5;

  NSAppendPrintF();
  v7 = v6;

  NSAppendPrintF();
  v8 = v7;

  NSAppendPrintF();
  v9 = v8;

  NSAppendPrintF();
  v10 = v9;

  NSAppendPrintF();
  v11 = v10;

  return v11;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  v3 = -[SFAirDropTransferMetaData transferTypes](self, "transferTypes");
  -[SFAirDropTransferMetaData contactIdentifier](self, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  -[SFAirDropTransferMetaData senderID](self, "senderID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  -[SFAirDropTransferMetaData senderBundleID](self, "senderBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  SFAirDropTransferMetaData *v4;
  unint64_t v5;
  BOOL v6;

  v4 = (SFAirDropTransferMetaData *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[SFAirDropTransferMetaData hash](self, "hash");
      v6 = v5 == -[SFAirDropTransferMetaData hash](v4, "hash");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)setItemsDescription:(id)a3
{
  id v5;
  NSString **p_itemsDescription;
  void *v7;
  NSObject *v8;
  NSString *v9;
  NSString *itemsDescription;

  v5 = a3;
  p_itemsDescription = &self->_itemsDescription;
  if ((objc_msgSend(v5, "isEqual:", self->_itemsDescription) & 1) == 0)
  {
    SFStringIsJSON(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        airdrop_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          -[SFAirDropTransferMetaData setItemsDescription:].cold.1((uint64_t)v7, v8);

        objc_storeStrong((id *)&self->_itemsDescriptionAdvanced, v7);
        -[NSDictionary objectForKeyedSubscript:](self->_itemsDescriptionAdvanced, "objectForKeyedSubscript:", CFSTR("SFAirDropActivitySubjectMain"));
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        itemsDescription = self->_itemsDescription;
        self->_itemsDescription = v9;
      }
      else
      {
        itemsDescription = *p_itemsDescription;
        *p_itemsDescription = 0;
      }

    }
    else
    {
      objc_storeStrong((id *)&self->_itemsDescription, a3);
    }

  }
}

- (int64_t)transferTypes
{
  return self->_transferTypes;
}

- (void)setTransferTypes:(int64_t)a3
{
  self->_transferTypes = a3;
}

- (BOOL)canAutoAccept
{
  return self->_canAutoAccept;
}

- (BOOL)didAutoAccept
{
  return self->_didAutoAccept;
}

- (void)setDidAutoAccept:(BOOL)a3
{
  self->_didAutoAccept = a3;
}

- (BOOL)isVerifiableIdentity
{
  return self->_verifiableIdentity;
}

- (BOOL)senderIsMe
{
  return self->_senderIsMe;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)senderBundleID
{
  return self->_senderBundleID;
}

- (NSString)senderComputerName
{
  return self->_senderComputerName;
}

- (NSString)senderEmail
{
  return self->_senderEmail;
}

- (NSString)senderEmailHash
{
  return self->_senderEmailHash;
}

- (NSString)senderCompositeName
{
  return self->_senderCompositeName;
}

- (NSString)senderFirstName
{
  return self->_senderFirstName;
}

- (NSString)senderLastName
{
  return self->_senderLastName;
}

- (NSString)senderID
{
  return self->_senderID;
}

- (id)senderIcon
{
  return self->_senderIcon;
}

- (id)smallPreviewImage
{
  return self->_smallPreviewImage;
}

- (id)previewImage
{
  return self->_previewImage;
}

- (NSString)itemsDescription
{
  return self->_itemsDescription;
}

- (NSDictionary)itemsDescriptionAdvanced
{
  return self->_itemsDescriptionAdvanced;
}

- (NSSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSArray)rawFiles
{
  return self->_rawFiles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawFiles, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_itemsDescriptionAdvanced, 0);
  objc_storeStrong((id *)&self->_itemsDescription, 0);
  objc_storeStrong(&self->_previewImage, 0);
  objc_storeStrong(&self->_smallPreviewImage, 0);
  objc_storeStrong(&self->_senderIcon, 0);
  objc_storeStrong((id *)&self->_senderID, 0);
  objc_storeStrong((id *)&self->_senderLastName, 0);
  objc_storeStrong((id *)&self->_senderFirstName, 0);
  objc_storeStrong((id *)&self->_senderCompositeName, 0);
  objc_storeStrong((id *)&self->_senderEmailHash, 0);
  objc_storeStrong((id *)&self->_senderEmail, 0);
  objc_storeStrong((id *)&self->_senderComputerName, 0);
  objc_storeStrong((id *)&self->_senderBundleID, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

- (void)updateUsingCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A2830000, a1, a3, "SFAirDropTransferMetaData: failed to extract preview image", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)updateUsingCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A2830000, a1, a3, "SFAirDropTransferMetaData: failed to extract small preview image", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)updateUsingCoder:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A2830000, a1, a3, "SFAirDropTransferMetaData: failed to extract sender icon", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)setItemsDescription:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A2830000, a2, OS_LOG_TYPE_DEBUG, "Transfer provided JSON items description: %@", (uint8_t *)&v2, 0xCu);
}

@end
