@implementation THWInteractiveImageWidgetInfo

- (NSEnumerator)calloutEnumerator
{
  return -[NSArray objectEnumerator](self->_callouts, "objectEnumerator");
}

- (unint64_t)calloutCount
{
  return -[NSArray count](self->_callouts, "count");
}

- (id)calloutAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_callouts, "objectAtIndex:", a3);
}

- (unint64_t)indexOfCallout:(id)a3
{
  if (a3)
    return -[NSArray indexOfObjectIdenticalTo:](self->_callouts, "indexOfObjectIdenticalTo:");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (double)stageCornerRadius
{
  return 3.0;
}

- (THWInteractiveImageWidgetInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 stageGeometry:(id)a6
{
  THWInteractiveImageWidgetInfo *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THWInteractiveImageWidgetInfo;
  v8 = -[THWInteractiveImageWidgetInfo initWithContext:geometry:](&v10, "initWithContext:geometry:", a3, a4);
  if (v8)
  {
    v8->_style = (TSWWidgetStyle *)a5;
    v8->_stageGeometry = (THWStageGeometry *)a6;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageWidgetInfo;
  -[THWInteractiveImageWidgetInfo dealloc](&v3, "dealloc");
}

- (void)setupWithCallouts:(id)a3 backgroundSize:(CGSize)a4 backgroundImageInfo:(id)a5 useSidebar:(BOOL)a6 showTransportControls:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  double y;
  id v14;
  double v15;
  id v16;

  v7 = a7;
  v8 = a6;
  -[THWInteractiveImageWidgetInfo setBackgroundSize:](self, "setBackgroundSize:", a4.width, a4.height);
  -[THWInteractiveImageWidgetInfo setBackgroundImageInfo:](self, "setBackgroundImageInfo:", a5);
  v12 = objc_alloc((Class)TSDInfoGeometry);
  -[THWStageGeometry frame](-[THWInteractiveImageWidgetInfo stageGeometry](self, "stageGeometry"), "frame");
  y = CGPointZero.y;
  v14 = objc_msgSend(v12, "initWithPosition:size:angle:", CGPointZero.x, y);

  self->_callouts = (NSArray *)objc_msgSend(a3, "copy");
  -[THWInteractiveImageWidgetInfo setUseSidebar:](self, "setUseSidebar:", v8);
  -[THWInteractiveImageWidgetInfo setShowTransportControls:](self, "setShowTransportControls:", v7);
  -[THWStageGeometry frame](-[THWInteractiveImageWidgetInfo stageGeometry](self, "stageGeometry"), "frame");
  v16 = objc_msgSend(objc_alloc((Class)TSDInfoGeometry), "initWithPosition:size:angle:", CGPointZero.x, y, v15, 44.0, 0.0);
  -[THWInteractiveImageWidgetInfo setTransportControlsInfo:](self, "setTransportControlsInfo:", -[THWInteractiveImageRadioPanelInfo initWithGeometry:widgetInfo:]([THWInteractiveImageRadioPanelInfo alloc], "initWithGeometry:widgetInfo:", v16, self));

  -[THWInteractiveImageWidgetInfo p_initZoomLimits](self, "p_initZoomLimits");
}

- (void)p_initZoomLimits
{
  NSEnumerator *v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  void *i;
  void *v10;
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
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  if (self->_callouts
    || (objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWInteractiveImageWidgetInfo p_initZoomLimits]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/InteractiveImage/THWInteractiveImageWidgetInfo.m"), 150, CFSTR("invalid nil value for '%s'"), "_callouts"), self->_callouts))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v3 = -[THWInteractiveImageWidgetInfo calloutEnumerator](self, "calloutEnumerator");
    v4 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v23;
      v7 = 1.0;
      v8 = 1.0;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v6)
            objc_enumerationMutation(v3);
          v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "viewScale");
          if (v8 >= v11)
            v8 = v11;
          objc_msgSend(v10, "viewScale");
          if (v7 < v12)
            v7 = v12;
        }
        v5 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v5);
      v13 = v8 * 0.5;
      v14 = v7 + v7;
    }
    else
    {
      v13 = 0.5;
      v14 = 2.0;
    }
    -[THWStageGeometry frame](-[THWInteractiveImageWidgetInfo stageGeometry](self, "stageGeometry"), "frame");
    v16 = v15;
    -[THWStageGeometry frame](-[THWInteractiveImageWidgetInfo stageGeometry](self, "stageGeometry"), "frame");
    if (v16 >= v17)
      v18 = v17;
    else
      v18 = v16;
    v19 = v14 * (1024.0 / v18);
    v20 = fmin(v13, 0.25);
    if (v19 >= 4.0)
      v21 = v19;
    else
      v21 = 4.0;
    -[THWInteractiveImageWidgetInfo setMinViewScale:](self, "setMinViewScale:", v20);
    -[THWInteractiveImageWidgetInfo setMaxViewScale:](self, "setMaxViewScale:", v21);
  }
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THWInteractiveImageWidgetLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THWInteractiveImageWidgetRep, a2);
}

