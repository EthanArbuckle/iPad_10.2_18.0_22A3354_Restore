@implementation OABContent

+ (void)readFromContainer:(id)a3 toDrawable:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v14, "eshGroup");
  if (v10)
    v11 = v10 + 272;
  else
    v11 = 0;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[OABContent readFromContainer:toDrawable:state:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Binary/Mapper/OABContent.mm");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 39, 0, "invalid nil value for '%{public}s'", "srcContentPtr");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  objc_msgSend(a1, "readFromContentObject:content:toDrawable:state:", v14, v11, v8, v9);

}

+ (void)readFromContentObject:(id)a3 toDrawable:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  const void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (const void *)objc_msgSend(v14, "eshObject");
  if (!v10
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[OABContent readFromContentObject:toDrawable:state:]", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/OfficeArt/Binary/Mapper/OABContent.mm");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 49, 0, "invalid nil value for '%{public}s'", "srcContentPtr");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    v11 = 0;
  }
  objc_msgSend(a1, "readFromContentObject:content:toDrawable:state:", v14, v11, v8, v9);

}

+ (void)readFromContentObject:(id)a3 content:(EshContent *)a4 toDrawable:(id)a5 state:(id)a6
{
  id v9;
  uint64_t v10;
  double v11;
  int v12;
  int v13;
  unsigned __int32 v14;
  unsigned __int32 v15;
  void *v16;
  OADOrientedBounds *v17;
  EshContentLocks *v18;
  double v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  EshContentProperties *v25;
  EshContentProperties *v26;
  EshContentProperties *v27;
  uint64_t ShapeID;
  id v29;
  void *v30;
  id v31;
  __n128 v32;
  double v33;
  unsigned __int8 v34;
  unsigned __int8 v35;

  v29 = a3;
  v9 = a5;
  v31 = a6;
  v32 = 0uLL;
  v10 = (*((uint64_t (**)(EshContent *))a4->var0 + 2))(a4);
  *(_QWORD *)&v11 = EshContentProperties::getBounds(v10, &v32).n128_u64[0];
  v13 = v32.n128_u32[0];
  v12 = v32.n128_i32[1];
  v14 = v32.n128_u32[2];
  v15 = v32.n128_u32[3];
  objc_msgSend(v9, "drawableProperties", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(OADOrientedBounds);
  objc_msgSend(v16, "setOrientedBounds:", v17);
  v18 = (EshContentLocks *)(*((uint64_t (**)(EshContent *))a4->var0 + 4))(a4);
  if (EshContentLocks::isAspectRatioSet(v18))
    objc_msgSend(v16, "setAspectRatioLocked:", EshContentLocks::getAspectRatio(v18));
  HIDWORD(v19) = HIDWORD(v33);
  *(float *)&v19 = v33;
  -[OADOrientedBounds setRotation:](v17, "setRotation:", v19, v29);
  -[OADOrientedBounds setFlipX:](v17, "setFlipX:", v34);
  -[OADOrientedBounds setFlipY:](v17, "setFlipY:", v35);
  -[OADOrientedBounds rotation](v17, "rotation");
  v20 = +[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:");
  v21 = (double)v13;
  v22 = (double)v12;
  v23 = (double)(int)(v14 - v13);
  v24 = (double)(int)(v15 - v12);
  if (v20)
    v21 = NSTransposedRectWithSameCenter(v21, v22, v23, v24);
  -[OADOrientedBounds setBounds:](v17, "setBounds:", v21, v22, v23, v24);
  v25 = (EshContentProperties *)(*((uint64_t (**)(EshContent *))a4->var0 + 2))(a4);
  if (EshContentProperties::isWrdInlineSet(v25))
  {
    v26 = (EshContentProperties *)(*((uint64_t (**)(EshContent *))a4->var0 + 2))(a4);
    objc_msgSend(v16, "setWrdInline:", EshContentProperties::getWrdInline(v26));
  }
  v27 = (EshContentProperties *)(*((uint64_t (**)(EshContent *))a4->var0 + 2))(a4);
  ShapeID = EshContentProperties::getShapeID(v27);
  objc_msgSend(v31, "setDrawable:forShapeId:", v9, ShapeID);
  objc_msgSend(v31, "setContentObject:forId:", v30, ShapeID);
  objc_msgSend(v9, "setId:", ShapeID);

}

@end
