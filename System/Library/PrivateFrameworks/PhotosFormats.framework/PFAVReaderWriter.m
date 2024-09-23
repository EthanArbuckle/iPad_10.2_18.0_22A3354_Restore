@implementation PFAVReaderWriter

- (PFAVReaderWriter)init
{
  return -[PFAVReaderWriter initWithAsset:](self, "initWithAsset:", 0);
}

- (PFAVReaderWriter)initWithAsset:(id)a3
{
  __int128 v4;
  uint64_t v5;

  v4 = *MEMORY[0x1E0CA2E18];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  return -[PFAVReaderWriter initWithAsset:stillImageTime:](self, "initWithAsset:stillImageTime:", 0, &v4);
}

- (PFAVReaderWriter)initWithAsset:(id)a3 stillImageTime:(id *)a4
{
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  dispatch_queue_t v11;
  void *v12;
  dispatch_queue_t v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PFAVReaderWriter;
  v7 = -[PFAVReaderWriter init](&v16, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    v9 = (void *)*((_QWORD *)v7 + 15);
    *((_QWORD *)v7 + 15) = v8;

    v10 = *(_OWORD *)&a4->var0;
    *(_QWORD *)(v7 + 100) = a4->var3;
    *(_OWORD *)(v7 + 84) = v10;
    v11 = dispatch_queue_create("com.apple.PFAVReaderWriter.serializationQueue", 0);
    v12 = (void *)*((_QWORD *)v7 + 1);
    *((_QWORD *)v7 + 1) = v11;

    v13 = dispatch_queue_create("com.apple.PFAVReaderWriter.isolationQueue", 0);
    v14 = (void *)*((_QWORD *)v7 + 2);
    *((_QWORD *)v7 + 2) = v13;

  }
  return (PFAVReaderWriter *)v7;
}

- (void)writeToURL:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *isolationQueue;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id completionBlock;
  void *v17;
  id progressBlock;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id location;
  _QWORD v28[5];
  _QWORD block[6];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  isolationQueue = self->_isolationQueue;
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PFAVReaderWriter_writeToURL_progress_completion___block_invoke;
  block[3] = &unk_1E45A4B68;
  block[4] = self;
  block[5] = &v30;
  dispatch_sync(isolationQueue, block);
  if (*((_BYTE *)v31 + 24))
  {
    if (v8 && (objc_msgSend(v8, "isFileURL") & 1) != 0)
    {
      v13 = self->_isolationQueue;
      v28[0] = v12;
      v28[1] = 3221225472;
      v28[2] = __51__PFAVReaderWriter_writeToURL_progress_completion___block_invoke_2;
      v28[3] = &unk_1E45A4AC8;
      v28[4] = self;
      dispatch_sync(v13, v28);
      -[PFAVReaderWriter setOutputURL:](self, "setOutputURL:", v8);
      -[PFAVReaderWriter asset](self, "asset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v10, "copy");
      completionBlock = self->_completionBlock;
      self->_completionBlock = v15;

      v17 = (void *)objc_msgSend(v9, "copy");
      progressBlock = self->_progressBlock;
      self->_progressBlock = v17;

      objc_initWeak(&location, self);
      v25[0] = v12;
      v25[1] = 3221225472;
      v25[2] = __51__PFAVReaderWriter_writeToURL_progress_completion___block_invoke_3;
      v25[3] = &unk_1E45A4450;
      v25[4] = self;
      objc_copyWeak(&v26, &location);
      objc_msgSend(v14, "loadValuesAsynchronouslyForKeys:completionHandler:", &unk_1E45CB210, v25);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);

    }
    else if (v10)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v34 = *MEMORY[0x1E0CB2D50];
      v35 = CFSTR("PFAVReaderWriter: output file URL must be provided");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("PFAVReaderWriterErrorDomain"), 2, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v21);
    }
  }
  else if (v10)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2D50];
    v37[0] = CFSTR("PFAVReaderWriter: multiple simultaneous writes not supported");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("PFAVReaderWriterErrorDomain"), 1, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v24);
  }
  _Block_object_dispose(&v30, 8);

}

