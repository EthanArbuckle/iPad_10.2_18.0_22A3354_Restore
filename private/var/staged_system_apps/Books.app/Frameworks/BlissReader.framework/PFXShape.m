@implementation PFXShape

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  id v6;
  id v7;
  TSDBezierPath *v8;
  TSDBezierPath *v9;
  PFXDrawablePlacement *mPlacement;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat y;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  double v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  int v47;
  int v48;
  int v49;
  Class *v50;
  const xmlChar *v51;
  const xmlChar *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  TSDInfoGeometry *v57;
  id v58;
  void *v59;
  id v60;
  THWPStorage *v61;
  id v62;
  id v63;
  TSDInfoGeometry *v64;
  void *v65;
  uint64_t v66;
  const CGPath *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  void *v72;
  id v73;
  objc_super v74;
  _BYTE v75[48];
  _OWORD v76[3];
  CGAffineTransform v77;
  CGAffineTransform v78;
  CGAffineTransform v79;
  CGAffineTransform v80;
  CGRect v81;
  CGRect v82;

  v71 = objc_msgSend(a3, "currentHtmlDocMediaState");
  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(v5, "currentEntryMediaState");
  v7 = objc_msgSend(v6, "propertySet");
  v72 = v6;
  if (xmlStrEqual((const xmlChar *)objc_msgSend(v5, "xmlElementName"), (const xmlChar *)"path"))
  {
    v8 = (TSDBezierPath *)PFXBezierPathWithSvgPath((const xmlChar *)objc_msgSend(v5, "xmlValueForAttribute:", "d"));
LABEL_3:
    v9 = v8;
    goto LABEL_4;
  }
  if (xmlStrEqual((const xmlChar *)objc_msgSend(v5, "xmlElementName"), (const xmlChar *)"rect"))
  {
    +[PFXDrawablePlacement boundsWithStackEntry:readerState:](PFXDrawablePlacement, "boundsWithStackEntry:readerState:", v5, a3);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(objc_msgSend(v5, "valueForAttribute:", "rx"), "doubleValue");
    v20 = v19;
    objc_msgSend(objc_msgSend(v5, "valueForAttribute:", "ry"), "doubleValue");
    if (v20 * v21 == 0.0)
    {
      v8 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", v12, v14, v16, v18);
      goto LABEL_3;
    }
    memset(&v80, 0, sizeof(v80));
    CGAffineTransformMakeScale(&v80, 100.0 / v20, 100.0 / v21);
    v79 = v80;
    v81.origin.x = v12;
    v81.origin.y = v14;
    v81.size.width = v16;
    v81.size.height = v18;
    v82 = CGRectApplyAffineTransform(v81, &v79);
    v67 = (const CGPath *)TSDCreateRoundRectPathForRectWithRadius(v82.origin.x, v82.origin.y, v82.size.width, v82.size.height, 100.0);
    v9 = +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", v67);
    CGPathRelease(v67);
    v77 = v80;
    CGAffineTransformInvert(&v78, &v77);
    -[TSDBezierPath transformUsingAffineTransform:](v9, "transformUsingAffineTransform:", &v78);
  }
  else
  {
    v9 = 0;
  }
