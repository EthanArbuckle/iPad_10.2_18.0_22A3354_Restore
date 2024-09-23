@implementation _PXStoryDisplayAssetsInfo

- (_PXStoryDisplayAssetsInfo)init
{
  _PXStoryDisplayAssetsInfo *v2;
  _PXStoryDisplayAssetsFetchResult *v3;
  _PXStoryDisplayAssetsFetchResult *displayAssets;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PXStoryDisplayAssetsInfo;
  v2 = -[_PXStoryDisplayAssetsInfo init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_PXStoryDisplayAssetsFetchResult);
    displayAssets = v2->_displayAssets;
    v2->_displayAssets = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_originalPlaybackStyles);
  free(self->_nUpPlaybackStyles);
  free(self->_assetContentInfos);
  v3.receiver = self;
  v3.super_class = (Class)_PXStoryDisplayAssetsInfo;
  -[_PXStoryDisplayAssetsInfo dealloc](&v3, sel_dealloc);
}

- (void)configureWithRange:(_NSRange)a3 resourcesDataSource:(id)a4 timelineStyle:(id)a5 nUpPlaybackStyleMapping:(const int64_t *)a6
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  int v13;
  uint64_t v14;
  int64_t v15;
  void *v16;
  uint64_t v17;
  $60B83496CA56D3588CF925FE7FBD90DC *assetContentInfos;
  PXStoryTimelineStyle *timelineStyle;
  _OWORD *p_width;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  length = a3.length;
  location = a3.location;
  v12 = a5;
  -[_PXStoryDisplayAssetsFetchResult configureWithRange:resourcesDataSource:](self->_displayAssets, "configureWithRange:resourcesDataSource:", location, length, a4);
  objc_storeStrong((id *)&self->_timelineStyle, a5);
  self->_count = -[_PXStoryDisplayAssetsFetchResult configuredCount](self->_displayAssets, "configuredCount");
  *(_QWORD *)&v21 = self->_capacity;
  v13 = _PXGArrayCapacityResizeToCount();
  self->_capacity = v21;
  if (v13)
  {
    _PXGArrayResize();
    _PXGArrayResize();
  }
  if (self->_count >= 1)
  {
    v14 = 0;
    v15 = 0;
    do
    {
      -[_PXStoryDisplayAssetsFetchResult storyDisplayAssetAtIndex:](self->_displayAssets, "storyDisplayAssetAtIndex:", v15, (_QWORD)v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "playbackStyle");
      self->_originalPlaybackStyles[v15] = v17;
      self->_oneUpPlaybackStyle = 0;
      self->_nUpPlaybackStyles[v15] = a6[v17];
      assetContentInfos = self->_assetContentInfos;
      timelineStyle = self->_timelineStyle;
      if (timelineStyle)
      {
        -[PXStoryTimelineStyle contentInfoForDisplayAsset:](timelineStyle, "contentInfoForDisplayAsset:", v16);
      }
      else
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v21 = 0u;
      }
      p_width = (_OWORD *)&assetContentInfos[v14].var0.width;
      *p_width = v21;
      p_width[3] = v24;
      p_width[4] = v25;
      p_width[1] = v22;
      p_width[2] = v23;
      p_width[7] = v28;
      p_width[8] = v29;
      p_width[5] = v26;
      p_width[6] = v27;

      ++v15;
      ++v14;
    }
    while (v15 < self->_count);
  }

}

- (id)displayAssetsWithCount:(int64_t)a3
{
  -[_PXStoryDisplayAssetsFetchResult setCount:](self->_displayAssets, "setCount:", a3);
  return self->_displayAssets;
}

- (const)originalPlaybackStyles
{
  return self->_originalPlaybackStyles;
}

- (const)oneUpPlaybackStyles
{
  int64_t *p_oneUpPlaybackStyle;
  void *v4;

  p_oneUpPlaybackStyle = &self->_oneUpPlaybackStyle;
  if (!self->_oneUpPlaybackStyle && self->_count >= 1)
  {
    -[_PXStoryDisplayAssetsFetchResult storyDisplayAssetAtIndex:](self->_displayAssets, "storyDisplayAssetAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_oneUpPlaybackStyle = -[PXStoryTimelineStyle finalOneUpPlaybackStyleForDisplayAsset:originalPlaybackStyle:](self->_timelineStyle, "finalOneUpPlaybackStyleForDisplayAsset:originalPlaybackStyle:", v4, *self->_originalPlaybackStyles);

  }
  return p_oneUpPlaybackStyle;
}

- (const)nUpPlaybackStyles
{
  return self->_nUpPlaybackStyles;
}

- (int64_t)count
{
  return self->_count;
}

- (const)assetContentInfos
{
  return self->_assetContentInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timelineStyle, 0);
  objc_storeStrong((id *)&self->_displayAssets, 0);
}

@end