- (void)_didLoadAVAssetValues
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  BOOL v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CMTime start;
  CMTime duration;
  CMTimeRange v24;
  id v25;
  id v26;
  id v27;

  if (!self->cancelled)
  {
    -[PFAVReaderWriter asset](self, "asset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PFAVReaderWriter outputURL](self, "outputURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v5 = objc_msgSend(v3, "statusOfValueForKey:error:", CFSTR("tracks"), &v27);
    v6 = v27;
    v7 = v6;
    if (v5 == 2)
    {
      v26 = v6;
      v8 = objc_msgSend(v3, "statusOfValueForKey:error:", CFSTR("duration"), &v26);
      v9 = v26;

      if (v8 == 2)
      {
        v25 = v9;
        v10 = objc_msgSend(v3, "statusOfValueForKey:error:", CFSTR("metadata"), &v25);
        v7 = v25;

        if (v10 == 2)
        {
          if (v3)
            objc_msgSend(v3, "duration");
          else
            memset(&duration, 0, sizeof(duration));
          start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
          CMTimeRangeMake(&v24, &start, &duration);
          -[PFAVReaderWriter setTimeRange:](self, "setTimeRange:", &v24);
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "path");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v11, "fileExistsAtPath:", v12) & 1) == 0)
          {

LABEL_16:
            v15 = v7;
            v20 = v7;
            v16 = -[PFAVReaderWriter setUpReaderAndWriterReturningError:](self, "setUpReaderAndWriterReturningError:", &v20);
            v7 = v20;

            if (v16)
            {
              v19 = v7;
              v17 = -[PFAVReaderWriter startReadingAndWritingReturningError:](self, "startReadingAndWritingReturningError:", &v19);
              v18 = v19;

              v7 = v18;
              if (v17)
                goto LABEL_9;
            }
            goto LABEL_8;
          }
          v21 = v7;
          v13 = objc_msgSend(v11, "removeItemAtPath:error:", v12, &v21);
          v14 = v21;

          v7 = v14;
          if (v13)
            goto LABEL_16;
        }
      }
      else
      {
        v7 = v9;
      }
    }
LABEL_8:
    -[PFAVReaderWriter readingAndWritingDidFinishSuccessfully:withError:](self, "readingAndWritingDidFinishSuccessfully:withError:", 0, v7);
LABEL_9:

  }
}

