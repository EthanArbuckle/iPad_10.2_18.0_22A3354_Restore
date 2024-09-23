@implementation CRLShapeItemNeedingPKStrokeUpdate

- (CRLShapeItemNeedingPKStrokeUpdate)initWith:(id)a3 strokeTransformInfoUUID:(id)a4 transformInRoot:(CGAffineTransform *)a5 pkStrokes:(id)a6
{
  id v10;
  id v11;
  id v12;
  CRLShapeItemNeedingPKStrokeUpdate *v13;
  CRLShapeItemNeedingPKStrokeUpdate *v14;
  __int128 v15;
  _OWORD v17[3];
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CRLShapeItemNeedingPKStrokeUpdate;
  v13 = -[CRLShapeItemNeedingPKStrokeUpdate init](&v18, "init");
  v14 = v13;
  if (v13)
  {
    -[CRLShapeItemNeedingPKStrokeUpdate setId:](v13, "setId:", v10);
    -[CRLShapeItemNeedingPKStrokeUpdate setStrokeTransformInfoUUID:](v14, "setStrokeTransformInfoUUID:", v11);
    v15 = *(_OWORD *)&a5->c;
    v17[0] = *(_OWORD *)&a5->a;
    v17[1] = v15;
    v17[2] = *(_OWORD *)&a5->tx;
    -[CRLShapeItemNeedingPKStrokeUpdate setTransformInRoot:](v14, "setTransformInRoot:", v17);
    -[CRLShapeItemNeedingPKStrokeUpdate setPkStrokes:](v14, "setPkStrokes:", v12);
  }

  return v14;
}

- (NSUUID)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
  objc_storeStrong((id *)&self->_id, a3);
}

- (NSUUID)strokeTransformInfoUUID
{
  return self->_strokeTransformInfoUUID;
}

- (void)setStrokeTransformInfoUUID:(id)a3
{
  objc_storeStrong((id *)&self->_strokeTransformInfoUUID, a3);
}

- (CGAffineTransform)transformInRoot
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].c;
  return self;
}

- (void)setTransformInRoot:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transformInRoot.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transformInRoot.tx = v4;
  *(_OWORD *)&self->_transformInRoot.a = v3;
}

- (NSArray)pkStrokes
{
  return self->_pkStrokes;
}

- (void)setPkStrokes:(id)a3
{
  objc_storeStrong((id *)&self->_pkStrokes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pkStrokes, 0);
  objc_storeStrong((id *)&self->_strokeTransformInfoUUID, 0);
  objc_storeStrong((id *)&self->_id, 0);
}

@end
