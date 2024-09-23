@implementation VMAudioRecorderImp

- (BOOL)preparing
{
  return self->_currentState == 1;
}

- (id)_initWithRecordingID:(id)a3 model:(id)a4
{
  id v7;
  id v8;
  VMAudioRecorderImp *v9;
  VMAudioRecorderImp *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  _TtC10VoiceMemos19RCLiveTranscription *v16;
  void *v17;
  _TtC10VoiceMemos19RCLiveTranscription *v18;
  _TtC10VoiceMemos19RCLiveTranscription *liveTranscription;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)VMAudioRecorderImp;
  v9 = -[VMAudioRecorderImp init](&v21, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordingID, a3);
    if (v7)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "recordingWithUniqueID:", v7));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "url"));
      -[VMAudioRecorderImp setRecordingURL:](v10, "setRecordingURL:", v12);

    }
    v10->_markedVersionIndex = -1;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TranscriptionAvailabilityProvider shared](_TtC10VoiceMemos33TranscriptionAvailabilityProvider, "shared"));
    v14 = objc_msgSend(v13, "deviceIsSupported");

    if (v14)
    {
      if (v10->_recordingURL)
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[AVURLAsset assetWithURL:](AVURLAsset, "assetWithURL:"));
      else
        v15 = 0;
      v16 = [_TtC10VoiceMemos19RCLiveTranscription alloc];
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rc_transcriptionData"));
      v18 = -[RCLiveTranscription initWith:](v16, "initWith:", v17);
      liveTranscription = v10->_liveTranscription;
      v10->_liveTranscription = v18;

    }
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  RCSSavedRecordingAccessToken *v4;
  unsigned __int8 v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  objc_super v9;
  id v10;

  -[VMAudioRecorderImp _commitEditing](self, "_commitEditing");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RCSSavedRecordingService sharedService](RCSSavedRecordingService, "sharedService"));
  v4 = self->_recordingToken;
  if (v4)
  {
    v10 = 0;
    v5 = objc_msgSend(v3, "endAccessSessionWithToken:error:", v4, &v10);
    v6 = v10;
    if ((v5 & 1) == 0)
    {
      v7 = OSLogForCategory(kVMLogCategoryService);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_10010B364();

    }
  }
  if (self->_recordingURL)
    objc_msgSend(v3, "enableOrphanedFragmentCleanupForCompositionAVURL:");

  v9.receiver = self;
  v9.super_class = (Class)VMAudioRecorderImp;
  -[VMAudioRecorderImp dealloc](&v9, "dealloc");
}

- (void)setRecordingURL:(id)a3
{
  id v5;
  NSURL *v6;
  NSURL *v7;
  NSURL *metadataURL;
  void *v9;
  unsigned __int8 v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;

  v5 = a3;
  v6 = self->_recordingURL;
  if ((-[NSURL isEqual:](v6, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_recordingURL, a3);
    v7 = (NSURL *)objc_claimAutoreleasedReturnValue(+[RCComposition compositionMetadataURLForComposedAVURL:](RCComposition, "compositionMetadataURLForComposedAVURL:", v5));
    metadataURL = self->_metadataURL;
    self->_metadataURL = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCSSavedRecordingService sharedService](RCSSavedRecordingService, "sharedService"));
    v14 = 0;
    v10 = objc_msgSend(v9, "disableOrphanedFragmentCleanupForCompositionAVURL:error:", v5, &v14);
    v11 = v14;
    if ((v10 & 1) == 0)
    {
      v12 = OSLogForCategory(kVMLogCategoryService);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[VMAudioRecorderImp setRecordingURL:]";
        v17 = 2112;
        v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s -- disableError = %@", buf, 0x16u);
      }

    }
    if (v6)
      objc_msgSend(v9, "enableOrphanedFragmentCleanupForCompositionAVURL:", v6);

  }
}

