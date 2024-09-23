@implementation PXPeopleFaceCropFetchResult

- (PXPeopleFaceCropFetchResult)initWithImage:(id)a3 assetObjectID:(id)a4 assetLocalIdentifier:(id)a5 faceRect:(CGRect)a6 isCropped:(BOOL)a7 isDegraded:(BOOL)a8 options:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v19;
  id v20;
  id v21;
  id v22;
  PXPeopleFaceCropFetchResult *v23;
  PXPeopleFaceCropFetchResult *v24;
  objc_super v27;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a9;
  v27.receiver = self;
  v27.super_class = (Class)PXPeopleFaceCropFetchResult;
  v23 = -[PXPeopleFaceCropFetchResult init](&v27, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_image, a3);
    objc_storeStrong((id *)&v24->_assetObjectID, a4);
    objc_storeStrong((id *)&v24->_assetLocalIdentifier, a5);
    v24->_faceRect.origin.x = x;
    v24->_faceRect.origin.y = y;
    v24->_faceRect.size.width = width;
    v24->_faceRect.size.height = height;
    v24->_isCropped = a7;
    v24->_isDegraded = a8;
    objc_storeStrong((id *)&v24->_options, a9);
  }

  return v24;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)PXPeopleFaceCropFetchResult;
  -[PXPeopleFaceCropFetchResult description](&v15, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PXPeopleFaceCropFetchResult image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(":\nimage: %@,\n"), v5);

  -[PXPeopleFaceCropFetchResult assetObjectID](self, "assetObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("assetObjectID: %@,\n"), v6);

  -[PXPeopleFaceCropFetchResult assetLocalIdentifier](self, "assetLocalIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("assetLocalIdentifier: %@,\n"), v7);

  -[PXPeopleFaceCropFetchResult faceRect](self, "faceRect");
  NSStringFromCGRect(v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("faceRect: %@,\n"), v8);
  if (-[PXPeopleFaceCropFetchResult isCropped](self, "isCropped"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = v9;
  objc_msgSend(v4, "appendFormat:", CFSTR("isCropped: %@,\n"), v10);

  if (-[PXPeopleFaceCropFetchResult isDegraded](self, "isDegraded"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = v11;
  objc_msgSend(v4, "appendFormat:", CFSTR("isDegraded: %@,\n"), v12);

  -[PXPeopleFaceCropFetchResult options](self, "options");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("options: %@\n"), v13);

  return v4;
}

- (UIImage)image
{
  return self->_image;
}

- (NSManagedObjectID)assetObjectID
{
  return self->_assetObjectID;
}

- (NSString)assetLocalIdentifier
{
  return self->_assetLocalIdentifier;
}

- (CGRect)faceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_faceRect.origin.x;
  y = self->_faceRect.origin.y;
  width = self->_faceRect.size.width;
  height = self->_faceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isCropped
{
  return self->_isCropped;
}

- (BOOL)isDegraded
{
  return self->_isDegraded;
}

- (PXPeopleFaceCropFetchOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_assetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_assetObjectID, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
