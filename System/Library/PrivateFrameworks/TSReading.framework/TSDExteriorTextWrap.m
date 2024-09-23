@implementation TSDExteriorTextWrap

+ (id)exteriorTextWrap
{
  return objc_alloc_init((Class)a1);
}

+ (TSDExteriorTextWrap)exteriorTextWrapWithIsHTMLWrap:(BOOL)a3 type:(int)a4 direction:(int)a5 fitType:(int)a6 margin:(double)a7 alphaThreshold:(double)a8
{
  return (TSDExteriorTextWrap *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithIsHTMLWrap:type:direction:fitType:margin:alphaThreshold:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6, a7, a8);
}

- (TSDExteriorTextWrap)init
{
  return -[TSDExteriorTextWrap initWithIsHTMLWrap:type:direction:fitType:margin:alphaThreshold:](self, "initWithIsHTMLWrap:type:direction:fitType:margin:alphaThreshold:", 0, 4, 2, 1, 0.0, 0.5);
}

- (TSDExteriorTextWrap)initWithIsHTMLWrap:(BOOL)a3 type:(int)a4 direction:(int)a5 fitType:(int)a6 margin:(double)a7 alphaThreshold:(double)a8
{
  TSDExteriorTextWrap *result;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TSDExteriorTextWrap;
  result = -[TSDExteriorTextWrap init](&v15, sel_init);
  if (result)
  {
    result->_isHTMLWrap = a3;
    result->_type = a4;
    result->_direction = a5;
    result->_fitType = a6;
    result->_margin = a7;
    result->_alphaThreshold = a8;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithIsHTMLWrap:type:direction:fitType:margin:alphaThreshold:", self->_isHTMLWrap, self->_type, self->_direction, self->_fitType, self->_margin, self->_alphaThreshold);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TSDExteriorTextWrap initWithIsHTMLWrap:type:direction:fitType:margin:alphaThreshold:](+[TSDMutableExteriorTextWrap allocWithZone:](TSDMutableExteriorTextWrap, "allocWithZone:", a3), "initWithIsHTMLWrap:type:direction:fitType:margin:alphaThreshold:", self->_isHTMLWrap, self->_type, self->_direction, self->_fitType, self->_margin, self->_alphaThreshold);
}

- (BOOL)isEqual:(id)a3
{
  TSDExteriorTextWrap *v3;
  BOOL v4;
  double v6;
  double margin;
  double v8;
  double alphaThreshold;

  v3 = self;
  v4 = a3 == self;
  LOBYTE(self) = a3 == self;
  if (a3)
  {
    if (!v4)
    {
      LODWORD(self) = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
      if ((_DWORD)self)
      {
        if (*((unsigned __int8 *)a3 + 8) == v3->_isHTMLWrap
          && *((_DWORD *)a3 + 3) == v3->_type
          && *((_DWORD *)a3 + 4) == v3->_direction
          && *((_DWORD *)a3 + 5) == v3->_fitType
          && ((v6 = *((double *)a3 + 3), margin = v3->_margin, v6 == margin)
           || vabdd_f64(v6, margin) < fabs(margin * 0.000000999999997)))
        {
          v8 = *((double *)a3 + 4);
          alphaThreshold = v3->_alphaThreshold;
          LOBYTE(self) = v8 == alphaThreshold
                      || vabdd_f64(v8, alphaThreshold) < fabs(alphaThreshold * 0.000000999999997);
        }
        else
        {
          LOBYTE(self) = 0;
        }
      }
    }
  }
  return (char)self;
}

- (id)description
{
  _BOOL4 isHTMLWrap;
  unsigned int v4;
  const __CFString *v5;
  unsigned int v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  isHTMLWrap = self->_isHTMLWrap;
  v4 = -[TSDExteriorTextWrap type](self, "type");
  if (v4 > 5)
    v5 = &stru_24D82FEB0;
  else
    v5 = off_24D82C388[v4];
  v6 = -[TSDExteriorTextWrap direction](self, "direction");
  v7 = &stru_24D82FEB0;
  if (v6 <= 2)
    v7 = off_24D82C3B8[v6];
  v8 = -[TSDExteriorTextWrap fitType](self, "fitType");
  v9 = CFSTR("Contour");
  if (v8 != 1)
    v9 = &stru_24D82FEB0;
  if (v8)
    v10 = v9;
  else
    v10 = CFSTR("Rectangular");
  if (isHTMLWrap)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = (void *)MEMORY[0x24BDD17C8];
  -[TSDExteriorTextWrap margin](self, "margin");
  v14 = v13;
  -[TSDExteriorTextWrap alphaThreshold](self, "alphaThreshold");
  return (id)objc_msgSend(v12, "stringWithFormat:", CFSTR("TSDExteriorTextWrap isHTMLWrap=%@, type=%@, direction=%@, fitType=%@, margin=%f, alphaThreshold=%f"), v11, v5, v7, v10, v14, v15);
}

- (BOOL)isHTMLWrap
{
  return self->_isHTMLWrap;
}

- (int)type
{
  return self->_type;
}

- (int)direction
{
  return self->_direction;
}

- (int)fitType
{
  return self->_fitType;
}

- (double)margin
{
  return self->_margin;
}

- (double)alphaThreshold
{
  return self->_alphaThreshold;
}

@end
