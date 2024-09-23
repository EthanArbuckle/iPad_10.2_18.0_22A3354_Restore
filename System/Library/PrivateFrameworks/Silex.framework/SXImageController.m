@implementation SXImageController

- (void)determineOptimalImagesForComponents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "components");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXImageController determineOptimalImagesForComponents:](self, "determineOptimalImagesForComponents:", v10);
        }
        else
        {
          -[SXImageController imageResourcesForComponent:](self, "imageResourcesForComponent:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXImageController optimalImageResources](self, "optimalImageResources");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "allValues");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObjectsFromArray:", v12);

          -[SXImageController optimalImageResourcesByID](self, "optimalImageResourcesByID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addEntriesFromDictionary:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (NSMutableDictionary)optimalImageResourcesByID
{
  return self->_optimalImageResourcesByID;
}

- (NSMutableOrderedSet)optimalImageResources
{
  return self->_optimalImageResources;
}

- (id)imageResourcesForComponent:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SXImageController imageResourceForImageComponent:](self, "imageResourceForImageComponent:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SXImageController imageResourceForScalableImageComponent:](self, "imageResourceForScalableImageComponent:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[SXImageController imageResourceForVideoComponent:](self, "imageResourceForVideoComponent:", v4);
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[SXImageController imageResourceForAudioComponent:](self, "imageResourceForAudioComponent:", v4);
          v5 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[SXImageController imageResourcesForGalleryComponent:](self, "imageResourcesForGalleryComponent:", v4);
            v5 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v6 = 0;
              goto LABEL_14;
            }
            -[SXImageController imageResourceForDataTableComponent:](self, "imageResourceForDataTableComponent:", v4);
            v5 = objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
  }
  v6 = (void *)v5;
LABEL_14:

  return v6;
}

- (id)allImageResources
{
  void *v2;
  void *v3;

  -[SXImageController optimalImageResources](self, "optimalImageResources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)determineOptimalImagesForMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  -[SXImageController documentController](self, "documentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabBarAppearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SXImageController documentController](self, "documentController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "document");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tabBarAppearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "icon2xImageIdentifier_v2");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v10, "icon2xImageIdentifier_v2");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v12, 1.79769313e308, 1.79769313e308);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[SXImageController optimalImageResources](self, "optimalImageResources");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v13);

        -[SXImageController optimalImageResourcesByID](self, "optimalImageResourcesByID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "icon2xImageIdentifier_v2");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKey:", v13, v16);

      }
    }
    objc_msgSend(v10, "icon3xImageIdentifier_v2");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v10, "icon3xImageIdentifier_v2");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v18, 1.79769313e308, 1.79769313e308);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        -[SXImageController optimalImageResources](self, "optimalImageResources");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v19);

        -[SXImageController optimalImageResourcesByID](self, "optimalImageResourcesByID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "icon3xImageIdentifier_v2");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v19, v22);

      }
    }

  }
  -[SXImageController documentController](self, "documentController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "document");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "metadata");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "feedNavigationAppearance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[SXImageController documentController](self, "documentController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "document");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "metadata");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "feedNavigationAppearance");
    v36 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v36, "iconImageIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v36, "iconImageIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v31, 1.79769313e308, 1.79769313e308);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        -[SXImageController optimalImageResources](self, "optimalImageResources");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v32);

        -[SXImageController optimalImageResourcesByID](self, "optimalImageResourcesByID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "iconImageIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKey:", v32, v35);

      }
    }

  }
}

