@implementation TUIVideoMetadataBase

- (TUIVideoMetadataBase)initWithMode:(unint64_t)a3 isMuted:(BOOL)a4 isPlaying:(BOOL)a5 mediaTimePlayed:(double)a6 mediaDuration:(double)a7 mediaId:(id)a8
{
  id v15;
  TUIVideoMetadataBase *v16;
  TUIVideoMetadataBase *v17;
  objc_super v19;

  v15 = a8;
  v19.receiver = self;
  v19.super_class = (Class)TUIVideoMetadataBase;
  v16 = -[TUIVideoMetadataBase init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    v16->_mode = a3;
    v16->_isMuted = a4;
    v16->_isPlaying = a5;
    v16->_mediaTimePlayed = a6;
    v16->_mediaDuration = a7;
    objc_storeStrong((id *)&v16->_mediaId, a8);
  }

  return v17;
}

- (id)serialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *mediaId;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[6];

  v11[0] = CFSTR("videoMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIVideoMetadataBase videoModeAsString](self, "videoModeAsString"));
  v12[0] = v3;
  v11[1] = CFSTR("mediaTimePlayed");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_mediaTimePlayed));
  v12[1] = v4;
  v11[2] = CFSTR("mediaDuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_mediaDuration));
  v12[2] = v5;
  v11[3] = CFSTR("isMuted");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isMuted));
  v12[3] = v6;
  v11[4] = CFSTR("isPlaying");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isPlaying));
  v11[5] = CFSTR("mediaId");
  mediaId = self->_mediaId;
  v12[4] = v7;
  v12[5] = mediaId;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 6));

  return v9;
}

- (id)videoModeAsString
{
  if (qword_2CB678 != -1)
    dispatch_once(&qword_2CB678, &stru_241250);
  return objc_msgSend((id)qword_2CB670, "objectAtIndexedSubscript:", self->_mode);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (double)mediaTimePlayed
{
  return self->_mediaTimePlayed;
}

- (double)mediaDuration
{
  return self->_mediaDuration;
}

- (NSString)mediaId
{
  return self->_mediaId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaId, 0);
}

@end
