@implementation PTAssetReaderCustomCompositor

- (BOOL)canConformColorOfSourceFrames
{
  return 1;
}

- (BOOL)supportsHDRSourceFrames
{
  return 1;
}

- (NSDictionary)sourcePixelBufferAttributes
{
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CA8FF0];
  v4[0] = *MEMORY[0x1E0CA9040];
  v4[1] = v2;
  v5[0] = &unk_1E8252E08;
  v5[1] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)requiredPixelBufferAttributesForRenderContext
{
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CA8FF0];
  v4[0] = *MEMORY[0x1E0CA9040];
  v4[1] = v2;
  v5[0] = &unk_1E8252E20;
  v5[1] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)startVideoCompositionRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PTAssetReaderComposedFrame *v9;
  void *v10;
  PTAssetReaderComposedFrame *v11;
  void *v12;
  _QWORD v13[3];

  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA3ACDC]();
  objc_msgSend(v3, "videoCompositionInstruction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "sourceFrameByTrackID:", objc_msgSend(v5, "videTrackID"));
  v7 = objc_msgSend(v3, "sourceFrameByTrackID:", objc_msgSend(v5, "auxvTrackID"));
  if (v6)
  {
    v8 = v7;
    v9 = [PTAssetReaderComposedFrame alloc];
    if (v3)
      objc_msgSend(v3, "compositionTime");
    else
      memset(v13, 0, sizeof(v13));
    v11 = -[PTAssetReaderComposedFrame initWithTime:colorBuffer:auxBuffer:](v9, "initWithTime:colorBuffer:auxBuffer:", v13, v6, v8);
    objc_msgSend(v5, "assetReader");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pushComposedFrame:", v11);

    objc_msgSend(v3, "finishWithComposedVideoFrame:", v6);
  }
  else
  {
    AssetReaderError(CFSTR("Did not receive videoBuffer from async request"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithError:", v10);

  }
  objc_autoreleasePoolPop(v4);

}

@end
