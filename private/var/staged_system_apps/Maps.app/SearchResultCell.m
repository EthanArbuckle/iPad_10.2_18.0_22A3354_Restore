@implementation SearchResultCell

+ (id)cellWithSearchResult:(id)a3 order:(int64_t)a4 mapType:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)a1), "initWithSearchResult:order:mapType:", v8, a4, a5);

  return v9;
}

- (SearchResultCell)initWithSearchResult:(id)a3 order:(int64_t)a4 mapType:(unint64_t)a5
{
  id v8;
  SearchResultCell *v9;
  SearchResultCell *v10;
  UIColor *v11;
  UIColor *blueTextColor;
  UIColor *v13;
  UIColor *calloutTextColor;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SearchResultCell;
  v9 = -[SearchResultCell init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    -[SearchResultCell setSearchResult:](v9, "setSearchResult:", v8);
    v10->_order = a4;
    v11 = (UIColor *)objc_msgSend(objc_alloc((Class)UIColor), "initWithRed:green:blue:alpha:", 0.254901961, 0.435294118, 0.658823529, 1.0);
    blueTextColor = v10->_blueTextColor;
    v10->_blueTextColor = v11;

    v13 = (UIColor *)objc_msgSend(objc_alloc((Class)UIColor), "initWithRed:green:blue:alpha:", 0.396078431, 0.62745098, 0.992156863, 1.0);
    calloutTextColor = v10->_calloutTextColor;
    v10->_calloutTextColor = v13;

    v10->_mapType = a5;
  }

  return v10;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void)setY:(double)a3
{
  self->_frame.origin.y = a3;
}

- (double)y
{
  return self->_frame.origin.y;
}

- (void)_drawPinInRect:(CGRect)a3 zoomLevel:(double)a4
{
  CGFloat x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  MKMapPoint v18;
  uint64_t v19;
  uint64_t v20;
  CGFloat v21;
  CGFloat tx;
  CGFloat ty;
  CGFloat v24;
  CGFloat MinY;
  CGFloat v26;
  CGFloat v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  double v36;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CLLocationCoordinate2D v42;
  CGRect v43;
  CGRect v44;

  width = a3.size.width;
  height = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[SearchResult _offsetCoordinate:](self->_searchResult, "_offsetCoordinate:", MKZoomScaleForZoomLevelF(self, a2, a4));
  v10 = MKTilePointForCoordinate(v7, v8, v9, a4);
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultCell snapshotImage](self, "snapshotImage"));
  objc_msgSend(v13, "size");
  v15 = v14;
  v17 = v16;

  v36 = v12 - v17 * 0.25;
  -[SearchResult coordinate](self->_searchResult, "coordinate");
  v18 = MKMapPointForCoordinate(v42);
  v21 = MKZoomScaleForZoomLevelF(v19, v20, a4);
  v34 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v35 = *(_OWORD *)&CGAffineTransformIdentity.a;
  tx = CGAffineTransformIdentity.tx;
  ty = CGAffineTransformIdentity.ty;
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  v24 = CGRectGetMinX(v43) - (v10 - v15 * 0.25);
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  MinY = CGRectGetMinY(v44);
  *(_OWORD *)&v40.a = v35;
  *(_OWORD *)&v40.c = v34;
  v40.tx = tx;
  v40.ty = ty;
  CGAffineTransformTranslate(&v41, &v40, v24, MinY - v36);
  v40 = v41;
  CGAffineTransformScale(&v41, &v40, v21, v21);
  v26 = v41.tx + v18.y * v41.c + v41.a * v18.x;
  v27 = v41.ty + v18.y * v41.d + v41.b * v18.x;
  +[PDFUtilities renderDocumentForType:inRect:](PDFUtilities, "renderDocumentForType:inRect:", 6, v26 + -21.2500006, v27 + -55.0, 42.5000012, 50.0);
  -[UIColor set](self->_calloutTextColor, "set");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_order));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v28, 0));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 12.0));
  objc_msgSend(v29, "_maps_sizeWithFont:", v30);
  v32 = v31;

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 12.0));
  objc_msgSend(v29, "_maps_drawAtPoint:withFont:", v33, v26 + v32 * -0.5, v27 + -44.0);

}

- (double)_textLayoutHeight
{
  CGFloat v3;
  double v4;
  double Height;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;

  v3 = CGRectGetMinX(self->_frame) + 135.0;
  v4 = CGRectGetMaxX(self->_frame) - v3;
  Height = CGRectGetHeight(self->_frame);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self->_searchResult, "mapItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.5));
  objc_msgSend(v7, "_maps_sizeWithFont:constrainedToSize:", v8, v4, Height);
  v10 = v9;

  v11 = v10 + 0.0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_addressFormattedAsMultilineAddress"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.5));
  objc_msgSend(v12, "_maps_sizeWithFont:constrainedToSize:", v13, v4, Height);
  v15 = v14;

  v16 = v11 + v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "phoneNumber"));
  if (objc_msgSend(v17, "length"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.5));
    objc_msgSend(v17, "_maps_sizeWithFont:constrainedToSize:", v18, v4, Height);
    v20 = v19;

    v16 = v16 + v20;
  }

  return v16;
}

