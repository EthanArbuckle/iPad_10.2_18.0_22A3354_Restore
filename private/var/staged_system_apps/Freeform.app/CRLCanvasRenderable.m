@implementation CRLCanvasRenderable

- (CRLCanvasRenderable)initWithCALayer:(id)a3
{
  id v5;
  uint64_t v6;
  CRLCanvasRenderable *v7;
  CRLCanvasRenderable *v8;
  int v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  uint64_t v26;
  objc_class *v27;
  NSString *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  objc_class *v39;
  NSString *v40;
  void *v41;
  uint64_t v42;
  objc_class *v43;
  NSString *v44;
  void *v45;
  CKRecordID v46;
  Swift::String v47;
  void *v48;
  objc_super v49;
  uint8_t buf[4];
  int v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;

  v5 = a3;
  if ((-[CRLCanvasRenderable isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend((id)objc_opt_class(v5, v6), "crl_renderableClass")) & 1) == 0)
  {
    v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012399E8);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      v14 = (objc_class *)objc_opt_class(self, v13);
      v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v18 = (objc_class *)objc_opt_class(v5, v17);
      v19 = NSStringFromClass(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 67110402;
      v51 = v10;
      v52 = 2082;
      v53 = "-[CRLCanvasRenderable initWithCALayer:]";
      v54 = 2082;
      v55 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRenderable.m";
      v56 = 1024;
      v57 = 22;
      v58 = 2114;
      v59 = v16;
      v60 = 2114;
      v61 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Wrong renderable class (%{public}@) for layer class (%{public}@)!", buf, 0x36u);

    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239A08);
    v21 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v21, v10);
    v23 = (objc_class *)objc_opt_class(self, v22);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v27 = (objc_class *)objc_opt_class(v5, v26);
    v28 = NSStringFromClass(v27);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v28);
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Wrong renderable class (%{public}@) for layer class (%{public}@)!", v29, v30, v31, v32, v33, v34, v35, (uint64_t)"-[CRLCanvasRenderable initWithCALayer:]");

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRenderable initWithCALayer:]"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRenderable.m"));
    v39 = (objc_class *)objc_opt_class(self, v38);
    v40 = NSStringFromClass(v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v43 = (objc_class *)objc_opt_class(v5, v42);
    v44 = NSStringFromClass(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v36, v37, 22, 1, "Wrong renderable class (%{public}@) for layer class (%{public}@)!", v41, v45, 22, v25, v48);

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v46, v47);
    abort();
  }
  v49.receiver = self;
  v49.super_class = (Class)CRLCanvasRenderable;
  v7 = -[CRLCanvasRenderable init](&v49, "init");
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_layer, a3);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  CRLCanvasRenderable *v5;
  uint64_t v6;
  unsigned __int8 v7;

  v5 = (CRLCanvasRenderable *)a3;
  if (v5 == self)
  {
    v7 = 1;
  }
  else
  {
    v6 = objc_opt_class(CRLCanvasRenderable, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      v7 = -[CALayer isEqual:](self->_layer, "isEqual:", v5->_layer);
    else
      v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)-[CALayer hash](self->_layer, "hash");
}

+ (id)renderableFromLayer:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a3;
  v5 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(v3, v4), "crl_renderableClass")), "initWithCALayer:", v3);

  return v5;
}

+ (id)renderable
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_alloc((Class)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
  v4 = objc_msgSend(v2, "initWithCALayer:", v3);

  return v4;
}

+ (id)renderablesFromLayers:(id)a3
{
  return objc_msgSend(a3, "crl_arrayByMappingObjectsUsingBlock:", &stru_101239A48);
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %@>"), v5, v6));

  return v7;
}

- (void)addSubrenderable:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));

  objc_msgSend(v6, "addSublayer:", v5);
}

- (void)setSubrenderables:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "layer", (_QWORD)v14));
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
    objc_msgSend(v12, "setSublayers:", v5);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
    objc_msgSend(v13, "setSublayers:", 0);

  }
}

- (void)replaceSubrenderable:(id)a3 withRenderable:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layer"));
  objc_msgSend(v10, "replaceSublayer:with:", v8, v9);

}

