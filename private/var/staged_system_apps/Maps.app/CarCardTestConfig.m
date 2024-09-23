@implementation CarCardTestConfig

- (CarCardTestConfig)initWithNotification:(id)a3
{
  id v4;
  CarCardTestConfig *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
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
  __int128 v27[4];
  id v28;
  id v29;
  uint64_t v30;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CarCardTestConfig;
  v5 = -[CarCardTestConfig init](&v31, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Layout")));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Size")));

    v28 = 0;
    v29 = 0;
    objc_msgSend(v7, "getValue:", v27);
    v30 = 15;
    objc_msgSend(v9, "CGSizeValue", sub_10063F028((uint64_t)&v5->_layout, v27).n128_f64[0]);
    v5->_size.width = v10;
    v5->_size.height = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("StaysOnTop")));
    v5->_staysOnTop = objc_msgSend(v13, "BOOLValue");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Grows")));
    v5->_grows = objc_msgSend(v15, "BOOLValue");

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Compresses")));
    v5->_compresses = objc_msgSend(v17, "BOOLValue");

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("StackCount")));
    v5->_stackCount = (unint64_t)objc_msgSend(v19, "unsignedIntegerValue");

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("StackUseCardLayout")));
    v5->_stackUseCardLayout = objc_msgSend(v21, "BOOLValue");

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("StackAxis")));
    v5->_stackAxis = (int64_t)objc_msgSend(v23, "integerValue");

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("StackAlignment")));
    v5->_stackAlignment = (int64_t)objc_msgSend(v25, "integerValue");

  }
  return v5;
}

- (id)description
{
  unint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFString *v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  char v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  NSMutableArray *v19;
  NSMutableArray *v20;
  char v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  unint64_t v34;
  __CFString *v35;
  __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  uint64_t v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  __CFString *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  unint64_t v50;
  float v51;
  unint64_t v52;
  float v53;
  void *v54;
  void *v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;

  v3 = -[CarCardTestConfig stackAlignment](self, "stackAlignment");
  if (v3 > 5)
    v4 = &stru_1011EB268;
  else
    v4 = *(&off_1011E7E90 + v3);
  v5 = objc_opt_class(self);
  -[CarCardTestConfig layout](self, "layout");
  if ((unint64_t)(v46 - 1) > 7)
    v6 = CFSTR("None");
  else
    v6 = *(&off_1011E7EC0 + v46 - 1);
  if ((unint64_t)(v47 - 1) > 7)
    v7 = CFSTR("none");
  else
    v7 = *(&off_1011E7F00 + v47 - 1);
  if (v48)
    v8 = CFSTR("Vertical");
  else
    v8 = CFSTR("Horizontal");
  v45 = v8;
  v9 = objc_opt_new(NSMutableArray);
  v10 = v9;
  v11 = v49;
  if ((v49 & 1) != 0)
  {
    -[NSMutableArray addObject:](v9, "addObject:", CFSTR("Top"));
    v11 = v49;
  }
  if ((v11 & 2) != 0)
  {
    -[NSMutableArray addObject:](v10, "addObject:", CFSTR("Left"));
    v11 = v49;
  }
  if ((v11 & 4) != 0)
  {
    -[NSMutableArray addObject:](v10, "addObject:", CFSTR("Bottom"));
    v11 = v49;
  }
  if ((v11 & 8) != 0)
    -[NSMutableArray addObject:](v10, "addObject:", CFSTR("Right"));
  v44 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v10, "componentsJoinedByString:", CFSTR(", ")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@]"), v12));

  if (v50 > 3)
    v14 = CFSTR(".Unknown");
  else
    v14 = *(&off_1011E7F40 + v50);
  v42 = v4;
  v41 = v5;
  if (v52 > 3)
    v15 = CFSTR(".Unknown");
  else
    v15 = *(&off_1011E7F40 + v52);
  v43 = v6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(t:%.1f l:%.1f b:%.1f r:%.1f)"), v56, v57, v58));
  if (v59)
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  v18 = v17;
  v19 = objc_opt_new(NSMutableArray);
  v20 = v19;
  v21 = v60;
  if ((v60 & 1) != 0)
  {
    -[NSMutableArray addObject:](v19, "addObject:", CFSTR("Top"));
    v21 = v60;
  }
  if ((v21 & 2) != 0)
  {
    -[NSMutableArray addObject:](v20, "addObject:", CFSTR("Left"));
    v21 = v60;
  }
  if ((v21 & 4) != 0)
  {
    -[NSMutableArray addObject:](v20, "addObject:", CFSTR("Bottom"));
    v21 = v60;
  }
  if ((v21 & 8) != 0)
    -[NSMutableArray addObject:](v20, "addObject:", CFSTR("Right"));
  v22 = v14;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v20, "componentsJoinedByString:", CFSTR(", ")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@]"), v23));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<CarCardLayout edgePosition=%@ cornerPosition=%@ primaryAxis=%@ pinnedEdges=%@ primaryAxisFillMode=%@, priority:%lu, secondaryAxisFillMode=%@, priority:%lu, margins=%@ flipForRightHandDrive=%@ edgesAffectingMapInsets=%@"), v43, v44, v45, v13, v22, (unint64_t)v51, v15, (unint64_t)v53, v16, v18, v24));
  -[CarCardTestConfig size](self, "size");
  v27 = v26;
  -[CarCardTestConfig size](self, "size");
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%.1fx %.1fy)"), v27, v28));
  if (-[CarCardTestConfig grows](self, "grows"))
    v30 = CFSTR("YES");
  else
    v30 = CFSTR("NO");
  v31 = v30;
  if (-[CarCardTestConfig compresses](self, "compresses"))
    v32 = CFSTR("YES");
  else
    v32 = CFSTR("NO");
  v33 = v32;
  v34 = -[CarCardTestConfig stackCount](self, "stackCount");
  if (-[CarCardTestConfig stackUseCardLayout](self, "stackUseCardLayout"))
    v35 = CFSTR("YES");
  else
    v35 = CFSTR("NO");
  v36 = v35;
  if (-[CarCardTestConfig stackAxis](self, "stackAxis"))
    v37 = CFSTR("Vertical");
  else
    v37 = CFSTR("Horizontal");
  if (-[CarCardTestConfig staysOnTop](self, "staysOnTop"))
    v38 = CFSTR("YES");
  else
    v38 = CFSTR("NO");
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p layout=%@ size=%@ grows=%@ compresses=%@ stackCount=%lu stackUseCardLayout=%@ stackAxis=%@ stackAlignment=%@ staysOnTop=%@>"), v41, self, v25, v29, v31, v33, v34, v36, v37, v42, v38));

  return v39;
}