- (BOOL)setUpReaderAndWriterReturningError:(id *)a3
{
  void *v5;
  void *v6;
  AVAssetReader *v7;
  id v8;
  AVAssetReader *assetReader;
  id v10;
  uint64_t v11;
  AVAssetWriter *v12;
  id v13;
  AVAssetWriter *assetWriter;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CGSize PresentationDimensions;
  double width;
  double height;
  const __CFDictionary *Extension;
  uint64_t v28;
  const __CFDictionary *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  PFRWSampleBufferChannel *v43;
  BOOL v44;
  void *v45;
  int timescale;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  PFRWSampleBufferChannel *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const __CFArray *v64;
  id v65;
  uint64_t v66;
  AVAssetWriterInput *v67;
  uint64_t v68;
  NSArray *videoChannels;
  uint64_t v70;
  NSArray *passthroughChannels;
  AVAssetWriterInput *metadataInput;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  const void *v81;
  uint64_t v82;
  const void *v83;
  uint64_t v84;
  const void *v85;
  uint64_t v86;
  const void *v87;
  uint64_t v88;
  const void *v89;
  uint64_t v90;
  const void *v91;
  uint64_t v92;
  id v93;
  const __CFString *v94;
  const __CFString *extensionKey;
  id v96;
  uint64_t v97;
  char v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  PFAVReaderWriter *v108;
  CMMetadataFormatDescriptionRef formatDescriptionOut;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _OWORD v114[3];
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  id v119;
  id v120;
  _QWORD v121[2];
  _QWORD v122[2];
  void *v123;
  _BYTE v124[128];
  _QWORD v125[2];
  _QWORD v126[2];
  _QWORD v127[4];
  _QWORD v128[4];
  _QWORD v129[2];
  _QWORD v130[2];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  -[PFAVReaderWriter asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFAVReaderWriter outputURL](self, "outputURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = 0;
  v7 = (AVAssetReader *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8AFD0]), "initWithAsset:error:", v5, &v120);
  v8 = v120;
  assetReader = self->assetReader;
  self->assetReader = v7;

  if (self->assetReader)
  {
    v10 = objc_alloc(MEMORY[0x1E0C8B018]);
    v11 = *MEMORY[0x1E0C8A2E8];
    v119 = v8;
    v12 = (AVAssetWriter *)objc_msgSend(v10, "initWithURL:fileType:error:", v6, v11, &v119);
    v13 = v119;

    assetWriter = self->assetWriter;
    self->assetWriter = v12;

    v108 = self;
    if (self->assetWriter)
    {
      objc_msgSend(v5, "metadata");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
        -[AVAssetWriter setMetadata:](self->assetWriter, "setMetadata:", v15);
      v77 = (void *)v15;
      v74 = v13;
      v75 = v6;
      +[PFMediaUtilities tracksWithMediaType:forAsset:](PFMediaUtilities, "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v76 = v5;
      objc_msgSend(v5, "tracks");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v115 = 0u;
      v116 = 0u;
      v117 = 0u;
      v118 = 0u;
      v17 = v16;
      v106 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
      v107 = v17;
      if (v106)
      {
        v105 = *(_QWORD *)v116;
        v104 = *MEMORY[0x1E0CA9040];
        v103 = *MEMORY[0x1E0CA8FF0];
        extensionKey = (const __CFString *)*MEMORY[0x1E0CA8D50];
        v92 = *MEMORY[0x1E0C8AE50];
        v91 = (const void *)*MEMORY[0x1E0CA8D60];
        v90 = *MEMORY[0x1E0C8AE30];
        v89 = (const void *)*MEMORY[0x1E0CA8D40];
        v88 = *MEMORY[0x1E0C8AE38];
        v87 = (const void *)*MEMORY[0x1E0CA8D48];
        v86 = *MEMORY[0x1E0C8AE48];
        v85 = (const void *)*MEMORY[0x1E0CA8D58];
        v94 = (const __CFString *)*MEMORY[0x1E0CA8E68];
        v84 = *MEMORY[0x1E0C8AF00];
        v83 = (const void *)*MEMORY[0x1E0CA8E60];
        v82 = *MEMORY[0x1E0C8AF10];
        v81 = (const void *)*MEMORY[0x1E0CA8E70];
        v80 = *MEMORY[0x1E0C8AE40];
        v79 = *MEMORY[0x1E0C8AF08];
        v102 = *MEMORY[0x1E0C8AE70];
        v101 = *MEMORY[0x1E0C8AE68];
        v100 = *MEMORY[0x1E0C8AF60];
        v98 = 1;
        v99 = *MEMORY[0x1E0C8AEF0];
        v97 = *MEMORY[0x1E0C8AEB8];
LABEL_7:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v116 != v105)
            objc_enumerationMutation(v17);
          v19 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v18);
          v129[0] = v104;
          v129[1] = v103;
          v130[0] = &unk_1E45CA190;
          v130[1] = MEMORY[0x1E0C9AA70];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, v129, 2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "formatDescriptions");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v22, "count"))
            goto LABEL_21;
          objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            PresentationDimensions = CMVideoFormatDescriptionGetPresentationDimensions((CMVideoFormatDescriptionRef)v23, 0, 0);
            width = PresentationDimensions.width;
            height = PresentationDimensions.height;
            Extension = (const __CFDictionary *)CMFormatDescriptionGetExtension((CMFormatDescriptionRef)v23, extensionKey);
            v28 = (uint64_t)Extension;
            if (Extension)
            {
              v127[0] = v92;
              v128[0] = CFDictionaryGetValue(Extension, v91);
              v127[1] = v90;
              v128[1] = CFDictionaryGetValue((CFDictionaryRef)v28, v89);
              v127[2] = v88;
              v128[2] = CFDictionaryGetValue((CFDictionaryRef)v28, v87);
              v127[3] = v86;
              v128[3] = CFDictionaryGetValue((CFDictionaryRef)v28, v85);
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v128, v127, 4);
              v28 = objc_claimAutoreleasedReturnValue();
            }
            v29 = (const __CFDictionary *)CMFormatDescriptionGetExtension((CMFormatDescriptionRef)v23, v94);
            v30 = (uint64_t)v29;
            if (v29)
            {
              v125[0] = v84;
              v126[0] = CFDictionaryGetValue(v29, v83);
              v125[1] = v82;
              v126[1] = CFDictionaryGetValue((CFDictionaryRef)v30, v81);
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v126, v125, 2);
              v30 = objc_claimAutoreleasedReturnValue();
            }
            if (v28 | v30)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v31;
              if (v28)
                objc_msgSend(v31, "setObject:forKeyedSubscript:", v28, v80);
              if (v30)
                objc_msgSend(v32, "setObject:forKeyedSubscript:", v30, v79);
            }
            else
            {
              v32 = 0;
            }

          }
          else
          {
LABEL_21:
            objc_msgSend(v19, "naturalSize");
            width = v33;
            height = v34;
            v32 = 0;
          }
          v35 = (void *)MEMORY[0x1E0C99E08];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "dictionaryWithObjectsAndKeys:", v102, v101, v36, v100, v37, v99, 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
            objc_msgSend(v38, "setObject:forKeyedSubscript:", v32, v97);
          v39 = (void *)MEMORY[0x1E0C8B020];
          objc_msgSend(v19, "mediaType");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "assetWriterInputWithMediaType:outputSettings:", v40, v38);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            objc_msgSend(v19, "preferredTransform");
          else
            memset(v114, 0, sizeof(v114));
          objc_msgSend(v41, "setTransform:", v114);
          if (-[AVAssetReader canAddOutput:](v108->assetReader, "canAddOutput:", v21)
            && -[AVAssetWriter canAddInput:](v108->assetWriter, "canAddInput:", v41))
          {
            -[AVAssetReader addOutput:](v108->assetReader, "addOutput:", v21);
            -[AVAssetWriter addInput:](v108->assetWriter, "addInput:", v41);
            v42 = 1;
            v43 = -[PFRWSampleBufferChannel initWithAssetReaderOutput:assetWriterInput:useAdaptor:]([PFRWSampleBufferChannel alloc], "initWithAssetReaderOutput:assetWriterInput:useAdaptor:", v21, v41, 1);
            objc_msgSend(v93, "addObject:", v43);

          }
          else
          {
            v98 = 0;
            v42 = 0;
          }

          v17 = v107;
          if (!v42)
            break;
          if (v106 == ++v18)
          {
            v106 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
            if (v106)
              goto LABEL_7;
            break;
          }
        }

        if ((v98 & 1) == 0)
        {
          v44 = 0;
          v6 = v75;
          v5 = v76;
          v13 = v74;
          goto LABEL_62;
        }
      }
      else
      {

      }
      timescale = v108->_stillImagetime.timescale;
      v110 = 0u;
      v111 = 0u;
      v112 = 0u;
      v113 = 0u;
      v47 = v78;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v111;
        v51 = *MEMORY[0x1E0C8A7D0];
        while (2)
        {
          for (i = 0; i != v49; ++i)
          {
            if (*(_QWORD *)v111 != v50)
              objc_enumerationMutation(v47);
            v53 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
            if ((objc_msgSend(v17, "containsObject:", v53) & 1) == 0)
            {
              if ((timescale & 1) == 0
                || (objc_msgSend(v53, "mediaType"),
                    v54 = (void *)objc_claimAutoreleasedReturnValue(),
                    v55 = objc_msgSend(v54, "isEqualToString:", v51),
                    v54,
                    (v55 & 1) == 0))
              {
                objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v53, 0);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v57 = (void *)MEMORY[0x1E0C8B020];
                objc_msgSend(v53, "mediaType");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "assetWriterInputWithMediaType:outputSettings:", v58, 0);
                v59 = (void *)objc_claimAutoreleasedReturnValue();

                if (!-[AVAssetReader canAddOutput:](v108->assetReader, "canAddOutput:", v56)
                  || !-[AVAssetWriter canAddInput:](v108->assetWriter, "canAddInput:", v59))
                {

                  v44 = 0;
                  v6 = v75;
                  v5 = v76;
                  v13 = v74;
                  v17 = v107;
                  goto LABEL_62;
                }
                -[AVAssetReader addOutput:](v108->assetReader, "addOutput:", v56);
                -[AVAssetWriter addInput:](v108->assetWriter, "addInput:", v59);
                v60 = -[PFRWSampleBufferChannel initWithAssetReaderOutput:assetWriterInput:useAdaptor:]([PFRWSampleBufferChannel alloc], "initWithAssetReaderOutput:assetWriterInput:useAdaptor:", v56, v59, 0);
                objc_msgSend(v96, "addObject:", v60);

                v17 = v107;
              }
            }
          }
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
          if (v49)
            continue;
          break;
        }
      }

      v6 = v75;
      v5 = v76;
      v13 = v74;
      if ((timescale & 1) != 0)
      {
        formatDescriptionOut = 0;
        v61 = *MEMORY[0x1E0CA2518];
        v121[0] = *MEMORY[0x1E0CA2528];
        v121[1] = v61;
        v62 = *MEMORY[0x1E0CA2468];
        v122[0] = *MEMORY[0x1E0CA4CC0];
        v122[1] = v62;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, v121, 2);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = v63;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v123, 1);
        v64 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

        CMMetadataFormatDescriptionCreateWithMetadataSpecifications((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x6D656278u, v64, &formatDescriptionOut);
        v65 = objc_alloc(MEMORY[0x1E0C8B020]);
        v66 = objc_msgSend(v65, "initWithMediaType:outputSettings:sourceFormatHint:", *MEMORY[0x1E0C8A7D0], 0, formatDescriptionOut);
        if (!-[AVAssetWriter canAddInput:](v108->assetWriter, "canAddInput:", v66))
        {
          metadataInput = v108->_metadataInput;
          v108->_metadataInput = (AVAssetWriterInput *)v66;

          v44 = 0;
          goto LABEL_62;
        }
        -[AVAssetWriter addInput:](v108->assetWriter, "addInput:", v66);
        v67 = v108->_metadataInput;
        v108->_metadataInput = (AVAssetWriterInput *)v66;

      }
      v68 = objc_msgSend(v93, "copy");
      videoChannels = v108->videoChannels;
      v108->videoChannels = (NSArray *)v68;

      v70 = objc_msgSend(v96, "copy");
      passthroughChannels = v108->passthroughChannels;
      v108->passthroughChannels = (NSArray *)v70;

      v44 = 1;
