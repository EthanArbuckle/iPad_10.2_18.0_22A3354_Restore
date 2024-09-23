@implementation MusicMapKitAnnotatedMapSnapshotter

- (MusicMapKitAnnotatedMapSnapshotter)initWithMapItems:(id)a3 mapSize:(CGSize)a4 distance:(double)a5
{
  double height;
  double width;
  id v8;
  MusicMapKitAnnotatedMapSnapshotter *v9;
  id v10;
  id v11;
  void *v12;
  objc_super v14;

  height = a4.height;
  width = a4.width;
  v14.receiver = self;
  v14.super_class = (Class)MusicMapKitAnnotatedMapSnapshotter;
  v8 = a3;
  v9 = -[MusicMapKitAnnotatedMapSnapshotter init](&v14, "init");
  v10 = objc_alloc((Class)MKAnnotatedMapSnapshotter);
  v11 = objc_msgSend(v10, "initWithMapItems:mapSize:useSnapshotService:", v8, 0, width, height, v14.receiver, v14.super_class);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "camera"));
  objc_msgSend(v12, "setCenterCoordinateDistance:", a5);

  -[MusicMapKitAnnotatedMapSnapshotter setMapShapshotter:](v9, "setMapShapshotter:", v11);
  return v9;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MusicMapKitAnnotatedMapSnapshotter mapShapshotter](self, "mapShapshotter"));
  objc_msgSend(v5, "startWithCompletionHandler:", v4);

}

- (MKAnnotatedMapSnapshotter)mapShapshotter
{
  return self->_mapShapshotter;
}

- (void)setMapShapshotter:(id)a3
{
  objc_storeStrong((id *)&self->_mapShapshotter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapShapshotter, 0);
}

@end