- ($B1874A4E4729613F071A632570863A63)layout
{
  __int128 v5;
  $B1874A4E4729613F071A632570863A63 *result;
  __int128 v7;

  v5 = *(_OWORD *)&self->_layout.primaryAxis;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->_layout.edgePosition;
  *(_OWORD *)&retstr->var2 = v5;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self->_layout.primaryAxisFillMode;
  *(_OWORD *)(&retstr->var5 + 1) = *(_OWORD *)(&self->_layout.primaryAxisFillModePriority + 1);
  retstr->var8 = self->_layout.primaryAxisFillLimit;
  result = self->_layout.secondaryAxisFillLimit;
  retstr->var9 = result;
  v7 = *(_OWORD *)&self->_layout.margins.bottom;
  *(_OWORD *)&retstr->var10.top = *(_OWORD *)&self->_layout.margins.top;
  *(_OWORD *)&retstr->var10.bottom = v7;
  *(_OWORD *)&retstr->var11 = *(_OWORD *)&self->_layout.flipForRightHandDrive;
  retstr->var13 = self->_layout.horizontallyCenterMapInsets;
  return result;
}

- (BOOL)staysOnTop
{
  return self->_staysOnTop;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)grows
{
  return self->_grows;
}

- (BOOL)compresses
{
  return self->_compresses;
}

- (unint64_t)stackCount
{
  return self->_stackCount;
}

- (BOOL)stackUseCardLayout
{
  return self->_stackUseCardLayout;
}

- (int64_t)stackAxis
{
  return self->_stackAxis;
}

- (int64_t)stackAlignment
{
  return self->_stackAlignment;
}

- (void).cxx_destruct
{

}

@end
