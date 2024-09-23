@implementation _PISegmentationNullAsset

- (NSString)localIdentifier
{
  return (NSString *)CFSTR("Null");
}

- (int)loadParallaxResource:(int64_t)a3 options:(id)a4 resultHandler:(id)a5
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0D520A0];
  v7 = a5;
  objc_msgSend(v6, "unsupportedError:object:", CFSTR("Not available"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a5 + 2))(v7, 0, v8);

  return 0;
}

- (BOOL)supportsSegmentationResourceCaching
{
  return 0;
}

- (NSURL)segmentationResourceURL
{
  return 0;
}

- (BOOL)clearSegmentationResourceCacheWithError:(id *)a3
{
  return 1;
}

- (int)loadPetsRegionsWithOptions:(id)a3 resultHandler:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0D520A0];
  v6 = a4;
  objc_msgSend(v5, "unsupportedError:object:", CFSTR("Not available"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, void *))a4 + 2))(v6, 0, 0, v7);

  return 0;
}

- (int)loadMotionScore:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0D520A0];
  v5 = a3;
  objc_msgSend(v4, "unsupportedError:object:", CFSTR("Not available"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, float))a3 + 2))(v5, v6, -1.0);

  return 0;
}

- (CGRect)preferredCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->preferredCropRect.origin.x;
  y = self->preferredCropRect.origin.y;
  width = self->preferredCropRect.size.width;
  height = self->preferredCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)acceptableCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->acceptableCropRect.origin.x;
  y = self->acceptableCropRect.origin.y;
  width = self->acceptableCropRect.size.width;
  height = self->acceptableCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSArray)faceRegions
{
  return self->faceRegions;
}

- (NSArray)petRegions
{
  return self->petRegions;
}

- (CGRect)gazeAreaRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->gazeAreaRect.origin.x;
  y = self->gazeAreaRect.origin.y;
  width = self->gazeAreaRect.size.width;
  height = self->gazeAreaRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->petRegions, 0);
  objc_storeStrong((id *)&self->faceRegions, 0);
}

@end
