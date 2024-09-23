@implementation TileGroupSectionsDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Tile Group Info");
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TileGroupSectionsDebugController tableView](self, "tableView", a3));
  objc_msgSend(v3, "reloadData");

}

- (TileGroupSectionsDebugController)initWithStyle:(int64_t)a3
{
  TileGroupSectionsDebugController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TileGroupSectionsDebugController;
  v3 = -[TileGroupSectionsDebugController initWithStyle:](&v6, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
    objc_msgSend(v4, "addTileGroupObserver:queue:", v3, &_dispatch_main_q);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  objc_msgSend(v3, "removeTileGroupObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TileGroupSectionsDebugController;
  -[MapsDebugValuesViewController dealloc](&v4, "dealloc");
}

- (id)_tileGroup
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned int v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestDownload resources](self->_resourceManifest, "resources"));
  if (objc_msgSend(v3, "tileGroupsCount"))
  {
    if (-[TileGroupSectionsDebugController tileGroupIdentifier](self, "tileGroupIdentifier") == -1)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tileGroupAtIndex:", 0));
      goto LABEL_15;
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tileGroups", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          v10 = objc_msgSend(v9, "identifier");
          if ((id)-[TileGroupSectionsDebugController tileGroupIdentifier](self, "tileGroupIdentifier") == (id)v10)
          {
            v11 = v9;

            goto LABEL_15;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }

  }
  v11 = 0;
LABEL_15:

  return v11;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return self->_canChangeActiveTileGroup + 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4 || !self->_canChangeActiveTileGroup)
    return 2;
  else
    return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  int64_t v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v7, "section") && self->_canChangeActiveTileGroup)
  {
    v8 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
    if (-[TileGroupSectionsDebugController tileGroupIdentifier](self, "tileGroupIdentifier") < 0
      && !GEOConfigGetBOOL(GeoServicesConfig_DisableUpdatingActiveTileGroup[0], GeoServicesConfig_DisableUpdatingActiveTileGroup[1])|| GEOConfigGetBOOL(GeoServicesConfig_DisableUpdatingActiveTileGroup[0], GeoServicesConfig_DisableUpdatingActiveTileGroup[1])&& (v13 = -[TileGroupSectionsDebugController tileGroupIdentifier](self, "tileGroupIdentifier"), v14 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager")), v15 = objc_msgSend(v14, "activeTileGroupIdentifier"), v14, v13 == v15))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
      objc_msgSend(v16, "setText:", CFSTR("Active"));

      objc_msgSend(v8, "setSelectionStyle:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
      objc_msgSend(v18, "setTextColor:", v17);

    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
      objc_msgSend(v19, "setText:", CFSTR("Make Active"));

      objc_msgSend(v8, "setSelectionStyle:", 1);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
    objc_msgSend(v11, "setTextAlignment:", 1);
    goto LABEL_17;
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("TileSetNavigationCell")));
  if (!v8)
    v8 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 1, CFSTR("TileSetNavigationCell"));
  objc_msgSend(v8, "setAccessoryType:", 1);
  v9 = objc_msgSend(v7, "row");
  if (v9 == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
    v11 = v10;
    v12 = CFSTR("Layers");
    goto LABEL_14;
  }
  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
    v11 = v10;
    v12 = CFSTR("Tile Sets");
LABEL_14:
    objc_msgSend(v10, "setText:", v12);
LABEL_17:

  }
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  TileGroupTileSetsDebugController *v8;
  void *v9;
  TileGroupTileSetsDebugController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v18, 1);
  if (!objc_msgSend(v18, "section") && self->_canChangeActiveTileGroup)
  {
    v15 = -[TileGroupSectionsDebugController tileGroupIdentifier](self, "tileGroupIdentifier");
    v16 = GeoServicesConfig_DisableUpdatingActiveTileGroup[1];
    if (v15 < 0)
    {
      _GEOConfigRemoveValue(GeoServicesConfig_DisableUpdatingActiveTileGroup[0], v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
      objc_msgSend(v17, "resetActiveTileGroup");
    }
    else
    {
      GEOConfigSetBOOL(GeoServicesConfig_DisableUpdatingActiveTileGroup[0], v16, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
      objc_msgSend(v17, "setActiveTileGroupIdentifier:", -[TileGroupSectionsDebugController tileGroupIdentifier](self, "tileGroupIdentifier"));
    }

    v10 = (TileGroupTileSetsDebugController *)objc_claimAutoreleasedReturnValue(-[TileGroupSectionsDebugController tableView](self, "tableView"));
    -[MapsDebugValuesViewController reloadData](v10, "reloadData");
LABEL_11:

    v7 = v18;
    goto LABEL_12;
  }
  v6 = objc_msgSend(v18, "row");
  v7 = v18;
  if (!v6)
  {
    v8 = [TileGroupTileSetsDebugController alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TileGroupSectionsDebugController tableView](self, "tableView"));
    v10 = -[TileGroupTileSetsDebugController initWithStyle:](v8, "initWithStyle:", objc_msgSend(v9, "style"));

    -[TileGroupTileSetsDebugController setTileGroupIdentifier:](v10, "setTileGroupIdentifier:", -[TileGroupSectionsDebugController tileGroupIdentifier](self, "tileGroupIdentifier"));
    -[TileGroupTileSetsDebugController setResourceManifest:](v10, "setResourceManifest:", self->_resourceManifest);
    -[TileGroupTileSetsDebugController setTitle:](v10, "setTitle:", CFSTR("Tile Sets"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TileGroupSectionsDebugController navigationItem](self, "navigationItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rightBarButtonItem"));

    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TileGroupTileSetsDebugController navigationItem](v10, "navigationItem"));
      objc_msgSend(v13, "setRightBarButtonItem:", 0);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TileGroupSectionsDebugController navigationController](self, "navigationController"));
    objc_msgSend(v14, "pushViewController:animated:", v10, 1);

    goto LABEL_11;
  }
LABEL_12:

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return &stru_1011EB268;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return &stru_1011EB268;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)tileGroupIdentifier
{
  return self->tileGroupIdentifier;
}

- (void)setTileGroupIdentifier:(int64_t)a3
{
  self->tileGroupIdentifier = a3;
}

- (GEOResourceManifestDownload)resourceManifest
{
  return self->_resourceManifest;
}

- (void)setResourceManifest:(id)a3
{
  objc_storeStrong((id *)&self->_resourceManifest, a3);
}

- (BOOL)canChangeActiveTileGroup
{
  return self->_canChangeActiveTileGroup;
}

- (void)setCanChangeActiveTileGroup:(BOOL)a3
{
  self->_canChangeActiveTileGroup = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_resourceManifest, 0);
}

@end
