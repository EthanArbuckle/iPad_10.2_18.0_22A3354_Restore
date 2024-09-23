@implementation VKTrafficFeature

- (VKTrafficFeature)initWithEnrouteNotice:(id)a3 onRoute:(id)a4
{
  id v6;
  id v7;
  VKTrafficFeature *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  VKTrafficFeature *v12;
  void *v13;
  uint64_t v14;
  NSString *uniqueIdentifier;
  int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  long double v30;
  long double v31;
  float64x2_t v32;
  double v38;
  double v39;
  float64_t longitude;
  objc_super v42;

  v6 = a3;
  v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)VKTrafficFeature;
  v8 = -[VKTrafficFeature init](&v42, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "trafficSignal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 || (objc_msgSend(v6, "trafficCamera"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(v6, "routeAnnotation");
      v12 = (VKTrafficFeature *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_37;
    }
    v8->_shouldUpdateStyle = 0;
    objc_msgSend(v6, "trafficSignal");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = 2;
    }
    else
    {
      objc_msgSend(v6, "trafficCamera");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        v11 = 1;
      else
        v11 = 3;
    }
    v8->_trafficFeatureType = v11;
    *(_QWORD *)&v8->_minZoom = 0x42C8000000000000;
    v8->_state = 0;
    objc_msgSend(v6, "identifier");
    v14 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v14;

    if (objc_msgSend(v6, "hasGroupIdentifier"))
      v16 = objc_msgSend(v6, "groupIdentifier");
    else
      v16 = -1;
    v8->_groupIdentifier = v16;
    v17 = objc_msgSend(v6, "hasGroupItemVerticalDisplayOrder");
    if (v17)
      v17 = objc_msgSend(v6, "groupItemVerticalDisplayOrder");
    v8->_groupItemVerticalDisplayOrder = v17;
    v18 = objc_msgSend(v6, "hasGroupItemHorizontalDisplayOrder");
    if (v18)
      v18 = objc_msgSend(v6, "groupItemHorizontalDisplayOrder");
    v8->_groupItemHorizontalDisplayOrder = v18;
    v19 = objc_msgSend(v6, "hasHighlightDistance");
    if (v19)
      v19 = objc_msgSend(v6, "highlightDistance");
    v8->_approachingDistanceInMeters = (double)v19;
    v8->_approachingRouteOffset = (PolylineCoordinate)*MEMORY[0x1E0D26A38];
    if (v7 && v19)
      v8->_approachingRouteOffset = (PolylineCoordinate)objc_msgSend(v7, "routeCoordinateAtDistance:beforeRouteCoordinate:", objc_msgSend(v6, "routeCoordinate"), (double)v19);
    if (objc_msgSend(v6, "hasPriority"))
    {
      v20 = objc_msgSend(v6, "priority");
      if (v20 >= 0xFF)
        v21 = -1;
      else
        v21 = v20;
    }
    else
    {
      v21 = 0;
    }
    v8->_collisionPriority = v21;
    v22 = objc_msgSend(v6, "routeCoordinate");
    v8->_routeOffset = (PolylineCoordinate)v22;
    if (v7)
    {
      objc_msgSend(v7, "pointWithAltitudeCorrectionAtRouteCoordinate:", v22);
      v24 = v23;
    }
    else
    {
      v24 = 0x7FEFFFFFFFFFFFFFLL;
    }
    objc_msgSend(v6, "position");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lat");
    v27 = v26;
    objc_msgSend(v6, "position");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lng");
    v8->_position.latitude = v27;
    v8->_position.longitude = v29;
    *(_QWORD *)&v8->_position.altitude = v24;

    longitude = v8->_position.longitude;
    v30 = tan(v8->_position.latitude * 0.00872664626 + 0.785398163);
    v31 = log(v30);
    v32.f64[0] = longitude;
    v32.f64[1] = v31;
    __asm { FMOV            V1.2D, #0.5 }
    *(float64x2_t *)&v8->_worldPoint.x = vmlaq_f64(_Q1, (float64x2_t)xmmword_19FFB32D0, v32);
    *(_QWORD *)&v8->_worldPoint.z = v24;
    if (v7)
    {
      objc_msgSend(v7, "distanceFromPoint:toPoint:", 0, *(_QWORD *)&v8->_routeOffset);
      v8->_routeOffsetInMeters = v38;
      v39 = VKTrafficFeatureDirection(&v8->_routeOffset, v7);
    }
    else
    {
      v8->_routeOffsetInMeters = 0.0;
      v39 = -1.0;
    }
    v8->_facingAzimuth = v39;
    v12 = v8;
  }
  else
  {
    v12 = 0;
  }
LABEL_37:

  return v12;
}

- (VKTrafficFeature)initWithFeatureType:(int64_t)a3 uniqueIdentifier:(id)a4 position:(id)a5 onRoute:(id)a6
{
  double var2;
  double var1;
  double var0;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  VKTrafficFeature *v20;
  uint64_t v22;

  var2 = a5.var2;
  var1 = a5.var1;
  var0 = a5.var0;
  v12 = a4;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    v15 = objc_msgSend(v13, "closestPointOnRoute:", var0, var1);
    v22 = v15;
    objc_msgSend(v14, "distanceFromPoint:toPoint:", 0, v15);
    v17 = v16;
    v18 = VKTrafficFeatureDirection(&v22, v14);
    if (var2 == 1.79769313e308)
    {
      objc_msgSend(v14, "pointWithAltitudeCorrectionAtRouteCoordinate:", v15);
      var2 = v19;
    }
  }
  else
  {
    v15 = *MEMORY[0x1E0D26A38];
    v17 = 0.0;
    v18 = -1.0;
  }
  v20 = -[VKTrafficFeature initWithFeatureType:uniqueIdentifier:position:direction:routeOffset:routeOffsetInMeters:](self, "initWithFeatureType:uniqueIdentifier:position:direction:routeOffset:routeOffsetInMeters:", a3, v12, v15, var0, var1, var2, v18, v17);

  return v20;
}

- (VKTrafficFeature)initWithFeatureType:(int64_t)a3 uniqueIdentifier:(id)a4 routeOffset:(PolylineCoordinate)a5 onRoute:(id)a6
{
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  VKTrafficFeature *v22;
  PolylineCoordinate v24;

  v24 = a5;
  v10 = a4;
  v11 = a6;
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "pointWithAltitudeCorrectionAtRouteCoordinate:", a5);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v12, "distanceFromPoint:toPoint:", 0, a5);
    v20 = v19;
    v21 = VKTrafficFeatureDirection(&v24, v12);
  }
  else
  {
    v20 = 0.0;
    v21 = -1.0;
    v16 = -180.0;
    v18 = 1.79769313e308;
    v14 = -180.0;
  }
  v22 = -[VKTrafficFeature initWithFeatureType:uniqueIdentifier:position:direction:routeOffset:routeOffsetInMeters:](self, "initWithFeatureType:uniqueIdentifier:position:direction:routeOffset:routeOffsetInMeters:", a3, v10, a5, v14, v16, v18, v21, v20);

  return v22;
}

