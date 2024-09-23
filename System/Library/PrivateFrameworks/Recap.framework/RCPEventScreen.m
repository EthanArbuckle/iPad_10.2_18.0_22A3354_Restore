@implementation RCPEventScreen

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayUUID, 0);
}

- (double)scale
{
  return self->_scale;
}

- (CGSize)pointSize
{
  double width;
  double height;
  CGSize result;

  width = self->_pointSize.width;
  height = self->_pointSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (void)setPointSize:(CGSize)a3
{
  self->_pointSize = a3;
}

- (void)setDisplayUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setDisplayID:(unsigned int)a3
{
  self->_displayID = a3;
}

- (id)description
{
  double scale;
  uint64_t v4;

  scale = self->_scale;
  if (scale <= 0.0)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%g×%g"), *(_QWORD *)&self->_pointSize.width, *(_QWORD *)&self->_pointSize.height, v4);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%g×%g∙%g"), *(_QWORD *)&self->_pointSize.width, *(_QWORD *)&self->_pointSize.height, *(_QWORD *)&scale);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)encodeWithCoder:(id)a3
{
  double scale;
  id v5;

  scale = self->_scale;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("scale"), scale);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("width"), self->_pointSize.width);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("height"), self->_pointSize.height);

}

- (RCPEventScreen)initWithCoder:(id)a3
{
  id v4;
  RCPEventScreen *v5;
  double v6;
  CGFloat v7;
  CGFloat v8;

  v4 = a3;
  v5 = -[RCPEventScreen init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("scale"));
    v5->_scale = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("width"));
    v5->_pointSize.width = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("height"));
    v5->_pointSize.height = v8;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)displayUUID
{
  return self->_displayUUID;
}

- (unsigned)displayID
{
  return self->_displayID;
}

@end
