@implementation SSItemImageCollection

- (SSItemImageCollection)initWithImageCollection:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SSItemImageCollection *v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      a3 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(a3);
        v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = -[SSItemImageCollection _newImagesForDictionary:](self, "_newImagesForDictionary:", v9);
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v19;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v19 != v13)
                  objc_enumerationMutation(v10);
                objc_msgSend(v4, "addObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14++));
              }
              while (v12 != v14);
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            }
            while (v12);
          }

        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }
  v15 = -[SSItemImageCollection initWithItemImages:](self, "initWithItemImages:", v4);

  return v15;
}

- (SSItemImageCollection)initWithItemImages:(id)a3
{
  SSItemImageCollection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSItemImageCollection;
  v4 = -[SSItemImageCollection init](&v6, sel_init);
  if (v4)
    v4->_itemImages = (NSArray *)objc_msgSend(a3, "copy");
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSItemImageCollection;
  -[SSItemImageCollection dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5[1] = -[NSArray copyWithZone:](self->_itemImages, "copyWithZone:", a3);
  return v5;
}

- (id)bestImageForSize:(CGSize)a3
{
  id v3;
  id result;

  v3 = -[SSItemImageCollection imagesForSize:](self, "imagesForSize:", a3.width, a3.height);
  result = (id)objc_msgSend(v3, "count");
  if (result)
    return (id)objc_msgSend(v3, "lastObject");
  return result;
}

- (id)imagesForSize:(CGSize)a3
{
  double height;
  double width;
  id v6;
  float v7;
  void *v8;

  height = a3.height;
  width = a3.width;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  GSMainScreenScaleFactor();
  objc_msgSend(v6, "addObjectsFromArray:", -[SSItemImageCollection _imagesForSize:scale:](self, "_imagesForSize:scale:", width, height, v7));
  if (!objc_msgSend(v6, "count"))
    objc_msgSend(v6, "addObjectsFromArray:", -[SSItemImageCollection _imagesForSize:scale:](self, "_imagesForSize:scale:", width, height, 0.0));
  v8 = (void *)objc_msgSend((id)objc_msgSend(v6, "allObjects"), "sortedArrayUsingFunction:context:", __ImageSizeSort, 0);

  return v8;
}

- (id)imagesForKind:(id)a3
{
  void *v5;
  void *v6;
  float v7;
  float v8;
  NSArray *itemImages;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  GSMainScreenScaleFactor();
  v8 = v7;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  itemImages = self->_itemImages;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](itemImages, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = v8;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(itemImages);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v15, "imageKind"), "isEqualToString:", a3))
        {
          objc_msgSend(v15, "imageScale");
          if (v16 == v12)
            objc_msgSend(v6, "addObject:", v15);
          objc_msgSend(v5, "addObject:", v15);
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](itemImages, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }
  if (objc_msgSend(v6, "count"))
    v17 = v6;
  else
    v17 = v5;
  return (id)objc_msgSend(v17, "sortedArrayUsingFunction:context:", __ImageSizeSort, 0);
}

