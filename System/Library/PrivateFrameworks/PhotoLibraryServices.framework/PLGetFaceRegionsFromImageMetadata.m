@implementation PLGetFaceRegionsFromImageMetadata

uint64_t __PLGetFaceRegionsFromImageMetadata_block_invoke(uint64_t a1, int a2, CGImageMetadataTagRef parent)
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  v5 = (__CFString *)CGImageMetadataCopyStringValueWithPath(*(CGImageMetadataRef *)(a1 + 48), parent, CFSTR("Type"));
  if (-[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("Face")))
  {
    v6 = (__CFString *)CGImageMetadataCopyStringValueWithPath(*(CGImageMetadataRef *)(a1 + 48), parent, CFSTR("Area.stArea:x"));
    v7 = (__CFString *)CGImageMetadataCopyStringValueWithPath(*(CGImageMetadataRef *)(a1 + 48), parent, CFSTR("Area.stArea:y"));
    v8 = (__CFString *)CGImageMetadataCopyStringValueWithPath(*(CGImageMetadataRef *)(a1 + 48), parent, CFSTR("Area.stArea:w"));
    v9 = (__CFString *)CGImageMetadataCopyStringValueWithPath(*(CGImageMetadataRef *)(a1 + 48), parent, CFSTR("Area.stArea:h"));
    PLUpdateFaceRegion(*(void **)(a1 + 32), v6, v7, v8, v9, *(void **)(a1 + 40), *(_BYTE *)(a1 + 56));

  }
  return 1;
}

@end
