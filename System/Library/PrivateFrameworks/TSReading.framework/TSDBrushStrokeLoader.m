@implementation TSDBrushStrokeLoader

+ (TSDBrushStrokeLoader)brushStrokeLoaderForCurrentThread
{
  void *v2;
  void *v3;
  TSDBrushStrokeLoader *v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TSDBrushStrokeLoader"));
  v4 = (TSDBrushStrokeLoader *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(TSDBrushStrokeLoader);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("TSDBrushStrokeLoader"));
  }

  return v4;
}

- (id)lineEnd:(id)a3 forStroke:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[TSDBrushStrokeLoader p_loadBrushIfNeeded:](self, "p_loadBrushIfNeeded:", v6);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_lineEnds, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)imageForStroke:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TSDBrushStrokeLoader p_loadBrushIfNeeded:](self, "p_loadBrushIfNeeded:", v4);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_images, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)textureIndexForStroke:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TSDBrushStrokeLoader p_loadBrushIfNeeded:](self, "p_loadBrushIfNeeded:", v4);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_textureIndex, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)optionsForStroke:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TSDBrushStrokeLoader p_loadBrushIfNeeded:](self, "p_loadBrushIfNeeded:", v4);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pathsForStroke:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TSDBrushStrokeLoader p_loadBrushIfNeeded:](self, "p_loadBrushIfNeeded:", v4);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_paths, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)boundsForStroke:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TSDBrushStrokeLoader p_loadBrushIfNeeded:](self, "p_loadBrushIfNeeded:", v4);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_bounds, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)p_brushStrokeLoadQueue
{
  if (p_brushStrokeLoadQueue_onceToken != -1)
    dispatch_once(&p_brushStrokeLoadQueue_onceToken, &__block_literal_global_45);
  return (id)p_brushStrokeLoadQueue_queue;
}

void __46__TSDBrushStrokeLoader_p_brushStrokeLoadQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.iwork.TSDBrushStrokeLoadQueue", 0);
  v1 = (void *)p_brushStrokeLoadQueue_queue;
  p_brushStrokeLoadQueue_queue = (uint64_t)v0;

}

+ (id)p_cacheDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Brushes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

  return v4;
}

+ (double)p_brushPixelScaleAt100Percent
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  return fmax(v4 * sqrt(v7 * v9 / 786432.0), 1.0);
}

