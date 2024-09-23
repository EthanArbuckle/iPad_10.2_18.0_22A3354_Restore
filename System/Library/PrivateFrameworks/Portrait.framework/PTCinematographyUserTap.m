@implementation PTCinematographyUserTap

- (PTCinematographyUserTap)initWithTime:(id *)a3 tappedDetection:(id)a4 strong:(BOOL)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6;

  v6 = *a3;
  return -[PTCinematographyUserTap initWithTime:tappedDetection:strong:group:](self, "initWithTime:tappedDetection:strong:group:", &v6, a4, a5, 0);
}

- (PTCinematographyUserTap)initWithTime:(id *)a3 tappedDetection:(id)a4 strong:(BOOL)a5 group:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  void *v12;
  char *v13;
  _BYTE *v14;
  __int128 v15;
  BOOL v16;
  NSObject *v17;
  PTCinematographyUserTap *v18;
  objc_super v20;

  v6 = a6;
  v11 = a4;
  objc_msgSend(v11, "trackNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v20.receiver = self;
    v20.super_class = (Class)PTCinematographyUserTap;
    v13 = -[PTCinematographyUserTap init](&v20, sel_init);
    v14 = v13;
    if (v13)
    {
      v15 = *(_OWORD *)&a3->var0;
      *((_QWORD *)v13 + 5) = a3->var3;
      *(_OWORD *)(v13 + 24) = v15;
      objc_storeStrong((id *)v13 + 2, a4);
      v14[8] = a5;
      v16 = v6 && PTGroupIDIsValid(objc_msgSend(v11, "groupIdentifier"));
      v14[9] = v16;
    }
    self = v14;
    v18 = self;
  }
  else
  {
    _PTLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[PTCinematographyUserTap initWithTime:tappedDetection:strong:group:].cold.1(v17);

    v18 = 0;
  }

  return v18;
}

- (id)focusIdentifier
{
  void *v2;
  void *v3;

  -[PTCinematographyUserTap detection](self, "detection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "focusIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)trackIdentifier
{
  void *v2;
  int64_t v3;

  -[PTCinematographyUserTap detection](self, "detection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "trackIdentifier");

  return v3;
}

- (NSNumber)trackNumber
{
  void *v2;
  void *v3;

  -[PTCinematographyUserTap detection](self, "detection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "trackNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (int64_t)groupIdentifier
{
  void *v2;
  int64_t v3;

  -[PTCinematographyUserTap detection](self, "detection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "groupIdentifier");

  return v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_time, 24, 1, 0);
  return result;
}

- (PTCinematographyDetection)detection
{
  return (PTCinematographyDetection *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isStrong
{
  return self->_strong;
}

- (BOOL)isGroupTap
{
  return self->_groupTap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detection, 0);
}

- (void)initWithTime:(os_log_t)log tappedDetection:strong:group:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "error: attempt to create user tap with nil detection track number", v1, 2u);
}

@end
