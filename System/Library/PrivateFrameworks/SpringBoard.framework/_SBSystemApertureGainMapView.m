@implementation _SBSystemApertureGainMapView

- (SBSystemApertureContainerRenderingConfiguration)renderingConfiguration
{
  *retstr = *(SBSystemApertureContainerRenderingConfiguration *)((char *)self + 424);
  return self;
}

- (void)setRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3
{
  SBSystemApertureContainerRenderingConfiguration *p_renderingConfiguration;
  __int128 v7;
  int64_t renderingStyle;
  unint64_t cloningStyle;
  _BOOL4 alwaysRenderInSnapshots;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  UIView *clonedGainMapSubstituteRenderingWorkaroundSubview;
  uint64_t v32;
  void *v33;
  SBSystemApertureContainerRenderingConfiguration v34;
  SBSystemApertureContainerRenderingConfiguration renderingConfiguration;

  p_renderingConfiguration = &self->_renderingConfiguration;
  renderingConfiguration = self->_renderingConfiguration;
  v34 = *a3;
  if (!SBSystemApertureContainerRenderingConfigurationEqualToConfiguration((uint64_t)&renderingConfiguration, (uint64_t)&v34))
  {
    v7 = *(_OWORD *)&a3->renderingStyle;
    *(_QWORD *)&p_renderingConfiguration->alwaysRenderInSnapshots = *(_QWORD *)&a3->alwaysRenderInSnapshots;
    *(_OWORD *)&p_renderingConfiguration->renderingStyle = v7;
    renderingStyle = a3->renderingStyle;
    cloningStyle = a3->cloningStyle;
    switch(a3->renderingStyle)
    {
      case 0xFFFFFFFFFFFFFFFFLL:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContainerView.m"), 819, CFSTR("Invalid rendering style"));

        return;
      case 0:
        -[_SBGainMapView gainMapLayer](self->_gainMapView, "gainMapLayer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setRenderMode:", *MEMORY[0x1E0CD2F30]);

        switch(cloningStyle)
        {
          case 0uLL:
            -[_SBGainMapView layer](self->_gainMapView, "layer");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            v22 = 1040;
            goto LABEL_23;
          case 1uLL:
            -[_SBGainMapView layer](self->_gainMapView, "layer");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setDisableUpdateMask:", 1040);

            -[UIView setHidden:](self->_clonedGainMapSubstituteView, "setHidden:", 0);
            -[UIView layer](self->_clonedGainMapSubstituteView, "layer");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            v17 = 3;
LABEL_27:
            objc_msgSend(v15, "setDisableUpdateMask:", v17);

            clonedGainMapSubstituteRenderingWorkaroundSubview = self->_clonedGainMapSubstituteRenderingWorkaroundSubview;
            v32 = 0;
LABEL_28:
            -[UIView setHidden:](clonedGainMapSubstituteRenderingWorkaroundSubview, "setHidden:", v32);
            break;
          case 2uLL:
            -[_SBGainMapView layer](self->_gainMapView, "layer");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            v22 = 0;
LABEL_23:
            objc_msgSend(v20, "setDisableUpdateMask:", v22);

            -[UIView setHidden:](self->_clonedGainMapSubstituteView, "setHidden:", 1);
            -[UIView layer](self->_clonedGainMapSubstituteView, "layer");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v25;
            v27 = 3;
            goto LABEL_24;
        }
        break;
      case 1:
      case 2:
        alwaysRenderInSnapshots = a3->alwaysRenderInSnapshots;
        -[_SBGainMapView gainMapLayer](self->_gainMapView, "gainMapLayer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = (_QWORD *)MEMORY[0x1E0CD2F38];
        if (renderingStyle != 2)
          v13 = (_QWORD *)MEMORY[0x1E0CD2F40];
        objc_msgSend(v11, "setRenderMode:", *v13);

        if (!cloningStyle)
        {
          -[_SBGainMapView layer](self->_gainMapView, "layer");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setDisableUpdateMask:", 1040);

          if (alwaysRenderInSnapshots)
            v29 = 1041;
          else
            v29 = 1043;
          -[UIView setHidden:](self->_clonedGainMapSubstituteView, "setHidden:", !alwaysRenderInSnapshots);
          -[UIView layer](self->_clonedGainMapSubstituteView, "layer");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setDisableUpdateMask:", v29);

LABEL_25:
          clonedGainMapSubstituteRenderingWorkaroundSubview = self->_clonedGainMapSubstituteRenderingWorkaroundSubview;
          v32 = 1;
          goto LABEL_28;
        }
        if (cloningStyle == 1 || cloningStyle == 2)
        {
          -[_SBGainMapView layer](self->_gainMapView, "layer");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setDisableUpdateMask:", 1040);

          -[UIView setHidden:](self->_clonedGainMapSubstituteView, "setHidden:", 0);
          -[UIView layer](self->_clonedGainMapSubstituteView, "layer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (alwaysRenderInSnapshots)
            v17 = 1;
          else
            v17 = 3;
          goto LABEL_27;
        }
        return;
      case 3:
        -[_SBGainMapView gainMapLayer](self->_gainMapView, "gainMapLayer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setRenderMode:", *MEMORY[0x1E0CD2F40]);

        if (cloningStyle > 2)
          return;
        -[_SBGainMapView layer](self->_gainMapView, "layer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setDisableUpdateMask:", 0);

        -[UIView setHidden:](self->_clonedGainMapSubstituteView, "setHidden:", 0);
        -[UIView layer](self->_clonedGainMapSubstituteView, "layer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        v27 = 0;
LABEL_24:
        objc_msgSend(v25, "setDisableUpdateMask:", v27);

        goto LABEL_25;
      default:
        return;
    }
  }
}

- (_SBSystemApertureGainMapView)initWithFrame:(CGRect)a3
{
  char *v3;
  __int128 v4;
  _SBGainMapView *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SBGainMapSubstituteView *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  uint64_t v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)_SBSystemApertureGainMapView;
  v3 = -[_SBSystemApertureGainMapView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v3)
  {
    SBSystemApertureContainerRenderingConfigurationMake(0, 2, 0, &v23);
    v4 = v23;
    *((_QWORD *)v3 + 55) = v24;
    *(_OWORD *)(v3 + 424) = v4;
    v5 = [_SBGainMapView alloc];
    SBRectWithSize();
    v6 = -[_SBGainMapView initWithFrame:](v5, "initWithFrame:");
    v7 = (void *)*((_QWORD *)v3 + 52);
    *((_QWORD *)v3 + 52) = v6;

    objc_msgSend(*((id *)v3 + 52), "gainMapLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRenderMode:", *MEMORY[0x1E0CD2F30]);

    objc_msgSend(*((id *)v3 + 52), "setAutoresizingMask:", 18);
    objc_msgSend(v3, "addSubview:", *((_QWORD *)v3 + 52));
    v9 = [SBGainMapSubstituteView alloc];
    SBRectWithSize();
    v10 = -[SBGainMapSubstituteView initWithFrame:](v9, "initWithFrame:");
    v11 = (void *)*((_QWORD *)v3 + 56);
    *((_QWORD *)v3 + 56) = v10;

    v12 = (void *)*((_QWORD *)v3 + 56);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v13);

    objc_msgSend(*((id *)v3 + 56), "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDisableUpdateMask:", 3);

    objc_msgSend(*((id *)v3 + 56), "setAutoresizingMask:", 18);
    objc_msgSend(*((id *)v3 + 56), "setUserInteractionEnabled:", 0);
    objc_msgSend(*((id *)v3 + 56), "setHidden:", 1);
    objc_msgSend(v3, "addSubview:", *((_QWORD *)v3 + 56));
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
    v16 = (void *)*((_QWORD *)v3 + 57);
    *((_QWORD *)v3 + 57) = v15;

    v17 = (void *)*((_QWORD *)v3 + 57);
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.05);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v18);

    objc_msgSend(*((id *)v3 + 57), "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDisableUpdateMask:", 1042);

    objc_msgSend(*((id *)v3 + 57), "setUserInteractionEnabled:", 0);
    objc_msgSend(*((id *)v3 + 57), "setHidden:", 1);
    objc_msgSend(v3, "insertSubview:belowSubview:", *((_QWORD *)v3 + 57), *((_QWORD *)v3 + 52));
    objc_msgSend(v3, "setNeedsLayout");
    +[SBSystemApertureDomain rootSettings](SBSystemApertureDomain, "rootSettings");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v3 + 58);
    *((_QWORD *)v3 + 58) = v20;

  }
  return (_SBSystemApertureGainMapView *)v3;
}

