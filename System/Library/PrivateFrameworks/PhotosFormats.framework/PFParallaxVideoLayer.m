@implementation PFParallaxVideoLayer

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[PFParallaxVideoLayer videoData](self, "videoData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "writeToURL:options:error:", v6, 1, a4);

  return (char)a4;
}

- (id)fileExtension
{
  return CFSTR("MOV");
}

- (PFParallaxVideoLayer)initWithVideoData:(id)a3 frame:(CGRect)a4 zPosition:(double)a5 identifier:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  NSData *v13;
  PFParallaxVideoLayer *v14;
  NSData *videoData;
  NSData *v16;
  uint64_t v17;
  AVAsset *video;
  objc_super v20;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = (NSData *)a3;
  v20.receiver = self;
  v20.super_class = (Class)PFParallaxVideoLayer;
  v14 = -[PFParallaxLayer initWithFrame:zPosition:identifier:](&v20, sel_initWithFrame_zPosition_identifier_, a6, x, y, width, height, a5);
  videoData = v14->_videoData;
  v14->_videoData = v13;
  v16 = v13;

  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithData:contentType:options:", v16, *MEMORY[0x1E0C8A2E8], MEMORY[0x1E0C9AA70]);
  v17 = objc_claimAutoreleasedReturnValue();
  video = v14->_video;
  v14->_video = (AVAsset *)v17;

  return v14;
}

- (id)layerByUpdatingFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  PFParallaxVideoLayer *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  PFParallaxVideoLayer *v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = [PFParallaxVideoLayer alloc];
  -[PFParallaxVideoLayer videoData](self, "videoData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFParallaxLayer zPosition](self, "zPosition");
  v11 = v10;
  -[PFParallaxLayer identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PFParallaxVideoLayer initWithVideoData:frame:zPosition:identifier:](v8, "initWithVideoData:frame:zPosition:identifier:", v9, v12, x, y, width, height, v11);

  return v13;
}

- (CGSize)pixelSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  +[PFMediaUtilities tracksWithMediaType:forAsset:](PFMediaUtilities, "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A808], self->_video);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "naturalSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (AVAsset)video
{
  return self->_video;
}

- (NSData)videoData
{
  return self->_videoData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoData, 0);
  objc_storeStrong((id *)&self->_video, 0);
}

@end