- (VKTrafficFeature)initWithFeatureType:(int64_t)a3 uniqueIdentifier:(id)a4 position:(id)a5 direction:(double)a6 routeOffset:(PolylineCoordinate)a7 routeOffsetInMeters:(double)a8
{
  double var2;
  double var0;
  id v16;
  VKTrafficFeature *v17;
  VKTrafficFeature *v18;
  long double v19;
  long double v20;
  float64x2_t v21;
  VKTrafficFeature *v27;
  double var1;
  objc_super v30;

  var2 = a5.var2;
  var1 = a5.var1;
  var0 = a5.var0;
  v16 = a4;
  v30.receiver = self;
  v30.super_class = (Class)VKTrafficFeature;
  v17 = -[VKTrafficFeature init](&v30, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_shouldUpdateStyle = 0;
    v17->_trafficFeatureType = a3;
    *(_QWORD *)&v17->_minZoom = 0x42C8000000000000;
    objc_storeStrong((id *)&v17->_uniqueIdentifier, a4);
    v18->_collisionPriority = 0;
    v18->_approachingDistanceInMeters = 0.0;
    v18->_approachingRouteOffset = (PolylineCoordinate)*MEMORY[0x1E0D26A38];
    v18->_routeOffset = a7;
    v18->_routeOffsetInMeters = a8;
    v18->_groupItemHorizontalDisplayOrder = 0;
    *(_QWORD *)&v18->_groupIdentifier = 0xFFFFFFFFLL;
    v18->_position.latitude = var0;
    v18->_position.longitude = var1;
    v18->_position.altitude = var2;
    v19 = tan(var0 * 0.00872664626 + 0.785398163);
    v20 = log(v19);
    v21.f64[0] = var1;
    v21.f64[1] = v20;
    __asm { FMOV            V1.2D, #0.5 }
    *(float64x2_t *)&v18->_worldPoint.x = vmlaq_f64(_Q1, (float64x2_t)xmmword_19FFB32D0, v21);
    v18->_worldPoint.z = var2;
    v18->_facingAzimuth = a6;
    v27 = v18;
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  char *v4;
  _DWORD *v5;
  __int128 v6;
  __int128 v7;

  v4 = (char *)objc_alloc_init((Class)objc_opt_class());
  v5 = v4;
  if (v4)
  {
    v6 = *(_OWORD *)&self->_worldPoint.x;
    *((_QWORD *)v4 + 4) = *(_QWORD *)&self->_worldPoint.z;
    *((_OWORD *)v4 + 1) = v6;
    v7 = *(_OWORD *)&self->_position.latitude;
    *((_QWORD *)v4 + 11) = *(_QWORD *)&self->_position.altitude;
    *(_OWORD *)(v4 + 72) = v7;
    *((_DWORD *)v4 + 2) = LODWORD(self->_minZoom);
    *((_DWORD *)v4 + 3) = LODWORD(self->_maxZoom);
    *((_QWORD *)v4 + 13) = self->_routeOffset;
    *((_QWORD *)v4 + 18) = self->_trafficFeatureType;
    *((_QWORD *)v4 + 15) = self->_state;
    *((_QWORD *)v4 + 12) = self->_approachingRouteOffset;
    *((_QWORD *)v4 + 14) = *(_QWORD *)&self->_approachingDistanceInMeters;
    *((_QWORD *)v4 + 7) = *(_QWORD *)&self->_routeOffsetInMeters;
    objc_storeStrong((id *)v4 + 16, self->_uniqueIdentifier);
    v5[10] = self->_groupIdentifier;
    v5[12] = self->_groupItemHorizontalDisplayOrder;
    v5[11] = self->_groupItemVerticalDisplayOrder;
    *((_BYTE *)v5 + 152) = self->_shouldUpdateStyle;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VKTrafficFeature *v4;
  uint64_t v5;
  BOOL v6;
  VKTrafficFeature *v7;
  NSString *uniqueIdentifier;
  void *v9;
  int groupIdentifier;
  unsigned int groupItemVerticalDisplayOrder;
  unsigned int groupItemHorizontalDisplayOrder;
  uint64_t v13;
  uint64_t v14;

  v4 = (VKTrafficFeature *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      uniqueIdentifier = self->_uniqueIdentifier;
      -[VKTrafficFeature uniqueIdentifier](v7, "uniqueIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(uniqueIdentifier) = -[NSString isEqualToString:](uniqueIdentifier, "isEqualToString:", v9);

      v6 = 0;
      if ((uniqueIdentifier & 1) != 0)
      {
        groupIdentifier = self->_groupIdentifier;
        if (groupIdentifier == -[VKTrafficFeature groupIdentifier](v7, "groupIdentifier"))
        {
          groupItemVerticalDisplayOrder = self->_groupItemVerticalDisplayOrder;
          if (groupItemVerticalDisplayOrder == -[VKTrafficFeature groupItemVerticalDisplayOrder](v7, "groupItemVerticalDisplayOrder"))
          {
            groupItemHorizontalDisplayOrder = self->_groupItemHorizontalDisplayOrder;
            if (groupItemHorizontalDisplayOrder == -[VKTrafficFeature groupItemHorizontalDisplayOrder](v7, "groupItemHorizontalDisplayOrder"))
            {
              v13 = -[VKTrafficFeature routeOffset](v7, "routeOffset");
              if (self->_routeOffset.index == (_DWORD)v13
                && vabds_f32(self->_routeOffset.offset, *((float *)&v13 + 1)) < 0.00000011921)
              {
                v14 = -[VKTrafficFeature approachingRouteOffset](v7, "approachingRouteOffset");
                if (self->_approachingRouteOffset.index == (_DWORD)v14
                  && fabsf(self->_approachingRouteOffset.offset - *((float *)&v14 + 1)) < 0.00000011921)
                {
                  v6 = 1;
                }
              }
            }
          }
        }
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (Mercator3<double>)mercatorPoint
{
  double x;
  double y;
  double z;
  Mercator3<double> result;

  x = self->_worldPoint.x;
  y = self->_worldPoint.y;
  z = self->_worldPoint.z;
  result._e[2] = z;
  result._e[1] = y;
  result._e[0] = x;
  return result;
}

- (GEOFeatureStyleAttributes)styleAttributes
{
  VKTrafficFeature *v2;
  VKTrafficFeature *v3;
  id v4;
  uint64_t v6;
  __int128 v7;

  v2 = self;
  v3 = v2;
  if (v2)
  {
    -[VKTrafficFeature attributes](v2, "attributes");
  }
  else
  {
    v6 = 0;
    v7 = 0u;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0D270A8]);
  objc_msgSend(v4, "replaceAttributes:count:");
  if (v6)
    (*(void (**)(_QWORD, uint64_t, _QWORD))(**((_QWORD **)&v7 + 1) + 40))(*((_QWORD *)&v7 + 1), v6, v7 - v6);

  return (GEOFeatureStyleAttributes *)v4;
}

- (BOOL)isSignal
{
  return self->_trafficFeatureType == 2;
}

- (BOOL)isCamera
{
  return self->_trafficFeatureType == 1;
}

- (BOOL)isIncident
{
  return self->_trafficFeatureType == 0;
}

- (BOOL)isRouteAnnotation
{
  return self->_trafficFeatureType == 3;
}

- (BOOL)isUserReportedIncident
{
  return self->_trafficFeatureType == 4;
}

- (BOOL)isAheadButNotApproaching
{
  return self->_state == 1;
}

- (BOOL)isApproaching
{
  return self->_state == 2;
}

- (BOOL)isBehind
{
  return self->_state == 4;
}

- (BOOL)isGrouped
{
  return self->_groupIdentifier != -1;
}

- (vector<GeoCodecsFeatureStylePair,)attributes
{
  unsigned __int8 v5;
  uint64_t v6;
  GeoCodecsFeatureStylePair *var1;
  GeoCodecsFeatureStylePair *var0;
  GeoCodecsFeatureStylePair *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  GeoCodecsFeatureStylePair *v15;
  GeoCodecsFeatureStylePair *v16;
  GeoCodecsFeatureStylePair *v17;
  GeoCodecsFeatureStylePair *v18;
  unint64_t v19;
  uint64_t v20;
  GeoCodecsFeatureStylePair *v21;
  GeoCodecsFeatureStylePair *v22;
  GeoCodecsFeatureStylePair *v23;
  uint64_t v24;
  __int128 v25;
  GeoCodecsFeatureStylePair v26;
  GeoCodecsFeatureStylePair *v27;
  unint64_t v28;
  uint64_t v29;
  GeoCodecsFeatureStylePair *v30;
  GeoCodecsFeatureStylePair *v31;
  GeoCodecsFeatureStylePair *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  GeoCodecsFeatureStylePair *v38;
  GeoCodecsFeatureStylePair *v39;
  GeoCodecsFeatureStylePair *v40;
  GeoCodecsFeatureStylePair *v41;
  unint64_t v42;
  uint64_t v43;
  GeoCodecsFeatureStylePair *v44;
  GeoCodecsFeatureStylePair *v45;
  GeoCodecsFeatureStylePair *v46;
  uint64_t v47;
  __int128 v48;
  GeoCodecsFeatureStylePair v49;
  GeoCodecsFeatureStylePair *v50;
  VKTrafficFeature *v51;
  GeoCodecsFeatureStylePair *v52;
  GeoCodecsFeatureStylePair *v53;
  GeoCodecsFeatureStylePair *v54;
  VKTrafficFeature *v55;
  unint64_t v56;
  GeoCodecsFeatureStylePair *v57;
  void *v58;
  unint64_t v59;
  void *v60;
  void *v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  GeoCodecsFeatureStylePair *v65;
  GeoCodecsFeatureStylePair *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  GeoCodecsFeatureStylePair *v73;
  GeoCodecsFeatureStylePair *v74;
  GeoCodecsFeatureStylePair *v75;
  int64_t v76;
  unint64_t v77;
  GeoCodecsFeatureStylePair *v78;
  uint64_t v79;
  _OWORD *v80;
  GeoCodecsFeatureStylePair *v81;
  uint64_t v82;
  __int128 v83;
  GeoCodecsFeatureStylePair v84;
  GeoCodecsFeatureStylePair *v85;
  unint64_t v86;
  unint64_t v87;
  GeoCodecsFeatureStylePair *v88;
  GeoCodecsFeatureStylePair *v89;
  GeoCodecsFeatureStylePair *v90;
  VKTrafficFeature *v91;
  unint64_t v92;
  uint64_t v93;
  GeoCodecsFeatureStylePair *v94;
  GeoCodecsFeatureStylePair *v95;
  GeoCodecsFeatureStylePair *v96;
  GeoCodecsFeatureStylePair *v97;
  GeoCodecsFeatureStylePair *v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  GeoCodecsFeatureStylePair *v105;
  GeoCodecsFeatureStylePair *v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  GeoCodecsFeatureStylePair *v112;
  GeoCodecsFeatureStylePair *v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  GeoCodecsFeatureStylePair *v119;
  GeoCodecsFeatureStylePair *v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  GeoCodecsFeatureStylePair *v126;
  GeoCodecsFeatureStylePair *v127;
  GeoCodecsFeatureStylePair *v128;
  GeoCodecsFeatureStylePair *v129;
  unint64_t v130;
  uint64_t v131;
  GeoCodecsFeatureStylePair *v132;
  GeoCodecsFeatureStylePair *v133;
  GeoCodecsFeatureStylePair *v134;
  uint64_t v135;
  __int128 v136;
  GeoCodecsFeatureStylePair *v137;
  GeoCodecsFeatureStylePair *v138;
  unint64_t v139;
  uint64_t v140;
  GeoCodecsFeatureStylePair *v141;
  GeoCodecsFeatureStylePair *v142;
  GeoCodecsFeatureStylePair *v143;
  uint64_t v144;
  __int128 v145;
  GeoCodecsFeatureStylePair *v146;
  GeoCodecsFeatureStylePair *v147;
  unint64_t v148;
  uint64_t v149;
  GeoCodecsFeatureStylePair *v150;
  GeoCodecsFeatureStylePair *v151;
  GeoCodecsFeatureStylePair *v152;
  uint64_t v153;
  __int128 v154;
  GeoCodecsFeatureStylePair *v155;
  GeoCodecsFeatureStylePair *v156;
  GeoCodecsFeatureStylePair *v157;
  unint64_t v158;
  uint64_t v159;
  GeoCodecsFeatureStylePair *v160;
  GeoCodecsFeatureStylePair *v161;
  GeoCodecsFeatureStylePair *v162;
  uint64_t v163;
  __int128 v164;
  GeoCodecsFeatureStylePair v165;
  GeoCodecsFeatureStylePair *v166;
  uint64_t v167;
  int v168;
  uint64_t v169;
  GeoCodecsFeatureStylePair *v170;
  GeoCodecsFeatureStylePair *v171;
  GeoCodecsFeatureStylePair *v172;
  uint64_t v173;
  unint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  GeoCodecsFeatureStylePair *v178;
  GeoCodecsFeatureStylePair *v179;
  GeoCodecsFeatureStylePair *v180;
  GeoCodecsFeatureStylePair *v181;
  unint64_t v182;
  uint64_t v183;
  GeoCodecsFeatureStylePair *v184;
  GeoCodecsFeatureStylePair *v185;
  GeoCodecsFeatureStylePair *v186;
  uint64_t v187;
  __int128 v188;
  GeoCodecsFeatureStylePair v189;
  GeoCodecsFeatureStylePair *v190;
  GeoCodecsFeatureStylePair *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  GeoCodecsFeatureStylePair *v197;
  unint64_t v198;
  uint64_t v199;
  GeoCodecsFeatureStylePair *v200;
  GeoCodecsFeatureStylePair *v201;
  GeoCodecsFeatureStylePair *v202;
  uint64_t v203;
  __int128 v204;
  GeoCodecsFeatureStylePair v205;
  GeoCodecsFeatureStylePair *v206;
  uint64_t v207;
  GeoCodecsFeatureStylePair *v208;
  uint64_t v209;
  unint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  GeoCodecsFeatureStylePair *v214;
  unint64_t v215;
  uint64_t v216;
  GeoCodecsFeatureStylePair *v217;
  GeoCodecsFeatureStylePair *v218;
  GeoCodecsFeatureStylePair *v219;
  uint64_t v220;
  __int128 v221;
  GeoCodecsFeatureStylePair v222;
  GeoCodecsFeatureStylePair v223;
  GeoCodecsFeatureStylePair *v224;
  GeoCodecsFeatureStylePair *v225;
  uint64_t v226;
  unint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  GeoCodecsFeatureStylePair *v231;
  unint64_t v232;
  uint64_t v233;
  GeoCodecsFeatureStylePair *v234;
  GeoCodecsFeatureStylePair *v235;
  GeoCodecsFeatureStylePair *v236;
  uint64_t v237;
  __int128 v238;
  GeoCodecsFeatureStylePair v239;
  GeoCodecsFeatureStylePair v240;
  GeoCodecsFeatureStylePair v241;
  GeoCodecsFeatureStylePair *v242;
  vector<GeoCodecsFeatureStylePair, geo::StdAllocator<GeoCodecsFeatureStylePair, mdm::Allocator>> *result;
  GeoCodecsFeatureStylePair *v244;
  GeoCodecsFeatureStylePair *v245;
  GeoCodecsFeatureStylePair *v246;
  uint64_t v247;
  unint64_t v248;
  uint64_t v249;
  uint64_t v250;
  GeoCodecsFeatureStylePair *v251;
  GeoCodecsFeatureStylePair *v252;
  GeoCodecsFeatureStylePair *v253;
  GeoCodecsFeatureStylePair *v254;
  unint64_t v255;
  uint64_t v256;
  GeoCodecsFeatureStylePair *v257;
  GeoCodecsFeatureStylePair *v258;
  GeoCodecsFeatureStylePair *v259;
  uint64_t v260;
  __int128 v261;
  GeoCodecsFeatureStylePair v262;
  GeoCodecsFeatureStylePair *v263;
  uint64_t v264;
  unsigned __int8 v265;
  char v266;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  {
    v264 = operator new();
    mdm::Allocator::instance(void)::alloc = geo::MallocZoneAllocator::MallocZoneAllocator(v264, "VectorKitLabels", 0x5ED09DD50000000FLL);
  }
  v6 = mdm::Allocator::instance(void)::alloc;
  retstr->var2.var1.var0 = (Allocator *)mdm::Allocator::instance(void)::alloc;
  var1 = retstr->var1;
  var0 = retstr->var2.var0;
  if (var1 < var0)
  {
    if (var1)
      *var1 = (GeoCodecsFeatureStylePair)0x300000005;
    v9 = var1 + 1;
    goto LABEL_29;
  }
  v10 = var1 - retstr->var0;
  v11 = v10 + 1;
  if ((unint64_t)(v10 + 1) >> 61)
    abort();
  v12 = (char *)var0 - (char *)retstr->var0;
  if (v12 >> 2 > v11)
    v11 = v12 >> 2;
  if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
    v13 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v13 = v11;
  if (v13)
  {
    v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 16))(v6, 8 * v13, 4);
    v15 = (GeoCodecsFeatureStylePair *)(v14 + 8 * v10);
    v16 = (GeoCodecsFeatureStylePair *)(v14 + 8 * v13);
    if (v14)
      *v15 = (GeoCodecsFeatureStylePair)0x300000005;
  }
  else
  {
    v16 = 0;
    v15 = (GeoCodecsFeatureStylePair *)(8 * v10);
  }
  v9 = v15 + 1;
  v18 = retstr->var0;
  v17 = retstr->var1;
  if (v17 != retstr->var0)
  {
    v19 = (char *)v17 - (char *)retstr->var0 - 8;
    if (v19 < 0x38)
    {
      v21 = retstr->var1;
    }
    else if ((unint64_t)((char *)v17 - (char *)v15) < 0x20)
    {
      v21 = retstr->var1;
    }
    else
    {
      v20 = (v19 >> 3) + 1;
      v21 = &v17[-(v20 & 0x3FFFFFFFFFFFFFFCLL)];
      v22 = v15 - 2;
      v23 = v17 - 2;
      v24 = v20 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v25 = *(_OWORD *)&v23->var0;
        *(_OWORD *)&v22[-2].var0 = *(_OWORD *)&v23[-2].var0;
        *(_OWORD *)&v22->var0 = v25;
        v22 -= 4;
        v23 -= 4;
        v24 -= 4;
      }
      while (v24);
      v15 -= v20 & 0x3FFFFFFFFFFFFFFCLL;
      if (v20 == (v20 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_26;
    }
    do
    {
      v26 = v21[-1];
      --v21;
      v15[-1] = v26;
      --v15;
    }
    while (v21 != v18);
LABEL_26:
    v17 = retstr->var0;
  }
  retstr->var0 = v15;
  retstr->var1 = v9;
  v27 = retstr->var2.var0;
  retstr->var2.var0 = v16;
  if (v17)
    (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0
                                                                                     + 40))(retstr->var2.var1.var0, v17, (char *)v27 - (char *)v17);
LABEL_29:
  retstr->var1 = v9;
  if (-[VKTrafficFeature navigationState](self, "navigationState"))
  {
    v28 = -[VKTrafficFeature navigationState](self, "navigationState");
    if (v28 > 4)
      v29 = -4294901751;
    else
      v29 = qword_1A007ECB8[v28];
    v30 = retstr->var1;
    v31 = retstr->var2.var0;
    if (v30 < v31)
    {
      if (v30)
        *v30 = (GeoCodecsFeatureStylePair)v29;
      v32 = v30 + 1;
LABEL_60:
      retstr->var1 = v32;
      goto LABEL_61;
    }
    v33 = v30 - retstr->var0;
    v34 = v33 + 1;
    if ((unint64_t)(v33 + 1) >> 61)
      abort();
    v35 = (char *)v31 - (char *)retstr->var0;
    if (v35 >> 2 > v34)
      v34 = v35 >> 2;
    if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8)
      v36 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v36 = v34;
    if (v36)
    {
      v37 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v36, 4);
      v38 = (GeoCodecsFeatureStylePair *)(v37 + 8 * v33);
      v39 = (GeoCodecsFeatureStylePair *)(v37 + 8 * v36);
      if (v37)
        *v38 = (GeoCodecsFeatureStylePair)v29;
    }
    else
    {
      v39 = 0;
      v38 = (GeoCodecsFeatureStylePair *)(8 * v33);
    }
    v32 = v38 + 1;
    v41 = retstr->var0;
    v40 = retstr->var1;
    if (v40 == retstr->var0)
    {
LABEL_58:
      retstr->var0 = v38;
      retstr->var1 = v32;
      v50 = retstr->var2.var0;
      retstr->var2.var0 = v39;
      if (v40)
        (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0
                                                                                         + 40))(retstr->var2.var1.var0, v40, (char *)v50 - (char *)v40);
      goto LABEL_60;
    }
    v42 = (char *)v40 - (char *)retstr->var0 - 8;
    if (v42 < 0x38)
    {
      v44 = retstr->var1;
    }
    else if ((unint64_t)((char *)v40 - (char *)v38) < 0x20)
    {
      v44 = retstr->var1;
    }
    else
    {
      v43 = (v42 >> 3) + 1;
      v44 = &v40[-(v43 & 0x3FFFFFFFFFFFFFFCLL)];
      v45 = v38 - 2;
      v46 = v40 - 2;
      v47 = v43 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v48 = *(_OWORD *)&v46->var0;
        *(_OWORD *)&v45[-2].var0 = *(_OWORD *)&v46[-2].var0;
        *(_OWORD *)&v45->var0 = v48;
        v45 -= 4;
        v46 -= 4;
        v47 -= 4;
      }
      while (v47);
      v38 -= v43 & 0x3FFFFFFFFFFFFFFCLL;
      if (v43 == (v43 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_57;
    }
    do
    {
      v49 = v44[-1];
      --v44;
      v38[-1] = v49;
      --v38;
    }
    while (v44 != v41);
LABEL_57:
    v40 = retstr->var0;
    goto LABEL_58;
  }
LABEL_61:
  switch(self->_trafficFeatureType)
  {
    case 1:
      v51 = self;
      v52 = retstr->var1;
      v53 = retstr->var2.var0;
      if (v52 < v53)
      {
        if (v52)
          *v52 = (GeoCodecsFeatureStylePair)0xF800000006;
        v54 = v52 + 1;
        goto LABEL_186;
      }
      v100 = v52 - retstr->var0;
      v101 = v100 + 1;
      if ((unint64_t)(v100 + 1) >> 61)
        abort();
      v102 = (char *)v53 - (char *)retstr->var0;
      if (v102 >> 2 > v101)
        v101 = v102 >> 2;
      if ((unint64_t)v102 >= 0x7FFFFFFFFFFFFFF8)
        v103 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v103 = v101;
      if (v103)
      {
        v104 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v103, 4);
        v105 = (GeoCodecsFeatureStylePair *)(v104 + 8 * v100);
        v106 = (GeoCodecsFeatureStylePair *)(v104 + 8 * v103);
        if (v104)
          *v105 = (GeoCodecsFeatureStylePair)0xF800000006;
      }
      else
      {
        v106 = 0;
        v105 = (GeoCodecsFeatureStylePair *)(8 * v100);
      }
      v54 = v105 + 1;
      v129 = retstr->var0;
      v128 = retstr->var1;
      if (v128 == retstr->var0)
        goto LABEL_184;
      v130 = (char *)v128 - (char *)retstr->var0 - 8;
      if (v130 < 0x38)
      {
        v132 = retstr->var1;
      }
      else if ((unint64_t)((char *)v128 - (char *)v105) < 0x20)
      {
        v132 = retstr->var1;
      }
      else
      {
        v131 = (v130 >> 3) + 1;
        v132 = &v128[-(v131 & 0x3FFFFFFFFFFFFFFCLL)];
        v133 = v105 - 2;
        v134 = v128 - 2;
        v135 = v131 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v136 = *(_OWORD *)&v134->var0;
          *(_OWORD *)&v133[-2].var0 = *(_OWORD *)&v134[-2].var0;
          *(_OWORD *)&v133->var0 = v136;
          v133 -= 4;
          v134 -= 4;
          v135 -= 4;
        }
        while (v135);
        v105 -= v131 & 0x3FFFFFFFFFFFFFFCLL;
        if (v131 == (v131 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_183:
          v128 = retstr->var0;
LABEL_184:
          retstr->var0 = v105;
          retstr->var1 = v54;
          v166 = retstr->var2.var0;
          retstr->var2.var0 = v106;
          if (v128)
            (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0
                                                                                             + 40))(retstr->var2.var1.var0, v128, (char *)v166 - (char *)v128);
LABEL_186:
          retstr->var1 = v54;
          v167 = -[VKTrafficFeature type](v51, "type");
          v168 = -[VKTrafficFeature isAboveSpeedThreshold](v51, "isAboveSpeedThreshold");
          v169 = 0;
          switch(v167)
          {
            case 0:
              break;
            case 1:
              if (v168)
                v169 = 1;
              else
                v169 = 2;
              break;
            case 2:
              v169 = 3;
              break;
            case 3:
              v169 = 4;
              break;
            case 4:
              v169 = 5;
              break;
            case 5:
              v169 = 6;
              break;
            case 6:
              v169 = 7;
              break;
            default:
              v169 = 0xFFFFFFFFLL;
              break;
          }
          v170 = retstr->var1;
          v171 = retstr->var2.var0;
          if (v170 < v171)
          {
            if (v170)
              *v170 = (GeoCodecsFeatureStylePair)(((v169 << 32) | 0x10008) + 58);
            v172 = v170 + 1;
            goto LABEL_277;
          }
          v173 = v170 - retstr->var0;
          v174 = v173 + 1;
          if ((unint64_t)(v173 + 1) >> 61)
            abort();
          v175 = (char *)v171 - (char *)retstr->var0;
          if (v175 >> 2 > v174)
            v174 = v175 >> 2;
          if ((unint64_t)v175 >= 0x7FFFFFFFFFFFFFF8)
            v176 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v176 = v174;
          if (v176)
          {
            v177 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v176, 4);
            v178 = (GeoCodecsFeatureStylePair *)(v177 + 8 * v173);
            v179 = (GeoCodecsFeatureStylePair *)(v177 + 8 * v176);
            if (v177)
              *v178 = (GeoCodecsFeatureStylePair)(((v169 << 32) | 0x10008) + 58);
          }
          else
          {
            v179 = 0;
            v178 = (GeoCodecsFeatureStylePair *)(8 * v173);
          }
          v172 = v178 + 1;
          v181 = retstr->var0;
          v180 = retstr->var1;
          if (v180 == retstr->var0)
          {
LABEL_275:
            retstr->var0 = v178;
            retstr->var1 = v172;
            v224 = retstr->var2.var0;
            retstr->var2.var0 = v179;
            if (v180)
              (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0
                                                                                               + 40))(retstr->var2.var1.var0, v180, (char *)v224 - (char *)v180);
LABEL_277:
            retstr->var1 = v172;
            if (!-[VKTrafficFeature hasCountryCode](v51, "hasCountryCode"))
              goto LABEL_315;
            v207 = -[VKTrafficFeature countryCode](v51, "countryCode");
            v97 = retstr->var1;
            v225 = retstr->var2.var0;
            if (v97 < v225)
            {
LABEL_279:
              if (v97)
              {
                v99 = (v207 << 32) | 4;
                goto LABEL_281;
              }
              goto LABEL_282;
            }
            v226 = v97 - retstr->var0;
            v227 = v226 + 1;
            if ((unint64_t)(v226 + 1) >> 61)
              abort();
            v228 = (char *)v225 - (char *)retstr->var0;
            if (v228 >> 2 > v227)
              v227 = v228 >> 2;
            if ((unint64_t)v228 >= 0x7FFFFFFFFFFFFFF8)
              v229 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v229 = v227;
            if (v229)
            {
              v230 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v229, 4);
              v126 = (GeoCodecsFeatureStylePair *)(v230 + 8 * v226);
              v127 = (GeoCodecsFeatureStylePair *)(v230 + 8 * v229);
              if (v230)
                *v126 = (GeoCodecsFeatureStylePair)((v207 << 32) | 4);
            }
            else
            {
              v127 = 0;
              v126 = (GeoCodecsFeatureStylePair *)(8 * v226);
            }
            v155 = v126 + 1;
            v231 = retstr->var0;
            v156 = retstr->var1;
            if (v156 != retstr->var0)
            {
              v232 = (char *)v156 - (char *)retstr->var0 - 8;
              if (v232 < 0x38)
              {
                v234 = retstr->var1;
              }
              else if ((unint64_t)((char *)v156 - (char *)v126) < 0x20)
              {
                v234 = retstr->var1;
              }
              else
              {
                v233 = (v232 >> 3) + 1;
                v234 = &v156[-(v233 & 0x3FFFFFFFFFFFFFFCLL)];
                v235 = v126 - 2;
                v236 = v156 - 2;
                v237 = v233 & 0x3FFFFFFFFFFFFFFCLL;
                do
                {
                  v238 = *(_OWORD *)&v236->var0;
                  *(_OWORD *)&v235[-2].var0 = *(_OWORD *)&v236[-2].var0;
                  *(_OWORD *)&v235->var0 = v238;
                  v235 -= 4;
                  v236 -= 4;
                  v237 -= 4;
                }
                while (v237);
                v126 -= v233 & 0x3FFFFFFFFFFFFFFCLL;
                if (v233 == (v233 & 0x3FFFFFFFFFFFFFFCLL))
                  goto LABEL_311;
              }
              do
              {
                v241 = v234[-1];
                --v234;
                v126[-1] = v241;
                --v126;
              }
              while (v234 != v231);
              goto LABEL_311;
            }
LABEL_312:
            retstr->var0 = v126;
            retstr->var1 = v155;
            v242 = retstr->var2.var0;
            retstr->var2.var0 = v127;
            if (v156)
              (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0
                                                                                               + 40))(retstr->var2.var1.var0, v156, (char *)v242 - (char *)v156);
            goto LABEL_314;
          }
          v182 = (char *)v180 - (char *)retstr->var0 - 8;
          if (v182 < 0x38)
          {
            v184 = retstr->var1;
          }
          else if ((unint64_t)((char *)v180 - (char *)v178) < 0x20)
          {
            v184 = retstr->var1;
          }
          else
          {
            v183 = (v182 >> 3) + 1;
            v184 = &v180[-(v183 & 0x3FFFFFFFFFFFFFFCLL)];
            v185 = v178 - 2;
            v186 = v180 - 2;
            v187 = v183 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v188 = *(_OWORD *)&v186->var0;
              *(_OWORD *)&v185[-2].var0 = *(_OWORD *)&v186[-2].var0;
              *(_OWORD *)&v185->var0 = v188;
              v185 -= 4;
              v186 -= 4;
              v187 -= 4;
            }
            while (v187);
            v178 -= v183 & 0x3FFFFFFFFFFFFFFCLL;
            if (v183 == (v183 & 0x3FFFFFFFFFFFFFFCLL))
              goto LABEL_274;
          }
          do
          {
            v223 = v184[-1];
            --v184;
            v178[-1] = v223;
            --v178;
          }
          while (v184 != v181);
