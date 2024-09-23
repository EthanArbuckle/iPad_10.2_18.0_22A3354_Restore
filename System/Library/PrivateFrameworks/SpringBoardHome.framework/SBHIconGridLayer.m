@implementation SBHIconGridLayer

- (id)layerForIcon:(id)a3
{
  return -[NSMapTable objectForKey:](self->_iconLayers, "objectForKey:", a3);
}

- (void)setLayer:(id)a3 forIcon:(id)a4
{
  id v6;
  NSMapTable *iconLayers;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  iconLayers = self->_iconLayers;
  if (!iconLayers)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_iconLayers;
    self->_iconLayers = v8;

    iconLayers = self->_iconLayers;
  }
  -[NSMapTable setObject:forKey:](iconLayers, "setObject:forKey:", v10, v6);

}

- (void)replaceLayerForIcon:(id)a3 withLayer:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBHIconGridLayer layerForIcon:](self, "layerForIcon:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v8, "applyTreatmentsToLayer:", v6);
    objc_msgSend(v7, "position");
    objc_msgSend(v6, "setPosition:");
    objc_msgSend(v7, "bounds");
    objc_msgSend(v6, "setBounds:");
    objc_msgSend(v7, "removeFromSuperlayer");
    -[SBHIconGridLayer addSublayer:](self, "addSublayer:", v6);
    -[SBHIconGridLayer setLayer:forIcon:](self, "setLayer:forIcon:", v6, v8);
  }

}

- (SBHIconGridSize)gridSize
{
  return self->_gridSize;
}

- (void)setGridSize:(SBHIconGridSize)a3
{
  self->_gridSize = a3;
}

- (unint64_t)cellCount
{
  return self->_cellCount;
}

- (void)setCellCount:(unint64_t)a3
{
  self->_cellCount = a3;
}

- (SBHIconImageAppearance)imageAppearance
{
  return self->_imageAppearance;
}

- (void)setImageAppearance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAppearance, 0);
  objc_storeStrong((id *)&self->_iconLayers, 0);
}

@end
