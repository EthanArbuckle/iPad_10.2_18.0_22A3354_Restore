@implementation CMDrawingAction

- (CMDrawingAction)initWithType:(int)a3 andValue:(id)a4
{
  id v7;
  CGColorRef *p_value;
  int type;

  v7 = a4;
  self->_type = a3;
  p_value = (CGColorRef *)&self->_value;
  objc_storeStrong(&self->_value, a4);
  type = self->_type;
  if ((type - 2) < 2)
  {
    CGColorRetain(*p_value);
  }
  else if (type == 4)
  {
    CGImageRetain(*p_value);
  }
  else if (type == 8)
  {
    CGPathRetain(*p_value);
  }

  return self;
}

- (int)type
{
  return self->_type;
}

- (id)value
{
  return self->_value;
}

- (void)dealloc
{
  int type;
  objc_super v4;

  type = self->_type;
  if ((type - 2) < 2)
  {
    CGColorRelease((CGColorRef)self->_value);
  }
  else if (type == 4)
  {
    CGImageRelease((CGImageRef)self->_value);
  }
  else if (type == 8)
  {
    CGPathRelease((CGPathRef)self->_value);
  }
  v4.receiver = self;
  v4.super_class = (Class)CMDrawingAction;
  -[CMDrawingAction dealloc](&v4, sel_dealloc);
}

- (CMDrawingAction)initWithType:(int)a3 andFloatValue:(float)a4
{
  self->_type = a3;
  self->_floatValue = a4;
  return self;
}

- (float)floatValue
{
  return self->_floatValue;
}

- (id)description
{
  __CFString *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = CFSTR("CMActionRestoreTransform");
  switch(self->_type)
  {
    case 0:
      v3 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(self->_value, "description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("CMActionAddTransform : %@"), v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 1:
      return v2;
    case 2:
      v2 = CFSTR("CMActionStrokeColor");
      break;
    case 3:
      v2 = CFSTR("CMActionFillColor");
      break;
    case 6:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CMActionLineWidth : %f"), self->_floatValue);
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      v6 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(self->_value, "description");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("CMActionLineDash : %@"), v4);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v2 = (__CFString *)v5;

      break;
    case 8:
      v2 = CFSTR("CMActionPath");
      break;
    default:
      v2 = CFSTR("unknown action");
      break;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