LABEL_62:

      goto LABEL_65;
    }
    if (!a3)
    {
      v44 = 0;
      goto LABEL_65;
    }
    v45 = v13;
  }
  else
  {
    if (!a3)
    {
      v44 = 0;
      v13 = v8;
      goto LABEL_65;
    }
    v45 = v8;
  }
  v13 = objc_retainAutorelease(v45);
  v44 = 0;
  *a3 = v13;
LABEL_65:

  return v44;
}

- (BOOL)startReadingAndWritingReturningError:(id *)a3
{
  NSObject *v5;
  AVAssetWriter *assetWriter;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  PFAVReaderWriter *v14;
  PFAVReaderWriter *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  AVAssetWriterInput *metadataInput;
  OS_dispatch_queue *isolationQueue;
  NSObject *serializationQueue;
  BOOL result;
  void *assetReader;
  id v29;
  _QWORD v30[5];
  _QWORD v31[5];
  NSObject *v32;
  _QWORD v33[4];
  NSObject *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  NSObject *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if (!-[AVAssetReader startReading](self->assetReader, "startReading"))
  {
    if (a3)
    {
      assetReader = self->assetReader;
LABEL_27:
      objc_msgSend(assetReader, "error");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a3 = v29;
      return result;
    }
    return 0;
  }
  if (!-[AVAssetWriter startWriting](self->assetWriter, "startWriting"))
  {
    if (a3)
    {
      assetReader = self->assetWriter;
      goto LABEL_27;
    }
    return 0;
  }
  v5 = dispatch_group_create();
  assetWriter = self->assetWriter;
  -[PFAVReaderWriter timeRange](self, "timeRange");
  v47 = v45;
  v48 = v46;
  -[AVAssetWriter startSessionAtSourceTime:](assetWriter, "startSessionAtSourceTime:", &v47);
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = self->videoChannels;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v42 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        dispatch_group_enter(v5);
        -[PFAVReaderWriter delegate](self, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          v14 = self;
        else
          v14 = 0;
        v15 = v14;

        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke;
        v39[3] = &unk_1E45A4AC8;
        v40 = v5;
        objc_msgSend(v12, "startWithDelegate:completionHandler:", v15, v39);

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v9);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = self->passthroughChannels;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
  v18 = MEMORY[0x1E0C809B0];
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v36 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        dispatch_group_enter(v5);
        v33[0] = v18;
        v33[1] = 3221225472;
        v33[2] = __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke_2;
        v33[3] = &unk_1E45A4AC8;
        v34 = v5;
        objc_msgSend(v22, "startWithDelegate:completionHandler:", 0, v33);

      }
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    }
    while (v19);
  }

  -[PFAVReaderWriter metadataInput](self, "metadataInput");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    dispatch_group_enter(v5);
    metadataInput = self->_metadataInput;
    isolationQueue = self->_isolationQueue;
    v31[0] = v18;
    v31[1] = 3221225472;
    v31[2] = __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke_3;
    v31[3] = &unk_1E45A4B40;
    v31[4] = self;
    v32 = v5;
    -[AVAssetWriterInput requestMediaDataWhenReadyOnQueue:usingBlock:](metadataInput, "requestMediaDataWhenReadyOnQueue:usingBlock:", isolationQueue, v31);

  }
  serializationQueue = self->_serializationQueue;
  v30[0] = v18;
  v30[1] = 3221225472;
  v30[2] = __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke_4;
  v30[3] = &unk_1E45A4AC8;
  v30[4] = self;
  dispatch_group_notify(v5, serializationQueue, v30);

  return 1;
}

