@implementation PXImageAssetUIImageProvider

- (int64_t)requestImageForAsset:(id)a3 targetSize:(CGSize)a4 contentMode:(int64_t)a5 options:(id)a6 resultHandler:(id)a7
{
  id v10;
  void *v11;
  int *p_mediaRequestID;
  signed int v13;

  v10 = a7;
  objc_msgSend(a3, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))a7 + 2))(v10, v11, 0);

  p_mediaRequestID = &self->_mediaRequestID;
  do
    v13 = __ldaxr((unsigned int *)p_mediaRequestID);
  while (__stlxr(v13 + 1, (unsigned int *)p_mediaRequestID));
  return v13;
}

@end
