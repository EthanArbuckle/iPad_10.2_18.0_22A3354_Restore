@implementation PLFeatureProcessingAlgorithmVersionProvider

- (PLFeatureProcessingAlgorithmVersionProvider)init
{
  PLFeatureProcessingAlgorithmVersionProvider *v2;
  PLFeatureProcessingAlgorithmVersionProvider *v3;
  PLFeatureProcessingAlgorithmVersionProvider *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLFeatureProcessingAlgorithmVersionProvider;
  v2 = -[PLFeatureProcessingAlgorithmVersionProvider init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (signed)sceneAnalysisVersion
{
  return self->_sceneAnalysisVersion;
}

- (void)setSceneAnalysisVersion:(signed __int16)a3
{
  self->_sceneAnalysisVersion = a3;
}

- (signed)faceAnalysisVersion
{
  return self->_faceAnalysisVersion;
}

- (void)setFaceAnalysisVersion:(signed __int16)a3
{
  self->_faceAnalysisVersion = a3;
}

- (signed)characterRecognitionAlgorithmVersion
{
  return self->_characterRecognitionAlgorithmVersion;
}

- (void)setCharacterRecognitionAlgorithmVersion:(signed __int16)a3
{
  self->_characterRecognitionAlgorithmVersion = a3;
}

- (signed)visualSearchAlgorithmVersion
{
  return self->_visualSearchAlgorithmVersion;
}

- (void)setVisualSearchAlgorithmVersion:(signed __int16)a3
{
  self->_visualSearchAlgorithmVersion = a3;
}

- (signed)stickerConfidenceAlgorithmVersion
{
  return self->_stickerConfidenceAlgorithmVersion;
}

- (void)setStickerConfidenceAlgorithmVersion:(signed __int16)a3
{
  self->_stickerConfidenceAlgorithmVersion = a3;
}

- (signed)vaAnalysisVersion
{
  return self->_vaAnalysisVersion;
}

- (void)setVaAnalysisVersion:(signed __int16)a3
{
  self->_vaAnalysisVersion = a3;
}

- (unint64_t)mediaAnalysisVersion
{
  return self->_mediaAnalysisVersion;
}

- (void)setMediaAnalysisVersion:(unint64_t)a3
{
  self->_mediaAnalysisVersion = a3;
}

- (signed)mediaAnalysisImageVersion
{
  return self->_mediaAnalysisImageVersion;
}

- (void)setMediaAnalysisImageVersion:(signed __int16)a3
{
  self->_mediaAnalysisImageVersion = a3;
}

- (signed)vaLocationAnalysisVersion
{
  return self->_vaLocationAnalysisVersion;
}

- (void)setVaLocationAnalysisVersion:(signed __int16)a3
{
  self->_vaLocationAnalysisVersion = a3;
}

- (signed)captionGenerationVersion
{
  return self->_captionGenerationVersion;
}

- (void)setCaptionGenerationVersion:(signed __int16)a3
{
  self->_captionGenerationVersion = a3;
}

- (signed)imageEmbeddingVersion
{
  return self->_imageEmbeddingVersion;
}

- (void)setImageEmbeddingVersion:(signed __int16)a3
{
  self->_imageEmbeddingVersion = a3;
}

- (signed)videoEmbeddingVersion
{
  return self->_videoEmbeddingVersion;
}

- (void)setVideoEmbeddingVersion:(signed __int16)a3
{
  self->_videoEmbeddingVersion = a3;
}

+ (id)provider
{
  id v2;
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

  v2 = objc_alloc_init((Class)a1);
  +[PLMediaAnalysisServiceRequestAdapter currentSceneVersion](PLMediaAnalysisServiceRequestAdapter, "currentSceneVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSceneAnalysisVersion:", objc_msgSend(v3, "shortValue"));

  +[PLMediaAnalysisServiceRequestAdapter currentFaceVersion](PLMediaAnalysisServiceRequestAdapter, "currentFaceVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFaceAnalysisVersion:", objc_msgSend(v4, "shortValue"));

  +[PLMediaAnalysisServiceRequestAdapter currentOCRAlgorithmVersion](PLMediaAnalysisServiceRequestAdapter, "currentOCRAlgorithmVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCharacterRecognitionAlgorithmVersion:", objc_msgSend(v5, "shortValue"));

  +[PLMediaAnalysisServiceRequestAdapter currentVisualSearchAlgorithmVersion](PLMediaAnalysisServiceRequestAdapter, "currentVisualSearchAlgorithmVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setVisualSearchAlgorithmVersion:", objc_msgSend(v6, "shortValue"));

  +[PLMediaAnalysisServiceRequestAdapter currentStickerConfidenceAlgorithmVersion](PLMediaAnalysisServiceRequestAdapter, "currentStickerConfidenceAlgorithmVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setStickerConfidenceAlgorithmVersion:", objc_msgSend(v7, "shortValue"));

  +[PLMediaAnalysisServiceRequestAdapter currentVaAnalysisAlgorithmVersion](PLMediaAnalysisServiceRequestAdapter, "currentVaAnalysisAlgorithmVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setVaAnalysisVersion:", objc_msgSend(v8, "shortValue"));

  +[PLMediaAnalysisServiceRequestAdapter currentVaLocationAnalysisAlgorithmVersion](PLMediaAnalysisServiceRequestAdapter, "currentVaLocationAnalysisAlgorithmVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setVaLocationAnalysisVersion:", objc_msgSend(v9, "shortValue"));

  +[PLMediaAnalysisServiceRequestAdapter currentMediaAnalysisVersion](PLMediaAnalysisServiceRequestAdapter, "currentMediaAnalysisVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMediaAnalysisVersion:", objc_msgSend(v10, "unsignedLongLongValue"));

  +[PLMediaAnalysisServiceRequestAdapter currentMediaAnalysisImageVersion](PLMediaAnalysisServiceRequestAdapter, "currentMediaAnalysisImageVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMediaAnalysisImageVersion:", objc_msgSend(v11, "shortValue"));

  +[PLMediaAnalysisServiceRequestAdapter currentCaptionGenerationVersion](PLMediaAnalysisServiceRequestAdapter, "currentCaptionGenerationVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCaptionGenerationVersion:", objc_msgSend(v12, "shortValue"));

  +[PLMediaAnalysisServiceRequestAdapter currentImageEmbeddingVersion](PLMediaAnalysisServiceRequestAdapter, "currentImageEmbeddingVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImageEmbeddingVersion:", objc_msgSend(v13, "shortValue"));

  +[PLMediaAnalysisServiceRequestAdapter currentVideoEmbeddingVersion](PLMediaAnalysisServiceRequestAdapter, "currentVideoEmbeddingVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setVideoEmbeddingVersion:", objc_msgSend(v14, "shortValue"));

  objc_msgSend(v2, "setSceneAnalysisVersion:", 1);
  objc_msgSend(v2, "setFaceAnalysisVersion:", 1);
  objc_msgSend(v2, "setMediaAnalysisVersion:", 64);
  objc_msgSend(v2, "setMediaAnalysisImageVersion:", 64);
  return v2;
}

+ (id)descriptionForVersionProvider:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[12];
  _QWORD v24[14];

  v24[12] = *MEMORY[0x1E0C80C00];
  v23[0] = CFSTR("scene");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a3;
  objc_msgSend(v3, "numberWithShort:", objc_msgSend(v4, "sceneAnalysisVersion"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v23[1] = CFSTR("face");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v4, "faceAnalysisVersion"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  v23[2] = CFSTR("ocr");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v4, "characterRecognitionAlgorithmVersion"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v20;
  v23[3] = CFSTR("vsearch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v4, "visualSearchAlgorithmVersion"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v19;
  v23[4] = CFSTR("sticker");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v4, "stickerConfidenceAlgorithmVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v5;
  v23[5] = CFSTR("va");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v4, "vaAnalysisVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v6;
  v23[6] = CFSTR("valoc");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v4, "vaLocationAnalysisVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v7;
  v23[7] = CFSTR("media");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "mediaAnalysisVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v8;
  v23[8] = CFSTR("mediai");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v4, "mediaAnalysisImageVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v9;
  v23[9] = CFSTR("caption");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v4, "captionGenerationVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v10;
  v23[10] = CFSTR("embed");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v4, "imageEmbeddingVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[10] = v11;
  v23[11] = CFSTR("vembed");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = objc_msgSend(v4, "videoEmbeddingVersion");

  objc_msgSend(v12, "numberWithShort:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[11] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v15, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v16, 4);

  return v17;
}

@end