- (id)_imagesForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  void *v8;
  NSArray *itemImages;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  double v25;
  double v26;
  double v27;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  uint64_t k;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  height = a3.height;
  width = a3.width;
  v57 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  itemImages = self->_itemImages;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](itemImages, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v51 != v12)
          objc_enumerationMutation(itemImages);
        v14 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v14, "imageSize");
        if (width == v16 && height == v15)
        {
          if (a4 < 0.00000011920929 || (objc_msgSend(v14, "imageScale"), v18 == a4))
            objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](itemImages, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    }
    while (v11);
  }
  if (!objc_msgSend(v8, "count"))
  {
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v19 = self->_itemImages;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v47 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          objc_msgSend(v24, "imageSize");
          if (SSItemImageSizeEqualToSize(width, height, v25, v26))
          {
            if (a4 < 0.00000011920929 || (objc_msgSend(v24, "imageScale"), v27 == a4))
              objc_msgSend(v8, "addObject:", v24);
          }
        }
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
      }
      while (v21);
    }
  }
  if (!objc_msgSend(v8, "count"))
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v29 = self->_itemImages;
    v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    if (v30)
    {
      v31 = v30;
      v32 = 0;
      v33 = *(_QWORD *)v43;
      v34 = 1.79769313e308;
      v35 = width / height;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v43 != v33)
            objc_enumerationMutation(v29);
          v37 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * k);
          if (a4 >= 0.00000011920929)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * k), "imageScale");
            if (v38 != a4)
              continue;
          }
          objc_msgSend(v37, "imageSize");
          v41 = vabdd_f64(v35, v39 / v40);
          if (v41 < v34)
          {
            v32 = v37;
            v34 = v41;
          }
        }
        v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      }
      while (v31);
      if (v32)
        objc_msgSend(v8, "addObject:", v32);
    }
  }
  return v8;
}

- (id)_newImagesForDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  SSItemArtworkImage *v12;
  SSItemArtworkImage *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("image-type"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(a3);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          v11 = objc_msgSend(a3, "objectForKey:", v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v12 = -[SSItemArtworkImage initWithArtworkDictionary:]([SSItemArtworkImage alloc], "initWithArtworkDictionary:", v11);
            if (-[SSItemArtworkImage URLString](v12, "URLString"))
            {
              -[SSItemArtworkImage setImageKindWithTypeName:variantName:](v12, "setImageKindWithTypeName:variantName:", v5, v10);
              objc_msgSend(v4, "addObject:", v12);
            }

          }
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }
  }
  else
  {
    v13 = -[SSItemArtworkImage initWithArtworkDictionary:]([SSItemArtworkImage alloc], "initWithArtworkDictionary:", a3);
    if (-[SSItemArtworkImage URLString](v13, "URLString"))
      objc_msgSend(v4, "addObject:", v13);

  }
  return v4;
}

- (SSItemImageCollection)initWithXPCEncoding:(id)a3
{
  SSItemImageCollection *v5;
  id v7;
  xpc_object_t value;
  void *v9;
  int64_t count;
  int64_t v11;
  size_t i;
  SSItemArtworkImage *v13;
  SSItemArtworkImage *v14;
  objc_super v15;

  if (a3 && MEMORY[0x1A85863E4](a3, a2) == MEMORY[0x1E0C812F8])
  {
    v15.receiver = self;
    v15.super_class = (Class)SSItemImageCollection;
    v5 = -[SSItemImageCollection init](&v15, sel_init);
    if (v5)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      value = xpc_dictionary_get_value(a3, "0");
      if (value)
      {
        v9 = value;
        if (MEMORY[0x1A85863E4]() == MEMORY[0x1E0C812C8])
        {
          count = xpc_array_get_count(v9);
          if (count >= 1)
          {
            v11 = count;
            for (i = 0; i != v11; ++i)
            {
              v13 = -[SSItemArtworkImage initWithXPCEncoding:]([SSItemArtworkImage alloc], "initWithXPCEncoding:", xpc_array_get_value(v9, i));
              if (v13)
              {
                v14 = v13;
                objc_msgSend(v7, "addObject:", v13);

              }
            }
          }
        }
      }
      v5->_itemImages = (NSArray *)objc_msgSend(v7, "copy");

    }
  }
  else
  {

    return 0;
  }
  return v5;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  xpc_object_t v4;
  NSArray *itemImages;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = xpc_array_create(0, 0);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  itemImages = self->_itemImages;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](itemImages, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(itemImages);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "copyXPCEncoding");
        if (v10)
        {
          v11 = v10;
          xpc_array_append_value(v4, v10);
          xpc_release(v11);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](itemImages, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  xpc_dictionary_set_value(v3, "0", v4);
  xpc_release(v4);
  return v3;
}

- (NSArray)itemImages
{
  return self->_itemImages;
}

@end
