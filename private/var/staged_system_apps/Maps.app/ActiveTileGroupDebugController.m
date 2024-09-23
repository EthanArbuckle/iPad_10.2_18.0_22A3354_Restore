@implementation ActiveTileGroupDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Active Tile Group");
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ActiveTileGroupDebugController tableView](self, "tableView", a3));
  objc_msgSend(v3, "reloadData");

}

- (void)activeTileGroupOverridesDidChange:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ActiveTileGroupDebugController tableView](self, "tableView", a3));
  objc_msgSend(v3, "reloadData");

}

- (ActiveTileGroupDebugController)init
{
  ActiveTileGroupDebugController *v2;
  ActiveTileGroupDebugController *v3;
  void *v4;
  ActiveTileGroupDebugController *v5;
  void *v6;
  void *v7;
  ActiveTileGroupDebugController *v8;
  _QWORD v10[4];
  ActiveTileGroupDebugController *v11;

  v2 = -[ActiveTileGroupDebugController initWithResourceManifest:](self, "initWithResourceManifest:", 0);
  v3 = v2;
  if (v2)
  {
    v2->_canChangeTileGroup = 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1005FD458;
    v10[3] = &unk_1011BDCF8;
    v5 = v3;
    v11 = v5;
    objc_msgSend(v4, "getResourceManifestWithHandler:", v10);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
    objc_msgSend(v6, "addTileGroupObserver:queue:", v5, &_dispatch_main_q);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, "activeTileGroupOverridesDidChange:", CFSTR("ActiveTileGroupOverridesDidChangeNotification"), 0);

    v8 = v5;
  }

  return v3;
}

- (ActiveTileGroupDebugController)initWithResourceManifest:(id)a3
{
  id v5;
  ActiveTileGroupDebugController *v6;
  ActiveTileGroupDebugController *v7;
  void *v8;
  ActiveTileGroupDebugController *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ActiveTileGroupDebugController;
  v6 = -[ActiveTileGroupDebugController initWithStyle:](&v11, "initWithStyle:", 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resourceManifest, a3);
    v7->_canChangeTileGroup = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ActiveTileGroupDebugController navigationItem](v7, "navigationItem"));
    objc_msgSend(v8, "setRightBarButtonItem:", 0);

    v9 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  objc_msgSend(v3, "removeTileGroupObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)ActiveTileGroupDebugController;
  -[MapsDebugValuesViewController dealloc](&v5, "dealloc");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (!self->_resourceManifest)
    return 0;
  if (self->_canChangeTileGroup)
    return 2;
  return 1;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  const __CFString *v4;

  v4 = CFSTR("Tile Set Overrides");
  if (a4 != 1)
    v4 = 0;
  if (a4)
    return (id)v4;
  else
    return CFSTR("Tile Groups");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  GEOResourceManifestDownload *resourceManifest;
  _BOOL8 canChangeTileGroup;
  void *v9;
  char *v10;
  uint64_t Array;

  v6 = a3;
  resourceManifest = self->_resourceManifest;
  if (resourceManifest)
  {
    if (a4 == 1)
    {
      Array = GEOConfigGetArray(GeoServicesConfig_ActiveTileGroupOverrides[0], GeoServicesConfig_ActiveTileGroupOverrides[1]);
      v9 = (void *)objc_claimAutoreleasedReturnValue(Array);
      v10 = (char *)objc_msgSend(v9, "count") + 1;
      goto LABEL_7;
    }
    if (!a4)
    {
      canChangeTileGroup = self->_canChangeTileGroup;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestDownload resources](resourceManifest, "resources"));
      v10 = (char *)objc_msgSend(v9, "tileGroupsCount") + canChangeTileGroup;
LABEL_7:

      goto LABEL_8;
    }
  }
  v10 = 0;
