@implementation TileGroupTileSetsDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Tile Sets");
}

- (void)resourceManifestManagerDidChangeActiveTileGroup:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TileGroupTileSetsDebugController tableView](self, "tableView", a3));
  objc_msgSend(v3, "reloadData");

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
    if (-[TileGroupTileSetsDebugController tileGroupIdentifier](self, "tileGroupIdentifier") == -1)
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
          if ((id)-[TileGroupTileSetsDebugController tileGroupIdentifier](self, "tileGroupIdentifier") == (id)v10)
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
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TileGroupTileSetsDebugController _tileGroup](self, "_tileGroup", a3));
  v4 = objc_msgSend(v3, "tileSetsCount");

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  const __CFString *v11;
  uint64_t v12;
  unsigned int *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __CFString *v19;
  void *v20;
  __CFString **v21;
  void *v22;
  NSString *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TileGroupTileSetsDebugController _tileGroup](self, "_tileGroup"));
  if ((uint64_t)objc_msgSend(v7, "row") > 5)
  {
    v9 = 0;
    goto LABEL_29;
  }
  if (objc_msgSend(v7, "row") == (id)4 || objc_msgSend(v7, "row") == (id)5)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("TileSetInfoWithSubtitleCell")));
    if (v9)
      goto LABEL_10;
    v10 = objc_alloc((Class)UITableViewCell);
    v11 = CFSTR("TileSetInfoWithSubtitleCell");
    v12 = 3;
  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("TileSetInfoCell")));
    if (v9)
      goto LABEL_10;
    v10 = objc_alloc((Class)UITableViewCell);
    v11 = CFSTR("TileSetInfoCell");
    v12 = 1;
  }
  v9 = objc_msgSend(v10, "initWithStyle:reuseIdentifier:", v12, v11);
