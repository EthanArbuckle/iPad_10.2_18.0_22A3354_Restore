@implementation _CRLPKStrokeData

- (_CRLPKStrokeData)init
{
  char *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_CRLPKStrokeData;
  v2 = -[_CRLPKStrokeData init](&v4, "init");
  v2[32] = 1;
  *(_OWORD *)(v2 + 8) = xmmword_100EEFCD0;
  *((_QWORD *)v2 + 3) = malloc_type_malloc(0x1F40uLL, 0x905D69DDuLL);
  return (_CRLPKStrokeData *)v2;
}

- (_CRLPKStrokeData)initWithPoints:(CRLPKCompressedStrokePoint *)a3 count:(unint64_t)a4 copy:(BOOL)a5
{
  _BOOL4 v5;
  _CRLPKStrokeData *v8;
  _CRLPKStrokeData *v9;
  size_t v10;
  char *v11;
  objc_super v13;

  v5 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_CRLPKStrokeData;
  v8 = -[_CRLPKStrokeData init](&v13, "init");
  v9 = v8;
  v8->_pointsCount = a4;
  v8->_pointsMaxCount = a4;
  if (v5)
  {
    v8->_pointsOwned = 1;
    v10 = 24 * a4;
    v11 = (char *)malloc_type_malloc(v10, 0x4EB18DDFuLL);
    v9->_points = v11;
    memcpy(v11, a3, v10);
  }
  else
  {
    v8->_pointsOwned = 0;
    v8->_points = (char *)a3;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_pointsOwned)
  {
    free(self->_points);
    self->_points = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_CRLPKStrokeData;
  -[_CRLPKStrokeData dealloc](&v3, "dealloc");
}

@end
