@implementation _SFPBActionItem

- (_SFPBActionItem)initWithFacade:(id)a3
{
  id v4;
  _SFPBActionItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _SFPBPunchout *v21;
  void *v22;
  _SFPBPunchout *v23;
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
  _SFPBGraphicalFloat *v34;
  _SFPBGraphicalFloat *v35;
  _SFPBGraphicalFloat *v36;
  _SFPBGraphicalFloat *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _SFPBImage *v47;
  void *v48;
  _SFPBImage *v49;
  void *v50;
  _SFPBImage *v51;
  void *v52;
  _SFPBImage *v53;
  void *v54;
  _SFPBLatLng *v55;
  void *v56;
  _SFPBLatLng *v57;
  void *v58;
  void *v59;
  void *v60;
  _SFPBURL *v61;
  void *v62;
  _SFPBURL *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  _SFPBPunchout *v71;
  void *v72;
  _SFPBPunchout *v73;
  _SFPBActionItem *v74;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBActionItem init](self, "init");

  if (v5)
  {
    objc_msgSend(v4, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "label");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBActionItem setLabel:](v5, "setLabel:", v7);

    }
    objc_msgSend(v4, "labelForLocalMedia");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "labelForLocalMedia");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBActionItem setLabelForLocalMedia:](v5, "setLabelForLocalMedia:", v9);

    }
    if (objc_msgSend(v4, "hasIsOverlay"))
      -[_SFPBActionItem setIsOverlay:](v5, "setIsOverlay:", objc_msgSend(v4, "isOverlay"));
    objc_msgSend(v4, "storeIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v11 = 0;
    }

    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    objc_msgSend(v4, "storeIdentifiers", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v77 != v15)
            objc_enumerationMutation(v12);
          v17 = *(id *)(*((_QWORD *)&v76 + 1) + 8 * i);
          if (v17)
            objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
      }
      while (v14);
    }

    -[_SFPBActionItem setStoreIdentifiers:](v5, "setStoreIdentifiers:", v11);
    if (objc_msgSend(v4, "hasRequiresLocalMedia"))
      -[_SFPBActionItem setRequiresLocalMedia:](v5, "setRequiresLocalMedia:", objc_msgSend(v4, "requiresLocalMedia"));
    objc_msgSend(v4, "localMediaIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "localMediaIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBActionItem setLocalMediaIdentifier:](v5, "setLocalMediaIdentifier:", v19);

    }
    objc_msgSend(v4, "punchout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBPunchout alloc];
      objc_msgSend(v4, "punchout");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBPunchout initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBActionItem setPunchout:](v5, "setPunchout:", v23);

    }
    objc_msgSend(v4, "applicationBundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBActionItem setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v25);

    }
    objc_msgSend(v4, "contactIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "contactIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBActionItem setContactIdentifier:](v5, "setContactIdentifier:", v27);

    }
    objc_msgSend(v4, "phoneNumber");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "phoneNumber");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBActionItem setPhoneNumber:](v5, "setPhoneNumber:", v29);

    }
    objc_msgSend(v4, "email");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v4, "email");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBActionItem setEmail:](v5, "setEmail:", v31);

    }
    objc_msgSend(v4, "mapsData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v4, "mapsData");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBActionItem setMapsData:](v5, "setMapsData:", v33);

    }
    if (objc_msgSend(v4, "hasLatitude"))
    {
      v34 = [_SFPBGraphicalFloat alloc];
      objc_msgSend(v4, "latitude");
      v35 = -[_SFPBGraphicalFloat initWithCGFloat:](v34, "initWithCGFloat:");
      -[_SFPBActionItem setLatitude:](v5, "setLatitude:", v35);

    }
    if (objc_msgSend(v4, "hasLongitude"))
    {
      v36 = [_SFPBGraphicalFloat alloc];
      objc_msgSend(v4, "longitude");
      v37 = -[_SFPBGraphicalFloat initWithCGFloat:](v36, "initWithCGFloat:");
      -[_SFPBActionItem setLongitude:](v5, "setLongitude:", v37);

    }
    objc_msgSend(v4, "provider");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v4, "provider");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBActionItem setProvider:](v5, "setProvider:", v39);

    }
    objc_msgSend(v4, "offerType");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v4, "offerType");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBActionItem setOfferType:](v5, "setOfferType:", v41);

    }
    objc_msgSend(v4, "type");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v4, "type");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBActionItem setType:](v5, "setType:", v43);

    }
    objc_msgSend(v4, "labelITunes");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v4, "labelITunes");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBActionItem setLabelITunes:](v5, "setLabelITunes:", v45);

    }
    if (objc_msgSend(v4, "hasIsITunes"))
      -[_SFPBActionItem setIsITunes:](v5, "setIsITunes:", objc_msgSend(v4, "isITunes"));
    objc_msgSend(v4, "icon");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = [_SFPBImage alloc];
      objc_msgSend(v4, "icon");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[_SFPBImage initWithFacade:](v47, "initWithFacade:", v48);
      -[_SFPBActionItem setIcon:](v5, "setIcon:", v49);

    }
    objc_msgSend(v4, "baseIcon");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v51 = [_SFPBImage alloc];
      objc_msgSend(v4, "baseIcon");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[_SFPBImage initWithFacade:](v51, "initWithFacade:", v52);
      -[_SFPBActionItem setBaseIcon:](v5, "setBaseIcon:", v53);

    }
    objc_msgSend(v4, "location");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      v55 = [_SFPBLatLng alloc];
      objc_msgSend(v4, "location");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[_SFPBLatLng initWithFacade:](v55, "initWithFacade:", v56);
      -[_SFPBActionItem setLocation:](v5, "setLocation:", v57);

    }
    objc_msgSend(v4, "messageIdentifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      objc_msgSend(v4, "messageIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBActionItem setMessageIdentifier:](v5, "setMessageIdentifier:", v59);

    }
    objc_msgSend(v4, "messageURL");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      v61 = [_SFPBURL alloc];
      objc_msgSend(v4, "messageURL");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = -[_SFPBURL initWithNSURL:](v61, "initWithNSURL:", v62);
      -[_SFPBActionItem setMessageURL:](v5, "setMessageURL:", v63);

    }
    objc_msgSend(v4, "persistentID");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      objc_msgSend(v4, "persistentID");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBActionItem setPersistentID:](v5, "setPersistentID:", v65);

    }
    if (objc_msgSend(v4, "hasMediaEntityType"))
      -[_SFPBActionItem setMediaEntityType:](v5, "setMediaEntityType:", objc_msgSend(v4, "mediaEntityType"));
    objc_msgSend(v4, "universalLibraryID");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (v66)
    {
      objc_msgSend(v4, "universalLibraryID");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBActionItem setUniversalLibraryID:](v5, "setUniversalLibraryID:", v67);

    }
    objc_msgSend(v4, "interactionContentType");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      objc_msgSend(v4, "interactionContentType");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBActionItem setInteractionContentType:](v5, "setInteractionContentType:", v69);

    }
    objc_msgSend(v4, "customDirectionsPunchout");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70)
    {
      v71 = [_SFPBPunchout alloc];
      objc_msgSend(v4, "customDirectionsPunchout");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = -[_SFPBPunchout initWithFacade:](v71, "initWithFacade:", v72);
      -[_SFPBActionItem setCustomDirectionsPunchout:](v5, "setCustomDirectionsPunchout:", v73);

    }
    if (objc_msgSend(v4, "hasShouldSearchDirectionsAlongCurrentRoute"))
      -[_SFPBActionItem setShouldSearchDirectionsAlongCurrentRoute:](v5, "setShouldSearchDirectionsAlongCurrentRoute:", objc_msgSend(v4, "shouldSearchDirectionsAlongCurrentRoute"));
    if (objc_msgSend(v4, "hasDirectionsMode"))
      -[_SFPBActionItem setDirectionsMode:](v5, "setDirectionsMode:", objc_msgSend(v4, "directionsMode"));
    v74 = v5;

  }
  return v5;
}

