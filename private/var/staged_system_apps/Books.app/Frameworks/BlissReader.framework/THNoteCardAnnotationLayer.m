@implementation THNoteCardAnnotationLayer

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THNoteCardAnnotationLayer;
  -[THNoteCardStorageLayer dealloc](&v3, "dealloc");
}

- (void)layoutSublayers
{
  NSMutableArray *highlightLayers;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD v12[5];
  objc_super v13;
  _BYTE v14[128];

  v13.receiver = self;
  v13.super_class = (Class)THNoteCardAnnotationLayer;
  -[THNoteCardStorageLayer layoutSublayers](&v13, "layoutSublayers");
  -[NSMutableArray makeObjectsPerformSelector:](self->_highlightLayers, "makeObjectsPerformSelector:", "removeFromSuperlayer");
  -[NSMutableArray removeAllObjects](self->_highlightLayers, "removeAllObjects");
  if (!self->_highlightLayers)
    self->_highlightLayers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_D4DF4;
  v12[3] = &unk_4292F0;
  v12[4] = self;
  -[THNoteCardStorageLayer i_performWithEachLine:](self, "i_performWithEachLine:", v12);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  highlightLayers = self->_highlightLayers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](highlightLayers, "countByEnumeratingWithState:objects:count:", &v8, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(highlightLayers);
        -[THNoteCardAnnotationLayer insertSublayer:atIndex:](self, "insertSublayer:atIndex:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), 0);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](highlightLayers, "countByEnumeratingWithState:objects:count:", &v8, v14, 16);
    }
    while (v5);
  }
}

- (void)p_setupContentLayerForHighlightLine:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CALayer *v17;
  double v18;

  v4 = -[THAnnotation annotationStyle](self->_annotation, "annotationStyle");
  v5 = objc_msgSend(objc_msgSend(+[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:", v4, 4, (_DWORD)v4 == 6), "highlightColor"), "CGColor");
  objc_msgSend(a3, "currentLineRect");
  v9 = v8;
  v11 = v10;
  if ((_DWORD)v4 == 6)
  {
    objc_msgSend(a3, "baseline");
    v13 = v12;
    objc_msgSend(a3, "underlineOffset");
    v15 = v13 + v14;
    v16 = 2.0;
  }
  else
  {
    v15 = v6;
    v16 = v7;
  }
  v17 = +[CALayer layer](CALayer, "layer");
  -[CALayer setContentsGravity:](v17, "setContentsGravity:", kCAGravityBottom);
  -[CALayer setHidden:](v17, "setHidden:", 0);
  -[CALayer setFrame:](v17, "setFrame:", v9, v15, v11, v16);
  LODWORD(v18) = 1.0;
  -[CALayer setOpacity:](v17, "setOpacity:", v18);
  -[CALayer setBackgroundColor:](v17, "setBackgroundColor:", v5);
  objc_msgSend(a3, "setContentLayer:", v17);
}

- (THAnnotation)annotation
{
  return self->_annotation;
}

- (void)setAnnotation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