- (SXImageController)initWithDocumentController:(id)a3 columnCalculator:(id)a4
{
  id v6;
  id v7;
  SXImageController *v8;
  SXImageController *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  SXColumnLayout *columnLayout;
  uint64_t v18;
  NSMutableOrderedSet *optimalImageResources;
  uint64_t v20;
  NSMutableDictionary *optimalImageResourcesByID;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SXImageController;
  v8 = -[SXImageController init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SXImageController viewportSize](v8, "viewportSize");
    v11 = v10;
    v13 = v12;
    objc_storeWeak((id *)&v9->_documentController, v6);
    objc_msgSend(v6, "document");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "columnLayoutWithViewportSize:constrainedToWidth:documentLayout:contentScaleFactor:", v15, v11, v13, v11, 1.0);
    v16 = objc_claimAutoreleasedReturnValue();
    columnLayout = v9->_columnLayout;
    v9->_columnLayout = (SXColumnLayout *)v16;

    objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSet");
    v18 = objc_claimAutoreleasedReturnValue();
    optimalImageResources = v9->_optimalImageResources;
    v9->_optimalImageResources = (NSMutableOrderedSet *)v18;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    optimalImageResourcesByID = v9->_optimalImageResourcesByID;
    v9->_optimalImageResourcesByID = (NSMutableDictionary *)v20;

    -[SXImageController prepareImageResources](v9, "prepareImageResources");
  }

  return v9;
}

- (id)imageResourceForScalableImageComponent:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXImageController viewportSize](self, "viewportSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "imageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v9, v6, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v14 = v9;
    v15[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (CGSize)viewportSize
{
  double width;
  double height;
  void *v6;
  double v7;
  double v8;
  CGSize result;
  CGRect v10;
  CGRect v11;

  width = self->_viewportSize.width;
  height = self->_viewportSize.height;
  if (*MEMORY[0x24BDBF148] == width && *(double *)(MEMORY[0x24BDBF148] + 8) == height)
  {
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = CGRectGetHeight(v10);
    objc_msgSend(v6, "bounds");
    v8 = CGRectGetWidth(v11);
    if (v7 >= v8)
      v8 = v7;
    self->_viewportSize.width = v8;
    self->_viewportSize.height = v8;

    width = self->_viewportSize.width;
    height = self->_viewportSize.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (id)imageResourceForImageComponent:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXImageController sizeConstraintForComponent:](self, "sizeConstraintForComponent:", v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "imageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v9, v6, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v14 = v9;
    v15[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)prepareImageResources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SXImageController documentController](self, "documentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageController determineOptimalImagesForComponents:](self, "determineOptimalImagesForComponents:", v5);

  -[SXImageController documentController](self, "documentController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentStyles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageController determineOptimalImagesForComponentStyles:](self, "determineOptimalImagesForComponentStyles:", v9);

  -[SXImageController determineOptimalImagesForMetadata](self, "determineOptimalImagesForMetadata");
}

- (void)determineOptimalImagesForComponentStyles:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[SXImageController imageResourcesForComponentStyle:](self, "imageResourcesForComponentStyle:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[SXImageController optimalImageResources](self, "optimalImageResources");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "allValues");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObjectsFromArray:", v12);

          -[SXImageController optimalImageResourcesByID](self, "optimalImageResourcesByID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addEntriesFromDictionary:", v10);

        }
        objc_msgSend(v9, "conditional");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "NSArray");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXImageController determineOptimalImagesForComponentStyles:](self, "determineOptimalImagesForComponentStyles:", v15);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (id)imageResourcesForComponentStyle:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a3, "fill");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SXImageController imageResourceForImageFill:](self, "imageResourceForImageFill:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SXImageController imageResourceForVideoFill:](self, "imageResourceForVideoFill:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v6 = 0;
        goto LABEL_8;
      }
      -[SXImageController imageResourceForRepeatableImageFill:](self, "imageResourceForRepeatableImageFill:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
    }
  }
  v6 = (void *)v5;
LABEL_8:

  return v6;
}

