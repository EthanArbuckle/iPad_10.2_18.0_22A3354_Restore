@implementation OITSUMutableCustomFormatData

+ (id)customFormatData
{
  return objc_alloc_init(OITSUMutableCustomFormatData);
}

- (id)copyWithZone:(_NSZone *)a3
{
  OITSUCustomFormatData *v4;

  v4 = -[OITSUCustomFormatData init](+[OITSUCustomFormatData allocWithZone:](OITSUCustomFormatData, "allocWithZone:", a3), "init");
  -[OITSUCustomFormatData p_copySelfTo:](self, "p_copySelfTo:", v4);
  return v4;
}

@end
