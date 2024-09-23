@implementation RCRecordingDisplayModel

+ (id)recordingDisplayModelForUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RCApplicationModel sharedApplicationModel](RCApplicationModel, "sharedApplicationModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recordingWithUniqueID:", v3));

  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelWithSavedRecording:](RCRecordingDisplayModel, "recordingDisplayModelWithSavedRecording:", v5));
  else
    v6 = 0;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (BOOL)wasManuallyRenamed
{
  return self->_wasManuallyRenamed;
}

- (NSString)title
{
  return self->_title;
}

- (void)setWasManuallyRenamed:(BOOL)a3
{
  self->_wasManuallyRenamed = a3;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setRepresentsDownloadingFile:(BOOL)a3
{
  self->_representsDownloadingFile = a3;
}

- (void)setRecentlyDeleted:(BOOL)a3
{
  self->_recentlyDeleted = a3;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
}

- (void)setIsEnhanced:(BOOL)a3
{
  self->_isEnhanced = a3;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (BOOL)representsDownloadingFile
{
  return self->_representsDownloadingFile;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSString)UUID
{
  return self->_UUID;
}

+ (RCRecordingDisplayModel)recordingDisplayModelWithSavedRecording:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  void *v14;
  uint64_t v16;
  void *v17;

  v3 = a3;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "creationDate"));
  objc_msgSend(v3, "length");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "deletionDate"));
  v9 = objc_msgSend(v3, "audioFutureNeedsDownload");
  v10 = objc_msgSend(v3, "favorite");
  v11 = objc_msgSend(v3, "enhanced");
  v12 = objc_msgSend(v3, "transcriptionContentExists");
  v13 = objc_msgSend(v3, "manuallyRenamed");

  BYTE2(v16) = v13;
  BYTE1(v16) = v12;
  LOBYTE(v16) = v11;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecordingDisplayModel recordingDisplayModelWithTitle:creationDate:duration:UUID:recentlyDeleted:representsDownloadingFile:isFavorite:isEnhanced:hasTranscription:wasManuallyRenamed:](RCRecordingDisplayModel, "recordingDisplayModelWithTitle:creationDate:duration:UUID:recentlyDeleted:representsDownloadingFile:isFavorite:isEnhanced:hasTranscription:wasManuallyRenamed:", v17, v4, v7, v8 != 0, v9, v10, v6, v16));

  return (RCRecordingDisplayModel *)v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDisplayModel title](self, "title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingDisplayModel UUID](self, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Title: %@, UUID: %@"), v3, v4));

  return v5;
}

+ (RCRecordingDisplayModel)recordingDisplayModelWithTitle:(id)a3 creationDate:(id)a4 duration:(double)a5 UUID:(id)a6 recentlyDeleted:(BOOL)a7 representsDownloadingFile:(BOOL)a8 isFavorite:(BOOL)a9 isEnhanced:(BOOL)a10 hasTranscription:(BOOL)a11 wasManuallyRenamed:(BOOL)a12
{
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  RCRecordingDisplayModel *v23;

  v12 = a9;
  v13 = a8;
  v14 = a7;
  v18 = a3;
  v19 = a4;
  v20 = a6;
  if (!v20)
  {
    v21 = OSLogForCategory(kVMLogCategoryDefault);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      sub_10010D3A4(v22);

  }
  v23 = objc_opt_new(RCRecordingDisplayModel);
  -[RCRecordingDisplayModel setTitle:](v23, "setTitle:", v18);
  -[RCRecordingDisplayModel setCreationDate:](v23, "setCreationDate:", v19);
  -[RCRecordingDisplayModel setDuration:](v23, "setDuration:", a5);
  -[RCRecordingDisplayModel setUUID:](v23, "setUUID:", v20);
  -[RCRecordingDisplayModel setRecentlyDeleted:](v23, "setRecentlyDeleted:", v14);
  -[RCRecordingDisplayModel setIsFavorite:](v23, "setIsFavorite:", v12);
  -[RCRecordingDisplayModel setIsEnhanced:](v23, "setIsEnhanced:", a10);
  -[RCRecordingDisplayModel setHasTranscription:](v23, "setHasTranscription:", a11);
  -[RCRecordingDisplayModel setRepresentsDownloadingFile:](v23, "setRepresentsDownloadingFile:", v13);
  -[RCRecordingDisplayModel setWasManuallyRenamed:](v23, "setWasManuallyRenamed:", a12);

  return v23;
}

- (BOOL)recentlyDeleted
{
  return self->_recentlyDeleted;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (BOOL)isEnhanced
{
  return self->_isEnhanced;
}

- (BOOL)hasTranscription
{
  return self->_hasTranscription;
}

- (void)setHasTranscription:(BOOL)a3
{
  self->_hasTranscription = a3;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (void)setIsPlaying:(BOOL)a3
{
  self->_isPlaying = a3;
}

@end
