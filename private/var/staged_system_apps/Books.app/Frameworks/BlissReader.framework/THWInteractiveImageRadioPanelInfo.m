@implementation THWInteractiveImageRadioPanelInfo

- (THWInteractiveImageRadioPanelInfo)initWithGeometry:(id)a3 widgetInfo:(id)a4
{
  THWInteractiveImageRadioPanelInfo *v5;
  THWInteractiveImageRadioPanelInfo *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THWInteractiveImageRadioPanelInfo;
  v5 = -[THWInteractiveImageRadioPanelInfo initWithContext:geometry:](&v8, "initWithContext:geometry:", 0, a3);
  v6 = v5;
  if (v5)
    -[THWInteractiveImageRadioPanelInfo setWidgetInfo:](v5, "setWidgetInfo:", a4);
  return v6;
}

- (id)childInfos
{
  return +[NSArray array](NSArray, "array");
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THWInteractiveImageRadioPanelLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THWInteractiveImageRadioPanelRep, a2);
}

- (THWInteractiveImageWidgetInfo)widgetInfo
{
  return self->mWidgetInfo;
}

- (void)setWidgetInfo:(id)a3
{
  self->mWidgetInfo = (THWInteractiveImageWidgetInfo *)a3;
}

@end
