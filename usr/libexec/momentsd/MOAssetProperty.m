@implementation MOAssetProperty

- (MOAssetProperty)initWithLocalToPhotoLibraryIdentifier:(id)a3 location:(id)a4 mediaType:(int64_t)a5 mediaSubtypes:(unint64_t)a6 favorite:(BOOL)a7
{
  id v12;
  id v13;
  MOAssetProperty *v14;
  NSString *v15;
  NSString *localToPhotoLibraryIdentifier;
  CLLocation *v17;
  CLLocation *location;
  objc_super v20;

  v12 = a3;
  v13 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MOAssetProperty;
  v14 = -[MOAssetProperty init](&v20, "init");
  if (v14)
  {
    v15 = (NSString *)objc_msgSend(v12, "copy");
    localToPhotoLibraryIdentifier = v14->_localToPhotoLibraryIdentifier;
    v14->_localToPhotoLibraryIdentifier = v15;

    v17 = (CLLocation *)objc_msgSend(v13, "copy");
    location = v14->_location;
    v14->_location = v17;

    v14->_mediaType = a5;
    v14->_mediaSubtypes = a6;
    v14->_favorite = a7;
  }

  return v14;
}

- (id)description
{
  const __CFString *v3;
  NSMutableArray *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  const __CFString *v10;
  void *v11;

  if (-[MOAssetProperty mediaType](self, "mediaType"))
  {
    if ((id)-[MOAssetProperty mediaType](self, "mediaType") == (id)1)
    {
      v3 = CFSTR("image");
    }
    else if ((id)-[MOAssetProperty mediaType](self, "mediaType") == (id)2)
    {
      v3 = CFSTR("video");
    }
    else if ((id)-[MOAssetProperty mediaType](self, "mediaType") == (id)3)
    {
      v3 = CFSTR("audio");
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = CFSTR("unknown");
  }
  if (!-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes"))
  {
    v6 = CFSTR("SubtypeNone");
    goto LABEL_39;
  }
  v4 = objc_opt_new(NSMutableArray);
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 1) != 0)
    -[NSMutableArray addObject:](v4, "addObject:", CFSTR("PhotoPanorama"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 2) != 0)
    -[NSMutableArray addObject:](v4, "addObject:", CFSTR("PhotoHDR"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 4) != 0)
    -[NSMutableArray addObject:](v4, "addObject:", CFSTR("PhotoScreenshot"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 8) != 0)
    -[NSMutableArray addObject:](v4, "addObject:", CFSTR("PhotoLive"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 0x10) != 0)
    -[NSMutableArray addObject:](v4, "addObject:", CFSTR("PhotoDepthEffect"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 0x20) != 0)
    -[NSMutableArray addObject:](v4, "addObject:", CFSTR("SpatialOverCapture"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 0x10000) != 0)
    -[NSMutableArray addObject:](v4, "addObject:", CFSTR("VideoStreamed"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 0x20000) != 0)
    -[NSMutableArray addObject:](v4, "addObject:", CFSTR("VideoHighFrameRate"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 0x40000) != 0)
    -[NSMutableArray addObject:](v4, "addObject:", CFSTR("VideoTimelapse"));
  if ((-[MOAssetProperty mediaSubtypes](self, "mediaSubtypes") & 0x200000) != 0)
    -[NSMutableArray addObject:](v4, "addObject:", CFSTR("VideoCinematic"));
  if ((unint64_t)-[NSMutableArray count](v4, "count") < 2)
  {
    if (-[NSMutableArray count](v4, "count") != (id)1)
    {
      v6 = CFSTR("SubtypeUnknown");
      goto LABEL_38;
    }
    v5 = objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](v4, "firstObject"));
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v4, "componentsJoinedByString:", CFSTR("_")));
  }
  v6 = (__CFString *)v5;
LABEL_38:

LABEL_39:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOAssetProperty localToPhotoLibraryIdentifier](self, "localToPhotoLibraryIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOAssetProperty location](self, "location"));
  v9 = -[MOAssetProperty favorite](self, "favorite");
  v10 = CFSTR("NO");
  if (v9)
    v10 = CFSTR("YES");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MOAssetProperty localToPhotoLibraryIdentifier: %@, location: %@, mediaType: %@, mediaSubtypes: %@, favorite: %@>"), v7, v8, v3, v6, v10));

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localToPhotoLibraryIdentifier;
  void *v5;
  void *v6;
  id v7;

  localToPhotoLibraryIdentifier = self->_localToPhotoLibraryIdentifier;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", localToPhotoLibraryIdentifier, CFSTR("localToPhotoLibraryIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_location, CFSTR("location"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_mediaType));
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("mediaType"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_mediaSubtypes));
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("mediaSubtypes"));

  objc_msgSend(v7, "encodeBool:forKey:", self->_favorite, CFSTR("favorite"));
}

- (MOAssetProperty)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  MOAssetProperty *v20;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("localToPhotoLibraryIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(CLLocation, v8), CFSTR("location"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v11), CFSTR("mediaType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_msgSend(v13, "integerValue");

  v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v15), CFSTR("mediaSubtypes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = objc_msgSend(v17, "unsignedIntegerValue");

  v19 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("favorite"));
  v20 = -[MOAssetProperty initWithLocalToPhotoLibraryIdentifier:location:mediaType:mediaSubtypes:favorite:](self, "initWithLocalToPhotoLibraryIdentifier:location:mediaType:mediaSubtypes:favorite:", v7, v10, v14, v18, v19);

  return v20;
}

- (NSString)localToPhotoLibraryIdentifier
{
  return self->_localToPhotoLibraryIdentifier;
}

- (void)setLocalToPhotoLibraryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localToPhotoLibraryIdentifier, a3);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

- (unint64_t)mediaSubtypes
{
  return self->_mediaSubtypes;
}

- (void)setMediaSubtypes:(unint64_t)a3
{
  self->_mediaSubtypes = a3;
}

- (BOOL)favorite
{
  return self->_favorite;
}

- (void)setFavorite:(BOOL)a3
{
  self->_favorite = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_localToPhotoLibraryIdentifier, 0);
}

@end