- (void)cancel
{
  NSObject *serializationQueue;
  _QWORD block[5];

  serializationQueue = self->_serializationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__PFAVReaderWriter_cancel__block_invoke;
  block[3] = &unk_1E45A4AC8;
  block[4] = self;
  dispatch_async(serializationQueue, block);
}

- (void)readingAndWritingDidFinishSuccessfully:(BOOL)a3 withError:(id)a4
{
  _BOOL8 v4;
  AVAssetReader *assetReader;
  AVAssetWriter *assetWriter;
  NSArray *videoChannels;
  NSArray *passthroughChannels;
  id progressBlock;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id completionBlock;
  NSObject *isolationQueue;
  id v14;
  _QWORD block[5];

  v4 = a3;
  v14 = a4;
  if (!v4)
  {
    -[AVAssetReader cancelReading](self->assetReader, "cancelReading");
    -[AVAssetWriter cancelWriting](self->assetWriter, "cancelWriting");
  }
  assetReader = self->assetReader;
  self->assetReader = 0;

  assetWriter = self->assetWriter;
  self->assetWriter = 0;

  videoChannels = self->videoChannels;
  self->videoChannels = 0;

  passthroughChannels = self->passthroughChannels;
  self->passthroughChannels = 0;

  self->cancelled = 0;
  progressBlock = self->_progressBlock;
  self->_progressBlock = 0;

  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1B0CFA4](self->_completionBlock);
  completionBlock = self->_completionBlock;
  self->_completionBlock = 0;

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__PFAVReaderWriter_readingAndWritingDidFinishSuccessfully_withError___block_invoke;
  block[3] = &unk_1E45A4AC8;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
  if (v11)
    ((void (**)(_QWORD, _BOOL8, id))v11)[2](v11, v4, v14);

}

