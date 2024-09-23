@implementation THWDrawablesWidgetInfo

- (THWDrawablesWidgetInfo)initWithContext:(id)a3 geometry:(id)a4
{
  THWDrawablesWidgetInfo *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWDrawablesWidgetInfo;
  result = -[THWDrawablesWidgetInfo initWithContext:geometry:](&v5, "initWithContext:geometry:", a3, a4);
  if (result)
    result->_containerWrap = 1;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWDrawablesWidgetInfo;
  -[THWDrawablesWidgetInfo dealloc](&v3, "dealloc");
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THWDrawablesWidgetLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THWDrawablesWidgetRep, a2);
}

- (void)setStageDrawable:(id)a3
{
  TSDInfo *stageDrawable;
  TSDInfo *v6;

  stageDrawable = self->_stageDrawable;
  if (stageDrawable != a3)
  {
    -[TSDInfo setParentInfo:](stageDrawable, "setParentInfo:", 0);

    v6 = (TSDInfo *)a3;
    self->_stageDrawable = v6;
    -[TSDInfo setParentInfo:](v6, "setParentInfo:", self);
    objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THWPanelContentProviderHosting, self->_stageDrawable), "setPanelContentProvider:", -[THWDrawablesWidgetInfo adornmentInfo](self, "adornmentInfo"));
  }
}

- (void)setExpandedStageDrawable:(id)a3
{
  TSDInfo *expandedStageDrawable;
  TSDInfo *v6;

  expandedStageDrawable = self->_expandedStageDrawable;
  if (expandedStageDrawable != a3)
  {
    -[TSDInfo setParentInfo:](expandedStageDrawable, "setParentInfo:", 0);

    v6 = (TSDInfo *)a3;
    self->_expandedStageDrawable = v6;
    -[TSDInfo setParentInfo:](v6, "setParentInfo:", self);
    objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THWPanelContentProviderHosting, self->_expandedStageDrawable), "setPanelContentProvider:", -[THWDrawablesWidgetInfo adornmentInfo](self, "adornmentInfo"));
  }
}

- (void)setAdornmentInfo:(id)a3
{
  THWWidgetAdornmentInfo *adornmentInfo;

  adornmentInfo = self->_adornmentInfo;
  if (adornmentInfo != a3)
  {

    self->_adornmentInfo = (THWWidgetAdornmentInfo *)a3;
    objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THWPanelContentProviderHosting, self->_stageDrawable), "setPanelContentProvider:", -[THWDrawablesWidgetInfo adornmentInfo](self, "adornmentInfo"));
    objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THWPanelContentProviderHosting, self->_expandedStageDrawable), "setPanelContentProvider:", -[THWDrawablesWidgetInfo adornmentInfo](self, "adornmentInfo"));
  }
}

- (id)childInfos
{
  THWWidgetAdornmentInfo *v3;
  NSArray *v4;
  TSDInfo *v6;

  v3 = -[THWDrawablesWidgetInfo adornmentInfo](self, "adornmentInfo");
  if (-[THWDrawablesWidgetInfo stageDrawable](self, "stageDrawable"))
  {
    v6 = -[THWDrawablesWidgetInfo stageDrawable](self, "stageDrawable");
    v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1);
  }
  else
  {
    v4 = (NSArray *)&__NSArray0__struct;
  }
  return -[THWWidgetAdornmentInfo interleavedInfosWithInfos:](v3, "interleavedInfosWithInfos:", v4);
}

- (TSWPopUpInfo)popUpInfo
{
  return (TSWPopUpInfo *)objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___TSWPopUpOwner, -[THWDrawablesWidgetInfo stageDrawable](self, "stageDrawable")), "popUpInfo");
}

- (id)childEnumerator
{
  return objc_msgSend(-[THWDrawablesWidgetInfo childInfos](self, "childInfos"), "objectEnumerator");
}

- (BOOL)isExpandedOnly
{
  return self->expandedOnly;
}

- (void)setExpandedOnly:(BOOL)a3
{
  self->expandedOnly = a3;
}

- (THWWidgetAdornmentInfo)adornmentInfo
{
  return self->_adornmentInfo;
}

- (TSDInfo)stageDrawable
{
  return self->_stageDrawable;
}

- (TSDInfo)expandedStageDrawable
{
  return self->_expandedStageDrawable;
}

- (BOOL)containerWrap
{
  return self->_containerWrap;
}

- (void)setContainerWrap:(BOOL)a3
{
  self->_containerWrap = a3;
}

@end
