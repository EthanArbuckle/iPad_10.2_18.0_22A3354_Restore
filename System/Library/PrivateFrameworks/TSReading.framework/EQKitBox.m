@implementation EQKitBox

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  else
    return 0;
}

- (CGColor)color
{
  return 0;
}

- (double)height
{
  return 0.0;
}

- (double)depth
{
  return 0.0;
}

- (double)width
{
  return 0.0;
}

- (double)vsize
{
  double v3;
  double v4;
  double v5;

  -[EQKitBox height](self, "height");
  v4 = v3;
  -[EQKitBox depth](self, "depth");
  return v4 + v5;
}

- (double)layoutHeight
{
  double v3;
  double result;

  -[EQKitBox height](self, "height");
  if (v3 < 0.0)
    return 0.0;
  -[EQKitBox height](self, "height");
  return result;
}

- (double)layoutDepth
{
  double v3;
  double result;

  -[EQKitBox depth](self, "depth");
  if (v3 < 0.0)
    return 0.0;
  -[EQKitBox depth](self, "depth");
  return result;
}

- (double)layoutVSize
{
  double v3;
  double v4;
  double v5;

  -[EQKitBox layoutHeight](self, "layoutHeight");
  v4 = v3;
  -[EQKitBox layoutDepth](self, "layoutDepth");
  return v4 + v5;
}

- (CGRect)erasableBounds
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
  CGRect result;

  -[EQKitBox height](self, "height");
  v4 = v3;
  -[EQKitBox width](self, "width");
  v6 = v5;
  -[EQKitBox vsize](self, "vsize");
  if (v6 >= 0.0)
    v8 = v6;
  else
    v8 = -v6;
  if (v6 >= 0.0)
    v9 = 0.0;
  else
    v9 = v6 + 0.0;
  if (v7 >= 0.0)
    v10 = v7;
  else
    v10 = -v7;
  if (v7 >= 0.0)
    v7 = -0.0;
  v11 = v7 - v4;
  v12 = v9;
  result.size.height = v10;
  result.size.width = v8;
  result.origin.y = v11;
  result.origin.x = v12;
  return result;
}

- (CGAffineTransform)transformFromDescendant:(SEL)a3
{
  uint64_t v5;
  __int128 v6;

  v5 = MEMORY[0x24BDBD8B8];
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  return (CGAffineTransform *)-[EQKitBox p_getTransform:fromDescendant:](self, "p_getTransform:fromDescendant:");
}

- (BOOL)p_getTransform:(CGAffineTransform *)a3 fromDescendant:(id)a4
{
  return a4 == self;
}

- (BOOL)appendOpticalAlignToSpec:(void *)a3 offset:(CGPoint)a4
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
}

@end