LABEL_10:
  v13 = (unsigned int *)objc_msgSend(v8, "tileSets");
  v14 = objc_msgSend(v7, "section");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEOResourceManifestDownload resources](self->_resourceManifest, "resources"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tileSetAtIndex:", v13[2 * (_QWORD)v14 + 1]));

  switch((unint64_t)objc_msgSend(v7, "row"))
  {
    case 0uLL:
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textLabel"));
      objc_msgSend(v17, "setText:", CFSTR("Style"));

      v18 = objc_msgSend(v16, "style");
      v19 = CFSTR("RASTER_STANDARD");
      switch((int)v18)
      {
        case 0:
          goto LABEL_24;
        case 1:
          v19 = CFSTR("VECTOR_STANDARD");
          break;
        case 2:
          v19 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_FOR_RASTER");
          break;
        case 3:
          v19 = CFSTR("VECTOR_TRAFFIC_INCIDENTS_FOR_RASTER");
          break;
        case 4:
          v19 = CFSTR("VECTOR_TRAFFIC_SEGMENTS_AND_INCIDENTS_FOR_RASTER");
          break;
        case 5:
          v19 = CFSTR("RASTER_STANDARD_BACKGROUND");
          break;
        case 6:
          v19 = CFSTR("RASTER_HYBRID");
          break;
        case 7:
          v19 = CFSTR("RASTER_SATELLITE");
          break;
        case 8:
          v19 = CFSTR("RASTER_TERRAIN");
          break;
        case 11:
          v19 = CFSTR("VECTOR_BUILDINGS");
          break;
        case 12:
          v19 = CFSTR("VECTOR_TRAFFIC");
          break;
        case 13:
          v19 = CFSTR("VECTOR_POI");
          break;
        case 14:
          v19 = CFSTR("SPUTNIK_METADATA");
          break;
        case 15:
          v19 = CFSTR("SPUTNIK_C3M");
          break;
        case 16:
          v19 = CFSTR("SPUTNIK_DSM");
          break;
        case 17:
          v19 = CFSTR("SPUTNIK_DSM_GLOBAL");
          break;
        case 18:
          v19 = CFSTR("VECTOR_REALISTIC");
          break;
        case 19:
          v19 = CFSTR("VECTOR_LEGACY_REALISTIC");
          break;
        case 20:
          v19 = CFSTR("VECTOR_ROADS");
          break;
        case 21:
          v19 = CFSTR("RASTER_VEGETATION");
          break;
        case 22:
          v19 = CFSTR("VECTOR_TRAFFIC_SKELETON");
          break;
        case 23:
          v19 = CFSTR("RASTER_COASTLINE_MASK");
          break;
        case 24:
          v19 = CFSTR("RASTER_HILLSHADE");
          break;
        case 25:
          v19 = CFSTR("VECTOR_TRAFFIC_WITH_GREEN");
          break;
        case 26:
          v19 = CFSTR("VECTOR_TRAFFIC_STATIC");
          break;
        case 27:
          v19 = CFSTR("RASTER_COASTLINE_DROP_MASK");
          break;
        case 28:
          v19 = CFSTR("VECTOR_TRAFFIC_SKELETON_WITH_HISTORICAL");
          break;
        case 29:
          v19 = CFSTR("VECTOR_SPEED_PROFILES");
          break;
        case 30:
          v19 = CFSTR("VECTOR_VENUES");
          break;
        case 31:
          v19 = CFSTR("RASTER_DOWN_SAMPLED");
          break;
        case 32:
          v19 = CFSTR("RASTER_COLOR_BALANCED");
          break;
        case 33:
          v19 = CFSTR("RASTER_SATELLITE_NIGHT");
          break;
        case 34:
          v19 = CFSTR("SPUTNIK_VECTOR_BORDER");
          break;
        case 35:
          v19 = CFSTR("RASTER_SATELLITE_DIGITIZE");
          break;
        case 36:
          v19 = CFSTR("RASTER_HILLSHADE_PARKS");
          break;
        case 37:
          v19 = CFSTR("VECTOR_TRANSIT");
          break;
        case 38:
          v19 = CFSTR("RASTER_STANDARD_BASE");
          break;
        case 39:
          v19 = CFSTR("RASTER_STANDARD_LABELS");
          break;
        case 40:
          v19 = CFSTR("RASTER_HYBRID_ROADS");
          break;
        case 41:
          v19 = CFSTR("RASTER_HYBRID_LABELS");
          break;
        case 42:
          v19 = CFSTR("FLYOVER_C3M_MESH");
          break;
        case 43:
          v19 = CFSTR("FLYOVER_C3M_JPEG_TEXTURE");
          break;
        case 44:
          v19 = CFSTR("FLYOVER_C3M_ASTC_TEXTURE");
          break;
        case 45:
          v19 = CFSTR("RASTER_SATELLITE_ASTC");
          break;
        case 46:
          v19 = CFSTR("RASTER_HYBRID_ROADS_AND_LABELS");
          break;
        case 47:
          v19 = CFSTR("VECTOR_TRANSIT_SELECTION");
          break;
        case 48:
          v19 = CFSTR("VECTOR_COVERAGE");
          break;
        case 52:
          v19 = CFSTR("FLYOVER_METADATA");
          break;
        case 53:
          v19 = CFSTR("VECTOR_ROAD_NETWORK");
          break;
        case 54:
          v19 = CFSTR("VECTOR_LAND_COVER");
          break;
        case 55:
          v19 = CFSTR("VECTOR_DEBUG");
          break;
        case 56:
          v19 = CFSTR("VECTOR_STREET_POI");
          break;
        case 57:
          v19 = CFSTR("MUNIN_METADATA");
          break;
        case 58:
          v19 = CFSTR("VECTOR_SPR_MERCATOR");
          break;
        case 59:
          v19 = CFSTR("VECTOR_SPR_MODELS");
          break;
        case 60:
          v19 = CFSTR("VECTOR_SPR_MATERIALS");
          break;
        case 61:
          v19 = CFSTR("VECTOR_SPR_METADATA");
          break;
        case 62:
          v19 = CFSTR("VECTOR_TRACKS");
          break;
        case 63:
          v19 = CFSTR("VECTOR_RESERVED_2");
          break;
        case 64:
          v19 = CFSTR("VECTOR_STREET_LANDMARKS");
          break;
        case 65:
          v19 = CFSTR("COARSE_LOCATION_POLYGONS");
          break;
        case 66:
          v19 = CFSTR("VECTOR_SPR_ROADS");
          break;
        case 67:
          v19 = CFSTR("VECTOR_SPR_STANDARD");
          break;
        case 68:
          v19 = CFSTR("VECTOR_POI_V2");
          break;
        case 69:
          v19 = CFSTR("VECTOR_POLYGON_SELECTION");
          break;
        case 70:
          v19 = CFSTR("VL_METADATA");
          break;
        case 71:
          v19 = CFSTR("VL_DATA");
          break;
        case 72:
          v19 = CFSTR("PROACTIVE_APP_CLIP");
          break;
        case 73:
          v19 = CFSTR("VECTOR_BUILDINGS_V2");
          break;
        case 74:
          v19 = CFSTR("POI_BUSYNESS");
          break;
        case 75:
          v19 = CFSTR("POI_DP_BUSYNESS");
          break;
        case 76:
          v19 = CFSTR("SMART_INTERFACE_SELECTION");
          break;
        case 77:
          v19 = CFSTR("VECTOR_ASSETS");
          break;
        case 78:
          v19 = CFSTR("SPR_ASSET_METADATA");
          break;
        case 79:
          v19 = CFSTR("VECTOR_SPR_POLAR");
          break;
        case 80:
          v19 = CFSTR("SMART_DATA_MODE");
          break;
        case 81:
          v19 = CFSTR("CELLULAR_PERFORMANCE_SCORE");
          break;
        case 82:
          v19 = CFSTR("VECTOR_SPR_MODELS_OCCLUSION");
          break;
        case 83:
          v19 = CFSTR("VECTOR_TOPOGRAPHIC");
          break;
        case 84:
          v19 = CFSTR("VECTOR_POI_V2_UPDATE");
          break;
        case 85:
          v19 = CFSTR("VECTOR_LIVE_DATA_UPDATES");
          break;
        case 86:
          v19 = CFSTR("VECTOR_TRAFFIC_V2");
          break;
        case 87:
          v19 = CFSTR("VECTOR_ROAD_SELECTION");
          break;
        case 88:
          v19 = CFSTR("VECTOR_REGION_METADATA");
          break;
        case 89:
          v19 = CFSTR("RAY_TRACING");
          break;
        case 90:
          v19 = CFSTR("VECTOR_CONTOURS");
          break;
        case 91:
          v19 = CFSTR("RASTER_SATELLITE_POLAR");
          break;
        case 92:
          v19 = CFSTR("VMAP4_ELEVATION");
          break;
        case 93:
          v19 = CFSTR("VMAP4_ELEVATION_POLAR");
          break;
        case 94:
          v19 = CFSTR("CELLULAR_COVERAGE_PLMN");
          break;
        case 95:
          v19 = CFSTR("RASTER_SATELLITE_POLAR_NIGHT");
          break;
        case 96:
          v19 = CFSTR("UNUSED_96");
          break;
        case 97:
          v19 = CFSTR("UNUSED_97");
          break;
        case 98:
          v19 = CFSTR("UNUSED_98");
          break;
        case 99:
          v19 = CFSTR("UNUSED_99");
          break;
        case 100:
          v19 = CFSTR("UNUSED_100");
          break;
        case 101:
          v19 = CFSTR("UNUSED_101");
          break;
        case 102:
          v19 = CFSTR("UNUSED_102");
          break;
        case 103:
          v19 = CFSTR("UNUSED_103");
          break;
        case 104:
          v19 = CFSTR("UNUSED_104");
          break;
        case 105:
          v19 = CFSTR("UNUSED_105");
          break;
        case 106:
          v19 = CFSTR("UNUSED_106");
          break;
        case 107:
          v19 = CFSTR("UNUSED_107");
          break;
        case 108:
          v19 = CFSTR("UNUSED_108");
          break;
        case 109:
          v19 = CFSTR("UNUSED_109");
          break;
        case 110:
          v19 = CFSTR("UNUSED_110");
          break;
        case 111:
          v19 = CFSTR("UNUSED_111");
          break;
        case 112:
          v19 = CFSTR("UNUSED_112");
          break;
        case 113:
          v19 = CFSTR("UNUSED_113");
          break;
        case 114:
          v19 = CFSTR("UNUSED_114");
          break;
        case 115:
          v19 = CFSTR("UNUSED_115");
          break;
        case 116:
          v19 = CFSTR("UNUSED_116");
          break;
        case 117:
          v19 = CFSTR("UNUSED_117");
          break;
        case 118:
          v19 = CFSTR("UNUSED_118");
          break;
        case 119:
          v19 = CFSTR("UNUSED_119");
          break;
        default:
          goto LABEL_18;
      }
      goto LABEL_24;
    case 1uLL:
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textLabel"));
      objc_msgSend(v20, "setText:", CFSTR("Size"));

      v18 = objc_msgSend(v16, "size");
      if (v18 >= 3)
        goto LABEL_18;
      v21 = &off_1011BDE38;
      goto LABEL_17;
    case 2uLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textLabel"));
      objc_msgSend(v22, "setText:", CFSTR("Scale"));

      v18 = objc_msgSend(v16, "scale");
      if (v18 >= 3)
      {
LABEL_18:
        v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v18);
LABEL_20:
        v26 = objc_claimAutoreleasedReturnValue(v23);
LABEL_23:
        v19 = (__CFString *)v26;
      }
      else
      {
        v21 = &off_1011BDE50;
LABEL_17:
        v19 = v21[(int)v18];
      }
LABEL_24:
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "detailTextLabel"));
      objc_msgSend(v29, "setText:", v19);

LABEL_25:
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "detailTextLabel"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "text"));
      if (objc_msgSend(v31, "length"))
        v32 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
      else
        v32 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      v33 = (void *)v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textLabel"));
      objc_msgSend(v34, "setTextColor:", v33);

      break;
    case 3uLL:
      v24 = 2 * (_QWORD)v14;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textLabel"));
      objc_msgSend(v25, "setText:", CFSTR("Version"));

      v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%i"), v13[v24]);
      goto LABEL_20;
    case 4uLL:
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textLabel"));
      objc_msgSend(v27, "setText:", CFSTR("Base URL"));

      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "baseURL"));
      goto LABEL_23;
    case 5uLL:
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textLabel"));
      objc_msgSend(v28, "setText:", CFSTR("Localization URL"));

      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizationURL"));
      goto LABEL_23;
    default:
      goto LABEL_25;
  }
LABEL_29:

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceManifest, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
