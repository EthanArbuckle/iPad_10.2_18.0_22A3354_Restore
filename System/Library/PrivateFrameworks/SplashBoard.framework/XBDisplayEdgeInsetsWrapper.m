@implementation XBDisplayEdgeInsetsWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;

  v4 = a3;
  -[XBDisplayEdgeInsetsWrapper topInset](self, "topInset");
  MEMORY[0x219A1080C](v4, "topInset");
  -[XBDisplayEdgeInsetsWrapper leftInset](self, "leftInset");
  MEMORY[0x219A1080C](v4, "leftInset");
  -[XBDisplayEdgeInsetsWrapper bottomInset](self, "bottomInset");
  MEMORY[0x219A1080C](v4, "bottomInset");
  -[XBDisplayEdgeInsetsWrapper rightInset](self, "rightInset");
  MEMORY[0x219A1080C](v4, "rightInset");

}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XBApplicationLaunchCompatibilityInfo.m"), 1035, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder allowsKeyedCoding]"));

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "topInset");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[XBDisplayEdgeInsetsWrapper topInset](self, "topInset");
  objc_msgSend(v5, "encodeDouble:forKey:", v10);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "leftInset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBDisplayEdgeInsetsWrapper leftInset](self, "leftInset");
  objc_msgSend(v5, "encodeDouble:forKey:", v6);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "bottomInset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBDisplayEdgeInsetsWrapper bottomInset](self, "bottomInset");
  objc_msgSend(v5, "encodeDouble:forKey:", v7);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "rightInset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBDisplayEdgeInsetsWrapper rightInset](self, "rightInset");
  objc_msgSend(v5, "encodeDouble:forKey:", v8);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  id v7;

  v4 = a3;
  if (v4 && (v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    v7 = v4;
    objc_msgSend(v7, "topInset");
    -[XBDisplayEdgeInsetsWrapper topInset](self, "topInset");
    if (BSFloatEqualToFloat()
      && (objc_msgSend(v7, "leftInset"),
          -[XBDisplayEdgeInsetsWrapper leftInset](self, "leftInset"),
          BSFloatEqualToFloat())
      && (objc_msgSend(v7, "bottomInset"),
          -[XBDisplayEdgeInsetsWrapper bottomInset](self, "bottomInset"),
          BSFloatEqualToFloat()))
    {
      objc_msgSend(v7, "rightInset");
      -[XBDisplayEdgeInsetsWrapper rightInset](self, "rightInset");
      v6 = BSFloatEqualToFloat();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)topInset
{
  return self->_topInset;
}

- (double)rightInset
{
  return self->_rightInset;
}

- (double)leftInset
{
  return self->_leftInset;
}

- (double)bottomInset
{
  return self->_bottomInset;
}

- (XBDisplayEdgeInsetsWrapper)initWithTop:(double)a3 left:(double)a4 bottom:(double)a5 right:(double)a6
{
  XBDisplayEdgeInsetsWrapper *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)XBDisplayEdgeInsetsWrapper;
  result = -[XBDisplayEdgeInsetsWrapper init](&v11, sel_init);
  if (result)
  {
    result->_topInset = a3;
    result->_leftInset = a4;
    result->_bottomInset = a5;
    result->_rightInset = a6;
  }
  return result;
}

- (XBDisplayEdgeInsetsWrapper)initWithXPCDictionary:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  v5 = MEMORY[0x219A1071C]();
  v6 = MEMORY[0x219A1071C](v4, "leftInset");
  v7 = MEMORY[0x219A1071C](v4, "bottomInset");
  v8 = MEMORY[0x219A1071C](v4, "rightInset");

  return -[XBDisplayEdgeInsetsWrapper initWithTop:left:bottom:right:](self, "initWithTop:left:bottom:right:", v5, v6, v7, v8);
}

+ (id)makeWithEdgeInsets:(UIEdgeInsets)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithTop:left:bottom:right:", a3.top, a3.left, a3.bottom, a3.right);
}

- (BOOL)hasZeroInsets
{
  -[XBDisplayEdgeInsetsWrapper topInset](self, "topInset");
  if (!BSFloatIsZero())
    return 0;
  -[XBDisplayEdgeInsetsWrapper leftInset](self, "leftInset");
  if (!BSFloatIsZero())
    return 0;
  -[XBDisplayEdgeInsetsWrapper bottomInset](self, "bottomInset");
  if (!BSFloatIsZero())
    return 0;
  -[XBDisplayEdgeInsetsWrapper rightInset](self, "rightInset");
  return BSFloatIsZero();
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE38380], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[XBDisplayEdgeInsetsWrapper topInset](self, "topInset");
  v4 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("topInset"), 1);
  -[XBDisplayEdgeInsetsWrapper leftInset](self, "leftInset");
  v5 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("leftInset"), 1);
  -[XBDisplayEdgeInsetsWrapper bottomInset](self, "bottomInset");
  v6 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("bottomInset"), 1);
  -[XBDisplayEdgeInsetsWrapper rightInset](self, "rightInset");
  v7 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", CFSTR("rightInset"), 1);
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (UIEdgeInsets)edgeInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  -[XBDisplayEdgeInsetsWrapper topInset](self, "topInset");
  v4 = v3;
  -[XBDisplayEdgeInsetsWrapper leftInset](self, "leftInset");
  v6 = v5;
  -[XBDisplayEdgeInsetsWrapper bottomInset](self, "bottomInset");
  v8 = v7;
  -[XBDisplayEdgeInsetsWrapper rightInset](self, "rightInset");
  v10 = v9;
  v11 = v4;
  v12 = v6;
  v13 = v8;
  result.right = v10;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[XBDisplayEdgeInsetsWrapper initWithTop:left:bottom:right:](+[XBDisplayEdgeInsetsWrapper allocWithZone:](XBDisplayEdgeInsetsWrapper, "allocWithZone:", a3), "initWithTop:left:bottom:right:", self->_topInset, self->_leftInset, self->_bottomInset, self->_rightInset);
}

- (XBDisplayEdgeInsetsWrapper)initWithCoder:(id)a3
{
  id v5;
  XBDisplayEdgeInsetsWrapper *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v19;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)XBDisplayEdgeInsetsWrapper;
  v6 = -[XBDisplayEdgeInsetsWrapper init](&v20, sel_init);
  if (v6)
  {
    if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("XBApplicationLaunchCompatibilityInfo.m"), 1019, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[coder allowsKeyedCoding]"));

    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "topInset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeDoubleForKey:", v7);
    v9 = v8;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "leftInset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeDoubleForKey:", v10);
    v12 = v11;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "bottomInset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeDoubleForKey:", v13);
    v15 = v14;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "rightInset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeDoubleForKey:", v16);
    v6 = -[XBDisplayEdgeInsetsWrapper initWithTop:left:bottom:right:](v6, "initWithTop:left:bottom:right:", v9, v12, v15, v17);

  }
  return v6;
}

@end
