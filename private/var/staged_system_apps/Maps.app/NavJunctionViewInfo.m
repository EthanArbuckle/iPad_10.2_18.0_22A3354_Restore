@implementation NavJunctionViewInfo

- (NavJunctionViewInfo)initWithGuidanceJunctionViewInfo:(id)a3
{
  id v4;
  NavJunctionViewInfo *v5;
  void *v6;
  NSUUID *v7;
  NSUUID *junctionViewId;
  NSMutableArray *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *imagesData;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NavJunctionViewInfo;
  v5 = -[NavJunctionViewInfo init](&v23, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueID"));
    v7 = (NSUUID *)objc_msgSend(v6, "copy");
    junctionViewId = v5->_junctionViewId;
    v5->_junctionViewId = v7;

    v9 = objc_opt_new(NSMutableArray);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "images", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v14), "imageData"));
          if (v15)
            -[NSMutableArray addObject:](v9, "addObject:", v15);

          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v12);
    }

    v16 = (NSArray *)-[NSMutableArray copy](v9, "copy");
    imagesData = v5->_imagesData;
    v5->_imagesData = v16;

  }
  return v5;
}

- (UIImage)junctionViewImage
{
  UIImage *junctionViewImage;
  void *v4;
  UIImage *v5;
  UIImage *v6;

  junctionViewImage = self->_junctionViewImage;
  if (!junctionViewImage)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewInfo images](self, "images"));
    v5 = (UIImage *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewInfo compositeImages:](self, "compositeImages:", v4));
    v6 = self->_junctionViewImage;
    self->_junctionViewImage = v5;

    junctionViewImage = self->_junctionViewImage;
  }
  return junctionViewImage;
}

- (UIImage)junctionViewDarkenedImage
{
  UIImage *junctionViewDarkenedImage;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIImage *v9;
  UIImage *v10;

  junctionViewDarkenedImage = self->_junctionViewDarkenedImage;
  if (!junctionViewDarkenedImage)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewInfo images](self, "images"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 0.300000012));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_colorizedImageWithColor:", v7));

    if (v8)
      objc_msgSend(v4, "setObject:atIndexedSubscript:", v8, 0);
    v9 = (UIImage *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewInfo compositeImages:](self, "compositeImages:", v4));
    v10 = self->_junctionViewDarkenedImage;
    self->_junctionViewDarkenedImage = v9;

    junctionViewDarkenedImage = self->_junctionViewDarkenedImage;
  }
  return junctionViewDarkenedImage;
}

- (id)images
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_opt_new(NSMutableArray);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewInfo imagesData](self, "imagesData", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8)));
        -[NSMutableArray addObject:](v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)compositeImages:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  id v11;
  double y;
  uint64_t v13;
  void *v14;
  UIImage *ImageFromCurrentImageContext;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  CGSize v23;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    objc_msgSend(v4, "size");
    v6 = v5;
    v8 = v7;

    v23.width = v6;
    v23.height = v8;
    UIGraphicsBeginImageContextWithOptions(v23, 0, 1.0);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v3;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      y = CGPointZero.y;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14), "drawInRect:", CGPointZero.x, y, v6, v8, (_QWORD)v18);
          v14 = (char *)v14 + 1;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v16 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NavJunctionViewInfo;
  v3 = -[NavJunctionViewInfo description](&v10, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("%@\n"), v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewInfo junctionViewId](self, "junctionViewId"));
  objc_msgSend(v5, "appendFormat:", CFSTR("ID: [%@]\n"), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewInfo junctionViewImage](self, "junctionViewImage"));
  objc_msgSend(v5, "appendFormat:", CFSTR("image: %@"), v7);

  v8 = objc_msgSend(v5, "copy");
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavJunctionViewInfo junctionViewId](self, "junctionViewId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "junctionViewId"));
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSUUID)junctionViewId
{
  return self->_junctionViewId;
}

- (NSArray)imagesData
{
  return self->_imagesData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagesData, 0);
  objc_storeStrong((id *)&self->_junctionViewId, 0);
  objc_storeStrong((id *)&self->_junctionViewDarkenedImage, 0);
  objc_storeStrong((id *)&self->_junctionViewImage, 0);
}

@end
