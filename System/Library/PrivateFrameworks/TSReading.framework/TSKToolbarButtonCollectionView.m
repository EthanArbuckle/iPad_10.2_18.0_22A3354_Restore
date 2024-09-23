@implementation TSKToolbarButtonCollectionView

- (TSKToolbarButtonCollectionView)initWithHeight:(double)a3 items:(id)a4 maximumWidth:(double)a5
{
  double v8;
  TSKToolbarButtonCollectionView *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _UNKNOWN **v15;
  unint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  char isKindOfClass;
  double v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  _UNKNOWN **v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  unint64_t j;
  void *v51;
  double v52;
  uint64_t v53;
  BOOL v54;
  void *v55;
  uint64_t v56;
  void *v58;
  char v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v68.receiver = self;
  v68.super_class = (Class)TSKToolbarButtonCollectionView;
  v8 = 0.0;
  v9 = -[TSKToolbarButtonCollectionView initWithFrame:](&v68, sel_initWithFrame_, 0.0, 0.0, 0.0, a3);
  if (v9)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(a4, "count"));
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v11 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    if (v11)
    {
      v12 = v11;
      v59 = 0;
      v13 = *(_QWORD *)v65;
      v14 = 0x24BDF6000uLL;
      v15 = &off_24D826000;
      v16 = 0x24BDF6000uLL;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v65 != v13)
            objc_enumerationMutation(a4);
          v18 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v18, "bounds");
            v20 = v19;
            v22 = v21;
            -[TSKToolbarButtonCollectionView addSubview:](v9, "addSubview:", v18);
            if ((v59 & 1) != 0)
              v23 = v8 + 5.0;
            else
              v23 = v8;
            TSURound();
            objc_msgSend(v18, "setFrame:", v23, v24, v20, v22);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v18, "frame");
              objc_msgSend(v18, "setHitBufferTop:left:bottom:right:", v26, 5.0, a3 - (v26 + v25), 5.0);
            }
            v8 = v23 + v20;
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
            if (a5 > 0.0 && (isKindOfClass & 1) != 0)
              objc_msgSend(v10, "addObject:", v18);
            v59 = 1;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v18, "width");
              v59 = 0;
              v8 = v8 + v28;
            }
            else
            {
              v58 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
              v29 = v10;
              v30 = v16;
              v31 = v12;
              v32 = v13;
              v33 = v14;
              v34 = v15;
              v35 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKToolbarButtonCollectionView initWithHeight:items:maximumWidth:]");
              v36 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKToolbar.m");
              v37 = v35;
              v15 = v34;
              v14 = v33;
              v13 = v32;
              v12 = v31;
              v16 = v30;
              v10 = v29;
              objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v37, v36, 336, CFSTR("Something other than a UIView or a TSKToolbarSpace found"));
            }
          }
        }
        v12 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      }
      while (v12);
    }
    if (a5 <= 0.0)
    {
      v39 = v8;
    }
    else
    {
      while (v8 > a5)
      {
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v38 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
        v39 = v8;
        if (v38)
        {
          v40 = v38;
          v41 = *(_QWORD *)v61;
          v39 = v8;
          do
          {
            v42 = 0;
            do
            {
              if (*(_QWORD *)v61 != v41)
                objc_enumerationMutation(v10);
              v43 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v42);
              objc_msgSend(v43, "frame");
              objc_msgSend(v43, "frame");
              v45 = v44;
              v46 = (void *)objc_msgSend((id)objc_msgSend(v43, "titleLabel"), "font");
              objc_msgSend(v46, "pointSize");
              if (v47 >= 1.0)
              {
                objc_msgSend((id)objc_msgSend(v43, "titleLabel"), "setFont:", objc_msgSend(v46, "fontWithSize:", v47 + -1.0));
                objc_msgSend(v43, "sizeToFit");
                objc_msgSend(v43, "frame");
                v49 = v45 - v48;
                objc_msgSend(v43, "setFrame:");
                v39 = v39 - v49;
                for (j = objc_msgSend(a4, "indexOfObject:", v43) + 1; j < objc_msgSend(a4, "count"); ++j)
                {
                  v51 = (void *)objc_msgSend(a4, "objectAtIndex:", j);
                  if (objc_msgSend((id)-[TSKToolbarButtonCollectionView subviews](v9, "subviews"), "containsObject:", v51))
                  {
                    objc_msgSend(v51, "frame");
                    objc_msgSend(v51, "setFrame:", v52 - v49);
                  }
                }
              }
              ++v42;
            }
            while (v42 != v40);
            v53 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
            v40 = v53;
          }
          while (v53);
        }
        v54 = v39 == v8;
        v8 = v39;
        if (v54)
          goto LABEL_43;
      }
      v39 = v8;
LABEL_43:
      if (v39 > a5)
      {
        v55 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v56 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKToolbarButtonCollectionView initWithHeight:items:maximumWidth:]");
        objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKToolbar.m"), 397, CFSTR("Unable to reduce width to %g; going with %g"),
          *(_QWORD *)&a5,
          *(_QWORD *)&v39);
      }
    }
    -[TSKToolbarButtonCollectionView setFrame:](v9, "setFrame:", 0.0, 0.0, v39, a3);
  }
  return v9;
}

@end
