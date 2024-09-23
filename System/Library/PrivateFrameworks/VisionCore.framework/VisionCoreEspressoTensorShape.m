@implementation VisionCoreEspressoTensorShape

+ (id)shapeForBlobDimensions:(id *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithBatchNumber:channels:height:width:", a3->var4, a3->var3, a3->var2, a3->var1);
}

- (unint64_t)height
{
  return -[VisionCoreTensorShape sizes](objc_retainAutorelease(self), "sizes")[16];
}

- (unint64_t)width
{
  return -[VisionCoreTensorShape sizes](objc_retainAutorelease(self), "sizes")[24];
}

- (unint64_t)batchNumber
{
  return *-[VisionCoreTensorShape sizes](objc_retainAutorelease(self), "sizes");
}

- (unint64_t)channels
{
  return -[VisionCoreTensorShape sizes](objc_retainAutorelease(self), "sizes")[8];
}

@end
