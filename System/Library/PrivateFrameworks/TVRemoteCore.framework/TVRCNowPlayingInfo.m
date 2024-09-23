@implementation TVRCNowPlayingInfo

- (id)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v21 = (void *)MEMORY[0x24BDD17C8];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingInfo identifier](self, "identifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingInfo playbackRate](self, "playbackRate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingInfo playbackState](self, "playbackState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingInfo metadata](self, "metadata");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "title");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingInfo metadata](self, "metadata");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "canonicalID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingInfo metadata](self, "metadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "timestamp");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingInfo metadata](self, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeOffset");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingInfo playerIdentifier](self, "playerIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[TVRCNowPlayingInfo imageData](self, "imageData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v17, "length"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingInfo imageDataIsPlaceholder](self, "imageDataIsPlaceholder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  -[TVRCNowPlayingInfo rawTimedMetadata](self, "rawTimedMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingInfo expectsTimedMetadata](self, "expectsTimedMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingInfo captionsEnabled](self, "captionsEnabled");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRCNowPlayingInfo hasValidCaptionOptions](self, "hasValidCaptionOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@ %p: identifier=%@; playbackRate=%@; playbackState=%@; metadata.title=%@; metadata.canonicalID=%@; timestamp=%@; timeOffset=%@; playerIdentifier=%@; imageData.length=%@; imageDataIsPlaceholder=%@; rawTimedMetadata.length=%@, expectsTimedMetadata=%@, captionsEnabled=%@, hasValidCaptionOptions=%@"),
    v20,
    self,
    v28,
    v29,
    v18,
    v27,
    v16,
    v26,
    v14,
    v15,
    v13,
    v5,
    v8,
    v9,
    v10,
    v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (BOOL)isEqualToNowPlayingInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  char v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  int v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  char v92;

  v4 = a3;
  if (!v4)
    goto LABEL_36;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_36;
  -[TVRCNowPlayingInfo identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (v5 == 0) ^ (v6 == 0);

  if ((v7 & 1) != 0)
    goto LABEL_36;
  -[TVRCNowPlayingInfo playbackRate](self, "playbackRate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackRate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (v8 == 0) ^ (v9 == 0);

  if ((v10 & 1) != 0)
    goto LABEL_36;
  -[TVRCNowPlayingInfo playbackState](self, "playbackState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playbackState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (v11 == 0) ^ (v12 == 0);

  if ((v13 & 1) != 0)
    goto LABEL_36;
  -[TVRCNowPlayingInfo playerIdentifier](self, "playerIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (v14 == 0) ^ (v15 == 0);

  if ((v16 & 1) != 0)
    goto LABEL_36;
  -[TVRCNowPlayingInfo metadata](self, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (v17 == 0) ^ (v18 == 0);

  if ((v19 & 1) != 0)
    goto LABEL_36;
  -[TVRCNowPlayingInfo imageData](self, "imageData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (v20 == 0) ^ (v21 == 0);

  if ((v22 & 1) != 0)
    goto LABEL_36;
  -[TVRCNowPlayingInfo imageDataIsPlaceholder](self, "imageDataIsPlaceholder");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageDataIsPlaceholder");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (v23 == 0) ^ (v24 == 0);

  if ((v25 & 1) != 0)
    goto LABEL_36;
  -[TVRCNowPlayingInfo rawTimedMetadata](self, "rawTimedMetadata");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawTimedMetadata");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (v26 == 0) ^ (v27 == 0);

  if ((v28 & 1) != 0)
    goto LABEL_36;
  -[TVRCNowPlayingInfo expectsTimedMetadata](self, "expectsTimedMetadata");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expectsTimedMetadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (v29 == 0) ^ (v30 == 0);

  if ((v31 & 1) != 0)
    goto LABEL_36;
  -[TVRCNowPlayingInfo captionsEnabled](self, "captionsEnabled");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captionsEnabled");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (v32 == 0) ^ (v33 == 0);

  if ((v34 & 1) != 0)
    goto LABEL_36;
  -[TVRCNowPlayingInfo hasValidCaptionOptions](self, "hasValidCaptionOptions");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hasValidCaptionOptions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (v35 == 0) ^ (v36 == 0);

  if ((v37 & 1) != 0)
    goto LABEL_36;
  -[TVRCNowPlayingInfo identifier](self, "identifier");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[TVRCNowPlayingInfo identifier](self, "identifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqualToString:", v41);

    if (!v42)
      goto LABEL_36;
  }
  -[TVRCNowPlayingInfo playbackRate](self, "playbackRate");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[TVRCNowPlayingInfo playbackRate](self, "playbackRate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playbackRate");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqualToNumber:", v46);

    if (!v47)
      goto LABEL_36;
  }
  -[TVRCNowPlayingInfo playbackState](self, "playbackState");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[TVRCNowPlayingInfo playbackState](self, "playbackState");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playbackState");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqualToNumber:", v51);

    if (!v52)
      goto LABEL_36;
  }
  -[TVRCNowPlayingInfo playerIdentifier](self, "playerIdentifier");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[TVRCNowPlayingInfo playerIdentifier](self, "playerIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playerIdentifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqualToString:", v56);

    if (!v57)
      goto LABEL_36;
  }
  -[TVRCNowPlayingInfo imageDataIsPlaceholder](self, "imageDataIsPlaceholder");
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[TVRCNowPlayingInfo imageDataIsPlaceholder](self, "imageDataIsPlaceholder");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageDataIsPlaceholder");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqualToNumber:", v61);

    if (!v62)
      goto LABEL_36;
  }
  -[TVRCNowPlayingInfo imageData](self, "imageData");
  v63 = objc_claimAutoreleasedReturnValue();
  if (v63)
  {
    v64 = (void *)v63;
    -[TVRCNowPlayingInfo imageData](self, "imageData");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageData");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v65, "isEqualToData:", v66);

    if (!v67)
      goto LABEL_36;
  }
  -[TVRCNowPlayingInfo metadata](self, "metadata");
  v68 = objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    v69 = (void *)v68;
    -[TVRCNowPlayingInfo metadata](self, "metadata");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metadata");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v70, "isEqualToNowPlayingMetadata:", v71);

    if (!v72)
      goto LABEL_36;
  }
  -[TVRCNowPlayingInfo rawTimedMetadata](self, "rawTimedMetadata");
  v73 = objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = (void *)v73;
    -[TVRCNowPlayingInfo rawTimedMetadata](self, "rawTimedMetadata");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rawTimedMetadata");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend(v75, "isEqualToData:", v76);

    if (!v77)
      goto LABEL_36;
  }
  -[TVRCNowPlayingInfo expectsTimedMetadata](self, "expectsTimedMetadata");
  v78 = objc_claimAutoreleasedReturnValue();
  if (v78)
  {
    v79 = (void *)v78;
    -[TVRCNowPlayingInfo expectsTimedMetadata](self, "expectsTimedMetadata");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expectsTimedMetadata");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v80, "isEqualToNumber:", v81);

    if (!v82)
      goto LABEL_36;
  }
  -[TVRCNowPlayingInfo captionsEnabled](self, "captionsEnabled");
  v83 = objc_claimAutoreleasedReturnValue();
  if (!v83)
    goto LABEL_34;
  v84 = (void *)v83;
  -[TVRCNowPlayingInfo captionsEnabled](self, "captionsEnabled");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captionsEnabled");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend(v85, "isEqualToNumber:", v86);

  if (!v87)
  {
LABEL_36:
    v92 = 0;
  }
  else
  {
LABEL_34:
    -[TVRCNowPlayingInfo hasValidCaptionOptions](self, "hasValidCaptionOptions");
    v88 = objc_claimAutoreleasedReturnValue();
    if (v88)
    {
      v89 = (void *)v88;
      -[TVRCNowPlayingInfo hasValidCaptionOptions](self, "hasValidCaptionOptions");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "hasValidCaptionOptions");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(v90, "isEqualToNumber:", v91);

    }
    else
    {
      v92 = 1;
    }
  }

  return v92;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TVRCNowPlayingInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = objc_alloc_init(TVRCNowPlayingInfo);
  v5 = (void *)-[NSString copy](self->_identifier, "copy");
  -[TVRCNowPlayingInfo setIdentifier:](v4, "setIdentifier:", v5);

  v6 = (void *)-[NSNumber copy](self->_playbackRate, "copy");
  -[TVRCNowPlayingInfo setPlaybackRate:](v4, "setPlaybackRate:", v6);

  v7 = (void *)-[NSNumber copy](self->_playbackState, "copy");
  -[TVRCNowPlayingInfo setPlaybackState:](v4, "setPlaybackState:", v7);

  v8 = (void *)-[NSString copy](self->_playerIdentifier, "copy");
  -[TVRCNowPlayingInfo setPlayerIdentifier:](v4, "setPlayerIdentifier:", v8);

  v9 = (void *)-[TVRCNowPlayingMetadata copy](self->_metadata, "copy");
  -[TVRCNowPlayingInfo setMetadata:](v4, "setMetadata:", v9);

  -[TVRCNowPlayingInfo setImageData:](v4, "setImageData:", self->_imageData);
  v10 = (void *)-[NSNumber copy](self->_imageDataIsPlaceholder, "copy");
  -[TVRCNowPlayingInfo setImageDataIsPlaceholder:](v4, "setImageDataIsPlaceholder:", v10);

  -[TVRCNowPlayingInfo setRawTimedMetadata:](v4, "setRawTimedMetadata:", self->_rawTimedMetadata);
  -[TVRCNowPlayingInfo setExpectsTimedMetadata:](v4, "setExpectsTimedMetadata:", self->_expectsTimedMetadata);
  v11 = (void *)-[NSNumber copy](self->_captionsEnabled, "copy");
  -[TVRCNowPlayingInfo setCaptionsEnabled:](v4, "setCaptionsEnabled:", v11);

  v12 = (void *)-[NSNumber copy](self->_hasValidCaptionOptions, "copy");
  -[TVRCNowPlayingInfo setHasValidCaptionOptions:](v4, "setHasValidCaptionOptions:", v12);

  return v4;
}