- (id)imageResourceForImageIdentifier:(id)a3 constrainedToSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  _BOOL4 v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  double v33;
  double v34;
  double v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  SXImageController *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  height = a4.height;
  width = a4.width;
  v52 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  -[SXImageController imageResourcesForImageIdentifier:](self, "imageResourcesForImageIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = self;
  -[SXImageController optimalImageResourcesByID](self, "optimalImageResourcesByID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v47;
    v15 = 1.79769313e308;
    v16 = height == 1.79769313e308 || width >= height;
    if (v16)
      height = width;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v47 != v14)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v18, "dimensions");
        if (v16)
          v21 = v19;
        else
          v21 = v20;
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "scale");
        v24 = v21 / v23;

        if (height - v24 >= 0.0)
          v25 = height - v24;
        else
          v25 = -(height - v24);
        if (v25 < v15)
        {
          v26 = v18;

          v15 = v25;
          v10 = v26;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v13);
  }

  if (!v10)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v27 = v11;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v28)
    {
      v29 = v28;
      v10 = 0;
      v30 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v43 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          if (v10)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "dimensions");
            v34 = v33;
            objc_msgSend(v10, "dimensions");
            if (v34 <= v35)
              continue;
          }
          v36 = v32;

          v10 = v36;
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v29);
    }
    else
    {
      v10 = 0;
    }

  }
  if (objc_msgSend(MEMORY[0x24BDF69C8], "sx_isSpectreDevice"))
  {
    -[SXImageController taggedEquivalentOfImageResource:](v41, "taggedEquivalentOfImageResource:", v10);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
    {
      v39 = v37;

      v10 = v39;
    }

  }
  return v10;
}

- (id)taggedEquivalentOfImageResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "imageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXImageController Image2ResourcesForImageIdentifier:](self, "Image2ResourcesForImageIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v13, "dimensions", (_QWORD)v23);
        v15 = v14;
        v17 = v16;
        objc_msgSend(v4, "dimensions");
        if (v15 == v19 && v17 == v18)
        {
          v21 = v13;

          v10 = v21;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)imageResourcesForImageIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SXImageController imageResourcesGroupedByImageIdentifier](self, "imageResourcesGroupedByImageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)image2ResourcesGroupedByImageIdentifier
{
  NSDictionary *image2ResourcesGroupedByImageIdentifier;
  NSDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSDictionary *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  image2ResourcesGroupedByImageIdentifier = self->_image2ResourcesGroupedByImageIdentifier;
  if (!image2ResourcesGroupedByImageIdentifier)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[SXImageController documentController](self, "documentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v7;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
          -[SXImageController documentController](self, "documentController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "document");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "resources");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v16, "imageIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              -[NSDictionary objectForKey:](v4, "objectForKey:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v18)
              {
                objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v18, "addObject:", v16);
              -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", v18, v17);

            }
          }

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    v19 = self->_image2ResourcesGroupedByImageIdentifier;
    self->_image2ResourcesGroupedByImageIdentifier = v4;

    image2ResourcesGroupedByImageIdentifier = self->_image2ResourcesGroupedByImageIdentifier;
  }
  return image2ResourcesGroupedByImageIdentifier;
}

- (NSDictionary)imageResourcesGroupedByImageIdentifier
{
  NSDictionary *imageResourcesGroupedByImageIdentifier;
  NSDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSDictionary *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  imageResourcesGroupedByImageIdentifier = self->_imageResourcesGroupedByImageIdentifier;
  if (!imageResourcesGroupedByImageIdentifier)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[SXImageController documentController](self, "documentController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v7;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
          -[SXImageController documentController](self, "documentController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "document");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "resources");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v16, "imageIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              -[NSDictionary objectForKey:](v4, "objectForKey:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v18)
              {
                objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v18, "addObject:", v16);
              -[NSDictionary setObject:forKey:](v4, "setObject:forKey:", v18, v17);

            }
          }

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    v19 = self->_imageResourcesGroupedByImageIdentifier;
    self->_imageResourcesGroupedByImageIdentifier = v4;

    imageResourcesGroupedByImageIdentifier = self->_imageResourcesGroupedByImageIdentifier;
  }
  return imageResourcesGroupedByImageIdentifier;
}

- (SXDocumentController)documentController
{
  return (SXDocumentController *)objc_loadWeakRetained((id *)&self->_documentController);
}

- (id)Image2ResourcesForImageIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SXImageController image2ResourcesGroupedByImageIdentifier](self, "image2ResourcesGroupedByImageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGSize)sizeConstraintForComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  v4 = a3;
  -[SXImageController documentController](self, "documentController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentLayoutForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXImageController columnLayout](self, "columnLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "columnRange");
  objc_msgSend(v8, "widthForColumnRange:ignoreMargin:ignoreGutter:ignoreViewportPadding:", v9, v10, objc_msgSend(v7, "ignoreDocumentMargin"), objc_msgSend(v7, "ignoreDocumentGutter"), objc_msgSend(v7, "ignoreViewportPadding"));
  v12 = v11;

  v13 = 1.79769313e308;
  v14 = v12;
  result.height = v13;
  result.width = v14;
  return result;
}

