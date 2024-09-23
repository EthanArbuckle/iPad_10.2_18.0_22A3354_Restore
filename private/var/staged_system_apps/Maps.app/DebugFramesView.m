@implementation DebugFramesView

- (DebugFramesView)initWithFrame:(CGRect)a3
{
  DebugFramesView *v3;
  uint64_t v4;
  NSMutableOrderedSet *names;
  uint64_t v6;
  NSMutableDictionary *framesByName;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DebugFramesView;
  v3 = -[DebugFramesView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet"));
    names = v3->_names;
    v3->_names = (NSMutableOrderedSet *)v4;

    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    framesByName = v3->_framesByName;
    v3->_framesByName = (NSMutableDictionary *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[DebugFramesView setBackgroundColor:](v3, "setBackgroundColor:", v8);

    -[DebugFramesView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[DebugFramesView setContentMode:](v3, "setContentMode:", 3);
  }
  return v3;
}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DebugFramesView;
  -[DebugFramesView didMoveToSuperview](&v4, "didMoveToSuperview");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DebugFramesView superview](self, "superview"));
  objc_msgSend(v3, "bringSubviewToFront:", self);

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DebugFramesView;
  -[DebugFramesView layoutSubviews](&v4, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DebugFramesView superview](self, "superview"));
  objc_msgSend(v3, "bringSubviewToFront:", self);

}

- (void)registerName:(id)a3 color:(id)a4 weight:(double)a5 edges:(unint64_t)a6
{
  id v10;
  DebugFrameConfig *v11;
  id v12;

  v12 = a3;
  v10 = a4;
  if (v12)
  {
    v11 = (DebugFrameConfig *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_framesByName, "objectForKeyedSubscript:", v12));
    if (!v11)
    {
      v11 = objc_alloc_init(DebugFrameConfig);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_framesByName, "setObject:forKeyedSubscript:", v11, v12);
    }
    -[DebugFrameConfig setColor:](v11, "setColor:", v10);
    -[DebugFrameConfig setWeight:](v11, "setWeight:", a5);
    -[DebugFrameConfig setEdges:](v11, "setEdges:", a6);
    -[NSMutableOrderedSet addObject:](self->_names, "addObject:", v12);

  }
}

- (void)unregisterName:(id)a3
{
  NSMutableOrderedSet *names;
  id v5;

  if (a3)
  {
    names = self->_names;
    v5 = a3;
    -[NSMutableOrderedSet removeObject:](names, "removeObject:", v5);
    -[NSMutableDictionary removeObjectForKey:](self->_framesByName, "removeObjectForKey:", v5);

  }
}

- (void)unregisterAll
{
  -[NSMutableOrderedSet removeAllObjects](self->_names, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_framesByName, "removeAllObjects");
}

- (void)setFrame:(CGRect)a3 forName:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_framesByName, "objectForKeyedSubscript:", a4));
  v10 = v9;
  if (v9)
  {
    v12 = v9;
    objc_msgSend(v9, "frame");
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    v11 = CGRectEqualToRect(v13, v14);
    v10 = v12;
    if (!v11)
    {
      objc_msgSend(v12, "setFrame:", x, y, width, height);
      -[DebugFramesView setNeedsDisplay](self, "setNeedsDisplay");
      v10 = v12;
    }
  }

}

- (void)setLayoutGuide:(id)a3 forName:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_framesByName, "objectForKeyedSubscript:", a4));
  v7 = v6;
  if (v6)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layoutGuide"));

    if (v8 != v9)
    {
      objc_msgSend(v7, "setLayoutGuide:", v9);
      -[DebugFramesView setNeedsDisplay](self, "setNeedsDisplay");
    }
  }

}

