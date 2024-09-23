@implementation RouteCellularCoverageDebugOverlayRenderer

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  double var1;
  double var0;
  double v9;
  double v10;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGContext *v21;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v9 = a3.var0.var1;
  v10 = a3.var0.var0;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[RouteCellularCoverageDebugOverlayRenderer overlay](self, "overlay"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100B32FB8;
  v14[3] = &unk_1011E3A78;
  v14[4] = self;
  v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "route"));
  v16 = v10;
  v17 = v9;
  v18 = var0;
  v19 = var1;
  v20 = a4;
  v21 = a5;
  v12 = v15;
  objc_msgSend(v12, "enumerateCellularCoverageRangesWithBlock:", v14);

}

@end
