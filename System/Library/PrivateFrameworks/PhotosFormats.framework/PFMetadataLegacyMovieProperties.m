@implementation PFMetadataLegacyMovieProperties

- (PFMetadataLegacyMovieProperties)initWithAVProxyData:(id)a3 timeZoneLookup:(id)a4
{
  id v6;
  id v7;
  PFMetadataLegacyMovieProperties *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v13;
  uint64_t v14;
  id v15;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "length"))
  {
    v16.receiver = self;
    v16.super_class = (Class)PFMetadataLegacyMovieProperties;
    v8 = -[PFMetadata initWithContentType:options:timeZoneLookup:](&v16, sel_initWithContentType_options_timeZoneLookup_, 0, 12, v7);
    if (v8)
    {
      v15 = 0;
      +[PFMetadata propertyListObjectFromEncodedData:expectedClass:options:error:](PFMetadata, "propertyListObjectFromEncodedData:expectedClass:options:error:", v6, objc_opt_class(), 0, &v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v15;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_storeStrong((id *)&v8->_audioVideoProperties, v9);
        -[PFMetadata setSourceType:](v8, "setSourceType:", 8);
      }
      else
      {
        v11 = (void *)metadataLog;
        if (os_log_type_enabled((os_log_t)metadataLog, OS_LOG_TYPE_ERROR))
        {
          v13 = v11;
          v14 = objc_msgSend(v6, "length");
          *(_DWORD *)buf = 134218498;
          v18 = v6;
          v19 = 2048;
          v20 = v14;
          v21 = 2114;
          v22 = v10;
          _os_log_error_impl(&dword_1A16EE000, v13, OS_LOG_TYPE_ERROR, "failed to deserialize a property list object from plist data: %p, length: %lu, error: %{public}@", buf, 0x20u);

        }
        v8 = 0;
      }

    }
  }
  else
  {

    v8 = 0;
  }

  return v8;
}

- (PFMetadataLegacyMovieProperties)initWithMetadataPlist:(id)a3 timeZoneLookup:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  PFMetadataLegacyMovieProperties *v12;

  v6 = a3;
  v7 = PFMetadataPlistContentTypeIdentifier;
  v8 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PFUniformTypeUtilities typeWithIdentifier:](PFUniformTypeUtilities, "typeWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", PFMetadataPlistOptions);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PFMetadata initWithContentType:options:timeZoneLookup:](self, "initWithContentType:options:timeZoneLookup:", v10, (unsigned __int16)objc_msgSend(v11, "integerValue"), v8);

  if (v12 && !-[PFMetadataLegacyMovieProperties configureWithMetadataPlist:](v12, "configureWithMetadataPlist:", v6))
  {

    v12 = 0;
  }

  return v12;
}

- (BOOL)configureWithMetadataPlist:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSDictionary *v6;
  NSDictionary *audioVideoProperties;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFMetadataLegacyMovieProperties;
  v5 = -[PFMetadata configureWithMetadataPlist:](&v9, sel_configureWithMetadataPlist_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", PFMetadataPlistAudioVideoProperties);
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    audioVideoProperties = self->_audioVideoProperties;
    self->_audioVideoProperties = v6;

  }
  return v5;
}

- (BOOL)isMovie
{
  return 1;
}

