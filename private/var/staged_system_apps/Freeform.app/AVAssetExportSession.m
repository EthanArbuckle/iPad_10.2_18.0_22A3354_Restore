@implementation AVAssetExportSession

+ (id)crl_exportSessionWithAsset:(id)a3 presetName:(id)a4 preserveFrameDuration:(BOOL)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  float v27;
  void *v28;
  CMTime v30;
  CMTime v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v7 = a3;
  v8 = a4;
  v9 = sub_100243D58(v8);
  if (sub_100243FA4(v9))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCapabilities currentCapabilities](CRLCapabilities, "currentCapabilities"));
    v11 = objc_msgSend(v10, "hasHEVCHardwareEncoding");

    if (!v11)
    {
      v14 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012483E0);
      v15 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1286C(v14, v15);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101248400);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v16, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[AVAssetExportSession(CRLAdditions) crl_exportSessionWithAsset:presetName:preserveFrameDuration:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/AVAssetExportSession_CRLAdditions.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 32, 0, "Should not have been able to request conversion to HEVC on hardware without encoding support!");

      if (sub_100243FB4(v9))
        v12 = 3;
      else
        v12 = 2;
      v13 = 0;
      goto LABEL_17;
    }
    if (+[CRLMovieCompatibilityChecker assetContainsVideoTracksWithAlpha:](CRLMovieCompatibilityChecker, "assetContainsVideoTracksWithAlpha:", v7))
    {
      v12 = v9;
      v13 = 1;
LABEL_17:
      v19 = sub_100243E6C((id)v12, v13);
      v20 = objc_claimAutoreleasedReturnValue(v19);

      v8 = (id)v20;
    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[AVAssetExportSession exportSessionWithAsset:presetName:](AVAssetExportSession, "exportSessionWithAsset:presetName:", v7, v8));
  objc_msgSend(v21, "setShouldOptimizeForNetworkUse:", 1);
  if (!a5 && (sub_100243F00(v8) & 1) == 0)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tracksWithMediaType:", AVMediaTypeVideo));
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i), "nominalFrameRate");
          if (v27 > 30.0)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[AVMutableVideoComposition videoCompositionWithPropertiesOfAsset:](AVMutableVideoComposition, "videoCompositionWithPropertiesOfAsset:", v7));
            CMTimeMake(&v31, 1, 30);
            v30 = v31;
            objc_msgSend(v28, "setFrameDuration:", &v30);
            objc_msgSend(v28, "setSourceTrackIDForFrameTiming:", 0);
            objc_msgSend(v21, "setVideoComposition:", v28);

            goto LABEL_30;
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v24)
          continue;
        break;
      }
    }
LABEL_30:

  }
  return v21;
}

@end
