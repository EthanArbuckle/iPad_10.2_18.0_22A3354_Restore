@implementation PNPPencilHorizontalPresentationContainerView

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  __int128 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  _OWORD v38[3];
  _OWORD v39[3];

  -[PNPPencilHorizontalPresentationContainerView pencilView](self, "pencilView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "intrinsicSizeForDeviceState:", v4);

  -[PNPPencilHorizontalPresentationContainerView bounds](self, "bounds");
  -[PNPPencilHorizontalPresentationContainerView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v37 = v6;
  UIRectCenteredIntegralRectScale();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(MEMORY[0x24BDE57D8], "begin", v37);
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  -[PNPPencilHorizontalPresentationContainerView pencilView](self, "pencilView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v39[0] = *MEMORY[0x24BDBD8B8];
  v39[1] = v16;
  v39[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v15, "setTransform:", v39);

  -[PNPPencilHorizontalPresentationContainerView pencilView](self, "pencilView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v8, v10, v12, v14);

  -[PNPPencilHorizontalPresentationContainerView pencilView](self, "pencilView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPPencilHorizontalPresentationContainerView pencilView](self, "pencilView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPPencilHorizontalPresentationContainerView pencilView](self, "pencilView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "deviceState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v19, "transformForDeviceState:", v21);
  else
    memset(v38, 0, sizeof(v38));
  objc_msgSend(v18, "setTransform:", v38);

  objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  -[PNPPencilHorizontalPresentationContainerView pencilView](self, "pencilView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setSpinning:", 1);

  -[PNPPencilHorizontalPresentationContainerView pencilView](self, "pencilView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PNPPencilHorizontalPresentationContainerView showsChargingStatusView](self, "showsChargingStatusView"))
    v24 = 0.0;
  else
    v24 = 1.0;
  objc_msgSend(v23, "setAlpha:", v24);

  -[PNPPencilHorizontalPresentationContainerView chargingStatusView](self, "chargingStatusView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PNPPencilHorizontalPresentationContainerView showsChargingStatusView](self, "showsChargingStatusView"))
    v26 = 1.0;
  else
    v26 = 0.0;
  objc_msgSend(v25, "setAlpha:", v26);

  -[PNPPencilHorizontalPresentationContainerView chargingStatusView](self, "chargingStatusView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "intrinsicContentSize");

  -[PNPPencilHorizontalPresentationContainerView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  -[PNPPencilHorizontalPresentationContainerView chargingStatusView](self, "chargingStatusView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);

}

- (void)setPencilView:(id)a3
{
  id v5;
  id v6;

  v6 = a3;
  -[PNPPencilHorizontalPresentationContainerView pencilView](self, "pencilView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    -[PNPPencilView removeFromSuperview](self->_pencilView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_pencilView, a3);
    if (self->_pencilView)
    {
      -[PNPPencilHorizontalPresentationContainerView addSubview:](self, "addSubview:");
      -[PNPPencilHorizontalPresentationContainerView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)setChargingStatusView:(id)a3
{
  id v5;
  id v6;

  v6 = a3;
  -[PNPPencilHorizontalPresentationContainerView chargingStatusView](self, "chargingStatusView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6)
  {
    -[PNPChargingStatusView removeFromSuperview](self->_chargingStatusView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_chargingStatusView, a3);
    if (self->_chargingStatusView)
    {
      -[PNPPencilHorizontalPresentationContainerView addSubview:](self, "addSubview:");
      -[PNPPencilHorizontalPresentationContainerView setNeedsLayout](self, "setNeedsLayout");
    }
  }

}

- (void)setDeviceState:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_deviceState, a3);
  v5 = a3;
  -[PNPPencilView setDeviceState:](self->_pencilView, "setDeviceState:", v5);
  -[PNPChargingStatusView setDeviceState:](self->_chargingStatusView, "setDeviceState:", v5);

  -[PNPPencilHorizontalPresentationContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowsChargingStatusView:(BOOL)a3
{
  self->_showsChargingStatusView = a3;
  -[PNPPencilHorizontalPresentationContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  if (-[PNPPencilHorizontalPresentationContainerView showsChargingStatusView](self, "showsChargingStatusView"))
  {
    -[PNPChargingStatusView intrinsicContentSize](self->_chargingStatusView, "intrinsicContentSize");
  }
  else
  {
    -[PNPPencilHorizontalPresentationContainerView pencilView](self, "pencilView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PNPPencilHorizontalPresentationContainerView pencilView](self, "pencilView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "comfortableContainingSizeForDeviceState:", v7);
    v9 = v8;
    v11 = v10;

    v3 = v9;
    v4 = v11;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (PNPChargingStatusView)chargingStatusView
{
  return self->_chargingStatusView;
}

- (BOOL)showsChargingStatusView
{
  return self->_showsChargingStatusView;
}

- (PNPDeviceState)deviceState
{
  return self->_deviceState;
}

- (PNPPencilView)pencilView
{
  return self->_pencilView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pencilView, 0);
  objc_storeStrong((id *)&self->_deviceState, 0);
  objc_storeStrong((id *)&self->_chargingStatusView, 0);
}

@end
