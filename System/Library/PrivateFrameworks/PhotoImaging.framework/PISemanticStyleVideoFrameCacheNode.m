@implementation PISemanticStyleVideoFrameCacheNode

- (id)evaluateSettings:(id)a3 pipelineState:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  CFDictionaryRef v8;
  CMTime time;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  if (v6)
    objc_msgSend(v6, "time");
  else
    memset(&time, 0, sizeof(time));
  v8 = CMTimeCopyAsDictionary(&time, 0);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("time"));

  return v7;
}

- (id)newRenderRequestWithOriginalRequest:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v5 = (objc_class *)MEMORY[0x1E0D52338];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithRequest:", v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52248]), "initWithPurpose:", 2);
  objc_msgSend(v7, "setRenderContext:", v8);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__PISemanticStyleVideoFrameCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke;
  v10[3] = &unk_1E5016CB8;
  v10[4] = self;
  objc_msgSend(v7, "setCompletionBlock:", v10);
  return v7;
}

- (void)resolveSourceWithVideo:(id)a3 videoComposition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const __CFDictionary *v9;
  const void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  CMTime v15;
  id v16;
  CMTime v17;

  memset(&v17, 0, sizeof(v17));
  v6 = a4;
  v7 = a3;
  -[NURenderNode settings](self, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("time"));
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CMTimeMakeFromDictionary(&v17, v9);

  v16 = 0;
  v15 = v17;
  v10 = (const void *)objc_msgSend(MEMORY[0x1E0D52348], "readVideoFrameAtTime:fromAsset:outputSettings:videoComposition:auxiliaryImageType:error:", &v15, v7, 0, v6, 1, &v16);

  v11 = v16;
  if (v10)
  {
    -[PISemanticStyleVideoFrameCacheNode resolveSourceWithPixelBuffer:](self, "resolveSourceWithPixelBuffer:", v10);
    CFRelease(v10);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0D520A0];
    v15 = v17;
    NUStringFromTime();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Could not read video frame at time"), v13, v11);
    v14 = objc_claimAutoreleasedReturnValue();

    -[NUCacheNode resolveWithSourceNode:error:](self, "resolveWithSourceNode:error:", 0, v14);
    v11 = (id)v14;
  }

}

- (void)resolveSourceWithPixelBuffer:(__CVBuffer *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDC8]), "initWithCVPixelBuffer:", a3);
  -[NUMemoryCacheNode persistentURL](self, "persistentURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D52038]), "initWithImage:identifier:orientation:", v7, v5, 1);
  -[NUCacheNode resolveWithSourceNode:error:](self, "resolveWithSourceNode:error:", v6, 0);

}

void __80__PISemanticStyleVideoFrameCacheNode_newRenderRequestWithOriginalRequest_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = 0;
  objc_msgSend(a2, "result:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  v5 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "avAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "avVideoComposition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resolveSourceWithVideo:videoComposition:", v6, v7);

  }
  else
  {
    objc_msgSend(v5, "resolveWithSourceNode:error:", 0, v4);
  }

}

@end
