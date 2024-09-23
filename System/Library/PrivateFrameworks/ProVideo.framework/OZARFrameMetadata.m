@implementation OZARFrameMetadata

- (OZARFrameMetadata)initWithCameraTransform:(double)a3 cameraIntrinsics:(double)a4 cameraImageResolution:(double)a5
{
  OZARFrameMetadata *v17;
  OZARFrameMetadata *v18;
  objc_super v27;

  v27.receiver = a1;
  v27.super_class = (Class)OZARFrameMetadata;
  v17 = -[OZARFrameMetadata init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    -[OZARFrameMetadata setCameraTransform:](v17, "setCameraTransform:", a2, a3, a4, a5);
    -[OZARFrameMetadata setCameraIntrinsics:](v18, "setCameraIntrinsics:", a6, a7, a8);
    -[OZARFrameMetadata setCameraImageResolution:](v18, "setCameraImageResolution:", a10, a11);
  }
  return v18;
}

+ (opaqueCMFormatDescription)metadataFormat
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__OZARFrameMetadata_metadataFormat__block_invoke;
  block[3] = &unk_1E64DFA00;
  block[4] = a1;
  if (+[OZARFrameMetadata metadataFormat]::onceToken != -1)
    dispatch_once(&+[OZARFrameMetadata metadataFormat]::onceToken, block);
  return (opaqueCMFormatDescription *)+[OZARFrameMetadata metadataFormat]::metadataFormat;
}

uint64_t __35__OZARFrameMetadata_metadataFormat__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "createMetadataFormat");
  +[OZARFrameMetadata metadataFormat]::metadataFormat = result;
  return result;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)OZARFrameMetadata;
  v4 = -[OZARFrameMetadata description](&v14, sel_description);
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[OZARFrameMetadata cameraTransform](self, "cameraTransform");
  v6 = objc_msgSend(v5, "oz_stringWithMatrixFloat4x4:precision:", 4);
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[OZARFrameMetadata cameraIntrinsics](self, "cameraIntrinsics");
  v8 = objc_msgSend(v7, "oz_stringWithMatrixFloat3x3:precision:", 4);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[OZARFrameMetadata cameraImageResolution](self, "cameraImageResolution");
  v10 = objc_msgSend(v9, "numberWithDouble:");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[OZARFrameMetadata cameraImageResolution](self, "cameraImageResolution");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\ncameraTransform:\n%@\ncameraIntrinsics:\n%@\ncameraImageResolution: {%@, %@}"), v4, v6, v8, v10, objc_msgSend(v11, "numberWithDouble:", v12));
}

+ (id)metadataItemIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.videoapps.arfx.metadata.frame"), *MEMORY[0x1E0C8A9E8]);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (OZARFrameMetadata)initWithCoder:(id)a3
{
  OZARFrameMetadata *v4;
  uint64_t v5;
  double v6;
  double v12;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)OZARFrameMetadata;
  v4 = -[OZARFrameMetadata init](&v15, sel_init);
  if (v4)
  {
    objc_msgSend(a3, "oz_decodeMatrixFloat4x4ForKey:", CFSTR("cameraTransform"));
    -[OZARFrameMetadata setCameraTransform:](v4, "setCameraTransform:");
    objc_msgSend(a3, "oz_decodeFloat2ForKey:", CFSTR("cameraIntrinsicsFocalLength"));
    v14 = v5;
    objc_msgSend(a3, "oz_decodeFloat2ForKey:", CFSTR("cameraIntrinsicsPrincipalPoint"));
    LODWORD(v6) = 0;
    HIDWORD(v6) = HIDWORD(v14);
    __asm { FMOV            V2.4S, #1.0 }
    -[OZARFrameMetadata setCameraIntrinsics:](v4, "setCameraIntrinsics:", COERCE_DOUBLE((unint64_t)v14), v6, v12);
    objc_msgSend(a3, "oz_decodeCGSizeForKey:", CFSTR("cameraImageResolution"));
    -[OZARFrameMetadata setCameraImageResolution:](v4, "setCameraImageResolution:");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  double v7;
  unsigned int v8;

  -[OZARFrameMetadata cameraTransform](self, "cameraTransform");
  objc_msgSend(a3, "oz_encodeMatrixFloat4x4:forKey:", CFSTR("cameraTransform"));
  -[OZARFrameMetadata cameraIntrinsics](self, "cameraIntrinsics");
  v8 = v5;
  -[OZARFrameMetadata cameraIntrinsics](self, "cameraIntrinsics");
  objc_msgSend(a3, "oz_encodeFloat2:forKey:", CFSTR("cameraIntrinsicsFocalLength"), COERCE_DOUBLE(__PAIR64__(v6, v8)));
  -[OZARFrameMetadata cameraIntrinsics](self, "cameraIntrinsics");
  objc_msgSend(a3, "oz_encodeFloat2:forKey:", CFSTR("cameraIntrinsicsPrincipalPoint"), v7);
  -[OZARFrameMetadata cameraImageResolution](self, "cameraImageResolution");
  objc_msgSend(a3, "oz_encodeCGSize:forKey:", CFSTR("cameraImageResolution"));
}

- (__n128)cameraTransform
{
  return a1[5];
}

- (__n128)setCameraTransform:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  result[8] = a5;
  return result;
}

- (__n128)cameraIntrinsics
{
  return a1[2];
}

- (__n128)setCameraIntrinsics:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  return result;
}

- (CGSize)cameraImageResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_cameraImageResolution.width;
  height = self->_cameraImageResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCameraImageResolution:(CGSize)a3
{
  self->_cameraImageResolution = a3;
}

@end