- (void)setController:(id)a3
{
  id v4;
  RCKeyPathObservance *controllerObservance;
  RCKeyPathObservance *v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  RCKeyPathObservance *v11;
  RCKeyPathObservance *v12;
  _QWORD v13[4];
  id v14;
  id location;
  void *v16;

  v4 = a3;
  controllerObservance = self->_controllerObservance;
  if (controllerObservance)
  {
    -[RCKeyPathObservance remove](controllerObservance, "remove");
    v6 = self->_controllerObservance;
    self->_controllerObservance = 0;

  }
  objc_storeWeak((id *)&self->_controller, v4);
  if (v4)
  {
    objc_msgSend(v4, "targetTime");
    self->_targetTime = v7;
    objc_initWeak(&location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "targetTime"));
    v16 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000490D4;
    v13[3] = &unk_1001AC1B0;
    objc_copyWeak(&v14, &location);
    v10 = RCObserveChangesToKeyPaths(v4, v9, 1, v13);
    v11 = (RCKeyPathObservance *)objc_claimAutoreleasedReturnValue(v10);
    v12 = self->_controllerObservance;
    self->_controllerObservance = v11;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

- (double)idleDuration
{
  return self->_currentDuration;
}

- (BOOL)monitorRecordingTime:(double *)a3 duration:(double *)a4
{
  double currentDuration;
  void *v7;
  unsigned int v8;
  double v9;
  double v11;

  v11 = 0.0;
  currentDuration = self->_currentDuration;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioRecorderImp service](self, "service"));
  v8 = objc_msgSend(v7, "sampleRecordingTime:", &v11);

  if (v8)
  {
    v9 = v11;
    *a3 = v11;
    if (v9 < currentDuration)
      v9 = currentDuration;
    *a4 = v9;
  }
  return v8;
}

- (void)setCurrentState:(int)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  _BOOL8 v9;
  id v10;

  self->_currentState = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[VMAudioRecorderImp service](self, "service"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordingError"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioRecorderImp controller](self, "controller"));
    objc_msgSend(v6, "setRecordingError:", v5);

    objc_msgSend(v10, "setRecordingError:", 0);
  }
  v7 = objc_msgSend(v10, "mode");
  v9 = a3 > 1 && v7 == 2;
  if (-[VMAudioRecorderImp recording](self, "recording") != v9)
  {
    -[VMAudioRecorderImp setRecording:](self, "setRecording:", v9);
    if (!a3)
      AudioServicesPlaySystemSoundWithCompletion(0x45Au, &stru_1001AC1D0);
  }

}

- (void)setCurrentTime:(double)a3
{
  id WeakRetained;

  self->_currentTime = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "setCurrentTime:", a3);

}

- (void)setRecordingError:(id)a3
{
  id v5;
  id WeakRetained;

  objc_storeStrong((id *)&self->_recordingError, a3);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "setRecordingError:", v5);

}

- (BOOL)startRecording
{
  void *v3;
  unsigned __int8 v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v12;

  self->_stopRecordingTime = 0.0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioRecorderImp service](self, "service"));
  v12 = 0;
  v4 = objc_msgSend(v3, "isRecordingEnabled:", &v12);
  v5 = v12;
  if ((v4 & 1) != 0)
  {
    if (-[VMAudioRecorderImp currentState](self, "currentState"))
    {
      v6 = OSLogForCategory(kVMLogCategoryService);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10010B3D4(self, v7);
    }
    else
    {
      -[VMAudioRecorderImp setCurrentState:](self, "setCurrentState:", 1);
      v7 = objc_claimAutoreleasedReturnValue(-[VMAudioRecorderImp recordingID](self, "recordingID"));
      if (v7)
      {
        -[VMAudioRecorderImp _clearUndoStackCache](self, "_clearUndoStackCache");
        -[VMAudioRecorderImp targetTime](self, "targetTime");
        objc_msgSend(v3, "replaceRecording:atTime:controller:", v7, self);
      }
      else
      {
        self->_currentDuration = 0.0;
        objc_msgSend(v3, "startRecordingWithController:", self);
      }
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioRecorderImp controller](self, "controller"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordingError"));
    v8 = v10 == 0;

  }
  else
  {
    -[VMAudioRecorderImp setRecordingError:](self, "setRecordingError:", v5);
    v8 = 0;
  }

  return v8;
}

