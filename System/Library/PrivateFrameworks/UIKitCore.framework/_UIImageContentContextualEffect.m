@implementation _UIImageContentContextualEffect

+ (id)contextualEffectWithEffect:(void *)a3 source:
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = objc_opt_new();
  objc_storeWeak((id *)(v6 + 16), v5);
  objc_storeWeak((id *)(v6 + 24), v4);
  objc_msgSend(v5, "_symbolConfigurationForSource:", v4);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  return (id)v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_source);
  objc_destroyWeak((id *)&self->_effect);
  objc_storeStrong((id *)&self->_symbolConfiguration, 0);
}

- (uint64_t)_shouldResolveNamedColorStyles
{
  uint64_t v1;
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    v3 = objc_loadWeakRetained((id *)(v1 + 24));
    v4 = v3;
    if (v3
      && objc_msgSend(v3, "_isMultiColorSymbolImage")
      && objc_msgSend(WeakRetained, "_effectiveRenderingModeForSource:symbolConfiguration:", v4, *(_QWORD *)(v1 + 8)) == 1)
    {
      objc_msgSend(v4, "_colorForFlattening");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = v5 == 0;

    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (uint64_t)_shouldResolveHierarchicalColors
{
  uint64_t v1;
  id WeakRetained;
  id v3;
  void *v4;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    v3 = objc_loadWeakRetained((id *)(v1 + 24));
    if (v3
      && objc_msgSend(*(id *)(v1 + 8), "_hasSpecifiedHierarchicalColors")
      && objc_msgSend(v3, "_isHierarchicalColorSymbolImage")
      && objc_msgSend(WeakRetained, "_effectiveRenderingModeForSource:symbolConfiguration:", v3, *(_QWORD *)(v1 + 8)) == 2)
    {
      objc_msgSend(v3, "_colorForFlattening");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v1 = v4 == 0;

    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (uint64_t)_shouldResolvePaletteColors
{
  uint64_t v1;
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    v3 = objc_loadWeakRetained((id *)(v1 + 24));
    if (v3 && objc_msgSend(*(id *)(v1 + 8), "_hasSpecifiedPaletteColors"))
    {
      objc_msgSend(*(id *)(v1 + 8), "_colors");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v4, "count") >= 2
        && objc_msgSend(v3, "_isPaletteColorSymbolImage")
        && objc_msgSend(WeakRetained, "_effectiveRenderingModeForSource:symbolConfiguration:", v3, *(_QWORD *)(v1 + 8)) == 2)
      {
        objc_msgSend(v3, "_colorForFlattening");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v1 = v5 == 0;

      }
      else
      {
        v1 = 0;
      }

    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (id)_resolvedPaletteColors
{
  id *v1;
  id WeakRetained;

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 2);
    objc_msgSend(v1[1], "_paletteColorsWithEffect:", WeakRetained);
    v1 = (id *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (id)_resolvedHierarchicalColorForLayerLevel:(uint64_t)a1
{
  id WeakRetained;
  void *v5;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    objc_msgSend(*(id *)(a1 + 8), "_hierarchicalColorForLayerLevel:effect:", a2, WeakRetained);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)_resolvedColorForNamedStyle:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[1], "_resolvedColorForNamedStyle:effect:", a2, a1);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_renditionWithRenditionResult:(double)a3 size:(double)a4
{
  _QWORD *v7;
  id WeakRetained;
  id v9;
  void *v10;
  void *v11;

  v7 = a2;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    v9 = objc_loadWeakRetained((id *)(a1 + 24));
    if (v9)
    {
      objc_msgSend(WeakRetained, "_renditionForSource:size:symbolConfiguration:withRenditionResult:", v9, *(_QWORD *)(a1 + 8), v7, a3, a4);
      a1 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_UIImageContentRenditionResult CGImageProvider](v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIImageContentRenditionResult resultWithCGImageProvider:]((uint64_t)v7, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      +[_UIImageContentRendition renditionWithResult:]((uint64_t)_UIImageContentRendition, v11);
      a1 = objc_claimAutoreleasedReturnValue();

    }
  }

  return (id)a1;
}

- (id)vectorGlyph
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    v2 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "content");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "vectorGlyph");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (double)variableValue
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;

  if (!a1)
    return 0.0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "variableValue");
    v4 = v3;
  }
  else
  {
    v4 = INFINITY;
  }

  return v4;
}

@end