- (void)drawInRect:(CGRect)a3
{
  void *v4;
  CGFloat v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double MinY;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double Height;
  CGFloat v20;
  CGFloat v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  id v48;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultCell snapshotImage](self, "snapshotImage", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height));

  if (v4)
  {
    v5 = CGRectGetMinX(self->_frame) + 35.0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultCell snapshotImage](self, "snapshotImage"));
    objc_msgSend(v6, "size");
    v8 = v7;
    v10 = v9;

    MinY = CGRectGetMinY(self->_frame);
    v12 = v8 * 0.5;
    v13 = v10 * 0.5;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultCell snapshotImage](self, "snapshotImage"));
    objc_msgSend(v14, "drawInRect:", v5, MinY, v12, v13);

    -[SearchResultCell _drawPinInRect:zoomLevel:](self, "_drawPinInRect:zoomLevel:", v5, MinY, v12, v13, 16.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor lightGrayColor](UIColor, "lightGrayColor"));
    objc_msgSend(v15, "set");

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v5, MinY, v12, v13));
    objc_msgSend(v16, "stroke");

  }
  v17 = CGRectGetMinX(self->_frame) + 135.0;
  v18 = CGRectGetMaxX(self->_frame) - v17;
  Height = CGRectGetHeight(self->_frame);
  v48 = (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.5));
  v20 = CGRectGetHeight(self->_frame) + 5.0;
  -[SearchResultCell _textLayoutHeight](self, "_textLayoutHeight");
  if (v21 > v20)
  {
    v22 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 11.0));

    v48 = (id)v22;
  }
  -[UIColor set](self->_blueTextColor, "set");
  v23 = CGRectGetMinY(self->_frame);
  objc_msgSend(v48, "ascender");
  v25 = v24;
  objc_msgSend(v48, "capHeight");
  v27 = v23 - (v25 - v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResult mapItem](self->_searchResult, "mapItem"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "name"));
  objc_msgSend(v29, "_maps_sizeWithFont:constrainedToSize:", v48, v18, Height);
  v31 = v30;
  v33 = v32;

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "name"));
  objc_msgSend(v34, "_maps_drawInRect:withFont:", v48, v17, v27, v31, v33);

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.289999992, 1.0));
  objc_msgSend(v35, "set");

  v36 = v27 + v33;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_addressFormattedAsMultilineAddress"));
  objc_msgSend(v37, "_maps_sizeWithFont:constrainedToSize:", v48, v18, Height);
  v39 = v38;
  v41 = v40;

  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_addressFormattedAsMultilineAddress"));
  objc_msgSend(v42, "_maps_drawInRect:withFont:", v48, v17, v36, v39, v41);

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "phoneNumber"));
  if (objc_msgSend(v43, "length"))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[CNPhoneNumber phoneNumberWithStringValue:](CNPhoneNumber, "phoneNumberWithStringValue:", v43));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stringValue"));

    if (objc_msgSend(v45, "length"))
    {
      objc_msgSend(v45, "_maps_sizeWithFont:constrainedToSize:", v48, v18, Height);
      objc_msgSend(v45, "_maps_drawInRect:withFont:", v48, v17, v36 + v41, v46, v47);
    }

  }
  else
  {
    v45 = v43;
  }

}

- (id)snapshotBlock
{
  id v3;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003F802C;
  v5[3] = &unk_1011AD1E8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  v3 = objc_msgSend(v5, "copy");
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

- (UIImage)snapshotImage
{
  return -[MKMapSnapshot image](self->_snapshot, "image");
}

- (void)releaseSnapshotCreator
{
  MKMapSnapshotter *snapshotter;

  snapshotter = self->_snapshotter;
  self->_snapshotter = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[SearchResultCell releaseSnapshotCreator](self, "releaseSnapshotCreator");
  v3.receiver = self;
  v3.super_class = (Class)SearchResultCell;
  -[SearchResultCell dealloc](&v3, "dealloc");
}

- (CGPoint)transformedPoint:(CGAffineTransform *)a3
{
  void *v4;
  MKMapPoint v5;
  float64x2_t v6;
  double v7;
  CLLocationCoordinate2D v8;
  CGPoint result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SearchResultCell searchResult](self, "searchResult"));
  objc_msgSend(v4, "coordinate");
  v5 = MKMapPointForCoordinate(v8);

  v6 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v5.y), *(float64x2_t *)&a3->a, v5.x));
  v7 = v6.f64[1];
  result.x = v6.f64[0];
  result.y = v7;
  return result;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
  objc_storeStrong((id *)&self->_searchResult, a3);
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)page
{
  return self->_page;
}

- (void)setPage:(int64_t)a3
{
  self->_page = a3;
}

- (int64_t)order
{
  return self->_order;
}

- (void)setOrder:(int64_t)a3
{
  self->_order = a3;
}

- (BOOL)hasSnapshot
{
  return self->_hasSnapshot;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutTextColor, 0);
  objc_storeStrong((id *)&self->_blueTextColor, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
}

@end
