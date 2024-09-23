@implementation PUParallaxDebugInfoView

- (PUParallaxDebugInfoView)initWithViewModel:(id)a3
{
  id v4;
  PUParallaxDebugInfoView *v5;
  CALayer *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CALayer *maskLayer;
  NSDictionary *v14;
  NSDictionary *additionalDebugInfo;
  NSMutableDictionary *v16;
  NSMutableDictionary *rectViewsByIdentifier;
  objc_super v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PUParallaxDebugInfoView;
  v5 = -[PUParallaxDebugInfoView init](&v19, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "environment") == 2)
    {
      objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
      v6 = (CALayer *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      -[CALayer setBackgroundColor:](v6, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

      v20[0] = CFSTR("bounds");
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v8;
      v20[1] = CFSTR("position");
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v9;
      v20[2] = CFSTR("frame");
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CALayer setActions:](v6, "setActions:", v11);

      -[PUParallaxDebugInfoView layer](v5, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMask:", v6);

      maskLayer = v5->_maskLayer;
      v5->_maskLayer = v6;

    }
    v14 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    additionalDebugInfo = v5->_additionalDebugInfo;
    v5->_additionalDebugInfo = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    rectViewsByIdentifier = v5->_rectViewsByIdentifier;
    v5->_rectViewsByIdentifier = v16;

    objc_storeWeak((id *)&v5->_viewModel, v4);
    objc_msgSend(v4, "registerChangeObserver:context:", v5, "ViewModelObservationContext");
    -[PUParallaxDebugInfoView _invalidateDebugHUDString](v5, "_invalidateDebugHUDString");
  }

  return v5;
}

- (void)setCurrentLayoutInfo:(id)a3
{
  PUParallaxLayerLayoutInfo *v5;
  PUParallaxLayerLayoutInfo *v6;
  BOOL v7;
  PUParallaxLayerLayoutInfo *v8;

  v8 = (PUParallaxLayerLayoutInfo *)a3;
  v5 = self->_currentLayoutInfo;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PUParallaxLayerLayoutInfo isEqual:](v5, "isEqual:", v8);

    if (!v7)
    {
      objc_storeStrong((id *)&self->_currentLayoutInfo, a3);
      -[PUParallaxDebugInfoView _layoutWithCurrentLayoutInfo](self, "_layoutWithCurrentLayoutInfo");
    }
  }

}

- (id)_rectViewForIdentifier:(id)a3
{
  id v4;
  void *v5;
  PUParallaxDebugInfoRectView *v6;
  PUParallaxDebugInfoRectView *v7;
  void *v8;

  v4 = a3;
  -[PUParallaxDebugInfoView rectViewsByIdentifier](self, "rectViewsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (PUParallaxDebugInfoRectView *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = [PUParallaxDebugInfoRectView alloc];
    v6 = -[PUParallaxDebugInfoRectView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[PUParallaxDebugInfoRectView setIdentifier:](v6, "setIdentifier:", v4);
    -[PUParallaxDebugInfoView addSubview:](self, "addSubview:", v6);
    -[PUParallaxDebugInfoView rectViewsByIdentifier](self, "rectViewsByIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v4);

  }
  return v6;
}

- (UILabel)debugHUDLabel
{
  UILabel *debugHUDLabel;
  id v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UILabel *v10;

  debugHUDLabel = self->_debugHUDLabel;
  if (!debugHUDLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3990]);
    -[PUParallaxDebugInfoView bounds](self, "bounds");
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:");
    objc_msgSend(MEMORY[0x1E0DC1350], "monospacedSystemFontOfSize:weight:", 15.0, *MEMORY[0x1E0DC1448]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5, "setFont:", v6);

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v5, "setBackgroundColor:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkOrangeColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5, "setTextColor:", v8);

    -[UILabel setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
    -[UILabel layer](v5, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setZPosition:", 1.79769313e308);

    -[UILabel setNumberOfLines:](v5, "setNumberOfLines:", 0);
    -[PUParallaxDebugInfoView addSubview:](self, "addSubview:", v5);
    v10 = self->_debugHUDLabel;
    self->_debugHUDLabel = v5;

    debugHUDLabel = self->_debugHUDLabel;
  }
  return debugHUDLabel;
}

- (void)displayAdditionalDebugInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PUParallaxDebugInfoView additionalDebugInfo](self, "additionalDebugInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addEntriesFromDictionary:", v4);
  -[PUParallaxDebugInfoView setAdditionalDebugInfo:](self, "setAdditionalDebugInfo:", v6);

}