- (void)sampleBufferChannel:(id)a3 didReadSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  double v6;
  void (**progressBlock)(float);
  float v8;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v10;
  CFTypeID v11;
  void *v12;
  char v13;
  void *v14;
  CMTime v15[2];

  -[PFAVReaderWriter timeRange](self, "timeRange", a3);
  v6 = progressOfSampleBufferInTimeRange(a4, v15);
  progressBlock = (void (**)(float))self->_progressBlock;
  if (progressBlock)
  {
    v8 = v6;
    progressBlock[2](v8);
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  if (ImageBuffer)
  {
    v10 = ImageBuffer;
    v11 = CFGetTypeID(ImageBuffer);
    if (v11 == CVPixelBufferGetTypeID())
    {
      -[PFAVReaderWriter delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        -[PFAVReaderWriter delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "adjustPixelBuffer:", v10);

      }
    }
  }
}

- (void)sampleBufferChannel:(id)a3 didReadSampleBuffer:(opaqueCMSampleBuffer *)a4 andMadeWriteSampleBuffer:(__CVBuffer *)a5
{
  double v8;
  void (**progressBlock)(float);
  float v10;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v12;
  CFTypeID v13;
  CFTypeID TypeID;
  void *v15;
  char v16;
  void *v17;
  CMTime v18[2];

  -[PFAVReaderWriter timeRange](self, "timeRange", a3);
  v8 = progressOfSampleBufferInTimeRange(a4, v18);
  progressBlock = (void (**)(float))self->_progressBlock;
  if (progressBlock)
  {
    v10 = v8;
    progressBlock[2](v10);
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(a4);
  if (ImageBuffer)
  {
    v12 = ImageBuffer;
    v13 = CFGetTypeID(ImageBuffer);
    TypeID = CVPixelBufferGetTypeID();
    if (a5)
    {
      if (v13 == TypeID)
      {
        -[PFAVReaderWriter delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_opt_respondsToSelector();

        if ((v16 & 1) != 0)
        {
          -[PFAVReaderWriter delegate](self, "delegate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "adjustPixelBuffer:toOutputBuffer:", v12, a5);

        }
      }
    }
  }
}

- (PFAVReaderWriterAdjustDelegate)delegate
{
  return (PFAVReaderWriterAdjustDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (AVAssetWriterInput)metadataInput
{
  return self->_metadataInput;
}

- (void)setMetadataInput:(id)a3
{
  objc_storeStrong((id *)&self->_metadataInput, a3);
}

- ($9E16F6706E08E1DCF37CEDFAE5F41851)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].var0.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[3].var0.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var1.var1;
  return self;
}

- (void)setTimeRange:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0.var0;
  v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_metadataInput, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->passthroughChannels, 0);
  objc_storeStrong((id *)&self->videoChannels, 0);
  objc_storeStrong((id *)&self->assetWriter, 0);
  objc_storeStrong((id *)&self->assetReader, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_serializationQueue, 0);
}

uint64_t __69__PFAVReaderWriter_readingAndWritingDidFinishSuccessfully_withError___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 80) = 0;
  return result;
}

