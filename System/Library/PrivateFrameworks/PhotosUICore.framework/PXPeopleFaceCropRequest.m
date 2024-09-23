@implementation PXPeopleFaceCropRequest

- (PXPeopleFaceCropRequest)initWithFetchOptions:(id)a3
{
  id v5;
  PXPeopleFaceCropRequest *v6;
  PXPeopleFaceCropRequest *v7;
  CGFloat v8;
  CGFloat v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PXPeopleFaceCropRequest;
  v6 = -[PXPeopleFaceCropRequest init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_options, a3);
    v7->_faceCropRequestID = +[PXPeopleFaceCropRequest generateUniqueRequestID](PXPeopleFaceCropRequest, "generateUniqueRequestID");
    objc_msgSend(v5, "targetPixelSize");
    v7->_targetSizeToUse.width = v8;
    v7->_targetSizeToUse.height = v9;
  }

  return v7;
}

- (void)setNormalizedEdgeAdjustedCropRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((PXRectIdenticalToRect() & 1) == 0)
  {
    self->_normalizedEdgeAdjustedCropRect.origin.x = x;
    self->_normalizedEdgeAdjustedCropRect.origin.y = y;
    self->_normalizedEdgeAdjustedCropRect.size.width = width;
    self->_normalizedEdgeAdjustedCropRect.size.height = height;
    -[PXPeopleFaceCropRequest options](self, "options");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "targetPixelSize");

    PXRectDenormalize();
    PXRectFlippedVertically();
    PXRectNormalize();
    self->_flippedNormalizedEdgeAdjustedCropRect.origin.x = v9;
    self->_flippedNormalizedEdgeAdjustedCropRect.origin.y = v10;
    self->_flippedNormalizedEdgeAdjustedCropRect.size.width = v11;
    self->_flippedNormalizedEdgeAdjustedCropRect.size.height = v12;
  }
}

- (void)cancel
{
  id v3;

  self->_canceled = 1;
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelImageRequest:", -[PXPeopleFaceCropRequest imageManagerRequestID](self, "imageManagerRequestID"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  __CFString *v13;
  __CFString *v14;
  objc_super v16;
  NSPoint v17;
  NSRect v18;
  NSRect v19;
  NSRect v20;

  v16.receiver = self;
  v16.super_class = (Class)PXPeopleFaceCropRequest;
  -[PXPeopleFaceCropRequest description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PXPeopleFaceCropRequest options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(":\noptions: %@"), v5);

  -[PXPeopleFaceCropRequest face](self, "face");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("face: %@,\n"), v6);

  -[PXPeopleFaceCropRequest asset](self, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("asset: %@,\n"), v7);

  objc_msgSend(v4, "appendFormat:", CFSTR("faceCropRequestID: %d,\n"), -[PXPeopleFaceCropRequest faceCropRequestID](self, "faceCropRequestID"));
  objc_msgSend(v4, "appendFormat:", CFSTR("imageManagerRequestID: %d,\n"), -[PXPeopleFaceCropRequest imageManagerRequestID](self, "imageManagerRequestID"));
  -[PXPeopleFaceCropRequest normalizedFaceCropRect](self, "normalizedFaceCropRect");
  NSStringFromRect(v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("normalizedFaceCropRect: %@,\n"), v8);

  -[PXPeopleFaceCropRequest normalizedEdgeAdjustedCropRect](self, "normalizedEdgeAdjustedCropRect");
  NSStringFromRect(v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("normalizedEdgeAdjustedCropRect: %@,\n"), v9);

  -[PXPeopleFaceCropRequest flippedNormalizedEdgeAdjustedCropRect](self, "flippedNormalizedEdgeAdjustedCropRect");
  NSStringFromRect(v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("flippedNormalizedEdgeAdjustedCropRect: %@,\n"), v10);

  -[PXPeopleFaceCropRequest normalizedCenterEyeLine](self, "normalizedCenterEyeLine");
  NSStringFromPoint(v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("normalizedCenterEyeLine: %@,\n"), v11);

  v12 = -[PXPeopleFaceCropRequest canceled](self, "canceled");
  v13 = CFSTR("NO");
  if (v12)
    v13 = CFSTR("YES");
  v14 = v13;
  objc_msgSend(v4, "appendFormat:", CFSTR("canceled: %@\n"), v14);

  return v4;
}

- (PXPeopleFaceCropFetchOptions)options
{
  return self->_options;
}

- (PHFace)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
  objc_storeStrong((id *)&self->_face, a3);
}

- (PHAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (int)faceCropRequestID
{
  return self->_faceCropRequestID;
}

- (int)imageManagerRequestID
{
  return self->_imageManagerRequestID;
}

- (void)setImageManagerRequestID:(int)a3
{
  self->_imageManagerRequestID = a3;
}

- (CGRect)normalizedFaceCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedFaceCropRect.origin.x;
  y = self->_normalizedFaceCropRect.origin.y;
  width = self->_normalizedFaceCropRect.size.width;
  height = self->_normalizedFaceCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNormalizedFaceCropRect:(CGRect)a3
{
  self->_normalizedFaceCropRect = a3;
}

- (CGRect)normalizedEdgeAdjustedCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedEdgeAdjustedCropRect.origin.x;
  y = self->_normalizedEdgeAdjustedCropRect.origin.y;
  width = self->_normalizedEdgeAdjustedCropRect.size.width;
  height = self->_normalizedEdgeAdjustedCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)flippedNormalizedEdgeAdjustedCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_flippedNormalizedEdgeAdjustedCropRect.origin.x;
  y = self->_flippedNormalizedEdgeAdjustedCropRect.origin.y;
  width = self->_flippedNormalizedEdgeAdjustedCropRect.size.width;
  height = self->_flippedNormalizedEdgeAdjustedCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)normalizedSmallFaceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedSmallFaceRect.origin.x;
  y = self->_normalizedSmallFaceRect.origin.y;
  width = self->_normalizedSmallFaceRect.size.width;
  height = self->_normalizedSmallFaceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setNormalizedSmallFaceRect:(CGRect)a3
{
  self->_normalizedSmallFaceRect = a3;
}

- (CGRect)smallFaceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_smallFaceRect.origin.x;
  y = self->_smallFaceRect.origin.y;
  width = self->_smallFaceRect.size.width;
  height = self->_smallFaceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSmallFaceRect:(CGRect)a3
{
  self->_smallFaceRect = a3;
}

- (CGPoint)normalizedCenterEyeLine
{
  double x;
  double y;
  CGPoint result;

  x = self->_normalizedCenterEyeLine.x;
  y = self->_normalizedCenterEyeLine.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setNormalizedCenterEyeLine:(CGPoint)a3
{
  self->_normalizedCenterEyeLine = a3;
}

- (CGSize)targetSizeToUse
{
  double width;
  double height;
  CGSize result;

  width = self->_targetSizeToUse.width;
  height = self->_targetSizeToUse.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setTargetSizeToUse:(CGSize)a3
{
  self->_targetSizeToUse = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

+ (int)generateUniqueRequestID
{
  int result;

  do
    result = __ldaxr((unsigned int *)&generateUniqueRequestID_uniqueRequestID);
  while (__stlxr(result + 1, (unsigned int *)&generateUniqueRequestID_uniqueRequestID));
  return result;
}

@end