- (BOOL)stopRecording
{
  if (self->_stopRecordingTime == 0.0)
    RCCurrentMediaTime();
  return -[VMAudioRecorderImp stopRecordingAtTime:](self, "stopRecordingAtTime:");
}

- (BOOL)stopRecordingAtTime:(double)a3
{
  unsigned int v5;
  unsigned __int8 v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  v5 = -[VMAudioRecorderImp currentState](self, "currentState");
  v6 = 1;
  if (v5 && v5 != 3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioRecorderImp service](self, "service"));
    v11 = 0;
    v6 = objc_msgSend(v7, "stopRecordingWithController:atTime:error:", self, &v11, a3);
    v8 = v11;

    if ((v6 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioRecorderImp controller](self, "controller"));
      objc_msgSend(v9, "setRecordingError:", v8);

    }
  }
  return v6;
}

- (BOOL)_editRecording:(id)a3 error:(id *)a4
{
  uint64_t (**v6)(id, void *, id *);
  void *v7;

  v6 = (uint64_t (**)(id, void *, id *))a3;
  -[VMAudioRecorderImp _discardRedoVersions](self, "_discardRedoVersions");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioRecorderImp service](self, "service"));
  LOBYTE(a4) = v6[2](v6, v7, a4);

  return (char)a4;
}

- (BOOL)trimRecording:(id)a3 error:(id *)a4
{
  _QWORD v5[5];
  $F24F406B2B787EFB06265DBA3D28CBD5 v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100049618;
  v5[3] = &unk_1001AC1F8;
  v5[4] = self;
  v6 = a3;
  return -[VMAudioRecorderImp _editRecording:error:](self, "_editRecording:error:", v5, a4);
}

- (BOOL)cutRecording:(id)a3 error:(id *)a4
{
  _QWORD v5[5];
  $F24F406B2B787EFB06265DBA3D28CBD5 v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000496DC;
  v5[3] = &unk_1001AC1F8;
  v5[4] = self;
  v6 = a3;
  return -[VMAudioRecorderImp _editRecording:error:](self, "_editRecording:error:", v5, a4);
}

- (void)finishEditing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[VMAudioRecorderImp service](self, "service"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMAudioRecorderImp recordingID](self, "recordingID"));
  objc_msgSend(v6, "finalizeRecording:controller:saveAsNew:", v5, self, v3);

}

- (NSArray)versions
{
  void *v2;

  if (self->_metadataURL)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileVersion otherVersionsOfItemAtURL:](NSFileVersion, "otherVersionsOfItemAtURL:"));
  else
    v2 = 0;
  return (NSArray *)v2;
}

- (BOOL)_buildUndoStackCache
{
  BOOL v2;
  NSURL *metadataURL;
  NSURL *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *undoStack;
  void *v9;
  id v10;
  NSMutableArray *v11;
  id v12;
  id WeakRetained;
  id v15;

  if (self->_undoStack)
    return 1;
  metadataURL = self->_metadataURL;
  if (!metadataURL)
    return 1;
  v5 = metadataURL;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileVersion otherVersionsOfItemAtURL:](NSFileVersion, "otherVersionsOfItemAtURL:", v5));
  v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v6));
  undoStack = self->_undoStack;
  self->_undoStack = v7;

  v15 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileVersion _addVersionOfItemAtURL:withContentsOfURL:options:temporaryStorageIdentifier:error:](NSFileVersion, "_addVersionOfItemAtURL:withContentsOfURL:options:temporaryStorageIdentifier:error:", v5, v5, 0, 0, &v15));
  v10 = v15;
  v2 = v9 != 0;
  v11 = self->_undoStack;
  if (v9)
  {
    -[NSMutableArray addObject:](v11, "addObject:", v9);
    v12 = -[NSMutableArray count](self->_undoStack, "count");

    self->_versionIndex = (unint64_t)v12 - 1;
  }
  else
  {
    self->_undoStack = 0;

    *(_OWORD *)&self->_versionIndex = xmmword_100186D50;
    WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    objc_msgSend(WeakRetained, "setRecordingError:", v10);

  }
  return v2;
}

