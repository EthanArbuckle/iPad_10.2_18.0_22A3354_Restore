@implementation PFEIFrame

- (void)mapEndElementWithState:(id)a3
{
  id v5;
  id v6;
  THWDrawablesWidgetInfo *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  unint64_t v18;
  __objc2_prot **v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  THWDrawablesWidgetInfo *v28;
  __objc2_prot **v29;
  NSString *v30;
  NSString *v31;
  NSString *v32;
  uint64_t v33;
  double v34;
  void *v35;
  void *v36;
  id v37;
  THImageInfo *v38;
  void *v39;
  id v40;
  void *v41;
  PFEIFrame *v42;
  id v43;
  objc_super v44;

  -[PFXDrawablePlacement mapEndElementWithState:](-[PFEIWidget placement](self, "placement"), "mapEndElementWithState:", a3);
  v5 = objc_msgSend(a3, "currentHtmlStackEntry");
  v6 = objc_msgSend(v5, "currentEntryMediaState");
  v42 = self;
  v7 = -[THWDrawablesWidgetInfo initWithContext:geometry:]([THWDrawablesWidgetInfo alloc], "initWithContext:geometry:", objc_msgSend(a3, "tspContext"), -[PFXDrawablePlacement infoGeometry](-[PFEIWidget placement](self, "placement"), "infoGeometry"));
  v8 = objc_msgSend(v5, "valueForAttribute:", "title");
  if (v8)
  {
    v9 = v8;
    v10 = -[THWDrawablesWidgetInfo accessibilityDescriptions](v7, "accessibilityDescriptions");
    if (!v10)
    {
      v10 = objc_alloc_init((Class)NSMutableDictionary);
      -[THWDrawablesWidgetInfo setAccessibilityDescriptions:](v7, "setAccessibilityDescriptions:", v10);

    }
    objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("widgetTitle"));
  }
  v43 = a3;
  v11 = objc_opt_class(TSUPair);
  v41 = v6;
  TSUDynamicCast(v11, objc_msgSend(objc_msgSend(v6, "childResults"), "firstObject"));
  v13 = v12;
  v14 = objc_opt_class(NSArray);
  TSUDynamicCast(v14, objc_msgSend(v13, "second"));
  v16 = v15;
  v17 = objc_alloc_init((Class)NSMutableArray);
  if (objc_msgSend(v16, "count"))
  {
    v18 = 0;
    v19 = &off_467000;
    do
    {
      v20 = objc_opt_class(TSUPair);
      *(_QWORD *)&v21 = TSUDynamicCast(v20, objc_msgSend(v16, "objectAtIndexedSubscript:", v18)).n128_u64[0];
      v23 = v22;
      v24 = objc_msgSend(v22, "second", v21);
      v25 = objc_opt_class(TSWPStorage);
      if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
      {
        objc_msgSend(v17, "addObject:", v23);
      }
      else if (objc_msgSend(v24, "conformsToProtocol:", v19[79]))
      {
        if (-[THWDrawablesWidgetInfo stageDrawable](v7, "stageDrawable"))
        {
          v26 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
          v27 = v17;
          v28 = v7;
          v29 = v19;
          v30 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFEIFrame mapEndElementWithState:]");
          v31 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/EPUB/PFEIFrame.mm");
          v32 = v30;
          v19 = v29;
          v7 = v28;
          v17 = v27;
          objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v32, v31, 70, CFSTR("Overwriting an existing stage drawable."));
        }
        -[THWDrawablesWidgetInfo setStageDrawable:](v7, "setStageDrawable:", v24);
      }
      ++v18;
    }
    while (v18 < (unint64_t)objc_msgSend(v16, "count"));
  }
  v33 = objc_opt_class(THWMovieInfo);
  *(_QWORD *)&v34 = TSUDynamicCast(v33, -[THWDrawablesWidgetInfo stageDrawable](v7, "stageDrawable")).n128_u64[0];
  v36 = v35;
  if (+[PFXWidget isWidgetExpandedOnly:](PFXWidget, "isWidgetExpandedOnly:", v43, v34))
  {
    if (v36)
    {
      if ((objc_msgSend(v36, "isAudioOnly") & 1) == 0)
      {
        v37 = objc_msgSend(v36, "posterImageData");
        if (v37)
        {
          v38 = -[THImageInfo initWithContext:geometry:style:imageData:originalImageData:]([THImageInfo alloc], "initWithContext:geometry:style:imageData:originalImageData:", objc_msgSend(v36, "context"), -[TSDInfo geometry](-[THWDrawablesWidgetInfo stageDrawable](v7, "stageDrawable"), "geometry"), objc_msgSend(v36, "style"), v37, 0);
          -[THWDrawablesWidgetInfo setStageDrawable:](v7, "setStageDrawable:", v38);
          -[THWDrawablesWidgetInfo setExpandedStageDrawable:](v7, "setExpandedStageDrawable:", v36);
          -[THWDrawablesWidgetInfo setExpandedOnly:](v7, "setExpandedOnly:", 1);
          objc_msgSend(objc_msgSend(objc_msgSend(v43, "orientationState"), "contentNodeBody"), "setExpandedDrawable:forWidgetInfo:", v7, v36);

        }
      }
    }
  }
  v39 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWAutoplayableMedia, -[THWDrawablesWidgetInfo stageDrawable](v7, "stageDrawable"));
  if (v39)
    objc_msgSend(v39, "setAutoplayConfig:", +[PFXAutoplayConfig autoplayConfigWithState:](PFXAutoplayConfig, "autoplayConfigWithState:", v43));
  v40 = objc_msgSend(objc_alloc((Class)TSUPair), "initWithFirst:second:", CFSTR("stage"), v7);
  objc_msgSend(v17, "addObject:", v40);

  objc_msgSend(v41, "setResult:", v17);
  v44.receiver = v42;
  v44.super_class = (Class)PFEIFrame;
  -[PFEIWidget mapEndElementWithState:](&v44, "mapEndElementWithState:", v43);
}

@end