LABEL_4:
  -[TSDBezierPath bounds](v9, "bounds");
  -[PFXDrawablePlacement setBounds:](self->super.mPlacement, "setBounds:");
  mPlacement = self->super.mPlacement;
  if (mPlacement)
  {
    -[PFXDrawablePlacement affineTransform](mPlacement, "affineTransform");
    mPlacement = self->super.mPlacement;
  }
  else
  {
    memset(v76, 0, sizeof(v76));
  }
  -[PFXDrawablePlacement bounds](mPlacement, "bounds");
  -[PFXDrawablePlacement setInfoGeometry:](self->super.mPlacement, "setInfoGeometry:", +[PFXDrawablePlacement affineGeometryWithAffineTransform:appliedToBounds:](PFXDrawablePlacement, "affineGeometryWithAffineTransform:appliedToBounds:", v76));
  y = CGPointZero.y;
  -[TSDInfoGeometry size](-[PFXDrawablePlacement infoGeometry](self->super.mPlacement, "infoGeometry"), "size");
  v24 = v23;
  v26 = v25;
  -[PFXDrawablePlacement bounds](self->super.mPlacement, "bounds");
  -[TSDBezierPath transformUsingAffineTransform:](v9, "transformUsingAffineTransform:", v75, mapSrcRectOntoDstRect((uint64_t)v75, v27, v28, v29, v30, CGPointZero.x, y, v24, v26));
  v73 = objc_msgSend(objc_alloc((Class)TSDBezierPathSource), "initWithBezierPath:", v9);
  v31 = objc_alloc_init((Class)TSSPropertyMap);
  v32 = +[PFXGraphicStyle mapStrokeFromStyleProperties:contentState:](PFXGraphicStyle, "mapStrokeFromStyleProperties:contentState:", v7, a3);
  if (v32)
    objc_msgSend(v31, "setObject:forProperty:", v32, 517);
  v33 = +[PFXGraphicStyle mapShadowFromStyleProperties:contentState:](PFXGraphicStyle, "mapShadowFromStyleProperties:contentState:", v7, a3);
  if (v33)
    objc_msgSend(v31, "setObject:forProperty:", v33, 520);
  v34 = +[PFXGraphicStyle mapFillFromStyleProperties:contentState:](PFXGraphicStyle, "mapFillFromStyleProperties:contentState:", v7, a3);
  if (v34)
    objc_msgSend(v31, "setObject:forProperty:", v34, 516);
  v35 = +[PFXGraphicStyle mapReflectionFromStyleProperties:](PFXGraphicStyle, "mapReflectionFromStyleProperties:", v7);
  if (v35)
    objc_msgSend(v31, "setObject:forProperty:", v35, 519);
  v36 = +[PFXGraphicStyle mapOpacityFromStyleProperties:](PFXGraphicStyle, "mapOpacityFromStyleProperties:", v7);
  if (v36)
  {
    objc_msgSend(v36, "doubleValue");
    *(float *)&v37 = v37;
    objc_msgSend(v31, "setFloatValue:forProperty:", 518, v37);
  }
  v38 = +[PFXGraphicStyle mapMarkerProperty:fromStyleProperties:contentState:](PFXGraphicStyle, "mapMarkerProperty:fromStyleProperties:contentState:", "marker-start", v7, a3);
  v39 = +[PFXGraphicStyle mapMarkerProperty:fromStyleProperties:contentState:](PFXGraphicStyle, "mapMarkerProperty:fromStyleProperties:contentState:", "marker-end", v7, a3);
  v40 = objc_msgSend(v5, "parentHtmlStackEntry");
  v41 = v5;
  v42 = objc_msgSend(a3, "drawableReaderForCurrentMediaStateWithStackEntry:", v40);
  v43 = objc_opt_class(PFXSvg);
  v68 = v41;
  v69 = v39;
  v70 = v38;
  if ((objc_opt_isKindOfClass(v42, v43) & 1) != 0)
  {
    v44 = objc_msgSend(a3, "drawableReaderForCurrentMediaStateWithStackEntry:", objc_msgSend(v40, "parentHtmlStackEntry"));
    v45 = objc_opt_class(PFXShapeWithText);
    if ((objc_opt_isKindOfClass(v44, v45) & 1) != 0)
    {
      v46 = 0;
      v47 = 0;
      v48 = 1;
      v49 = 1;
      v50 = (Class *)TSWPShapeStyle_ptr;
    }
    else
    {
      v51 = (const xmlChar *)objc_msgSend(v40, "xmlValueForAttribute:", PFXWidgetConstantDataWidgetObjectType[0]);
      if (v51
        && ((v52 = v51, xmlStrEqual(v51, (const xmlChar *)PFXWidgetConstantObjectValueTitle[0]))
         || xmlStrEqual(v52, (const xmlChar *)PFXWidgetConstantObjectValueCaption[0])))
      {
        v48 = 1;
        v50 = (Class *)TSWPShapeStyle_ptr;
      }
      else
      {
        v48 = 0;
        v50 = (Class *)TSDShapeStyle_ptr;
      }
      v53 = v68;
      v49 = 0;
      if (objc_msgSend(v68, "xmlElementId", v68))
        v46 = v53;
      else
        v46 = v40;
      v47 = v48;
    }
  }
  else
  {
    v48 = 0;
    v47 = 0;
    v49 = 0;
    v46 = v41;
    v50 = (Class *)TSDShapeStyle_ptr;
  }
  v54 = objc_msgSend(objc_alloc(*v50), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a3, "tspContext"), 0, v31, 0);
  objc_msgSend(objc_msgSend(v71, "stylesheet"), "addStyle:", v54);

  if (v48)
  {
    v55 = objc_alloc((Class)TSWPShapeInfo);
    v56 = objc_msgSend(a3, "tspContext");
    v57 = -[PFXDrawablePlacement infoGeometry](self->super.mPlacement, "infoGeometry");
    v58 = v56;
    v59 = v73;
    v60 = objc_msgSend(v55, "initWithContext:geometry:style:pathSource:wpStorage:", v58, v57, v54, v73, 0);
    objc_msgSend(v60, "setTextUserEditable:", 0);
    if (((v49 | v47 ^ 1) & 1) == 0)
    {
      v61 = -[THWPStorage initWithContext:string:stylesheet:kind:]([THWPStorage alloc], "initWithContext:string:stylesheet:kind:", objc_msgSend(a3, "tspContext"), &stru_43D7D8, objc_msgSend(v71, "stylesheet"), 3);
      objc_msgSend(v60, "setContainedStorage:", v61);
      objc_msgSend(a3, "setUniqueIdForInfo:withPostfix:fromStackEntry:", v61, CFSTR("storage"), v46);
      objc_msgSend(a3, "setCfiPathForInfo:fromStackEntry:", v61, v68);

      v59 = v73;
    }
  }
  else
  {
    v62 = objc_alloc((Class)TSDShapeInfo);
    v63 = objc_msgSend(a3, "tspContext");
    v64 = -[PFXDrawablePlacement infoGeometry](self->super.mPlacement, "infoGeometry");
    v65 = v62;
    v59 = v73;
    v60 = objc_msgSend(v65, "initWithContext:geometry:style:pathSource:", v63, v64, v54, v73);
  }
  objc_msgSend(v60, "setTailLineEnd:", v70, v68);
  objc_msgSend(v60, "setHeadLineEnd:", v69);
  if (v46)
  {
    v66 = objc_opt_class(TSWPShapeInfo);
    if ((objc_opt_isKindOfClass(v60, v66) & 1) != 0)
      objc_msgSend(a3, "setUniqueIdForInfo:fromStackEntry:", v60, v46);
  }
  objc_msgSend(v72, "setResult:", v60);

  v74.receiver = self;
  v74.super_class = (Class)PFXShape;
  -[PFXDrawable mapEndElementWithState:](&v74, "mapEndElementWithState:", a3);
}

@end
