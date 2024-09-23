@implementation THWAnchoredWidgetInfo

- (THWAnchoredWidgetInfo)initWithContext:(id)a3 widgetInfo:(id)a4
{
  THWAnchoredWidgetInfo *v5;
  THWWidgetInfo *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THWAnchoredWidgetInfo;
  v5 = -[THWAnchoredWidgetInfo initWithContext:](&v8, "initWithContext:", a3);
  if (v5)
  {
    v6 = (THWWidgetInfo *)a4;
    v5->_widgetInfo = v6;
    -[THWWidgetInfo setParentInfo:](v6, "setParentInfo:", v5);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[THWWidgetInfo setParentInfo:](self->_widgetInfo, "setParentInfo:", 0);

  v3.receiver = self;
  v3.super_class = (Class)THWAnchoredWidgetInfo;
  -[THWAnchoredWidgetInfo dealloc](&v3, "dealloc");
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THWAnchoredWidgetLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THWAnchoredWidgetRep, a2);
}

- (id)childInfos
{
  return 0;
}

- (THWWidgetInfo)widgetInfo
{
  return self->_widgetInfo;
}

@end