LABEL_274:
          v180 = retstr->var0;
          goto LABEL_275;
        }
      }
      do
      {
        v165 = v132[-1];
        --v132;
        v105[-1] = v165;
        --v105;
      }
      while (v132 != v129);
      goto LABEL_183;
    case 2:
      v91 = self;
      v92 = -[VKTrafficFeature type](v91, "type");
      if (v92 >= 3)
        v93 = -4294901682;
      else
        v93 = (v92 << 32) | 0x1004E;
      v94 = retstr->var1;
      v95 = retstr->var2.var0;
      if (v94 < v95)
      {
        if (v94)
          *v94 = (GeoCodecsFeatureStylePair)v93;
        v96 = v94 + 1;
        goto LABEL_248;
      }
      v114 = v94 - retstr->var0;
      v115 = v114 + 1;
      if ((unint64_t)(v114 + 1) >> 61)
        abort();
      v116 = (char *)v95 - (char *)retstr->var0;
      if (v116 >> 2 > v115)
        v115 = v116 >> 2;
      if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFFF8)
        v117 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v117 = v115;
      if (v117)
      {
        v118 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v117, 4);
        v119 = (GeoCodecsFeatureStylePair *)(v118 + 8 * v114);
        v120 = (GeoCodecsFeatureStylePair *)(v118 + 8 * v117);
        if (v118)
          *v119 = (GeoCodecsFeatureStylePair)v93;
      }
      else
      {
        v120 = 0;
        v119 = (GeoCodecsFeatureStylePair *)(8 * v114);
      }
      v96 = v119 + 1;
      v147 = retstr->var0;
      v146 = retstr->var1;
      if (v146 == retstr->var0)
        goto LABEL_246;
      v148 = (char *)v146 - (char *)retstr->var0 - 8;
      if (v148 < 0x38)
      {
        v150 = retstr->var1;
        do
        {
LABEL_244:
          v205 = v150[-1];
          --v150;
          v119[-1] = v205;
          --v119;
        }
        while (v150 != v147);
        goto LABEL_245;
      }
      if ((unint64_t)((char *)v146 - (char *)v119) < 0x20)
      {
        v150 = retstr->var1;
        goto LABEL_244;
      }
      v149 = (v148 >> 3) + 1;
      v150 = &v146[-(v149 & 0x3FFFFFFFFFFFFFFCLL)];
      v151 = v119 - 2;
      v152 = v146 - 2;
      v153 = v149 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v154 = *(_OWORD *)&v152->var0;
        *(_OWORD *)&v151[-2].var0 = *(_OWORD *)&v152[-2].var0;
        *(_OWORD *)&v151->var0 = v154;
        v151 -= 4;
        v152 -= 4;
        v153 -= 4;
      }
      while (v153);
      v119 -= v149 & 0x3FFFFFFFFFFFFFFCLL;
      if (v149 != (v149 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_244;
LABEL_245:
      v146 = retstr->var0;
LABEL_246:
      retstr->var0 = v119;
      retstr->var1 = v96;
      v206 = retstr->var2.var0;
      retstr->var2.var0 = v120;
      if (v146)
        (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0
                                                                                         + 40))(retstr->var2.var1.var0, v146, (char *)v206 - (char *)v146);
LABEL_248:
      retstr->var1 = v96;
      if (-[VKTrafficFeature hasCountryCode](v91, "hasCountryCode"))
      {
        v207 = -[VKTrafficFeature countryCode](v91, "countryCode");
        v97 = retstr->var1;
        v208 = retstr->var2.var0;
        if (v97 < v208)
          goto LABEL_279;
        v209 = v97 - retstr->var0;
        v210 = v209 + 1;
        if ((unint64_t)(v209 + 1) >> 61)
          abort();
        v211 = (char *)v208 - (char *)retstr->var0;
        if (v211 >> 2 > v210)
          v210 = v211 >> 2;
        if ((unint64_t)v211 >= 0x7FFFFFFFFFFFFFF8)
          v212 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v212 = v210;
        if (v212)
        {
          v213 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v212, 4);
          v126 = (GeoCodecsFeatureStylePair *)(v213 + 8 * v209);
          v127 = (GeoCodecsFeatureStylePair *)(v213 + 8 * v212);
          if (v213)
            *v126 = (GeoCodecsFeatureStylePair)((v207 << 32) | 4);
        }
        else
        {
          v127 = 0;
          v126 = (GeoCodecsFeatureStylePair *)(8 * v209);
        }
        v155 = v126 + 1;
        v214 = retstr->var0;
        v156 = retstr->var1;
        if (v156 == retstr->var0)
          goto LABEL_312;
        v215 = (char *)v156 - (char *)retstr->var0 - 8;
        if (v215 < 0x38)
        {
          v217 = retstr->var1;
        }
        else if ((unint64_t)((char *)v156 - (char *)v126) < 0x20)
        {
          v217 = retstr->var1;
        }
        else
        {
          v216 = (v215 >> 3) + 1;
          v217 = &v156[-(v216 & 0x3FFFFFFFFFFFFFFCLL)];
          v218 = v126 - 2;
          v219 = v156 - 2;
          v220 = v216 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v221 = *(_OWORD *)&v219->var0;
            *(_OWORD *)&v218[-2].var0 = *(_OWORD *)&v219[-2].var0;
            *(_OWORD *)&v218->var0 = v221;
            v218 -= 4;
            v219 -= 4;
            v220 -= 4;
          }
          while (v220);
          v126 -= v216 & 0x3FFFFFFFFFFFFFFCLL;
          if (v216 == (v216 & 0x3FFFFFFFFFFFFFFCLL))
            goto LABEL_311;
        }
        do
        {
          v240 = v217[-1];
          --v217;
          v126[-1] = v240;
          --v126;
        }
        while (v217 != v214);
