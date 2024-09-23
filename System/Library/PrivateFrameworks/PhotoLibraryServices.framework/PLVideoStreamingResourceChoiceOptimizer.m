@implementation PLVideoStreamingResourceChoiceOptimizer

- (PLVideoStreamingResourceChoiceOptimizer)initWithVideoResources:(id)a3
{
  id v5;
  PLVideoStreamingResourceChoiceOptimizer *v6;
  PLVideoStreamingResourceChoiceOptimizer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLVideoStreamingResourceChoiceOptimizer;
  v6 = -[PLVideoStreamingResourceChoiceOptimizer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_videoResources, a3);

  return v7;
}

- (NSArray)preferredVideoResources
{
  NSArray *streamableVideos;
  id v4;
  NSArray *videoResources;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  _QWORD v10[4];
  NSArray *v11;

  streamableVideos = self->_streamableVideos;
  if (!streamableVideos)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    videoResources = self->_videoResources;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__PLVideoStreamingResourceChoiceOptimizer_preferredVideoResources__block_invoke;
    v10[3] = &unk_1E366A2E0;
    v6 = (NSArray *)v4;
    v11 = v6;
    -[NSArray enumerateObjectsUsingBlock:](videoResources, "enumerateObjectsUsingBlock:", v10);
    v7 = self->_streamableVideos;
    self->_streamableVideos = v6;
    v8 = v6;

    streamableVideos = self->_streamableVideos;
  }
  return streamableVideos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamableVideos, 0);
  objc_storeStrong((id *)&self->_videoResources, 0);
}

void __66__PLVideoStreamingResourceChoiceOptimizer_preferredVideoResources__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isStreamable"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
