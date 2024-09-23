@implementation _UISceneScreenBasedMetricsCalculator

- (void)_updateMetricsOnWindows:(id)a3 animated:(BOOL)a4
{
  id v5;
  UIWindowScene **p_scene;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  int v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a3;
  p_scene = &self->_scene;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "_effectiveSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "interfaceOrientation");

  v10 = objc_loadWeakRetained((id *)p_scene);
  objc_msgSend(v10, "_effectiveUIClientSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "interfaceOrientation");

  v13 = objc_loadWeakRetained((id *)p_scene);
  v14 = objc_msgSend(v13, "_affectsScreenOrientation");
  v15 = objc_msgSend((id)UIApp, "_viewServiceIgnoresSceneForLegacyInterfaceOrientation:", v13);

  if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) == 0 && v14 && (v15 & 1) == 0)
  {
    v16 = objc_loadWeakRetained((id *)p_scene);
    objc_msgSend(v16, "screen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_setInterfaceOrientation:", v9);

  }
  v18 = objc_loadWeakRetained((id *)p_scene);
  _UISceneMetricsCalculatorApplySceneCornerRadiiToScreenIfNecessary(v18);

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __73___UISceneScreenBasedMetricsCalculator__updateMetricsOnWindows_animated___block_invoke;
  v20[3] = &unk_1E16B4E70;
  v21 = v5;
  v22 = v9;
  v23 = v12;
  v19 = v5;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v20);

}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (UIWindowScene)_scene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
}

@end
