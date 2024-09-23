@implementation TransitDirectionsListImageItem

- (TransitDirectionsListImageItem)initWithImage:(id)a3 instructions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  TransitDirectionsListImageItem *v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, &off_1012703C0);
  v10 = -[TransitDirectionsListImageItem initWithImages:instructions:](self, "initWithImages:instructions:", v9, v7);

  return v10;
}

- (TransitDirectionsListImageItem)initWithImages:(id)a3 instructions:(id)a4
{
  return -[TransitDirectionsListImageItem initWithImages:alternateImages:instructions:](self, "initWithImages:alternateImages:instructions:", a3, 0, a4);
}

- (TransitDirectionsListImageItem)initWithImages:(id)a3 alternateImages:(id)a4 instructions:(id)a5
{
  id v8;
  id v9;
  TransitDirectionsListImageItem *v10;
  NSDictionary *v11;
  NSDictionary *images;
  NSDictionary *v13;
  NSDictionary *alternateImages;
  TransitDirectionsListImageItem *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)TransitDirectionsListImageItem;
  v10 = -[TransitDirectionsListItem initWithInstructions:](&v17, "initWithInstructions:", a5);
  if (v10)
  {
    v11 = (NSDictionary *)objc_msgSend(v8, "copy");
    images = v10->_images;
    v10->_images = v11;

    v13 = (NSDictionary *)objc_msgSend(v9, "copy");
    alternateImages = v10->_alternateImages;
    v10->_alternateImages = v13;

    v15 = v10;
  }

  return v10;
}

- (id)imageSourceForStyle:(unint64_t)a3
{
  NSDictionary *images;
  void *v6;
  void *v7;

  images = self->_images;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](images, "objectForKeyedSubscript:", v6));

  if (a3 && !v7)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_images, "objectForKeyedSubscript:", &off_1012703D8));
  return v7;
}

- (id)alternateImageSourceForStyle:(unint64_t)a3
{
  NSDictionary *alternateImages;
  void *v6;
  void *v7;

  alternateImages = self->_alternateImages;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](alternateImages, "objectForKeyedSubscript:", v6));

  if (a3 && !v7)
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_alternateImages, "objectForKeyedSubscript:", &off_1012703D8));
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateImages, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

@end
