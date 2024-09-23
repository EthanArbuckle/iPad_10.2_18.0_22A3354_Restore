@implementation PXStoryExportOrientation

- (PXStoryExportOrientation)initWithOrientationType:(int64_t)a3
{
  PXStoryExportOrientation *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXStoryExportOrientation;
  result = -[PXStoryExportOrientation init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (PXStoryExportOrientation)initWithUserInterfaceOrientation:(int64_t)a3
{
  uint64_t v3;

  if (a3)
    v3 = a3 == 1;
  else
    v3 = 2;
  return -[PXStoryExportOrientation initWithOrientationType:](self, "initWithOrientationType:", v3);
}

- (NSString)localizedTitle
{
  unint64_t v2;
  __CFString *v3;

  v2 = -[PXStoryExportOrientation type](self, "type");
  if (v2 > 2)
    v3 = 0;
  else
    v3 = off_1E5131178[v2];
  return (NSString *)PXLocalizedStringFromTable(v3, CFSTR("PhotosUICore"));
}

- (BOOL)isEqual:(id)a3
{
  PXStoryExportOrientation *v4;
  PXStoryExportOrientation *v5;
  int64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (PXStoryExportOrientation *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PXStoryExportOrientation type](self, "type");
      v7 = -[PXStoryExportOrientation type](v5, "type");

      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (int64_t)type
{
  return self->_type;
}

+ (NSArray)pickableOrientations
{
  return (NSArray *)PXMap();
}

PXStoryExportOrientation *__48__PXStoryExportOrientation_pickableOrientations__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PXStoryExportOrientation *v3;
  uint64_t v4;

  v2 = a2;
  v3 = [PXStoryExportOrientation alloc];
  v4 = objc_msgSend(v2, "integerValue");

  return -[PXStoryExportOrientation initWithOrientationType:](v3, "initWithOrientationType:", v4);
}

@end