LABEL_311:
        v156 = retstr->var0;
        goto LABEL_312;
      }
LABEL_315:

LABEL_316:
      result = (vector<GeoCodecsFeatureStylePair, geo::StdAllocator<GeoCodecsFeatureStylePair, mdm::Allocator>> *)-[VKTrafficFeature routeLegWhen](self, "routeLegWhen");
      if (v266)
      {
        result = (vector<GeoCodecsFeatureStylePair, geo::StdAllocator<GeoCodecsFeatureStylePair, mdm::Allocator>> *)-[VKTrafficFeature routeLegWhen](self, "routeLegWhen");
        v244 = retstr->var1;
        v245 = retstr->var2.var0;
        if (v244 < v245)
        {
          if (v244)
            *v244 = (GeoCodecsFeatureStylePair)((((unint64_t)v265 << 32) | 0x10008) + 76);
          v246 = v244 + 1;
LABEL_344:
          retstr->var1 = v246;
          return result;
        }
        v247 = v244 - retstr->var0;
        v248 = v247 + 1;
        if ((unint64_t)(v247 + 1) >> 61)
          abort();
        v249 = (char *)v245 - (char *)retstr->var0;
        if (v249 >> 2 > v248)
          v248 = v249 >> 2;
        if ((unint64_t)v249 >= 0x7FFFFFFFFFFFFFF8)
          v250 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v250 = v248;
        if (v250)
        {
          result = (vector<GeoCodecsFeatureStylePair, geo::StdAllocator<GeoCodecsFeatureStylePair, mdm::Allocator>> *)(*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v250, 4);
          v251 = (GeoCodecsFeatureStylePair *)&(&result->var0)[v247];
          v252 = (GeoCodecsFeatureStylePair *)&(&result->var0)[v250];
          if (result)
            *v251 = (GeoCodecsFeatureStylePair)((((unint64_t)v265 << 32) | 0x10008) + 76);
        }
        else
        {
          v252 = 0;
          v251 = (GeoCodecsFeatureStylePair *)(8 * v247);
        }
        v246 = v251 + 1;
        v254 = retstr->var0;
        v253 = retstr->var1;
        if (v253 == retstr->var0)
        {
LABEL_342:
          retstr->var0 = v251;
          retstr->var1 = v246;
          v263 = retstr->var2.var0;
          retstr->var2.var0 = v252;
          if (v253)
            result = (vector<GeoCodecsFeatureStylePair, geo::StdAllocator<GeoCodecsFeatureStylePair, mdm::Allocator>> *)(*(uint64_t (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0 + 40))(retstr->var2.var1.var0, v253, (char *)v263 - (char *)v253);
          goto LABEL_344;
        }
        v255 = (char *)v253 - (char *)retstr->var0 - 8;
        if (v255 < 0x38)
        {
          v257 = retstr->var1;
        }
        else if ((unint64_t)((char *)v253 - (char *)v251) < 0x20)
        {
          v257 = retstr->var1;
        }
        else
        {
          v256 = (v255 >> 3) + 1;
          v257 = &v253[-(v256 & 0x3FFFFFFFFFFFFFFCLL)];
          v258 = v251 - 2;
          v259 = v253 - 2;
          v260 = v256 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v261 = *(_OWORD *)&v259->var0;
            *(_OWORD *)&v258[-2].var0 = *(_OWORD *)&v259[-2].var0;
            *(_OWORD *)&v258->var0 = v261;
            v258 -= 4;
            v259 -= 4;
            v260 -= 4;
          }
          while (v260);
          v251 -= v256 & 0x3FFFFFFFFFFFFFFCLL;
          if (v256 == (v256 & 0x3FFFFFFFFFFFFFFCLL))
            goto LABEL_341;
        }
        do
        {
          v262 = v257[-1];
          --v257;
          v251[-1] = v262;
          --v251;
        }
        while (v257 != v254);
LABEL_341:
        v253 = retstr->var0;
        goto LABEL_342;
      }
      return result;
    case 3:
      v55 = self;
      v56 = 0;
      while (2)
      {
        -[VKTrafficFeature _originalStyleAttributes](v55, "_originalStyleAttributes");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "attributesCount");

        if (v56 >= v59)
        {
          v97 = retstr->var1;
          v98 = retstr->var2.var0;
          if (v97 < v98)
          {
            if (v97)
            {
              v99 = 0x19C00000006;
LABEL_281:
              *v97 = (GeoCodecsFeatureStylePair)v99;
            }
LABEL_282:
            v155 = v97 + 1;
            goto LABEL_314;
          }
          v121 = v97 - retstr->var0;
          v122 = v121 + 1;
          if ((unint64_t)(v121 + 1) >> 61)
            abort();
          v123 = (char *)v98 - (char *)retstr->var0;
          if (v123 >> 2 > v122)
            v122 = v123 >> 2;
          if ((unint64_t)v123 >= 0x7FFFFFFFFFFFFFF8)
            v124 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v124 = v122;
          if (v124)
          {
            v125 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v124, 4);
            v126 = (GeoCodecsFeatureStylePair *)(v125 + 8 * v121);
            v127 = (GeoCodecsFeatureStylePair *)(v125 + 8 * v124);
            if (v125)
              *v126 = (GeoCodecsFeatureStylePair)0x19C00000006;
          }
          else
          {
            v127 = 0;
            v126 = (GeoCodecsFeatureStylePair *)(8 * v121);
          }
          v155 = v126 + 1;
          v157 = retstr->var0;
          v156 = retstr->var1;
          if (v156 == retstr->var0)
            goto LABEL_312;
          v158 = (char *)v156 - (char *)retstr->var0 - 8;
          if (v158 < 0x38)
          {
            v160 = retstr->var1;
          }
          else if ((unint64_t)((char *)v156 - (char *)v126) < 0x20)
          {
            v160 = retstr->var1;
          }
          else
          {
            v159 = (v158 >> 3) + 1;
            v160 = &v156[-(v159 & 0x3FFFFFFFFFFFFFFCLL)];
            v161 = v126 - 2;
            v162 = v156 - 2;
            v163 = v159 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v164 = *(_OWORD *)&v162->var0;
              *(_OWORD *)&v161[-2].var0 = *(_OWORD *)&v162[-2].var0;
              *(_OWORD *)&v161->var0 = v164;
              v161 -= 4;
              v162 -= 4;
              v163 -= 4;
            }
            while (v163);
            v126 -= v159 & 0x3FFFFFFFFFFFFFFCLL;
            if (v159 == (v159 & 0x3FFFFFFFFFFFFFFCLL))
              goto LABEL_311;
          }
          do
          {
            v239 = v160[-1];
            --v160;
            v126[-1] = v239;
            --v126;
          }
          while (v160 != v157);
          goto LABEL_311;
        }
        -[VKTrafficFeature _originalStyleAttributes](v55, "_originalStyleAttributes");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "attributeAtIndex:", v56);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        v62 = objc_msgSend(v61, "key");
        v63 = objc_msgSend(v61, "value");
        v64 = v63;
        v65 = retstr->var1;
        v66 = retstr->var2.var0;
        if (v65 < v66)
        {
          if (v65)
            *v65 = (GeoCodecsFeatureStylePair)(v62 | (unint64_t)(v63 << 32));
          v57 = v65 + 1;
LABEL_68:
          retstr->var1 = v57;

          ++v56;
          continue;
        }
        break;
      }
      v67 = v65 - retstr->var0;
      v68 = v67 + 1;
      if ((unint64_t)(v67 + 1) >> 61)
        abort();
      v69 = (char *)v66 - (char *)retstr->var0;
      if (v69 >> 2 > v68)
        v68 = v69 >> 2;
      if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF8)
        v70 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v70 = v68;
      if (v70)
      {
        v71 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v70, 4);
        v72 = v71 + 8 * v67;
        v73 = (GeoCodecsFeatureStylePair *)(v71 + 8 * v70);
        if (v71)
          *(_QWORD *)v72 = v62 | (unint64_t)(v64 << 32);
      }
      else
      {
        v73 = 0;
        v72 = 8 * v67;
      }
      v75 = retstr->var0;
      v74 = retstr->var1;
      v76 = (char *)v74 - (char *)retstr->var0;
      if (v74 == retstr->var0)
      {
        v78 = (GeoCodecsFeatureStylePair *)v72;
        goto LABEL_94;
      }
      v77 = v76 - 8;
      if ((unint64_t)(v76 - 8) < 0x38)
      {
        v78 = (GeoCodecsFeatureStylePair *)v72;
      }
      else
      {
        v78 = (GeoCodecsFeatureStylePair *)v72;
        if ((unint64_t)v74 - v72 >= 0x20)
        {
          v79 = (v77 >> 3) + 1;
          v80 = (_OWORD *)(v72 - 16);
          v81 = v74 - 2;
          v82 = v79 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v83 = *(_OWORD *)&v81->var0;
            *(v80 - 1) = *(_OWORD *)&v81[-2].var0;
            *v80 = v83;
            v80 -= 2;
            v81 -= 4;
            v82 -= 4;
          }
          while (v82);
          v78 = (GeoCodecsFeatureStylePair *)(v72 - 8 * (v79 & 0x3FFFFFFFFFFFFFFCLL));
          v74 -= v79 & 0x3FFFFFFFFFFFFFFCLL;
          if (v79 == (v79 & 0x3FFFFFFFFFFFFFFCLL))
            goto LABEL_93;
        }
      }
      do
      {
        v84 = v74[-1];
        --v74;
        v78[-1] = v84;
        --v78;
      }
      while (v74 != v75);
