@implementation PUDebugImageTableViewController

- (id)jobNumberFromPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v12;

  v3 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("-j[0-9]+(_|.)"), 0, &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  v6 = v5;
  if (v4)
  {
    v7 = objc_msgSend(v4, "rangeOfFirstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    v9 = 0;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v3, "substringWithRange:", v7 + 2, v8 - 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v10, "intValue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    NSLog(CFSTR("PURenderDebugController error:%@"), v5);
    v9 = 0;
  }

  return v9;
}

- (id)pidFromPath:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("_"));
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "substringToIndex:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "intValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v2;
  id v3;
  char v4;
  char v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  NSArray *v27;
  NSArray *v28;
  void *v29;
  unint64_t v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  id v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  NSArray *tableData;
  id obj;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  objc_super v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v62.receiver = self;
  v62.super_class = (Class)PUDebugImageTableViewController;
  -[PUDebugImageTableViewController viewDidLoad](&v62, sel_viewDidLoad);
  +[PURenderDebugController getDebugFiles](PURenderDebugController, "getDebugFiles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v2;
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v55)
  {
    v4 = 0;
    v5 = 0;
    v52 = *MEMORY[0x1E0CB2A38];
    v53 = *(_QWORD *)v59;
    v51 = *MEMORY[0x1E0CB2AF0];
    do
    {
      for (i = 0; i != v55; ++i)
      {
        v7 = v3;
        if (*(_QWORD *)v59 != v53)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v8, "pathExtension");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lowercaseString");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend((id)v10, "isEqual:", CFSTR("txt"));

        v4 |= v11;
        objc_msgSend(v8, "pathExtension");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lowercaseString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = objc_msgSend(v13, "isEqual:", CFSTR("pdf"));

        v5 |= v10;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "attributesOfItemAtPath:error:", v15, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v16, "objectForKey:", v52);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("date"));

        objc_msgSend(v16, "objectForKey:", v51);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("size"));

        objc_msgSend(v8, "path");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v20, CFSTR("path"));

        objc_msgSend(v8, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUDebugImageTableViewController pidFromPath:](self, "pidFromPath:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, CFSTR("pid"));

        objc_msgSend(v8, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUDebugImageTableViewController jobNumberFromPath:](self, "jobNumberFromPath:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, CFSTR("jobNumber"));

        objc_msgSend(v8, "lastPathComponent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v25, CFSTR("filename"));

        v3 = v7;
        objc_msgSend(v7, "addObject:", v17);

      }
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    }
    while (v55);
    v26 = v5 & v4;
  }
  else
  {
    v26 = 0;
  }

  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_674);
  v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if ((v26 & 1) != 0)
  {
    v29 = v3;
    if (-[NSArray count](v27, "count"))
    {
      v30 = 0;
      v31 = 100000.0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](v28, "objectAtIndexedSubscript:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("jobNumber"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          -[NSArray objectAtIndexedSubscript:](v28, "objectAtIndexedSubscript:", v30);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("jobNumber"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "doubleValue");
          v31 = v36;

        }
        else
        {
          v31 = v31 + -0.0001;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndexedSubscript:](v28, "objectAtIndexedSubscript:", v30);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setObject:forKeyedSubscript:", v37, CFSTR("jobNumberSimulated"));

        ++v30;
      }
      while (-[NSArray count](v28, "count") > v30);
    }
    v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (-[NSArray count](v28, "count"))
    {
      v40 = 0;
      do
      {
        -[NSArray objectAtIndexedSubscript:](v28, "objectAtIndexedSubscript:", v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("pid"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          -[NSArray objectAtIndexedSubscript:](v28, "objectAtIndexedSubscript:", v40);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("pid"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSArray objectAtIndexedSubscript:](v28, "objectAtIndexedSubscript:", v40);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectForKeyedSubscript:", CFSTR("date"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "setObject:forKeyedSubscript:", v46, v44);
        }
        ++v40;
      }
      while (-[NSArray count](v28, "count") > v40);
    }
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __46__PUDebugImageTableViewController_viewDidLoad__block_invoke_2;
    v56[3] = &unk_1E589AB58;
    v57 = v39;
    v47 = v39;
    v3 = v29;
    objc_msgSend(v29, "sortedArrayUsingComparator:", v56);
    v48 = objc_claimAutoreleasedReturnValue();

    v28 = (NSArray *)v48;
  }
  tableData = self->_tableData;
  self->_tableData = v28;

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_tableData, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  __CFString *v39;
  void *v40;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("SimpleTableItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("SimpleTableItem"));
  -[NSArray objectAtIndex:](self->_tableData, "objectAtIndex:", objc_msgSend(v6, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v9, "setDateFormat:", CFSTR("MMM dd, HH:mm:ss"));
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB34E8];
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("size"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromByteCount:countStyle:", objc_msgSend(v13, "unsignedLongLongValue"), 0);
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("filename"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "rangeOfString:", CFSTR("_"));
  v40 = (void *)v14;
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v15, "substringFromIndex:", v16 + 1);
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v17;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("jobNumber"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("jobNumber"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("job #%@, "), v20);
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v39 = &stru_1E58AD278;
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pid"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)v11;
  v22 = v6;
  if (v21)
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("pid"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("pid %@, "), v24);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = &stru_1E58AD278;
  }

  v26 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("filename"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "fileURLWithPath:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "pathExtension");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "lowercaseString");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqual:", CFSTR("pdf"));

  objc_msgSend(v7, "textLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setText:", v15);

  if (v31)
    objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setTextColor:", v33);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@ (%@)"), v25, v39, v38, v40);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailTextLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setText:", v35);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  CGPDFDocument *v12;
  CGPDFPage *Page;
  unsigned int width;
  unsigned int height;
  unsigned int v16;
  double v17;
  CGColorSpace *DeviceRGB;
  CGContext *v19;
  CGImage *Image;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  PUScrollImageView *v35;
  PUScrollImageView *v36;
  double v37;
  id v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  CGAffineTransform transform;
  CGAffineTransform v51;
  CGRect BoxRect;
  CGRect v53;

  -[NSArray objectAtIndex:](self->_tableData, "objectAtIndex:", objc_msgSend(a4, "row", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("path"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "pathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lowercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", CFSTR("pdf"));

  if (v11)
  {
    v12 = CGPDFDocumentCreateWithURL((CFURLRef)v8);
    Page = CGPDFDocumentGetPage(v12, 1uLL);
    BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
    width = BoxRect.size.width;
    height = BoxRect.size.height;
    v16 = BoxRect.size.width * BoxRect.size.height;
    if (v16 >= 0x8F0D181)
    {
      v17 = 150000000.0 / (double)v16;
      width = (v17 * (double)width);
      height = (v17 * (double)height);
    }
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v19 = CGBitmapContextCreate(0, width, height, 8uLL, 0, DeviceRGB, 2u);
    CGContextScaleCTM(v19, 1.0, 1.0);
    v53.size.width = (double)width;
    v53.size.height = (double)height;
    memset(&v51, 0, sizeof(v51));
    v53.origin.x = 0.0;
    v53.origin.y = 0.0;
    CGPDFPageGetDrawingTransform(&v51, Page, kCGPDFCropBox, v53, 0, 1);
    transform = v51;
    CGContextConcatCTM(v19, &transform);
    CGContextDrawPDFPage(v19, Page);
    CGPDFDocumentRelease(v12);
    Image = CGBitmapContextCreateImage(v19);
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:scale:orientation:", Image, 0, 1.0);
    CGImageRelease(Image);
    CGContextRelease(v19);
    CGColorSpaceRelease(DeviceRGB);
    -[PUDebugImageTableViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bounds");
    v24 = v23;
    objc_msgSend(v21, "size");
    v26 = v24 / v25;

    -[PUDebugImageTableViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bounds");
    v29 = v28;
    objc_msgSend(v21, "size");
    v31 = v29 / v30;

    objc_msgSend(v21, "size");
    v33 = v32;
    objc_msgSend(v21, "size");
    v35 = -[PUScrollImageView initWithFrame:image:]([PUScrollImageView alloc], "initWithFrame:image:", v21, 0.0, 0.0, v33, v34);
    v36 = v35;
    if (v26 >= v31)
      v37 = v31;
    else
      v37 = v26;
    -[PUScrollImageView setMinimumZoomScale:](v35, "setMinimumZoomScale:", v37);
    -[PUScrollImageView setMaximumZoomScale:](v36, "setMaximumZoomScale:", 6.0);
    -[PUScrollImageView setZoomScale:animated:](v36, "setZoomScale:animated:", 1, v37);
    v38 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
    objc_msgSend(v38, "setView:", v36);
    -[PUDebugImageTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v38, 1, 0);

  }
  else
  {
    objc_msgSend(v8, "pathExtension");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "lowercaseString");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isEqual:", CFSTR("txt"));

    if (v41)
    {
      v42 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "path");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = 0;
      objc_msgSend(v42, "stringWithContentsOfFile:encoding:error:", v43, 4, &v49);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v49;

      if (v45)
      {
        NSLog(CFSTR("PURenderDebugController error:%@"), v45);
      }
      else
      {
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3E50]), "initWithFrame:", 0.0, 0.0, 1024.0, 1024.0);
        objc_msgSend(v46, "setText:", v44);
        objc_msgSend(v46, "setMinimumZoomScale:", 0.5);
        objc_msgSend(v46, "setMaximumZoomScale:", 1.5);
        objc_msgSend(MEMORY[0x1E0DC1350], "monospacedSystemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1450]);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setFont:", v47);

        v48 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
        objc_msgSend(v48, "setView:", v46);
        -[PUDebugImageTableViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v48, 1, 0);

      }
    }
  }

}

- (NSArray)tableData
{
  return (NSArray *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setTableData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1016);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableData, 0);
}

uint64_t __46__PUDebugImageTableViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || !v12)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("date"));
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("date"));
    v14 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
    v12 = (void *)v14;
  }
  v15 = objc_msgSend(v9, "compare:", v12);
  if (!v15)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("jobNumberSimulated"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("jobNumberSimulated"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "compare:", v17);

  }
  if (v15 == 1)
    v18 = -1;
  else
    v18 = 1;

  return v18;
}

uint64_t __46__PUDebugImageTableViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  if (v7 == 1)
    return -1;
  else
    return 1;
}

@end