LABEL_8:

  return (int64_t)v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  _BOOL8 canChangeTileGroup;
  void *v10;
  char *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t Array;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  __CFString *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v6 = a3;
  v7 = a4;
  if ((uint64_t)objc_msgSend(v7, "section") <= 1)
  {
    v8 = objc_msgSend(v7, "section");
    if (v8 == (id)1)
    {
      Array = GEOConfigGetArray(GeoServicesConfig_ActiveTileGroupOverrides[0], GeoServicesConfig_ActiveTileGroupOverrides[1]);
      v10 = (void *)objc_claimAutoreleasedReturnValue(Array);
      v19 = objc_msgSend(v7, "row");
      if (v19 < objc_msgSend(v10, "count"))
      {
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("ExistingTileGroupOverrideCell")));
        if (!v12)
          v12 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 3, CFSTR("ExistingTileGroupOverrideCell"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", GEOActiveTileGroupOverrideStyleKey));
        v22 = objc_msgSend(v21, "intValue");

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", GEOActiveTileGroupOverrideSizeKey));
        v24 = objc_msgSend(v23, "intValue");

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", GEOActiveTileGroupOverrideScaleKey));
        v26 = objc_msgSend(v25, "intValue");

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", GEOActiveTileGroupOverrideVersionKey));
        v28 = objc_msgSend(v27, "unsignedIntValue");

        v29 = CFSTR("RASTER_STANDARD");
        switch((int)v22)
        {
          case 0:
            break;
          case 1:
            v29 = CFSTR("VECTOR_STANDARD");
            break;
          case 2:
            v29 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
            break;
          case 3:
            v29 = CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
            break;
          case 4:
            v29 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
            break;
          case 5:
            v29 = CFSTR("RASTER_STANDARD_BACKGROUND");
            break;
          case 6:
            v29 = CFSTR("RASTER_HYBRID");
            break;
          case 7:
            v29 = CFSTR("RASTER_SATELLITE");
            break;
          case 8:
            v29 = CFSTR("RASTER_TERRAIN");
            break;
          case 11:
            v29 = CFSTR("VECTOR_BUILDINGS");
            break;
          case 12:
            v29 = CFSTR("VECTOR_TRAFFIC");
            break;
          case 13:
            v29 = CFSTR("VECTOR_POI");
            break;
          case 14:
            v29 = CFSTR("SPUTNIK_METADATA");
            break;
          case 15:
            v29 = CFSTR("SPUTNIK_C3M");
            break;
          case 16:
            v29 = CFSTR("SPUTNIK_DSM");
            break;
          case 17:
            v29 = CFSTR("SPUTNIK_DSM_GLOBAL");
            break;
          case 18:
            v29 = CFSTR("VECTOR_REALISTIC");
            break;
          case 19:
            v29 = CFSTR("VECTOR_LEGACY_REALISTIC");
            break;
          case 20:
            v29 = CFSTR("VECTOR_ROADS");
            break;
          case 21:
            v29 = CFSTR("RASTER_VEGETATION");
            break;
          case 22:
            v29 = CFSTR("VECTOR_TRAFFIC_SKELETON");
            break;
          case 23:
            v29 = CFSTR("RASTER_COASTLINE_MASK");
            break;
          case 24:
            v29 = CFSTR("RASTER_HILLSHADE");
            break;
          case 25:
            v29 = CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
            break;
          case 26:
            v29 = CFSTR("VECTOR_TRAFFIC_STATIC");
            break;
          case 27:
            v29 = CFSTR("RASTER_COASTLINE_DROP_MASK");
            break;
          case 28:
            v29 = CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
            break;
          case 29:
            v29 = CFSTR("VECTOR_SPEED_PROFILES");
            break;
          case 30:
            v29 = CFSTR("VECTOR_VENUES");
            break;
          case 31:
            v29 = CFSTR("RASTER_DOWN_SAMPLED");
            break;
          case 32:
            v29 = CFSTR("RASTER_COLOR_BALANCED");
            break;
          case 33:
            v29 = CFSTR("RASTER_SATELLITE_NIGHT");
            break;
          case 34:
            v29 = CFSTR("SPUTNIK_VECTOR_BORDER");
            break;
          case 35:
            v29 = CFSTR("RASTER_SATELLITE_DIGITIZE");
            break;
          case 36:
            v29 = CFSTR("RASTER_HILLSHADE_PARKS");
            break;
          case 37:
            v29 = CFSTR("VECTOR_TRANSIT");
            break;
          case 38:
            v29 = CFSTR("RASTER_STANDARD_BASE");
            break;
          case 39:
            v29 = CFSTR("RASTER_STANDARD_LABELS");
            break;
          case 40:
            v29 = CFSTR("RASTER_HYBRID_ROADS");
            break;
          case 41:
            v29 = CFSTR("RASTER_HYBRID_LABELS");
            break;
          case 42:
            v29 = CFSTR("FLYOVER_C3M_MESH");
            break;
          case 43:
            v29 = CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
            break;
          case 44:
            v29 = CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
            break;
          case 45:
            v29 = CFSTR("RASTER_SATELLITE_ASTC");
            break;
          case 46:
            v29 = CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
            break;
          case 47:
            v29 = CFSTR("VECTOR_TRANSIT_SELECTION");
            break;
          case 48:
            v29 = CFSTR("VECTOR_COVERAGE");
            break;
          case 52:
            v29 = CFSTR("FLYOVER_METADATA");
            break;
          case 53:
            v29 = CFSTR("VECTOR_ROAD_NETWORK");
            break;
          case 54:
            v29 = CFSTR("VECTOR_LAND_COVER");
            break;
          case 55:
            v29 = CFSTR("VECTOR_DEBUG");
            break;
          case 56:
            v29 = CFSTR("VECTOR_STREET_POI");
            break;
          case 57:
            v29 = CFSTR("MUNIN_METADATA");
            break;
          case 58:
            v29 = CFSTR("VECTOR_SPR_MERCATOR");
            break;
          case 59:
            v29 = CFSTR("VECTOR_SPR_MODELS");
            break;
          case 60:
            v29 = CFSTR("VECTOR_SPR_MATERIALS");
            break;
          case 61:
            v29 = CFSTR("VECTOR_SPR_METADATA");
            break;
          case 62:
            v29 = CFSTR("VECTOR_TRACKS");
            break;
          case 63:
            v29 = CFSTR("VECTOR_RESERVED_2");
            break;
          case 64:
            v29 = CFSTR("VECTOR_STREET_LANDMARKS");
            break;
          case 65:
            v29 = CFSTR("COARSE_LOCATION_POLYGONS");
            break;
          case 66:
            v29 = CFSTR("VECTOR_SPR_ROADS");
            break;
          case 67:
            v29 = CFSTR("VECTOR_SPR_STANDARD");
            break;
          case 68:
            v29 = CFSTR("VECTOR_POI_V2");
            break;
          case 69:
            v29 = CFSTR("VECTOR_POLYGON_SELECTION");
            break;
          case 70:
            v29 = CFSTR("VL_METADATA");
            break;
          case 71:
            v29 = CFSTR("VL_DATA");
            break;
          case 72:
            v29 = CFSTR("PROACTIVE_APP_CLIP");
            break;
          case 73:
            v29 = CFSTR("VECTOR_BUILDINGS_V2");
            break;
          case 74:
            v29 = CFSTR("POI_BUSYNESS");
            break;
          case 75:
            v29 = CFSTR("POI_DP_BUSYNESS");
            break;
          case 76:
            v29 = CFSTR("SMART_INTERFACE_SELECTION");
            break;
          case 77:
            v29 = CFSTR("VECTOR_ASSETS");
            break;
          case 78:
            v29 = CFSTR("SPR_ASSET_METADATA");
            break;
          case 79:
            v29 = CFSTR("VECTOR_SPR_POLAR");
            break;
          case 80:
            v29 = CFSTR("SMART_DATA_MODE");
            break;
          case 81:
            v29 = CFSTR("CELLULAR_PERFORMANCE_SCORE");
            break;
          case 82:
            v29 = CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
            break;
          case 83:
            v29 = CFSTR("VECTOR_TOPOGRAPHIC");
            break;
          case 84:
            v29 = CFSTR("VECTOR_POI_V2_UPDATE");
            break;
          case 85:
            v29 = CFSTR("VECTOR_LIVE_DATA_UPDATES");
            break;
          case 86:
            v29 = CFSTR("VECTOR_TRAFFIC_V2");
            break;
          case 87:
            v29 = CFSTR("VECTOR_ROAD_SELECTION");
            break;
          case 88:
            v29 = CFSTR("VECTOR_REGION_METADATA");
            break;
          case 89:
            v29 = CFSTR("RAY_TRACING");
            break;
          case 90:
            v29 = CFSTR("VECTOR_CONTOURS");
            break;
          case 91:
            v29 = CFSTR("RASTER_SATELLITE_POLAR");
            break;
          case 92:
            v29 = CFSTR("VMAP4_ELEVATION");
            break;
          case 93:
            v29 = CFSTR("VMAP4_ELEVATION_POLAR");
            break;
          case 94:
            v29 = CFSTR("CELLULAR_COVERAGE_PLMN");
            break;
          case 95:
            v29 = CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
            break;
          case 96:
            v29 = CFSTR("UNUSED_96");
            break;
          case 97:
            v29 = CFSTR("UNUSED_97");
            break;
          case 98:
            v29 = CFSTR("UNUSED_98");
            break;
          case 99:
            v29 = CFSTR("UNUSED_99");
            break;
          case 100:
            v29 = CFSTR("UNUSED_100");
            break;
          case 101:
            v29 = CFSTR("UNUSED_101");
            break;
          case 102:
            v29 = CFSTR("UNUSED_102");
            break;
          case 103:
            v29 = CFSTR("UNUSED_103");
            break;
          case 104:
            v29 = CFSTR("UNUSED_104");
            break;
          case 105:
            v29 = CFSTR("UNUSED_105");
            break;
          case 106:
            v29 = CFSTR("UNUSED_106");
            break;
          case 107:
            v29 = CFSTR("UNUSED_107");
            break;
          case 108:
            v29 = CFSTR("UNUSED_108");
            break;
          case 109:
            v29 = CFSTR("UNUSED_109");
            break;
          case 110:
            v29 = CFSTR("UNUSED_110");
            break;
          case 111:
            v29 = CFSTR("UNUSED_111");
            break;
          case 112:
            v29 = CFSTR("UNUSED_112");
            break;
          case 113:
            v29 = CFSTR("UNUSED_113");
            break;
          case 114:
            v29 = CFSTR("UNUSED_114");
            break;
          case 115:
            v29 = CFSTR("UNUSED_115");
            break;
          case 116:
            v29 = CFSTR("UNUSED_116");
            break;
          case 117:
            v29 = CFSTR("UNUSED_117");
            break;
          case 118:
            v29 = CFSTR("UNUSED_118");
            break;
          case 119:
            v29 = CFSTR("UNUSED_119");
            break;
          default:
            v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v22));
            break;
        }
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textLabel"));
        objc_msgSend(v42, "setText:", v29);

        if (v24 >= 3)
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v24));
        else
          v43 = *(&off_1011BDE38 + (int)v24);
        if (v26 >= 3)
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v26));
        else
          v44 = *(&off_1011BDE50 + (int)v26);
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ - %@ - %u"), v43, v44, v28));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "detailTextLabel"));
        objc_msgSend(v46, "setText:", v45);

        objc_msgSend(v12, "setAccessoryType:", 1);
        goto LABEL_152;
      }
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("AddActiveTileGroupOverrideCell")));
      if (!v12)
        v12 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("AddActiveTileGroupOverrideCell"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textLabel"));
      objc_msgSend(v30, "setText:", CFSTR("Add TileSet Override"));
      goto LABEL_29;
    }
    if (!v8)
    {
      canChangeTileGroup = self->_canChangeTileGroup;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestDownload resources](self->_resourceManifest, "resources"));
      v11 = (char *)objc_msgSend(v7, "row");
      if (v11 >= (char *)objc_msgSend(v10, "tileGroupsCount") + canChangeTileGroup)
      {
        v12 = 0;
LABEL_152:

        goto LABEL_153;
      }
      v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("ActiveTileGroupCell")));
      if (!v12)
        v12 = objc_msgSend(objc_alloc((Class)UITableViewCell), "initWithStyle:reuseIdentifier:", 0, CFSTR("ActiveTileGroupCell"));
      objc_msgSend(v12, "setAccessoryView:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textLabel"));
      objc_msgSend(v14, "setTextColor:", v13);

      v15 = objc_msgSend(v7, "row");
      if (!canChangeTileGroup || v15)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tileGroupAtIndex:", (char *)objc_msgSend(v7, "row") - canChangeTileGroup));
        v32 = objc_msgSend(v31, "identifier");

        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), v32));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textLabel"));
        objc_msgSend(v34, "setText:", v33);

        objc_msgSend(v12, "setTag:", v32);
        if (!GEOConfigGetBOOL(GeoServicesConfig_DisableUpdatingActiveTileGroup[0], GeoServicesConfig_DisableUpdatingActiveTileGroup[1]))goto LABEL_30;
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
        v36 = objc_msgSend(v35, "activeTileGroupIdentifier");

        if ((_DWORD)v32 != v36)
          goto LABEL_30;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textLabel"));
        objc_msgSend(v37, "setTextColor:", v30);
      }
      else
      {
        if (objc_msgSend(v10, "tileGroupsCount"))
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tileGroupAtIndex:", 0));
          v17 = objc_msgSend(v16, "identifier");

        }
        else
        {
          v17 = 0;
        }
        objc_msgSend(v12, "setTag:", -1);
        if ((GEOConfigGetBOOL(GeoServicesConfig_DisableUpdatingActiveTileGroup[0], GeoServicesConfig_DisableUpdatingActiveTileGroup[1]) & 1) == 0)
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textLabel"));
          objc_msgSend(v39, "setTextColor:", v38);

          v40 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "activeTileGroup"));
          v17 = objc_msgSend(v41, "identifier");

        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Default (%d)"), v17));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textLabel"));
        objc_msgSend(v37, "setText:", v30);
      }

