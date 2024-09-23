@implementation RCFolderDisplayModel

+ (id)folderNameForBuiltInFolderOfType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 0:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("ALL_RECORDINGS");
      goto LABEL_7;
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("FAVORITES_FOLDER_TITLE");
      goto LABEL_7;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("WATCH_FOLDER_TITLE");
      goto LABEL_7;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("RECENTLY_DELETED");
LABEL_7:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1001B2BC0, 0));

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)folderDisplayModelWithFolderModel:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v3 = a3;
  v4 = objc_msgSend(v3, "folderType");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCFolderDisplayModel _folderImageForFolderOfType:](RCFolderDisplayModel, "_folderImageForFolderOfType:", objc_msgSend(v3, "folderType")));
  if (v4 == (id)4)
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  else
    v6 = objc_claimAutoreleasedReturnValue(+[RCFolderDisplayModel folderNameForBuiltInFolderOfType:](RCFolderDisplayModel, "folderNameForBuiltInFolderOfType:", objc_msgSend(v3, "folderType")));
  v7 = (void *)v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
  v9 = objc_msgSend(v8, "playableCountForFolder:", v3);

  v10 = objc_msgSend(v3, "folderType");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[RCFolderDisplayModel folderDisplayModelWithDisplayName:iconImage:recordingsCount:folderType:UUID:](RCFolderDisplayModel, "folderDisplayModelWithDisplayName:iconImage:recordingsCount:folderType:UUID:", v7, v5, v9, v10, v11));

  return v12;
}

+ (id)_folderImageForFolderOfType:(int64_t)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "folderSystemImageNameForFolderOfType:", a3));
  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v3));
  else
    v4 = 0;

  return v4;
}

+ (id)folderSystemImageNameForFolderOfType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return *(&off_1001ABF20 + a3);
}

+ (id)folderDisplayModelWithDisplayName:(id)a3 iconImage:(id)a4 recordingsCount:(int64_t)a5 folderType:(int64_t)a6 UUID:(id)a7
{
  id v11;
  id v12;
  id v13;
  RCFolderDisplayModel *v14;

  v11 = a7;
  v12 = a4;
  v13 = a3;
  v14 = objc_opt_new(RCFolderDisplayModel);
  -[RCFolderDisplayModel setDisplayName:](v14, "setDisplayName:", v13);

  -[RCFolderDisplayModel setIconImage:](v14, "setIconImage:", v12);
  -[RCFolderDisplayModel setRecordingsCount:](v14, "setRecordingsCount:", a5);
  -[RCFolderDisplayModel setFolderType:](v14, "setFolderType:", a6);
  -[RCFolderDisplayModel setUUID:](v14, "setUUID:", v11);

  return v14;
}

- (id)description
{
  void *v3;
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderDisplayModel displayName](self, "displayName"));
  v4 = -[RCFolderDisplayModel recordingsCount](self, "recordingsCount");
  v5 = -[RCFolderDisplayModel folderType](self, "folderType");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RCFolderDisplayModel UUID](self, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("displayName =%@, count = %lu, type = %lu, UUID = %@"), v3, v4, v5, v6));

  return v7;
}

- (BOOL)representsPossibleMoveDestination
{
  unint64_t v2;

  v2 = -[RCFolderDisplayModel folderType](self, "folderType");
  return (v2 < 5) & (0x1Bu >> v2);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
}

- (int64_t)recordingsCount
{
  return self->_recordingsCount;
}

- (void)setRecordingsCount:(int64_t)a3
{
  self->_recordingsCount = a3;
}

- (int64_t)folderType
{
  return self->_folderType;
}

- (void)setFolderType:(int64_t)a3
{
  self->_folderType = a3;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