- (id)nowPlayingInfoMergedWithNowPlayingInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  v5 = (void *)-[TVRCNowPlayingInfo copy](self, "copy");
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", v7);

  }
  objc_msgSend(v4, "playbackRate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "playbackRate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaybackRate:", v9);

  }
  objc_msgSend(v4, "playbackState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "playbackState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaybackState:", v11);

  }
  objc_msgSend(v4, "playerIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v4, "playerIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlayerIdentifier:", v13);

  }
  objc_msgSend(v4, "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v4, "metadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMetadata:", v15);

  }
  objc_msgSend(v4, "imageData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v4, "imageData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageData:", v17);

  }
  objc_msgSend(v4, "imageDataIsPlaceholder");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v4, "imageDataIsPlaceholder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageDataIsPlaceholder:", v19);

  }
  objc_msgSend(v4, "rawTimedMetadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v4, "rawTimedMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRawTimedMetadata:", v21);

  }
  objc_msgSend(v4, "expectsTimedMetadata");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v4, "expectsTimedMetadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExpectsTimedMetadata:", v23);

  }
  objc_msgSend(v4, "captionsEnabled");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v4, "captionsEnabled");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCaptionsEnabled:", v25);

  }
  objc_msgSend(v4, "hasValidCaptionOptions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v4, "hasValidCaptionOptions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHasValidCaptionOptions:", v27);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCNowPlayingInfo)initWithCoder:(id)a3
{
  id v4;
  TVRCNowPlayingInfo *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSNumber *playbackRate;
  uint64_t v10;
  NSNumber *playbackState;
  uint64_t v12;
  NSString *playerIdentifier;
  uint64_t v14;
  TVRCNowPlayingMetadata *metadata;
  uint64_t v16;
  NSData *imageData;
  uint64_t v18;
  NSNumber *imageDataIsPlaceholder;
  uint64_t v20;
  NSData *rawTimedMetadata;
  uint64_t v22;
  NSNumber *expectsTimedMetadata;
  uint64_t v24;
  NSNumber *captionsEnabled;
  uint64_t v26;
  NSNumber *hasValidCaptionOptions;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TVRCNowPlayingInfo;
  v5 = -[TVRCNowPlayingInfo init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playbackRate"));
    v8 = objc_claimAutoreleasedReturnValue();
    playbackRate = v5->_playbackRate;
    v5->_playbackRate = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playbackState"));
    v10 = objc_claimAutoreleasedReturnValue();
    playbackState = v5->_playbackState;
    v5->_playbackState = (NSNumber *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playerIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    playerIdentifier = v5->_playerIdentifier;
    v5->_playerIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
    v14 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (TVRCNowPlayingMetadata *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageData"));
    v16 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageDataIsPlaceholder"));
    v18 = objc_claimAutoreleasedReturnValue();
    imageDataIsPlaceholder = v5->_imageDataIsPlaceholder;
    v5->_imageDataIsPlaceholder = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawTimedMetadata"));
    v20 = objc_claimAutoreleasedReturnValue();
    rawTimedMetadata = v5->_rawTimedMetadata;
    v5->_rawTimedMetadata = (NSData *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expectsTimedMetadata"));
    v22 = objc_claimAutoreleasedReturnValue();
    expectsTimedMetadata = v5->_expectsTimedMetadata;
    v5->_expectsTimedMetadata = (NSNumber *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("captionsEnabled"));
    v24 = objc_claimAutoreleasedReturnValue();
    captionsEnabled = v5->_captionsEnabled;
    v5->_captionsEnabled = (NSNumber *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hasValidCaptionOptions"));
    v26 = objc_claimAutoreleasedReturnValue();
    hasValidCaptionOptions = v5->_hasValidCaptionOptions;
    v5->_hasValidCaptionOptions = (NSNumber *)v26;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playbackRate, CFSTR("playbackRate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playbackState, CFSTR("playbackState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_playerIdentifier, CFSTR("playerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageData, CFSTR("imageData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageDataIsPlaceholder, CFSTR("imageDataIsPlaceholder"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawTimedMetadata, CFSTR("rawTimedMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expectsTimedMetadata, CFSTR("expectsTimedMetadata"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_captionsEnabled, CFSTR("captionsEnabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hasValidCaptionOptions, CFSTR("hasValidCaptionOptions"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSNumber)playbackRate
{
  return self->_playbackRate;
}

- (void)setPlaybackRate:(id)a3
{
  objc_storeStrong((id *)&self->_playbackRate, a3);
}

- (NSNumber)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(id)a3
{
  objc_storeStrong((id *)&self->_playbackState, a3);
}

- (NSString)playerIdentifier
{
  return self->_playerIdentifier;
}

- (void)setPlayerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_playerIdentifier, a3);
}

- (TVRCNowPlayingMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSData)rawTimedMetadata
{
  return self->_rawTimedMetadata;
}

- (void)setRawTimedMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_rawTimedMetadata, a3);
}

- (NSNumber)expectsTimedMetadata
{
  return self->_expectsTimedMetadata;
}

- (void)setExpectsTimedMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_expectsTimedMetadata, a3);
}

- (NSNumber)captionsEnabled
{
  return self->_captionsEnabled;
}

- (void)setCaptionsEnabled:(id)a3
{
  objc_storeStrong((id *)&self->_captionsEnabled, a3);
}

- (NSNumber)hasValidCaptionOptions
{
  return self->_hasValidCaptionOptions;
}

- (void)setHasValidCaptionOptions:(id)a3
{
  objc_storeStrong((id *)&self->_hasValidCaptionOptions, a3);
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (NSNumber)imageDataIsPlaceholder
{
  return self->_imageDataIsPlaceholder;
}

- (void)setImageDataIsPlaceholder:(id)a3
{
  objc_storeStrong((id *)&self->_imageDataIsPlaceholder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDataIsPlaceholder, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_hasValidCaptionOptions, 0);
  objc_storeStrong((id *)&self->_captionsEnabled, 0);
  objc_storeStrong((id *)&self->_expectsTimedMetadata, 0);
  objc_storeStrong((id *)&self->_rawTimedMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_playerIdentifier, 0);
  objc_storeStrong((id *)&self->_playbackState, 0);
  objc_storeStrong((id *)&self->_playbackRate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