- (void)p_loadBrushIfNeeded:(id)a3
{
  NSMutableDictionary *options;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v7 = a3;
  options = self->_options;
  if (!options
    || (-[NSMutableDictionary objectForKey:](options, "objectForKey:", v7),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    +[TSDBrushStrokeLoader p_brushStrokeLoadQueue](TSDBrushStrokeLoader, "p_brushStrokeLoadQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__TSDBrushStrokeLoader_p_loadBrushIfNeeded___block_invoke;
    block[3] = &unk_24D82A3F8;
    block[4] = self;
    v9 = v7;
    dispatch_sync(v6, block);

  }
}

void __44__TSDBrushStrokeLoader_p_loadBrushIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  unint64_t v52;
  xmlDoc *Memory;
  void *v54;
  _BOOL8 v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  const __CFString *v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  +[TSDBrushStrokeLoader p_cacheDirectory](TSDBrushStrokeLoader, "p_cacheDirectory");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 8))
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = v6;

    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 32);
    *(_QWORD *)(v10 + 32) = v9;

    v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 48);
    *(_QWORD *)(v16 + 48) = v15;

    v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(v19 + 24);
    *(_QWORD *)(v19 + 24) = v18;

    objc_msgSend(v65, "stringByAppendingString:", CFSTR("/TSDBrushCacheVersion.txt"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v21, 4, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), 14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22 || (objc_msgSend(v22, "isEqualToString:", v23) & 1) == 0)
    {
      v61 = v23;
      v64 = a1;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = 0;
      objc_msgSend(v24, "contentsOfDirectoryAtPath:error:", v65, &v71);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v71;

      if (!v25)
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStrokeLoader p_loadBrushIfNeeded:]_block_invoke");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStrokeLoader.m");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "description");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, v29, 195, CFSTR("%@"), v30);

      }
      v62 = v22;
      v63 = v21;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v31 = v25;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v68;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v68 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
            if (objc_msgSend(v36, "hasPrefix:", CFSTR("TSDBrush")))
            {
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "stringByAppendingPathComponent:", v36);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = v26;
              v39 = objc_msgSend(v37, "removeItemAtPath:error:", v38, &v66);
              v40 = v66;

              if ((v39 & 1) == 0)
              {
                objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStrokeLoader p_loadBrushIfNeeded:]_block_invoke");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStrokeLoader.m");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "description");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, v43, 198, CFSTR("%@"), v44);

              }
              v26 = v40;
            }
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
        }
        while (v33);
      }

      v23 = v61;
      v21 = v63;
      objc_msgSend(v61, "writeToFile:atomically:encoding:error:", v63, 0, 4, 0);

      a1 = v64;
      v22 = v62;
    }

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 32), "objectForKey:", *(_QWORD *)(a1 + 40));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
  {
    objc_msgSend(CFSTR("TSDBrush_"), "stringByAppendingString:", *(_QWORD *)(a1 + 40));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    TSDBundle();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "pathForResource:ofType:", v46, CFSTR("svg"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = objc_alloc(MEMORY[0x24BDBCE50]);
    objc_msgSend(MEMORY[0x24BDBCF48], "tsu_fileURLWithPath:", v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = (void *)objc_msgSend(v49, "initWithContentsOfURL:options:error:", v50, 0, 0);

    v52 = objc_msgSend(v51, "length");
    if (v52 >> 31)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStrokeLoader p_loadBrushIfNeeded:]_block_invoke");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStrokeLoader.m");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v59, v60, 214, CFSTR("Out-of-bounds type assignment failed"));

    }
    else
    {
      Memory = xmlReadMemory((const char *)objc_msgSend(objc_retainAutorelease(v51), "bytes"), v52, ", 0, 1);
      PerformXPathQuery(Memory, CFSTR("//svg:split-at-sharp-angles[1]"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "count") != 0;

      v72 = CFSTR("split-at-sharp-angles");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v56;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v57, *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "p_loadLineEndsForBrush:inSVGDoc:", *(_QWORD *)(a1 + 40), Memory);
      objc_msgSend(*(id *)(a1 + 32), "p_loadSectionsForBrush:inSVGDoc:", *(_QWORD *)(a1 + 40), Memory);
      xmlFreeDoc(Memory);
    }

  }
}

- (void)p_loadLineEndTextureForBrush:(id)a3 lineEnd:(id)a4 path:(CGPath *)a5 andBounds:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CGImage *Image;
  double v19;
  CGFloat v20;
  double v21;
  CGContext *v22;
  float v23;
  float v24;
  void *v25;
  void *v26;
  void *v27;
  CGAffineTransform v28;
  CGAffineTransform transform;
  CGRect v30;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v12 = a4;
  v13 = a3;
  +[TSDBrushStrokeLoader p_cacheDirectory](TSDBrushStrokeLoader, "p_cacheDirectory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("/TSDBrushEnd_%@_%@.png"), v13, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEB3C90], "imageWithContentsOfFile:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    Image = CGImageRetain((CGImageRef)objc_msgSend(v16, "CGImage"));
  }
  else
  {
    +[TSDBrushStrokeLoader p_brushPixelScaleAt100Percent](TSDBrushStrokeLoader, "p_brushPixelScaleAt100Percent");
    v20 = v19 * 100.0 / height;
    v21 = width * v20;
    v22 = TSDBitmapContextCreate(3, v21);
    CGContextSetRGBFillColor(v22, 1.0, 1.0, 1.0, 1.0);
    v23 = v21;
    v30.size.width = ceilf(v23);
    v24 = height * v20;
    v30.size.height = ceilf(v24);
    v30.origin.x = 0.0;
    v30.origin.y = 0.0;
    CGContextFillRect(v22, v30);
    CGContextSetRGBFillColor(v22, 0.0, 0.0, 0.0, 1.0);
    CGAffineTransformMakeScale(&transform, v20, v20);
    CGContextConcatCTM(v22, &transform);
    CGAffineTransformMakeTranslation(&v28, -x, -y);
    CGContextConcatCTM(v22, &v28);
    CGContextAddPath(v22, a5);
    CGContextFillPath(v22);
    Image = CGBitmapContextCreateImage(v22);
    objc_msgSend(MEMORY[0x24BEB3C90], "imageWithCGImage:", Image);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "PNGRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF48], "tsu_fileURLWithPath:", v15);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "writeToURL:atomically:", v27, 1);
    CGContextRelease(v22);

  }
  CGImageRelease(Image);

}