LABEL_93:
      v74 = retstr->var0;
LABEL_94:
      v57 = (GeoCodecsFeatureStylePair *)(v72 + 8);
      retstr->var0 = v78;
      retstr->var1 = (GeoCodecsFeatureStylePair *)(v72 + 8);
      v85 = retstr->var2.var0;
      retstr->var2.var0 = v73;
      if (v74)
        (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0
                                                                                         + 40))(retstr->var2.var1.var0, v74, (char *)v85 - (char *)v74);
      goto LABEL_68;
    case 4:
      v86 = -[VKTrafficFeature type](self, "type");
      v87 = v86;
      if (v86 < 0xF)
        v87 = dword_1A007ECE0[v86];
      v88 = retstr->var1;
      v89 = retstr->var2.var0;
      if (v88 < v89)
      {
        if (v88)
          *v88 = (GeoCodecsFeatureStylePair)((v87 << 32) | 0x10008);
        v90 = v88 + 1;
        goto LABEL_224;
      }
      v107 = v88 - retstr->var0;
      v108 = v107 + 1;
      if ((unint64_t)(v107 + 1) >> 61)
        abort();
      v109 = (char *)v89 - (char *)retstr->var0;
      if (v109 >> 2 > v108)
        v108 = v109 >> 2;
      if ((unint64_t)v109 >= 0x7FFFFFFFFFFFFFF8)
        v110 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v110 = v108;
      if (v110)
      {
        v111 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v110, 4);
        v112 = (GeoCodecsFeatureStylePair *)(v111 + 8 * v107);
        v113 = (GeoCodecsFeatureStylePair *)(v111 + 8 * v110);
        if (v111)
          *v112 = (GeoCodecsFeatureStylePair)((v87 << 32) | 0x10008);
      }
      else
      {
        v113 = 0;
        v112 = (GeoCodecsFeatureStylePair *)(8 * v107);
      }
      v90 = v112 + 1;
      v138 = retstr->var0;
      v137 = retstr->var1;
      if (v137 == retstr->var0)
        goto LABEL_222;
      v139 = (char *)v137 - (char *)retstr->var0 - 8;
      if (v139 < 0x38)
      {
        v141 = retstr->var1;
      }
      else if ((unint64_t)((char *)v137 - (char *)v112) < 0x20)
      {
        v141 = retstr->var1;
      }
      else
      {
        v140 = (v139 >> 3) + 1;
        v141 = &v137[-(v140 & 0x3FFFFFFFFFFFFFFCLL)];
        v142 = v112 - 2;
        v143 = v137 - 2;
        v144 = v140 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v145 = *(_OWORD *)&v143->var0;
          *(_OWORD *)&v142[-2].var0 = *(_OWORD *)&v143[-2].var0;
          *(_OWORD *)&v142->var0 = v145;
          v142 -= 4;
          v143 -= 4;
          v144 -= 4;
        }
        while (v144);
        v112 -= v140 & 0x3FFFFFFFFFFFFFFCLL;
        if (v140 == (v140 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_221:
          v137 = retstr->var0;
LABEL_222:
          retstr->var0 = v112;
          retstr->var1 = v90;
          v190 = retstr->var2.var0;
          retstr->var2.var0 = v113;
          if (v137)
            (*(void (**)(Allocator *, GeoCodecsFeatureStylePair *, int64_t))(*(_QWORD *)retstr->var2.var1.var0
                                                                                             + 40))(retstr->var2.var1.var0, v137, (char *)v190 - (char *)v137);
LABEL_224:
          retstr->var1 = v90;
          v191 = retstr->var2.var0;
          if (v90 < v191)
          {
            *v90 = (GeoCodecsFeatureStylePair)0x30001005BLL;
            v155 = v90 + 1;
LABEL_314:
            retstr->var1 = v155;
            goto LABEL_315;
          }
          v192 = v90 - retstr->var0;
          if ((unint64_t)(v192 + 1) >> 61)
            abort();
          v193 = (char *)v191 - (char *)retstr->var0;
          v194 = v193 >> 2;
          if (v193 >> 2 <= (unint64_t)(v192 + 1))
            v194 = v192 + 1;
          if ((unint64_t)v193 >= 0x7FFFFFFFFFFFFFF8)
            v195 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v195 = v194;
          if (v195)
          {
            v196 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(_QWORD *)retstr->var2.var1.var0 + 16))(retstr->var2.var1.var0, 8 * v195, 4);
            v126 = (GeoCodecsFeatureStylePair *)(v196 + 8 * v192);
            v127 = (GeoCodecsFeatureStylePair *)(v196 + 8 * v195);
            if (v196)
              *v126 = (GeoCodecsFeatureStylePair)0x30001005BLL;
          }
          else
          {
            v127 = 0;
            v126 = (GeoCodecsFeatureStylePair *)(8 * v192);
          }
          v155 = v126 + 1;
          v197 = retstr->var0;
          v156 = retstr->var1;
          if (v156 == retstr->var0)
            goto LABEL_312;
          v198 = (char *)v156 - (char *)retstr->var0 - 8;
          if (v198 < 0x38)
          {
            v200 = retstr->var1;
          }
          else if ((unint64_t)((char *)v156 - (char *)v126) < 0x20)
          {
            v200 = retstr->var1;
          }
          else
          {
            v199 = (v198 >> 3) + 1;
            v200 = &v156[-(v199 & 0x3FFFFFFFFFFFFFFCLL)];
            v201 = v126 - 2;
            v202 = v156 - 2;
            v203 = v199 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v204 = *(_OWORD *)&v202->var0;
              *(_OWORD *)&v201[-2].var0 = *(_OWORD *)&v202[-2].var0;
              *(_OWORD *)&v201->var0 = v204;
              v201 -= 4;
              v202 -= 4;
              v203 -= 4;
            }
            while (v203);
            v126 -= v199 & 0x3FFFFFFFFFFFFFFCLL;
            if (v199 == (v199 & 0x3FFFFFFFFFFFFFFCLL))
              goto LABEL_311;
          }
          do
          {
            v222 = v200[-1];
            --v200;
            v126[-1] = v222;
            --v126;
          }
          while (v200 != v197);
          goto LABEL_311;
        }
      }
      do
      {
        v189 = v141[-1];
        --v141;
        v112[-1] = v189;
        --v112;
      }
      while (v141 != v138);
      goto LABEL_221;
    default:
      goto LABEL_316;
  }
}

