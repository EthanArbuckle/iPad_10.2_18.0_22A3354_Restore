@implementation VKCRemoveBackgroundVideoPreviewResult

- (VKCRemoveBackgroundVideoPreviewResult)initWithMADVideoPreviewResult:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  VKCRemoveBackgroundVideoPreviewResult *v9;
  VKCRemoveBackgroundVideoPreviewResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VKCRemoveBackgroundVideoPreviewResult;
  v9 = -[VKCRemoveBackgroundVideoPreviewResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_madResult, a3);
    v10->_successful = v7 != 0;
    objc_storeStrong((id *)&v10->_error, a4);
  }

  return v10;
}

- ($0FD61D44AD30C1CDCD15B60AC4039C90)timeRange
{
  $0FD61D44AD30C1CDCD15B60AC4039C90 *result;

  result = ($0FD61D44AD30C1CDCD15B60AC4039C90 *)self->_madResult;
  if (result)
    return ($0FD61D44AD30C1CDCD15B60AC4039C90 *)-[$0FD61D44AD30C1CDCD15B60AC4039C90 timeRange](result, "timeRange");
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return result;
}

- (CGRect)normalizedCropRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_MADVideoRemoveBackgroundPreviewResult normalizedCropRect](self->_madResult, "normalizedCropRect");
  }
  else
  {
    v3 = 0.0;
    v4 = 0.0;
    v5 = 1.0;
    v6 = 1.0;
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)subjectMatteAtCompositionTime:(id *)a3
{
  _MADVideoRemoveBackgroundPreviewResult *madResult;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CMTime time1;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CMTime lhs;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CMTime rhs;
  CMTime v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  memset(&v25, 0, sizeof(v25));
  madResult = self->_madResult;
  if (madResult)
  {
    -[_MADVideoRemoveBackgroundPreviewResult timeRange](madResult, "timeRange");
  }
  else
  {
    v22 = 0u;
    v23 = 0u;
    v21 = 0u;
  }
  *(_OWORD *)&rhs.value = v21;
  rhs.epoch = v22;
  lhs = (CMTime)*a3;
  CMTimeSubtract(&v25, &lhs, &rhs);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_MADVideoRemoveBackgroundPreviewResult frames](self->_madResult, "frames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (!v7)
  {

LABEL_18:
    v13 = 0;
    return v13;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v17;
LABEL_6:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v17 != v10)
      objc_enumerationMutation(v6);
    v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
    if (v12)
      objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "presentationTimeStamp");
    else
      memset(&time1, 0, sizeof(time1));
    lhs = v25;
    if (CMTimeCompare(&time1, &lhs) == 1)
      break;
    v9 = objc_msgSend(v12, "pixelBuffer");
    if (v8 == ++v11)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
      if (v8)
        goto LABEL_6;
      break;
    }
  }

  if (!v9)
    goto LABEL_18;
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  return v13;
}

- (id)subjectMatteForImage:(id)a3 atCompositionTime:(id *)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  CGAffineTransform v16;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;

  v6 = a3;
  v17 = *a4;
  -[VKCRemoveBackgroundVideoPreviewResult subjectMatteAtCompositionTime:](self, "subjectMatteAtCompositionTime:", &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "extent");
    v9 = v8;
    v11 = v10;
    objc_msgSend(v7, "extent");
    if (v12 != 0.0 && v13 != 0.0)
    {
      CGAffineTransformMakeScale(&v16, v9 / v12, v11 / v13);
      objc_msgSend(v7, "imageByApplyingTransform:", &v16);
      v14 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v14;
    }
  }

  return v7;
}

- (BOOL)successful
{
  return self->_successful;
}

- (void)setSuccessful:(BOOL)a3
{
  self->_successful = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_madResult, 0);
}

@end
