@implementation CRDiagnosticsData

+ (id)_carPlayLogsFolderURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLsForDirectory:inDomains:", 5, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("Logs/com.apple.CarPlay"), 1));
  return v5;
}

+ (id)makeDiagnosticsFolderForTime:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  id v22;
  uint8_t buf[4];
  void *v24;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_carPlayLogsFolderURL"));
  if (v5)
  {
    v6 = CRStringForDate(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CarPlay-%@"), v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v22 = 0;
    v11 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v22);
    v12 = v22;

    if ((v11 & 1) != 0)
    {
      v15 = CarDiagnosticsLogging(v13, v14);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v9;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Created logging folder: %@", buf, 0xCu);
      }

      v17 = v9;
    }
    else
    {
      v18 = CarGeneralLogging(v13);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_10006E2D0((uint64_t)v12, v19, v20);

      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (void)removeDiagnosticsFoldersBeforeTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  NSURLResourceKey v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  _UNKNOWN **v21;
  void *i;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  void *v32;
  unsigned int v33;
  void *v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  NSObject *obj;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  id v59;
  NSURLResourceKey v60;
  _BYTE v61[128];
  NSURLResourceKey v62;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_carPlayLogsFolderURL"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, -7, v4, 0));

    v47 = (void *)v7;
    if (v7)
    {
      v10 = CarDiagnosticsLogging(v8, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Removing any logging folders before %@", buf, 0xCu);
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v13 = NSURLCreationDateKey;
      v62 = NSURLCreationDateKey;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v62, 1));
      v55 = 0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, v14, 0, &v55));
      v16 = v55;

      if (v15)
      {
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        obj = v15;
        v18 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        if (!v18)
          goto LABEL_30;
        v19 = v18;
        v44 = v15;
        v45 = v5;
        v46 = v4;
        v20 = *(_QWORD *)v52;
        v21 = &ASAttributeContentVersion_ptr;
        while (1)
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(_QWORD *)v52 != v20)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
            v60 = v13;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21[231], "arrayWithObjects:count:", &v60, 1));
            v50 = v16;
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "resourceValuesForKeys:error:", v24, &v50));
            v26 = v50;

            if (!v25)
            {
              v40 = CarGeneralLogging(v27);
              v29 = objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v57 = (uint64_t)v23;
                v58 = 2112;
                v59 = v26;
                _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Error reading metadata for %@: %@", buf, 0x16u);
              }
LABEL_19:
              v16 = v26;
              goto LABEL_25;
            }
            v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKey:", v13));
            v29 = v28;
            if (!v28)
              goto LABEL_19;
            v30 = v19;
            v31 = v20;
            v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject earlierDate:](v28, "earlierDate:", v47));
            v33 = objc_msgSend(v32, "isEqual:", v29);

            if (v33)
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
              v49 = v26;
              v35 = objc_msgSend(v34, "removeItemAtURL:error:", v23, &v49);
              v16 = v49;

              if (v35)
              {
                v38 = CarDiagnosticsLogging(v36, v37);
                v39 = objc_claimAutoreleasedReturnValue(v38);
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v57 = (uint64_t)v23;
                  _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Removed logging folder: %@", buf, 0xCu);
                }
              }
              else
              {
                v41 = CarGeneralLogging(v36);
                v39 = objc_claimAutoreleasedReturnValue(v41);
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v57 = (uint64_t)v23;
                  v58 = 2112;
                  v59 = v16;
                  _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to remove logging folder %@: %@", buf, 0x16u);
                }
              }
              v21 = &ASAttributeContentVersion_ptr;
              v20 = v31;

            }
            else
            {
              v16 = v26;
              v20 = v31;
            }
            v19 = v30;
            v13 = NSURLCreationDateKey;
LABEL_25:

          }
          v19 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
          if (!v19)
          {
            v5 = v45;
            v4 = v46;
            v15 = v44;
            goto LABEL_30;
          }
        }
      }
      v42 = CarGeneralLogging(v17);
      obj = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
        sub_10006E338((uint64_t)v16, obj, v43);
LABEL_30:

    }
  }

}

- (CRDiagnosticsData)init
{
  CRDiagnosticsData *v2;
  uint64_t v3;
  NSDate *date;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *timestamp;
  NSMutableArray *v9;
  NSMutableArray *attachmentURLs;
  void *v11;
  uint64_t v12;
  NSURL *baseFolderURL;
  CRDiagnosticsData *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CRDiagnosticsData;
  v2 = -[CRDiagnosticsData init](&v16, "init");
  if (!v2)
    goto LABEL_3;
  v3 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  date = v2->_date;
  v2->_date = (NSDate *)v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsData date](v2, "date"));
  v6 = CRStringForDate(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  timestamp = v2->_timestamp;
  v2->_timestamp = (NSString *)v7;

  v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  attachmentURLs = v2->_attachmentURLs;
  v2->_attachmentURLs = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsData date](v2, "date"));
  v12 = objc_claimAutoreleasedReturnValue(+[CRDiagnosticsData makeDiagnosticsFolderForTime:](CRDiagnosticsData, "makeDiagnosticsFolderForTime:", v11));
  baseFolderURL = v2->_baseFolderURL;
  v2->_baseFolderURL = (NSURL *)v12;

  v14 = (CRDiagnosticsData *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsData baseFolderURL](v2, "baseFolderURL"));
  if (v14)