- (void)updateNavigationStateForRouteUserOffset:(const PolylineCoordinate *)a3
{
  PolylineCoordinate v5;
  unsigned int index;
  BOOL v7;
  int64_t v8;
  unsigned int v9;

  v5 = -[VKTrafficFeature routeOffset](self, "routeOffset");
  index = a3->index;
  if (a3->index < v5.index || (index == v5.index ? (v7 = a3->offset <= v5.offset) : (v7 = 0), v7))
  {
    v9 = self->_approachingRouteOffset.index;
    if ((v9 != *MEMORY[0x1E0D26A38]
       || vabds_f32(self->_approachingRouteOffset.offset, *(float *)(MEMORY[0x1E0D26A38] + 4)) >= 0.00000011921)
      && (index > v9 || index == v9 && a3->offset > self->_approachingRouteOffset.offset))
    {
      v8 = 2;
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 4;
  }
  self->_state = v8;
}

- (void)populateDebugNode:(void *)a3
{
  NSString *uniqueIdentifier;
  const std::string::value_type *v6;
  int64_t trafficFeatureType;
  id v8;
  const std::string::value_type *v9;
  uint64_t index;
  float offset;
  double v12;
  char *v13;
  double routeOffsetInMeters;
  uint64_t groupIdentifier;
  char *v16;
  uint64_t groupItemVerticalDisplayOrder;
  char *v18;
  uint64_t groupItemHorizontalDisplayOrder;
  uint64_t collisionPriority;
  int64_t state;
  id v22;
  const std::string::value_type *v23;
  double x;
  double y;
  char *v26;
  double latitude;
  double longitude;
  char *v29;
  _BYTE v30[32];
  std::string __p;
  int v32;
  _QWORD v33[7];
  int v34;
  _BYTE v35[8];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  _BYTE v41[8];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  _QWORD v47[7];
  int v48;
  _BYTE v49[16];
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  char *v55;
  char *v56;
  char *v57;
  _BYTE v58[32];
  std::string v59;
  int v60;
  _BYTE v61[32];
  std::string v62;
  int v63;
  char v64[32];

  v64[23] = 9;
  strcpy(v64, "Identifer");
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {
    v6 = -[NSString UTF8String](uniqueIdentifier, "UTF8String");
    memset(&v62, 0, sizeof(v62));
    v63 = 4;
    if (v6)
    {
      std::string::__assign_external(&v62, v6);
    }
    else
    {
      *((_BYTE *)&v62.__r_.__value_.__s + 23) = 6;
      qmemcpy(&v62, "<null>", 6);
    }
  }
  else
  {
    memset(&v62, 0, sizeof(v62));
    v63 = 4;
    std::string::__assign_external(&v62, "");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t)v61);
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v62.__r_.__value_.__l.__data_);
  trafficFeatureType = self->_trafficFeatureType;
  v64[23] = 4;
  strcpy(v64, "Type");
  +[VKTrafficFeature stringForFeatureType:](VKTrafficFeature, "stringForFeatureType:", trafficFeatureType);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const std::string::value_type *)objc_msgSend(v8, "UTF8String");
  memset(&v59, 0, sizeof(v59));
  v60 = 4;
  if (v9)
  {
    std::string::__assign_external(&v59, v9);
  }
  else
  {
    *((_BYTE *)&v59.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v59, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t)v58);
  if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v59.__r_.__value_.__l.__data_);

  index = self->_routeOffset.index;
  offset = self->_routeOffset.offset;
  v64[23] = 11;
  strcpy(v64, "RouteOffset");
  v12 = offset;
  v13 = (char *)operator new(0x80uLL);
  v56 = v13 + 128;
  v57 = v13 + 128;
  *((_QWORD *)v13 + 1) = index;
  *((_QWORD *)v13 + 5) = 0;
  *((_QWORD *)v13 + 6) = 0;
  *((_QWORD *)v13 + 4) = 0;
  *((_DWORD *)v13 + 14) = 1;
  *((double *)v13 + 10) = v12;
  *((_QWORD *)v13 + 12) = 0;
  *((_QWORD *)v13 + 13) = 0;
  *((_QWORD *)v13 + 14) = 0;
  *((_DWORD *)v13 + 30) = 2;
  v55 = v13;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t *)&v55);
  if (v13[119] < 0)
  {
    operator delete(*((void **)v13 + 12));
    if ((v13[55] & 0x80000000) == 0)
      goto LABEL_15;
  }
  else if ((v13[55] & 0x80000000) == 0)
  {
    goto LABEL_15;
  }
  operator delete(*((void **)v13 + 4));
