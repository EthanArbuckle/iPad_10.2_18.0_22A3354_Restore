@implementation AVAsset

- (void)rc_setComposedAVURL:(id)a3
{
  objc_setAssociatedObject(self, "_AVAssetRCComposedAVURLKey", a3, (void *)0x301);
}

- (NSURL)rc_composedAVURL
{
  id AssociatedObject;
  void *v4;

  AssociatedObject = objc_getAssociatedObject(self, "_AVAssetRCComposedAVURLKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
  {
    if ((objc_opt_respondsToSelector(self, "URL") & 1) != 0)
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset URL](self, "URL"));
    else
      v4 = 0;
  }
  return (NSURL *)v4;
}

- (AVAssetTrack)rc_audioTrack
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset tracksWithMediaType:](self, "tracksWithMediaType:", AVMediaTypeAudio));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  return (AVAssetTrack *)v3;
}

- (NSDictionary)rc_recordingMetadata
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;

  v3 = (void *)objc_opt_new(NSMutableDictionary, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset metadata](self, "metadata"));
  v5 = AVMetadataKeySpaceiTunesLong;
  v6 = sub_1000020F4((uint64_t)v4, (uint64_t)CFSTR("com.apple.iTunes.voice-memo-uuid"), AVMetadataKeySpaceiTunesLong);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("uniqueID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", v4, AVMetadataCommonKeyCreationDate, AVMetadataKeySpaceCommon));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "na_map:", &stru_100004370));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

  if (v10)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("date"));
  v11 = sub_1000020F4((uint64_t)v4, (uint64_t)AVMetadataiTunesMetadataKeySongName, (uint64_t)AVMetadataKeySpaceiTunes);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v12 && objc_msgSend(v12, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("title"));
  v14 = sub_1000020F4((uint64_t)v4, (uint64_t)CFSTR("com.apple.iTunes.music-memo-note"), v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (v15)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("musicMemoTextNote"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", v4, CFSTR("com.apple.iTunes.music-memo-rating"), v5));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "na_map:", &stru_1000043B0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));

  if (v18)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("musicMemoStarRating"));
  v19 = sub_1000020F4((uint64_t)v4, (uint64_t)CFSTR("com.apple.iTunes.music-memo-tags"), v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if (v20)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("musicMemoTags"));

  return (NSDictionary *)v3;
}

+ (BOOL)rc_updateMetadataInFile:(id)a3 withRecordingMetadata:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RCCaptureFormat AVAssetAuthoringMetadataWithRecordingMetadata:](RCCaptureFormat, "AVAssetAuthoringMetadataWithRecordingMetadata:", a4));
  LOBYTE(a5) = objc_msgSend(a1, "rc_updateMetadataInFile:withMetadata:error:", v8, v9, a5);

  return (char)a5;
}

+ (BOOL)rc_updateMetadataInFile:(id)a3 withMetadata:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableMovie movieWithURL:options:](AVMutableMovie, "movieWithURL:options:", v8, 0));
  objc_msgSend(v9, "setMetadata:", v7);

  LOBYTE(a5) = objc_msgSend(v9, "writeMovieHeaderToURL:fileType:options:error:", v8, AVFileTypeAppleM4A, 0, a5);
  return (char)a5;
}

+ (BOOL)rc_updateFile:(id)a3 withTranscriptionData:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  id v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  void *v25;
  void *v27;
  void *v28;
  id v29;
  NSErrorUserInfoKey v30;
  const __CFString *v31;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableMovie movieWithURL:options:](AVMutableMovie, "movieWithURL:options:", v7, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tracksWithMediaType:", AVMediaTypeAudio));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

  if (v11)
  {
    v27 = v9;
    v28 = v8;
    v29 = v7;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "metadata"));
    v13 = objc_msgSend(v12, "mutableCopy");

    if (objc_msgSend(v13, "count"))
    {
      v14 = 0;
      v15 = 0;
      while (1)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v14));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "keySpace"));
        if ((objc_msgSend(v17, "isEqual:", AVMetadataKeySpaceISOUserData) & 1) == 0)
          break;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "key"));
        v19 = objc_msgSend(v18, "isEqual:", CFSTR("tsrp"));

        if (!v19)
          goto LABEL_8;
        objc_msgSend(v13, "removeObjectAtIndex:", v14);
