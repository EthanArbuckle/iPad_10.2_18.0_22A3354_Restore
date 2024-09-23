@implementation OUKeyframeMetaExtend

- (void)samplePoints
{
  objc_copyStruct(a2, (const void *)(a1 + 96), 480, 1, 0);
}

- (void)setSamplePoints:(const void *)a3
{
  objc_copyStruct((void *)(a1 + 96), a3, 480, 1, 0);
}

@end