- (NSArray)subrenderables
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sublayers"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9)));
        objc_msgSend(v3, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v3, "count"))
    v11 = v3;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (void)setMaskRenderable:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "layer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v4, "setMask:", v5);

}

- (CRLCanvasRenderable)presentationRenderable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentationLayer"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentationLayer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", v6));

  }
  else
  {
    v7 = 0;
  }
  return (CRLCanvasRenderable *)v7;
}

- (CALayerDelegate)delegate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "delegate"));

  return (CALayerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v5, "setDelegate:", v4);

}

- (id)contents
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contents"));

  return v3;
}

- (void)setContents:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v5, "setContents:", v4);

}

- (CALayer)superlayer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "superlayer"));

  return (CALayer *)v3;
}

- (NSArray)sublayers
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sublayers"));

  return (NSArray *)v3;
}

- (void)setSublayers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v5, "setSublayers:", v4);

}

- (CGPoint)anchorPoint
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "anchorPoint");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v5, "setAnchorPoint:", x, y);

}

- (CALayer)mask
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mask"));

  return (CALayer *)v3;
}

- (void)setMask:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v5, "setMask:", v4);

}

- (BOOL)isHidden
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = objc_msgSend(v2, "isHidden");

  return v3;
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v4, "setHidden:", v3);

}

- (float)opacity
{
  void *v2;
  float v3;
  float v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "opacity");
  v4 = v3;

  return v4;
}

- (void)setOpacity:(float)a3
{
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setOpacity:", v4);

}

- (CGRect)bounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v7, "setBounds:", x, y, width, height);

}

- (CGRect)frame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v7, "setFrame:", x, y, width, height);

}

- (CGPoint)position
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "position");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v5, "setPosition:", x, y);

}

- (CGAffineTransform)affineTransform
{
  void *v4;
  CGAffineTransform *result;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "affineTransform");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (void)setAffineTransform:(CGAffineTransform *)a3
{
  void *v3;
  __int128 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer", *(_QWORD *)&a3->a, *(_QWORD *)&a3->b, *(_QWORD *)&a3->c, *(_QWORD *)&a3->d, *(_QWORD *)&a3->tx, *(_QWORD *)&a3->ty));
  objc_msgSend(v3, "setAffineTransform:", &v4);

}

- (double)contentsScale
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "contentsScale");
  v4 = v3;

  return v4;
}

- (void)setContentsScale:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v4, "setContentsScale:", a3);

}

- (CGColor)backgroundColor
{
  void *v2;
  CGColor *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = (CGColor *)objc_msgSend(v2, "backgroundColor");

  return v3;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v4, "setBackgroundColor:", a3);

}

- (double)cornerRadius
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;

  return v4;
}

- (void)setCornerRadius:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v4, "setCornerRadius:", a3);

}

- (NSString)cornerCurve
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cornerCurve"));

  return (NSString *)v3;
}

- (void)setCornerCurve:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v5, "setCornerCurve:", v4);

}

- (unsigned)edgeAntialiasingMask
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = objc_msgSend(v2, "edgeAntialiasingMask");

  return v3;
}

- (void)setEdgeAntialiasingMask:(unsigned int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v4, "setEdgeAntialiasingMask:", v3);

}

- (double)borderWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "borderWidth");
  v4 = v3;

  return v4;
}

- (void)setBorderWidth:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v4, "setBorderWidth:", a3);

}

- (CGColor)borderColor
{
  void *v2;
  CGColor *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = (CGColor *)objc_msgSend(v2, "borderColor");

  return v3;
}

- (void)setBorderColor:(CGColor *)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v4, "setBorderColor:", a3);

}

- (NSString)name
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "name"));

  return (NSString *)v3;
}

- (void)setName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v5, "setName:", v4);

}

- (CGRect)contentsRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "contentsRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setContentsRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v7, "setContentsRect:", x, y, width, height);

}

- (BOOL)allowsGroupOpacity
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = objc_msgSend(v2, "allowsGroupOpacity");

  return v3;
}