- (id)childEnumerator
{
  id v3;
  void *v4;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = v3;
  if (self->_adornmentInfo)
    objc_msgSend(v3, "addObject:");
  return objc_msgSend(v4, "objectEnumerator");
}

- (THWWidgetAdornmentInfo)adornmentInfo
{
  return self->_adornmentInfo;
}

- (void)setAdornmentInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSString)progressKitID
{
  return self->_progressKitID;
}

- (void)setProgressKitID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)progressKitSectionID
{
  return self->_progressKitSectionID;
}

- (void)setProgressKitSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (CGSize)backgroundSize
{
  double width;
  double height;
  CGSize result;

  width = self->_backgroundSize.width;
  height = self->_backgroundSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBackgroundSize:(CGSize)a3
{
  self->_backgroundSize = a3;
}

- (id)backgroundFill
{
  return self->_backgroundFill;
}

- (void)setBackgroundFill:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (TSDImageInfo)backgroundImageInfo
{
  return self->_backgroundImageInfo;
}

- (void)setBackgroundImageInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (TSDContainerInfo)zoomedInfo
{
  return self->_zoomedInfo;
}

- (void)setZoomedInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (THWInteractiveImageRadioPanelInfo)transportControlsInfo
{
  return self->_transportControlsInfo;
}

- (void)setTransportControlsInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (double)minZoomScale
{
  return self->_minZoomScale;
}

- (double)maxZoomScale
{
  return self->_maxZoomScale;
}

- (BOOL)showTransportControls
{
  return self->_showTransportControls;
}

- (void)setShowTransportControls:(BOOL)a3
{
  self->_showTransportControls = a3;
}

- (double)sidebarWidth
{
  return self->_sidebarWidth;
}

- (void)setSidebarWidth:(double)a3
{
  self->_sidebarWidth = a3;
}

- (TSWWidgetStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (THWStageGeometry)stageGeometry
{
  return self->_stageGeometry;
}

- (void)setStageGeometry:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 136);
}

- (BOOL)useSidebar
{
  return self->_useSidebar;
}

- (void)setUseSidebar:(BOOL)a3
{
  self->_useSidebar = a3;
}

- (TSSStyle)viewportStyle
{
  return self->_viewportStyle;
}

- (void)setViewportStyle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 144);
}

- (double)minViewScale
{
  return self->_minViewScale;
}

- (void)setMinViewScale:(double)a3
{
  self->_minViewScale = a3;
}

- (double)maxViewScale
{
  return self->_maxViewScale;
}

- (void)setMaxViewScale:(double)a3
{
  self->_maxViewScale = a3;
}

- (THWInteractiveImageSidebarInfo)sidebar
{
  return self->_sidebar;
}

- (void)setSidebar:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

@end