- (void)setAdditionalDebugInfo:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *additionalDebugInfo;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_additionalDebugInfo;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      additionalDebugInfo = self->_additionalDebugInfo;
      self->_additionalDebugInfo = v6;

      -[PUParallaxDebugInfoView _invalidateDebugHUDString](self, "_invalidateDebugHUDString");
    }
  }

}

- (void)_updateDebugHUDString
{
  PUParallaxDebugInfoView *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  PUParallaxDebugInfoView *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v2 = self;
  v35 = *MEMORY[0x1E0C80C00];
  -[PUParallaxDebugInfoView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "showsDebugHUD");

  if (v4)
  {
    -[PUParallaxDebugInfoView viewModel](v2, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "debugHUDRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("pid: %d\n"), objc_msgSend(v8, "processIdentifier"));

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", CFSTR("\n%@ : %@"), v14, v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v11);
    }

    -[PUParallaxDebugInfoView additionalDebugInfo](v2, "additionalDebugInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      v24 = v2;
      objc_msgSend(v7, "appendString:", CFSTR("\n"));
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v26 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
            objc_msgSend(v17, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendFormat:", CFSTR("\n%@ : %@"), v22, v23);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        }
        while (v19);
      }

      v2 = v24;
    }
    -[PUParallaxDebugInfoView setDebugHUDString:](v2, "setDebugHUDString:", v7);

  }
}

- (void)setDebugHUDString:(id)a3
{
  NSString *v4;
  char v5;
  NSString *v6;
  NSString *debugHUDString;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_debugHUDString;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqual:](v4, "isEqual:", v8);

    if ((v5 & 1) == 0)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      debugHUDString = self->_debugHUDString;
      self->_debugHUDString = v6;

      -[PUParallaxDebugInfoView _layoutWithCurrentLayoutInfo](self, "_layoutWithCurrentLayoutInfo");
    }
  }

}

