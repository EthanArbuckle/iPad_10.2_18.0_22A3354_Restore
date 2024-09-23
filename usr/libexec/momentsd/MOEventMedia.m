@implementation MOEventMedia

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *mediaTitle;
  id v5;

  mediaTitle = self->_mediaTitle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mediaTitle, CFSTR("mediaTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaAlbum, CFSTR("mediaAlbum"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaPlayerBundleId, CFSTR("mediaPlayerBundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaProductId, CFSTR("mediaProductId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaGenre, CFSTR("mediaGenre"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaType, CFSTR("mediaType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaArtist, CFSTR("mediaArtist"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaRepetitions, CFSTR("mediaRepetitions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaSumTimePlayed, CFSTR("mediaSumTimePlayed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaPlaySessions, CFSTR("mediaPlaySessions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mediaFirstPartyTimePlayedRatio, CFSTR("firstPartyTimePlayedRatio"));

}

- (MOEventMedia)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  MOEventMedia *v6;
  id v7;
  uint64_t v8;
  NSString *mediaTitle;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSString *mediaAlbum;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NSString *mediaPlayerBundleId;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSString *mediaProductId;
  uint64_t v22;
  id v23;
  uint64_t v24;
  NSString *mediaGenre;
  uint64_t v26;
  id v27;
  uint64_t v28;
  NSString *mediaType;
  uint64_t v30;
  id v31;
  uint64_t v32;
  NSString *mediaArtist;
  uint64_t v34;
  id v35;
  uint64_t v36;
  NSNumber *mediaRepetitions;
  uint64_t v38;
  id v39;
  uint64_t v40;
  NSNumber *mediaSumTimePlayed;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  NSArray *mediaPlaySessions;
  uint64_t v54;
  id v55;
  uint64_t v56;
  NSNumber *mediaFirstPartyTimePlayedRatio;
  objc_super v59;

  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)MOEventMedia;
  v6 = -[MOEventMedia init](&v59, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("mediaTitle"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    mediaTitle = v6->_mediaTitle;
    v6->_mediaTitle = (NSString *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("mediaAlbum"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    mediaAlbum = v6->_mediaAlbum;
    v6->_mediaAlbum = (NSString *)v12;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v14), CFSTR("mediaPlayerBundleId"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    mediaPlayerBundleId = v6->_mediaPlayerBundleId;
    v6->_mediaPlayerBundleId = (NSString *)v16;

    v19 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v18), CFSTR("mediaProductId"));
    v20 = objc_claimAutoreleasedReturnValue(v19);
    mediaProductId = v6->_mediaProductId;
    v6->_mediaProductId = (NSString *)v20;

    v23 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v22), CFSTR("mediaGenre"));
    v24 = objc_claimAutoreleasedReturnValue(v23);
    mediaGenre = v6->_mediaGenre;
    v6->_mediaGenre = (NSString *)v24;

    v27 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v26), CFSTR("mediaType"));
    v28 = objc_claimAutoreleasedReturnValue(v27);
    mediaType = v6->_mediaType;
    v6->_mediaType = (NSString *)v28;

    v31 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v30), CFSTR("mediaArtist"));
    v32 = objc_claimAutoreleasedReturnValue(v31);
    mediaArtist = v6->_mediaArtist;
    v6->_mediaArtist = (NSString *)v32;

    v35 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v34), CFSTR("mediaRepetitions"));
    v36 = objc_claimAutoreleasedReturnValue(v35);
    mediaRepetitions = v6->_mediaRepetitions;
    v6->_mediaRepetitions = (NSNumber *)v36;

    v39 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v38), CFSTR("mediaSumTimePlayed"));
    v40 = objc_claimAutoreleasedReturnValue(v39);
    mediaSumTimePlayed = v6->_mediaSumTimePlayed;
    v6->_mediaSumTimePlayed = (NSNumber *)v40;

    v42 = objc_autoreleasePoolPush();
    v43 = objc_alloc((Class)NSSet);
    v45 = objc_opt_class(NSArray, v44);
    v47 = objc_opt_class(MOMediaPlaySession, v46);
    v49 = objc_opt_class(NSString, v48);
    v51 = objc_msgSend(v43, "initWithObjects:", v45, v47, v49, objc_opt_class(NSDate, v50), 0);
    objc_autoreleasePoolPop(v42);
    v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v51, CFSTR("mediaPlaySessions")));
    mediaPlaySessions = v6->_mediaPlaySessions;
    v6->_mediaPlaySessions = (NSArray *)v52;

    v55 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v54), CFSTR("firstPartyTimePlayedRatio"));
    v56 = objc_claimAutoreleasedReturnValue(v55);
    mediaFirstPartyTimePlayedRatio = v6->_mediaFirstPartyTimePlayedRatio;
    v6->_mediaFirstPartyTimePlayedRatio = (NSNumber *)v56;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventMedia *v4;

  v4 = objc_alloc_init(MOEventMedia);
  objc_storeStrong((id *)&v4->_mediaType, self->_mediaType);
  objc_storeStrong((id *)&v4->_mediaAlbum, self->_mediaAlbum);
  objc_storeStrong((id *)&v4->_mediaArtist, self->_mediaArtist);
  objc_storeStrong((id *)&v4->_mediaPlayerBundleId, self->_mediaPlayerBundleId);
  objc_storeStrong((id *)&v4->_mediaProductId, self->_mediaProductId);
  objc_storeStrong((id *)&v4->_mediaGenre, self->_mediaGenre);
  objc_storeStrong((id *)&v4->_mediaRepetitions, self->_mediaRepetitions);
  objc_storeStrong((id *)&v4->_mediaSumTimePlayed, self->_mediaSumTimePlayed);
  objc_storeStrong((id *)&v4->_mediaPlaySessions, self->_mediaPlaySessions);
  objc_storeStrong((id *)&v4->_mediaTitle, self->_mediaTitle);
  objc_storeStrong((id *)&v4->_mediaFirstPartyTimePlayedRatio, self->_mediaFirstPartyTimePlayedRatio);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc((Class)NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSString mask](self->_mediaTitle, "mask"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString mask](self->_mediaAlbum, "mask"));
  v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("mediaTitle, %@, mediaAlbum, %@, mediaPlayerBundleId, %@, mediaProductId, %@, mediaType, %@, mediaRepetitions, %@, mediaSumTimePlayed, %@, number of media play events, %lu"), v4, v5, self->_mediaPlayerBundleId, self->_mediaProductId, self->_mediaType, self->_mediaRepetitions, self->_mediaSumTimePlayed, -[NSArray count](self->_mediaPlaySessions, "count"));

  return v6;
}

