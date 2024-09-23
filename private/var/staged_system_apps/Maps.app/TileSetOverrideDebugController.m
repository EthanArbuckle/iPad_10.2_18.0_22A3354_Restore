@implementation TileSetOverrideDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Overrides");
}

- (void)setVersion:(unsigned int)a3
{
  self->_hasOverrideVersion = 1;
  self->_version = a3;
}

- (TileSetOverrideDebugController)initWithStyle:(int64_t)a3
{
  TileSetOverrideDebugController *v3;
  TileSetOverrideDebugController *v4;
  UITextField *v5;
  UITextField *versionTextField;
  void *v7;
  UITextField *v8;
  UITextField *baseURLTextField;
  void *v10;
  UITextField *v11;
  UITextField *localizationURLTextField;
  void *v13;
  TileSetOverrideDebugController *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TileSetOverrideDebugController;
  v3 = -[TileSetOverrideDebugController initWithStyle:](&v16, "initWithStyle:", a3);
  v4 = v3;
  if (v3)
  {
    v3->_style = 1;
    v3->_scale = 0;
    v3->_size = 2;
    v5 = (UITextField *)objc_alloc_init((Class)UITextField);
    versionTextField = v4->_versionTextField;
    v4->_versionTextField = v5;

    -[UITextField setAutoresizingMask:](v4->_versionTextField, "setAutoresizingMask:", 18);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITextField setBackgroundColor:](v4->_versionTextField, "setBackgroundColor:", v7);

    -[UITextField setAutocorrectionType:](v4->_versionTextField, "setAutocorrectionType:", 1);
    -[UITextField setAutocapitalizationType:](v4->_versionTextField, "setAutocapitalizationType:", 0);
    -[UITextField setKeyboardType:](v4->_versionTextField, "setKeyboardType:", 4);
    -[UITextField setReturnKeyType:](v4->_versionTextField, "setReturnKeyType:", 9);
    -[UITextField setClearButtonMode:](v4->_versionTextField, "setClearButtonMode:", 1);
    -[UITextField setDelegate:](v4->_versionTextField, "setDelegate:", v4);
    v8 = (UITextField *)objc_alloc_init((Class)UITextField);
    baseURLTextField = v4->_baseURLTextField;
    v4->_baseURLTextField = v8;

    -[UITextField setAutoresizingMask:](v4->_baseURLTextField, "setAutoresizingMask:", 18);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITextField setBackgroundColor:](v4->_baseURLTextField, "setBackgroundColor:", v10);

    -[UITextField setAutocorrectionType:](v4->_baseURLTextField, "setAutocorrectionType:", 1);
    -[UITextField setAutocapitalizationType:](v4->_baseURLTextField, "setAutocapitalizationType:", 0);
    -[UITextField setKeyboardType:](v4->_baseURLTextField, "setKeyboardType:", 3);
    -[UITextField setReturnKeyType:](v4->_baseURLTextField, "setReturnKeyType:", 9);
    -[UITextField setClearButtonMode:](v4->_baseURLTextField, "setClearButtonMode:", 1);
    -[UITextField setDelegate:](v4->_baseURLTextField, "setDelegate:", v4);
    v11 = (UITextField *)objc_alloc_init((Class)UITextField);
    localizationURLTextField = v4->_localizationURLTextField;
    v4->_localizationURLTextField = v11;

    -[UITextField setAutoresizingMask:](v4->_localizationURLTextField, "setAutoresizingMask:", 18);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UITextField setBackgroundColor:](v4->_localizationURLTextField, "setBackgroundColor:", v13);

    -[UITextField setAutocorrectionType:](v4->_localizationURLTextField, "setAutocorrectionType:", 1);
    -[UITextField setAutocapitalizationType:](v4->_localizationURLTextField, "setAutocapitalizationType:", 0);
    -[UITextField setKeyboardType:](v4->_localizationURLTextField, "setKeyboardType:", 3);
    -[UITextField setReturnKeyType:](v4->_localizationURLTextField, "setReturnKeyType:", 9);
    -[UITextField setClearButtonMode:](v4->_localizationURLTextField, "setClearButtonMode:", 1);
    -[UITextField setDelegate:](v4->_localizationURLTextField, "setDelegate:", v4);
    -[TileSetOverrideDebugController _reloadTileSetBeingOverridden](v4, "_reloadTileSetBeingOverridden");
    v14 = v4;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UITextField setDelegate:](self->_versionTextField, "setDelegate:", 0);
  -[UITextField setDelegate:](self->_baseURLTextField, "setDelegate:", 0);
  -[UITextField setDelegate:](self->_localizationURLTextField, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TileSetOverrideDebugController;
  -[MapsDebugValuesViewController dealloc](&v3, "dealloc");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 5)
    return 0;
  else
    return *(&off_1011BDD18 + a4);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 6)
    return 0;
  else
    return qword_100E39670[a4];
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
  void *v13;
  uint64_t v14;
  UITextField *versionTextField;
  void *v16;
  UITextField *baseURLTextField;
  uint64_t v18;
  GEOActiveTileSet *tileSetBeingOverridden;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  unint64_t v34;
  int v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section") == (id)6)
  {
    v8 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
    v9 = objc_msgSend(v7, "row");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
    v11 = v10;
    if (v9)
      v12 = CFSTR("Remove Override");
    else
      v12 = CFSTR("Apply Override");
    objc_msgSend(v10, "setText:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
    objc_msgSend(v13, "setTextAlignment:", 1);
LABEL_6:

    goto LABEL_20;
  }
  if (objc_msgSend(v7, "section") == (id)3)
  {
    v8 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
    objc_msgSend(v8, "setAccessoryType:", 0);
    objc_msgSend(v8, "setSelectionStyle:", 0);
    v14 = 104;
    versionTextField = self->_versionTextField;
    if (self->_hasOverrideVersion)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%i"), self->_version));
      -[UITextField setText:](versionTextField, "setText:", v16);

    }
    else
    {
      -[UITextField setText:](self->_versionTextField, "setText:", 0);
    }
    baseURLTextField = self->_versionTextField;
    tileSetBeingOverridden = self->_tileSetBeingOverridden;
    if (!tileSetBeingOverridden)
    {
      -[UITextField setPlaceholder:](self->_versionTextField, "setPlaceholder:", 0);
      goto LABEL_19;
    }
    v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%i"), -[GEOActiveTileSet version](tileSetBeingOverridden, "version")));
LABEL_17:
    v20 = (void *)v18;
    -[UITextField setPlaceholder:](baseURLTextField, "setPlaceholder:", v18);

LABEL_19:
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v14), "sizeToFit");
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v14), "frame");
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentView"));
    objc_msgSend(v23, "bounds");
    v25 = v24 + -12.0;

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentView"));
    objc_msgSend(v26, "bounds");
    v28 = (v27 - v25) * 0.5;

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentView"));
    objc_msgSend(v29, "bounds");
    v31 = (v30 - v22) * 0.5;

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v14), "setFrame:", v28, v31, v25, v22);
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v14), "removeFromSuperview");
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contentView"));
    objc_msgSend(v32, "addSubview:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + v14));

    goto LABEL_20;
  }
  if (objc_msgSend(v7, "section") == (id)4)
  {
    v8 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
    objc_msgSend(v8, "setAccessoryType:", 0);
    objc_msgSend(v8, "setSelectionStyle:", 0);
    v14 = 112;
    -[UITextField setText:](self->_baseURLTextField, "setText:", self->_baseURL);
    baseURLTextField = self->_baseURLTextField;
    v18 = objc_claimAutoreleasedReturnValue(-[GEOActiveTileSet baseURL](self->_tileSetBeingOverridden, "baseURL"));
    goto LABEL_17;
  }
  if (objc_msgSend(v7, "section") == (id)5)
  {
    v8 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, 0);
    objc_msgSend(v8, "setAccessoryType:", 0);
    objc_msgSend(v8, "setSelectionStyle:", 0);
    v14 = 120;
    -[UITextField setText:](self->_localizationURLTextField, "setText:", self->_localizationURL);
    baseURLTextField = self->_localizationURLTextField;
    v18 = objc_claimAutoreleasedReturnValue(-[GEOActiveTileSet localizationURL](self->_tileSetBeingOverridden, "localizationURL"));
    goto LABEL_17;
  }
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("TileSetInfoCell")));
  if (!v8)
    v8 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("TileSetInfoCell"));
  switch((unint64_t)objc_msgSend(v7, "section"))
  {
    case 0uLL:
      v34 = (unint64_t)objc_msgSend(v7, "row");
      if (v34 >= 0x1E)
      {
        v35 = -1;
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), 0xFFFFFFFFLL));
      }
      else
      {
        v35 = dword_100E396A8[v34];
        v36 = *(&off_1011BDD48 + v34);
      }
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
      objc_msgSend(v42, "setText:", v36);

      v43 = 140;
      goto LABEL_37;
    case 1uLL:
      v37 = objc_msgSend(v7, "row");
      if ((unint64_t)v37 >= 3)
      {
        v35 = -1;
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), 0xFFFFFFFFLL));
      }
      else
      {
        v38 = *(&off_1011BDE38 + (_QWORD)v37);
        v35 = (int)v37;
      }
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
      objc_msgSend(v44, "setText:", v38);

      v43 = 144;
      goto LABEL_37;
    case 2uLL:
      v39 = objc_msgSend(v7, "row");
      if ((unint64_t)v39 >= 3)
      {
        v35 = -1;
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), 0xFFFFFFFFLL));
      }
      else
      {
        v40 = *(&off_1011BDE50 + (_QWORD)v39);
        v35 = (int)v39;
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
      objc_msgSend(v45, "setText:", v40);

      v43 = 148;
LABEL_37:
      if (*(_DWORD *)((char *)&self->super.super.super.super.super.super.isa + v43) == v35)
        v46 = 3;
      else
        v46 = 0;
      objc_msgSend(v8, "setAccessoryType:", v46);
      break;
    case 3uLL:
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%i"), self->_version));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textLabel"));
      objc_msgSend(v41, "setText:", v13);

      goto LABEL_6;
    default:
      break;
  }