- (void)setAllowsGroupOpacity:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v4, "setAllowsGroupOpacity:", v3);

}

- (BOOL)masksToBounds
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = objc_msgSend(v2, "masksToBounds");

  return v3;
}

- (void)setMasksToBounds:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v4, "setMasksToBounds:", v3);

}

- (NSString)magnificationFilter
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "magnificationFilter"));

  return (NSString *)v3;
}

- (void)setMagnificationFilter:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v5, "setMagnificationFilter:", v4);

}

- (double)zPosition
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "zPosition");
  v4 = v3;

  return v4;
}

- (void)setZPosition:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v4, "setZPosition:", a3);

}

- (NSString)contentsGravity
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contentsGravity"));

  return (NSString *)v3;
}

- (void)setContentsGravity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v5, "setContentsGravity:", v4);

}

- (CGColor)shadowColor
{
  void *v2;
  CGColor *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = (CGColor *)objc_msgSend(v2, "shadowColor");

  return v3;
}

- (void)setShadowColor:(CGColor *)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v4, "setShadowColor:", a3);

}

- (float)shadowOpacity
{
  void *v2;
  float v3;
  float v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "shadowOpacity");
  v4 = v3;

  return v4;
}

- (void)setShadowOpacity:(float)a3
{
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setShadowOpacity:", v4);

}

- (CGSize)shadowOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "shadowOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v5, "setShadowOffset:", width, height);

}

- (double)shadowRadius
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "shadowRadius");
  v4 = v3;

  return v4;
}

- (void)setShadowRadius:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v4, "setShadowRadius:", a3);

}

- (CGPath)shadowPath
{
  void *v2;
  CGPath *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = (CGPath *)objc_msgSend(v2, "shadowPath");

  return v3;
}

- (void)setShadowPath:(CGPath *)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v4, "setShadowPath:", a3);

}

- (BOOL)shouldRasterize
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = objc_msgSend(v2, "shouldRasterize");

  return v3;
}

- (void)setShouldRasterize:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v4, "setShouldRasterize:", v3);

}

- (double)rasterizationScale
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "rasterizationScale");
  v4 = v3;

  return v4;
}

- (void)setRasterizationScale:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v4, "setRasterizationScale:", a3);

}

- (CGSize)preferredFrameSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "preferredFrameSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)crl_tilingSafeHasContents
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = objc_msgSend(v2, "crl_tilingSafeHasContents");

  return v3;
}

- (void)removeFromSuperlayer
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "removeFromSuperlayer");

}

- (void)setNeedsDisplay
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "setNeedsDisplay");

}

- (void)addSublayer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v5, "addSublayer:", v4);

}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v8, "addAnimation:forKey:", v7, v6);

}

- (id)animationForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "animationForKey:", v4));

  return v6;
}

- (void)removeAnimationForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v5, "removeAnimationForKey:", v4);

}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  unsigned __int8 v6;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v6 = objc_msgSend(v5, "containsPoint:", x, y);

  return v6;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromLayer:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v8, "convertPoint:fromLayer:", v7, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toLayer:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v8, "convertPoint:toLayer:", v7, x, y);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (BOOL)contentsAreFlipped
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v3 = objc_msgSend(v2, "contentsAreFlipped");

  return v3;
}

- (void)crl_ignoreAccessibilityInvertColorsIfNeeded
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v2, "crl_ignoreAccessibilityInvertColorsIfNeeded");

}

- (void)crl_ignoreAccessibilityInvertColorsIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  objc_msgSend(v4, "crl_ignoreAccessibilityInvertColorsIfNeeded:", v3);

}

- (void)setIfDifferentFrame:(CGRect)a3 orTransform:(CGAffineTransform *)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  __int128 v10;
  _OWORD v11[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable layer](self, "layer"));
  v10 = *(_OWORD *)&a4->c;
  v11[0] = *(_OWORD *)&a4->a;
  v11[1] = v10;
  v11[2] = *(_OWORD *)&a4->tx;
  objc_msgSend(v9, "crl_setIfDifferentFrame:orTransform:", v11, x, y, width, height);

}

- (CALayer)layer
{
  return self->_layer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
