@implementation OZARMetadata

- (id)compressedDataWithError:(id *)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
  v5 = objc_msgSend((id)objc_opt_class(), "metadataCompressionAlgorithm");
  if (v5 < 0)
    return v4;
  else
    return (id)objc_msgSend(v4, "compressedDataUsingAlgorithm:error:", v5, a3);
}

+ (id)decompressedData:(id)a3 error:(id *)a4
{
  uint64_t v6;

  v6 = objc_msgSend((id)objc_opt_class(), "metadataCompressionAlgorithm");
  if (v6 < 0)
    return a3;
  else
    return (id)objc_msgSend(a3, "decompressedDataUsingAlgorithm:error:", v6, a4);
}

+ (int64_t)metadataCompressionAlgorithm
{
  return 0;
}

+ (opaqueCMFormatDescription)createMetadataFormat
{
  uint64_t v2;

  v2 = objc_msgSend((id)objc_opt_class(), "metadataItemIdentifier");
  return OZSimplyCreateCMMetadataFormatDescriptionForRawDataWithIdentifier(v2);
}

+ (opaqueCMFormatDescription)metadataFormat
{
  opaqueCMFormatDescription *result;

  result = (opaqueCMFormatDescription *)objc_msgSend(a1, "createMetadataFormat");
  +[OZARMetadata metadataFormat]::metadataFormat = (uint64_t)result;
  return result;
}

+ (NSArray)sceneDepthMediaCharacteristics
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0C8A748];
  v3[1] = CFSTR("com.apple.quicktime.video-map");
  v3[2] = CFSTR("com.apple.quicktime.video-map.depth");
  v3[3] = CFSTR("com.apple.videoapps.media-characteristic.ar.scene.depth");
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
}

+ (NSArray)personSegmentationMediaCharacteristics
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0C8A748];
  v3[1] = CFSTR("com.apple.quicktime.video-map");
  v3[2] = CFSTR("com.apple.videoapps.media-characteristic.ar.person.segmentation");
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
}

+ (id)simplyDecodeFromData:(id)a3 error:(id *)a4
{
  void *v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (!objc_msgSend(a3, "length"))
    return 0;
  v7 = (void *)objc_msgSend(a1, "decompressedData:error:", a3, a4);
  if (!objc_msgSend(v7, "length"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "setClass:forClassName:", objc_opt_class(), CFSTR("PCDMARFrameMetadata"));
  return (id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, a4);
}

+ (id)createWithMetadataItem:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "simplyDecodeFromData:error:", objc_msgSend(a3, "value"), a4);
}

+ (id)metadataItemIdentifier
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return (id)objc_msgSend(MEMORY[0x1E0C8B220], "identifierForKey:keySpace:", CFSTR("com.apple.videoapps.arfx.metadata"), *MEMORY[0x1E0C8A9E8]);
}

- (id)metadataItemWithTimeRange:(id *)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  __int128 v9;
  _OWORD v11[3];

  v7 = (void *)MEMORY[0x1E0C8B220];
  v8 = objc_msgSend((id)objc_opt_class(), "metadataItemIdentifier");
  v9 = *(_OWORD *)&a3->var0.var3;
  v11[0] = *(_OWORD *)&a3->var0.var0;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&a3->var1.var1;
  return (id)objc_msgSend(v7, "simplyCreateMetadataItemWithObject:identifier:timeRange:error:", self, v8, v11, a4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (OZARMetadata)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OZARMetadata;
  return -[OZARMetadata init](&v4, sel_init, a3);
}

@end