- (void)layoutSubviews
{
  UIView *clonedGainMapSubstituteRenderingWorkaroundSubview;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SBSystemApertureGainMapView;
  -[_SBSystemApertureGainMapView layoutSubviews](&v4, sel_layoutSubviews);
  -[_SBSystemApertureGainMapView bounds](self, "bounds");
  clonedGainMapSubstituteRenderingWorkaroundSubview = self->_clonedGainMapSubstituteRenderingWorkaroundSubview;
  UIRectCenteredRect();
  -[UIView setFrame:](clonedGainMapSubstituteRenderingWorkaroundSubview, "setFrame:");
}

- (void)_setCornerRadius:(double)a3
{
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContainerView.m"), 792, CFSTR("use -[UIView setIDCornerRadius:] instead"));

  v7.receiver = self;
  v7.super_class = (Class)_SBSystemApertureGainMapView;
  -[_SBSystemApertureGainMapView _setCornerRadius:](&v7, sel__setCornerRadius_, a3);
}

- (void)_setContinuousCornerRadius:(double)a3
{
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContainerView.m"), 797, CFSTR("use -[UIView setIDCornerRadius:] instead"));

  v7.receiver = self;
  v7.super_class = (Class)_SBSystemApertureGainMapView;
  -[_SBSystemApertureGainMapView _setContinuousCornerRadius:](&v7, sel__setContinuousCornerRadius_, a3);
}

- (void)setIDCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SBSystemApertureGainMapView;
  -[UIView setIDCornerRadius:](&v5, sel_setIDCornerRadius_);
  -[UIView setIDCornerRadius:](self->_gainMapView, "setIDCornerRadius:", a3);
  -[UIView setIDCornerRadius:](self->_clonedGainMapSubstituteView, "setIDCornerRadius:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_clonedGainMapSubstituteRenderingWorkaroundSubview, 0);
  objc_storeStrong((id *)&self->_clonedGainMapSubstituteView, 0);
  objc_storeStrong((id *)&self->_gainMapView, 0);
}

@end
