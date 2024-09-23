@implementation _UIWindowSceneCoordinateSpace

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[FBSSceneSettings bounds](self->_effectiveSettings, "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  UIWindowScene **p_windowScene;
  id WeakRetained;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  _UIWindowSceneCoordinateSpace *v24;
  id v25;
  unint64_t v26;
  NSObject *v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  id v40;
  double v41;
  double v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  char v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  uint64_t v66;
  id v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  NSObject *v72;
  int v73;
  const char *v74;
  uint64_t v75;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v75 = *MEMORY[0x1E0C80C00];
  p_windowScene = &self->_windowScene;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  if (WeakRetained)
  {
    v12 = objc_loadWeakRetained((id *)p_windowScene);
    objc_msgSend(v12, "screen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "fixedCoordinateSpace");

    v15 = objc_loadWeakRetained((id *)p_windowScene);
    objc_msgSend(v15, "screen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v16, "coordinateSpace");

    if (a4 && a4 != self)
    {
      v18 = objc_loadWeakRetained((id *)p_windowScene);
      v19 = v18;
      if (v14 == a4)
      {
        v28 = __UISceneEffectiveSettings((uint64_t)v18);

        objc_msgSend(v28, "frame");
        v30 = x - v29;
        v32 = y - v31;
        v33 = objc_loadWeakRetained((id *)p_windowScene);
        objc_msgSend(v33, "_referenceBounds");
        x = _UIWindowConvertRectFromOrientationToOrientation(1, objc_msgSend(v28, "interfaceOrientation"), v30, v32, width, height, v34, v35);
        y = v36;
        width = v37;
        height = v38;
LABEL_18:

        goto LABEL_24;
      }
      objc_msgSend(v18, "screen");
      v20 = (id)objc_claimAutoreleasedReturnValue();

      if (v20 != a4)
      {
        objc_opt_self();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_9:

LABEL_10:
          objc_msgSend(v17, "convertRect:fromCoordinateSpace:", a4, x, y, width, height);
          v24 = self;
          v25 = v17;
LABEL_23:
          -[_UIWindowSceneCoordinateSpace convertRect:fromCoordinateSpace:](v24, "convertRect:fromCoordinateSpace:", v25);
          x = v49;
          y = v50;
          width = v51;
          height = v52;
          goto LABEL_24;
        }
        objc_msgSend(a4, "windowScene");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v23 = objc_loadWeakRetained((id *)p_windowScene);
        if (v22 != v23)
        {

          goto LABEL_9;
        }
        v57 = objc_msgSend(a4, "_isExternallyPlaced");

        if ((v57 & 1) != 0)
          goto LABEL_10;
        objc_msgSend(a4, "frame");
        v59 = x + v58;
        objc_msgSend(a4, "frame");
        v61 = y + v60;
        v33 = objc_loadWeakRetained((id *)p_windowScene);
        objc_msgSend(v33, "_referenceBounds");
        v63 = v62;
        v65 = v64;
        v66 = objc_msgSend(a4, "interfaceOrientation");
        v67 = objc_loadWeakRetained((id *)p_windowScene);
        objc_msgSend(v67, "_effectiveSettings");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        x = _UIWindowConvertRectFromOrientationToOrientation(v66, objc_msgSend(v68, "interfaceOrientation"), v59, v61, width, height, v63, v65);
        y = v69;
        width = v70;
        height = v71;

        goto LABEL_18;
      }
      v39 = objc_loadWeakRetained((id *)p_windowScene);
      v40 = __UISceneEffectiveSettings((uint64_t)v39);

      objc_msgSend(v40, "frame");
      if (v42 != *MEMORY[0x1E0C9D538]
        || v41 != *(double *)(MEMORY[0x1E0C9D538] + 8)
        || (v43 = objc_loadWeakRetained((id *)p_windowScene),
            objc_msgSend(v43, "screen"),
            v44 = (void *)objc_claimAutoreleasedReturnValue(),
            v45 = objc_msgSend(v44, "_interfaceOrientation"),
            v46 = objc_msgSend(v40, "interfaceOrientation"),
            v44,
            v43,
            v45 != v46))
      {
        objc_msgSend(a4, "_referenceBounds");
        _UIWindowConvertRectFromOrientationToOrientation(objc_msgSend(a4, "_interfaceOrientation"), 1, x, y, width, height, v47, v48);
        v24 = self;
        v25 = v14;
        goto LABEL_23;
      }
    }
  }
  else if (os_variant_has_internal_diagnostics())
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
      {
        v73 = 136315138;
        v74 = "-[_UIWindowSceneCoordinateSpace convertRect:fromCoordinateSpace:]";
        _os_log_fault_impl(&dword_185066000, v72, OS_LOG_TYPE_FAULT, "%s: Coordinate space conversion with _windowScene = nil. Something is artificially prolonging the life of UIWindowScene's coordinate space object", (uint8_t *)&v73, 0xCu);
      }

    }
    else
    {
      v26 = convertRect_fromCoordinateSpace____s_category;
      if (!convertRect_fromCoordinateSpace____s_category)
      {
        v26 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v26, (unint64_t *)&convertRect_fromCoordinateSpace____s_category);
      }
      v27 = *(NSObject **)(v26 + 8);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v73 = 136315138;
        v74 = "-[_UIWindowSceneCoordinateSpace convertRect:fromCoordinateSpace:]";
        _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_ERROR, "%s: Coordinate space conversion with _windowScene = nil. Something is artificially prolonging the life of UIWindowScene's coordinate space object", (uint8_t *)&v73, 0xCu);
      }
    }
  }
