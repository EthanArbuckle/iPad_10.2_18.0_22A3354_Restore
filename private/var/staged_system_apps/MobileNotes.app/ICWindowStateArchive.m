@implementation ICWindowStateArchive

- (BOOL)isAuxiliaryWindow
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isAuxiliaryWindow")));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSString)windowIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("windowIdentifier")));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));

  }
  return (NSString *)v3;
}

- (NSString)toolPickerIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("toolPickerIdentifier")));

  return (NSString *)v3;
}

- (NSDictionary)stateDictionary
{
  return self->_stateDictionary;
}

- (void)setStateDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setIsPrimaryContentVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("isPrimaryContentVisible"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (void)setIsAuxiliaryWindow:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("isAuxiliaryWindow"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (void)setCurrentNoteContainerViewMode:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("currentNoteContainerViewMode"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (NSData)selectionState
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kICWindowStateSelectionState")));

  return (NSData *)v3;
}

- (int64_t)preferredNoteContainerViewMode
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kICWindowStatePreferredNoteContainerViewMode")));

  if (v3)
    v4 = (int64_t)objc_msgSend(v3, "integerValue");
  else
    v4 = -1;

  return v4;
}

- (int64_t)noteCreationApproach
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("createNewNoteApproach")));
  v4 = objc_msgSend(v3, "integerValue");

  return (int64_t)v4;
}

- (BOOL)isSystemPaper
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isSystemPaper")));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isAttachmentBrowserOpen
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("attachmentBrowserOpen")));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (ICWindowStateArchive)init
{
  void *v3;
  ICWindowStateArchive *v4;
  _QWORD v6[3];
  _QWORD v7[3];

  v6[0] = CFSTR("isPrimaryContentVisible");
  v6[1] = CFSTR("isSupplementaryContentVisible");
  v7[0] = &__kCFBooleanFalse;
  v7[1] = &__kCFBooleanTrue;
  v6[2] = CFSTR("isTrailingContentVisible");
  v7[2] = &__kCFBooleanFalse;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 3));
  v4 = -[ICWindowStateArchive initWithDictionary:](self, "initWithDictionary:", v3);

  return v4;
}

- (ICWindowStateArchive)initWithDictionary:(id)a3
{
  id v4;
  ICWindowStateArchive *v5;
  ICWindowStateArchive *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICWindowStateArchive;
  v5 = -[ICWindowStateArchive init](&v8, "init");
  v6 = v5;
  if (v5)
    -[ICWindowStateArchive setStateDictionary:](v5, "setStateDictionary:", v4);

  return v6;
}

- (NSDictionary)expansionState
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kICWindowStateExpansionState")));

  return (NSDictionary *)v3;
}

- (ICVirtualSmartFolderItemIdentifier)currentVirtualSmartFolderIdentifier
{
  return self->_currentVirtualSmartFolderIdentifier;
}

- (NSString)currentSearchTerm
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("currentSearchTerm")));

  return (NSString *)v3;
}

- (NSURL)currentObjectIDURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("currentObjectID")));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
  else
    v4 = 0;

  return (NSURL *)v4;
}

- (NSURL)currentNoteObjectIDURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("currentNoteObjectID")));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
  else
    v4 = 0;

  return (NSURL *)v4;
}

- (int64_t)currentNoteContainerViewMode
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("currentNoteContainerViewMode")));

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return (int64_t)v4;
}

- (NSArray)currentContainerObjectIDURLs
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("currentContainerObjectIDURLs")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ic_compactMap:", &stru_100551330));
  return (NSArray *)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateDictionary, 0);
  objc_storeStrong((id *)&self->_currentVirtualSmartFolderIdentifier, 0);
  objc_storeStrong((id *)&self->_initialSystemPaperImageData, 0);
  objc_storeStrong((id *)&self->_initialSystemPaperLink, 0);
  objc_storeStrong((id *)&self->_archiveDictionary, 0);
}

- (void)setCurrentContainerObjectIDURLs:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "ic_compactMap:", &stru_100551370));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v5 = objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("currentContainerObjectIDURLs"));
  v6 = objc_msgSend(v5, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v6);

}

- (NSArray)currentTagIdentifiers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("currentTagIdentifiers")));

  return (NSArray *)v3;
}

- (void)setCurrentTagIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v7 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("currentTagIdentifiers"));
  v6 = objc_msgSend(v7, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v6);

}

- (NSString)currentVirtualSmartFolderType
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("currentVirtualSmartFolderType")));

  return (NSString *)v3;
}

- (void)setCurrentVirtualSmartFolderType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v7 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("currentVirtualSmartFolderType"));
  v6 = objc_msgSend(v7, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v6);

}

- (NSURL)currentVirtualSmartFolderAccountObjectIDURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("currentVirtualSmartFolderAccountObjectIDURL")));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
  else
    v4 = 0;

  return (NSURL *)v4;
}

- (void)setCurrentVirtualSmartFolderAccountObjectIDURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("currentVirtualSmartFolderAccountObjectIDURL"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (NSDictionary)currentFirstVisibleObjectIDURLForContainerObjectIDURL
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("firstVisibleIdentifierForContainerIdentifier")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v3, "count")));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v15));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return (NSDictionary *)v4;
}

- (void)setCurrentFirstVisibleObjectIDURLForContainerObjectIDURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v19));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "absoluteString"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absoluteString"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v16 = objc_msgSend(v15, "mutableCopy");

  v17 = objc_msgSend(v5, "copy");
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("firstVisibleIdentifierForContainerIdentifier"));

  v18 = objc_msgSend(v16, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v18);

}

- (void)setCurrentNoteObjectIDURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("currentNoteObjectID"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (NSURL)currentInvitationObjectIDURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("currentInvitationObjectID")));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
  else
    v4 = 0;

  return (NSURL *)v4;
}

- (void)setCurrentInvitationObjectIDURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("currentInvitationObjectID"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (void)setCurrentObjectIDURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("currentObjectID"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (NSURL)focusedNoteObjectIDURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("focusedNoteObjectIDURL")));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
  else
    v4 = 0;

  return (NSURL *)v4;
}

- (void)setFocusedNoteObjectIDURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("focusedNoteObjectIDURL"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (void)setCurrentSearchTerm:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v7 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("currentSearchTerm"));
  v6 = objc_msgSend(v7, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v6);

}

- (void)setPreferredNoteContainerViewMode:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("kICWindowStatePreferredNoteContainerViewMode"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (ICActivityStreamSelection)currentActivityStreamSelection
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("currentActivityStreamSelection")));

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICActivityStreamSelection selectionFromData:](ICActivityStreamSelection, "selectionFromData:", v3));
  else
    v4 = 0;

  return (ICActivityStreamSelection *)v4;
}

- (void)setCurrentActivityStreamSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "encodedData"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("currentActivityStreamSelection"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (int64_t)currentActivityStreamViewMode
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("currentActivityStreamViewMode")));

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return (int64_t)v4;
}

- (void)setCurrentActivityStreamViewMode:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("currentActivityStreamViewMode"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (BOOL)isPrimaryContentVisible
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isPrimaryContentVisible")));

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (BOOL)isSupplementaryContentVisible
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isSupplementaryContentVisible")));

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (void)setIsSupplementaryContentVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("isSupplementaryContentVisible"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (BOOL)isTrailingContentVisible
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("isTrailingContentVisible")));

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (void)setIsTrailingContentVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("isTrailingContentVisible"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (NSNumber)mainSplitViewPrimaryColumnWidth
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("mainSplitViewPrimaryColumnWidth")));

  return (NSNumber *)v3;
}

- (void)setMainSplitViewPrimaryColumnWidth:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v7 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("mainSplitViewPrimaryColumnWidth"));
  v6 = objc_msgSend(v7, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v6);

}

- (NSNumber)mainSplitViewSupplementaryColumnWidth
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("mainSplitViewSupplementaryColumnWidth")));

  return (NSNumber *)v3;
}

- (void)setMainSplitViewSupplementaryColumnWidth:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v7 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("mainSplitViewSupplementaryColumnWidth"));
  v6 = objc_msgSend(v7, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v6);

}

- (void)setExpansionState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v7 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("kICWindowStateExpansionState"));
  v6 = objc_msgSend(v7, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v6);

}

- (NSDate)currentNoteLastViewedDate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("currentNoteLastViewedDate")));

  return (NSDate *)v3;
}

- (void)setCurrentNoteLastViewedDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = objc_msgSend(v4, "copy");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("currentNoteLastViewedDate"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (void)setWindowIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v7 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("windowIdentifier"));
  v6 = objc_msgSend(v7, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v6);

}

- (void)setNoteCreationApproach:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("createNewNoteApproach"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (void)setToolPickerIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = objc_msgSend(v4, "copy");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("toolPickerIdentifier"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (void)setSystemPaper:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("isSystemPaper"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (NSString)hostApplicationIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("hostApplicationIdentifier")));

  return (NSString *)v3;
}

- (void)setHostApplicationIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = objc_msgSend(v4, "copy");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("hostApplicationIdentifier"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (void)setAttachmentBrowserOpen:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("attachmentBrowserOpen"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (BOOL)isActiveEditorInEditMode
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("activeEditorInEditMode")));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setActiveEditorInEditMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v8 = objc_msgSend(v5, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v3));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("activeEditorInEditMode"));

  v7 = objc_msgSend(v8, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v7);

}

- (id)scrollStateForNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("scrollState")));

  v7 = objc_opt_class(NSDictionary);
  v8 = ICDynamicCast(v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
    v10 = objc_msgSend(objc_alloc((Class)ICTextViewScrollState), "initWithDictionary:note:", v9, v4);
  else
    v10 = 0;

  return v10;
}

- (void)setScrollState:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dictionaryRepresentation"));
  if (v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
    v5 = objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("scrollState"));
    v6 = objc_msgSend(v5, "copy");
    -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v6);

  }
}

- (void)setSelectionState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v7 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "ic_setNonNilObject:forNonNilKey:", v4, CFSTR("kICWindowStateSelectionState"));
  v6 = objc_msgSend(v7, "copy");
  -[ICWindowStateArchive setStateDictionary:](self, "setStateDictionary:", v6);

}

+ (id)windowStateArchiveFromDictionary:(id)a3
{
  id v3;
  ICWindowStateArchive *v4;

  v3 = a3;
  v4 = -[ICWindowStateArchive initWithDictionary:]([ICWindowStateArchive alloc], "initWithDictionary:", v3);

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICWindowStateArchive;
  v3 = -[ICWindowStateArchive description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICWindowStateArchive stateDictionary](self, "stateDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

+ (ICWindowStateArchive)windowStateArchiveWithEmptyState
{
  return (ICWindowStateArchive *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", &__NSDictionary0__struct);
}

- (NSDictionary)archiveDictionary
{
  return self->_archiveDictionary;
}

- (SYContentItem)initialSystemPaperLink
{
  return self->_initialSystemPaperLink;
}

- (void)setInitialSystemPaperLink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)initialSystemPaperImageData
{
  return self->_initialSystemPaperImageData;
}

- (void)setInitialSystemPaperImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)shouldStartEditing
{
  return self->_shouldStartEditing;
}

- (void)setShouldStartEditing:(BOOL)a3
{
  self->_shouldStartEditing = a3;
}

- (void)setCurrentVirtualSmartFolderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

@end