LABEL_20:

  return v8;
}

- (void)_reloadTileSetBeingOverridden
{
  GEOActiveTileSet *tileSetBeingOverridden;
  void *v4;
  void *v5;
  void *v6;
  GEOActiveTileSet *v7;
  uint64_t v8;
  GEOActiveTileSet *i;
  void *v10;
  GEOActiveTileSet *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  tileSetBeingOverridden = self->_tileSetBeingOverridden;
  self->_tileSetBeingOverridden = 0;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeTileGroup"));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tileSets"));
  v7 = (GEOActiveTileSet *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v13 = v5;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (GEOActiveTileSet *)((char *)i + 1))
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "style") == self->_style
          && objc_msgSend(v10, "scale") == self->_scale
          && objc_msgSend(v10, "size") == self->_size)
        {
          v7 = v10;
          goto LABEL_13;
        }
      }
      v7 = (GEOActiveTileSet *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
LABEL_13:
    v5 = v13;
  }

  v11 = self->_tileSetBeingOverridden;
  self->_tileSetBeingOverridden = v7;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TileSetOverrideDebugController tableView](self, "tableView"));
  objc_msgSend(v12, "reloadData");

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  int v9;
  id v10;
  uint64_t v11;
  UITextField *versionTextField;
  id v13;
  uint64_t Array;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  unsigned int v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id obj;
  uint64_t v43;
  TileSetOverrideDebugController *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[3];
  _QWORD v50[3];
  _BYTE v51[128];

  v6 = a3;
  v7 = a4;
  -[UITextField resignFirstResponder](self->_versionTextField, "resignFirstResponder");
  -[UITextField resignFirstResponder](self->_baseURLTextField, "resignFirstResponder");
  -[UITextField resignFirstResponder](self->_localizationURLTextField, "resignFirstResponder");
  switch((unint64_t)objc_msgSend(v7, "section"))
  {
    case 0uLL:
      v8 = (unint64_t)objc_msgSend(v7, "row");
      if (v8 > 0x1D)
        v9 = -1;
      else
        v9 = dword_100E396A8[v8];
      v11 = 140;
      goto LABEL_40;
    case 1uLL:
      v13 = objc_msgSend(v7, "row");
      if ((unint64_t)v13 >= 3)
        v9 = -1;
      else
        v9 = (int)v13;
      v11 = 144;
      goto LABEL_40;
    case 2uLL:
      v10 = objc_msgSend(v7, "row");
      if ((unint64_t)v10 >= 3)
        v9 = -1;
      else
        v9 = (int)v10;
      v11 = 148;
LABEL_40:
      *(_DWORD *)((char *)&self->super.super.super.super.super.super.isa + v11) = v9;
      -[TileSetOverrideDebugController _reloadTileSetBeingOverridden](self, "_reloadTileSetBeingOverridden");
      break;
    case 3uLL:
      versionTextField = self->_versionTextField;
      goto LABEL_15;
    case 4uLL:
      versionTextField = self->_baseURLTextField;
      goto LABEL_15;
    case 5uLL:
      versionTextField = self->_localizationURLTextField;
LABEL_15:
      -[UITextField becomeFirstResponder](versionTextField, "becomeFirstResponder");
      break;
    case 6uLL:
      v39 = v7;
      v40 = v6;
      Array = GEOConfigGetArray(GeoServicesConfig_ActiveTileGroupOverrides[0], GeoServicesConfig_ActiveTileGroupOverrides[1]);
      v15 = (void *)objc_claimAutoreleasedReturnValue(Array);
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v15));
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      obj = v15;
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      v44 = self;
      if (v16)
      {
        v17 = v16;
        v43 = *(_QWORD *)v46;
        v18 = GEOActiveTileGroupOverrideStyleKey;
        v19 = GEOActiveTileGroupOverrideSizeKey;
        v20 = GEOActiveTileGroupOverrideScaleKey;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v46 != v43)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v18, v39));
            v24 = objc_msgSend(v23, "intValue");

            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v19));
            v26 = objc_msgSend(v25, "intValue");

            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v20));
            v28 = objc_msgSend(v27, "intValue");

            self = v44;
            if (v24 == v44->_style && v26 == v44->_size && v28 == v44->_scale)
              objc_msgSend(v41, "removeObject:", v22);
          }
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        }
        while (v17);
      }

      v7 = v39;
      v29 = v41;
      if (!objc_msgSend(v39, "row"))
      {
        v49[0] = GEOActiveTileGroupOverrideStyleKey;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_style));
        v50[0] = v30;
        v49[1] = GEOActiveTileGroupOverrideSizeKey;
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_size));
        v50[1] = v31;
        v49[2] = GEOActiveTileGroupOverrideScaleKey;
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_scale));
        v50[2] = v32;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 3));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v33));

        self = v44;
        if (v44->_hasOverrideVersion)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v44->_version));
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v35, GEOActiveTileGroupOverrideVersionKey);

        }
        if (-[NSString length](v44->_baseURL, "length", v39))
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v44->_baseURL, GEOActiveTileGroupOverrideBaseURLKey);
        if (-[NSString length](v44->_localizationURL, "length"))
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v44->_localizationURL, GEOActiveTileGroupOverrideLocalizationURLKey);
        objc_msgSend(v41, "addObject:", v34);

      }
      v6 = v40;
      if (!objc_msgSend(v41, "count", v39))
      {

        v29 = 0;
      }
      GEOConfigSetArray(GeoServicesConfig_ActiveTileGroupOverrides[0], GeoServicesConfig_ActiveTileGroupOverrides[1], v29);
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v36, "postNotificationName:object:", CFSTR("ActiveTileGroupOverridesDidChangeNotification"), 0);

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[TileSetOverrideDebugController navigationController](self, "navigationController"));
      v38 = objc_msgSend(v37, "popViewControllerAnimated:", 1);

      break;
    default:
      break;
  }
  objc_msgSend(v6, "reloadData");
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (void)textFieldDidEndEditing:(id)a3
{
  UITextField *v4;
  void *v5;
  void *v6;
  void *v7;
  UITextField *v8;

  v4 = (UITextField *)a3;
  if (self->_versionTextField == v4)
  {
    v8 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](v4, "text"));
    if (objc_msgSend(v6, "length"))
    {
      self->_hasOverrideVersion = 1;
      self->_version = objc_msgSend(v6, "intValue");
      -[UITextField resignFirstResponder](v8, "resignFirstResponder");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TileSetOverrideDebugController tableView](self, "tableView"));
      objc_msgSend(v7, "reloadData");

    }
    else
    {
      self->_hasOverrideVersion = 0;
    }
    goto LABEL_10;
  }
  if (self->_baseURLTextField == v4)
  {
    v8 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](v4, "text"));
    -[TileSetOverrideDebugController setBaseURL:](self, "setBaseURL:", v5);
    goto LABEL_8;
  }
  if (self->_localizationURLTextField == v4)
  {
    v8 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](v4, "text"));
    -[TileSetOverrideDebugController setLocalizationURL:](self, "setLocalizationURL:", v5);
LABEL_8:

    -[UITextField resignFirstResponder](v8, "resignFirstResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TileSetOverrideDebugController tableView](self, "tableView"));
    objc_msgSend(v6, "reloadData");
LABEL_10:

    v4 = v8;
  }

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

- (int)style
{
  return self->_style;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
}

- (int)size
{
  return self->_size;
}

- (void)setSize:(int)a3
{
  self->_size = a3;
}

- (int)scale
{
  return self->_scale;
}

- (void)setScale:(int)a3
{
  self->_scale = a3;
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)localizationURL
{
  return self->_localizationURL;
}

- (void)setLocalizationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizationURL, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tileSetBeingOverridden, 0);
  objc_storeStrong((id *)&self->_localizationURLTextField, 0);
  objc_storeStrong((id *)&self->_baseURLTextField, 0);
  objc_storeStrong((id *)&self->_versionTextField, 0);
}

@end
