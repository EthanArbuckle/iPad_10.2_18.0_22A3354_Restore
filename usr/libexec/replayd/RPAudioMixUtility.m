@implementation RPAudioMixUtility

+ (void)mixAudioForMovie:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000205AC;
  v9[3] = &unk_1000816E0;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[RPAudioMixUtility tempFileURL](RPAudioMixUtility, "tempFileURL"));
  v11 = v5;
  v7 = v10;
  v8 = v5;
  +[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:](RPAudioMixUtility, "mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:", v6, v7, AVFileTypeMPEG4, v9);

}

+ (void)mixAudioForMovie:(id)a3 finalMovieURL:(id)a4 outputFileType:(id)a5 withCompletionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  id v43;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v9)
  {
    if (dword_100095B40 <= 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v39 = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]";
        v40 = 1024;
        v41 = 33;
        v42 = 2112;
        v43 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d movieURL  %@", buf, 0x1Cu);
      }
      if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        v39 = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]";
        v40 = 1024;
        v41 = 34;
        v42 = 2112;
        v43 = v10;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d finalMovieURL %@", buf, 0x1Cu);
      }
    }
    v29 = v9;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[AVAsset assetWithURL:](AVAsset, "assetWithURL:", v9));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[RPAudioMixUtility exportPresetForAVAsset:](RPAudioMixUtility, "exportPresetForAVAsset:", v13));
    v14 = objc_msgSend(objc_alloc((Class)AVAssetExportSession), "initWithAsset:presetName:", v13, v26);
    v28 = v10;
    objc_msgSend(v14, "setOutputURL:", v10);
    v27 = v11;
    objc_msgSend(v14, "setOutputFileType:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tracksWithMediaType:", AVMediaTypeAudio));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableAudioMixInputParameters audioMixInputParameters](AVMutableAudioMixInputParameters, "audioMixInputParameters"));
          objc_msgSend(v23, "setTrackID:", objc_msgSend(v22, "trackID"));
          objc_msgSend(v16, "addObject:", v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v19);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableAudioMix audioMix](AVMutableAudioMix, "audioMix"));
    objc_msgSend(v24, "setInputParameters:", v16);
    objc_msgSend(v14, "setAudioMix:", v24);
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v39 = "+[RPAudioMixUtility mixAudioForMovie:finalMovieURL:outputFileType:withCompletionHandler:]";
      v40 = 1024;
      v41 = 63;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d starting export session", buf, 0x12u);
    }
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100020A5C;
    v30[3] = &unk_100080E90;
    v31 = v14;
    v32 = v12;
    v25 = v14;
    objc_msgSend(v25, "exportAsynchronouslyWithCompletionHandler:", v30);

    v10 = v28;
    v9 = v29;
    v11 = v27;
  }
  else
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004E344();
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError _rpUserErrorForCode:userInfo:](NSError, "_rpUserErrorForCode:userInfo:", -5818, 0));
    (*((void (**)(id, void *))v12 + 2))(v12, v13);
  }

}

+ (id)tempFileURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_srTempPath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/RPReplay_Final"), v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), (uint64_t)v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), v4, v7, CFSTR(".mp4")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8));

  return v9;
}

+ (id)videoCodecTypeForAVAsset:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  const opaqueCMFormatDescription *v6;
  FourCharCode MediaSubType;
  NSString *v8;
  void *v9;
  id v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "tracksWithMediaType:", AVMediaTypeVideo));
  if (objc_msgSend(v3, "count") != (id)1)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004E434();
    v5 = 0;
    v4 = 0;
    goto LABEL_14;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "formatDescriptions"));
  if (objc_msgSend(v5, "count") != (id)1)
  {
    if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10004E3BC();
LABEL_14:
    v9 = 0;
    goto LABEL_6;
  }
  v6 = (const opaqueCMFormatDescription *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
  MediaSubType = CMFormatDescriptionGetMediaSubType(v6);

  v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_10003A6E0(MediaSubType));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136446722;
    v13 = "+[RPAudioMixUtility videoCodecTypeForAVAsset:]";
    v14 = 1024;
    v15 = 111;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d videoCodecType=%@", (uint8_t *)&v12, 0x1Cu);
  }
LABEL_6:
  v10 = v9;

  return v10;
}

+ (id)exportPresetForAVAsset:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  NSString *v7;
  const char *v9;
  uint32_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;

  v4 = AVAssetExportPresetHighestQuality;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RPAudioMixUtility videoCodecTypeForAVAsset:](RPAudioMixUtility, "videoCodecTypeForAVAsset:", a3));
  v6 = v5;
  if (v5)
  {
    if (!objc_msgSend(v5, "isEqualToString:", AVVideoCodecTypeHEVC))
    {
      if (objc_msgSend(v6, "isEqualToString:", AVVideoCodecTypeH264))
      {
        if (dword_100095B40 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_7;
        v11 = 136446466;
        v12 = "+[RPAudioMixUtility exportPresetForAVAsset:]";
        v13 = 1024;
        v14 = 124;
        v9 = " [INFO] %{public}s:%d AVAssetExportPresetHighestQuality for H264";
        v10 = 18;
      }
      else
      {
        if (dword_100095B40 > 1 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_7;
        v11 = 136446722;
        v12 = "+[RPAudioMixUtility exportPresetForAVAsset:]";
        v13 = 1024;
        v14 = 127;
        v15 = 2112;
        v16 = v6;
        v9 = " [INFO] %{public}s:%d videoCodecType=%@, use default preset";
        v10 = 28;
      }
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, v10);
      goto LABEL_7;
    }
    if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136446466;
      v12 = "+[RPAudioMixUtility exportPresetForAVAsset:]";
      v13 = 1024;
      v14 = 121;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d AVAssetExportPresetHEVCHighestQuality for HEVC", (uint8_t *)&v11, 0x12u);
    }
    v7 = AVAssetExportPresetHEVCHighestQuality;

    v4 = v7;
  }
  else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10004E4AC();
  }
LABEL_7:

  return v4;
}

@end
