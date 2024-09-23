@implementation WFConfigurationParameterEditorHostingCell

- (WFConfigurationParameterEditorHostingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6;
  WFConfigurationParameterEditorHostingCell *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  WFConfigurationParameterEditorHostingCell *v14;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WFConfigurationParameterEditorHostingCell;
  v7 = -[WFParameterEditorHostingCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, a3, v6);
  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    -[WFConfigurationParameterEditorHostingCell setBackgroundView:](v7, "setBackgroundView:", v8);

    -[WFConfigurationParameterEditorHostingCell backgroundView](v7, "backgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAutoresizingMask:", 18);

    v10 = objc_alloc_init(MEMORY[0x24BEBDB00]);
    -[WFConfigurationParameterEditorHostingCell setHighlighedBackgroundView:](v7, "setHighlighedBackgroundView:", v10);

    -[WFConfigurationParameterEditorHostingCell highlighedBackgroundView](v7, "highlighedBackgroundView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAutoresizingMask:", 18);

    -[WFConfigurationParameterEditorHostingCell setSelectionStyle:](v7, "setSelectionStyle:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFConfigurationParameterEditorHostingCell contentView](v7, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

    v14 = v7;
  }

  return v7;
}

- (void)setLabelColor:(id)a3
{
  id v5;
  id v6;
  id v7;
  char v8;
  id v9;

  v5 = a3;
  -[WFConfigurationParameterEditorHostingCell labelColor](self, "labelColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_labelColor, a3);
    -[WFParameterEditorHostingCell updateContext](self, "updateContext");
  }
LABEL_9:

}

