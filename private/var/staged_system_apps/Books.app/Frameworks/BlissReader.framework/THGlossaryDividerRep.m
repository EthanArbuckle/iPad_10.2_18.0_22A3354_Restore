@implementation THGlossaryDividerRep

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)updateLayerGeometryFromLayout:(id)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  -[THGlossaryDividerRep computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:](self, "computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:", &v11, &v8, objc_msgSend(-[THGlossaryDividerRep layout](self, "layout"), "geometry"));
  *((_QWORD *)&v12 + 1) = ceil(*((double *)&v12 + 1));
  v5 = v8;
  v6 = v9;
  v7 = v10;
  -[THGlossaryDividerRep antiAliasDefeatLayerFrame:forTransform:](self, "antiAliasDefeatLayerFrame:forTransform:", &v11, &v5);
  v5 = v8;
  v6 = v9;
  v7 = v10;
  objc_msgSend(a3, "setIfDifferentFrame:orTransform:", &v5, v11, v12);
}

- (void)didUpdateLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THGlossaryDividerRep;
  -[THGlossaryDividerRep didUpdateLayer:](&v4, "didUpdateLayer:");
  objc_msgSend(a3, "setBackgroundColor:", objc_msgSend(objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "colorWithAlphaComponent:", 0.150000006), "CGColor"));
}

@end