- (void)setLabel:(id)a3
{
  NSString *v4;
  NSString *label;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  label = self->_label;
  self->_label = v4;

}

- (void)setLabelForLocalMedia:(id)a3
{
  NSString *v4;
  NSString *labelForLocalMedia;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  labelForLocalMedia = self->_labelForLocalMedia;
  self->_labelForLocalMedia = v4;

}

- (void)setIsOverlay:(BOOL)a3
{
  self->_isOverlay = a3;
}

- (void)setStoreIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *storeIdentifiers;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  storeIdentifiers = self->_storeIdentifiers;
  self->_storeIdentifiers = v4;

}

- (void)clearStoreIdentifiers
{
  -[NSArray removeAllObjects](self->_storeIdentifiers, "removeAllObjects");
}

- (void)addStoreIdentifiers:(id)a3
{
  id v4;
  NSArray *storeIdentifiers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  storeIdentifiers = self->_storeIdentifiers;
  v8 = v4;
  if (!storeIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_storeIdentifiers;
    self->_storeIdentifiers = v6;

    v4 = v8;
    storeIdentifiers = self->_storeIdentifiers;
  }
  -[NSArray addObject:](storeIdentifiers, "addObject:", v4);

}

- (unint64_t)storeIdentifiersCount
{
  return -[NSArray count](self->_storeIdentifiers, "count");
}

- (id)storeIdentifiersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_storeIdentifiers, "objectAtIndexedSubscript:", a3);
}

- (void)setRequiresLocalMedia:(BOOL)a3
{
  self->_requiresLocalMedia = a3;
}

- (void)setLocalMediaIdentifier:(id)a3
{
  NSString *v4;
  NSString *localMediaIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  localMediaIdentifier = self->_localMediaIdentifier;
  self->_localMediaIdentifier = v4;

}

- (void)setPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_punchout, a3);
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *applicationBundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  applicationBundleIdentifier = self->_applicationBundleIdentifier;
  self->_applicationBundleIdentifier = v4;

}

- (void)setContactIdentifier:(id)a3
{
  NSString *v4;
  NSString *contactIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v4;

}

- (void)setPhoneNumber:(id)a3
{
  NSString *v4;
  NSString *phoneNumber;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = v4;

}

- (void)setEmail:(id)a3
{
  NSString *v4;
  NSString *email;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  email = self->_email;
  self->_email = v4;

}

- (void)setMapsData:(id)a3
{
  NSData *v4;
  NSData *mapsData;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  mapsData = self->_mapsData;
  self->_mapsData = v4;

}

