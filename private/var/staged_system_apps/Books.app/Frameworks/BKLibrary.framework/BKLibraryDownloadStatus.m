@implementation BKLibraryDownloadStatus

+ (id)statusWithAssetID:(id)a3 state:(int64_t)a4 progressValue:(double)a5 timeRemaining:(int64_t)a6
{
  id v10;
  id v11;

  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithAssetID:state:progressValue:timeRemaining:bytesDownloaded:fileSize:", v10, a4, a6, 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL, a5);

  return v11;
}

- (BKLibraryDownloadStatus)initWithAssetID:(id)a3 state:(int64_t)a4 progressValue:(double)a5 timeRemaining:(int64_t)a6 bytesDownloaded:(unint64_t)a7 fileSize:(unint64_t)a8
{
  return -[BKLibraryDownloadStatus initWithAssetID:state:progressValue:timeRemaining:bytesDownloaded:fileSize:error:](self, "initWithAssetID:state:progressValue:timeRemaining:bytesDownloaded:fileSize:error:", a3, a4, a6, a7, a8, 0, a5);
}

- (BKLibraryDownloadStatus)initWithAssetID:(id)a3 supplementalContentState:(int64_t)a4 progressValue:(double)a5 timeRemaining:(int64_t)a6 bytesDownloaded:(unint64_t)a7 fileSize:(unint64_t)a8
{
  return -[BKLibraryDownloadStatus initWithAssetID:state:supplementalContentState:progressValue:timeRemaining:bytesDownloaded:fileSize:error:](self, "initWithAssetID:state:supplementalContentState:progressValue:timeRemaining:bytesDownloaded:fileSize:error:", a3, 0, a4, a6, a7, a8, a5, 0);
}

- (BKLibraryDownloadStatus)initWithAssetID:(id)a3 state:(int64_t)a4 progressValue:(double)a5 timeRemaining:(int64_t)a6 bytesDownloaded:(unint64_t)a7 fileSize:(unint64_t)a8 error:(id)a9
{
  return -[BKLibraryDownloadStatus initWithAssetID:state:supplementalContentState:progressValue:timeRemaining:bytesDownloaded:fileSize:error:](self, "initWithAssetID:state:supplementalContentState:progressValue:timeRemaining:bytesDownloaded:fileSize:error:", a3, a4, 0, a6, a7, a8, a5, a9);
}