LABEL_15:
  operator delete(v13);
  routeOffsetInMeters = self->_routeOffsetInMeters;
  v64[23] = 19;
  strcpy(v64, "RouteOffsetInMeters");
  v52 = 0;
  v53 = 0;
  v51 = 0;
  v54 = 2;
  v50 = routeOffsetInMeters;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t)v49);
  if (-[VKTrafficFeature isGrouped](self, "isGrouped"))
  {
    v64[23] = 15;
    strcpy(v64, "GroupIdentifier");
    groupIdentifier = self->_groupIdentifier;
    v48 = 0;
    memset(&v47[4], 0, 24);
    v47[0] = groupIdentifier;
    gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t)v47);
    v16 = (char *)operator new(0x20uLL);
    *(_QWORD *)v64 = v16;
    *(_OWORD *)&v64[8] = xmmword_19FFB34A0;
    strcpy(v16, "GroupItemVerticalDisplayOrder");
    groupItemVerticalDisplayOrder = self->_groupItemVerticalDisplayOrder;
    v44 = 0;
    v45 = 0;
    v46 = 1;
    v43 = 0;
    v42 = groupItemVerticalDisplayOrder;
    gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t)v41);
    operator delete(v16);
    v18 = (char *)operator new(0x20uLL);
    *(_QWORD *)v64 = v18;
    *(_OWORD *)&v64[8] = xmmword_19FFB3D50;
    strcpy(v18, "GroupItemHorizontalDisplayOrder");
    groupItemHorizontalDisplayOrder = self->_groupItemHorizontalDisplayOrder;
    v38 = 0;
    v39 = 0;
    v40 = 1;
    v37 = 0;
    v36 = groupItemHorizontalDisplayOrder;
    gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t)v35);
    operator delete(v18);
  }
  v64[23] = 17;
  strcpy(v64, "CollisionPriority");
  collisionPriority = self->_collisionPriority;
  v34 = 0;
  memset(&v33[4], 0, 24);
  v33[0] = collisionPriority;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t)v33);
  state = self->_state;
  v64[23] = 15;
  strcpy(v64, "NavigationState");
  +[VKTrafficFeature stringForNavState:](VKTrafficFeature, "stringForNavState:", state);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = (const std::string::value_type *)objc_msgSend(v22, "UTF8String");
  memset(&__p, 0, sizeof(__p));
  v32 = 4;
  if (v23)
  {
    std::string::__assign_external(&__p, v23);
  }
  else
  {
    *((_BYTE *)&__p.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&__p, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t)v30);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  x = self->_worldPoint.x;
  y = self->_worldPoint.y;
  v64[23] = 13;
  strcpy(v64, "WorldPosition");
  v56 = 0;
  v26 = (char *)operator new(0x80uLL);
  v56 = v26 + 128;
  v57 = v26 + 128;
  *((double *)v26 + 2) = x;
  *((_QWORD *)v26 + 5) = 0;
  *((_QWORD *)v26 + 6) = 0;
  *((_QWORD *)v26 + 4) = 0;
  *((_DWORD *)v26 + 14) = 2;
  *((_QWORD *)v26 + 12) = 0;
  *((double *)v26 + 10) = y;
  *((_QWORD *)v26 + 13) = 0;
  *((_QWORD *)v26 + 14) = 0;
  *((_DWORD *)v26 + 30) = 2;
  v55 = v26;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t *)&v55);
  if (v26[119] < 0)
  {
    operator delete(*((void **)v26 + 12));
    if ((v26[55] & 0x80000000) == 0)
      goto LABEL_26;
  }
  else if ((v26[55] & 0x80000000) == 0)
  {
    goto LABEL_26;
  }
  operator delete(*((void **)v26 + 4));