- (BOOL)undoEditing
{
  NSURL *v3;
  NSMutableArray *undoStack;
  unint64_t versionIndex;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  id WeakRetained;
  id v12;

  v3 = self->_metadataURL;
  if (v3
    && -[VMAudioRecorderImp _buildUndoStackCache](self, "_buildUndoStackCache")
    && (undoStack = self->_undoStack) != 0
    && (versionIndex = self->_versionIndex) != 0)
  {
    self->_versionIndex = versionIndex - 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](undoStack, "objectAtIndexedSubscript:"));
    v12 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "replaceItemAtURL:options:error:", v3, 0, &v12));
    v8 = v12;
    if (v7 && (objc_msgSend(v7, "isEqual:", v3) & 1) != 0)
    {
      v9 = -[VMAudioService refreshRecording:controller:](self->_service, "refreshRecording:controller:", self->_recordingID, self);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      objc_msgSend(WeakRetained, "setRecordingError:", v8);

      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)redoEditing
{
  NSMutableArray *undoStack;
  char *versionIndex;
  NSURL *v5;
  NSMutableArray *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  id WeakRetained;
  id v13;

  undoStack = self->_undoStack;
  if (!undoStack)
    return 0;
  versionIndex = (char *)self->_versionIndex;
  if (versionIndex >= (char *)-[NSMutableArray count](undoStack, "count") - 1)
    return 0;
  v5 = self->_metadataURL;
  if (v5)
  {
    v6 = self->_undoStack;
    ++self->_versionIndex;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:"));
    v13 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "replaceItemAtURL:options:error:", v5, 0, &v13));
    v9 = v13;
    if (v8 && (objc_msgSend(v8, "isEqual:", v5) & 1) != 0)
    {
      v10 = -[VMAudioService refreshRecording:controller:](self->_service, "refreshRecording:controller:", self->_recordingID, self);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      objc_msgSend(WeakRetained, "setRecordingError:", v9);

      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_discardAllEdits
{
  NSURL *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSMutableArray *undoStack;
  BOOL v10;
  id WeakRetained;
  id v13;

  v3 = self->_metadataURL;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileVersion otherVersionsOfItemAtURL:](NSFileVersion, "otherVersionsOfItemAtURL:", v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v6 = v5;
    if (v5)
    {
      v13 = 0;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "replaceItemAtURL:options:error:", v3, 1, &v13));
      v8 = v13;
      if (v7 && objc_msgSend(v7, "isEqual:", v3))
      {
        -[VMAudioRecorderImp _commitEditing](self, "_commitEditing");
        undoStack = self->_undoStack;
        self->_undoStack = 0;

        *(_OWORD *)&self->_versionIndex = xmmword_100186D50;
        -[VMAudioService refreshRecording:controller:](self->_service, "refreshRecording:controller:", self->_recordingID, self);
        v10 = 1;
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
        objc_msgSend(WeakRetained, "setRecordingError:", v8);

        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)discardAllEdits
{
  return -[VMAudioRecorderImp _discardAllEdits](self, "_discardAllEdits");
}

- (void)markCurrentVersion
{
  id v3;
  id v4;

  if (self->_undoStack || !self->_metadataURL)
  {
    self->_markedVersionIndex = self->_versionIndex;
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSFileVersion otherVersionsOfItemAtURL:](NSFileVersion, "otherVersionsOfItemAtURL:"));
    v3 = objc_msgSend(v4, "count");
    self->_versionIndex = (unint64_t)v3;
    self->_markedVersionIndex = (int64_t)v3;

  }
}