- (void)setLatitude:(id)a3
{
  objc_storeStrong((id *)&self->_latitude, a3);
}

- (void)setLongitude:(id)a3
{
  objc_storeStrong((id *)&self->_longitude, a3);
}

- (void)setProvider:(id)a3
{
  NSString *v4;
  NSString *provider;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  provider = self->_provider;
  self->_provider = v4;

}

- (void)setOfferType:(id)a3
{
  NSString *v4;
  NSString *offerType;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  offerType = self->_offerType;
  self->_offerType = v4;

}

- (void)setType:(id)a3
{
  NSString *v4;
  NSString *type;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  type = self->_type;
  self->_type = v4;

}

- (void)setLabelITunes:(id)a3
{
  NSString *v4;
  NSString *labelITunes;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  labelITunes = self->_labelITunes;
  self->_labelITunes = v4;

}

- (void)setIsITunes:(BOOL)a3
{
  self->_isITunes = a3;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void)setBaseIcon:(id)a3
{
  objc_storeStrong((id *)&self->_baseIcon, a3);
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)setMessageIdentifier:(id)a3
{
  NSString *v4;
  NSString *messageIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  messageIdentifier = self->_messageIdentifier;
  self->_messageIdentifier = v4;

}

- (void)setMessageURL:(id)a3
{
  objc_storeStrong((id *)&self->_messageURL, a3);
}

- (void)setPersistentID:(id)a3
{
  NSString *v4;
  NSString *persistentID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  persistentID = self->_persistentID;
  self->_persistentID = v4;

}

- (void)setMediaEntityType:(int)a3
{
  self->_mediaEntityType = a3;
}

- (void)setUniversalLibraryID:(id)a3
{
  NSString *v4;
  NSString *universalLibraryID;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  universalLibraryID = self->_universalLibraryID;
  self->_universalLibraryID = v4;

}

- (void)setInteractionContentType:(id)a3
{
  NSString *v4;
  NSString *interactionContentType;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  interactionContentType = self->_interactionContentType;
  self->_interactionContentType = v4;

}

- (void)setCustomDirectionsPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_customDirectionsPunchout, a3);
}

- (void)setShouldSearchDirectionsAlongCurrentRoute:(BOOL)a3
{
  self->_shouldSearchDirectionsAlongCurrentRoute = a3;
}

