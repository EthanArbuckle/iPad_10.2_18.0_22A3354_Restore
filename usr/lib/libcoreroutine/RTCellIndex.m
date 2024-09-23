@implementation RTCellIndex

- (RTCellIndex)initWithX:(signed __int16)a3 Y:(signed __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  RTCellIndex *v6;
  RTCellIndex *v7;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTCellIndex;
  v6 = -[RTCellIndex init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[RTCellIndex setX:](v6, "setX:", v5);
    -[RTCellIndex setY:](v7, "setY:", v4);
  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithX:Y:", self->_x, self->_y);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int v6;
  BOOL v7;

  v4 = a3;
  v5 = -[RTCellIndex x](self, "x");
  if (v5 == objc_msgSend(v4, "x"))
  {
    v6 = -[RTCellIndex y](self, "y");
    v7 = v6 == objc_msgSend(v4, "y");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;

  v3 = -[RTCellIndex x](self, "x");
  v4 = -[RTCellIndex x](self, "x");
  if (v3 > 0)
    v5 = v4;
  else
    v5 = -(uint64_t)v4;
  v6 = -[RTCellIndex y](self, "y");
  v7 = -[RTCellIndex y](self, "y");
  v8 = v7;
  if (v6 <= 0)
    v8 = -(uint64_t)v7;
  return (2654435761 * v8) ^ (2654435761 * v5);
}

- (signed)x
{
  return self->_x;
}

- (void)setX:(signed __int16)a3
{
  self->_x = a3;
}

- (signed)y
{
  return self->_y;
}

- (void)setY:(signed __int16)a3
{
  self->_y = a3;
}

@end
