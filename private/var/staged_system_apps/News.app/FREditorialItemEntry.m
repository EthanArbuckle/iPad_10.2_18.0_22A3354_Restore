@implementation FREditorialItemEntry

- (FREditorialItemEntry)initWithEntryID:(id)a3 editorialItemID:(id)a4 title:(id)a5 subtitle:(id)a6 subtitleColorString:(id)a7 image:(id)a8 actionUrlString:(id)a9 lastModifiedDate:(id)a10 documentVersion:(id)a11 lastSeenDocumentVersion:(id)a12 showBadge:(BOOL)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  FREditorialItemEntry *v27;
  FREditorialItemEntry *v28;
  NSString *v29;
  NSString *entryID;
  NSString *v31;
  NSString *editorialItemID;
  NSString *v33;
  NSString *title;
  NSString *v35;
  NSString *subtitle;
  NSString *v37;
  NSString *subtitleColorString;
  NSString *v39;
  NSString *actionUrlString;
  NSData *v41;
  NSData *image;
  NSString *v43;
  NSString *documentVersion;
  NSString *v45;
  NSString *lastSeenDocumentVersion;
  NSDate *v47;
  NSDate *lastModifiedDate;
  id v51;
  objc_super v52;

  v18 = a3;
  v51 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v26 = a12;
  if (!v18 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100081C10();
  v52.receiver = self;
  v52.super_class = (Class)FREditorialItemEntry;
  v27 = -[FREditorialItemEntry init](&v52, "init", self);
  v28 = v27;
  if (v18 && v27)
  {
    v29 = (NSString *)objc_msgSend(v18, "copy");
    entryID = v28->_entryID;
    v28->_entryID = v29;

    v31 = (NSString *)objc_msgSend(v51, "copy");
    editorialItemID = v28->_editorialItemID;
    v28->_editorialItemID = v31;

    v33 = (NSString *)objc_msgSend(v19, "copy");
    title = v28->_title;
    v28->_title = v33;

    v35 = (NSString *)objc_msgSend(v20, "copy");
    subtitle = v28->_subtitle;
    v28->_subtitle = v35;

    v37 = (NSString *)objc_msgSend(v21, "copy");
    subtitleColorString = v28->_subtitleColorString;
    v28->_subtitleColorString = v37;

    v39 = (NSString *)objc_msgSend(v23, "copy");
    actionUrlString = v28->_actionUrlString;
    v28->_actionUrlString = v39;

    v41 = (NSData *)objc_msgSend(v22, "copy");
    image = v28->_image;
    v28->_image = v41;

    v43 = (NSString *)objc_msgSend(v25, "copy");
    documentVersion = v28->_documentVersion;
    v28->_documentVersion = v43;

    v45 = (NSString *)objc_msgSend(v26, "copy");
    lastSeenDocumentVersion = v28->_lastSeenDocumentVersion;
    v28->_lastSeenDocumentVersion = v45;

    v47 = (NSDate *)objc_msgSend(v24, "copy");
    lastModifiedDate = v28->_lastModifiedDate;
    v28->_lastModifiedDate = v47;

    v28->_showBadge = a13;
  }

  return v28;
}

- (FREditorialItemEntry)initWithEntryID:(id)a3 dictionaryRepresentation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v17;
  void *v18;
  void *v19;
  FREditorialItemEntry *v21;
  void *v22;

  v5 = a3;
  v6 = a4;
  v22 = v5;
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100081CBC();
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FREditorialItemEntryEditorialItemID")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FREditorialItemEntryTitle")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FREditorialItemEntrySubtitle")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FREditorialItemEntrySubtitleColor")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FREditorialItemEntryImage")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FREditorialItemEntryActionURL")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FREditorialItemEntryLastModifiedDate")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FREditorialItemEntryDocumentVersion")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FREditorialItemEntryLastSeenDocumentVersion")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FREditorialItemEntryLastShowBadge")));
  v15 = objc_msgSend(v14, "BOOLValue");

  LOBYTE(v17) = v15;
  v21 = -[FREditorialItemEntry initWithEntryID:editorialItemID:title:subtitle:subtitleColorString:image:actionUrlString:lastModifiedDate:documentVersion:lastSeenDocumentVersion:showBadge:](self, "initWithEntryID:editorialItemID:title:subtitle:subtitleColorString:image:actionUrlString:lastModifiedDate:documentVersion:lastSeenDocumentVersion:showBadge:", v22, v7, v8, v9, v19, v18, v10, v11, v12, v13, v17);

  return v21;
}

- (NSString)editorialItemID
{
  return self->_editorialItemID;
}

