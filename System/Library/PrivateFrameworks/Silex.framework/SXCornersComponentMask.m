@implementation SXCornersComponentMask

- (BOOL)cornerWithValue:(id)a3 withType:(int)a4
{
  if (a3 && a4 == 2)
    return objc_msgSend(a3, "BOOLValue");
  else
    return 1;
}

- (id)curveWithValue:(id)a3 withType:(int)a4
{
  id v6;
  id v7;

  v6 = (id)*MEMORY[0x24BDE58E0];
  if (a4 == 3 && objc_msgSend(a3, "isEqualToString:", CFSTR("continuous")))
  {
    v7 = (id)*MEMORY[0x24BDE58E8];

    v6 = v7;
  }
  return v6;
}

- (unint64_t)cornerMask
{
  unint64_t v3;

  v3 = -[SXCornersComponentMask topLeft](self, "topLeft");
  if (-[SXCornersComponentMask topRight](self, "topRight"))
    v3 |= 2uLL;
  if (-[SXCornersComponentMask bottomRight](self, "bottomRight"))
    v3 |= 8uLL;
  if (-[SXCornersComponentMask bottomLeft](self, "bottomLeft"))
    return v3 | 4;
  else
    return v3;
}

@end