LABEL_9:
        v14 = v15;
        if ((unint64_t)objc_msgSend(v13, "count") <= v15)
          goto LABEL_10;
      }

LABEL_8:
      ++v15;
      goto LABEL_9;
    }
LABEL_10:
    v8 = v28;
    if (v28)
    {
      v20 = v28;
      v21 = objc_alloc_init((Class)AVMutableMetadataItem);
      objc_msgSend(v21, "setKey:", CFSTR("tsrp"));
      objc_msgSend(v21, "setKeySpace:", AVMetadataKeySpaceISOUserData);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[AVMetadataItem identifierForKey:keySpace:](AVMetadataItem, "identifierForKey:keySpace:", CFSTR("tsrp"), AVMetadataKeySpaceISOUserData));
      objc_msgSend(v21, "setIdentifier:", v22);

      objc_msgSend(v21, "setValue:", v20);
      objc_msgSend(v21, "setDataType:", kCMMetadataBaseDataType_RawData);
      objc_msgSend(v13, "addObject:", v21);

    }
    objc_msgSend(v11, "setMetadata:", v13);
    v9 = v27;
    v7 = v29;
    v23 = objc_msgSend(v27, "writeMovieHeaderToURL:fileType:options:error:", v29, AVFileTypeAppleM4A, 0, a5);

  }
  else
  {
    if (a5)
    {
      v24 = RCVoiceMemosErrorDomain;
      v30 = NSLocalizedFailureReasonErrorKey;
      v31 = CFSTR("No audio tracks exist");
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v24, -1, v25));

    }
    v23 = 0;
  }

  return v23;
}

- (id)rc_transcriptionData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset tracksWithMediaType:](self, "tracksWithMediaType:", AVMediaTypeAudio));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadata"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", v4, CFSTR("tsrp"), AVMetadataKeySpaceISOUserData));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "na_map:", &stru_1000043F0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)rc_transcriptionDataExists
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset tracksWithMediaType:](self, "tracksWithMediaType:", AVMediaTypeAudio));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadata"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVMetadataItem metadataItemsFromArray:withKey:keySpace:](AVMetadataItem, "metadataItemsFromArray:withKey:keySpace:", v4, CFSTR("tsrp"), AVMetadataKeySpaceISOUserData));
    v6 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)rc_durationInSeconds
{
  CMTime time;

  -[AVAsset duration](self, "duration");
  return CMTimeGetSeconds(&time);
}

- (id)rc_audioTracks
{
  return -[AVAsset tracksWithMediaType:](self, "tracksWithMediaType:", AVMediaTypeAudio);
}

- (id)rc_playbackFormat
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  double mSampleRate;
  void *i;
  void *v9;
  unint64_t v10;
  void *v11;
  const AudioStreamBasicDescription *StreamBasicDescription;
  unsigned int mChannelsPerFrame;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset rc_audioTracks](self, "rc_audioTracks", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v17;
    mSampleRate = 0.0;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v2);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "formatDescriptions"));
        if (objc_msgSend(v9, "count"))
        {
          v10 = 0;
          do
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v10));

            StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription((CMAudioFormatDescriptionRef)v11);
            if (StreamBasicDescription)
            {
              if (mSampleRate < StreamBasicDescription->mSampleRate)
                mSampleRate = StreamBasicDescription->mSampleRate;
              mChannelsPerFrame = StreamBasicDescription->mChannelsPerFrame;
              if (v5 <= mChannelsPerFrame)
                v5 = mChannelsPerFrame;
              else
                v5 = v5;
            }
            ++v10;
          }
          while ((unint64_t)objc_msgSend(v9, "count") > v10);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);

    v14 = 0;
    if (mSampleRate != 0.0 && (_DWORD)v5)
      v14 = objc_msgSend(objc_alloc((Class)AVAudioFormat), "initStandardFormatWithSampleRate:channels:", v5, mSampleRate);
  }
  else
  {

    v14 = 0;
  }
  return v14;
}

@end