- (void)p_loadLineEndsForBrush:(id)a3 inSVGDoc:(_xmlDoc *)a4
{
  unint64_t v5;
  uint64_t v6;
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
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  CGFloat b;
  double a;
  double c;
  double d;
  double tx;
  double ty;
  CGPath *v44;
  CGPath *v45;
  CGPath *v46;
  CGPath *v47;
  double MaxX;
  CGFloat MidY;
  void *v50;
  id obj;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  uint64_t v58;
  _xmlDoc *v59;
  id v61;
  uint64_t v62;
  double v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  CGAffineTransform v72;
  CGAffineTransform v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  uint64_t v79;
  CGRect v80;
  CGRect v81;
  CGRect BoundingBox;

  v79 = *MEMORY[0x24BDAC8D0];
  v61 = a3;
  PerformXPathQuery(a4, CFSTR("//svg:path['_wrap'=substring(@id,string-length(@id)-4)]"));
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
  if (v62)
  {
    v58 = *(_QWORD *)v75;
    v5 = 0x24BDD1000uLL;
    v56 = *(double *)(MEMORY[0x24BDBD8B8] + 8);
    v57 = *MEMORY[0x24BDBD8B8];
    v54 = *(double *)(MEMORY[0x24BDBD8B8] + 24);
    v55 = *(double *)(MEMORY[0x24BDBD8B8] + 16);
    v52 = *(double *)(MEMORY[0x24BDBD8B8] + 40);
    v53 = *(double *)(MEMORY[0x24BDBD8B8] + 32);
    v59 = a4;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v75 != v58)
          objc_enumerationMutation(obj);
        v70 = v6;
        objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * v6), "objectForKey:", CFSTR("nodeAttributes"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("d"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("id"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - 5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v5 + 1992), "stringWithFormat:", CFSTR("//svg:path[@id='%@_end']"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PerformXPathQuery(a4, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "count") != 1)
        {
          objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "-[TSDBrushStrokeLoader p_loadLineEndsForBrush:inSVGDoc:]");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStrokeLoader.m");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, v14, 288, CFSTR("Arrow head needs path"));

        }
        v69 = v11;
        objc_msgSend(v11, "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKey:", CFSTR("nodeAttributes"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "objectForKey:", CFSTR("d"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 1992), "stringWithFormat:", CFSTR("//svg:rect[@id='%@_end_bounds']"), v9);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        PerformXPathQuery(a4, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v19, "count") != 1)
        {
          objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "-[TSDBrushStrokeLoader p_loadLineEndsForBrush:inSVGDoc:]");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v5 + 1992), "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStrokeLoader.m");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, v22, 295, CFSTR("Arrow head needs bounding rect"));

        }
        objc_msgSend(v19, "lastObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKey:", CFSTR("nodeAttributes"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "objectForKey:", CFSTR("x"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "doubleValue");
        v27 = v26;
        v64 = v26;

        objc_msgSend(v24, "objectForKey:", CFSTR("y"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "doubleValue");
        v30 = v29;

        v68 = v24;
        objc_msgSend(v24, "objectForKey:", CFSTR("width"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "doubleValue");
        v66 = v32;

        objc_msgSend(v24, "objectForKey:", CFSTR("height"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "doubleValue");
        v35 = v34;
        v65 = v34;

        objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR(" "));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v5 + 1992), "stringWithFormat:", CFSTR("%@:%@"), v61, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v72.a = v57;
        v72.b = v56;
        v72.c = v55;
        v72.d = v54;
        v72.tx = v53;
        v72.ty = v52;
        CGAffineTransformTranslate(&v73, &v72, 0.0, -0.5);
        v72 = v73;
        CGAffineTransformScale(&v73, &v72, 2.0 / v35, 2.0 / v35);
        v72 = v73;
        CGAffineTransformTranslate(&v73, &v72, -v27, -v30);
        v72 = v73;
        CGAffineTransformRotate(&v73, &v72, -1.57079633);
        a = v73.a;
        b = v73.b;
        c = v73.c;
        d = v73.d;
        tx = v73.tx;
        ty = v73.ty;
        v44 = +[TSDSVGToBezierPathConverter newPathFromSVGPathString:](TSDSVGToBezierPathConverter, "newPathFromSVGPathString:", v71);
        v73.a = a;
        v73.b = b;
        v63 = b;
        v73.c = c;
        v73.d = d;
        v73.tx = tx;
        v73.ty = ty;
        v45 = TSDCreateTransformedPath(v44, &v73);
        v46 = +[TSDSVGToBezierPathConverter newPathFromSVGPathString:](TSDSVGToBezierPathConverter, "newPathFromSVGPathString:", v17);
        v73.a = a;
        v73.b = b;
        v73.c = c;
        v73.d = d;
        v73.tx = tx;
        v73.ty = ty;
        v47 = TSDCreateTransformedPath(v46, &v73);
        v67 = v19;
        v80.origin.x = v64;
        v80.origin.y = v30;
        v80.size.width = v66;
        v80.size.height = v65;
        MaxX = CGRectGetMaxX(v80);
        v81.origin.x = v64;
        v81.origin.y = v30;
        v81.size.width = v66;
        v81.size.height = v65;
        MidY = CGRectGetMidY(v81);
        +[TSDLineEnd lineEndWithPath:wrapPath:endPoint:isFilled:identifier:](TSDLineEnd, "lineEndWithPath:wrapPath:endPoint:isFilled:identifier:", v47, v45, 1, v37, tx + c * MidY + a * MaxX, ty + d * MidY + v63 * MaxX);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](self->_lineEnds, "setObject:forKey:", v50, v37);
        BoundingBox = CGPathGetBoundingBox(v45);
        v5 = 0x24BDD1000;
        -[TSDBrushStrokeLoader p_loadLineEndTextureForBrush:lineEnd:path:andBounds:](self, "p_loadLineEndTextureForBrush:lineEnd:path:andBounds:", v61, v37, v47, BoundingBox.origin.x, BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height);
        CGPathRelease(v46);
        CGPathRelease(v47);
        CGPathRelease(v44);
        CGPathRelease(v45);

        v6 = v70 + 1;
        a4 = v59;
      }
      while (v62 != v70 + 1);
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v78, 16);
    }
    while (v62);
  }

}