- (BKLibraryDownloadStatus)initWithAssetID:(id)a3 state:(int64_t)a4 supplementalContentState:(int64_t)a5 progressValue:(double)a6 timeRemaining:(int64_t)a7 bytesDownloaded:(unint64_t)a8 fileSize:(unint64_t)a9 error:(id)a10
{
  id v17;
  id v18;
  BKLibraryDownloadStatus *v19;
  NSString *v20;
  NSString *assetID;
  int64_t v22;
  double v23;
  void *v24;
  objc_super v26;

  v17 = a3;
  v18 = a10;
  v26.receiver = self;
  v26.super_class = (Class)BKLibraryDownloadStatus;
  v19 = -[BKLibraryDownloadStatus init](&v26, "init");
  if (v19)
  {
    v20 = (NSString *)objc_msgSend(v17, "copy");
    assetID = v19->_assetID;
    v19->_assetID = v20;

    v19->_state = a4;
    v19->_supplementalContentState = a5;
    if (a4)
      v22 = a4;
    else
      v22 = a5;
    v23 = fmin(a6, 1.0);
    if (v23 < 0.0)
      v23 = 0.0;
    v19->_progressValue = v23;
    v19->_combinedState = v22;
    v19->_timeRemaining = a7;
    v19->_bytesDownloaded = a8;
    v19->_fileSize = a9;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[BKReachability sharedReachabilityForInternetConnection](BKReachability, "sharedReachabilityForInternetConnection"));
    v19->_internetReachable = objc_msgSend(v24, "currentReachabilityStatus") != 0;

    objc_storeStrong((id *)&v19->_error, a10);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  id v19;
  unsigned int v20;
  unsigned __int8 v21;
  void *v23;
  void *v24;
  void *v25;

  v5 = a3;
  v6 = objc_opt_class(BKLibraryDownloadStatus);
  v7 = BUDynamicCast(v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
  {
    v21 = 0;
    goto LABEL_14;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDownloadStatus assetID](self, "assetID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
  if (objc_msgSend(v9, "isEqualToString:", v10))
  {
    v11 = -[BKLibraryDownloadStatus state](self, "state");
    if (v11 == objc_msgSend(v8, "state"))
    {
      v12 = -[BKLibraryDownloadStatus supplementalContentState](self, "supplementalContentState");
      if (v12 == objc_msgSend(v8, "supplementalContentState"))
      {
        v13 = -[BKLibraryDownloadStatus combinedState](self, "combinedState");
        if (v13 == objc_msgSend(v8, "combinedState"))
        {
          -[BKLibraryDownloadStatus progressValue](self, "progressValue");
          v15 = v14;
          objc_msgSend(v8, "progressValue");
          if (vabdd_f64(v15, v16) < 0.001)
          {
            v17 = -[BKLibraryDownloadStatus timeRemaining](self, "timeRemaining");
            if (v17 == objc_msgSend(v8, "timeRemaining"))
            {
              v18 = -[BKLibraryDownloadStatus bytesDownloaded](self, "bytesDownloaded");
              if (v18 == objc_msgSend(v8, "bytesDownloaded"))
              {
                v19 = -[BKLibraryDownloadStatus fileSize](self, "fileSize");
                if (v19 == objc_msgSend(v8, "fileSize"))
                {
                  v20 = -[BKLibraryDownloadStatus internetReachable](self, "internetReachable");
                  if (v20 == objc_msgSend(v8, "internetReachable"))
                  {
                    v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDownloadStatus error](self, "error"));
                    if (v23 || (v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"))) != 0)
                    {
                      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDownloadStatus error](self, "error"));
                      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
                      v21 = objc_msgSend(v24, "isEqual:", v25);

                      if (v23)
                      {
LABEL_21:

                        goto LABEL_12;
                      }
                    }
                    else
                    {
                      v21 = 1;
                    }

                    goto LABEL_21;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v21 = 0;
LABEL_12:

LABEL_14:
  return v21;
}

- (BOOL)isProgressAndStateEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;

  v4 = a3;
  v5 = objc_opt_class(BKLibraryDownloadStatus);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDownloadStatus assetID](self, "assetID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
    if (objc_msgSend(v8, "isEqualToString:", v9)
      && (v10 = -[BKLibraryDownloadStatus state](self, "state"), v10 == objc_msgSend(v7, "state")))
    {
      -[BKLibraryDownloadStatus progressValue](self, "progressValue");
      v12 = v11;
      objc_msgSend(v7, "progressValue");
      v14 = vabdd_f64(v12, v13) < 0.001;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char *v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDownloadStatus assetID](self, "assetID"));
  v4 = objc_msgSend(v3, "hash");

  v5 = (_BYTE *)-[BKLibraryDownloadStatus state](self, "state") - (_BYTE *)v4 + 32 * (_QWORD)v4;
  v6 = -[BKLibraryDownloadStatus supplementalContentState](self, "supplementalContentState") + 32 * v5 - v5;
  v7 = -[BKLibraryDownloadStatus combinedState](self, "combinedState") + 32 * v6 - v6;
  -[BKLibraryDownloadStatus progressValue](self, "progressValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v9 = (int64_t)objc_msgSend(v8, "hash") + 32 * v7 - v7;

  v10 = -[BKLibraryDownloadStatus timeRemaining](self, "timeRemaining") + 32 * v9 - v9;
  v11 = -[BKLibraryDownloadStatus bytesDownloaded](self, "bytesDownloaded") + 32 * v10 - v10;
  v12 = 31 * (-[BKLibraryDownloadStatus fileSize](self, "fileSize") + 32 * v11 - v11);
  v13 = v12 + -[BKLibraryDownloadStatus internetReachable](self, "internetReachable");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDownloadStatus error](self, "error"));
  v15 = (char *)objc_msgSend(v14, "hash") + 32 * v13 - v13 + 0x2E97294E4B2C1;

  return (unint64_t)v15;
}

- (void)updateWithStatus:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  NSError *v12;
  NSError *error;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "assetID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDownloadStatus assetID](self, "assetID"));
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    if (objc_msgSend(v14, "state") != (id)self->_state)
    {
      -[BKLibraryDownloadStatus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
      self->_state = (int64_t)objc_msgSend(v14, "state");
      -[BKLibraryDownloadStatus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
    }
    if (objc_msgSend(v14, "supplementalContentState") != (id)self->_supplementalContentState)
    {
      -[BKLibraryDownloadStatus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("supplementalContentState"));
      self->_supplementalContentState = (int64_t)objc_msgSend(v14, "supplementalContentState");
      -[BKLibraryDownloadStatus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("supplementalContentState"));
    }
    if (objc_msgSend(v14, "combinedState") != (id)self->_combinedState)
    {
      -[BKLibraryDownloadStatus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("combinedState"));
      self->_combinedState = (int64_t)objc_msgSend(v14, "combinedState");
      -[BKLibraryDownloadStatus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("combinedState"));
    }
    objc_msgSend(v14, "progressValue");
    if (v7 != self->_progressValue)
    {
      -[BKLibraryDownloadStatus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("progressValue"));
      objc_msgSend(v14, "progressValue");
      self->_progressValue = v8;
      -[BKLibraryDownloadStatus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("progressValue"));
    }
    if (objc_msgSend(v14, "timeRemaining") != (id)self->_timeRemaining)
    {
      -[BKLibraryDownloadStatus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("timeRemaining"));
      self->_timeRemaining = (int64_t)objc_msgSend(v14, "timeRemaining");
      -[BKLibraryDownloadStatus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("timeRemaining"));
    }
    if (objc_msgSend(v14, "bytesDownloaded") != (id)self->_bytesDownloaded
      && objc_msgSend(v14, "bytesDownloaded") != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      -[BKLibraryDownloadStatus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bytesDownloaded"));
      self->_bytesDownloaded = (unint64_t)objc_msgSend(v14, "bytesDownloaded");
      -[BKLibraryDownloadStatus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bytesDownloaded"));
    }
    if (objc_msgSend(v14, "fileSize") != (id)self->_fileSize
      && objc_msgSend(v14, "fileSize") != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      -[BKLibraryDownloadStatus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("fileSize"));
      self->_fileSize = (unint64_t)objc_msgSend(v14, "fileSize");
      -[BKLibraryDownloadStatus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("fileSize"));
    }
    if (self->_internetReachable != objc_msgSend(v14, "internetReachable"))
    {
      -[BKLibraryDownloadStatus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("internetReachable"));
      self->_internetReachable = objc_msgSend(v14, "internetReachable");
      -[BKLibraryDownloadStatus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("internetReachable"));
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "error"));
    if (v9 || self->_error)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "error"));
      v11 = objc_msgSend(v10, "isEqual:", self->_error);

      if ((v11 & 1) == 0)
      {
        -[BKLibraryDownloadStatus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("error"));
        v12 = (NSError *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "error"));
        error = self->_error;
        self->_error = v12;

        -[BKLibraryDownloadStatus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("error"));
      }
    }
  }

}

- (void)updateWithWaitingToBeDownloadable:(BOOL)a3
{
  if (self->_waitingToBeDownloadable != a3)
  {
    -[BKLibraryDownloadStatus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("waitingToBeDownloadable"));
    self->_waitingToBeDownloadable = a3;
    -[BKLibraryDownloadStatus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("waitingToBeDownloadable"));
  }
}

- (BOOL)canPause
{
  return (unint64_t)(self->_state - 3) < 2;
}

- (BOOL)canResume
{
  return self->_state == 6;
}

- (BOOL)canRestart
{
  return self->_state == 7;
}

- (BOOL)canStart
{
  return self->_state < 2uLL;
}

- (BOOL)hasFinished
{
  return (self->_state < 0xCuLL) & (0xDA0u >> self->_state);
}

- (id)stateStringDescription:(int64_t)a3
{
  return off_C2CC8[a3];
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *assetID;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  assetID = self->_assetID;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryDownloadStatus stateStringDescription:](self, "stateStringDescription:", self->_state));
  v8 = objc_claimAutoreleasedReturnValue(-[BKLibraryDownloadStatus stateStringDescription:](self, "stateStringDescription:", self->_supplementalContentState));
  v9 = (void *)v8;
  v10 = CFSTR("YES");
  if (!self->_internetReachable)
    v10 = CFSTR("NO");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p assetID=%@ state=%@ supplementalContentState=%@ progressValue=%f timeRemaining=%ld internetReachable=%@ error=%@>"), v5, self, assetID, v7, v8, *(_QWORD *)&self->_progressValue, self->_timeRemaining, v10, self->_error));

  return (NSString *)v11;
}

- (NSString)assetID
{
  return self->_assetID;
}

- (double)progressValue
{
  return self->_progressValue;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)supplementalContentState
{
  return self->_supplementalContentState;
}

- (int64_t)combinedState
{
  return self->_combinedState;
}

- (int64_t)timeRemaining
{
  return self->_timeRemaining;
}

- (unint64_t)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (BOOL)internetReachable
{
  return self->_internetReachable;
}

- (BOOL)waitingToBeDownloadable
{
  return self->_waitingToBeDownloadable;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
