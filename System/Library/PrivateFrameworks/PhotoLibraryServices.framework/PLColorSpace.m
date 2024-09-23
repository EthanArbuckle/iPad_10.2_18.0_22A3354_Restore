@implementation PLColorSpace

- (PLColorSpace)initWithName:(id)a3
{
  id v6;
  PLColorSpace *v7;
  void *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLColorSpace;
  v7 = -[PLColorSpace init](&v10, sel_init);
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("PLColorSpace.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("colorSpaceName"));

    }
    objc_storeStrong((id *)&v7->_colorSpaceName, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_colorSpaceName, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PLColorSpace *v4;
  PLColorSpace *v5;
  NSString *colorSpaceName;
  void *v7;
  char v8;

  v4 = (PLColorSpace *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    colorSpaceName = self->_colorSpaceName;
    -[PLColorSpace colorSpaceName](v5, "colorSpaceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSString isEqualToString:](colorSpaceName, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)colorSpaceName
{
  return self->_colorSpaceName;
}

- (void)setColorSpaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpaceName, 0);
}

+ (id)colorSpaceFromName:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithName:", v3);

  return v4;
}

+ (id)commonColorSpace_sRGB
{
  return (id)objc_msgSend(a1, "colorSpaceFromName:", CFSTR("sRGB IEC61966-2.1"));
}

+ (id)commonColorSpace_displaySpace
{
  if (commonColorSpace_displaySpace__onceToken != -1)
    dispatch_once(&commonColorSpace_displaySpace__onceToken, &__block_literal_global_95498);
  return (id)objc_msgSend(a1, "colorSpaceFromName:", commonColorSpace_displaySpace_s_colorSpaceName);
}

void __45__PLColorSpace_commonColorSpace_displaySpace__block_invoke()
{
  CGColorSpace *DeviceRGB;

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  commonColorSpace_displaySpace_s_colorSpaceName = (uint64_t)CGColorSpaceCopyName(DeviceRGB);
  CGColorSpaceRelease(DeviceRGB);
}

@end
