@implementation TLITunesTone

- (TLITunesTone)initWithPropertyListRepresentation:(id)a3 filePath:(id)a4
{
  id v6;
  id v7;
  TLITunesTone *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  void *fadeOutDurationNumber;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  NSString *name;
  uint64_t v20;
  NSString *filePath;
  void *v22;
  char isKindOfClass;
  void *v24;
  id v25;
  uint64_t v26;
  NSString *albumTitle;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSString *artistName;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  NSString *genreName;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  NSNumber *syncIdentifier;
  id v45;
  void *v46;
  id v47;
  const char *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  NSString *storeFrontIdentifier;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  NSString *artworkFile;
  void *v64;
  char v65;
  double v66;
  void *v67;
  char v68;
  void *v69;
  char v70;
  void *v71;
  void *v72;
  id v73;
  char v74;
  void *v75;
  void *v76;
  NSNumber *v77;
  NSNumber *fadeInDurationNumber;
  void *v79;
  void *v80;
  NSNumber *v81;
  objc_super v83;

  v6 = a3;
  v7 = a4;
  v83.receiver = self;
  v83.super_class = (Class)TLITunesTone;
  v8 = -[TLITunesTone init](&v83, sel_init);
  if (v8)
  {
    objc_msgSend((id)objc_opt_class(), "_identifierForPropertyListRepresentation:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("Name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v9)
      v13 = v12 == 0;
    else
      v13 = 1;
    if (v13)
    {
      TLLogToneManagement();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[TLITunesTone initWithPropertyListRepresentation:filePath:].cold.1((uint64_t)v8, v6, v14);

      fadeOutDurationNumber = v8;
      v8 = 0;
    }
    else
    {
      v16 = objc_msgSend(v9, "copy");
      identifier = v8->_identifier;
      v8->_identifier = (NSString *)v16;

      v18 = objc_msgSend(v12, "copy");
      name = v8->_name;
      v8->_name = (NSString *)v18;

      v20 = objc_msgSend(v7, "copy");
      filePath = v8->_filePath;
      v8->_filePath = (NSString *)v20;

      objc_msgSend(v6, "objectForKey:", CFSTR("Album"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
        v24 = v22;
      else
        v24 = 0;
      v25 = v24;

      v26 = objc_msgSend(v25, "copy");
      albumTitle = v8->_albumTitle;
      v8->_albumTitle = (NSString *)v26;

      objc_msgSend(v6, "objectForKey:", CFSTR("Artist"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v28;
      else
        v29 = 0;
      v30 = v29;

      v31 = objc_msgSend(v30, "copy");
      artistName = v8->_artistName;
      v8->_artistName = (NSString *)v31;

      objc_msgSend(v6, "objectForKey:", CFSTR("Genre"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v34 = v33;
      else
        v34 = 0;
      v35 = v34;

      v36 = objc_msgSend(v35, "copy");
      genreName = v8->_genreName;
      v8->_genreName = (NSString *)v36;

      objc_msgSend(v6, "objectForKey:", CFSTR("Purchased"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v39 = objc_msgSend(v38, "BOOLValue");
      else
        v39 = 0;
      v8->_purchased = v39;

      objc_msgSend(v6, "objectForKey:", CFSTR("PID"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v41 = v40;
      else
        v41 = 0;
      v42 = v41;

      v43 = objc_msgSend(v42, "copy");
      syncIdentifier = v8->_syncIdentifier;
      v8->_syncIdentifier = (NSNumber *)v43;

      objc_msgSend(v6, "objectForKey:", CFSTR("Store Item ID"));
      v45 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v46 = v45;
      else
        v46 = 0;
      if (v46)
      {
        v47 = v46;
        v48 = (const char *)objc_msgSend(v47, "unsignedLongLongValue");

      }
      else
      {
        v49 = v45;
        v50 = 0;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v51 = v49;
        else
          v51 = 0;
        v52 = v51;

        v53 = objc_retainAutorelease(v52);
        v48 = (const char *)objc_msgSend(v53, "UTF8String");

        if (v48)
          v48 = (const char *)strtoull(v48, 0, 10);
      }

      v8->_storeItemIdentifier = (unint64_t)v48;
      objc_msgSend(v6, "objectForKey:", CFSTR("Store Front ID"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v55 = v54;
      else
        v55 = 0;
      v56 = v55;

      v57 = objc_msgSend(v56, "copy");
      storeFrontIdentifier = v8->_storeFrontIdentifier;
      v8->_storeFrontIdentifier = (NSString *)v57;

      objc_msgSend(v6, "objectForKey:", CFSTR("Artwork File"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v60 = v59;
      else
        v60 = 0;
      v61 = v60;

      v62 = objc_msgSend(v61, "copy");
      artworkFile = v8->_artworkFile;
      v8->_artworkFile = (NSString *)v62;

      objc_msgSend(v6, "objectForKey:", CFSTR("Total Time"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_opt_respondsToSelector();
      v66 = 0.0;
      if ((v65 & 1) != 0)
        v66 = (double)(unint64_t)objc_msgSend(v64, "unsignedIntegerValue", 0.0);
      v8->_duration = v66 / 1000.0;

      objc_msgSend(v6, "objectForKey:", CFSTR("Protected Content"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v68 = objc_msgSend(v67, "BOOLValue");
      else
        v68 = 0;
      v8->_protectedContent = v68;

      objc_msgSend(v6, "objectForKey:", CFSTR("Private"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v70 = objc_msgSend(v69, "BOOLValue");
      else
        v70 = 0;
      v8->_privateTone = v70;

      objc_msgSend(v6, "objectForKey:", CFSTR("Media Kind"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v72 = v71;
      else
        v72 = 0;
      v73 = v72;

      v74 = objc_msgSend(v73, "isEqualToString:", CFSTR("tone"));
      v8->_ringtone = v74 ^ 1;
      objc_msgSend(v6, "objectForKey:", CFSTR("Fade In"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v76 = v75;
      else
        v76 = 0;
      v77 = v76;

      fadeInDurationNumber = v8->_fadeInDurationNumber;
      v8->_fadeInDurationNumber = v77;

      objc_msgSend(v6, "objectForKey:", CFSTR("Fade Out"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v80 = v79;
      else
        v80 = 0;
      v81 = v80;

      fadeOutDurationNumber = v8->_fadeOutDurationNumber;
      v8->_fadeOutDurationNumber = v81;
    }

  }
  return v8;
}

- (TLITunesTone)initWithToneStoreDownload:(id)a3
{
  id v4;
  TLITunesTone *v5;
  void *v6;
  uint64_t v7;
  NSString *identifier;
  void *v9;
  uint64_t v10;
  NSString *name;
  void *v12;
  uint64_t v13;
  NSString *albumTitle;
  void *v15;
  uint64_t v16;
  NSString *artistName;
  void *v18;
  uint64_t v19;
  NSString *genreName;
  double v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TLITunesTone;
  v5 = -[TLITunesTone init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "toneIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = objc_msgSend(v6, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v10;

    objc_msgSend(v4, "albumTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    albumTitle = v5->_albumTitle;
    v5->_albumTitle = (NSString *)v13;

    objc_msgSend(v4, "artistName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    artistName = v5->_artistName;
    v5->_artistName = (NSString *)v16;

    objc_msgSend(v4, "genreName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    genreName = v5->_genreName;
    v5->_genreName = (NSString *)v19;

    v5->_storeItemIdentifier = objc_msgSend(v4, "storeItemIdentifier");
    objc_msgSend(v4, "duration");
    v5->_duration = v21;
    v5->_ringtone = objc_msgSend(v4, "isRingtone");
    v5->_purchased = 1;

  }
  return v5;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  __CFString **v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  objc_msgSend(v6, "appendFormat:", CFSTR("; identifier = \"%@\"), self->_identifier);
  objc_msgSend(v6, "appendFormat:", CFSTR("; name = \"%@\"), self->_name);
  if (self->_albumTitle)
    objc_msgSend(v6, "appendFormat:", CFSTR("; albumTitle = \"%@\"), self->_albumTitle);
  if (self->_artistName)
    objc_msgSend(v6, "appendFormat:", CFSTR("; artistName = \"%@\"), self->_artistName);
  if (self->_genreName)
    objc_msgSend(v6, "appendFormat:", CFSTR("; genreName = \"%@\"), self->_genreName);
  if (self->_duration > 0.00000011920929)
    objc_msgSend(v6, "appendFormat:", CFSTR("; duration = %f"), *(_QWORD *)&self->_duration);
  v7 = kToneMediaKindRingtone;
  if (!self->_ringtone)
    v7 = kToneMediaKindAlertTone;
  objc_msgSend(v6, "appendFormat:", CFSTR("; mediaKind = %@"), *v7);
  if (self->_purchased)
    objc_msgSend(v6, "appendString:", CFSTR("; isPurchased = YES"));
  if (self->_protectedContent)
    objc_msgSend(v6, "appendString:", CFSTR("; isProtectedContent = YES"));
  if (self->_privateTone)
    objc_msgSend(v6, "appendString:", CFSTR("; isPrivateTone = YES"));
  if (self->_storeItemIdentifier)
    objc_msgSend(v6, "appendFormat:", CFSTR("; storeItemIdentifier = %llu"), self->_storeItemIdentifier);
  if (self->_storeFrontIdentifier)
    objc_msgSend(v6, "appendFormat:", CFSTR("; storeFrontIdentifier = \"%@\"), self->_storeFrontIdentifier);
  if (self->_syncIdentifier)
    objc_msgSend(v6, "appendFormat:", CFSTR("; syncIdentifier = %@"), self->_syncIdentifier);
  if (self->_filePath)
    objc_msgSend(v6, "appendFormat:", CFSTR("; filePath = %@"), self->_filePath);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  TLITunesTone *v4;
  TLITunesTone *v5;
  NSString *identifier;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  NSString *name;
  unint64_t v12;
  NSString *filePath;
  unint64_t v14;
  NSString *albumTitle;
  unint64_t v16;
  NSString *artistName;
  unint64_t v18;
  NSString *genreName;
  unint64_t v20;
  NSNumber *syncIdentifier;
  unint64_t v22;
  NSString *storeFrontIdentifier;
  unint64_t v24;
  NSString *artworkFile;
  unint64_t v26;
  NSNumber *fadeInDurationNumber;
  unint64_t v28;
  NSNumber *fadeOutDurationNumber;
  NSNumber *v30;
  unint64_t v31;

  v4 = (TLITunesTone *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      identifier = v5->_identifier;
      v7 = self->_identifier;
      v8 = identifier;
      v9 = (void *)v8;
      if (!(v7 | v8))
        goto LABEL_11;
      LOBYTE(v10) = 0;
      if (!v7 || !v8)
        goto LABEL_88;
      if (v7 == v8)
      {
LABEL_11:

      }
      else
      {
        v10 = objc_msgSend((id)v7, "isEqualToString:", v8);

        if (!v10)
          goto LABEL_89;
      }
      name = v5->_name;
      v7 = self->_name;
      v12 = name;
      v9 = (void *)v12;
      if (!(v7 | v12))
        goto LABEL_18;
      LOBYTE(v10) = 0;
      if (!v7 || !v12)
        goto LABEL_88;
      if (v7 == v12)
      {
LABEL_18:

      }
      else
      {
        v10 = objc_msgSend((id)v7, "isEqualToString:", v12);

        if (!v10)
          goto LABEL_89;
      }
      filePath = v5->_filePath;
      v7 = self->_filePath;
      v14 = filePath;
      v9 = (void *)v14;
      if (!(v7 | v14))
        goto LABEL_25;
      LOBYTE(v10) = 0;
      if (!v7 || !v14)
        goto LABEL_88;
      if (v7 == v14)
      {
LABEL_25:

      }
      else
      {
        v10 = objc_msgSend((id)v7, "isEqualToString:", v14);

        if (!v10)
          goto LABEL_89;
      }
      albumTitle = v5->_albumTitle;
      v7 = self->_albumTitle;
      v16 = albumTitle;
      v9 = (void *)v16;
      if (!(v7 | v16))
        goto LABEL_32;
      LOBYTE(v10) = 0;
      if (!v7 || !v16)
        goto LABEL_88;
      if (v7 == v16)
      {
LABEL_32:

      }
      else
      {
        v10 = objc_msgSend((id)v7, "isEqualToString:", v16);

        if (!v10)
          goto LABEL_89;
      }
      artistName = v5->_artistName;
      v7 = self->_artistName;
      v18 = artistName;
      v9 = (void *)v18;
      if (!(v7 | v18))
        goto LABEL_39;
      LOBYTE(v10) = 0;
      if (!v7 || !v18)
        goto LABEL_88;
      if (v7 == v18)
      {
LABEL_39:

      }
      else
      {
        v10 = objc_msgSend((id)v7, "isEqualToString:", v18);

        if (!v10)
          goto LABEL_89;
      }
      genreName = v5->_genreName;
      v7 = self->_genreName;
      v20 = genreName;
      v9 = (void *)v20;
      if (!(v7 | v20))
        goto LABEL_46;
      LOBYTE(v10) = 0;
      if (!v7 || !v20)
        goto LABEL_88;
      if (v7 == v20)
      {
LABEL_46:

      }
      else
      {
        v10 = objc_msgSend((id)v7, "isEqualToString:", v20);

        if (!v10)
          goto LABEL_89;
      }
      if (!self->_purchased == v5->_purchased)
        goto LABEL_80;
      syncIdentifier = v5->_syncIdentifier;
      v7 = self->_syncIdentifier;
      v22 = syncIdentifier;
      v9 = (void *)v22;
      if (!(v7 | v22))
        goto LABEL_54;
      LOBYTE(v10) = 0;
      if (!v7 || !v22)
        goto LABEL_88;
      if (v7 == v22)
      {
LABEL_54:

      }
      else
      {
        v10 = objc_msgSend((id)v7, "isEqualToNumber:", v22);

        if (!v10)
          goto LABEL_89;
      }
      if (self->_storeItemIdentifier != v5->_storeItemIdentifier)
        goto LABEL_80;
      storeFrontIdentifier = v5->_storeFrontIdentifier;
      v7 = self->_storeFrontIdentifier;
      v24 = storeFrontIdentifier;
      v9 = (void *)v24;
      if (!(v7 | v24))
        goto LABEL_62;
      LOBYTE(v10) = 0;
      if (!v7 || !v24)
        goto LABEL_88;
      if (v7 == v24)
      {
LABEL_62:

      }
      else
      {
        v10 = objc_msgSend((id)v7, "isEqualToString:", v24);

        if (!v10)
          goto LABEL_89;
      }
      artworkFile = v5->_artworkFile;
      v7 = self->_artworkFile;
      v26 = artworkFile;
      v9 = (void *)v26;
      if (!(v7 | v26))
        goto LABEL_69;
      LOBYTE(v10) = 0;
      if (!v7 || !v26)
        goto LABEL_88;
      if (v7 == v26)
      {
LABEL_69:

      }
      else
      {
        v10 = objc_msgSend((id)v7, "isEqualToString:", v26);

        if (!v10)
          goto LABEL_89;
      }
      if (llround(self->_duration) != llround(v5->_duration)
        || !self->_protectedContent == v5->_protectedContent
        || !self->_privateTone == v5->_privateTone
        || !self->_ringtone == v5->_ringtone)
      {
LABEL_80:
        LOBYTE(v10) = 0;
LABEL_89:

        goto LABEL_90;
      }
      fadeInDurationNumber = v5->_fadeInDurationNumber;
      v7 = self->_fadeInDurationNumber;
      v28 = fadeInDurationNumber;
      v9 = (void *)v28;
      if (!(v7 | v28))
        goto LABEL_81;
      LOBYTE(v10) = 0;
      if (!v7 || !v28)
        goto LABEL_88;
      if (v7 == v28)
      {
LABEL_81:

      }
      else
      {
        v10 = objc_msgSend((id)v7, "isEqualToNumber:", v28);

        if (!v10)
          goto LABEL_89;
      }
      fadeOutDurationNumber = self->_fadeOutDurationNumber;
      v30 = v5->_fadeOutDurationNumber;
      v7 = fadeOutDurationNumber;
      v31 = v30;
      v9 = (void *)v31;
      if (!(v7 | v31))
        goto LABEL_87;
      LOBYTE(v10) = 0;
      if (!v7 || !v31)
        goto LABEL_88;
      if (v7 == v31)
LABEL_87:
        LOBYTE(v10) = 1;
      else
        LOBYTE(v10) = objc_msgSend((id)v7, "isEqualToNumber:", v31);
LABEL_88:

      goto LABEL_89;
    }
    LOBYTE(v10) = 0;
  }
LABEL_90:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  unint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  _BOOL8 ringtone;
  uint64_t v13;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  v5 = -[NSString hash](self->_filePath, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_albumTitle, "hash");
  v7 = -[NSString hash](self->_artistName, "hash");
  v8 = v6 ^ v7 ^ -[NSString hash](self->_genreName, "hash") ^ self->_purchased;
  v9 = -[NSNumber hash](self->_syncIdentifier, "hash") ^ self->_storeItemIdentifier;
  v10 = v9 ^ -[NSString hash](self->_storeFrontIdentifier, "hash");
  v11 = v8 ^ v10 ^ -[NSString hash](self->_artworkFile, "hash") ^ self->_protectedContent ^ self->_privateTone ^ llround(self->_duration);
  ringtone = self->_ringtone;
  v13 = ringtone ^ -[NSNumber hash](self->_fadeInDurationNumber, "hash");
  return v11 ^ v13 ^ -[NSNumber hash](self->_fadeOutDurationNumber, "hash");
}

- (BOOL)isDuplicateOfTone:(id)a3
{
  _QWORD *v4;
  id v5;
  unint64_t storeItemIdentifier;
  uint64_t v7;
  BOOL v8;
  void *v9;
  NSString *v10;
  unint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  unint64_t v15;
  _BOOL4 v16;
  BOOL v17;
  void *v18;
  unint64_t v19;
  _BOOL4 v20;
  void *v21;
  unint64_t v22;
  _BOOL4 v23;

  v4 = a3;
  v5 = v4;
  storeItemIdentifier = self->_storeItemIdentifier;
  if (!storeItemIdentifier || ((v7 = v4[9]) != 0 ? (v8 = storeItemIdentifier == v7) : (v8 = 0), !v8))
  {
    v9 = (void *)v4[3];
    v10 = self->_name;
    v11 = v9;
    v12 = (void *)v11;
    if (!((unint64_t)v10 | v11))
      goto LABEL_12;
    if (!v10 || !v11)
      goto LABEL_34;
    if (v10 == (NSString *)v11)
    {
LABEL_12:

    }
    else
    {
      v13 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

      if (!v13)
        goto LABEL_35;
    }
    v14 = (void *)*((_QWORD *)v5 + 4);
    v10 = self->_albumTitle;
    v15 = v14;
    v12 = (void *)v15;
    if (!((unint64_t)v10 | v15))
      goto LABEL_20;
    if (!v10 || !v15)
      goto LABEL_34;
    if (v10 == (NSString *)v15)
    {
LABEL_20:

    }
    else
    {
      v16 = -[NSString isEqualToString:](v10, "isEqualToString:", v15);

      if (!v16)
        goto LABEL_35;
    }
    v18 = (void *)*((_QWORD *)v5 + 5);
    v10 = self->_artistName;
    v19 = v18;
    v12 = (void *)v19;
    if (!((unint64_t)v10 | v19))
      goto LABEL_27;
    if (!v10 || !v19)
      goto LABEL_34;
    if (v10 == (NSString *)v19)
    {
LABEL_27:

    }
    else
    {
      v20 = -[NSString isEqualToString:](v10, "isEqualToString:", v19);

      if (!v20)
        goto LABEL_35;
    }
    v21 = (void *)*((_QWORD *)v5 + 6);
    v10 = self->_genreName;
    v22 = v21;
    v12 = (void *)v22;
    if (!((unint64_t)v10 | v22))
      goto LABEL_37;
    if (v10 && v22)
    {
      if (v10 != (NSString *)v22)
      {
        v23 = -[NSString isEqualToString:](v10, "isEqualToString:", v22);

        if (v23)
          goto LABEL_38;
LABEL_35:
        v17 = 0;
        goto LABEL_36;
      }
LABEL_37:

LABEL_38:
      if (!self->_purchased != (*((_BYTE *)v5 + 8) != 0)
        && !self->_privateTone != (*((_BYTE *)v5 + 11) != 0)
        && !self->_ringtone != (*((_BYTE *)v5 + 9) != 0))
      {
        v17 = llround(self->_duration) == llround(*((double *)v5 + 12));
        goto LABEL_36;
      }
      goto LABEL_35;
    }
LABEL_34:

    goto LABEL_35;
  }
  v17 = 1;
LABEL_36:

  return v17;
}

+ (id)_identifierForPropertyListRepresentation:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "objectForKey:", CFSTR("GUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(CFSTR("itunes:"), "stringByAppendingString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSString)genreName
{
  return self->_genreName;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (NSNumber)syncIdentifier
{
  return self->_syncIdentifier;
}

- (unint64_t)storeItemIdentifier
{
  return self->_storeItemIdentifier;
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (BOOL)isPurchased
{
  return self->_purchased;
}

- (BOOL)isRingtone
{
  return self->_ringtone;
}

- (NSString)artworkFile
{
  return self->_artworkFile;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)isProtectedContent
{
  return self->_protectedContent;
}

- (BOOL)isPrivateTone
{
  return self->_privateTone;
}

- (NSNumber)fadeInDurationNumber
{
  return self->_fadeInDurationNumber;
}

- (NSNumber)fadeOutDurationNumber
{
  return self->_fadeOutDurationNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeOutDurationNumber, 0);
  objc_storeStrong((id *)&self->_fadeInDurationNumber, 0);
  objc_storeStrong((id *)&self->_artworkFile, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_syncIdentifier, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_genreName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithPropertyListRepresentation:(NSObject *)a3 filePath:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v6 = v5;
  objc_msgSend(a2, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_1D33D5000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Returning nil from initializer because of a missing identifier. Available keys in property list representation: %{public}@.", (uint8_t *)&v8, 0x16u);

}

@end
