@implementation PLSearchDonationProgressVersionProvider

- (PLSearchDonationProgressVersionProvider)init
{
  PLSearchDonationProgressVersionProvider *v2;
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
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PLSearchDonationProgressVersionProvider;
  v2 = -[PLSearchDonationProgressVersionProvider init](&v16, sel_init);
  if (v2)
  {
    +[PLMediaAnalysisServiceRequestAdapter currentOCRAlgorithmVersion](PLMediaAnalysisServiceRequestAdapter, "currentOCRAlgorithmVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_characterRecognitionAlgorithmVersion = objc_msgSend(v3, "shortValue");

    +[PLMediaAnalysisServiceRequestAdapter currentFaceVersion](PLMediaAnalysisServiceRequestAdapter, "currentFaceVersion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_faceAnalysisVersion = objc_msgSend(v4, "shortValue");

    +[PLMediaAnalysisServiceRequestAdapter currentMediaAnalysisImageVersion](PLMediaAnalysisServiceRequestAdapter, "currentMediaAnalysisImageVersion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_mediaAnalysisImageVersion = objc_msgSend(v5, "shortValue");

    +[PLMediaAnalysisServiceRequestAdapter currentMediaAnalysisVersion](PLMediaAnalysisServiceRequestAdapter, "currentMediaAnalysisVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_mediaAnalysisVersion = objc_msgSend(v6, "unsignedLongLongValue");

    +[PLMediaAnalysisServiceRequestAdapter currentSceneVersion](PLMediaAnalysisServiceRequestAdapter, "currentSceneVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_sceneAnalysisVersion = objc_msgSend(v7, "shortValue");

    +[PLMediaAnalysisServiceRequestAdapter currentImageEmbeddingVersion](PLMediaAnalysisServiceRequestAdapter, "currentImageEmbeddingVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_imageEmbeddingVersion = objc_msgSend(v8, "shortValue");

    +[PLMediaAnalysisServiceRequestAdapter currentVideoEmbeddingVersion](PLMediaAnalysisServiceRequestAdapter, "currentVideoEmbeddingVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_videoEmbeddingVersion = objc_msgSend(v9, "shortValue");

    +[PLMediaAnalysisServiceRequestAdapter currentStickerConfidenceAlgorithmVersion](PLMediaAnalysisServiceRequestAdapter, "currentStickerConfidenceAlgorithmVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_stickerConfidenceAlgorithmVersion = objc_msgSend(v10, "shortValue");

    +[PLMediaAnalysisServiceRequestAdapter currentVaAnalysisAlgorithmVersion](PLMediaAnalysisServiceRequestAdapter, "currentVaAnalysisAlgorithmVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_vaAnalysisVersion = objc_msgSend(v11, "shortValue");

    +[PLMediaAnalysisServiceRequestAdapter currentVaLocationAnalysisAlgorithmVersion](PLMediaAnalysisServiceRequestAdapter, "currentVaLocationAnalysisAlgorithmVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_vaLocationAnalysisVersion = objc_msgSend(v12, "shortValue");

    +[PLMediaAnalysisServiceRequestAdapter currentVisualSearchAlgorithmVersion](PLMediaAnalysisServiceRequestAdapter, "currentVisualSearchAlgorithmVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_visualSearchAlgorithmVersion = objc_msgSend(v13, "shortValue");

    +[PLMediaAnalysisServiceRequestAdapter currentCaptionGenerationVersion](PLMediaAnalysisServiceRequestAdapter, "currentCaptionGenerationVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_captionGenerationVersion = objc_msgSend(v14, "shortValue");

  }
  return v2;
}

- (signed)captionGenerationVersion
{
  return self->_captionGenerationVersion;
}

- (void)setCaptionGenerationVersion:(signed __int16)a3
{
  self->_captionGenerationVersion = a3;
}

- (signed)characterRecognitionAlgorithmVersion
{
  return self->_characterRecognitionAlgorithmVersion;
}

- (void)setCharacterRecognitionAlgorithmVersion:(signed __int16)a3
{
  self->_characterRecognitionAlgorithmVersion = a3;
}

- (signed)faceAnalysisVersion
{
  return self->_faceAnalysisVersion;
}

- (void)setFaceAnalysisVersion:(signed __int16)a3
{
  self->_faceAnalysisVersion = a3;
}

- (signed)mediaAnalysisImageVersion
{
  return self->_mediaAnalysisImageVersion;
}

- (void)setMediaAnalysisImageVersion:(signed __int16)a3
{
  self->_mediaAnalysisImageVersion = a3;
}

- (unint64_t)mediaAnalysisVersion
{
  return self->_mediaAnalysisVersion;
}

- (void)setMediaAnalysisVersion:(unint64_t)a3
{
  self->_mediaAnalysisVersion = a3;
}

- (signed)sceneAnalysisVersion
{
  return self->_sceneAnalysisVersion;
}

- (void)setSceneAnalysisVersion:(signed __int16)a3
{
  self->_sceneAnalysisVersion = a3;
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

- (signed)vaLocationAnalysisVersion
{
  return self->_vaLocationAnalysisVersion;
}

- (void)setVaLocationAnalysisVersion:(signed __int16)a3
{
  self->_vaLocationAnalysisVersion = a3;
}

- (signed)visualSearchAlgorithmVersion
{
  return self->_visualSearchAlgorithmVersion;
}

- (void)setVisualSearchAlgorithmVersion:(signed __int16)a3
{
  self->_visualSearchAlgorithmVersion = a3;
}

@end