- (BOOL)_restoreMarkedVersion
{
  NSURL *v3;
  NSMutableArray *undoStack;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  id WeakRetained;
  id v11;

  v3 = self->_metadataURL;
  if (v3
    && (self->_markedVersionIndex & 0x8000000000000000) == 0
    && -[VMAudioRecorderImp _buildUndoStackCache](self, "_buildUndoStackCache")
    && (undoStack = self->_undoStack) != 0)
  {
    self->_versionIndex = self->_markedVersionIndex;
    self->_markedVersionIndex = -1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](undoStack, "objectAtIndexedSubscript:"));
    v11 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "replaceItemAtURL:options:error:", v3, 0, &v11));
    v7 = v11;
    if (v6 && (objc_msgSend(v6, "isEqual:", v3) & 1) != 0)
    {
      v8 = -[VMAudioService refreshRecording:controller:](self->_service, "refreshRecording:controller:", self->_recordingID, self);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      objc_msgSend(WeakRetained, "setRecordingError:", v7);

      -[VMAudioRecorderImp _discardRedoVersions](self, "_discardRedoVersions");
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)restoreMarkedVersion
{
  return -[VMAudioRecorderImp _restoreMarkedVersion](self, "_restoreMarkedVersion");
}

- (void)_discardRedoVersions
{
  NSMutableArray *undoStack;
  unint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  NSMutableArray *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  _BYTE v26[128];

  undoStack = self->_undoStack;
  if (undoStack)
  {
    v4 = self->_versionIndex + 1;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray subarrayWithRange:](self->_undoStack, "subarrayWithRange:", v4, (char *)-[NSMutableArray count](undoStack, "count") - v4));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      v9 = kVMLogCategoryDefault;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v10);
          v17 = 0;
          v12 = objc_msgSend(v11, "removeAndReturnError:", &v17);
          v13 = v17;
          if ((v12 & 1) == 0)
          {
            v14 = OSLogForCategory(v9);
            v15 = objc_claimAutoreleasedReturnValue(v14);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v23 = "-[VMAudioRecorderImp _discardRedoVersions]";
              v24 = 2112;
              v25 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s -- removeError = %@", buf, 0x16u);
            }

          }
          v10 = (char *)v10 + 1;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v7);
    }

    v16 = self->_undoStack;
    self->_undoStack = 0;

  }
}

- (void)_clearUndoStackCache
{
  NSMutableArray *undoStack;
  void *v4;
  unsigned __int8 v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSMutableArray *v9;
  id v10;

  undoStack = self->_undoStack;
  if (undoStack)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](undoStack, "objectAtIndexedSubscript:", self->_versionIndex));
    v10 = 0;
    v5 = objc_msgSend(v4, "removeAndReturnError:", &v10);
    v6 = v10;
    if ((v5 & 1) == 0)
    {
      v7 = OSLogForCategory(kVMLogCategoryDefault);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_10010B468();

    }
    -[VMAudioRecorderImp _discardRedoVersions](self, "_discardRedoVersions");
    v9 = self->_undoStack;
    self->_undoStack = 0;

    self->_versionIndex = 0;
  }
}

- (void)_commitEditing
{
  NSURL *v2;
  unsigned __int8 v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;

  v2 = self->_metadataURL;
  if (v2)
  {
    v7 = 0;
    v3 = +[NSFileVersion removeOtherVersionsOfItemAtURL:error:](NSFileVersion, "removeOtherVersionsOfItemAtURL:error:", v2, &v7);
    v4 = v7;
    if ((v3 & 1) == 0)
    {
      v5 = OSLogForCategory(kVMLogCategoryDefault);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_10010B4D8();

    }
  }

}

- (BOOL)shouldWaitForAccessToken
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VMAudioService sharedInstance](VMAudioService, "sharedInstance"));
  LOBYTE(self) = objc_msgSend(v3, "shouldWaitForAccessTokenBeforeStartingRecording:", self);

  return (char)self;
}

- (double)targetTime
{
  return self->_targetTime;
}