- (void)_layoutWithCurrentLayoutInfo
{
  void *v3;
  void *v4;
  char v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  uint64_t v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  double v48;
  double MaxY;
  double v50;
  double v51;
  CGFloat v52;
  CGFloat Width;
  double x;
  double y;
  double v56;
  double height;
  void *v58;
  double v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  uint64_t v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  uint64_t v77;
  CGAffineTransform v78;
  CGAffineTransform v79;
  _OWORD v80[6];
  CGAffineTransform v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  -[PUParallaxDebugInfoView currentLayoutInfo](self, "currentLayoutInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (-[PUParallaxDebugInfoView viewModel](self, "viewModel"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "showsDebugHUD"),
        v4,
        (v5 & 1) != 0))
  {
    -[PUParallaxDebugInfoView setHidden:](self, "setHidden:", 0);
    objc_msgSend(v3, "containerFrame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[PUParallaxDebugInfoView _rectViewForIdentifier:](self, "_rectViewForIdentifier:", CFSTR("timeFrame"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxDebugInfoView viewModel](self, "viewModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentLayerStack");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeFrame");
    -[PUParallaxDebugInfoView viewModel](self, "viewModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "currentLayerStack");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "imageSize");
    PXRectWithOriginAndSize();
    PXRectFlippedVertically();
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    objc_msgSend(v3, "viewFrameForLayerFrame:", v22, v24, v26, v28);
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    objc_msgSend(v3, "additionalContentTransform");
    v82.origin.x = v30;
    v82.origin.y = v32;
    v82.size.width = v34;
    v82.size.height = v36;
    v83 = CGRectApplyAffineTransform(v82, &v81);
    objc_msgSend(v14, "setFrame:", v83.origin.x, v83.origin.y, v83.size.width, v83.size.height);
    objc_msgSend(v3, "additionalTransform");
    v80[0] = v80[3];
    v80[1] = v80[4];
    v80[2] = v80[5];
    -[PUParallaxDebugInfoView setTransform:](self, "setTransform:", v80);
    -[PUParallaxDebugInfoView debugHUDString](self, "debugHUDString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUParallaxDebugInfoView debugHUDLabel](self, "debugHUDLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setText:", v37);

    -[PUParallaxDebugInfoView debugHUDLabel](self, "debugHUDLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "superview");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUParallaxDebugInfoView debugHUDLabel](self, "debugHUDLabel");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "sizeThatFits:", v11, v13);
    v43 = v42;

    v44 = objc_msgSend(v3, "deviceOrientation");
    v45 = v7;
    v46 = v9;
    v47 = v11;
    v48 = v13;
    if ((unint64_t)(v44 - 3) > 1)
      MaxY = CGRectGetMaxY(*(CGRect *)&v45);
    else
      MaxY = CGRectGetMaxX(*(CGRect *)&v45);
    v50 = MaxY;
    objc_msgSend(v40, "safeAreaInsets");
    v52 = v51;
    v84.origin.x = v7;
    v84.origin.y = v9;
    v84.size.width = v11;
    v84.size.height = v13;
    Width = CGRectGetWidth(v84);
    objc_msgSend(v3, "additionalContentTransform");
    v85.origin.x = v52;
    v85.origin.y = v50 + -130.0 - v43;
    v85.size.width = Width;
    v85.size.height = v43;
    v86 = CGRectApplyAffineTransform(v85, &v79);
    x = v86.origin.x;
    y = v86.origin.y;
    v56 = v86.size.width;
    height = v86.size.height;
    -[PUParallaxDebugInfoView debugHUDLabel](self, "debugHUDLabel");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setFrame:", x, y, v56, height);

    objc_msgSend(v3, "visibleFrame");
    objc_msgSend(v3, "viewFrameForLayerFrame:");
    v60 = v59;
    v62 = v61;
    v64 = v63;
    v66 = v65;
    objc_msgSend(v3, "additionalContentTransform");
    v87.origin.x = v60;
    v87.origin.y = v62;
    v87.size.width = v64;
    v87.size.height = v66;
    v88 = CGRectApplyAffineTransform(v87, &v78);
    CGRectGetHeight(v88);
    PXRectWithOriginAndSize();
    objc_msgSend(v3, "visibilityAmount");
    v77 = v67;
    PXRectByLinearlyInterpolatingRects();
    objc_msgSend(v3, "visibilityEdge", v77);
    PXRectWithSizeAlignedToRectEdges();
    v69 = v68;
    v71 = v70;
    v73 = v72;
    v75 = v74;
    -[PUParallaxDebugInfoView maskLayer](self, "maskLayer");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setFrame:", v69, v71, v73, v75);

    PXRectWithSize();
    -[PUParallaxDebugInfoView setBounds:](self, "setBounds:");
    PXRectGetCenter();
    -[PUParallaxDebugInfoView setCenter:](self, "setCenter:");

  }
  else
  {
    -[PUParallaxDebugInfoView setHidden:](self, "setHidden:", 1);
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v5;
  id v7;

  v5 = a4;
  v7 = a3;
  if ((v5 & 0x200) != 0)
    -[PUParallaxDebugInfoView _layoutWithCurrentLayoutInfo](self, "_layoutWithCurrentLayoutInfo");
  if ((*(_QWORD *)&v5 & 0xC0000) != 0)
    -[PUParallaxDebugInfoView _invalidateDebugHUDString](self, "_invalidateDebugHUDString");

}

- (id)currentLayoutInfo
{
  return self->_currentLayoutInfo;
}

- (PUParallaxLayerStackViewModel)viewModel
{
  return (PUParallaxLayerStackViewModel *)objc_loadWeakRetained((id *)&self->_viewModel);
}

- (NSMutableDictionary)rectViewsByIdentifier
{
  return self->_rectViewsByIdentifier;
}

- (CALayer)maskLayer
{
  return self->_maskLayer;
}

- (NSDictionary)additionalDebugInfo
{
  return self->_additionalDebugInfo;
}

- (NSString)debugHUDString
{
  return self->_debugHUDString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugHUDString, 0);
  objc_storeStrong((id *)&self->_additionalDebugInfo, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_rectViewsByIdentifier, 0);
  objc_destroyWeak((id *)&self->_viewModel);
  objc_storeStrong((id *)&self->_debugHUDLabel, 0);
  objc_storeStrong((id *)&self->_currentLayoutInfo, 0);
}

@end