- (id)cameraMake
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_audioVideoProperties, "objectForKeyedSubscript:", CFSTR("commonMetadata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A8A8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cameraModel
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_audioVideoProperties, "objectForKeyedSubscript:", CFSTR("commonMetadata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A8B0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)software
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_audioVideoProperties, "objectForKeyedSubscript:", CFSTR("commonMetadata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A8B8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)durationTimeInterval
{
  return -[NSDictionary objectForKeyedSubscript:](self->_audioVideoProperties, "objectForKeyedSubscript:", CFSTR("duration"));
}

- (id)nominalFrameRate
{
  void *v2;
  void *v3;

  -[PFMetadataLegacyMovieProperties _firstVideoTrack](self, "_firstVideoTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("nominalFrameRate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)videoDataRate
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__PFMetadataLegacyMovieProperties_videoDataRate__block_invoke;
  v4[3] = &unk_1E45A28F8;
  v4[4] = &v5;
  -[PFMetadataLegacyMovieProperties _enumerateTracksOfType:withBlock:](self, "_enumerateTracksOfType:withBlock:", 1986618469, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6[3] / 1000.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)audioDataRate
{
  void *v2;
  void *v3;

  -[PFMetadataLegacyMovieProperties _firstAudioTrack](self, "_firstAudioTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("estimatedDataRate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)audioSampleRate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PFMetadataLegacyMovieProperties _firstAudioTrack](self, "_firstAudioTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("formatDescriptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioTrackSampleRate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)audioTrackFormat
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PFMetadataLegacyMovieProperties _firstAudioTrack](self, "_firstAudioTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("formatDescriptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioTrackFormat"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)audioTrackFormatFlags
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PFMetadataLegacyMovieProperties _firstAudioTrack](self, "_firstAudioTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("formatDescriptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("audioTrackFormatFlags"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)videoCodecName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PFMetadataLegacyMovieProperties _firstVideoTrack](self, "_firstVideoTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("formatDescriptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("videoTrackFormatName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isSloMo
{
  void *v2;
  double v3;
  float v4;
  BOOL v5;

  -[PFMetadataLegacyMovieProperties nominalFrameRate](self, "nominalFrameRate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  *(float *)&v3 = v3;
  +[PFVideoAdjustments defaultSlowMotionRateForNominalFrameRate:](PFVideoAdjustments, "defaultSlowMotionRateForNominalFrameRate:", v3);
  v5 = v4 < 1.0;

  return v5;
}

- (BOOL)isTimelapse
{
  void *v2;
  char v3;

  -[PFMetadata captureMode](self, "captureMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Time-lapse"));

  return v3;
}

- (id)_makeDateTimeProperties
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKeyedSubscript:](self->_audioVideoProperties, "objectForKeyedSubscript:", CFSTR("commonMetadata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A890]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *MEMORY[0x1E0CBCB50];
    v9 = v3;
    v10 = v4;
    v8 = *MEMORY[0x1E0CBCB40];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_makeGeometryProperties
{
  void *v2;
  const __CFDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  CGSize size;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  -[PFMetadataLegacyMovieProperties _firstVideoTrack](self, "_firstVideoTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("naturalSize"));
  v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  size.width = 0.0;
  size.height = 0.0;
  v4 = 0;
  if (CGSizeMakeWithDictionaryRepresentation(v3, &size))
  {
    v9[0] = *MEMORY[0x1E0CBD048];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", size.width);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v5;
    v9[1] = *MEMORY[0x1E0CBD040];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", size.height);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = *MEMORY[0x1E0CBCFF0];
    v10[1] = v6;
    v10[2] = &unk_1E45CA610;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_firstVideoTrack
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__3588;
  v9 = __Block_byref_object_dispose__3589;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PFMetadataLegacyMovieProperties__firstVideoTrack__block_invoke;
  v4[3] = &unk_1E45A2920;
  v4[4] = &v5;
  -[PFMetadataLegacyMovieProperties _enumerateTracksOfType:withBlock:](self, "_enumerateTracksOfType:withBlock:", 1986618469, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)_firstAudioTrack
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__3588;
  v9 = __Block_byref_object_dispose__3589;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__PFMetadataLegacyMovieProperties__firstAudioTrack__block_invoke;
  v4[3] = &unk_1E45A2920;
  v4[4] = &v5;
  -[PFMetadataLegacyMovieProperties _enumerateTracksOfType:withBlock:](self, "_enumerateTracksOfType:withBlock:", 1936684398, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)_enumerateTracksOfType:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t (**v6)(id, void *);
  id *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, void *))a4;
  v7 = (id *)MEMORY[0x1E0C8A808];
  if (a3 != 1986618469)
    v7 = (id *)MEMORY[0x1E0C8A7A0];
  v8 = *v7;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSDictionary objectForKeyedSubscript:](self->_audioVideoProperties, "objectForKeyedSubscript:", CFSTR("tracks"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("mediaType"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", v8) && (v6[2](v6, v14) & 1) == 0)
        {

          goto LABEL_14;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_14:

}

- (opaqueCMFormatDescription)_formatDescription
{
  void *v2;
  void *v3;
  void *v4;

  -[PFMetadataLegacyMovieProperties _firstVideoTrack](self, "_firstVideoTrack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formatDescriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return (opaqueCMFormatDescription *)v4;
}

- (id)_makeGPSProperties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v8;
  double v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKeyedSubscript:](self->_audioVideoProperties, "objectForKeyedSubscript:", CFSTR("commonMetadata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C8A8A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v8 = 0.0;
    v9 = 0.0;
    v4 = 0;
    if (+[PFMetadataMovie parseISO6709String:outLatitude:outLongitude:](PFMetadataMovie, "parseISO6709String:outLatitude:outLongitude:", v3, &v9, &v8))
    {
      v10[0] = *MEMORY[0x1E0CBCD90];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      v10[1] = *MEMORY[0x1E0CBCDA0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11[1] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)plistForEncoding
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFMetadataLegacyMovieProperties;
  -[PFMetadata plistForEncoding](&v6, sel_plistForEncoding);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_audioVideoProperties, PFMetadataPlistAudioVideoProperties);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFMetadataLegacyMovieProperties;
  v4 = -[PFMetadata copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 22, self->_audioVideoProperties);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSDictionary *audioVideoProperties;
  char v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PFMetadataLegacyMovieProperties;
  if (!-[PFMetadata isEqual:](&v8, sel_isEqual_, v4)
    || (audioVideoProperties = self->_audioVideoProperties, (audioVideoProperties == 0) == (v4[22] != 0)))
  {
    v6 = 0;
  }
  else
  {
    v6 = -[NSDictionary isEqual:](audioVideoProperties, "isEqual:");
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioVideoProperties, 0);
}

uint64_t __51__PFMetadataLegacyMovieProperties__firstAudioTrack__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

uint64_t __51__PFMetadataLegacyMovieProperties__firstVideoTrack__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

uint64_t __48__PFMetadataLegacyMovieProperties_videoDataRate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("estimatedDataRate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);

  return 1;
}

@end
