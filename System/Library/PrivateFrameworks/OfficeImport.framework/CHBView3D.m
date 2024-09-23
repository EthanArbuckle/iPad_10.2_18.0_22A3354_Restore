@implementation CHBView3D

+ (id)readFrom:(const XlChart3D *)a3
{
  CHDView3D *v4;

  if (a3)
  {
    v4 = objc_alloc_init(CHDView3D);
    -[CHDView3D setRotationX:](v4, "setRotationX:", a3->var3);
    -[CHDView3D setRotationY:](v4, "setRotationY:", a3->var2);
    -[CHDView3D setPerspective:](v4, "setPerspective:", a3->var4);
    -[CHDView3D setRightAngleAxes:](v4, "setRightAngleAxes:", XlChart3D::isPerspective((XlChart3D *)a3) ^ 1);
    -[CHDView3D setDepthPercent:](v4, "setDepthPercent:", a3->var6);
    -[CHDView3D setGapDepthPercent:](v4, "setGapDepthPercent:", a3->var7);
    -[CHDView3D setHeightPercent:](v4, "setHeightPercent:", a3->var5);
    -[CHDView3D setAutoscale:](v4, "setAutoscale:", XlChart3D::is3DScaling((XlChart3D *)a3));
    -[CHDView3D setCluster:](v4, "setCluster:", XlChart3D::isCluster((XlChart3D *)a3));
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (XlChart3D)xlChart3DFrom:(id)a3
{
  id v3;
  XlChart3D *v4;
  __int16 v5;

  v3 = a3;
  if (v3)
  {
    v4 = (XlChart3D *)operator new();
    XlChart3D::XlChart3D(v4);
    v4->var6 = objc_msgSend(v3, "depthPercent");
    v4->var7 = objc_msgSend(v3, "gapDepthPercent");
    v4->var4 = objc_msgSend(v3, "perspective");
    v4->var3 = objc_msgSend(v3, "rotationX");
    if (objc_msgSend(v3, "heightPercent") == -1)
      v5 = 100;
    else
      v5 = objc_msgSend(v3, "heightPercent");
    v4->var5 = v5;
    XlChart3D::set3DScalingFlag(v4, objc_msgSend(v3, "isAutoscale"));
    v4->var2 = objc_msgSend(v3, "rotationY");
    XlChart3D::setPerspectiveFlag(v4, objc_msgSend(v3, "isRightAngleAxes") ^ 1);
    XlChart3D::setClusterFlag(v4, objc_msgSend(v3, "isCluster"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