- (id)p_loadImageForBrush:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  double v13;
  CGContext *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v37;
  double v38;
  double v39;
  unint64_t v40;
  BOOL v41;
  CGImage *Image;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  id obj;
  id v65;
  id v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  TSDBrushStrokeLoader *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  CGAffineTransform v77;
  CGAffineTransform v78;
  CGAffineTransform transform;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;
  CGRect ClipBoundingBox;
  CGRect v93;
  CGRect v94;

  v91 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[TSDBrushStrokeLoader p_cacheDirectory](TSDBrushStrokeLoader, "p_cacheDirectory");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "stringByAppendingFormat:", CFSTR("/TSDBrush_%@.png"), v4);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEB3C90], "imageWithContentsOfFile:");
  v5 = objc_claimAutoreleasedReturnValue();
  v71 = v4;
  v72 = self;
  if (v5)
  {
    v65 = (id)v5;
    goto LABEL_35;
  }
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_paths, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v85 != v11)
          objc_enumerationMutation(v7);
        v10 += objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * i), "count");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
    }
    while (v9);

    if (v10 == 1)
      v13 = 2048.0;
    else
      v13 = 512.0;
  }
  else
  {

    v13 = 512.0;
  }
  v14 = TSDBitmapContextCreate(3, v13);
  CGContextSetRGBFillColor(v14, 0.0, 0.0, 0.0, 1.0);
  ClipBoundingBox = CGContextGetClipBoundingBox(v14);
  CGContextFillRect(v14, ClipBoundingBox);
  CGContextSetRGBFillColor(v14, 1.0, 1.0, 1.0, 1.0);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_paths, "objectForKeyedSubscript:", v71);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "sortedArrayUsingSelector:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v17;
  v67 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
  if (v67)
  {
    v18 = 0;
    v66 = *(id *)v81;
    do
    {
      v19 = 0;
      do
      {
        if (*(id *)v81 != v66)
          objc_enumerationMutation(obj);
        v69 = v19;
        v20 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v19);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_paths, "objectForKeyedSubscript:", v71);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary objectForKeyedSubscript:](self->_bounds, "objectForKeyedSubscript:", v71);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v22, "count"))
        {
          v25 = 0;
          while (1)
          {
            objc_msgSend(v22, "objectAtIndexedSubscript:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v30 = v26;
LABEL_27:
              v31 = v30;
              goto LABEL_29;
            }
            v31 = 0;
LABEL_29:
            objc_msgSend(v24, "objectAtIndexedSubscript:", v25);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "CGRectValue");

            objc_msgSend(v31, "bounds");
            x = v93.origin.x;
            y = v93.origin.y;
            width = v93.size.width;
            height = v93.size.height;
            v37 = fmin(CGRectGetMinX(v93), 0.0);
            v94.origin.x = x;
            v94.origin.y = y;
            v94.size.width = width;
            v94.size.height = height;
            v38 = (double)v18 * 80.0;
            v39 = v13 / (fmax(CGRectGetMaxX(v94), 1.0) - v37);
            v40 = 32;
            do
            {
              CGContextSaveGState(v14);
              CGAffineTransformMakeTranslation(&transform, 0.0, (double)(unint64_t)v38);
              CGContextConcatCTM(v14, &transform);
              CGAffineTransformMakeScale(&v78, v39, (double)v40);
              CGContextConcatCTM(v14, &v78);
              CGAffineTransformMakeTranslation(&v77, -v37, 0.5);
              CGContextConcatCTM(v14, &v77);
              CGContextAddPath(v14, (CGPathRef)objc_msgSend(v31, "CGPath"));
              CGContextFillPath(v14);
              v38 = (double)(v40 + (unint64_t)v38) + 4.0;
              CGContextRestoreGState(v14);
              v41 = v40 > 3;
              v40 >>= 1;
            }
            while (v41);
            ++v18;

            if (++v25 >= (unint64_t)objc_msgSend(v22, "count"))
              goto LABEL_32;
          }
          if (!objc_msgSend(v26, "count"))
          {
            objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStrokeLoader p_loadImageForBrush:]");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStrokeLoader.m");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, v29, 377, CFSTR("got empty array in _paths"));

          }
          objc_msgSend(v26, "firstObject");
          v30 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_27;
        }