- (FREditorialItemEntry)initWithEditorialItemID:(id)a3 title:(id)a4 subtitle:(id)a5 subtitleColorString:(id)a6 image:(id)a7 actionUrlString:(id)a8 lastModifiedDate:(id)a9 documentVersion:(id)a10 lastSeenDocumentVersion:(id)a11 showBadge:(BOOL)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  FREditorialItemEntry *v27;
  FREditorialItemEntry *v28;
  uint64_t v29;
  NSString *entryID;
  NSString *v31;
  NSString *editorialItemID;
  NSString *v33;
  NSString *title;
  NSString *v35;
  NSString *subtitle;
  NSString *v37;
  NSString *subtitleColorString;
  NSString *v39;
  NSString *actionUrlString;
  NSData *v41;
  NSData *image;
  NSString *v43;
  NSString *documentVersion;
  NSString *v45;
  NSString *lastSeenDocumentVersion;
  NSDate *v47;
  NSDate *lastModifiedDate;
  objc_super v50;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  if (!v18 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100081B64();
  v50.receiver = self;
  v50.super_class = (Class)FREditorialItemEntry;
  v27 = -[FREditorialItemEntry init](&v50, "init");
  v28 = v27;
  if (v18 && v27)
  {
    v29 = objc_claimAutoreleasedReturnValue(-[FREditorialItemEntry _editorialEntryIDForIdentifier:](v27, "_editorialEntryIDForIdentifier:", v18));
    entryID = v28->_entryID;
    v28->_entryID = (NSString *)v29;

    v31 = (NSString *)objc_msgSend(v18, "copy");
    editorialItemID = v28->_editorialItemID;
    v28->_editorialItemID = v31;

    v33 = (NSString *)objc_msgSend(v19, "copy");
    title = v28->_title;
    v28->_title = v33;

    v35 = (NSString *)objc_msgSend(v20, "copy");
    subtitle = v28->_subtitle;
    v28->_subtitle = v35;

    v37 = (NSString *)objc_msgSend(v21, "copy");
    subtitleColorString = v28->_subtitleColorString;
    v28->_subtitleColorString = v37;

    v39 = (NSString *)objc_msgSend(v23, "copy");
    actionUrlString = v28->_actionUrlString;
    v28->_actionUrlString = v39;

    v41 = (NSData *)objc_msgSend(v22, "copy");
    image = v28->_image;
    v28->_image = v41;

    v43 = (NSString *)objc_msgSend(v25, "copy");
    documentVersion = v28->_documentVersion;
    v28->_documentVersion = v43;

    v45 = (NSString *)objc_msgSend(v26, "copy");
    lastSeenDocumentVersion = v28->_lastSeenDocumentVersion;
    v28->_lastSeenDocumentVersion = v45;

    v47 = (NSDate *)objc_msgSend(v24, "copy");
    lastModifiedDate = v28->_lastModifiedDate;
    v28->_lastModifiedDate = v47;

    v28->_showBadge = a12;
  }

  return v28;
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
  void *v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntry entryID](self, "entryID"));
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v4, CFSTR("FREditorialItemEntryID"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntry editorialItemID](self, "editorialItemID"));
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("FREditorialItemEntryEditorialItemID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntry title](self, "title"));
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v6, CFSTR("FREditorialItemEntryTitle"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntry subtitle](self, "subtitle"));
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v7, CFSTR("FREditorialItemEntrySubtitle"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntry subtitleColorString](self, "subtitleColorString"));
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v8, CFSTR("FREditorialItemEntrySubtitleColor"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntry image](self, "image"));
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v9, CFSTR("FREditorialItemEntryImage"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntry actionUrlString](self, "actionUrlString"));
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v10, CFSTR("FREditorialItemEntryActionURL"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntry lastModifiedDate](self, "lastModifiedDate"));
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v11, CFSTR("FREditorialItemEntryLastModifiedDate"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntry documentVersion](self, "documentVersion"));
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v12, CFSTR("FREditorialItemEntryDocumentVersion"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FREditorialItemEntry lastSeenDocumentVersion](self, "lastSeenDocumentVersion"));
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v13, CFSTR("FREditorialItemEntryLastSeenDocumentVersion"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[FREditorialItemEntry showBadge](self, "showBadge")));
  objc_msgSend(v3, "fc_safelySetObjectAllowingNil:forKey:", v14, CFSTR("FREditorialItemEntryLastShowBadge"));

  v15 = objc_msgSend(v3, "copy");
  return v15;
}

- (id)_editorialEntryIDForIdentifier:(id)a3
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("ed-"), a3);
}

- (NSString)entryID
{
  return self->_entryID;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)actionUrlString
{
  return self->_actionUrlString;
}

- (NSString)subtitleColorString
{
  return self->_subtitleColorString;
}

- (NSString)documentVersion
{
  return self->_documentVersion;
}

- (NSString)lastSeenDocumentVersion
{
  return self->_lastSeenDocumentVersion;
}

- (NSData)image
{
  return self->_image;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (BOOL)showBadge
{
  return self->_showBadge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_lastSeenDocumentVersion, 0);
  objc_storeStrong((id *)&self->_documentVersion, 0);
  objc_storeStrong((id *)&self->_subtitleColorString, 0);
  objc_storeStrong((id *)&self->_actionUrlString, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_editorialItemID, 0);
  objc_storeStrong((id *)&self->_entryID, 0);
}

@end
