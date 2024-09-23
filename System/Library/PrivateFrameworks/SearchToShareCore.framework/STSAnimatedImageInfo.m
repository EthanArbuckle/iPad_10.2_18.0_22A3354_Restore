@implementation STSAnimatedImageInfo

- (CGSize)size
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

  -[STSAnimatedImageInfo frames](self, "frames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "size");
    v5 = v4;
    v7 = v6;
  }
  else
  {
    v5 = *MEMORY[0x24BDBF148];
    v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (NSArray)frames
{
  return self->_frames;
}

- (void)setFrames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frames, 0);
}

@end