- (void)drawRect:(CGRect)a3
{
  CGContext *CurrentContext;
  void *v5;
  id v6;
  double v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *framesByName;
  void *v16;
  void *v17;
  uint64_t *v18;
  id v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat v53;
  CGFloat v54;
  CGFloat MaxX;
  CGFloat v56;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  double v67;
  double v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat MaxY;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat v82;
  double v83;
  double v84;
  uint64_t v85;
  void *v86;
  double *v87;
  double v88;
  double v90;
  void *v91;
  double *v92;
  id v93;
  uint64_t v94;
  NSAttributedStringKey v95;
  NSAttributedStringKey v96;
  NSMutableOrderedSet *v97;
  uint64_t v98;
  id v99;
  void *v100;
  DebugFramesView *v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  objc_super v106;
  _QWORD v107[2];
  _QWORD v108[2];
  _BYTE v109[128];
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;

  v106.receiver = self;
  v106.super_class = (Class)DebugFramesView;
  -[DebugFramesView drawRect:](&v106, "drawRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CurrentContext = UIGraphicsGetCurrentContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DebugFramesView traitCollection](self, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  v7 = 5.0;
  if (v6 == (id)5)
    v7 = 10.0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", v7));
  v9 = -[NSMutableOrderedSet count](self->_names, "count");
  v94 = (uint64_t)&v94;
  __chkstk_darwin(v9);
  v11 = &v94 - 2 * v10;
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v101 = self;
  v97 = self->_names;
  v99 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v97, "countByEnumeratingWithState:objects:count:", &v102, v109, 16);
  if (v99)
  {
    v12 = 0;
    v98 = *(_QWORD *)v103;
    v96 = NSFontAttributeName;
    v95 = NSForegroundColorAttributeName;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v103 != v98)
          objc_enumerationMutation(v97);
        v14 = v12;
        framesByName = v101->_framesByName;
        v100 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](framesByName, "objectForKeyedSubscript:"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "color"));
        if (!v17)
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
        v18 = v11;
        v19 = objc_retainAutorelease(v17);
        CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v19, "CGColor"));
        v20 = objc_retainAutorelease(v19);
        CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v20, "CGColor"));
        objc_msgSend(v16, "weight");
        v21 = 1.0;
        if (v22 >= 1.0)
        {
          objc_msgSend(v16, "weight");
          v21 = v23;
        }
        CGContextSetLineWidth(CurrentContext, v21);
        objc_msgSend(v16, "frame");
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layoutGuide"));

        if (v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layoutGuide"));
          objc_msgSend(v33, "layoutFrame");
          v35 = v34;
          v37 = v36;
          v39 = v38;
          v41 = v40;

          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layoutGuide"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "owningView"));
          -[DebugFramesView convertRect:fromView:](v101, "convertRect:fromView:", v43, v35, v37, v39, v41);
          v25 = v44;
          v27 = v45;
          v29 = v46;
          v31 = v47;

        }
        v11 = v18;
        v48 = v21 * 0.5;
        v12 = v14;
        switch((unint64_t)objc_msgSend(v16, "edges"))
        {
          case 1uLL:
            v49 = v48 + v25;
            v50 = v29 - v21;
            v110.origin.x = v49;
            v110.origin.y = v27;
            v110.size.width = v50;
            v110.size.height = v31;
            MinX = CGRectGetMinX(v110);
            v111.origin.x = v49;
            v111.origin.y = v27;
            v111.size.width = v50;
            v111.size.height = v31;
            MinY = CGRectGetMinY(v111);
            CGContextMoveToPoint(CurrentContext, MinX, MinY);
            v112.origin.x = v49;
            v112.origin.y = v27;
            v112.size.width = v50;
            v112.size.height = v31;
            v53 = CGRectGetMinX(v112);
            v113.origin.x = v49;
            v113.origin.y = v27;
            v113.size.width = v50;
            v113.size.height = v31;
            v54 = CGRectGetMinY(v113);
            CGContextAddLineToPoint(CurrentContext, v53, v54 + 10.0);
            v114.origin.x = v49;
            v114.origin.y = v27;
            v114.size.width = v50;
            v114.size.height = v31;
            MaxX = CGRectGetMaxX(v114);
            v115.origin.x = v49;
            v115.origin.y = v27;
            v115.size.width = v50;
            v115.size.height = v31;
            v56 = CGRectGetMinY(v115);
            CGContextMoveToPoint(CurrentContext, MaxX, v56);
            v116.origin.x = v49;
            v116.origin.y = v27;
            v116.size.width = v50;
            v116.size.height = v31;
            v57 = CGRectGetMaxX(v116);
            v117.origin.x = v49;
            v117.origin.y = v27;
            v117.size.width = v50;
            v117.size.height = v31;
            v58 = CGRectGetMinY(v117) + 10.0;
            goto LABEL_20;
          case 2uLL:
            v67 = v48 + v27;
            v68 = v31 - v21;
            v126.origin.x = v25;
            v126.origin.y = v67;
            v126.size.width = v29;
            v126.size.height = v68;
            v69 = CGRectGetMinX(v126);
            v127.origin.x = v25;
            v127.origin.y = v67;
            v127.size.width = v29;
            v127.size.height = v68;
            v70 = CGRectGetMinY(v127);
            CGContextMoveToPoint(CurrentContext, v69, v70);
            v128.origin.x = v25;
            v128.origin.y = v67;
            v128.size.width = v29;
            v128.size.height = v68;
            v71 = CGRectGetMinX(v128) + 10.0;
            v129.origin.x = v25;
            v129.origin.y = v67;
            v129.size.width = v29;
            v129.size.height = v68;
            v72 = CGRectGetMinY(v129);
            CGContextAddLineToPoint(CurrentContext, v71, v72);
            v130.origin.x = v25;
            v130.origin.y = v67;
            v130.size.width = v29;
            v130.size.height = v68;
            v73 = CGRectGetMinX(v130);
            v131.origin.x = v25;
            v131.origin.y = v67;
            v131.size.width = v29;
            v131.size.height = v68;
            MaxY = CGRectGetMaxY(v131);
            CGContextMoveToPoint(CurrentContext, v73, MaxY);
            v132.origin.x = v25;
            v132.origin.y = v67;
            v132.size.width = v29;
            v132.size.height = v68;
            v57 = CGRectGetMinX(v132) + 10.0;
            goto LABEL_19;
          case 4uLL:
            v59 = v48 + v25;
            v60 = v29 - v21;
            v118.origin.x = v59;
            v118.origin.y = v27;
            v118.size.width = v60;
            v118.size.height = v31;
            v61 = CGRectGetMinX(v118);
            v119.origin.x = v59;
            v119.origin.y = v27;
            v119.size.width = v60;
            v119.size.height = v31;
            v62 = CGRectGetMaxY(v119);
            CGContextMoveToPoint(CurrentContext, v61, v62);
            v120.origin.x = v59;
            v120.origin.y = v27;
            v120.size.width = v60;
            v120.size.height = v31;
            v63 = CGRectGetMinX(v120);
            v121.origin.x = v59;
            v121.origin.y = v27;
            v121.size.width = v60;
            v121.size.height = v31;
            v64 = CGRectGetMaxY(v121);
            CGContextAddLineToPoint(CurrentContext, v63, v64 + -10.0);
            v122.origin.x = v59;
            v122.origin.y = v27;
            v122.size.width = v60;
            v122.size.height = v31;
            v65 = CGRectGetMaxX(v122);
            v123.origin.x = v59;
            v123.origin.y = v27;
            v123.size.width = v60;
            v123.size.height = v31;
            v66 = CGRectGetMaxY(v123);
            CGContextMoveToPoint(CurrentContext, v65, v66);
            v124.origin.x = v59;
            v124.origin.y = v27;
            v124.size.width = v60;
            v124.size.height = v31;
            v57 = CGRectGetMaxX(v124);
            v125.origin.x = v59;
            v125.origin.y = v27;
            v125.size.width = v60;
            v125.size.height = v31;
            v58 = CGRectGetMaxY(v125) + -10.0;
            goto LABEL_20;
          case 8uLL:
            v67 = v48 + v27;
            v68 = v31 - v21;
            v133.origin.x = v25;
            v133.origin.y = v67;
            v133.size.width = v29;
            v133.size.height = v68;
            v75 = CGRectGetMaxX(v133);
            v134.origin.x = v25;
            v134.origin.y = v67;
            v134.size.width = v29;
            v134.size.height = v68;
            v76 = CGRectGetMinY(v134);
            CGContextMoveToPoint(CurrentContext, v75, v76);
            v135.origin.x = v25;
            v135.origin.y = v67;
            v135.size.width = v29;
            v135.size.height = v68;
            v77 = CGRectGetMaxX(v135) + -10.0;
            v136.origin.x = v25;
            v136.origin.y = v67;
            v136.size.width = v29;
            v136.size.height = v68;
            v78 = CGRectGetMinY(v136);
            CGContextAddLineToPoint(CurrentContext, v77, v78);
            v137.origin.x = v25;
            v137.origin.y = v67;
            v137.size.width = v29;
            v137.size.height = v68;
            v79 = CGRectGetMaxX(v137);
            v138.origin.x = v25;
            v138.origin.y = v67;
            v138.size.width = v29;
            v138.size.height = v68;
            v80 = CGRectGetMaxY(v138);
            CGContextMoveToPoint(CurrentContext, v79, v80);
            v139.origin.x = v25;
            v139.origin.y = v67;
            v139.size.width = v29;
            v139.size.height = v68;
            v57 = CGRectGetMaxX(v139) + -10.0;
LABEL_19:
            v140.origin.x = v25;
            v140.origin.y = v67;
            v140.size.width = v29;
            v140.size.height = v68;
            v58 = CGRectGetMaxY(v140);
LABEL_20:
            CGContextAddLineToPoint(CurrentContext, v57, v58);
            CGContextStrokePath(CurrentContext);
            break;
          default:
            v81 = v48 + v25;
            v82 = v48 + v27;
            v141.size.width = v29 - v21;
            v141.size.height = v31 - v21;
            v141.origin.x = v81;
            v141.origin.y = v82;
            CGContextAddRect(CurrentContext, v141);
            CGContextStrokePath(CurrentContext);
            v83 = v81 + 2.0;
            v84 = v82 + 1.0;
            if (v14)
            {
              v85 = 0;
              v86 = v100;
              do
              {
                v87 = (double *)&v11[2 * v85];
                v88 = v87[1];
                if (v83 == *v87 && v84 == v88)
                {
                  do
                  {
                    objc_msgSend(v8, "lineHeight");
                    v84 = v84 + v90;
                  }
                  while (v84 == v88);
                }
                ++v85;
              }
              while (v85 != v12);
            }
            else
            {
              v86 = v100;
            }
            v107[0] = v96;
            v107[1] = v95;
            v108[0] = v8;
            v108[1] = v20;
            v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v108, v107, 2));
            objc_msgSend(v86, "drawAtPoint:withAttributes:", v91, v83, v84);

            v92 = (double *)&v11[2 * v12];
            *v92 = v83;
            v92[1] = v84;
            ++v12;
            break;
        }

        v13 = (char *)v13 + 1;
      }
      while (v13 != v99);
      v93 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v97, "countByEnumeratingWithState:objects:count:", &v102, v109, 16);
      v99 = v93;
    }
    while (v93);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_framesByName, 0);
  objc_storeStrong((id *)&self->_names, 0);
}

@end
