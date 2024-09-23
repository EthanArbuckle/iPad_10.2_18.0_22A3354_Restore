@implementation _TUIWPText

- (BOOL)shrinkTextToFit
{
  return self->_useShrinkToFit;
}

- (BOOL)shouldHyphenate
{
  return 1;
}

- (void)scaleTextPercentDidChange:(unint64_t)a3
{
  unint64_t v5;

  if (self->_useShrinkToFit)
  {
    -[NSMapTable removeAllObjects](self->_attachmentLayouts, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_inlineLayouts, "removeAllObjects");
    if (a3 <= 1)
      v5 = 1;
    else
      v5 = a3;
    if (v5 >= 0x64)
      v5 = 100;
    -[TUIWPLayout _wpText:scaleFactorDidChange:](self->_layout, "_wpText:scaleFactorDidChange:", self, (double)v5 / 100.0);
  }
}

- (void)positionAttachmentLayoutsWithOffset:(CGPoint)a3 truncatedCharIndex:(unint64_t)a4
{
  double y;
  double x;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  y = a3.y;
  x = a3.x;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectEnumerator](self->_attachmentLayouts, "objectEnumerator", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layout"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "geometry"));
        objc_msgSend(v14, "frame");
        v16 = v15;
        v18 = v17;

        objc_msgSend(v13, "setComputedOrigin:", x + v16, y + v18);
        objc_msgSend(v13, "setHidden:", (unint64_t)objc_msgSend(v12, "charIndex") >= a4);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

}

- (void)updateWithAttachmentLayouts:(id)a3
{
  id v4;
  NSMapTable *v5;
  NSMapTable *layouts;
  NSMapTable *v7;
  NSMapTable *attachmentLayouts;
  NSMutableArray *v9;
  NSMutableArray *inlineLayouts;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  NSMapTable *v17;
  void *v18;
  NSMapTable *v19;
  NSMapTable *v20;
  NSMutableArray *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 0));
    layouts = self->_layouts;
    self->_layouts = v5;

    v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 512, 0));
    attachmentLayouts = self->_attachmentLayouts;
    self->_attachmentLayouts = v7;

    v9 = objc_opt_new(NSMutableArray);
    inlineLayouts = self->_inlineLayouts;
    self->_inlineLayouts = v9;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v17 = self->_layouts;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "box", (_QWORD)v22));
          -[NSMapTable setObject:forKey:](v17, "setObject:forKey:", v16, v18);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v13);
    }

  }
  else
  {
    v19 = self->_layouts;
    self->_layouts = 0;

    v20 = self->_attachmentLayouts;
    self->_attachmentLayouts = 0;

    v21 = self->_inlineLayouts;
    self->_inlineLayouts = 0;

  }
}

- (id)currentInlineDrawableLayouts
{
  return self->_inlineLayouts;
}

- (id)layoutForInlineDrawable:(id)a3
{
  id v4;
  void *v5;
  _TUIWPAttachmentLayout *v6;
  void *v7;
  id v8;
  void *v9;
  _TUIWPAttachmentLayout *v10;
  NSMapTable *attachmentLayouts;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "box"));
  v6 = (_TUIWPAttachmentLayout *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_attachmentLayouts, "objectForKey:", v5));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "owningAttachment"));
    v8 = objc_msgSend(v7, "findCharIndex");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_layouts, "objectForKey:", v5));
    v10 = [_TUIWPAttachmentLayout alloc];
    objc_msgSend(v4, "baselineOffset");
    v6 = -[_TUIWPAttachmentLayout initWithLayout:baselineOffset:intrinsic:charIndex:](v10, "initWithLayout:baselineOffset:intrinsic:charIndex:", v9, self->_computingIntrinsic, v8);
    attachmentLayouts = self->_attachmentLayouts;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "box"));
    -[NSMapTable setObject:forKey:](attachmentLayouts, "setObject:forKey:", v6, v12);

    -[NSMutableArray addObject:](self->_inlineLayouts, "addObject:", v6);
  }

  return v6;
}

- (double)textScaleFactor
{
  return self->_textScaleFactor;
}

- (void)setTextScaleFactor:(double)a3
{
  self->_textScaleFactor = a3;
}

- (BOOL)useShrinkToFit
{
  return self->_useShrinkToFit;
}

- (void)setUseShrinkToFit:(BOOL)a3
{
  self->_useShrinkToFit = a3;
}

- (BOOL)computingIntrinsic
{
  return self->_computingIntrinsic;
}

- (void)setComputingIntrinsic:(BOOL)a3
{
  self->_computingIntrinsic = a3;
}

- (TUIWPLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  self->_layout = (TUIWPLayout *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineLayouts, 0);
  objc_storeStrong((id *)&self->_attachmentLayouts, 0);
  objc_storeStrong((id *)&self->_layouts, 0);
}

@end
