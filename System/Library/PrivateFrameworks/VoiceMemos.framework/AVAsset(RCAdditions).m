@implementation AVAsset(RCAdditions)

- (void)rc_setComposedAVURL:()RCAdditions
{
  objc_setAssociatedObject(a1, "_AVAssetRCComposedAVURLKey", a3, (void *)0x301);
}

- (id)rc_composedAVURL
{
  void *v2;

  objc_getAssociatedObject(a1, "_AVAssetRCComposedAVURLKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a1, "URL");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

- (id)rc_audioTrack
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)rc_recordingMetadata
{
  void *v2;
  void *v3;
  uint64_t v4;
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

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C8AA00];
  firstStringValue((uint64_t)v3, (uint64_t)CFSTR("com.apple.iTunes.voice-memo-uuid"), *MEMORY[0x1E0C8AA00]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("uniqueID"));
  objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v3, *MEMORY[0x1E0C8A890], *MEMORY[0x1E0C8A9D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_map:", &__block_literal_global_63);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("date"));
  firstStringValue((uint64_t)v3, *MEMORY[0x1E0C8AB18], *MEMORY[0x1E0C8A9F8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "length"))
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("title"));
  firstStringValue((uint64_t)v3, (uint64_t)CFSTR("com.apple.iTunes.music-memo-note"), v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("musicMemoTextNote"));
  objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v3, CFSTR("com.apple.iTunes.music-memo-rating"), v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "na_map:", &__block_literal_global_65);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("musicMemoStarRating"));
  firstStringValue((uint64_t)v3, (uint64_t)CFSTR("com.apple.iTunes.music-memo-tags"), v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, CFSTR("musicMemoTags"));

  return v2;
}

+ (uint64_t)rc_updateMetadataInFile:()RCAdditions withRecordingMetadata:error:
{
  id v8;
  void *v9;
  uint64_t v10;

  v8 = a3;
  +[RCCaptureFormat AVAssetAuthoringMetadataWithRecordingMetadata:](RCCaptureFormat, "AVAssetAuthoringMetadataWithRecordingMetadata:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "rc_updateMetadataInFile:withMetadata:error:", v8, v9, a5);

  return v10;
}

+ (uint64_t)rc_updateMetadataInFile:()RCAdditions withMetadata:error:
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  v7 = (void *)MEMORY[0x1E0C8B280];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "movieWithURL:options:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMetadata:", v8);

  v11 = objc_msgSend(v10, "writeMovieHeaderToURL:fileType:options:error:", v9, *MEMORY[0x1E0C8A2A8], 0, a5);
  return v11;
}

+ (uint64_t)rc_updateFile:()RCAdditions withTranscriptionData:error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  objc_class *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C8B280], "movieWithURL:options:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v30 = v9;
    v31 = v8;
    v32 = v7;
    objc_msgSend(v11, "metadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    if (objc_msgSend(v13, "count"))
    {
      v14 = 0;
      v15 = 0;
      v16 = *MEMORY[0x1E0C8A9E0];
      while (1)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "keySpace");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v18, "isEqual:", v16) & 1) == 0)
          break;
        objc_msgSend(v17, "key");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqual:", CFSTR("tsrp"));

        if (!v20)
          goto LABEL_8;
        objc_msgSend(v13, "removeObjectAtIndex:", v14);
LABEL_9:
        v14 = v15;
        if (objc_msgSend(v13, "count") <= (unint64_t)v15)
          goto LABEL_10;
      }

LABEL_8:
      ++v15;
      goto LABEL_9;
    }
LABEL_10:
    v8 = v31;
    if (v31)
    {
      v21 = (objc_class *)MEMORY[0x1E0C8B278];
      v22 = v31;
      v23 = objc_alloc_init(v21);
      objc_msgSend(v23, "setKey:", CFSTR("tsrp"));
      v24 = *MEMORY[0x1E0C8A9E0];
      objc_msgSend(v23, "setKeySpace:", *MEMORY[0x1E0C8A9E0]);
      objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("tsrp"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setIdentifier:", v25);

      objc_msgSend(v23, "setValue:", v22);
      objc_msgSend(v23, "setDataType:", *MEMORY[0x1E0CA2440]);
      objc_msgSend(v13, "addObject:", v23);

    }
    objc_msgSend(v11, "setMetadata:", v13);
    v9 = v30;
    v7 = v32;
    v26 = objc_msgSend(v30, "writeMovieHeaderToURL:fileType:options:error:", v32, *MEMORY[0x1E0C8A2A8], 0, a5);

  }
  else
  {
    if (a5)
    {
      v27 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2D68];
      v34[0] = CFSTR("No audio tracks exist");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.VoiceMemos.ErrorDomain"), -1, v28);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    v26 = 0;
  }

  return v26;
}

- (id)rc_transcriptionData
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v2, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v3, CFSTR("tsrp"), *MEMORY[0x1E0C8A9E0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_map:", &__block_literal_global_68);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)rc_transcriptionDataExists
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0C8B220];
    objc_msgSend(v2, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "metadataItemsFromArray:withKey:keySpace:", v4, CFSTR("tsrp"), *MEMORY[0x1E0C8A9E0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (Float64)rc_durationInSeconds
{
  CMTime time;

  objc_msgSend(a1, "duration");
  return CMTimeGetSeconds(&time);
}

- (uint64_t)rc_audioTracks
{
  return objc_msgSend(a1, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
}

- (id)rc_playbackFormat
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double mSampleRate;
  uint64_t i;
  void *v8;
  unint64_t v9;
  void *v10;
  const AudioStreamBasicDescription *StreamBasicDescription;
  unsigned int mChannelsPerFrame;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "rc_audioTracks", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v16;
    mSampleRate = 0.0;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "formatDescriptions");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          v9 = 0;
          do
          {
            objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription((CMAudioFormatDescriptionRef)v10);
            if (StreamBasicDescription)
            {
              if (mSampleRate < StreamBasicDescription->mSampleRate)
                mSampleRate = StreamBasicDescription->mSampleRate;
              mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
              if (v4 <= mChannelsPerFrame)
                v4 = mChannelsPerFrame;
              else
                v4 = v4;
            }
            ++v9;
          }
          while (objc_msgSend(v8, "count") > v9);
        }

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v3);

    v13 = 0;
    if (mSampleRate != 0.0 && (_DWORD)v4)
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initStandardFormatWithSampleRate:channels:", v4, mSampleRate);
  }
  else
  {

    v13 = 0;
  }
  return v13;
}

@end
