@implementation _RCTimeRangeFileInputWaveformDataSource

- (void)saveGeneratedWaveformIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  objc_super v7;

  if (!self->_isDecomposedFragment)
    goto LABEL_3;
  -[RCWaveformDataSource generatedWaveformOutputURL](self, "generatedWaveformOutputURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if ((v6 & 1) == 0)
  {
LABEL_3:
    v7.receiver = self;
    v7.super_class = (Class)_RCTimeRangeFileInputWaveformDataSource;
    -[RCFileInputWaveformDataSource saveGeneratedWaveformIfNecessary](&v7, sel_saveGeneratedWaveformIfNecessary);
  }
}

- (BOOL)isDecomposedFragment
{
  return self->_isDecomposedFragment;
}

- (void)setIsDecomposedFragment:(BOOL)a3
{
  self->_isDecomposedFragment = a3;
}

@end