- (SXColumnLayout)columnLayout
{
  return self->_columnLayout;
}

- (id)imageResourcesForGalleryComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "items", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[SXImageController imageResourceForGalleryItem:](self, "imageResourceForGalleryItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addEntriesFromDictionary:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)imageResourceForGalleryItem:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXImageController viewportSize](self, "viewportSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "imageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v9, v6, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v14 = v9;
    v15[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)imageResourceForVideoComponent:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXImageController sizeConstraintForComponent:](self, "sizeConstraintForComponent:", v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "stillImageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v9, v6, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v14 = v9;
    v15[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)imageResourceForAudioComponent:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXImageController sizeConstraintForComponent:](self, "sizeConstraintForComponent:", v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "stillImageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v9, v6, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v14 = v9;
    v15[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)imageResourceForDataTableComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v27 = v4;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordsUsingSortDescriptors:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v24 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v33;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(obj);
        v25 = v7;
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v7);
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        objc_msgSend(v27, "data");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "descriptors");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v29 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              if (objc_msgSend(v15, "dataType") == 6)
              {
                objc_msgSend(v15, "key");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "valueForKey:", v16);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v18 = v17;
LABEL_16:
                  v19 = v18;
                  if (v18)
                  {
                    -[SXImageController sizeConstraintForComponent:](self, "sizeConstraintForComponent:", v27);
                    -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v19);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v20)
                      objc_msgSend(v26, "setObject:forKey:", v20, v19);

                  }
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v17, "objectForKey:", CFSTR("imageIdentifier"));
                    v18 = (id)objc_claimAutoreleasedReturnValue();
                    goto LABEL_16;
                  }
                }

                continue;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          }
          while (v12);
        }

        v7 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v24);
  }

  return v26;
}

- (id)imageResourceForImageFill:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXImageController viewportSize](self, "viewportSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "imageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v9, v6, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v14 = v9;
    v15[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)imageResourceForRepeatableImageFill:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXImageController viewportSize](self, "viewportSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "imageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v9, v6, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v14 = v9;
    v15[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)imageResourceForVideoFill:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXImageController viewportSize](self, "viewportSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "stillImageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXImageController imageResourceForImageIdentifier:constrainedToSize:](self, "imageResourceForImageIdentifier:constrainedToSize:", v9, v6, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v14 = v9;
    v15[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)allResourcesForImageIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v4;
  -[SXImageController imageResourcesForImageIdentifier:](self, "imageResourcesForImageIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", &__block_literal_global_51);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        if (objc_msgSend(MEMORY[0x24BDF69C8], "sx_isSpectreDevice")
          && (-[SXImageController taggedEquivalentOfImageResource:](self, "taggedEquivalentOfImageResource:", v12),
              (v13 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v14 = (void *)v13;
          objc_msgSend(v5, "addObject:", v13);

        }
        else
        {
          objc_msgSend(v5, "addObject:", v12);
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v5;
}

uint64_t __52__SXImageController_allResourcesForImageIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "dimensions");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "dimensions");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (id)imageResourceForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SXImageController optimalImageResourcesByID](self, "optimalImageResourcesByID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optimalImageResourcesByID, 0);
  objc_storeStrong((id *)&self->_optimalImageResources, 0);
  objc_storeStrong((id *)&self->_columnLayout, 0);
  objc_destroyWeak((id *)&self->_documentController);
  objc_storeStrong((id *)&self->_image2ResourcesGroupedByImageIdentifier, 0);
  objc_storeStrong((id *)&self->_imageResourcesGroupedByImageIdentifier, 0);
}

@end
