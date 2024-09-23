@implementation CRLBezierHitTesterHitInfoWrapper

- (CRLBezierHitTesterHitInfoWrapper)initWithHitInfo:(id *)a3 hitPath:(id)a4
{
  id v7;
  CRLBezierHitTesterHitInfoWrapper *v8;
  CRLBezierHitTesterHitInfoWrapper *v9;
  CGPoint var0;
  CGPoint var1;
  __int128 v12;
  objc_super v14;

  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CRLBezierHitTesterHitInfoWrapper;
  v8 = -[CRLBezierHitTesterHitInfoWrapper init](&v14, "init");
  v9 = v8;
  if (v8)
  {
    var0 = a3->var0;
    var1 = a3->var1;
    v12 = *(_OWORD *)&a3->var2;
    v8->_hitInfo.distanceBetweenPoints = a3->var4;
    v8->_hitInfo.hitPoint = var1;
    *(_OWORD *)&v8->_hitInfo.hitPathID = v12;
    v8->_hitInfo.testPoint = var0;
    objc_storeStrong((id *)&v8->_hitPath, a4);
  }

  return v9;
}

- (id)description
{
  NSString *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;

  v3 = NSStringFromCGPoint(self->_hitInfo.testPoint);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = NSStringFromCGPoint(self->_hitInfo.hitPoint);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("testPoint: %@ hitPoint: %@ hitPathID: %lu hitPath: %p hitPercentAlongPath:%f distanceBetweenPoints: %f"), v4, v6, self->_hitInfo.hitPathID, self->_hitPath, *(_QWORD *)&self->_hitInfo.hitPercentAlongPath, *(_QWORD *)&self->_hitInfo.distanceBetweenPoints));

  return v7;
}

- ($83CD26A8C5B845DF12AAFDBAEBBD4A79)hitInfo
{
  CGPoint v3;

  v3 = *(CGPoint *)&self->var2;
  retstr->var0 = self->var1;
  retstr->var1 = v3;
  *(_OWORD *)&retstr->var2 = *(_OWORD *)&self->var4;
  retstr->var4 = self[1].var0.y;
  return self;
}

- (CRLBezierPath)hitPath
{
  return self->_hitPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hitPath, 0);
}

@end
