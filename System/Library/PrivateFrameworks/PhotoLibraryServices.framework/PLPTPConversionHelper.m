@implementation PLPTPConversionHelper

+ (id)conversionResultForAsset:(id)a3 sourceHints:(id)a4 withConversionManager:(id)a5 peerCapabilities:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  PLPTPConversionResult *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  int v31;
  _QWORD *v32;
  void *v33;
  PLPTPConversionResult *v35;
  void *v36;
  uint8_t buf[4];
  NSObject *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_msgSend(a1, "conversionRequestForAsset:sourceHints:withPeerCapabilites:", v10, a4, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "preflightConversionRequest:", v12);
    objc_msgSend(v12, "source");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "containsProResVideoWithFormatEligibleForTranscoding");

    if ((v14 & 1) == 0)
    {
      if (objc_msgSend(v12, "status") == 5)
      {
        PLPTPGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
LABEL_22:
          v15 = 0;
          goto LABEL_23;
        }
        objc_msgSend(v12, "error");
        v17 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v38 = v17;
        v39 = 2112;
        v40 = v10;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Unable to preflight conversion request: %@, asset: %@", buf, 0x16u);
      }
      else
      {
        objc_msgSend(v12, "source");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "isVideo"))
        {
          objc_msgSend(v12, "source");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "firstVideoTrackCodec");

        }
        else
        {
          v20 = 0;
        }

        v21 = (void *)MEMORY[0x1E0D752F0];
        objc_msgSend(v12, "source");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "fileType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "typeWithIdentifier:", v23);
        v16 = objc_claimAutoreleasedReturnValue();

        v24 = objc_msgSend(v12, "backwardsCompatibilityStatus");
        if (v24 == 2)
        {
          v35 = [PLPTPConversionResult alloc];
          objc_msgSend(v12, "outputPathExtension");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "uppercaseString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v12, "estimatedOutputFileLength");
          objc_msgSend(v12, "source");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "isVideo"))
            v29 = 1635148593;
          else
            v29 = 0;
          objc_msgSend(v12, "source");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "isVideo");
          v32 = (_QWORD *)MEMORY[0x1E0CEC5B0];
          if (!v31)
            v32 = (_QWORD *)MEMORY[0x1E0CEC530];
          v15 = -[PLPTPConversionResult initWithRequiresConversion:pathExtension:estimatedFileLength:inputVideoCodec:inputContentType:outputVideoCodec:outputContentType:](v35, "initWithRequiresConversion:pathExtension:estimatedFileLength:inputVideoCodec:inputContentType:outputVideoCodec:outputContentType:", 1, v26, v27, v20, v16, v29, *v32);

          goto LABEL_23;
        }
        v25 = v24;
        if (v24 == 1)
        {
          v15 = -[PLPTPConversionResult initWithRequiresConversion:pathExtension:estimatedFileLength:inputVideoCodec:inputContentType:outputVideoCodec:outputContentType:]([PLPTPConversionResult alloc], "initWithRequiresConversion:pathExtension:estimatedFileLength:inputVideoCodec:inputContentType:outputVideoCodec:outputContentType:", 0, 0, 0, v20, v16, v20, v16);
LABEL_23:

          goto LABEL_24;
        }
        PLPTPGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v12, "error");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v38 = v25;
          v39 = 2112;
          v40 = v33;
          v41 = 2112;
          v42 = v10;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Unexpected backwards compatibility status %ld: %@, asset: %@", buf, 0x20u);

        }
      }

      goto LABEL_22;
    }
  }
  v15 = 0;
LABEL_24:

  return v15;
}

+ (id)conversionRequestForAsset:(id)a3 sourceHints:(id)a4 withPeerCapabilites:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v33;
  void *v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "originalFilename");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fullDirectoryPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v10;
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = objc_claimAutoreleasedReturnValue();

  v33 = (void *)v12;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "groupUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v8, "isVideo");
  v16 = (void *)MEMORY[0x1E0D47C50];
  if (!v15)
  {
    objc_msgSend(v7, "imagePixSize");
    objc_msgSend(v16, "imageSourceForFileURL:dimensions:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0D47C50], "videoSourceForFileURL:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isLivePhoto") && (objc_msgSend(v8, "isRender") & 1) == 0)
  {
    if (objc_msgSend(v8, "livePhotoImageIsHEIC"))
    {
      v18 = v17;
      v19 = 1;
      v20 = 1752589105;
    }
    else
    {
      v18 = v17;
      v19 = 0;
      v20 = 1635148593;
    }
    objc_msgSend(v18, "markContainsVideoEligibleForTranscodingAsCheckedWithValue:codec:", v19, v20);
  }
  v21 = objc_msgSend(v7, "videoCodec");
  if (v21 == 1635148593)
  {
    v22 = v17;
    v23 = 0;
    v24 = 1635148593;
  }
  else
  {
    if (v21 != 1752589105)
      goto LABEL_14;
    v22 = v17;
    v23 = 1;
    v24 = 1752589105;
  }
  objc_msgSend(v22, "markContainsVideoEligibleForTranscodingAsCheckedWithValue:codec:", v23, v24);
LABEL_14:
  objc_msgSend(v17, "markLivePhotoPairingIdentifierAsCheckedWithValue:", v14);
  objc_msgSend(v17, "markIsHDRAsCheckedWithValue:", objc_msgSend(v7, "isHDR"));
  if (objc_msgSend(v8, "isVideo"))
    v25 = objc_msgSend(v8, "isLivePhoto") ^ 1;
  else
    v25 = 0;
  v35 = 0;
  v26 = v9;
  objc_msgSend(MEMORY[0x1E0D47C48], "requestForSource:destinationCapabilities:error:", v17, v9, &v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v35;
  if (v27)
  {
    objc_msgSend(v27, "setShouldPadOutputFileToEstimatedLength:", 1);
    objc_msgSend(v27, "setUseTransferBehaviorUserPreference:", 1);
    objc_msgSend(v7, "filename");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setOutputFilename:", v29);

    if (v25)
      objc_msgSend(v27, "enableSinglePassVideoEncodingWithUpdateHandler:", 0);
    v30 = v27;
  }
  else
  {
    PLPTPGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v28;
      v38 = 2112;
      v39 = v7;
      _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "Unable to create conversion request: %@, asset: %@", buf, 0x16u);
    }

  }
  return v27;
}

@end