LABEL_3:
    v14 = v2;

  return v14;
}

- (void)_markPurgeable:(id)a3
{
  id v3;
  unsigned __int8 v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;

  v3 = a3;
  v9 = 0;
  v4 = objc_msgSend(v3, "setResourceValue:forKey:error:", &__kCFBooleanTrue, NSURLIsPurgeableKey, &v9);
  v5 = v9;
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    v7 = CarGeneralLogging(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10006E3A0();

  }
}

- (BOOL)addAttachment:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
  LOBYTE(self) = -[CRDiagnosticsData addAttachment:asFilename:](self, "addAttachment:asFilename:", v4, v5);

  return (char)self;
}

- (BOOL)addAttachment:(id)a3 asFilename:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v16 = CarGeneralLogging(v7);
    v13 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10006E400();
    goto LABEL_9;
  }
  if (!v7)
  {
    v17 = CarGeneralLogging(0);
    v13 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10006E42C();
LABEL_9:
    v12 = 0;
    goto LABEL_13;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsData baseFolderURL](self, "baseFolderURL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:", v8));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v20 = 0;
  v12 = objc_msgSend(v11, "moveItemAtURL:toURL:error:", v6, v10, &v20);
  v13 = v20;

  if ((v12 & 1) != 0)
  {
    -[CRDiagnosticsData _markPurgeable:](self, "_markPurgeable:", v10);
    v15 = objc_claimAutoreleasedReturnValue(-[CRDiagnosticsData attachmentURLs](self, "attachmentURLs"));
    -[NSObject addObject:](v15, "addObject:", v10);
  }
  else
  {
    v18 = CarGeneralLogging(v14);
    v15 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_10006E458();
  }

LABEL_13:
  return v12;
}

- (id)_getCreationDateForAttachmentURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v12 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, &v12));
    v6 = v12;

    if (v6)
    {
      v8 = CarGeneralLogging(v7);
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10006E4B8();

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSFileCreationDate));

  }
  else
  {
    v6 = 0;
    v10 = 0;
  }

  return v10;
}

- (BOOL)addTextAttachment:(id)a3 asFilename:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRDiagnosticsData baseFolderURL](self, "baseFolderURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:", v8));

    v18 = 0;
    v11 = objc_msgSend(v6, "writeToURL:atomically:encoding:error:", v10, 1, 4, &v18);
    v12 = v18;
    v13 = v12;
    if ((v11 & 1) != 0)
    {
      -[CRDiagnosticsData _markPurgeable:](self, "_markPurgeable:", v10);
      v14 = objc_claimAutoreleasedReturnValue(-[CRDiagnosticsData attachmentURLs](self, "attachmentURLs"));
      -[NSObject addObject:](v14, "addObject:", v10);
    }
    else
    {
      v16 = CarGeneralLogging(v12);
      v14 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10006E544();
    }

  }
  else
  {
    v15 = CarGeneralLogging(v7);
    v13 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10006E518();
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("timestamp: %@, attachmentURLs: %@, activeBundleID: %@, transcription: %@"), self->_timestamp, self->_attachmentURLs, self->_activeBundleIdentifier, self->_transcription);
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)timestamp
{
  return self->_timestamp;
}

- (NSURL)baseFolderURL
{
  return self->_baseFolderURL;
}

- (NSMutableArray)attachmentURLs
{
  return self->_attachmentURLs;
}

- (NSString)transcription
{
  return self->_transcription;
}

- (void)setTranscription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)activeBundleIdentifier
{
  return self->_activeBundleIdentifier;
}

- (void)setActiveBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (AFAccount)siriAccount
{
  return self->_siriAccount;
}

- (void)setSiriAccount:(id)a3
{
  objc_storeStrong((id *)&self->_siriAccount, a3);
}

- (NSString)locationDescription
{
  return self->_locationDescription;
}

- (void)setLocationDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)focusModeDescription
{
  return self->_focusModeDescription;
}

- (void)setFocusModeDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(unint64_t)a3
{
  self->_transportType = a3;
}

- (BOOL)isMapsActive
{
  return self->_mapsActive;
}

- (void)setMapsActive:(BOOL)a3
{
  self->_mapsActive = a3;
}

- (BOOL)vehicleSupportsStartSession
{
  return self->_vehicleSupportsStartSession;
}

- (void)setVehicleSupportsStartSession:(BOOL)a3
{
  self->_vehicleSupportsStartSession = a3;
}

- (NSString)additionalDescription
{
  return self->_additionalDescription;
}

- (void)setAdditionalDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)isCAFToolTreeCompletionCalled
{
  return self->_isCAFToolTreeCompletionCalled;
}

- (void)setIsCAFToolTreeCompletionCalled:(BOOL)a3
{
  self->_isCAFToolTreeCompletionCalled = a3;
}

- (BOOL)isVehicleDataSession
{
  return self->_isVehicleDataSession;
}

- (void)setIsVehicleDataSession:(BOOL)a3
{
  self->_isVehicleDataSession = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalDescription, 0);
  objc_storeStrong((id *)&self->_focusModeDescription, 0);
  objc_storeStrong((id *)&self->_locationDescription, 0);
  objc_storeStrong((id *)&self->_siriAccount, 0);
  objc_storeStrong((id *)&self->_activeBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_transcription, 0);
  objc_storeStrong((id *)&self->_attachmentURLs, 0);
  objc_storeStrong((id *)&self->_baseFolderURL, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
