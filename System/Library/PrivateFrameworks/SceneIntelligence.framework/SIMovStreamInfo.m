@implementation SIMovStreamInfo

- (id)initInfoWithTrackName:(id)a3 frameRate:(double)a4 pixelBufferFormat:(unsigned int)a5 resolution:(CGSize)a6
{
  CGFloat height;
  CGFloat width;
  id v12;
  SIMovStreamInfo *v13;
  SIMovStreamInfo *v14;
  SIMovStreamInfo *v15;
  objc_super v17;

  height = a6.height;
  width = a6.width;
  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SIMovStreamInfo;
  v13 = -[SIMovStreamInfo init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a3);
    v14->_frameRate = a4;
    v14->_format = a5;
    v14->_resolution.width = width;
    v14->_resolution.height = height;
    v15 = v14;
  }

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v13.receiver = self;
  v13.super_class = (Class)SIMovStreamInfo;
  -[SIMovStreamInfo description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIMovStreamInfo name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SIMovStreamInfo frameRate](self, "frameRate");
  SIPixelFormatToStr(-[SIMovStreamInfo format](self, "format"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIMovStreamInfo resolution](self, "resolution");
  v9 = v8;
  -[SIMovStreamInfo resolution](self, "resolution");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\nName: %@ \n Frame rate: %d \n Format: %@ \n Resolution: (%f, %f) \n"), v4, v5, v6, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)frameRate
{
  return self->_frameRate;
}

- (unsigned)format
{
  return self->_format;
}

- (CGSize)resolution
{
  double width;
  double height;
  CGSize result;

  width = self->_resolution.width;
  height = self->_resolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int)readCycle
{
  return self->_readCycle;
}

- (void)setReadCycle:(int)a3
{
  self->_readCycle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
