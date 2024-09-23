@implementation MapPageRenderer

- (MapPageRenderer)init
{
  MapPageRenderer *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapPageRenderer;
  v2 = -[MapPageRenderer init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.329411765, 0.517647059, 0.709803922, 1.0));
    -[MapPageRenderer setBlueTextColor:](v2, "setBlueTextColor:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.396078431, 0.62745098, 0.992156863, 1.0));
    -[MapPageRenderer setCalloutTextColor:](v2, "setCalloutTextColor:", v4);

  }
  return v2;
}

- (int64_t)numberOfPages
{
  return 1;
}

- ($C79183323B9A0D5602617FF3BE5395AC)visibleMapRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  $C79183323B9A0D5602617FF3BE5395AC result;

  -[MKMapView visibleMapRect](self->_mapView, "visibleMapRect");
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- (void)drawTopContentInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  int v4;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSString *title;
  void *v20;
  double v21;
  double v22;
  void *v23;
  NSString *subTitle;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  CGFloat v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  __CFString *v41;
  void *v42;
  double v43;
  double v44;
  CGFloat v45;
  void *v46;
  id v47;
  CGRect v48;
  CGRect v49;

  v4 = a4;
  -[MapPageRenderer paperRect](self, "paperRect", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  +[PDFUtilities renderDocumentForType:inRect:](PDFUtilities, "renderDocumentForType:inRect:", self->_topContentIconType, 63.0, 36.0, 27.0, 27.0);
  -[UIColor set](self->_blueTextColor, "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 15.0));
  objc_msgSend(v14, "ascender");
  v16 = v15;
  objc_msgSend(v14, "capHeight");
  v18 = v17 - v16 + 36.0 + 2.0;
  title = self->_title;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 15.0));
  -[NSString _maps_drawAtPoint:withFont:](title, "_maps_drawAtPoint:withFont:", v20, 99.0, v18);

  v47 = (id)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 11.0));
  objc_msgSend(v47, "pointSize");
  v22 = 63.0 - v21 + -1.0;
  if (self->_subTitle)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.270000011, 1.0));
    objc_msgSend(v23, "set");

    subTitle = self->_subTitle;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 11.0));
    -[NSString _maps_drawAtPoint:withFont:](subTitle, "_maps_drawAtPoint:withFont:", v25, 99.0, v22);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.670000017, 1.0));
  objc_msgSend(v26, "set");

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Page %1$d of %2$d"), CFSTR("localized string not found"), 0));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v28, (v4 + 1), -[MapPageRenderer numberOfPages](self, "numberOfPages")));

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 11.0));
  objc_msgSend(v29, "_maps_sizeWithFont:", v30);
  v32 = v31;

  v48.origin.x = v7;
  v48.origin.y = v9;
  v48.size.width = v11;
  v48.size.height = v13;
  v33 = CGRectGetMaxX(v48) + -63.0 - v32;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 11.0));
  objc_msgSend(v29, "_maps_drawAtPoint:withFont:", v34, v33, v18 + 4.0);

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.75, 1.0));
  objc_msgSend(v35, "set");

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "model"));

  if ((objc_msgSend(v37, "isEqualToString:", CFSTR("iPhone")) & 1) != 0
    || objc_msgSend(v37, "isEqualToString:", CFSTR("iPhone Simulator")))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v39 = v38;
    v40 = CFSTR("Printed from my iPhone");
  }
  else if ((objc_msgSend(v37, "isEqualToString:", CFSTR("iPad")) & 1) != 0
         || objc_msgSend(v37, "isEqualToString:", CFSTR("iPad Simulator")))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v39 = v38;
    v40 = CFSTR("Printed from my iPad");
  }
  else
  {
    if (!objc_msgSend(v37, "isEqualToString:", CFSTR("iPod touch")))
    {
      v41 = &stru_1011EB268;
      goto LABEL_10;
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v39 = v38;
    v40 = CFSTR("Printed from my iPod touch");
  }
  v41 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", v40, CFSTR("localized string not found"), 0));

LABEL_10:
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 8.0));
  -[__CFString _maps_sizeWithFont:](v41, "_maps_sizeWithFont:", v42);
  v44 = v43;

  v49.origin.x = v7;
  v49.origin.y = v9;
  v49.size.width = v11;
  v49.size.height = v13;
  v45 = CGRectGetMaxX(v49) + -63.0 - v44;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 8.0));
  -[__CFString _maps_drawAtPoint:withFont:](v41, "_maps_drawAtPoint:withFont:", v46, v45, v22 + 3.0);

}

- (void)drawOverview
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  CGFloat v26;
  id v27;
  CGRect v28;
  CGRect v29;

  -[MapPageRenderer overviewRect](self, "overviewRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapPageRenderer snapshotImage](self, "snapshotImage"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapPageRenderer snapshotImage](self, "snapshotImage"));
    objc_msgSend(v12, "drawInRect:", v4, v6, v8, v10);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeTileGroup"));
  v15 = objc_msgSend(v14, "attributionsCount");

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "activeTileGroup"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "attributionAtIndex:", 0));

  }
  else
  {
    v18 = 0;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "badge"));
  v20 = objc_msgSend(v19, "length");

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManager sharedManager](GEOResourceManager, "sharedManager"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "badge"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dataForResourceWithName:fallbackBundle:", v22, 0));

    v27 = objc_msgSend(objc_alloc((Class)UIImage), "_initWithData:scale:", v23, 2.0);
  }
  else
  {
    v27 = 0;
  }
  objc_msgSend(v27, "size");
  v25 = v24;
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  v26 = CGRectGetMinX(v28) + 4.0;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  objc_msgSend(v27, "drawAtPoint:", v26, CGRectGetMaxY(v29) - v25 + -1.0);

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
  v5[2] = sub_10046A78C;
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

  -[MapPageRenderer releaseSnapshotCreator](self, "releaseSnapshotCreator");
  v3.receiver = self;
  v3.super_class = (Class)MapPageRenderer;
  -[MapPageRenderer dealloc](&v3, "dealloc");
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (void)setSubTitle:(id)a3
{
  objc_storeStrong((id *)&self->_subTitle, a3);
}

- (UIColor)blueTextColor
{
  return self->_blueTextColor;
}

- (void)setBlueTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_blueTextColor, a3);
}

- (UIColor)calloutTextColor
{
  return self->_calloutTextColor;
}

- (void)setCalloutTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_calloutTextColor, a3);
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (BOOL)hasSnapshot
{
  return self->_hasSnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotter, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_calloutTextColor, 0);
  objc_storeStrong((id *)&self->_blueTextColor, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
