@implementation AEAudiobookBookmarkTimeSnapshot

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AEAudiobookBookmarkTimeSnapshot bookmarkTime](self, "bookmarkTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("AEAudiobookBookmarkTime"));
  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEAudiobookBookmarkTimeSnapshot bookmarkTimeTimestamp](self, "bookmarkTimeTimestamp"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("AEAudiobookBookmarkTimestamp"));

}

- (AEAudiobookBookmarkTimeSnapshot)initWithBookmarkTime:(double)a3 bookmarkTimeTimestamp:(id)a4
{
  id v7;
  AEAudiobookBookmarkTimeSnapshot *v8;
  AEAudiobookBookmarkTimeSnapshot *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AEAudiobookBookmarkTimeSnapshot;
  v8 = -[AEAudiobookBookmarkTimeSnapshot init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_bookmarkTime = a3;
    objc_storeStrong((id *)&v8->_bookmarkTimeTimestamp, a4);
  }

  return v9;
}

- (AEAudiobookBookmarkTimeSnapshot)initWithCoder:(id)a3
{
  id v4;
  AEAudiobookBookmarkTimeSnapshot *v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  NSDate *bookmarkTimeTimestamp;

  v4 = a3;
  v5 = -[AEAudiobookBookmarkTimeSnapshot init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("AEAudiobookBookmarkTime"));
    v5->_bookmarkTime = v6;
    *(_QWORD *)&v7 = objc_opt_class(NSDate).n128_u64[0];
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, CFSTR("AEAudiobookBookmarkTimestamp"), v7));
    bookmarkTimeTimestamp = v5->_bookmarkTimeTimestamp;
    v5->_bookmarkTimeTimestamp = (NSDate *)v9;

  }
  return v5;
}

- (double)newestBookmarkTimeFromBookmarkTime:(double)a3 bookmarkTimeTimestamp:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  uint64_t v16;
  double v17;
  void *v18;
  uint64_t v19;
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  double v28;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookBookmarkTimeSnapshot bookmarkTimeTimestamp](self, "bookmarkTimeTimestamp"));
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v11 = v10;

  v12 = BDSCloudKitAudiobookLog();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v9 <= v11)
  {
    if (v14)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookBookmarkTimeSnapshot bookmarkTimeTimestamp](self, "bookmarkTimeTimestamp"));
      -[AEAudiobookBookmarkTimeSnapshot bookmarkTime](self, "bookmarkTime");
      v21 = 138413058;
      v22 = v18;
      v23 = 2048;
      v24 = v19;
      v25 = 2112;
      v26 = v6;
      v27 = 2048;
      v28 = a3;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Audiobook Bookmark time snapshot date: %@ time:%lf < cloud date: %@ time: %lf.  Assuming Cloud time.", (uint8_t *)&v21, 0x2Au);

    }
  }
  else
  {
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEAudiobookBookmarkTimeSnapshot bookmarkTimeTimestamp](self, "bookmarkTimeTimestamp"));
      -[AEAudiobookBookmarkTimeSnapshot bookmarkTime](self, "bookmarkTime");
      v21 = 138413058;
      v22 = v15;
      v23 = 2048;
      v24 = v16;
      v25 = 2112;
      v26 = v6;
      v27 = 2048;
      v28 = a3;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Audiobook Bookmark time snapshot date: %@ time:%lf > cloud date: %@ time: %lf.  Assuming snapshot time.", (uint8_t *)&v21, 0x2Au);

    }
    -[AEAudiobookBookmarkTimeSnapshot bookmarkTime](self, "bookmarkTime");
    a3 = v17;
  }

  return a3;
}

- (double)bookmarkTime
{
  return self->_bookmarkTime;
}

- (void)setBookmarkTime:(double)a3
{
  self->_bookmarkTime = a3;
}

- (NSDate)bookmarkTimeTimestamp
{
  return self->_bookmarkTimeTimestamp;
}

- (void)setBookmarkTimeTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkTimeTimestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkTimeTimestamp, 0);
}

@end
