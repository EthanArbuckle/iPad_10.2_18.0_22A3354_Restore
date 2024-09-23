@implementation _UIDynamicAnimationActiveValue

+ (id)lowerBoundary:(double)a3 ofType:(int)a4
{
  id result;

  result = (id)objc_msgSend((id)objc_opt_class(), "activeValue:ofType:", *(_QWORD *)&a4, a3);
  *((_BYTE *)result + 56) |= 1u;
  *((double *)result + 3) = a3;
  return result;
}

+ (id)upperBoundary:(double)a3 ofType:(int)a4
{
  id result;

  result = (id)objc_msgSend((id)objc_opt_class(), "activeValue:ofType:", *(_QWORD *)&a4, a3);
  *((_BYTE *)result + 56) |= 2u;
  *((double *)result + 2) = a3;
  return result;
}

+ (id)activeValue:(double)a3 ofType:(int)a4
{
  double *v6;

  v6 = (double *)objc_alloc_init((Class)a1);
  if (v6)
  {
    v6[1] = a3;
    *((_DWORD *)v6 + 8) = a4;
  }
  return v6;
}

- (_UIDynamicAnimationActiveValue)init
{
  _UIDynamicAnimationActiveValue *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDynamicAnimationActiveValue;
  result = -[_UIDynamicAnimationActiveValue init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_minimumActiveValue = xmmword_1866784F0;
    result->_type = 0;
    result->_boundaryPull = 0.12;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIDynamicAnimationActiveValue;
  -[_UIDynamicAnimationActiveValue dealloc](&v3, sel_dealloc);
}

- (id)_applier
{
  id result;
  uint64_t type;

  result = self->_applier;
  if (!result)
  {
    type = self->_type;
    if (type > 3)
    {
      return 0;
    }
    else
    {
      result = (id)objc_msgSend(*(&off_1E16B4338 + type), "copy");
      self->_applier = result;
    }
  }
  return result;
}

- (void)setValue:(double)a3
{
  char v3;

  if (self->_value != a3)
  {
    self->_value = a3;
    v3 = *((_BYTE *)self + 56);
    if ((v3 & 2) != 0)
      self->_minimumActiveValue = a3;
    if ((v3 & 1) != 0)
      self->_maximumActiveValue = a3;
  }
}

- (void)setMinimumActiveValue:(double)a3
{
  if ((*((_BYTE *)self + 56) & 3) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("The minimum active value for a boundary is based on the target value and can not be changed"));
  self->_minimumActiveValue = a3;
}

- (void)setMaximumActiveValue:(double)a3
{
  if ((*((_BYTE *)self + 56) & 3) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("The maximum active value for a boundary is based on the target value and can not be changed"));
  self->_maximumActiveValue = a3;
}

- (void)setType:(int)a3
{
  if (self->_type != a3)
  {
    -[_UIDynamicAnimationActiveValue willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("type"));
    self->_type = a3;

    self->_applier = 0;
    -[_UIDynamicAnimationActiveValue didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("type"));
  }
}

- (double)_boundaryPull
{
  return self->_boundaryPull;
}

- (void)_setBoundaryPull:(double)a3
{
  self->_boundaryPull = a3;
}

- (BOOL)_isLowerBoundary
{
  return *((_BYTE *)self + 56) & 1;
}

- (BOOL)_isUpperBoundary
{
  return (*((unsigned __int8 *)self + 56) >> 1) & 1;
}

- (void)_appendDescriptionToString:(id)a3 atLevel:(int)a4
{
  unint64_t v7;
  uint64_t v8;
  void *i;
  uint64_t type;
  __CFString *v11;
  char v12;
  id v13;

  v13 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (objc_msgSend(a3, "length"))
    objc_msgSend(a3, "appendString:", CFSTR("\n"));
  if (a4)
  {
    v7 = 1;
    do
    {
      objc_msgSend(a3, "appendString:", CFSTR("    "));
      ++v7;
    }
    while (v7 <= a4);
  }
  objc_msgSend(a3, "appendFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v8 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  for (i = (void *)objc_opt_class();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", i) != v8;
        i = (void *)objc_msgSend(i, "superclass"))
  {
    if (i == (void *)objc_opt_class())
      break;
  }
  if ((void *)objc_opt_class() != i)
    objc_msgSend(a3, "appendFormat:", CFSTR("; baseClass = %@"), NSStringFromClass((Class)i));
  type = self->_type;
  if (type > 3)
    v11 = 0;
  else
    v11 = off_1E16B4358[type];
  objc_msgSend(a3, "appendFormat:", CFSTR("; type = %@"), v11);
  objc_msgSend(a3, "appendFormat:", CFSTR("; value = %f"), *(_QWORD *)&self->_value);
  v12 = *((_BYTE *)self + 56);
  if ((v12 & 1) != 0)
  {
    objc_msgSend(a3, "appendString:", CFSTR("; lower boundary"));
    v12 = *((_BYTE *)self + 56);
  }
  if ((v12 & 2) != 0)
    objc_msgSend(a3, "appendString:", CFSTR("; upper boundary"));
  if (self->_minimumActiveValue != -1.79769313e308 && (*((_BYTE *)self + 56) & 2) == 0)
    objc_msgSend(a3, "appendFormat:", CFSTR("; min = %f"), *(_QWORD *)&self->_minimumActiveValue);
  if (self->_maximumActiveValue != 1.79769313e308 && (*((_BYTE *)self + 56) & 1) == 0)
    objc_msgSend(a3, "appendFormat:", CFSTR("; min = %f"), *(_QWORD *)&self->_maximumActiveValue);
  if (self->_boundaryPull != 0.12)
    objc_msgSend(a3, "appendFormat:", CFSTR("; pull = %f"), *(_QWORD *)&self->_boundaryPull);
  objc_msgSend(a3, "appendFormat:", CFSTR(">"));

}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  -[_UIDynamicAnimationActiveValue _appendDescriptionToString:atLevel:](self, "_appendDescriptionToString:atLevel:", v3, 0);
  return v3;
}

- (double)value
{
  return self->_value;
}

- (double)minimumActiveValue
{
  return self->_minimumActiveValue;
}

- (double)maximumActiveValue
{
  return self->_maximumActiveValue;
}

- (int)type
{
  return self->_type;
}

@end