- (void)setTargetTime:(double)a3
{
  self->_targetTime = a3;
}

- (int)targetState
{
  return self->_targetState;
}

- (void)setTargetState:(int)a3
{
  self->_targetState = a3;
}

- (int)currentState
{
  return self->_currentState;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (double)currentDuration
{
  return self->_currentDuration;
}

- (void)setCurrentDuration:(double)a3
{
  self->_currentDuration = a3;
}

- (NSError)recordingError
{
  return self->_recordingError;
}

- (NSString)recordingID
{
  return self->_recordingID;
}

- (void)setRecordingID:(id)a3
{
  objc_storeStrong((id *)&self->_recordingID, a3);
}

- (NSURL)recordingURL
{
  return self->_recordingURL;
}

- (NSDate)recordingDate
{
  return self->_recordingDate;
}

- (void)setRecordingDate:(id)a3
{
  objc_storeStrong((id *)&self->_recordingDate, a3);
}

- (VMAudioRecorderController)controller
{
  return (VMAudioRecorderController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (RCSSavedRecordingAccessToken)recordingToken
{
  return self->_recordingToken;
}

- (void)setRecordingToken:(id)a3
{
  objc_storeStrong((id *)&self->_recordingToken, a3);
}

- (RCComposition)recordingComposition
{
  return self->_recordingComposition;
}

- (void)setRecordingComposition:(id)a3
{
  objc_storeStrong((id *)&self->_recordingComposition, a3);
}

- (RCWaveformDataSource)waveformDataSource
{
  return self->_waveformDataSource;
}

- (void)setWaveformDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_waveformDataSource, a3);
}

- (RCActivityWaveformProcessor)activityWaveformProcessor
{
  return self->_activityWaveformProcessor;
}

- (void)setActivityWaveformProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_activityWaveformProcessor, a3);
}

- (BOOL)recording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (BOOL)ioStarted
{
  return self->_ioStarted;
}

- (void)setIoStarted:(BOOL)a3
{
  self->_ioStarted = a3;
}

- (double)stopRecordingTime
{
  return self->_stopRecordingTime;
}

- (void)setStopRecordingTime:(double)a3
{
  self->_stopRecordingTime = a3;
}

- (VMRecordingAssetsBackup)assetBackup
{
  return self->_assetBackup;
}

- (void)setAssetBackup:(id)a3
{
  objc_storeStrong((id *)&self->_assetBackup, a3);
}

- (_TtC10VoiceMemos19RCLiveTranscription)liveTranscription
{
  return self->_liveTranscription;
}

- (void)setLiveTranscription:(id)a3
{
  objc_storeStrong((id *)&self->_liveTranscription, a3);
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (VMAudioService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (NSString)titleBase
{
  return self->_titleBase;
}

- (void)setTitleBase:(id)a3
{
  objc_storeStrong((id *)&self->_titleBase, a3);
}

- (BOOL)isNewRecording
{
  return self->_isNewRecording;
}

- (void)setIsNewRecording:(BOOL)a3
{
  self->_isNewRecording = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleBase, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_liveTranscription, 0);
  objc_storeStrong((id *)&self->_assetBackup, 0);
  objc_storeStrong((id *)&self->_activityWaveformProcessor, 0);
  objc_storeStrong((id *)&self->_waveformDataSource, 0);
  objc_storeStrong((id *)&self->_recordingComposition, 0);
  objc_storeStrong((id *)&self->_recordingToken, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_recordingDate, 0);
  objc_storeStrong((id *)&self->_recordingURL, 0);
  objc_storeStrong((id *)&self->_recordingID, 0);
  objc_storeStrong((id *)&self->_recordingError, 0);
  objc_storeStrong((id *)&self->_metadataURL, 0);
  objc_storeStrong((id *)&self->_undoStack, 0);
  objc_storeStrong((id *)&self->_editingStatusObservance, 0);
  objc_storeStrong((id *)&self->_controllerObservance, 0);
}

@end