LABEL_32:

        v19 = v69 + 1;
        self = v72;
      }
      while ((id)(v69 + 1) != v67);
      v67 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
    }
    while (v67);
  }

  Image = CGBitmapContextCreateImage(v14);
  objc_msgSend(MEMORY[0x24BEB3C90], "imageWithCGImage:", Image);
  v65 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "PNGRepresentation");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "tsu_fileURLWithPath:", v63);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "writeToURL:atomically:", v44, 1);
  CGImageRelease(Image);
  CGContextRelease(v14);

  v4 = v71;
LABEL_35:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_textureIndex, "setObject:forKey:", v45, v4);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_paths, "objectForKeyedSubscript:", v4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "allKeys");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v47, "sortedArrayUsingSelector:", sel_compare_);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v68 = v48;
  v49 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
  if (v49)
  {
    v50 = v49;
    v51 = 0;
    v70 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v50; ++j)
      {
        if (*(_QWORD *)v74 != v70)
          objc_enumerationMutation(v68);
        v53 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_paths, "objectForKeyedSubscript:", v4);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKeyedSubscript:", v53);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v55, "count"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setObject:forKeyedSubscript:", v56, v53);

        if (objc_msgSend(v55, "count"))
        {
          v57 = 0;
          do
          {
            objc_msgSend(v45, "objectForKeyedSubscript:", v53);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v51 + v57);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "addObject:", v59);

            ++v57;
          }
          while (v57 < objc_msgSend(v55, "count"));
          v51 += v57;
          v4 = v71;
        }

        self = v72;
      }
      v50 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
    }
    while (v50);
  }
  else
  {
    v51 = 0;
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v51);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v60, CFSTR("section-count"));

  return v65;
}