- (void)setStrokeProvider:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;

  v5 = a3;
  -[WFConfigurationParameterEditorHostingCell strokeProvider](self, "strokeProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v9 = objc_msgSend(v6, "isEqual:", v7);

      if ((v9 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[WFConfigurationParameterEditorHostingCell strokeProvider](self, "strokeProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFConfigurationParameterEditorHostingCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopAutomaticallyUpdatingView:", v11);

    objc_storeStrong((id *)&self->_strokeProvider, a3);
    objc_initWeak(&location, self);
    -[WFConfigurationParameterEditorHostingCell strokeProvider](self, "strokeProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFConfigurationParameterEditorHostingCell contentView](self, "contentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __63__WFConfigurationParameterEditorHostingCell_setStrokeProvider___block_invoke;
    v14[3] = &unk_24EE25B78;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v12, "automaticallyUpdateView:withStyle:andObserverBlock:", v13, 0, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
LABEL_9:

}

- (void)setFillProvider:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;

  v5 = a3;
  -[WFConfigurationParameterEditorHostingCell fillProvider](self, "fillProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v7 && v6)
    {
      v9 = objc_msgSend(v6, "isEqual:", v7);

      if ((v9 & 1) != 0)
        goto LABEL_14;
    }
    else
    {

    }
    -[WFConfigurationParameterEditorHostingCell fillProvider](self, "fillProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFConfigurationParameterEditorHostingCell highlighedBackgroundView](self, "highlighedBackgroundView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stopAutomaticallyUpdatingView:", v11);

    -[WFConfigurationParameterEditorHostingCell fillProvider](self, "fillProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFConfigurationParameterEditorHostingCell backgroundView](self, "backgroundView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stopAutomaticallyUpdatingView:", v13);

    objc_storeStrong((id *)&self->_fillProvider, a3);
    if (v8)
    {
      -[WFConfigurationParameterEditorHostingCell highlighedBackgroundView](self, "highlighedBackgroundView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
    -[WFConfigurationParameterEditorHostingCell setSelectedBackgroundView:](self, "setSelectedBackgroundView:", v14);
    if (v8)

    objc_initWeak(&location, self);
    -[WFConfigurationParameterEditorHostingCell fillProvider](self, "fillProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFConfigurationParameterEditorHostingCell backgroundView](self, "backgroundView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __61__WFConfigurationParameterEditorHostingCell_setFillProvider___block_invoke;
    v22 = &unk_24EE25B78;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v15, "automaticallyUpdateView:withStyle:andObserverBlock:", v16, 0, &v19);

    -[WFConfigurationParameterEditorHostingCell fillProvider](self, "fillProvider", v19, v20, v21, v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFConfigurationParameterEditorHostingCell highlighedBackgroundView](self, "highlighedBackgroundView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "automaticallyUpdateView:withStyle:", v18, 1);

    -[WFParameterEditorHostingCell updateContext](self, "updateContext");
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
LABEL_14:

}

- (void)setCardBackgroundColor:(id)a3
{
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_cardBackgroundColor, a3);
  -[WFConfigurationParameterEditorHostingCell cardBackgroundColor](self, "cardBackgroundColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "CGColor");
  WFCGColorPerceivedLightness();
  v7 = v6;

  -[WFConfigurationParameterEditorHostingCell cardBackgroundColor](self, "cardBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && ((v8, v7 < 0.15) || v7 > 0.95))
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "tertiarySystemGroupedBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFConfigurationParameterEditorHostingCell setOverridingBackgroundColor:](self, "setOverridingBackgroundColor:", v9);

  }
  else
  {
    -[WFConfigurationParameterEditorHostingCell setOverridingBackgroundColor:](self, "setOverridingBackgroundColor:", 0);
  }

}

- (void)applyStylingWithStrokeProvider:(id)a3 fillProvider:(id)a4 cardBackgroundColor:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  -[WFConfigurationParameterEditorHostingCell setCardBackgroundColor:](self, "setCardBackgroundColor:", v9);
  -[WFConfigurationParameterEditorHostingCell setStrokeProvider:](self, "setStrokeProvider:", v10);
  -[WFConfigurationParameterEditorHostingCell setFillProvider:](self, "setFillProvider:", v8);

}

- (void)reconfigureModernView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id location;

  -[WFParameterEditorHostingCell model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParameterEditorHostingCell modernHostingView](self, "modernHostingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(v3, "parameter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "becomeFirstResponder");
  v8 = objc_msgSend(v3, "widgetFamily");
  -[WFConfigurationParameterEditorHostingCell fillProvider](self, "fillProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConfigurationParameterEditorHostingCell overridingBackgroundColor](self, "overridingBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__WFConfigurationParameterEditorHostingCell_reconfigureModernView__block_invoke;
  v12[3] = &unk_24EE25BA0;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v4, "configureConfigurationUIViewWithParameter:state:processing:shouldFocus:variableProvider:widgetFamily:fillProvider:overridingCellBackgroundColor:updateBlock:", v5, v6, 1, v7, 0, v8, v9, v10, v12);

  -[WFParameterEditorHostingCell delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "parameterEditorCellDidInvalidateSize:", self);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFConfigurationParameterEditorHostingCell;
  -[WFParameterEditorHostingCell traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  -[WFConfigurationParameterEditorHostingCell traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
    -[WFParameterEditorHostingCell updateContext](self, "updateContext");

}

- (UIColor)cardBackgroundColor
{
  return self->_cardBackgroundColor;
}

- (MTVisualStylingProvider)strokeProvider
{
  return self->_strokeProvider;
}

- (MTVisualStylingProvider)fillProvider
{
  return self->_fillProvider;
}

- (UIView)highlighedBackgroundView
{
  return self->_highlighedBackgroundView;
}

- (void)setHighlighedBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_highlighedBackgroundView, a3);
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (UIColor)overridingBackgroundColor
{
  return self->_overridingBackgroundColor;
}

- (void)setOverridingBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_overridingBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridingBackgroundColor, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_highlighedBackgroundView, 0);
  objc_storeStrong((id *)&self->_fillProvider, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
  objc_storeStrong((id *)&self->_cardBackgroundColor, 0);
}

void __66__WFConfigurationParameterEditorHostingCell_reconfigureModernView__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "updatedParameterState:isUIUpdate:", v5, a3);

}

id __61__WFConfigurationParameterEditorHostingCell_setFillProvider___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD aBlock[4];
  id v4;

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__WFConfigurationParameterEditorHostingCell_setFillProvider___block_invoke_2;
  aBlock[3] = &unk_24EE25B50;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v1 = _Block_copy(aBlock);
  objc_destroyWeak(&v4);
  return v1;
}

void __61__WFConfigurationParameterEditorHostingCell_setFillProvider___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = v4;
  objc_msgSend(WeakRetained, "overridingBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(WeakRetained, "overridingBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

  }
}

id __63__WFConfigurationParameterEditorHostingCell_setStrokeProvider___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD aBlock[4];
  id v4;

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__WFConfigurationParameterEditorHostingCell_setStrokeProvider___block_invoke_2;
  aBlock[3] = &unk_24EE25B50;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  v1 = _Block_copy(aBlock);
  objc_destroyWeak(&v4);
  return v1;
}

void __63__WFConfigurationParameterEditorHostingCell_setStrokeProvider___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = v5;
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(v11, "_visualStylingForContinuallyUpdatedView:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "color");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setLabelColor:", v10);

}

@end