LABEL_24:
  v53 = x;
  v54 = y;
  v55 = width;
  v56 = height;
  result.size.height = v56;
  result.size.width = v55;
  result.origin.y = v54;
  result.origin.x = v53;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  UIWindowScene **p_windowScene;
  id WeakRetained;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  unint64_t v28;
  NSObject *v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  id v44;
  double v45;
  double v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  char v65;
  id v66;
  double v67;
  double v68;
  double v69;
  double v70;
  id v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  NSObject *v80;
  int v81;
  const char *v82;
  uint64_t v83;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v83 = *MEMORY[0x1E0C80C00];
  p_windowScene = &self->_windowScene;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  if (WeakRetained)
  {
    v12 = objc_loadWeakRetained((id *)p_windowScene);
    objc_msgSend(v12, "screen");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "fixedCoordinateSpace");

    v15 = objc_loadWeakRetained((id *)p_windowScene);
    objc_msgSend(v15, "screen");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v16, "coordinateSpace");

    if (a4 && a4 != self)
    {
      v18 = objc_loadWeakRetained((id *)p_windowScene);
      v19 = v18;
      if (v14 == a4)
      {
        v30 = __UISceneEffectiveSettings((uint64_t)v18);

        objc_msgSend(v30, "frame");
        v32 = v31;
        v34 = v33;
        v35 = objc_loadWeakRetained((id *)p_windowScene);
        objc_msgSend(v35, "_referenceBounds");
        v38 = _UIWindowConvertRectFromOrientationToOrientation(objc_msgSend(v30, "interfaceOrientation"), 1, x, y, width, height, v36, v37);
        v40 = v39;
        width = v41;
        height = v42;

        x = v32 + v38;
        y = v34 + v40;
      }
      else
      {
        objc_msgSend(v18, "screen");
        v20 = (id)objc_claimAutoreleasedReturnValue();

        if (v20 != a4)
        {
          objc_opt_self();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(a4, "windowScene");
            v22 = (id)objc_claimAutoreleasedReturnValue();
            v23 = objc_loadWeakRetained((id *)p_windowScene);
            if (v22 == v23)
            {
              v65 = objc_msgSend(a4, "_isExternallyPlaced");

              if ((v65 & 1) == 0)
              {
                v66 = objc_loadWeakRetained((id *)p_windowScene);
                objc_msgSend(v66, "_referenceBounds");
                v68 = v67;
                v70 = v69;
                v71 = objc_loadWeakRetained((id *)p_windowScene);
                objc_msgSend(v71, "_effectiveSettings");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                v73 = _UIWindowConvertRectFromOrientationToOrientation(objc_msgSend(v72, "interfaceOrientation"), objc_msgSend(a4, "interfaceOrientation"), x, y, width, height, v68, v70);
                v75 = v74;
                width = v76;
                height = v77;

                objc_msgSend(a4, "frame");
                x = v73 - v78;
                objc_msgSend(a4, "frame");
                y = v75 - v79;
                goto LABEL_23;
              }
              goto LABEL_10;
            }

          }
LABEL_10:
          -[_UIWindowSceneCoordinateSpace convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v17, x, y, width, height);
          objc_msgSend(v17, "convertRect:toCoordinateSpace:", a4);
LABEL_22:
          x = v24;
          y = v25;
          width = v26;
          height = v27;
          goto LABEL_23;
        }
        v43 = objc_loadWeakRetained((id *)p_windowScene);
        v44 = __UISceneEffectiveSettings((uint64_t)v43);

        objc_msgSend(v44, "frame");
        if (v46 != *MEMORY[0x1E0C9D538]
          || v45 != *(double *)(MEMORY[0x1E0C9D538] + 8)
          || (v47 = objc_loadWeakRetained((id *)p_windowScene),
              objc_msgSend(v47, "screen"),
              v48 = (void *)objc_claimAutoreleasedReturnValue(),
              v49 = objc_msgSend(v48, "_interfaceOrientation"),
              v50 = objc_msgSend(v44, "interfaceOrientation"),
              v48,
              v47,
              v49 != v50))
        {
          -[_UIWindowSceneCoordinateSpace convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", v14, x, y, width, height);
          v52 = v51;
          v54 = v53;
          v56 = v55;
          v58 = v57;
          objc_msgSend(a4, "_referenceBounds");
          v24 = _UIWindowConvertRectFromOrientationToOrientation(1, objc_msgSend(a4, "_interfaceOrientation"), v52, v54, v56, v58, v59, v60);
          goto LABEL_22;
        }
      }
    }
  }
  else if (os_variant_has_internal_diagnostics())
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_FAULT))
      {
        v81 = 136315138;
        v82 = "-[_UIWindowSceneCoordinateSpace convertRect:toCoordinateSpace:]";
        _os_log_fault_impl(&dword_185066000, v80, OS_LOG_TYPE_FAULT, "%s: Coordinate space conversion with _windowScene = nil. Something is artificially prolonging the life of UIWindowScene's coordinate space object", (uint8_t *)&v81, 0xCu);
      }

    }
    else
    {
      v28 = convertRect_toCoordinateSpace____s_category_0;
      if (!convertRect_toCoordinateSpace____s_category_0)
      {
        v28 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v28, (unint64_t *)&convertRect_toCoordinateSpace____s_category_0);
      }
      v29 = *(NSObject **)(v28 + 8);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v81 = 136315138;
        v82 = "-[_UIWindowSceneCoordinateSpace convertRect:toCoordinateSpace:]";
        _os_log_impl(&dword_185066000, v29, OS_LOG_TYPE_ERROR, "%s: Coordinate space conversion with _windowScene = nil. Something is artificially prolonging the life of UIWindowScene's coordinate space object", (uint8_t *)&v81, 0xCu);
      }
    }
  }
LABEL_23:
  v61 = x;
  v62 = y;
  v63 = width;
  v64 = height;
  result.size.height = v64;
  result.size.width = v63;
  result.origin.y = v62;
  result.origin.x = v61;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_effectiveSettings, 0);
}

- (_UIWindowSceneCoordinateSpace)initWithWindowScene:(id)a3 effectiveSettings:(id)a4
{
  id v6;
  id v7;
  _UIWindowSceneCoordinateSpace *v8;
  _UIWindowSceneCoordinateSpace *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIWindowSceneCoordinateSpace;
  v8 = -[_UIWindowSceneCoordinateSpace init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_windowScene, v6);
    objc_storeStrong((id *)&v9->_effectiveSettings, a4);
  }

  return v9;
}

- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[_UIWindowSceneCoordinateSpace convertRect:toCoordinateSpace:](self, "convertRect:toCoordinateSpace:", a4, a3.x, a3.y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[_UIWindowSceneCoordinateSpace convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", a4, a3.x, a3.y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.y = v5;
  result.x = v4;
  return result;
}

- (UIWindowScene)windowScene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

@end