- (void)p_loadSectionsForBrush:(id)a3 inSVGDoc:(_xmlDoc *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  CGPath *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  TSDBrushStrokeLoader *v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v51;
  void *v52;
  void *v53;
  const CGPath *path;
  void *v55;
  void *v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGAffineTransform v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[NSMutableDictionary objectForKey:](self->_paths, "objectForKey:", v5);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v53)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_paths, "setObject:forKey:");
  }
  -[NSMutableDictionary objectForKey:](self->_bounds, "objectForKey:", v5);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v52)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_bounds, "setObject:forKey:");
  }
  v44 = self;
  PerformXPathQuery(a4, CFSTR("//svg:path['_section'=substring(@id,string-length(@id)-7)]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStrokeLoader p_loadSectionsForBrush:inSVGDoc:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStrokeLoader.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 496, CFSTR("No sections"));

  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v6;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v51)
  {
    v49 = *(_QWORD *)v61;
    v47 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v48 = *MEMORY[0x24BDBD8B8];
    v46 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v61 != v49)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "objectForKey:", CFSTR("nodeAttributes"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("d"));
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("id"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("//svg:rect[@id='%@_bounds']"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        PerformXPathQuery(a4, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "count") != 1)
        {
          objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBrushStrokeLoader p_loadSectionsForBrush:inSVGDoc:]");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStrokeLoader.m");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, v18, 505, CFSTR("Section needs bounding rect"));

        }
        objc_msgSend(v15, "lastObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", CFSTR("nodeAttributes"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "objectForKey:", CFSTR("x"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "doubleValue");
        v23 = v22;

        objc_msgSend(v20, "objectForKey:", CFSTR("y"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        v26 = v25;

        objc_msgSend(v20, "objectForKey:", CFSTR("width"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "doubleValue");
        v29 = v28;

        objc_msgSend(v20, "objectForKey:", CFSTR("height"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "doubleValue");
        v32 = v31;

        v33 = +[TSDSVGToBezierPathConverter newPathFromSVGPathString:](TSDSVGToBezierPathConverter, "newPathFromSVGPathString:", v12);
        +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_OWORD *)&v59.a = v48;
        *(_OWORD *)&v59.c = v47;
        *(_OWORD *)&v59.tx = v46;
        *(_OWORD *)&v58.a = v48;
        *(_OWORD *)&v58.c = v47;
        *(_OWORD *)&v58.tx = v46;
        CGAffineTransformTranslate(&v59, &v58, 0.0, -0.5);
        v57 = v59;
        CGAffineTransformScale(&v58, &v57, 1.0 / v29, 1.0 / v32);
        v59 = v58;
        v57 = v58;
        CGAffineTransformTranslate(&v58, &v57, -v23, -v26);
        v59 = v58;
        objc_msgSend(v34, "transformUsingAffineTransform:", &v58);
        v56 = v13;
        objc_msgSend(v13, "substringToIndex:", objc_msgSend(v13, "rangeOfString:", CFSTR("_")));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        path = v33;
        if (objc_msgSend(v5, "isEqualToString:", CFSTR("Chalk2"))
          && (objc_msgSend(v35, "isEqualToString:", CFSTR("small")) & 1) == 0)
        {
          v36 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v36, "addObject:", v34);
          +[TSDBezierPath smoothBezierPath:withThreshold:](TSDBezierPath, "smoothBezierPath:withThreshold:", v34, 0.05);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v37);

        }
        else
        {
          v36 = v34;
        }
        v38 = v15;
        v55 = (void *)v12;
        objc_msgSend(v53, "objectForKey:", v35);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v39)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setObject:forKey:", v39, v35);
        }
        v40 = v5;
        objc_msgSend(v52, "objectForKey:", v35);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v41)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setObject:forKey:", v41, v35);
        }
        objc_msgSend(v39, "addObject:", v36);
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v23, v26, v29, v32);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addObject:", v42);

        CGPathRelease(path);
        v5 = v40;
      }
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    }
    while (v51);
  }

  -[TSDBrushStrokeLoader p_loadImageForBrush:](v44, "p_loadImageForBrush:", v5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v44->_images, "setObject:forKey:", v43, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bounds, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_textureIndex, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_lineEnds, 0);
}

@end
