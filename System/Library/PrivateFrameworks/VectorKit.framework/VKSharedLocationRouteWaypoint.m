@implementation VKSharedLocationRouteWaypoint

- (VKSharedLocationRouteWaypoint)initWithWaypoint:(id)a3 displayInfo:(id)a4 legIndex:(unint64_t)a5 routeCoordinate:(id)a6 adjacentRouteCoordinate:(id)a7 polylineCoordinate:(PolylineCoordinate)a8
{
  VKSharedLocationRouteWaypoint *v8;
  VKSharedLocationRouteWaypoint *v9;
  NSString *customImageKey;
  VKCustomImageProvider *imageProvider;
  VKSharedLocationRouteWaypoint *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VKSharedLocationRouteWaypoint;
  v8 = -[VKRouteWaypointInfo initWithWaypoint:displayInfo:legIndex:routeCoordinate:adjacentRouteCoordinate:polylineCoordinate:waypointType:](&v14, sel_initWithWaypoint_displayInfo_legIndex_routeCoordinate_adjacentRouteCoordinate_polylineCoordinate_waypointType_, a3, a4, a5, a8, 3, a6.var0, a6.var1, a6.var2, a7.var0, a7.var1, a7.var2);
  v9 = v8;
  if (v8)
  {
    customImageKey = v8->_customImageKey;
    v8->_customImageKey = 0;

    imageProvider = v9->_imageProvider;
    v9->_imageProvider = 0;

    v12 = v9;
  }

  return v9;
}

- (void)setImageProvider:(id)a3 withKey:(id)a4
{
  VKCustomImageProvider *v6;
  NSString *v7;
  VKCustomImageProvider *imageProvider;
  NSString *customImageKey;
  VKCustomImageProvider *v10;

  v6 = (VKCustomImageProvider *)a3;
  v7 = (NSString *)a4;
  imageProvider = self->_imageProvider;
  self->_imageProvider = v6;
  v10 = v6;

  customImageKey = self->_customImageKey;
  self->_customImageKey = v7;

}

- (void)setAnnotationText:(id)a3
{
  NSString *v4;
  NSString *annotationText;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_annotationText, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    annotationText = self->_annotationText;
    self->_annotationText = v4;

    -[VKRouteWaypointInfo setNeedsTextUpdate:](self, "setNeedsTextUpdate:", 1);
  }

}

- (NSString)customImageKey
{
  return self->_customImageKey;
}

- (VKCustomImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (NSString)annotationText
{
  return self->_annotationText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationText, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_customImageKey, 0);
}

@end