- (void)setDirectionsMode:(int)a3
{
  self->_directionsMode = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBActionItemReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBActionItem label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBActionItem labelForLocalMedia](self, "labelForLocalMedia");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  if (-[_SFPBActionItem isOverlay](self, "isOverlay"))
    PBDataWriterWriteBOOLField();
  -[_SFPBActionItem storeIdentifiers](self, "storeIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v35;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v9);
  }

  if (-[_SFPBActionItem requiresLocalMedia](self, "requiresLocalMedia"))
    PBDataWriterWriteBOOLField();
  -[_SFPBActionItem localMediaIdentifier](self, "localMediaIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    PBDataWriterWriteStringField();

  -[_SFPBActionItem punchout](self, "punchout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBActionItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteStringField();

  -[_SFPBActionItem contactIdentifier](self, "contactIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    PBDataWriterWriteStringField();

  -[_SFPBActionItem phoneNumber](self, "phoneNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    PBDataWriterWriteStringField();

  -[_SFPBActionItem email](self, "email");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    PBDataWriterWriteStringField();

  -[_SFPBActionItem mapsData](self, "mapsData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    PBDataWriterWriteDataField();

  -[_SFPBActionItem latitude](self, "latitude");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    PBDataWriterWriteSubmessage();

  -[_SFPBActionItem longitude](self, "longitude");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    PBDataWriterWriteSubmessage();

  -[_SFPBActionItem provider](self, "provider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    PBDataWriterWriteStringField();

  -[_SFPBActionItem offerType](self, "offerType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    PBDataWriterWriteStringField();

  -[_SFPBActionItem type](self, "type");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    PBDataWriterWriteStringField();

  -[_SFPBActionItem labelITunes](self, "labelITunes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    PBDataWriterWriteStringField();

  if (-[_SFPBActionItem isITunes](self, "isITunes"))
    PBDataWriterWriteBOOLField();
  -[_SFPBActionItem icon](self, "icon");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    PBDataWriterWriteSubmessage();

  -[_SFPBActionItem baseIcon](self, "baseIcon");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    PBDataWriterWriteSubmessage();

  -[_SFPBActionItem location](self, "location");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    PBDataWriterWriteSubmessage();

  -[_SFPBActionItem messageIdentifier](self, "messageIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    PBDataWriterWriteStringField();

  -[_SFPBActionItem messageURL](self, "messageURL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    PBDataWriterWriteSubmessage();

  -[_SFPBActionItem persistentID](self, "persistentID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    PBDataWriterWriteStringField();

  if (-[_SFPBActionItem mediaEntityType](self, "mediaEntityType"))
    PBDataWriterWriteInt32Field();
  -[_SFPBActionItem universalLibraryID](self, "universalLibraryID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    PBDataWriterWriteStringField();

  -[_SFPBActionItem interactionContentType](self, "interactionContentType");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
    PBDataWriterWriteStringField();

  -[_SFPBActionItem customDirectionsPunchout](self, "customDirectionsPunchout");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBActionItem shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBActionItem directionsMode](self, "directionsMode"))
    PBDataWriterWriteInt32Field();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int isOverlay;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int requiresLocalMedia;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  int v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  int v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  int isITunes;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  int v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  int v119;
  int mediaEntityType;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  int v125;
  uint64_t v126;
  void *v127;
  void *v128;
  void *v129;
  int v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  int v135;
  BOOL v136;
  int shouldSearchDirectionsAlongCurrentRoute;
  int directionsMode;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_131;
  -[_SFPBActionItem label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem label](self, "label");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBActionItem label](self, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem labelForLocalMedia](self, "labelForLocalMedia");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labelForLocalMedia");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem labelForLocalMedia](self, "labelForLocalMedia");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBActionItem labelForLocalMedia](self, "labelForLocalMedia");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "labelForLocalMedia");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_131;
  }
  else
  {

  }
  isOverlay = self->_isOverlay;
  if (isOverlay != objc_msgSend(v4, "isOverlay"))
    goto LABEL_131;
  -[_SFPBActionItem storeIdentifiers](self, "storeIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storeIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem storeIdentifiers](self, "storeIdentifiers");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[_SFPBActionItem storeIdentifiers](self, "storeIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "storeIdentifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_131;
  }
  else
  {

  }
  requiresLocalMedia = self->_requiresLocalMedia;
  if (requiresLocalMedia != objc_msgSend(v4, "requiresLocalMedia"))
    goto LABEL_131;
  -[_SFPBActionItem localMediaIdentifier](self, "localMediaIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localMediaIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem localMediaIdentifier](self, "localMediaIdentifier");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_SFPBActionItem localMediaIdentifier](self, "localMediaIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localMediaIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem punchout](self, "punchout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "punchout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem punchout](self, "punchout");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[_SFPBActionItem punchout](self, "punchout");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "punchout");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[_SFPBActionItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationBundleIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem contactIdentifier](self, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem contactIdentifier](self, "contactIdentifier");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v39;
    -[_SFPBActionItem contactIdentifier](self, "contactIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contactIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqual:", v42);

    if (!v43)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem phoneNumber](self, "phoneNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem phoneNumber](self, "phoneNumber");
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v45 = (void *)v44;
    -[_SFPBActionItem phoneNumber](self, "phoneNumber");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "phoneNumber");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "isEqual:", v47);

    if (!v48)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem email](self, "email");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "email");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem email](self, "email");
  v49 = objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v50 = (void *)v49;
    -[_SFPBActionItem email](self, "email");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "email");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v51, "isEqual:", v52);

    if (!v53)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem mapsData](self, "mapsData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mapsData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem mapsData](self, "mapsData");
  v54 = objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v55 = (void *)v54;
    -[_SFPBActionItem mapsData](self, "mapsData");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapsData");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v56, "isEqual:", v57);

    if (!v58)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem latitude](self, "latitude");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latitude");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem latitude](self, "latitude");
  v59 = objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v60 = (void *)v59;
    -[_SFPBActionItem latitude](self, "latitude");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "latitude");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v61, "isEqual:", v62);

    if (!v63)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem longitude](self, "longitude");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "longitude");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem longitude](self, "longitude");
  v64 = objc_claimAutoreleasedReturnValue();
  if (v64)
  {
    v65 = (void *)v64;
    -[_SFPBActionItem longitude](self, "longitude");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "longitude");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v66, "isEqual:", v67);

    if (!v68)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem provider](self, "provider");
  v69 = objc_claimAutoreleasedReturnValue();
  if (v69)
  {
    v70 = (void *)v69;
    -[_SFPBActionItem provider](self, "provider");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "provider");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v71, "isEqual:", v72);

    if (!v73)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem offerType](self, "offerType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "offerType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem offerType](self, "offerType");
  v74 = objc_claimAutoreleasedReturnValue();
  if (v74)
  {
    v75 = (void *)v74;
    -[_SFPBActionItem offerType](self, "offerType");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "offerType");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v76, "isEqual:", v77);

    if (!v78)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem type](self, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem type](self, "type");
  v79 = objc_claimAutoreleasedReturnValue();
  if (v79)
  {
    v80 = (void *)v79;
    -[_SFPBActionItem type](self, "type");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "type");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v81, "isEqual:", v82);

    if (!v83)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem labelITunes](self, "labelITunes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labelITunes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem labelITunes](self, "labelITunes");
  v84 = objc_claimAutoreleasedReturnValue();
  if (v84)
  {
    v85 = (void *)v84;
    -[_SFPBActionItem labelITunes](self, "labelITunes");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "labelITunes");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v86, "isEqual:", v87);

    if (!v88)
      goto LABEL_131;
  }
  else
  {

  }
  isITunes = self->_isITunes;
  if (isITunes != objc_msgSend(v4, "isITunes"))
    goto LABEL_131;
  -[_SFPBActionItem icon](self, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem icon](self, "icon");
  v90 = objc_claimAutoreleasedReturnValue();
  if (v90)
  {
    v91 = (void *)v90;
    -[_SFPBActionItem icon](self, "icon");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "icon");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v92, "isEqual:", v93);

    if (!v94)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem baseIcon](self, "baseIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "baseIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem baseIcon](self, "baseIcon");
  v95 = objc_claimAutoreleasedReturnValue();
  if (v95)
  {
    v96 = (void *)v95;
    -[_SFPBActionItem baseIcon](self, "baseIcon");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "baseIcon");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = objc_msgSend(v97, "isEqual:", v98);

    if (!v99)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem location](self, "location");
  v100 = objc_claimAutoreleasedReturnValue();
  if (v100)
  {
    v101 = (void *)v100;
    -[_SFPBActionItem location](self, "location");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_msgSend(v102, "isEqual:", v103);

    if (!v104)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem messageIdentifier](self, "messageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem messageIdentifier](self, "messageIdentifier");
  v105 = objc_claimAutoreleasedReturnValue();
  if (v105)
  {
    v106 = (void *)v105;
    -[_SFPBActionItem messageIdentifier](self, "messageIdentifier");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageIdentifier");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v107, "isEqual:", v108);

    if (!v109)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem messageURL](self, "messageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem messageURL](self, "messageURL");
  v110 = objc_claimAutoreleasedReturnValue();
  if (v110)
  {
    v111 = (void *)v110;
    -[_SFPBActionItem messageURL](self, "messageURL");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageURL");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = objc_msgSend(v112, "isEqual:", v113);

    if (!v114)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem persistentID](self, "persistentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "persistentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem persistentID](self, "persistentID");
  v115 = objc_claimAutoreleasedReturnValue();
  if (v115)
  {
    v116 = (void *)v115;
    -[_SFPBActionItem persistentID](self, "persistentID");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentID");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_msgSend(v117, "isEqual:", v118);

    if (!v119)
      goto LABEL_131;
  }
  else
  {

  }
  mediaEntityType = self->_mediaEntityType;
  if (mediaEntityType != objc_msgSend(v4, "mediaEntityType"))
    goto LABEL_131;
  -[_SFPBActionItem universalLibraryID](self, "universalLibraryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalLibraryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem universalLibraryID](self, "universalLibraryID");
  v121 = objc_claimAutoreleasedReturnValue();
  if (v121)
  {
    v122 = (void *)v121;
    -[_SFPBActionItem universalLibraryID](self, "universalLibraryID");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "universalLibraryID");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = objc_msgSend(v123, "isEqual:", v124);

    if (!v125)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem interactionContentType](self, "interactionContentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionContentType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_130;
  -[_SFPBActionItem interactionContentType](self, "interactionContentType");
  v126 = objc_claimAutoreleasedReturnValue();
  if (v126)
  {
    v127 = (void *)v126;
    -[_SFPBActionItem interactionContentType](self, "interactionContentType");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interactionContentType");
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = objc_msgSend(v128, "isEqual:", v129);

    if (!v130)
      goto LABEL_131;
  }
  else
  {

  }
  -[_SFPBActionItem customDirectionsPunchout](self, "customDirectionsPunchout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "customDirectionsPunchout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_130:

    goto LABEL_131;
  }
  -[_SFPBActionItem customDirectionsPunchout](self, "customDirectionsPunchout");
  v131 = objc_claimAutoreleasedReturnValue();
  if (v131)
  {
    v132 = (void *)v131;
    -[_SFPBActionItem customDirectionsPunchout](self, "customDirectionsPunchout");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "customDirectionsPunchout");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = objc_msgSend(v133, "isEqual:", v134);

    if (!v135)
      goto LABEL_131;
  }
  else
  {

  }
  shouldSearchDirectionsAlongCurrentRoute = self->_shouldSearchDirectionsAlongCurrentRoute;
  if (shouldSearchDirectionsAlongCurrentRoute == objc_msgSend(v4, "shouldSearchDirectionsAlongCurrentRoute"))
  {
    directionsMode = self->_directionsMode;
    v136 = directionsMode == objc_msgSend(v4, "directionsMode");
    goto LABEL_132;
  }
LABEL_131:
  v136 = 0;
LABEL_132:

  return v136;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  unint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  unint64_t v33;
  NSUInteger v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSUInteger v38;
  NSUInteger v39;

  v39 = -[NSString hash](self->_label, "hash");
  v3 = -[NSString hash](self->_labelForLocalMedia, "hash");
  if (self->_isOverlay)
    v4 = 2654435761;
  else
    v4 = 0;
  v37 = v4;
  v38 = v3;
  v5 = -[NSArray hash](self->_storeIdentifiers, "hash");
  if (self->_requiresLocalMedia)
    v6 = 2654435761;
  else
    v6 = 0;
  v35 = v6;
  v36 = v5;
  v34 = -[NSString hash](self->_localMediaIdentifier, "hash");
  v33 = -[_SFPBPunchout hash](self->_punchout, "hash");
  v32 = -[NSString hash](self->_applicationBundleIdentifier, "hash");
  v31 = -[NSString hash](self->_contactIdentifier, "hash");
  v30 = -[NSString hash](self->_phoneNumber, "hash");
  v29 = -[NSString hash](self->_email, "hash");
  v28 = -[NSData hash](self->_mapsData, "hash");
  v27 = -[_SFPBGraphicalFloat hash](self->_latitude, "hash");
  v26 = -[_SFPBGraphicalFloat hash](self->_longitude, "hash");
  v25 = -[NSString hash](self->_provider, "hash");
  v24 = -[NSString hash](self->_offerType, "hash");
  v23 = -[NSString hash](self->_type, "hash");
  v7 = -[NSString hash](self->_labelITunes, "hash");
  if (self->_isITunes)
    v8 = 2654435761;
  else
    v8 = 0;
  v9 = -[_SFPBImage hash](self->_icon, "hash", v8, v7);
  v10 = -[_SFPBImage hash](self->_baseIcon, "hash");
  v11 = -[_SFPBLatLng hash](self->_location, "hash");
  v12 = -[NSString hash](self->_messageIdentifier, "hash");
  v13 = -[_SFPBURL hash](self->_messageURL, "hash");
  v14 = -[NSString hash](self->_persistentID, "hash");
  v15 = 2654435761 * self->_mediaEntityType;
  v16 = -[NSString hash](self->_universalLibraryID, "hash");
  v17 = -[NSString hash](self->_interactionContentType, "hash");
  v18 = -[_SFPBPunchout hash](self->_customDirectionsPunchout, "hash");
  v19 = 2654435761;
  if (!self->_shouldSearchDirectionsAlongCurrentRoute)
    v19 = 0;
  return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ (2654435761 * self->_directionsMode);
}

- (id)dictionaryRepresentation
{
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
  uint64_t v14;
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
  id v71;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_applicationBundleIdentifier)
  {
    -[_SFPBActionItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("applicationBundleIdentifier"));

  }
  if (self->_baseIcon)
  {
    -[_SFPBActionItem baseIcon](self, "baseIcon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("baseIcon"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("baseIcon"));

    }
  }
  if (self->_contactIdentifier)
  {
    -[_SFPBActionItem contactIdentifier](self, "contactIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("contactIdentifier"));

  }
  if (self->_customDirectionsPunchout)
  {
    -[_SFPBActionItem customDirectionsPunchout](self, "customDirectionsPunchout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("customDirectionsPunchout"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("customDirectionsPunchout"));

    }
  }
  if (self->_directionsMode)
  {
    v14 = -[_SFPBActionItem directionsMode](self, "directionsMode");
    if (v14 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = *(&off_1E40421B0 + v14);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("directionsMode"));

  }
  if (self->_email)
  {
    -[_SFPBActionItem email](self, "email");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("email"));

  }
  if (self->_icon)
  {
    -[_SFPBActionItem icon](self, "icon");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("icon"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("icon"));

    }
  }
  if (self->_interactionContentType)
  {
    -[_SFPBActionItem interactionContentType](self, "interactionContentType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("interactionContentType"));

  }
  if (self->_isITunes)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBActionItem isITunes](self, "isITunes"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("isITunes"));

  }
  if (self->_isOverlay)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBActionItem isOverlay](self, "isOverlay"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("isOverlay"));

  }
  if (self->_label)
  {
    -[_SFPBActionItem label](self, "label");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("label"));

  }
  if (self->_labelForLocalMedia)
  {
    -[_SFPBActionItem labelForLocalMedia](self, "labelForLocalMedia");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("labelForLocalMedia"));

  }
  if (self->_labelITunes)
  {
    -[_SFPBActionItem labelITunes](self, "labelITunes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("labelITunes"));

  }
  if (self->_latitude)
  {
    -[_SFPBActionItem latitude](self, "latitude");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("latitude"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("latitude"));

    }
  }
  if (self->_localMediaIdentifier)
  {
    -[_SFPBActionItem localMediaIdentifier](self, "localMediaIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("localMediaIdentifier"));

  }
  if (self->_location)
  {
    -[_SFPBActionItem location](self, "location");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("location"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("location"));

    }
  }
  if (self->_longitude)
  {
    -[_SFPBActionItem longitude](self, "longitude");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "dictionaryRepresentation");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("longitude"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("longitude"));

    }
  }
  if (self->_mapsData)
  {
    -[_SFPBActionItem mapsData](self, "mapsData");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "base64EncodedStringWithOptions:", 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("mapsData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("mapsData"));

    }
  }
  if (self->_mediaEntityType)
  {
    v45 = -[_SFPBActionItem mediaEntityType](self, "mediaEntityType");
    if (v45 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = *(&off_1E40420F8 + v45);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("mediaEntityType"));

  }
  if (self->_messageIdentifier)
  {
    -[_SFPBActionItem messageIdentifier](self, "messageIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v47, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("messageIdentifier"));

  }
  if (self->_messageURL)
  {
    -[_SFPBActionItem messageURL](self, "messageURL");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "dictionaryRepresentation");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("messageURL"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v51, CFSTR("messageURL"));

    }
  }
  if (self->_offerType)
  {
    -[_SFPBActionItem offerType](self, "offerType");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v52, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("offerType"));

  }
  if (self->_persistentID)
  {
    -[_SFPBActionItem persistentID](self, "persistentID");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v54, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v55, CFSTR("persistentID"));

  }
  if (self->_phoneNumber)
  {
    -[_SFPBActionItem phoneNumber](self, "phoneNumber");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v56, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v57, CFSTR("phoneNumber"));

  }
  if (self->_provider)
  {
    -[_SFPBActionItem provider](self, "provider");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)objc_msgSend(v58, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("provider"));

  }
  if (self->_punchout)
  {
    -[_SFPBActionItem punchout](self, "punchout");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "dictionaryRepresentation");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v61, CFSTR("punchout"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("punchout"));

    }
  }
  if (self->_requiresLocalMedia)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBActionItem requiresLocalMedia](self, "requiresLocalMedia"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v63, CFSTR("requiresLocalMedia"));

  }
  if (self->_shouldSearchDirectionsAlongCurrentRoute)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBActionItem shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v64, CFSTR("shouldSearchDirectionsAlongCurrentRoute"));

  }
  if (self->_storeIdentifiers)
  {
    -[_SFPBActionItem storeIdentifiers](self, "storeIdentifiers");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)objc_msgSend(v65, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v66, CFSTR("storeIdentifiers"));

  }
  if (self->_type)
  {
    -[_SFPBActionItem type](self, "type");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (void *)objc_msgSend(v67, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("type"));

  }
  if (self->_universalLibraryID)
  {
    -[_SFPBActionItem universalLibraryID](self, "universalLibraryID");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (void *)objc_msgSend(v69, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v70, CFSTR("universalLibraryID"));

  }
  v71 = v3;

  return v71;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBActionItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBActionItem)initWithJSON:(id)a3
{
  void *v4;
  _SFPBActionItem *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBActionItem initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBActionItem)initWithDictionary:(id)a3
{
  id v4;
  _SFPBActionItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _SFPBPunchout *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _SFPBGraphicalFloat *v35;
  uint64_t v36;
  _SFPBGraphicalFloat *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  _SFPBImage *v48;
  uint64_t v49;
  _SFPBImage *v50;
  uint64_t v51;
  _SFPBLatLng *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  _SFPBURL *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _SFPBPunchout *v65;
  void *v66;
  void *v67;
  _SFPBActionItem *v68;
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
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  objc_super v97;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v97.receiver = self;
  v97.super_class = (Class)_SFPBActionItem;
  v5 = -[_SFPBActionItem init](&v97, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBActionItem setLabel:](v5, "setLabel:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("labelForLocalMedia"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBActionItem setLabelForLocalMedia:](v5, "setLabelForLocalMedia:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isOverlay"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v92 = v10;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBActionItem setIsOverlay:](v5, "setIsOverlay:", objc_msgSend(v10, "BOOLValue"));
    v78 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storeIdentifiers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v91 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v94;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v94 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v18 = (void *)objc_msgSend(v17, "copy");
              -[_SFPBActionItem addStoreIdentifiers:](v5, "addStoreIdentifiers:", v18);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
        }
        while (v14);
      }

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requiresLocalMedia"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBActionItem setRequiresLocalMedia:](v5, "setRequiresLocalMedia:", objc_msgSend(v19, "BOOLValue"));
    v77 = v19;
    v79 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localMediaIdentifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = (void *)objc_msgSend(v20, "copy");
      -[_SFPBActionItem setLocalMediaIdentifier:](v5, "setLocalMediaIdentifier:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("punchout"));
    v22 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v22);
      -[_SFPBActionItem setPunchout:](v5, "setPunchout:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("applicationBundleIdentifier"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = (void *)objc_msgSend(v24, "copy");
      -[_SFPBActionItem setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v25);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contactIdentifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v90 = v26;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = (void *)objc_msgSend(v26, "copy");
      -[_SFPBActionItem setContactIdentifier:](v5, "setContactIdentifier:", v27);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("phoneNumber"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v89 = v28;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = (void *)objc_msgSend(v28, "copy");
      -[_SFPBActionItem setPhoneNumber:](v5, "setPhoneNumber:", v29);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("email"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v88 = v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = (void *)objc_msgSend(v30, "copy");
      -[_SFPBActionItem setEmail:](v5, "setEmail:", v31);

    }
    v76 = v20;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mapsData"));
    v32 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v32, 0);
      -[_SFPBActionItem setMapsData:](v5, "setMapsData:", v33);

    }
    v74 = (void *)v32;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("latitude"));
    v34 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v87 = (void *)v34;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = -[_SFPBGraphicalFloat initWithDictionary:]([_SFPBGraphicalFloat alloc], "initWithDictionary:", v34);
      -[_SFPBActionItem setLatitude:](v5, "setLatitude:", v35);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("longitude"));
    v36 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v86 = (void *)v36;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = -[_SFPBGraphicalFloat initWithDictionary:]([_SFPBGraphicalFloat alloc], "initWithDictionary:", v36);
      -[_SFPBActionItem setLongitude:](v5, "setLongitude:", v37);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("provider"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = (void *)objc_msgSend(v38, "copy");
      -[_SFPBActionItem setProvider:](v5, "setProvider:", v39);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offerType"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v85 = v40;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = (void *)objc_msgSend(v40, "copy");
      -[_SFPBActionItem setOfferType:](v5, "setOfferType:", v41);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v84 = v42;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v43 = (void *)objc_msgSend(v42, "copy");
      -[_SFPBActionItem setType:](v5, "setType:", v43);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("labelITunes"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v83 = v44;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = (void *)objc_msgSend(v44, "copy");
      -[_SFPBActionItem setLabelITunes:](v5, "setLabelITunes:", v45);

    }
    v73 = v38;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isITunes"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBActionItem setIsITunes:](v5, "setIsITunes:", objc_msgSend(v46, "BOOLValue"));
    v72 = v46;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("icon"));
    v47 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v82 = (void *)v47;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v47);
      -[_SFPBActionItem setIcon:](v5, "setIcon:", v48);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("baseIcon"));
    v49 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v81 = (void *)v49;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v50 = -[_SFPBImage initWithDictionary:]([_SFPBImage alloc], "initWithDictionary:", v49);
      -[_SFPBActionItem setBaseIcon:](v5, "setBaseIcon:", v50);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location"));
    v51 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v52 = -[_SFPBLatLng initWithDictionary:]([_SFPBLatLng alloc], "initWithDictionary:", v51);
      -[_SFPBActionItem setLocation:](v5, "setLocation:", v52);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageIdentifier"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v80 = v53;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = (void *)objc_msgSend(v53, "copy");
      -[_SFPBActionItem setMessageIdentifier:](v5, "setMessageIdentifier:", v54);

    }
    v71 = (void *)v51;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageURL"));
    v55 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v56 = -[_SFPBURL initWithDictionary:]([_SFPBURL alloc], "initWithDictionary:", v55);
      -[_SFPBActionItem setMessageURL:](v5, "setMessageURL:", v56);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("persistentID"), v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v58 = (void *)objc_msgSend(v57, "copy");
      -[_SFPBActionItem setPersistentID:](v5, "setPersistentID:", v58);

    }
    v75 = (void *)v22;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mediaEntityType"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBActionItem setMediaEntityType:](v5, "setMediaEntityType:", objc_msgSend(v59, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("universalLibraryID"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v61 = (void *)objc_msgSend(v60, "copy");
      -[_SFPBActionItem setUniversalLibraryID:](v5, "setUniversalLibraryID:", v61);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("interactionContentType"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v63 = (void *)objc_msgSend(v62, "copy");
      -[_SFPBActionItem setInteractionContentType:](v5, "setInteractionContentType:", v63);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("customDirectionsPunchout"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = -[_SFPBPunchout initWithDictionary:]([_SFPBPunchout alloc], "initWithDictionary:", v64);
      -[_SFPBActionItem setCustomDirectionsPunchout:](v5, "setCustomDirectionsPunchout:", v65);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("shouldSearchDirectionsAlongCurrentRoute"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBActionItem setShouldSearchDirectionsAlongCurrentRoute:](v5, "setShouldSearchDirectionsAlongCurrentRoute:", objc_msgSend(v66, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("directionsMode"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBActionItem setDirectionsMode:](v5, "setDirectionsMode:", objc_msgSend(v67, "intValue"));
    v68 = v5;

  }
  return v5;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)labelForLocalMedia
{
  return self->_labelForLocalMedia;
}

- (BOOL)isOverlay
{
  return self->_isOverlay;
}

- (NSArray)storeIdentifiers
{
  return self->_storeIdentifiers;
}

- (BOOL)requiresLocalMedia
{
  return self->_requiresLocalMedia;
}

- (NSString)localMediaIdentifier
{
  return self->_localMediaIdentifier;
}

- (_SFPBPunchout)punchout
{
  return self->_punchout;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)email
{
  return self->_email;
}

- (NSData)mapsData
{
  return self->_mapsData;
}

- (_SFPBGraphicalFloat)latitude
{
  return self->_latitude;
}

- (_SFPBGraphicalFloat)longitude
{
  return self->_longitude;
}

- (NSString)provider
{
  return self->_provider;
}

- (NSString)offerType
{
  return self->_offerType;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)labelITunes
{
  return self->_labelITunes;
}

- (BOOL)isITunes
{
  return self->_isITunes;
}

- (_SFPBImage)icon
{
  return self->_icon;
}

- (_SFPBImage)baseIcon
{
  return self->_baseIcon;
}

- (_SFPBLatLng)location
{
  return self->_location;
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (_SFPBURL)messageURL
{
  return self->_messageURL;
}

- (NSString)persistentID
{
  return self->_persistentID;
}

- (int)mediaEntityType
{
  return self->_mediaEntityType;
}

- (NSString)universalLibraryID
{
  return self->_universalLibraryID;
}

- (NSString)interactionContentType
{
  return self->_interactionContentType;
}

- (_SFPBPunchout)customDirectionsPunchout
{
  return self->_customDirectionsPunchout;
}

- (BOOL)shouldSearchDirectionsAlongCurrentRoute
{
  return self->_shouldSearchDirectionsAlongCurrentRoute;
}

- (int)directionsMode
{
  return self->_directionsMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDirectionsPunchout, 0);
  objc_storeStrong((id *)&self->_interactionContentType, 0);
  objc_storeStrong((id *)&self->_universalLibraryID, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
  objc_storeStrong((id *)&self->_messageURL, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_baseIcon, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_labelITunes, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_offerType, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_longitude, 0);
  objc_storeStrong((id *)&self->_latitude, 0);
  objc_storeStrong((id *)&self->_mapsData, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_punchout, 0);
  objc_storeStrong((id *)&self->_localMediaIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifiers, 0);
  objc_storeStrong((id *)&self->_labelForLocalMedia, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