LABEL_29:
LABEL_30:
      objc_msgSend(v12, "setAccessoryType:", 1);
      goto LABEL_152;
    }
  }
  v12 = 0;
LABEL_153:

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  TileSetOverrideDebugController *v8;
  TileGroupSectionsDebugController *v9;
  void *v10;
  TileGroupSectionsDebugController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  TileGroupSectionsDebugController *v17;
  TileSetOverrideDebugController *v18;
  void *v19;
  uint64_t Array;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  unsigned int v32;
  id v33;

  v33 = a3;
  v6 = a4;
  objc_msgSend(v33, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = objc_msgSend(v6, "section");
  if (v7 == (id)1)
  {
    v18 = [TileSetOverrideDebugController alloc];
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ActiveTileGroupDebugController tableView](self, "tableView"));
    v8 = -[TileSetOverrideDebugController initWithStyle:](v18, "initWithStyle:", objc_msgSend(v19, "style"));

    -[TileSetOverrideDebugController setTitle:](v8, "setTitle:", CFSTR("Custom Tile Set Override"));
    Array = GEOConfigGetArray(GeoServicesConfig_ActiveTileGroupOverrides[0], GeoServicesConfig_ActiveTileGroupOverrides[1]);
    v11 = (TileGroupSectionsDebugController *)objc_claimAutoreleasedReturnValue(Array);
    v21 = objc_msgSend(v6, "row");
    if (v21 < -[TileGroupSectionsDebugController count](v11, "count"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[TileGroupSectionsDebugController objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", GEOActiveTileGroupOverrideStyleKey));
      v32 = objc_msgSend(v23, "intValue");

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", GEOActiveTileGroupOverrideSizeKey));
      v25 = objc_msgSend(v24, "intValue");

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", GEOActiveTileGroupOverrideScaleKey));
      v27 = objc_msgSend(v26, "intValue");

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", GEOActiveTileGroupOverrideVersionKey));
      v29 = objc_msgSend(v28, "unsignedIntValue");

      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", GEOActiveTileGroupOverrideBaseURLKey));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", GEOActiveTileGroupOverrideLocalizationURLKey));
      -[TileSetOverrideDebugController setStyle:](v8, "setStyle:", v32);
      -[TileSetOverrideDebugController setSize:](v8, "setSize:", v25);
      -[TileSetOverrideDebugController setScale:](v8, "setScale:", v27);
      -[TileSetOverrideDebugController setVersion:](v8, "setVersion:", v29);
      -[TileSetOverrideDebugController setBaseURL:](v8, "setBaseURL:", v30);
      -[TileSetOverrideDebugController setLocalizationURL:](v8, "setLocalizationURL:", v31);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActiveTileGroupDebugController navigationController](self, "navigationController"));
    v16 = v15;
    v17 = (TileGroupSectionsDebugController *)v8;
    goto LABEL_9;
  }
  if (!v7)
  {
    v8 = (TileSetOverrideDebugController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "cellForRowAtIndexPath:", v6));
    v9 = [TileGroupSectionsDebugController alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ActiveTileGroupDebugController tableView](self, "tableView"));
    v11 = -[TileGroupSectionsDebugController initWithStyle:](v9, "initWithStyle:", objc_msgSend(v10, "style"));

    -[TileGroupSectionsDebugController setTileGroupIdentifier:](v11, "setTileGroupIdentifier:", -[TileSetOverrideDebugController tag](v8, "tag"));
    -[TileGroupSectionsDebugController setCanChangeActiveTileGroup:](v11, "setCanChangeActiveTileGroup:", self->_canChangeTileGroup);
    -[TileGroupSectionsDebugController setResourceManifest:](v11, "setResourceManifest:", self->_resourceManifest);
    -[TileGroupSectionsDebugController setTitle:](v11, "setTitle:", CFSTR("Tile Group Details"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ActiveTileGroupDebugController navigationItem](self, "navigationItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rightBarButtonItem"));

    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TileGroupSectionsDebugController navigationItem](v11, "navigationItem"));
      objc_msgSend(v14, "setRightBarButtonItem:", 0);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ActiveTileGroupDebugController navigationController](self, "navigationController"));
    v16 = v15;
    v17 = v11;
LABEL_9:
    objc_msgSend(v15, "pushViewController:animated:", v17, 1);

  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return &stru_1011EB268;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceManifestError, 0);
  objc_storeStrong((id *)&self->_resourceManifest, 0);
}

@end