uint64_t __26__PFAVReaderWriter_cancel__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v6++), "cancel");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v4);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "cancel", (_QWORD)v13);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v9);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "readingAndWritingDidFinishSuccessfully:withError:", 0, 0);
}

void __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  CMSampleBufferRef QuickTimeMovieStillImageTimeSampleBuffer;
  CMSampleBufferRef v4;
  __int128 v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 32);
  v5 = *(_OWORD *)(v2 + 84);
  v6 = *(_QWORD *)(v2 + 100);
  QuickTimeMovieStillImageTimeSampleBuffer = StolenFigCaptureMetadataUtilitiesCreateQuickTimeMovieStillImageTimeSampleBuffer((uint64_t)&v5, 0);
  if (QuickTimeMovieStillImageTimeSampleBuffer)
  {
    v4 = QuickTimeMovieStillImageTimeSampleBuffer;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "appendSampleBuffer:", QuickTimeMovieStillImageTimeSampleBuffer);
    CFRelease(v4);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "markAsFinished");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (*(_BYTE *)(v2 + 56))
  {
    objc_msgSend(v3, "cancelReading");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "cancelWriting");
  }
  else
  {
    v4 = objc_msgSend(v3, "status");
    v5 = *(_QWORD *)(a1 + 32);
    if (v4 == 3)
    {
      objc_msgSend(*(id *)(v5 + 24), "error");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "readingAndWritingDidFinishSuccessfully:withError:", 0, v7);

    }
    else
    {
      v6 = *(void **)(v5 + 32);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke_5;
      v8[3] = &unk_1E45A4AC8;
      v8[4] = v5;
      objc_msgSend(v6, "finishWritingWithCompletionHandler:", v8);
    }
  }
}

void __57__PFAVReaderWriter_startReadingAndWritingReturningError___block_invoke_5(uint64_t a1)
{
  _BOOL8 v2;
  id *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "status") == 2;
  v3 = *(id **)(a1 + 32);
  objc_msgSend(v3[4], "error");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readingAndWritingDidFinishSuccessfully:withError:", v2, v4);

}

uint64_t __51__PFAVReaderWriter_writeToURL_progress_completion___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 80) ^ 1;
  return result;
}

uint64_t __51__PFAVReaderWriter_writeToURL_progress_completion___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 80) = 1;
  return result;
}

void __51__PFAVReaderWriter_writeToURL_progress_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__PFAVReaderWriter_writeToURL_progress_completion___block_invoke_4;
  block[3] = &unk_1E45A2F10;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __51__PFAVReaderWriter_writeToURL_progress_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didLoadAVAssetValues");

}

@end