- (NSString)mediaTitle
{
  return self->_mediaTitle;
}

- (void)setMediaTitle:(id)a3
{
  objc_storeStrong((id *)&self->_mediaTitle, a3);
}

- (NSString)mediaAlbum
{
  return self->_mediaAlbum;
}

- (void)setMediaAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_mediaAlbum, a3);
}

- (NSString)mediaPlayerBundleId
{
  return self->_mediaPlayerBundleId;
}

- (void)setMediaPlayerBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPlayerBundleId, a3);
}

- (NSString)mediaProductId
{
  return self->_mediaProductId;
}

- (void)setMediaProductId:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProductId, a3);
}

- (NSString)mediaGenre
{
  return self->_mediaGenre;
}

- (void)setMediaGenre:(id)a3
{
  objc_storeStrong((id *)&self->_mediaGenre, a3);
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
  objc_storeStrong((id *)&self->_mediaType, a3);
}

- (NSString)mediaArtist
{
  return self->_mediaArtist;
}

- (void)setMediaArtist:(id)a3
{
  objc_storeStrong((id *)&self->_mediaArtist, a3);
}

- (NSNumber)mediaRepetitions
{
  return self->_mediaRepetitions;
}

- (void)setMediaRepetitions:(id)a3
{
  objc_storeStrong((id *)&self->_mediaRepetitions, a3);
}

- (NSNumber)mediaSumTimePlayed
{
  return self->_mediaSumTimePlayed;
}

- (void)setMediaSumTimePlayed:(id)a3
{
  objc_storeStrong((id *)&self->_mediaSumTimePlayed, a3);
}

- (NSArray)mediaPlaySessions
{
  return self->_mediaPlaySessions;
}

- (void)setMediaPlaySessions:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPlaySessions, a3);
}

- (NSNumber)mediaFirstPartyTimePlayedRatio
{
  return self->_mediaFirstPartyTimePlayedRatio;
}

- (void)setMediaFirstPartyTimePlayedRatio:(id)a3
{
  objc_storeStrong((id *)&self->_mediaFirstPartyTimePlayedRatio, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaFirstPartyTimePlayedRatio, 0);
  objc_storeStrong((id *)&self->_mediaPlaySessions, 0);
  objc_storeStrong((id *)&self->_mediaSumTimePlayed, 0);
  objc_storeStrong((id *)&self->_mediaRepetitions, 0);
  objc_storeStrong((id *)&self->_mediaArtist, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
  objc_storeStrong((id *)&self->_mediaGenre, 0);
  objc_storeStrong((id *)&self->_mediaProductId, 0);
  objc_storeStrong((id *)&self->_mediaPlayerBundleId, 0);
  objc_storeStrong((id *)&self->_mediaAlbum, 0);
  objc_storeStrong((id *)&self->_mediaTitle, 0);
}

@end
