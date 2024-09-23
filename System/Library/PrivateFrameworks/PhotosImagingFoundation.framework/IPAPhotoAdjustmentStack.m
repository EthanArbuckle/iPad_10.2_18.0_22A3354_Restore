@implementation IPAPhotoAdjustmentStack

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IPAPhotoAdjustmentStack;
  v4 = -[IPAAdjustmentStack copyWithZone:](&v6, sel_copyWithZone_, a3);
  *(PFIntSize_st *)(v4 + 40) = self->_inputSize;
  *((_QWORD *)v4 + 3) = self->_orientation;
  objc_storeStrong((id *)v4 + 4, self->_pipeline);
  return v4;
}

- (id)minimumVersionForFormat:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.photo")))
  {
    v5 = CFSTR("1.4");
    v6 = CFSTR("1.4");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)IPAPhotoAdjustmentStack;
    -[IPAAdjustmentStack minimumVersionForFormat:](&v8, sel_minimumVersionForFormat_, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)maskUUIDs
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[IPAAdjustmentStack adjustments](self, "adjustments", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "maskUUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          if (!v5)
          {
            objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v5, "addObject:", v8);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithOrderedSet:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_debugDescriptionSuffix
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inputSize(w:%lu,h:%lu) orientation=%lu pipeline=%@ >"), self->_inputSize.width, self->_inputSize.height, self->_orientation, self->_pipeline);
}

- (PFIntSize_st)inputSize
{
  PFIntSize_st *p_inputSize;
  unint64_t width;
  unint64_t height;
  PFIntSize_st result;

  p_inputSize = &self->_inputSize;
  width = self->_inputSize.width;
  height = p_inputSize->height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInputSize:(PFIntSize_st)a3
{
  self->_inputSize = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (IPAPhotoAdjustmentPipeline)pipeline
{
  return self->_pipeline;
}

- (void)setPipeline:(id)a3
{
  objc_storeStrong((id *)&self->_pipeline, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipeline, 0);
}

@end
