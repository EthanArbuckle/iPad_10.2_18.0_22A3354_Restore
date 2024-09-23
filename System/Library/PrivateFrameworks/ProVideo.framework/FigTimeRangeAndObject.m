@implementation FigTimeRangeAndObject

- (id)copyWithRange:(id *)a3
{
  __int128 v4;

  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFigTimeRange:andObject:", &v4, -[FigTimeRangeAndObject object](self, "object", a3->var0.var0, *(_QWORD *)&a3->var0.var1, a3->var0.var3, a3->var1.var0, *(_QWORD *)&a3->var1.var1, a3->var1.var3));
}

+ (id)rangeAndObjectWithRange:(id *)a3 andObject:(id)a4
{
  id v6;
  __int128 v7;
  _OWORD v9[3];

  v6 = objc_alloc((Class)objc_opt_class());
  v7 = *(_OWORD *)&a3->var0.var3;
  v9[0] = *(_OWORD *)&a3->var0.var0;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a3->var1.var1;
  return (id)objc_msgSend(v6, "initWithCMTimeRange:andObject:", v9, a4);
}

- (FigTimeRangeAndObject)initWithFigTimeRange:(id *)a3 andObject:(id)a4
{
  __int128 v4;
  _OWORD v6[3];

  v4 = *(_OWORD *)&a3->var0.var3;
  v6[0] = *(_OWORD *)&a3->var0.var0;
  v6[1] = v4;
  v6[2] = *(_OWORD *)&a3->var1.var1;
  return -[FigTimeRangeAndObject initWithCMTimeRange:andObject:](self, "initWithCMTimeRange:andObject:", v6, a4);
}

- (FigTimeRangeAndObject)initWithCMTimeRange:(id *)a3 andObject:(id)a4
{
  __int128 v5;
  FigTimeRangeAndObject *v6;
  objc_super v8;
  _OWORD v9[3];

  v5 = *(_OWORD *)&a3->var0.var3;
  v9[0] = *(_OWORD *)&a3->var0.var0;
  v9[1] = v5;
  v9[2] = *(_OWORD *)&a3->var1.var1;
  v8.receiver = self;
  v8.super_class = (Class)FigTimeRangeAndObject;
  v6 = -[FigTimeRangeObj initWithCMTimeRange:](&v8, sel_initWithCMTimeRange_, v9);
  if (v6)
    v6->_object = a4;
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigTimeRangeAndObject)initWithCoder:(id)a3
{
  FigTimeRangeAndObject *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigTimeRangeAndObject;
  v4 = -[FigTimeRangeObj initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
    v4->_object = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), CFSTR("object"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FigTimeRangeAndObject;
  -[FigTimeRangeObj encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_object, CFSTR("object"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigTimeRangeAndObject;
  -[FigTimeRangeAndObject dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  __int128 v4;

  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithFigTimeRange:andObject:", &v4, -[FigTimeRangeAndObject object](self, "object", self->super._range.start.value, *(_QWORD *)&self->super._range.start.timescale, self->super._range.start.epoch, self->super._range.duration.value, *(_QWORD *)&self->super._range.duration.timescale, self->super._range.duration.epoch));
}

- (id)representedToolObject
{
  return (id)objc_msgSend(self->_object, "representedToolObject");
}

- (id)object
{
  return self->_object;
}

- (id)startTimeObject
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  if (self)
  {
    -[FigTimeRangeObj range](self, "range");
  }
  else
  {
    v4 = 0u;
    v5 = 0u;
    v3 = 0u;
  }
  v6 = v3;
  v7 = v4;
  return +[FigTimeObj timeWithTime:](FigTimeObj, "timeWithTime:", &v6, v3, v4, v5);
}

- (id)durationObject
{
  __int128 v3;
  _OWORD v4[2];
  __int128 v5;
  uint64_t v6;

  if (self)
  {
    -[FigTimeRangeObj range](self, "range");
  }
  else
  {
    memset(v4, 0, sizeof(v4));
    v3 = 0u;
  }
  v5 = *(_OWORD *)((char *)v4 + 8);
  v6 = *((_QWORD *)&v4[1] + 1);
  return +[FigTimeObj timeWithTime:](FigTimeObj, "timeWithTime:", &v5, v3, *(_QWORD *)&v4[0]);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  __int128 v7;
  __int128 v8;
  int v9;
  __int128 v10;
  CMTimeRange v12;
  CMTimeRange range1;
  CMTimeRange v14;
  CMTimeRange v15;
  CMTimeRange v16;
  uint64_t v17;
  uint64_t v18;

  if (self == a3)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v17 = v3;
    v18 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = *(_OWORD *)&self->super._range.start.epoch;
      *(_OWORD *)&v16.start.value = *(_OWORD *)&self->super._range.start.value;
      *(_OWORD *)&v16.start.epoch = v7;
      *(_OWORD *)&v16.duration.timescale = *(_OWORD *)&self->super._range.duration.timescale;
      v8 = *(_OWORD *)((char *)a3 + 24);
      *(_OWORD *)&v15.start.value = *(_OWORD *)((char *)a3 + 8);
      *(_OWORD *)&v15.start.epoch = v8;
      *(_OWORD *)&v15.duration.timescale = *(_OWORD *)((char *)a3 + 40);
      v9 = CMTimeRangeEqual(&v16, &v15);
      if (v9)
        LOBYTE(v9) = objc_msgSend(self->_object, "isEqual:", *((_QWORD *)a3 + 7));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && !strcmp((const char *)objc_msgSend(a3, "objCType"), "{?={?=qiIq}{?=qiIq}}"))
      {
        objc_msgSend(a3, "getValue:", &v14);
        v10 = *(_OWORD *)&self->super._range.start.epoch;
        *(_OWORD *)&range1.start.value = *(_OWORD *)&self->super._range.start.value;
        *(_OWORD *)&range1.start.epoch = v10;
        *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&self->super._range.duration.timescale;
        v12 = v14;
        LOBYTE(v9) = CMTimeRangeEqual(&range1, &v12) != 0;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
  }
  return v9;
}

- (id)description
{
  __int128 v2;
  CMTimeRange v4;

  v2 = *(_OWORD *)&self->super._range.start.epoch;
  *(_OWORD *)&v4.start.value = *(_OWORD *)&self->super._range.start.value;
  *(_OWORD *)&v4.start.epoch = v2;
  *(_OWORD *)&v4.duration.timescale = *(_OWORD *)&self->super._range.duration.timescale;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@"), PC_CMTimeRangeToString(&v4), self->_object);
}

@end