LABEL_26:
  operator delete(v26);
  latitude = self->_position.latitude;
  longitude = self->_position.longitude;
  v64[23] = 14;
  strcpy(v64, "LatLngPosition");
  v29 = (char *)operator new(0x80uLL);
  v56 = v29 + 128;
  v57 = v29 + 128;
  *((double *)v29 + 2) = latitude;
  *((_QWORD *)v29 + 5) = 0;
  *((_QWORD *)v29 + 6) = 0;
  *((_QWORD *)v29 + 4) = 0;
  *((_DWORD *)v29 + 14) = 2;
  *((_QWORD *)v29 + 12) = 0;
  *((double *)v29 + 10) = longitude;
  *((_QWORD *)v29 + 13) = 0;
  *((_QWORD *)v29 + 14) = 0;
  *((_DWORD *)v29 + 30) = 2;
  v55 = v29;
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v64, (uint64_t *)&v55);
  if (v29[119] < 0)
  {
    operator delete(*((void **)v29 + 12));
    if ((v29[55] & 0x80000000) == 0)
      goto LABEL_28;
LABEL_32:
    operator delete(*((void **)v29 + 4));
    goto LABEL_28;
  }
  if (v29[55] < 0)
    goto LABEL_32;
LABEL_28:
  operator delete(v29);
}

- (PolylineCoordinate)routeOffset
{
  return self->_routeOffset;
}

- (float)minZoom
{
  return self->_minZoom;
}

- (float)maxZoom
{
  return self->_maxZoom;
}

- ($1AB5FA073B851C12C2339EC22442E995)position
{
  double latitude;
  double longitude;
  double altitude;
  $1AB5FA073B851C12C2339EC22442E995 result;

  latitude = self->_position.latitude;
  longitude = self->_position.longitude;
  altitude = self->_position.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (int64_t)trafficFeatureType
{
  return self->_trafficFeatureType;
}

- (int64_t)navigationState
{
  return self->_state;
}

- (void)setNavigationState:(int64_t)a3
{
  self->_state = a3;
}

- (PolylineCoordinate)approachingRouteOffset
{
  return self->_approachingRouteOffset;
}

- (unsigned)collisionPriority
{
  return self->_collisionPriority;
}

- (int)groupIdentifier
{
  return self->_groupIdentifier;
}

- (unsigned)groupItemVerticalDisplayOrder
{
  return self->_groupItemVerticalDisplayOrder;
}

- (unsigned)groupItemHorizontalDisplayOrder
{
  return self->_groupItemHorizontalDisplayOrder;
}

- (BOOL)shouldUpdateStyle
{
  return self->_shouldUpdateStyle;
}

- (void)setShouldUpdateStyle:(BOOL)a3
{
  self->_shouldUpdateStyle = a3;
}

- (double)routeOffsetInMeters
{
  return self->_routeOffsetInMeters;
}

- (optional<gss::RouteLegWhen>)routeLegWhen
{
  _BYTE *v2;
  optional<gss::RouteLegWhen> result;

  *v2 = 0;
  if (*(&self->_shouldUpdateStyle + 1))
  {
    v2[1] = *(&self->_shouldUpdateStyle + 2);
    *v2 = 1;
  }
  result._value = (ValueUnion)a2;
  result._hasValue = (char)self;
  return result;
}

- (void)setRouteLegWhen:(optional<gss::RouteLegWhen>)a3
{
  int v3;

  v3 = *((unsigned __int8 *)&self->_shouldUpdateStyle + 1);
  if (**(_BYTE **)&a3._hasValue)
  {
    *(&self->_shouldUpdateStyle + 2) = *(_BYTE *)(*(_QWORD *)&a3._hasValue + 1);
    if (!v3)
      *(&self->_shouldUpdateStyle + 1) = 1;
  }
  else if (*(&self->_shouldUpdateStyle + 1))
  {
    *(&self->_shouldUpdateStyle + 1) = 0;
  }
}

- (double)facingAzimuth
{
  return self->_facingAzimuth;
}

- (void).cxx_destruct
{
  if (*(&self->_shouldUpdateStyle + 1))
    *(&self->_shouldUpdateStyle + 1) = 0;
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 12) = 0xBF80000000000000;
  *((_QWORD *)self + 13) = 0xBF80000000000000;
  *((_BYTE *)self + 153) = 0;
  return self;
}

+ (id)newTrafficFeatureForEnrouteNotice:(id)a3 onRoute:(id)a4
{
  id v5;
  id v6;
  void *v7;
  VKTrafficCameraFeature *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  VKTrafficSignalFeature *v12;
  void *v13;
  VKRouteAnnotation *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "trafficCamera");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = [VKTrafficCameraFeature alloc];
    objc_msgSend(v5, "trafficCamera");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[VKTrafficCameraFeature initWithTrafficCamera:onRoute:](v8, "initWithTrafficCamera:onRoute:", v9, v6);
  }
  else
  {
    objc_msgSend(v5, "trafficSignal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = [VKTrafficSignalFeature alloc];
      objc_msgSend(v5, "trafficSignal");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[VKTrafficSignalFeature initWithTrafficSignal:onRoute:](v12, "initWithTrafficSignal:onRoute:", v9, v6);
    }
    else
    {
      objc_msgSend(v5, "routeAnnotation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        v15 = 0;
        goto LABEL_8;
      }
      v14 = [VKRouteAnnotation alloc];
      objc_msgSend(v5, "routeAnnotation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[VKRouteAnnotation initWithRouteAnnotation:onRoute:](v14, "initWithRouteAnnotation:onRoute:", v9, v6);
    }
  }
  v15 = (void *)v10;

LABEL_8:
  return v15;
}

+ (id)stringForFeatureType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return (id)*((_QWORD *)&off_1E42F92A8 + a3);
}

+ (id)stringForNavState:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return (id)*((_QWORD *)&off_1E42F92D0 + a3);
}

@end
