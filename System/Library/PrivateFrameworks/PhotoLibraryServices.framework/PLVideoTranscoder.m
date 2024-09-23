@implementation PLVideoTranscoder

+ (void)transcodeVideo:(id)a3 outputURL:(id)a4 presetName:(id)a5 outputFileType:(id)a6 metadata:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  __int128 v21;
  uint64_t v22;
  _QWORD v23[3];

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D752F8]), "initWithVideoAsset:videoAdjustments:", v14, 0);
  if (v14)
    objc_msgSend(v14, "duration");
  else
    memset(v23, 0, sizeof(v23));
  v21 = *MEMORY[0x1E0CA2E68];
  v22 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(a1, "transcodeVideoWithObjectBuilder:outputURL:startTime:endTime:presetName:outputFileType:metadata:completionHandler:", v20, v15, &v21, v23, v16, v17, v18, v19);

}

+ (void)transcodeVideoWithObjectBuilder:(id)a3 outputURL:(id)a4 startTime:(id *)a5 endTime:(id *)a6 presetName:(id)a7 outputFileType:(id)a8 metadata:(id)a9 completionHandler:(id)a10
{
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t *v41;
  __int128 v42;
  int64_t var3;
  __int128 v44;
  int64_t v45;
  _QWORD v46[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v15 = a3;
  v32 = a4;
  v16 = a7;
  v31 = a8;
  v30 = a9;
  v17 = a10;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__98022;
  v51 = __Block_byref_object_dispose__98023;
  v18 = MEMORY[0x1E0C809B0];
  v52 = 0;
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __134__PLVideoTranscoder_transcodeVideoWithObjectBuilder_outputURL_startTime_endTime_presetName_outputFileType_metadata_completionHandler___block_invoke;
  v46[3] = &unk_1E3676EF8;
  v46[4] = &v47;
  objc_msgSend(v15, "requestExportSessionWithExportPreset:resultHandler:", v16, v46);
  v19 = (void *)v48[5];
  if (v19)
  {
    if (v17)
    {
      v20 = (void *)objc_msgSend(v17, "copy");

      v19 = (void *)v48[5];
    }
    else
    {
      v20 = 0;
    }
    objc_msgSend(v19, "presetName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v48[5], "asset");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0C8AFC0];
    v33[0] = v18;
    v33[1] = 3221225472;
    v33[2] = __134__PLVideoTranscoder_transcodeVideoWithObjectBuilder_outputURL_startTime_endTime_presetName_outputFileType_metadata_completionHandler___block_invoke_2;
    v33[3] = &unk_1E3676F48;
    v41 = &v47;
    v34 = v31;
    v35 = v32;
    v36 = v30;
    v37 = v16;
    v42 = *(_OWORD *)&a6->var0;
    var3 = a6->var3;
    v44 = *(_OWORD *)&a5->var0;
    v45 = a5->var3;
    v17 = v20;
    v40 = v17;
    v25 = v26;
    v38 = v25;
    v29 = v27;
    v39 = v29;
    objc_msgSend(v28, "determineCompatibilityOfExportPreset:withAsset:outputFileType:completionHandler:", v25, v29, v34, v33);

  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" export session could not be created"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryWithObject:forKey:", v23, *MEMORY[0x1E0CB2D50]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("PLVideoTranscoderErrorDomain"), 0, v24);
    v25 = (id)objc_claimAutoreleasedReturnValue();

    if (v17)
      (*((void (**)(id, _QWORD, id))v17 + 2))(v17, 0, v25);
  }

  _Block_object_dispose(&v47, 8);
}

+ (id)generatePosterFrameForVideoAtURL:(id)a3 maxSize:(CGSize)a4 error:(id *)a5
{
  double height;
  double width;
  void *v9;
  void *v10;

  if (a3)
  {
    height = a4.height;
    width = a4.width;
    objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "generatePosterFrameForAVAsset:maxSize:error:", v9, a5, width, height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)generatePosterFrameForAVAsset:(id)a3 maxSize:(CGSize)a4 error:(id *)a5
{
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    objc_msgSend(v5, "duration");
  }

  return 0;
}

void __134__PLVideoTranscoder_transcodeVideoWithObjectBuilder_outputURL_startTime_endTime_presetName_outputFileType_metadata_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __134__PLVideoTranscoder_transcodeVideoWithObjectBuilder_outputURL_startTime_endTime_presetName_outputFileType_metadata_completionHandler___block_invoke_2(uint64_t a1, int a2)
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
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  CMTimeRange time2;
  CMTime end;
  CMTimeRange time1;
  CMTime start;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "supportedFileTypes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setOutputFileType:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setOutputURL:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setShouldOptimizeForNetworkUse:", 1);
      if (*(_QWORD *)(a1 + 48))
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "setMetadata:");
      if ((objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", *MEMORY[0x1E0C89EA0]) & 1) != 0
        || objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", *MEMORY[0x1E0C89EA8]))
      {
        v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0C8B228], "metadataItemFilterForSharing");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setMetadataItemFilter:", v5);

      }
      start = *(CMTime *)(a1 + 96);
      *(_OWORD *)&time1.start.value = *(_OWORD *)(a1 + 96);
      time1.start.epoch = *(_QWORD *)(a1 + 112);
      *(_OWORD *)&time2.start.value = *MEMORY[0x1E0CA2E68];
      time2.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      if (!CMTimeCompare(&time1.start, &time2.start))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "asset");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (v6)
          objc_msgSend(v6, "duration");
        else
          memset(&time1, 0, 24);
        start = time1.start;

      }
      memset(&time1, 0, sizeof(time1));
      *(_OWORD *)&time2.start.value = *(_OWORD *)(a1 + 120);
      time2.start.epoch = *(_QWORD *)(a1 + 136);
      end = start;
      CMTimeRangeFromTimeToTime(&time1, &time2.start, &end);
      v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      time2 = time1;
      objc_msgSend(v16, "setTimeRange:", &time2);
      v18 = *(void **)(a1 + 80);
      v17 = *(_QWORD *)(a1 + 88);
      v19 = *(void **)(*(_QWORD *)(v17 + 8) + 40);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __134__PLVideoTranscoder_transcodeVideoWithObjectBuilder_outputURL_startTime_endTime_presetName_outputFileType_metadata_completionHandler___block_invoke_3;
      v20[3] = &unk_1E3676F20;
      v23 = v17;
      v22 = v18;
      v21 = *(id *)(a1 + 40);
      objc_msgSend(v19, "exportAsynchronouslyWithCompletionHandler:", v20);

      v10 = 0;
      goto LABEL_18;
    }
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" outputFileType %@ not in supported file types %@"), *(_QWORD *)(a1 + 32), v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryWithObject:forKey:", v13, *MEMORY[0x1E0CB2D50]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("PLVideoTranscoderErrorDomain"), 0, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" presentName %@ is not compatible with asset %@ and outputFileType %@"), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    v29[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("PLVideoTranscoderErrorDomain"), 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = *(_QWORD *)(a1 + 80);
  if (v15)
    (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v10);
LABEL_18:

}

void __134__PLVideoTranscoder_transcodeVideoWithObjectBuilder_outputURL_startTime_endTime_presetName_outputFileType_metadata_completionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "status");
  if (v2 == 5)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: Video Transcode Cancelled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithObject:forKey:", v6, *MEMORY[0x1E0CB2D50]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("PLVideoTranscoderErrorDomain"), 1, v7);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v2 == 4)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v4 = (void *)MEMORY[0x1E0C99D80];
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Error: Video Transcode failed : %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithObject:forKey:", v8, *MEMORY[0x1E0CB2D50]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("PLVideoTranscoderErrorDomain"), 0, v9);
    v14 = objc_claimAutoreleasedReturnValue();

LABEL_5:
    v12 = (void *)v14;
    goto LABEL_7;
  }
  v12 = 0;
LABEL_7:
  v13 = a1[5];
  if (v13)
  {
    v15 = v12;
    (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, a1[4]);
    v12 = v15;
  }

}

@end
