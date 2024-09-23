@implementation THWGalleryInfo

- (THWGalleryInfo)initWithContext:(id)a3 geometry:(id)a4 style:(id)a5 stageGeometry:(id)a6
{
  THWGalleryInfo *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THWGalleryInfo;
  v8 = -[THWGalleryInfo initWithContext:geometry:](&v10, "initWithContext:geometry:", a3, a4);
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
  v3.super_class = (Class)THWGalleryInfo;
  -[THWGalleryInfo dealloc](&v3, "dealloc");
}

- (void)addItem:(id)a3
{
  NSMutableArray *items;

  if (a3)
  {
    items = self->_items;
    if (!items)
    {
      items = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->_items = items;
    }
    -[NSMutableArray addObject:](items, "addObject:", a3);
    objc_msgSend(objc_msgSend(a3, "imageInfo"), "setParentInfo:", self);
    objc_msgSend(objc_msgSend(a3, "captionStorage"), "setParentInfo:", self);
  }
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THWGalleryLayout, a2);
}

- (Class)repClass
{
  return (Class)objc_opt_class(THWGalleryRep, a2);
}

- (CGPoint)captionPosition
{
  double v2;
  double v3;
  CGPoint result;

  objc_msgSend(-[TSWPShapeInfo geometry](-[THWWidgetAdornmentInfo caption](-[THWGalleryInfo adornmentInfo](self, "adornmentInfo"), "caption"), "geometry"), "position");
  result.y = v3;
  result.x = v2;
  return result;
}

- (NSString)titleString
{
  return (NSString *)-[TSWPStorage string](-[THWWidgetAdornmentInfo titleStorage](-[THWGalleryInfo adornmentInfo](self, "adornmentInfo"), "titleStorage"), "string");
}

- (unint64_t)indexOfItem:(id)a3
{
  return (unint64_t)-[NSMutableArray indexOfObjectIdenticalTo:](self->_items, "indexOfObjectIdenticalTo:", a3);
}

- (id)itemAtIndex:(unint64_t)a3
{
  if ((unint64_t)-[NSMutableArray count](self->_items, "count") <= a3)
    return 0;
  else
    return -[NSMutableArray objectAtIndex:](self->_items, "objectAtIndex:", a3);
}

- (id)childEnumerator
{
  id v3;
  void *v4;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = v3;
  if (self->_items)
    objc_msgSend(v3, "addObjectsFromArray:");
  if (self->_adornmentInfo)
    objc_msgSend(v4, "addObject:");
  return objc_msgSend(v4, "objectEnumerator");
}

- (NSArray)items
{
  return &self->_items->super;
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

- (TSWWidgetStyle)style
{
  return self->_style;
}

- (THWStageGeometry)stageGeometry
{
  return self->_stageGeometry;
}

- (BOOL)thumbnailsVisible
{
  return self->_thumbnailsVisible;
}

- (void)setThumbnailsVisible:(BOOL)a3
{
  self->_thumbnailsVisible = a3;
}

- (double)contentPadding
{
  return self->_contentPadding;
}

- (void)setContentPadding:(double)a3
{
  self->_contentPadding = a3;
}

@end
