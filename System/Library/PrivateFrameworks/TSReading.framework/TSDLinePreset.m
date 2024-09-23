@implementation TSDLinePreset

- (TSDLinePreset)initWithStroke:(id)a3 headLineEnd:(id)a4 tailLineEnd:(id)a5
{
  TSDLinePreset *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSDLinePreset;
  v8 = -[TSDLinePreset init](&v10, sel_init);
  if (v8)
  {
    v8->mStroke = (TSDStroke *)a3;
    v8->mHeadLineEnd = (TSDLineEnd *)a4;
    v8->mTailLineEnd = (TSDLineEnd *)a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDLinePreset;
  -[TSDLinePreset dealloc](&v3, sel_dealloc);
}

+ (id)lineWithStroke:(id)a3 headLineEnd:(id)a4 tailLineEnd:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithStroke:headLineEnd:tailLineEnd:", a3, a4, a5);
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  void *v5;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4
    && (v5 = v4, -[TSDStroke isEqual:](-[TSDLinePreset stroke](self, "stroke"), "isEqual:", objc_msgSend(v4, "stroke")))
    && -[TSDLineEnd isEqual:](-[TSDLinePreset headLineEnd](self, "headLineEnd"), "isEqual:", objc_msgSend(v5, "headLineEnd")))
  {
    return -[TSDLineEnd isEqual:](-[TSDLinePreset tailLineEnd](self, "tailLineEnd"), "isEqual:", objc_msgSend(v5, "tailLineEnd"));
  }
  else
  {
    return 0;
  }
}

- (TSDLineEnd)headLineEnd
{
  return self->mHeadLineEnd;
}

- (TSDLineEnd)tailLineEnd
{
  return self->mTailLineEnd;
}

- (TSDStroke)stroke
{
  return self->mStroke;
}

@end
