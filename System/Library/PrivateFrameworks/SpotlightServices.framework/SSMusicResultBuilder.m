@implementation SSMusicResultBuilder

+ (id)stringWithAlbum:(id)a3 releaseDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v7, "addObject:", v5);
  if (v6)
  {
    +[SSDateFormatManager calendar](SSDateFormatManager, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "component:fromDate:", 4, v6);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

  }
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" · "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)bundleId
{
  return CFSTR("com.apple.Music");
}

+ (BOOL)supportsResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___SSMusicResultBuilder;
    v7 = objc_msgSendSuper2(&v9, sel_supportsResult_, v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

- (SSMusicResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSMusicResultBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SSMusicResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v14, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA5F80], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMusicResultBuilder setAlbum:](v5, "setAlbum:", v6);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA5FF0], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMusicResultBuilder setArtist:](v5, "setArtist:", v7);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6978], objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMusicResultBuilder setMediaId:](v5, "setMediaId:", v8);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA61A8], objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMusicResultBuilder setSongLengthInSeconds:](v5, "setSongLengthInSeconds:", v9);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60D0], objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMusicResultBuilder setCreationDate:](v5, "setCreationDate:", v10);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6158], objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMusicResultBuilder setSong:](v5, "setSong:", v11);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60E8], objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMusicResultBuilder setIsExplicit:](v5, "setIsExplicit:", objc_msgSend(v12, "BOOLValue"));

  }
  return v5;
}

- (id)buildResult
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSMusicResultBuilder;
  -[SSResultBuilder buildResult](&v6, sel_buildResult);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSMusicResultBuilder mediaId](self, "mediaId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIdentifier:", v4);

  return v3;
}

- (id)buildCompactCardSection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSMusicResultBuilder;
  -[SSResultBuilder buildCompactCardSection](&v8, sel_buildCompactCardSection);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "footnote");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "descriptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "footnote");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDescriptions:", v6);

  }
  objc_msgSend(v2, "setFootnote:", 0);
  return v2;
}

- (id)buildTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  -[SSMusicResultBuilder song](self, "song");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D8C3D0];
    -[SSMusicResultBuilder song](self, "song");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  if (-[SSMusicResultBuilder isExplicit](self, "isExplicit"))
  {
    objc_msgSend(v3, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIsEmphasized:", 1);

    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "setSymbolName:", CFSTR("e.square.fill"));
    objc_msgSend(v10, "setIsTemplate:", 1);
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setGlyph:", v10);
    objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", CFSTR(" "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

    objc_msgSend(v3, "addObject:", v11);
  }
  v13 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v4, "setFormattedTextPieces:", v13);

  return v4;
}

- (id)buildDescriptions
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v3 = SSSnippetModernizationEnabled();
  v4 = (void *)objc_opt_new();
  if (!v3)
  {
    -[SSMusicResultBuilder artist](self, "artist");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "length");

    if (v27)
    {
      v28 = (void *)MEMORY[0x1E0D8C660];
      -[SSMusicResultBuilder artist](self, "artist");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "textWithString:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v30);

    }
    -[SSMusicResultBuilder album](self, "album");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "length"))
    {

    }
    else
    {
      -[SSMusicResultBuilder creationDate](self, "creationDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v32)
      {
LABEL_16:
        v25 = (void *)objc_msgSend(v4, "copy");
        goto LABEL_17;
      }
    }
    v33 = (void *)MEMORY[0x1E0D8C660];
    v34 = (void *)objc_opt_class();
    -[SSMusicResultBuilder album](self, "album");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSMusicResultBuilder creationDate](self, "creationDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithAlbum:releaseDate:", v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "textWithString:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v38);

    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSResultBuilder result](self, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC598], "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
    v9 = CFSTR("PLAYLIST");
  else
    v9 = CFSTR("SONG");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v9, &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  -[SSMusicResultBuilder artist](self, "artist");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    -[SSMusicResultBuilder artist](self, "artist");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v13);

  }
  -[SSMusicResultBuilder songLengthInSeconds](self, "songLengthInSeconds");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SSMusicResultBuilder songLengthInSeconds](self, "songLengthInSeconds");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    +[SSDateFormatManager stringFromTimeInterval:](SSDateFormatManager, "stringFromTimeInterval:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

  }
  v17 = (void *)objc_opt_new();
  objc_msgSend(v17, "setSymbolName:", CFSTR("music.square.stack.fill"));
  objc_msgSend(v17, "setIsTemplate:", 1);
  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "setGlyph:", v17);
  v19 = (void *)objc_opt_new();
  v41[0] = v18;
  v20 = (void *)MEMORY[0x1E0D8C3D0];
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" · "));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR(" "), "stringByAppendingString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "textWithString:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFormattedTextPieces:", v24);

  v40 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v25;
}

- (id)buildFootnote
{
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SSMusicResultBuilder songLengthInSeconds](self, "songLengthInSeconds");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3 && (v4 = (void *)v3, v5 = SSSnippetModernizationEnabled(), v4, (v5 & 1) == 0))
  {
    v7 = (void *)MEMORY[0x1E0D8C660];
    -[SSMusicResultBuilder songLengthInSeconds](self, "songLengthInSeconds");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    +[SSDateFormatManager stringFromTimeInterval:](SSDateFormatManager, "stringFromTimeInterval:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textWithString:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (unint64_t)numberOfLinesForDescriptions
{
  return 1;
}

- (id)buildThumbnail
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[SSMusicResultBuilder mediaId](self, "mediaId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSpotlightIdentifier:", v4);

  return v3;
}

- (id)buildButtonItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[SSMusicResultBuilder mediaId](self, "mediaId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = (void *)objc_opt_new();
  -[SSMusicResultBuilder mediaId](self, "mediaId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMediaIdentifier:", v5);

  v6 = (void *)*MEMORY[0x1E0CEC598];
  -[SSResultBuilder uniformType](self, "uniformType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "conformsToType:", v7);

  if ((_DWORD)v6)
    v8 = 5;
  else
    v8 = 1;
  objc_msgSend(v4, "setMediaType:", v8);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setMediaMetadata:", v4);
  v12[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)buildButtonItemsAreTrailing
{
  return 1;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSString)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_album, a3);
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setArtist:(id)a3
{
  objc_storeStrong((id *)&self->_artist, a3);
}

- (NSString)mediaId
{
  return self->_mediaId;
}

- (void)setMediaId:(id)a3
{
  objc_storeStrong((id *)&self->_mediaId, a3);
}

- (NSString)song
{
  return self->_song;
}

- (void)setSong:(id)a3
{
  objc_storeStrong((id *)&self->_song, a3);
}

- (NSNumber)songLengthInSeconds
{
  return self->_songLengthInSeconds;
}

- (void)setSongLengthInSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_songLengthInSeconds, a3);
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (void)setIsExplicit:(BOOL)a3
{
  self->_isExplicit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_songLengthInSeconds, 0);
  objc_storeStrong((id *)&self->_song, 0);
  objc_storeStrong((id *)&self->_mediaId, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
