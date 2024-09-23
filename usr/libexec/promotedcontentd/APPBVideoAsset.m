@implementation APPBVideoAsset

+ (id)options
{
  if (qword_100269780 != -1)
    dispatch_once(&qword_100269780, &stru_100214978);
  return (id)qword_100269778;
}

- (BOOL)hasVideoFormat
{
  return self->_videoFormat != 0;
}

- (BOOL)hasVideoFileURL
{
  return self->_videoFileURL != 0;
}

- (BOOL)hasVideoSoundCheckData
{
  return self->_videoSoundCheckData != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBVideoAsset;
  v3 = -[APPBVideoAsset description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBVideoAsset dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *videoFormat;
  NSString *videoFileURL;
  NSData *videoSoundCheckData;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  videoFormat = self->_videoFormat;
  if (videoFormat)
    objc_msgSend(v3, "setObject:forKey:", videoFormat, CFSTR("videoFormat"));
  videoFileURL = self->_videoFileURL;
  if (videoFileURL)
    objc_msgSend(v4, "setObject:forKey:", videoFileURL, CFSTR("videoFileURL"));
  videoSoundCheckData = self->_videoSoundCheckData;
  if (videoSoundCheckData)
    objc_msgSend(v4, "setObject:forKey:", videoSoundCheckData, CFSTR("videoSoundCheckData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBVideoAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *videoFormat;
  NSString *videoFileURL;
  NSData *videoSoundCheckData;
  id v8;

  v4 = a3;
  videoFormat = self->_videoFormat;
  v8 = v4;
  if (videoFormat)
  {
    PBDataWriterWriteStringField(v4, videoFormat, 1);
    v4 = v8;
  }
  videoFileURL = self->_videoFileURL;
  if (videoFileURL)
  {
    PBDataWriterWriteStringField(v8, videoFileURL, 2);
    v4 = v8;
  }
  videoSoundCheckData = self->_videoSoundCheckData;
  if (videoSoundCheckData)
  {
    PBDataWriterWriteDataField(v8, videoSoundCheckData, 3);
    v4 = v8;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_videoFormat)
  {
    objc_msgSend(v4, "setVideoFormat:");
    v4 = v5;
  }
  if (self->_videoFileURL)
  {
    objc_msgSend(v5, "setVideoFileURL:");
    v4 = v5;
  }
  if (self->_videoSoundCheckData)
  {
    objc_msgSend(v5, "setVideoSoundCheckData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_videoFormat, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_videoFileURL, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSData copyWithZone:](self->_videoSoundCheckData, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *videoFormat;
  NSString *videoFileURL;
  NSData *videoSoundCheckData;
  unsigned __int8 v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((videoFormat = self->_videoFormat, !((unint64_t)videoFormat | v4[2]))
     || -[NSString isEqual:](videoFormat, "isEqual:"))
    && ((videoFileURL = self->_videoFileURL, !((unint64_t)videoFileURL | v4[1]))
     || -[NSString isEqual:](videoFileURL, "isEqual:")))
  {
    videoSoundCheckData = self->_videoSoundCheckData;
    if ((unint64_t)videoSoundCheckData | v4[3])
      v8 = -[NSData isEqual:](videoSoundCheckData, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_videoFormat, "hash");
  v4 = -[NSString hash](self->_videoFileURL, "hash") ^ v3;
  return v4 ^ (unint64_t)-[NSData hash](self->_videoSoundCheckData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[APPBVideoAsset setVideoFormat:](self, "setVideoFormat:");
  if (v4[1])
    -[APPBVideoAsset setVideoFileURL:](self, "setVideoFileURL:");
  if (v4[3])
    -[APPBVideoAsset setVideoSoundCheckData:](self, "setVideoSoundCheckData:");

}

- (NSString)videoFormat
{
  return self->_videoFormat;
}

- (void)setVideoFormat:(id)a3
{
  objc_storeStrong((id *)&self->_videoFormat, a3);
}

- (NSString)videoFileURL
{
  return self->_videoFileURL;
}

- (void)setVideoFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_videoFileURL, a3);
}

- (NSData)videoSoundCheckData
{
  return self->_videoSoundCheckData;
}

- (void)setVideoSoundCheckData:(id)a3
{
  objc_storeStrong((id *)&self->_videoSoundCheckData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoSoundCheckData, 0);
  objc_storeStrong((id *)&self->_videoFormat, 0);
  objc_storeStrong((id *)&self->_videoFileURL, 0);
}

@end
