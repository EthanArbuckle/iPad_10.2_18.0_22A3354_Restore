@implementation PFAIAnchoredDrawable

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFAIAnchoredDrawable;
  -[PFAIAnchoredDrawable dealloc](&v3, "dealloc");
}

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

- (id)movieInfoForDrawableWidgetInfo:(id)a3
{
  uint64_t v4;
  id result;
  uint64_t v6;

  v4 = objc_opt_class(THWMovieInfo);
  TSUDynamicCast(v4, objc_msgSend(a3, "stageDrawable"));
  if (!result)
  {
    v6 = objc_opt_class(THWMovieInfo);
    TSUDynamicCast(v6, objc_msgSend(a3, "expandedStageDrawable"));
  }
  return result;
}

- (id)sceneInfoForDrawableWidgetInfo:(id)a3
{
  uint64_t v4;
  id result;
  uint64_t v6;

  v4 = objc_opt_class(THWSceneInfo);
  TSUDynamicCast(v4, objc_msgSend(a3, "stageDrawable"));
  if (!result)
  {
    v6 = objc_opt_class(THWSceneInfo);
    TSUDynamicCast(v6, objc_msgSend(a3, "expandedStageDrawable"));
  }
  return result;
}

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  char *v25;
  id v26;
  THWGutterInfo *v27;
  uint64_t v28;
  double v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  THWPStorage *v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  NSString *v60;
  void *v61;
  id v62;
  NSString *v63;
  double v64;
  id v65;
  id v66;
  uint64_t v67;
  double v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  char v77;
  unsigned int v78;
  id v79;
  uint64_t v80;
  double v81;
  uint64_t v82;
  char *v83;
  double v84;
  double v85;
  double v86;
  BOOL v87;
  double v88;
  double v89;
  double v90;
  id v91;
  double v92;
  id v93;
  id v94;
  void *v95;
  id v96;
  void *v97;
  THWGutterObjectPositioning *v98;
  char *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  uint64_t v105;
  THWGutterInfo *v106;

  v5 = objc_msgSend(a3, "currentStackEntry");
  if (objc_msgSend(objc_msgSend(v5, "flowState"), "childResultCount") == (char *)&dword_0 + 1
    && objc_msgSend(objc_msgSend(v5, "paginatedState"), "childResultCount") == (char *)&dword_0 + 2)
  {
    v6 = objc_opt_class(NSArray);
    *(_QWORD *)&v8 = TSUDynamicCast(v6, objc_msgSend(objc_msgSend(v5, "flowState"), "childResultAtIndex:", 0)).n128_u64[0];
    if (v7)
    {
      v9 = v7;
      if ((unint64_t)objc_msgSend(v7, "count", v8) >= 4)
      {
        v104 = objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet");
        v10 = objc_opt_class(PFSPropertySet);
        TSUDynamicCast(v10, objc_msgSend(v9, "objectAtIndex:", 0));
        v105 = v11;
        v12 = objc_opt_class(TSDInfoGeometry);
        *(_QWORD *)&v13 = TSUDynamicCast(v12, objc_msgSend(v9, "objectAtIndex:", 1)).n128_u64[0];
        v15 = v14;
        if ((unint64_t)objc_msgSend(v9, "count", v13) >= 3)
        {
          v103 = v15;
          v16 = 0;
          v17 = 0;
          v18 = 2;
          do
          {
            v19 = objc_opt_class(TSDImageInfo);
            v21 = TSUDynamicCast(v19, objc_msgSend(v9, "objectAtIndex:", v18)).n128_u64[0];
            if (v20)
            {
              v16 = v20;
            }
            else
            {
              v22 = objc_opt_class(TSWPParagraphStyle);
              v21 = TSUDynamicCast(v22, objc_msgSend(v9, "objectAtIndex:", v18)).n128_u64[0];
              if (v23)
                v17 = v23;
            }
            ++v18;
          }
          while (v18 < (unint64_t)objc_msgSend(v9, "count", *(double *)&v21));
          if (v16)
            v24 = v17 == 0;
          else
            v24 = 1;
          if (!v24)
          {
            v25 = (char *)objc_msgSend(v9, "count");
            v26 = objc_msgSend(objc_msgSend(v5, "paginatedState"), "childResultAtIndex:", 0);
            v102 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWWidgetInfo, v26);
            v27 = -[THWGutterInfo initWithContext:geometry:]([THWGutterInfo alloc], "initWithContext:geometry:", objc_msgSend(a3, "tspContext"), v103);
            v99 = v25;
            v106 = v27;
            if (v25 == (_BYTE *)&dword_4 + 1)
            {
              v28 = objc_opt_class(NSString);
              *(_QWORD *)&v29 = TSUDynamicCast(v28, objc_msgSend(v9, "objectAtIndex:", 2)).n128_u64[0];
              -[THWGutterInfo setGutterOrder:](v106, "setGutterOrder:", objc_msgSend(v30, "integerValue", v29));
              v27 = v106;
            }
            v101 = v26;
            -[THWGutterInfo setAssociatedInfo:](v27, "setAssociatedInfo:", v26);
            objc_msgSend(a3, "addGutterInfo:", v106);
            +[PFXFrameStyle mapContentPaddingFromStyleProperties:contentState:](PFXFrameStyle, "mapContentPaddingFromStyleProperties:contentState:", v105, a3);
            v32 = v31;
            +[PFXFrameStyle mapRadiusFromStyleProperties:contentState:](PFXFrameStyle, "mapRadiusFromStyleProperties:contentState:", v105, a3);
            v34 = v33;
            objc_msgSend(v103, "size");
            v36 = v35;
            objc_msgSend(objc_msgSend(v16, "geometry"), "size");
            if (v36 >= v37 + v32 * 2.0)
            {
              objc_msgSend(objc_msgSend(v16, "geometry"), "size");
              v39 = v40 + v32 * 2.0;
            }
            else
            {
              objc_msgSend(v103, "size");
              v39 = v38;
            }
            objc_msgSend(v103, "size");
            v42 = (v41 - v39) * 0.5;
            objc_msgSend(objc_msgSend(v16, "geometry"), "size");
            v44 = v43 + v32 * 2.0;
            v45 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithPosition:size:", v42, 0.0, v39, v44);
            v100 = +[TSDScalarPathSource roundedRectangleWithScalar:naturalSize:](TSDScalarPathSource, "roundedRectangleWithScalar:naturalSize:", v34, v39, v44);
            v46 = objc_msgSend(v104, "styleWithIdentifier:", CFSTR("TSWWidgetBackgroundShapeStyle"));
            if (!v46)
            {
              v46 = objc_msgSend(objc_alloc((Class)TSDShapeStyle), "initWithContext:", objc_msgSend(a3, "tspContext"));
              objc_msgSend(v46, "setValue:forProperty:", +[TSDColorFill colorWithRed:green:blue:alpha:](TSDColorFill, "colorWithRed:green:blue:alpha:", 0.88627451, 0.91372549, 0.921568627, 1.0), 516);
              objc_msgSend(v46, "setValue:forProperty:", +[TSDStroke strokeWithColor:width:](TSDStroke, "strokeWithColor:width:", +[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", 0.682352941, 0.729411765, 0.745098039, 1.0), 1.0), 517);
              objc_msgSend(v46, "setValue:forProperty:", +[TSDShadow defaultDisabledShadow](TSDShadow, "defaultDisabledShadow"), 520);
              objc_msgSend(v104, "addStyle:withIdentifier:", v46, CFSTR("TSWWidgetBackgroundShapeStyle"));
            }
            v47 = objc_alloc_init((Class)TSSPropertyMap);
            v48 = +[PFXGraphicStyle mapStrokeFromStyleProperties:contentState:](PFXGraphicStyle, "mapStrokeFromStyleProperties:contentState:", v105, a3);
            if (v48)
              objc_msgSend(v47, "setObject:forProperty:", v48, 517);
            v49 = +[PFXGraphicStyle mapShadowFromStyleProperties:contentState:](PFXGraphicStyle, "mapShadowFromStyleProperties:contentState:", v105, a3);
            if (v49)
              objc_msgSend(v47, "setObject:forProperty:", v49, 520);
            v50 = +[PFXGraphicStyle mapFillFromStyleProperties:contentState:](PFXGraphicStyle, "mapFillFromStyleProperties:contentState:", v105, a3);
            if (v50)
              objc_msgSend(v47, "setObject:forProperty:", v50, 516);
            v51 = objc_msgSend(objc_alloc((Class)TSDShapeStyle), "initWithContext:name:overridePropertyMap:isVariation:", objc_msgSend(a3, "tspContext"), 0, v47, 1);
            objc_msgSend(v104, "addStyle:withParent:", v51, v46);

            v52 = objc_msgSend(objc_alloc((Class)TSDShapeInfo), "initWithContext:geometry:style:pathSource:", objc_msgSend(a3, "tspContext"), v45, v51, v100);
            -[THWGutterInfo addChildInfo:](v106, "addChildInfo:", v52);
            -[THWGutterInfo setBackgroundShape:](v106, "setBackgroundShape:", v52);

            if (self->mGutterTitleStorage && v102)
            {
              v53 = -[THWPStorage initWithContext:string:stylesheet:kind:]([THWPStorage alloc], "initWithContext:string:stylesheet:kind:", objc_msgSend(a3, "tspContext"), -[TSWPStorage string](self->mGutterTitleStorage, "string"), v104, -[TSWPStorage wpKind](self->mGutterTitleStorage, "wpKind"));
              v54 = -[TSWPStorage range](self->mGutterTitleStorage, "range");
              -[THWPStorage replaceCharactersInRange:withStorage:usePasteRules:dolcContext:undoTransaction:](v53, "replaceCharactersInRange:withStorage:usePasteRules:dolcContext:undoTransaction:", v54, v55, self->mGutterTitleStorage, 0, 0, 0);
              v56 = -[THWPStorage range](v53, "range");
              -[THWPStorage setParagraphStyle:forCharRange:undoTransaction:](v53, "setParagraphStyle:forCharRange:undoTransaction:", v17, v56, v57, 0);
              objc_msgSend(a3, "setPaginatedAsCurrent");
              v58 = objc_msgSend(objc_msgSend(a3, "currentDocOrientationState"), "contentNodeBody");
              v59 = objc_msgSend(objc_msgSend(objc_msgSend(v102, "adornmentInfo"), "title"), "containedStorage");
              if (v59)
              {
                v60 = (NSString *)objc_msgSend(v58, "nodeUniqueIDForInfo:", v59);
                v61 = v103;
              }
              else
              {
                v62 = objc_msgSend(v5, "xmlElementId");
                v61 = v103;
                if (v62)
                  v63 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s-guttertitle"), v62);
                else
                  v63 = +[NSString stringWithUUID](NSString, "stringWithUUID");
                v60 = v63;
              }
              objc_msgSend(a3, "setFlowAsCurrent");
              objc_msgSend(objc_msgSend(objc_msgSend(a3, "currentDocOrientationState"), "contentNodeBody"), "setNodeUniqueID:forInfo:", v60, v53);
              objc_msgSend(a3, "setUniqueIdForInfo:withPostfix:fromStackEntry:", v53, 0, v5);
              objc_msgSend(v61, "size");
              v65 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, 0, 0, 0, 0.0, v32 + v44, v64, 1.0, 0.0);
              v66 = objc_msgSend(objc_alloc((Class)TSWPShapeInfo), "initWithContext:geometry:style:wpStorage:", objc_msgSend(a3, "tspContext"), v65, objc_msgSend(objc_msgSend(objc_msgSend(v102, "adornmentInfo"), "title"), "tswpShapeStyle"), v53);

              objc_msgSend(v66, "setTextUserEditable:", 0);
              objc_msgSend(v66, "setAllowsLastLineTruncation:", 1);
              objc_msgSend(v66, "setMaxLineCount:", 3);
              objc_msgSend(v66, "setVerticalAlignment:", 0);
              -[THWGutterInfo addChildInfo:](v106, "addChildInfo:", v66);
              -[THWGutterInfo setTitleShape:](v106, "setTitleShape:", v66);

            }
            v67 = objc_opt_class(THWDrawablesWidgetInfo);
            *(_QWORD *)&v68 = TSUDynamicCast(v67, v101).n128_u64[0];
            v70 = v69;
            v71 = -[PFAIAnchoredDrawable movieInfoForDrawableWidgetInfo:](self, "movieInfoForDrawableWidgetInfo:", v69, v68);
            v72 = -[PFAIAnchoredDrawable sceneInfoForDrawableWidgetInfo:](self, "sceneInfoForDrawableWidgetInfo:", v70);
            v73 = objc_msgSend(v71, "copyWithContext:stylesheet:", objc_msgSend(v71, "context"), objc_msgSend(objc_msgSend(a3, "currentHtmlDocMediaState"), "stylesheet"));
            v74 = v101;
            if (v70)
            {
              v75 = objc_msgSend(v70, "expandedStageDrawable", v101);
              v74 = v101;
              if (v75)
              {
                v76 = objc_msgSend(objc_msgSend(v70, "expandedStageDrawable", v101), "repClass");
                v77 = (objc_opt_respondsToSelector(v76, "expandedAllowsPresentationInExpandedForInfo:isReflowablePresentation:") & 1) != 0? objc_msgSend(v76, "expandedAllowsPresentationInExpandedForInfo:isReflowablePresentation:", objc_msgSend(v70, "expandedStageDrawable"), 0) ^ 1: 0;
                v78 = objc_msgSend(v76, "conformsToProtocol:", &OBJC_PROTOCOL___THWExpandedRep);
                v74 = v101;
                if (v78)
                {
                  v74 = v101;
                  if ((v77 & 1) == 0)
                    v74 = objc_msgSend(v70, "expandedStageDrawable", v101);
                }
              }
            }
            -[THWGutterInfo setExpandedDrawableToPresent:](v106, "setExpandedDrawableToPresent:", v74);
            v79 = objc_msgSend(objc_msgSend(v16, "geometry"), "mutableCopy");
            if (objc_msgSend(v73, "isAudioOnly"))
            {
              -[THWGutterInfo addChildInfo:](v106, "addChildInfo:", v73);
              if (objc_msgSend(v73, "posterImageData"))
              {
                v80 = objc_opt_class(TSDImageInfo);
                *(_QWORD *)&v81 = TSUDynamicCast(v80, v16).n128_u64[0];
                objc_msgSend(v73, "setPosterImageInfo:", v82, v81);
              }
              -[THWGutterInfo setStageInfo:](v106, "setStageInfo:", v73);
              v83 = v99;
              if (objc_msgSend(v73, "controlStyle") == 1)
                objc_msgSend(v73, "setControlStyle:", 2);
            }
            else
            {
              -[THWGutterInfo addChildInfo:](v106, "addChildInfo:", v16);
              -[THWGutterInfo setStageInfo:](v106, "setStageInfo:", v16);
              if (v73)
              {
                -[THWGutterInfo setExpandedDrawableToPresent:](v106, "setExpandedDrawableToPresent:", v73);
                objc_msgSend(v73, "setParentInfo:", v70);
              }
              v83 = v99;
              if (v72)
                -[THWGutterInfo setExpandedDrawableToPresent:](v106, "setExpandedDrawableToPresent:", v72);
            }
            objc_msgSend(v79, "size");
            v85 = v84;
            objc_msgSend(-[THWGutterInfo geometry](v106, "geometry"), "size");
            v87 = v85 < v86 + v32 * -2.0;
            v88 = v32;
            if (v87)
            {
              objc_msgSend(-[THWGutterInfo geometry](v106, "geometry", v32), "size");
              v90 = v89;
              v91 = objc_msgSend(v79, "size");
              v88 = TSDFloorForMainScreen(v91, (v90 - v92) * 0.5);
            }
            objc_msgSend(v79, "setPosition:", v88, v32);
            -[TSDDrawableInfo setGeometry:](-[THWGutterInfo stageInfo](v106, "stageInfo"), "setGeometry:", v79);

            v93 = objc_msgSend(objc_msgSend(a3, "flowState"), "characterPositionForDrawableAnchorId:", objc_msgSend(v5, "valueForAttribute:", "data-anchor-ref"));
            if (v93 == (id)0x7FFFFFFFFFFFFFFFLL)
              -[THWGutterInfo setGutterOrder:](v106, "setGutterOrder:", 0x7FFFFFFFFFFFFFFFLL);
            v94 = objc_msgSend(objc_msgSend(a3, "flowState"), "contentNodeBody");
            v95 = v94;
            if (v102)
            {
              objc_msgSend(v94, "setExpandedDrawable:forWidgetInfo:", v106);
              objc_msgSend(v95, "setExpandedDrawable:forWidgetInfo:", v106, -[THWGutterInfo expandedDrawableToPresent](v106, "expandedDrawableToPresent"));
            }
            if (v73 && (objc_msgSend(v73, "isAudioOnly") & 1) == 0)
              objc_msgSend(v95, "setExpandedDrawable:forWidgetInfo:", v106, -[THWGutterInfo expandedDrawableToPresent](v106, "expandedDrawableToPresent"));
            v96 = objc_msgSend(v95, "gutterDrawableStorage");
            v97 = v96;
            if (v83 == (_BYTE *)&dword_4 + 1)
              objc_msgSend(v96, "setShouldUseGutterOrder:", 1);
            v98 = -[THWGutterObjectPositioning initWithContext:]([THWGutterObjectPositioning alloc], "initWithContext:", objc_msgSend(v101, "context"));
            objc_msgSend(v103, "position");
            -[THWGutterObjectPositioning setOffset:](v98, "setOffset:");
            -[THWGutterObjectPositioning setBodyCharIndex:](v98, "setBodyCharIndex:", v93);
            objc_msgSend(v97, "addDrawable:positioning:insertContext:", v106, v98, 0);

          }
        }
      }
    }
  }
}

- (TSWPStorage)gutterTitleStorage
{
  return self->mGutterTitleStorage;
}

- (void)setGutterTitleStorage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
