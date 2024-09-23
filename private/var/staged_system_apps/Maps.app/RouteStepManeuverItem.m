@implementation RouteStepManeuverItem

- (RouteStepManeuverItem)initWithRouteStep:(id)a3 cellClass:(Class)a4 state:(unint64_t)a5 metrics:(id)a6 context:(int64_t)a7 route:(id)a8 scale:(double)a9 isMissedStep:(BOOL)a10
{
  id v18;
  id v19;
  RouteStepManeuverItem *v20;
  RouteStepManeuverItem *v21;
  objc_super v23;

  v18 = a3;
  v19 = a6;
  v23.receiver = self;
  v23.super_class = (Class)RouteStepManeuverItem;
  v20 = -[RouteStepItem initWithCellClass:state:metrics:context:route:scale:](&v23, "initWithCellClass:state:metrics:context:route:scale:", a4, a5, v19, a7, a8, a9);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_step, a3);
    v21->_isMissedStep = a10;
    objc_msgSend(v19, "imageAreaWidth");
    -[RouteStepItem setHairlineLeadingInset:](v21, "setHairlineLeadingInset:");
    objc_msgSend(v19, "textTrailingMargin");
    -[RouteStepItem setHairlineTrailingInset:](v21, "setHairlineTrailingInset:");
  }

  return v21;
}

- (void)reset
{
  self->_computedContent = 0;
}

- (NSAttributedString)primaryText
{
  if (!self->_computedContent)
    -[RouteStepManeuverItem _computeContent](self, "_computeContent");
  return self->_primaryText;
}

- (NSAttributedString)secondaryText
{
  if (!self->_computedContent)
    -[RouteStepManeuverItem _computeContent](self, "_computeContent");
  return self->_secondaryText;
}

- (NSAttributedString)tertiaryText
{
  if (!self->_computedContent)
    -[RouteStepManeuverItem _computeContent](self, "_computeContent");
  return self->_tertiaryText;
}

- (UIImage)shieldImage
{
  if (!self->_computedContent)
    -[RouteStepManeuverItem _computeContent](self, "_computeContent");
  return self->_shieldImage;
}

- (GuidanceManeuverArtwork)maneuverArtwork
{
  if (!self->_computedContent)
    -[RouteStepManeuverItem _computeContent](self, "_computeContent");
  return self->_maneuverArtwork;
}

- (UIColor)backgroundColor
{
  if (!self->_computedContent)
    -[RouteStepManeuverItem _computeContent](self, "_computeContent");
  return self->_backgroundColor;
}

- (UIImage)exitSignImage
{
  if (!self->_computedContent)
    -[RouteStepManeuverItem _computeContent](self, "_computeContent");
  return self->_exitSignImage;
}

- (MNGuidanceSignInfo)guidanceSignInfo
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem userInfo](self, "userInfo"));
  v4 = objc_opt_class(MNGuidanceSignInfo);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem userInfo](self, "userInfo"));
  else
    v5 = 0;

  return (MNGuidanceSignInfo *)v5;
}

- (id)laneGuidanceInfo
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem userInfo](self, "userInfo"));
  v4 = objc_opt_class(MNGuidanceLaneInfo);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem userInfo](self, "userInfo"));
  else
    v5 = 0;

  return v5;
}

- (id)distanceToManeuver
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem userInfo](self, "userInfo"));
  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem userInfo](self, "userInfo"));
  else
    v5 = 0;

  return v5;
}

- (void)_computeContent
{
  RouteStepManeuverItem *v2;
  NSAttributedString *primaryText;
  NSAttributedString *secondaryText;
  void *v5;
  RouteStepManeuverItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  BOOL v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  BOOL v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  void *v65;
  unsigned int v66;
  void *v67;
  void *v68;
  unsigned int v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  unsigned int v74;
  id *v75;
  void *v76;
  BOOL v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  BOOL v84;
  id v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  id v98;
  id v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  id v107;
  void *v108;
  void *v109;
  BOOL v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  id v117;
  id v118;
  _BOOL4 v119;
  uint64_t v120;
  void *v121;
  unsigned int v122;
  void *v123;
  void *v124;
  unsigned int v125;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  id *v133;
  NSAttributedString *tertiaryText;
  void *v135;
  unsigned int v136;
  void *v137;
  void *v138;
  double v139;
  double v140;
  void *v141;
  double v142;
  void *v143;
  double v144;
  double v145;
  void *v146;
  _BOOL4 v147;
  void *v148;
  id v149;
  void *v150;
  id v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  void *v163;
  id v164;
  id v165;
  void *v166;
  void *v167;
  id v168;
  void *v169;
  id v170;
  void *v171;
  id v172;
  id v173;
  id v174;
  uint64_t v175;
  id v176;
  uint64_t v177;
  void *i;
  void *v179;
  id v180;
  id v181;
  void *v182;
  id v183;
  id v184;
  uint64_t v185;
  void *v186;
  uint64_t v187;
  void *v188;
  void *v189;
  void *v190;
  UIImage *shieldImage;
  void *v192;
  id v193;
  uint64_t v194;
  UIImage *v195;
  void *v196;
  void *v197;
  uint64_t v198;
  uint64_t v199;
  double v200;
  double v201;
  void *v202;
  id v203;
  double v204;
  id v205;
  float v206;
  uint64_t v207;
  UIImage *v208;
  GuidanceManeuverArtwork *maneuverArtwork;
  void *v210;
  void *v211;
  id v212;
  GuidanceManeuverArtwork *v213;
  id v214;
  void *v215;
  GuidanceManeuverArtwork *v216;
  GuidanceManeuverArtwork *v217;
  RouteStepManeuverItem *v218;
  void *v219;
  id v220;
  void *v221;
  id v222;
  GuidanceManeuverArtwork *v223;
  id v224;
  void *v225;
  GuidanceManeuverArtwork *v226;
  GuidanceManeuverArtwork *v227;
  uint64_t v228;
  UIColor *backgroundColor;
  id v230;
  UIImage *exitSignImage;
  void *v232;
  id v233;
  void *v234;
  void *v235;
  double v236;
  double v237;
  void *v238;
  void *v239;
  double v240;
  double v241;
  void *v242;
  id v243;
  double v244;
  void *v245;
  id v246;
  void *v247;
  double v248;
  double v249;
  void *v250;
  id v251;
  void *v252;
  double v253;
  double v254;
  void *v255;
  id v256;
  double v257;
  uint64_t v258;
  UIImage *v259;
  void *v260;
  uint64_t v261;
  UIImage *v262;
  uint64_t v263;
  id v264;
  uint64_t v265;
  id v266;
  uint64_t v267;
  id v268;
  void *v269;
  void *v270;
  void *v271;
  _QWORD *v272;
  void *v273;
  id v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  id v279;
  id *p_secondaryText;
  id *location;
  id v282;
  void *v283;
  id *p_primaryText;
  void *v285;
  id obj;
  id obja;
  RouteStepManeuverItem *v288;
  void *v289;
  id v290;
  _QWORD v291[6];
  uint64_t v292;
  uint64_t *v293;
  uint64_t v294;
  uint64_t (*v295)(uint64_t, uint64_t);
  void (*v296)(uint64_t);
  id v297;
  uint64_t v298;
  uint64_t *v299;
  uint64_t v300;
  int v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  _QWORD v306[4];
  _QWORD v307[4];
  id v308;
  RouteStepManeuverItem *v309;
  char v310;
  NSAttributedStringKey v311;
  void *v312;
  NSAttributedStringKey v313;
  uint64_t v314;
  _BYTE v315[128];
  _QWORD v316[2];
  _QWORD v317[2];
  _QWORD v318[3];
  _QWORD v319[3];
  _QWORD v320[2];
  _QWORD v321[2];
  _QWORD v322[3];
  _QWORD v323[3];
  _QWORD v324[3];
  _QWORD v325[3];
  _QWORD v326[3];
  _QWORD v327[3];

  v2 = self;
  self->_computedContent = 1;
  primaryText = self->_primaryText;
  p_primaryText = (id *)&self->_primaryText;
  self->_primaryText = 0;

  secondaryText = v2->_secondaryText;
  p_secondaryText = (id *)&v2->_secondaryText;
  v2->_secondaryText = 0;

  v288 = v2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem step](v2, "step"));
  v276 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "geoStep"));
  v270 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v276, "roadDescriptions"));
  v271 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chargingStationInfo"));
  v6 = v2;
  LODWORD(v2) = -[RouteStepItem state](v2, "state") == 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v6, "metrics"));
  v8 = v7;
  if ((_DWORD)v2)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "primaryTextDisabledTextColor"));
  else
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "primaryTextActiveTextColor"));
  v279 = v9;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
  v11 = objc_msgSend(v10, "primaryTextFontIsFixedSize");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "primaryTextFontSize");
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
    objc_msgSend(v16, "primaryTextFontWeight");
    v278 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v15, v17));
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "primaryTextFontStyle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
    objc_msgSend(v18, "primaryTextFontWeight");
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem traitCollection](v288, "traitCollection"));
    v278 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", v16, v21, v20));

  }
  v22 = -[RouteStepItem state](v288, "state") == 0;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
  v24 = v23;
  if (v22)
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "secondaryTextDisabledTextColor"));
  else
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "secondaryTextActiveTextColor"));
  v274 = v25;

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
  v27 = objc_msgSend(v26, "secondaryTextFontIsFixedSize");

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
  v29 = v28;
  if (v27)
  {
    objc_msgSend(v28, "secondaryTextFontSize");
    v31 = v30;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
    objc_msgSend(v32, "secondaryTextFontWeight");
    v273 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v31, v33));
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "secondaryTextFontStyle"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
    objc_msgSend(v34, "secondaryTextFontWeight");
    v36 = v35;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem traitCollection](v288, "traitCollection"));
    v273 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", v32, v37, v36));

  }
  v285 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem guidanceSignInfo](v288, "guidanceSignInfo"));
  v283 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem laneGuidanceInfo](v288, "laneGuidanceInfo"));
  v269 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem distanceToManeuver](v288, "distanceToManeuver"));
  if ((objc_msgSend(v5, "isStartOrResumeStep") & 1) != 0)
  {
    v38 = 1;
  }
  else
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v285, "primarySign"));
    v38 = objc_msgSend(v39, "isStaticText");

  }
  v307[0] = _NSConcreteStackBlock;
  v307[1] = 3221225472;
  v307[2] = sub_100893340;
  v307[3] = &unk_1011DA020;
  v282 = v5;
  v308 = v282;
  v309 = v288;
  v310 = v38;
  v272 = objc_retainBlock(v307);
  if (v283)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v283, "primaryStrings"));
    v41 = objc_msgSend(v40, "count") == 0;

    if (v41)
    {
      v54 = objc_alloc((Class)MKServerFormattedStringParameters);
      v55 = objc_msgSend(v283, "distanceDetailLevel");
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v283, "variableOverrides"));
      v43 = objc_msgSend(v54, "initWithInstructionsDistanceDetailLevel:variableOverrides:", v55, v56);

      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v283, "titles"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "firstObject"));

      v45 = objc_msgSend(objc_alloc((Class)MKServerFormattedString), "initWithGeoServerString:parameters:", v44, v43);
    }
    else
    {
      v42 = objc_alloc((Class)MKServerFormattedString);
      v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v283, "primaryStrings"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "firstObject"));
      v45 = objc_msgSend(v42, "initWithComposedString:", v44);
    }
    v58 = v45;

    v326[0] = NSForegroundColorAttributeName;
    v326[1] = NSFontAttributeName;
    v327[0] = v279;
    v327[1] = v278;
    v326[2] = MKServerFormattedStringArtworkSizeAttributeKey;
    v327[2] = &off_10126FA60;
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v327, v326, 3));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "multiPartAttributedStringWithAttributes:", v59));
    v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "attributedString"));
    v62 = *p_primaryText;
    *p_primaryText = (id)v61;

    if (objc_msgSend(*p_primaryText, "length"))
    {
      v275 = 0;
    }
    else
    {
      v63 = ((uint64_t (*)(_QWORD *, _QWORD))v272[2])(v272, 0);
      v275 = (void *)objc_claimAutoreleasedReturnValue(v63);
    }

  }
  else if (v285)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v285, "primarySign"));
    v47 = v46;
    if (v38)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "secondaryStrings"));
      v49 = objc_msgSend(v48, "count") == 0;

      if (v49)
      {
        v90 = objc_alloc((Class)MKServerFormattedStringParameters);
        v91 = objc_msgSend(v47, "distanceDetailLevel");
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "variableOverrides"));
        v51 = objc_msgSend(v90, "initWithInstructionsDistanceDetailLevel:variableOverrides:", v91, v92);

        v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "details"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "firstObject"));

        v53 = objc_msgSend(objc_alloc((Class)MKServerFormattedString), "initWithGeoServerString:parameters:", v52, v51);
      }
      else
      {
        v50 = objc_alloc((Class)MKServerFormattedString);
        v51 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "secondaryStrings"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "firstObject"));
        v53 = objc_msgSend(v50, "initWithComposedString:", v52);
      }
      v94 = v53;

      v324[0] = NSForegroundColorAttributeName;
      v324[1] = NSFontAttributeName;
      v325[0] = v279;
      v325[1] = v278;
      v324[2] = MKServerFormattedStringArtworkSizeAttributeKey;
      v325[2] = &off_10126FA60;
      v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v325, v324, 3));
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "multiPartAttributedStringWithAttributes:", v95));
      v97 = objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "attributedString"));
      v98 = *p_primaryText;
      *p_primaryText = (id)v97;

      if (objc_msgSend(*p_primaryText, "length"))
      {
        v275 = 0;
        goto LABEL_80;
      }
    }
    else
    {
      v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "primaryStrings"));
      v84 = objc_msgSend(v83, "count") == 0;

      if (v84)
      {
        v99 = objc_alloc((Class)MKServerFormattedStringParameters);
        v100 = objc_msgSend(v47, "distanceDetailLevel");
        v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "variableOverrides"));
        v86 = objc_msgSend(v99, "initWithInstructionsDistanceDetailLevel:variableOverrides:", v100, v101);

        v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "titles"));
        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "firstObject"));

        v88 = objc_msgSend(objc_alloc((Class)MKServerFormattedString), "initWithGeoServerString:parameters:", v87, v86);
      }
      else
      {
        v85 = objc_alloc((Class)MKServerFormattedString);
        v86 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "primaryStrings"));
        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "firstObject"));
        v88 = objc_msgSend(v85, "initWithComposedString:", v87);
      }
      v103 = v88;

      v322[0] = NSForegroundColorAttributeName;
      v322[1] = NSFontAttributeName;
      v323[0] = v279;
      v323[1] = v278;
      v322[2] = MKServerFormattedStringArtworkSizeAttributeKey;
      v323[2] = &off_10126FA60;
      v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v323, v322, 3));
      v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "multiPartAttributedStringWithAttributes:", v104));
      v106 = objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "attributedString"));
      v107 = *p_primaryText;
      *p_primaryText = (id)v106;

      if (objc_msgSend(*p_primaryText, "length"))
      {
        v275 = 0;
        v80 = v285;
        goto LABEL_55;
      }
    }
    v114 = ((uint64_t (*)(_QWORD *, _QWORD))v272[2])(v272, 0);
    v275 = (void *)objc_claimAutoreleasedReturnValue(v114);
  }
  else
  {
    v82 = ((uint64_t (*)(void))v272[2])();
    v275 = (void *)objc_claimAutoreleasedReturnValue(v82);
  }
  if (v275)
  {
    v64 = objc_alloc((Class)NSAttributedString);
    v320[0] = NSFontAttributeName;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
    v66 = objc_msgSend(v65, "shouldFlipPrimaryAndSecondaryText");
    v67 = v278;
    if (v66)
      v67 = v273;
    v321[0] = v67;
    v320[1] = NSForegroundColorAttributeName;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
    v69 = objc_msgSend(v68, "shouldFlipPrimaryAndSecondaryText");
    v70 = v279;
    if (v69)
      v70 = v274;
    v321[1] = v70;
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v321, v320, 2));
    v72 = objc_msgSend(v64, "initWithString:attributes:", v275, v71);

    v73 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
    v74 = objc_msgSend(v73, "shouldFlipPrimaryAndSecondaryText");

    if (v74)
      v75 = p_secondaryText;
    else
      v75 = p_primaryText;
    objc_storeStrong(v75, v72);

  }
  if ((v38 & 1) == 0)
  {
    if (v283)
    {
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v283, "secondaryStrings"));
      v77 = objc_msgSend(v76, "count") == 0;

      if (!v77)
      {
        v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v283, "secondaryStrings"));
        v79 = objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "firstObject"));

LABEL_57:
        v289 = 0;
        v81 = 0;
        goto LABEL_61;
      }
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v283, "instructions"));
      v81 = objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "firstObject"));

      v289 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v283, "variableOverrides"));
      goto LABEL_60;
    }
    v80 = v285;
    if (!v285)
    {
      if ((id)-[RouteStepItem context](v288, "context") == (id)1)
      {
        v79 = objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem _signInstructionStringForStep:](v288, "_signInstructionStringForStep:", v282));
        if (!v79)
        {
          v81 = objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem _signInstructionForStep:](v288, "_signInstructionForStep:", v282));
          v289 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem _instructionVariables](v288, "_instructionVariables"));
          goto LABEL_60;
        }
LABEL_69:
        v289 = 0;
        goto LABEL_70;
      }
      v119 = (id)-[RouteStepItem context](v288, "context") == (id)2;
      v120 = objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem _listInstructionStringForStep:](v288, "_listInstructionStringForStep:", v282));
      v79 = v120;
      if (v119)
      {
        if (v120)
          goto LABEL_69;
      }
      else if (v120)
      {
        goto LABEL_69;
      }
      v81 = objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem _listInstructionForStep:](v288, "_listInstructionForStep:", v282));
      v289 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem _instructionVariables](v288, "_instructionVariables"));
      goto LABEL_60;
    }
LABEL_55:
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "primarySign"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "secondaryStrings"));
    v110 = objc_msgSend(v109, "count") == 0;

    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v285, "primarySign"));
    v112 = v111;
    if (!v110)
    {
      v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "secondaryStrings"));
      v79 = objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "firstObject"));

      goto LABEL_57;
    }
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "details"));
    v81 = objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "firstObject"));

    v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v285, "primarySign"));
    v289 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "variableOverrides"));

LABEL_60:
    v79 = 0;
LABEL_61:
    if (!(v81 | v79))
    {
      v81 = 0;
LABEL_79:

      goto LABEL_80;
    }
    if (v81)
    {
      v117 = objc_alloc((Class)MKServerFormattedStringParameters);
      MKFormattedStringOptionsMakeDefault(v306);
      v118 = objc_msgSend(v117, "initWithOptions:variableOverrides:", v306, v289);
      obj = objc_msgSend(objc_alloc((Class)MKServerFormattedString), "initWithGeoServerString:parameters:", v81, v118);

LABEL_71:
      v318[0] = NSFontAttributeName;
      v121 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
      v122 = objc_msgSend(v121, "shouldFlipPrimaryAndSecondaryText");
      v123 = v278;
      if (!v122)
        v123 = v273;
      v319[0] = v123;
      v318[1] = NSForegroundColorAttributeName;
      v124 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
      v125 = objc_msgSend(v124, "shouldFlipPrimaryAndSecondaryText");
      v126 = v279;
      if (!v125)
        v126 = v274;
      v319[1] = v126;
      v318[2] = MKServerFormattedStringArtworkSizeAttributeKey;
      v127 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
      v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v127, "shieldArtworkSize")));
      v319[2] = v128;
      v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v319, v318, 3));
      v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "multiPartAttributedStringWithAttributes:", v129));
      v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "attributedString"));

      v132 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
      LODWORD(v129) = objc_msgSend(v132, "shouldFlipPrimaryAndSecondaryText");

      if ((_DWORD)v129)
        v133 = p_primaryText;
      else
        v133 = p_secondaryText;
      objc_storeStrong(v133, v131);

      goto LABEL_79;
    }
LABEL_70:
    obj = objc_msgSend(objc_alloc((Class)MKServerFormattedString), "initWithComposedString:", v79);
    v81 = 0;
    goto LABEL_71;
  }
LABEL_80:
  tertiaryText = v288->_tertiaryText;
  location = (id *)&v288->_tertiaryText;
  v288->_tertiaryText = 0;

  v135 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
  v136 = objc_msgSend(v135, "tertiaryTextFontIsFixedSize");

  v137 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
  v138 = v137;
  if (v136)
  {
    objc_msgSend(v137, "tertiaryTextFontSize");
    v140 = v139;
    v141 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
    objc_msgSend(v141, "tertiaryTextFontWeight");
    v277 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", v140, v142));
  }
  else
  {
    v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "tertiaryTextFontStyle"));
    v143 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
    objc_msgSend(v143, "tertiaryTextFontWeight");
    v145 = v144;
    v146 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem traitCollection](v288, "traitCollection"));
    v277 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", v141, v146, v145));

  }
  v147 = -[RouteStepItem state](v288, "state") == 0;
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
  v149 = v148;
  if (v147)
    v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "tertiaryTextDisabledTextColor"));
  else
    v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "tertiaryTextActiveTextColor"));
  v290 = v150;

  if (v288->_isMissedStep)
  {
    v151 = objc_alloc_init((Class)NSTextAttachment);
    v152 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem traitCollection](v288, "traitCollection"));
    v153 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", CFSTR("exclamationmark.circle.fill"), v152));
    v154 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemYellowColor](UIColor, "systemYellowColor"));
    v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "imageWithTintColor:", v154));

    objc_msgSend(v277, "capHeight");
    v157 = v156;
    objc_msgSend(v155, "size");
    v159 = v158;
    objc_msgSend(v155, "size");
    v161 = v160;
    objc_msgSend(v155, "size");
    objc_msgSend(v151, "setBounds:", 0.0, (v157 - v159) * 0.5, v161, v162);
    objc_msgSend(v151, "setImage:", v155);
    v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v151));
    v164 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", v163);
    v165 = objc_alloc((Class)NSAttributedString);
    v166 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "localizedStringForKey:value:table:", CFSTR("[Directions] unbreakable space"), CFSTR("localized string not found"), 0));
    v168 = objc_msgSend(v165, "initWithString:", v167);

    objc_msgSend(v164, "appendAttributedString:", v168);
    v169 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v149 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v169, "localizedStringForKey:value:table:", CFSTR("[Directions] missed step description"), CFSTR("localized string not found"), 0));

    v170 = objc_alloc((Class)NSAttributedString);
    v316[0] = NSFontAttributeName;
    v316[1] = NSForegroundColorAttributeName;
    v317[0] = v277;
    v317[1] = v290;
    v171 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v317, v316, 2));
    v172 = objc_msgSend(v170, "initWithString:attributes:", v149, v171);

    objc_msgSend(v164, "appendAttributedString:", v172);
    v173 = objc_msgSend(v164, "copy");
    v174 = *location;
    *location = v173;

  }
  else if (v271)
  {
    v175 = objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem _combinedTertiaryTextForStepWithChargingStation:font:color:](v288, "_combinedTertiaryTextForStepWithChargingStation:font:color:", v282, v277, v290));
    v151 = *location;
    *location = (id)v175;
  }
  else
  {
    if (!objc_msgSend(v270, "count"))
      goto LABEL_106;
    if (qword_1014D3798 != -1)
      dispatch_once(&qword_1014D3798, &stru_1011DA040);
    v151 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", &stru_1011EB268, 0);
    v304 = 0u;
    v305 = 0u;
    v302 = 0u;
    v303 = 0u;
    obja = v270;
    v176 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v302, v315, 16);
    if (v176)
    {
      v177 = *(_QWORD *)v303;
      do
      {
        for (i = 0; i != v176; i = (char *)i + 1)
        {
          if (*(_QWORD *)v303 != v177)
            objc_enumerationMutation(obja);
          v179 = *(void **)(*((_QWORD *)&v302 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v151, "length"))
            objc_msgSend(v151, "appendAttributedString:", qword_1014D37A0);
          v180 = objc_alloc((Class)MKServerFormattedString);
          v181 = objc_alloc((Class)GEOComposedString);
          v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "formattedDescription"));
          v183 = objc_msgSend(v181, "initWithGeoFormattedString:", v182);
          v184 = objc_msgSend(v180, "initWithComposedString:", v183);

          v313 = NSForegroundColorAttributeName;
          v185 = objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "accentColor"));
          v186 = (void *)v185;
          v187 = (uint64_t)v290;
          if (v185)
            v187 = v185;
          v314 = v187;
          v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v314, &v313, 1));
          v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "multiPartAttributedStringWithAttributes:", v188));
          v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v189, "attributedString"));
          objc_msgSend(v151, "appendAttributedString:", v190);

        }
        v176 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v302, v315, 16);
      }
      while (v176);
    }

    v311 = NSFontAttributeName;
    v312 = v277;
    v149 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v312, &v311, 1));
    objc_msgSend(v151, "addAttributes:range:", v149, 0, objc_msgSend(v151, "length"));

    objc_storeStrong(location, v151);
  }

LABEL_106:
  shieldImage = v288->_shieldImage;
  v288->_shieldImage = 0;

  if (objc_msgSend(v282, "isEVChargerStep"))
  {
    v149 = (id)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes evChargerStyleAttributes](GEOFeatureStyleAttributes, "evChargerStyleAttributes"));
    v192 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
    v193 = objc_msgSend(v192, "iconSize");
    -[RouteStepItem scale](v288, "scale");
    v194 = objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v149, v193, 0));
    v195 = v288->_shieldImage;
    v288->_shieldImage = (UIImage *)v194;

  }
  else if ((id)-[RouteStepItem context](v288, "context") != (id)1
         && (objc_msgSend(v276, "maneuverType") == 12
          || objc_msgSend(v276, "maneuverIsHighwayExit")))
  {
    v298 = 0;
    v299 = &v298;
    v300 = 0x2020000000;
    v301 = 0;
    v292 = 0;
    v293 = &v292;
    v294 = 0x3032000000;
    v295 = sub_1008934E8;
    v296 = sub_1008934F8;
    v297 = 0;
    v291[0] = _NSConcreteStackBlock;
    v291[1] = 3221225472;
    v291[2] = sub_100893500;
    v291[3] = &unk_1011B10F8;
    v291[4] = &v298;
    v291[5] = &v292;
    objc_msgSend(v276, "shieldInfo:", v291);
    if (*((_DWORD *)v299 + 6))
    {
      v196 = (void *)objc_opt_new(VKIconModifiers);
      objc_msgSend(v196, "setText:", v293[5]);
      v197 = (void *)objc_claimAutoreleasedReturnValue(+[VKIconManager sharedManager](VKIconManager, "sharedManager"));
      v198 = *((unsigned int *)v299 + 6);
      v199 = v293[5];
      -[RouteStepItem scale](v288, "scale");
      v201 = v200;
      v202 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
      v203 = objc_msgSend(v202, "shieldArtworkSize");
      *(float *)&v204 = v201;
      v149 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v197, "imageForDataID:text:contentScale:sizeGroup:modifiers:", v198, v199, v203, v196, v204));

      v205 = objc_msgSend(v149, "image");
      objc_msgSend(v149, "contentScale");
      v207 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v205, 0, v206));
      v208 = v288->_shieldImage;
      v288->_shieldImage = (UIImage *)v207;

    }
    _Block_object_dispose(&v292, 8);

    _Block_object_dispose(&v298, 8);
  }
  maneuverArtwork = v288->_maneuverArtwork;
  v288->_maneuverArtwork = 0;

  if (v285)
  {
    v210 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v285, "primarySign"));
    v211 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v210, "junction"));
    v149 = objc_msgSend(v211, "drivingSide");
    if (objc_msgSend(v211, "numElements"))
      v212 = objc_msgSend(objc_alloc((Class)MKJunction), "initWithJunction:", v211);
    else
      v212 = 0;
    v213 = [GuidanceManeuverArtwork alloc];
    v214 = objc_msgSend(v211, "maneuverType");
    v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v210, "artworkOverride"));
    v216 = -[GuidanceManeuverArtwork initWithManeuver:junction:drivingSide:artworkDataSource:](v213, "initWithManeuver:junction:drivingSide:artworkDataSource:", v214, v212, v149, v215);
    v217 = v288->_maneuverArtwork;
    v288->_maneuverArtwork = v216;

  }
  v218 = v288;
  if (!v288->_shieldImage && !v288->_maneuverArtwork)
  {
    v219 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v282, "junction"));
    if (v219)
    {
      v220 = objc_alloc((Class)MKJunction);
      v221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v282, "junction"));
      v149 = objc_msgSend(v220, "initWithJunction:", v221);

    }
    else
    {
      v149 = 0;
    }

    v222 = objc_msgSend(v282, "drivingSide");
    v223 = [GuidanceManeuverArtwork alloc];
    v224 = objc_msgSend(v282, "maneuverType");
    v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v282, "artworkOverride"));
    v226 = -[GuidanceManeuverArtwork initWithManeuver:junction:drivingSide:artworkDataSource:](v223, "initWithManeuver:junction:drivingSide:artworkDataSource:", v224, v149, v222, v225);
    v227 = v288->_maneuverArtwork;
    v288->_maneuverArtwork = v226;

    v218 = v288;
  }
  if (v218->_isMissedStep)
  {
    v149 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemYellowColor](UIColor, "systemYellowColor"));
    v228 = objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "colorWithAlphaComponent:", 0.150000006));
    backgroundColor = v288->_backgroundColor;
    v288->_backgroundColor = (UIColor *)v228;
LABEL_131:

    goto LABEL_132;
  }
  v230 = -[RouteStepItem state](v218, "state");
  if (v230 == (id)2)
  {
    v149 = (id)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
    backgroundColor = (UIColor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "highlightColor"));
  }
  else
  {
    backgroundColor = 0;
  }
  objc_storeStrong((id *)&v288->_backgroundColor, backgroundColor);
  if (v230 == (id)2)
    goto LABEL_131;
LABEL_132:
  exitSignImage = v288->_exitSignImage;
  v288->_exitSignImage = 0;

  if (v285)
  {
    v232 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v285, "primarySign"));
    v233 = objc_msgSend(v232, "shieldID");
    v234 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v232, "shieldStringID"));
    v235 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v232, "shieldText"));
    if (!(_DWORD)v233 && !v234)
      goto LABEL_147;
    -[RouteStepItem scale](v288, "scale");
    v237 = v236;
    v238 = (void *)objc_opt_new(VKIconModifiers);
    objc_msgSend(v238, "setText:", v235);
    v239 = (void *)objc_claimAutoreleasedReturnValue(+[VKIconManager sharedManager](VKIconManager, "sharedManager"));
    -[RouteStepItem scale](v288, "scale");
    v241 = v240;
    v242 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
    v243 = objc_msgSend(v242, "exitSignSize");
    *(float *)&v244 = v241;
    if ((_DWORD)v233)
    {
      v245 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v239, "imageForDataID:text:contentScale:sizeGroup:modifiers:", v233, v235, v243, v238, v244));

      v246 = v235;
    }
    else
    {
      v245 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v239, "imageForName:contentScale:sizeGroup:modifiers:", v234, v243, v238, v244));

      v260 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v246 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v260, "localizedStringForKey:value:table:", CFSTR("[Directions] Exit AX"), CFSTR("localized string not found"), 0));

    }
    if (v245)
    {
      v261 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", objc_msgSend(v245, "image"), 0, v237));
      v262 = v288->_exitSignImage;
      v288->_exitSignImage = (UIImage *)v261;

      -[UIImage setAccessibilityLabel:](v288->_exitSignImage, "setAccessibilityLabel:", v246);
    }

LABEL_146:
LABEL_147:

LABEL_148:
    goto LABEL_149;
  }
  v247 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v282, "representativeSignGuidanceEvent"));
  v232 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v247, "signGuidance"));

  if (v232)
  {
    v234 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v232, "shieldName"));
    if (!objc_msgSend(v234, "hasShield") || !objc_msgSend(v234, "hasShieldType"))
      goto LABEL_148;
    -[RouteStepItem scale](v288, "scale");
    v249 = v248;
    v235 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v234, "shield"));
    v238 = (void *)objc_opt_new(VKIconModifiers);
    objc_msgSend(v238, "setText:", v235);
    v250 = (void *)objc_claimAutoreleasedReturnValue(+[VKIconManager sharedManager](VKIconManager, "sharedManager"));
    v251 = objc_msgSend(v234, "shieldType");
    v252 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v234, "shield"));
    -[RouteStepItem scale](v288, "scale");
    v254 = v253;
    v255 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem metrics](v288, "metrics"));
    v256 = objc_msgSend(v255, "exitSignSize");
    *(float *)&v257 = v254;
    v245 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v250, "imageForDataID:text:contentScale:sizeGroup:modifiers:", v251, v252, v256, v238, v257));

    if (v245)
    {
      v258 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", objc_msgSend(v245, "image"), 0, v249));
      v259 = v288->_exitSignImage;
      v288->_exitSignImage = (UIImage *)v258;

      -[UIImage setAccessibilityLabel:](v288->_exitSignImage, "setAccessibilityLabel:", v235);
    }
    goto LABEL_146;
  }
LABEL_149:

  v263 = objc_claimAutoreleasedReturnValue(objc_msgSend(*p_primaryText, "_maps_attributedStringWithExcessiveHeightCharacterSupport:", 1.2));
  v264 = *p_primaryText;
  *p_primaryText = (id)v263;

  v265 = objc_claimAutoreleasedReturnValue(objc_msgSend(*p_secondaryText, "_maps_attributedStringWithExcessiveHeightCharacterSupport:", 1.2));
  v266 = *p_secondaryText;
  *p_secondaryText = (id)v265;

  v267 = objc_claimAutoreleasedReturnValue(objc_msgSend(*location, "_maps_attributedStringWithExcessiveHeightCharacterSupport:", 1.2));
  v268 = *location;
  *location = (id)v267;

}

- (id)_combinedTertiaryTextForStepWithChargingStation:(id)a3 font:(id)a4 color:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  NSTextAttachment *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  double v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  char *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[2];
  _QWORD v54[2];
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  const char *v58;
  __int16 v59;
  int v60;
  __int16 v61;
  const char *v62;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chargingStationInfo"));
  if (!v10)
  {
    v45 = sub_1004318FC();
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v56 = "-[RouteStepManeuverItem _combinedTertiaryTextForStepWithChargingStation:font:color:]";
      v57 = 2080;
      v58 = "RouteStepManeuverItem.m";
      v59 = 1024;
      v60 = 509;
      v61 = 2080;
      v62 = "chargingStationInfo";
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v47 = sub_1004318FC();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v49 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v56 = v49;
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attributedChargeStringForWaypointType:font:textColor:includeDaysAgo:", 1, v8, v9, 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Directions_Driving_EV_charge_to"), CFSTR("localized string not found"), 0));
  objc_msgSend(v10, "batteryPercentageAfterCharging");
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, (uint64_t)v13));

  v14 = objc_opt_new(NSTextAttachment);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("exclamationmark.circle.fill")));
  objc_msgSend(v8, "pointSize");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 0));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "imageWithConfiguration:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "imageWithRenderingMode:", 2));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_flatImageWithColor:", v9));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "imageWithRenderingMode:", 1));

  -[NSTextAttachment setImage:](v14, "setImage:", v20);
  objc_msgSend(v8, "capHeight");
  v22 = v21;
  objc_msgSend(v20, "size");
  v24 = (v22 - v23) * 0.5;
  objc_msgSend(v20, "size");
  v26 = v25;
  objc_msgSend(v20, "size");
  -[NSTextAttachment setBounds:](v14, "setBounds:", 0.0, v24, v26, v27);
  v51 = v7;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v14));
  v29 = objc_msgSend(v28, "mutableCopy");

  v30 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR(" "));
  objc_msgSend(v29, "appendAttributedString:", v30);

  v31 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v50);
  objc_msgSend(v29, "appendAttributedString:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("[Directions] road descriptions separator"), CFSTR("localized string not found"), 0));

  v34 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v33);
  objc_msgSend(v29, "appendAttributedString:", v34);

  objc_msgSend(v10, "chargingTime");
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString _navigation_stringWithSeconds:abbreviated:](NSString, "_navigation_stringWithSeconds:abbreviated:", v35, 1));
  v37 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v36);
  objc_msgSend(v29, "appendAttributedString:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "string"));
  v39 = objc_msgSend(v38, "length");

  v53[0] = NSFontAttributeName;
  v53[1] = NSForegroundColorAttributeName;
  v54[0] = v8;
  v54[1] = v9;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v54, v53, 2));
  objc_msgSend(v29, "addAttributes:range:", v40, 0, v39);

  v41 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", v52);
  v42 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR("\n"));
  objc_msgSend(v41, "appendAttributedString:", v42);

  objc_msgSend(v41, "appendAttributedString:", v29);
  v43 = objc_msgSend(v41, "copy");

  return v43;
}

- (id)_listInstructionForStep:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "geoStep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "instructionsForListView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  return v5;
}

- (id)_listInstructionStringForStep:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "instructionStringsForListView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem _evaluatedStringForInstructionString:](self, "_evaluatedStringForInstructionString:", v5));

  return v6;
}

- (id)_signInstructionForStep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  int v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "representativeSignGuidanceEvent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "signGuidance"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signDetails"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signDetails"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

  }
  else
  {
    v11 = sub_100431C0C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Missing sign guidance for step: %@", (uint8_t *)&v14, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem _listInstructionForStep:](self, "_listInstructionForStep:", v4));
  }

  return v10;
}

- (id)_signInstructionStringForStep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  int v17;
  id v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "representativeSignGuidanceEvent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "signGuidance"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signDetails"));
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = objc_alloc((Class)GEOComposedString);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "signDetails"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    v12 = objc_msgSend(v9, "initWithGeoFormattedString:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem _evaluatedStringForInstructionString:](self, "_evaluatedStringForInstructionString:", v12));
  }
  else
  {
    v14 = sub_100431C0C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Missing sign guidance for step: %@", (uint8_t *)&v17, 0xCu);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem _listInstructionStringForStep:](self, "_listInstructionStringForStep:", v4));
  }

  return v13;
}

- (id)_instructionVariables
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem route](self, "route"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem step](self, "step"));
  v6 = objc_msgSend(v4, "legIndexForStepIndex:", objc_msgSend(v5, "stepIndex"));

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem route](self, "route"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "legs"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v6));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject destination](v8, "destination"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navDisplayAddress"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v13, CFSTR("{Address}"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject destination](v8, "destination"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "navDisplayNameWithSpecialContacts:", 0));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v15, CFSTR("{Name}"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem step](self, "step"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "maneuverRoadOrExitName"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v16, CFSTR("{Road}"));

    goto LABEL_5;
  }
  v7 = sub_100431C0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem step](self, "step"));
    v18 = 138412290;
    v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to get leg index for step: %@", (uint8_t *)&v18, 0xCu);
LABEL_5:

  }
  return v3;
}

- (id)_evaluatedStringForInstructionString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[6];
  uint8_t buf[4];
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepItem route](self, "route"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem step](self, "step"));
  v7 = objc_msgSend(v5, "legIndexForStepIndex:", objc_msgSend(v6, "stepIndex"));

  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = sub_100431C0C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem step](self, "step"));
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to get leg index for step: %@", buf, 0xCu);

    }
    v11 = v4;
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100894184;
    v14[3] = &unk_1011DA068;
    v14[4] = self;
    v14[5] = v7;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "optionsWithArgumentHandler:", v14));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "composedStringWithOptions:", v12));

  }
  return v11;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  if (self->_computedContent)
  {
    v3 = objc_opt_class(self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem primaryText](self, "primaryText"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem secondaryText](self, "secondaryText"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem tertiaryText](self, "tertiaryText"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "string"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; primaryText = %@; secondaryText = %@; tertiaryText = %@>"),
                      v3,
                      self,
                      v5,
                      v7,
                      v9));

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepManeuverItem step](self, "step"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentsForContext:", -[RouteStepItem context](self, "context")));

    v12 = objc_opt_class(self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForDistance:", -1.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "instruction"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p; primaryText = %@; secondaryText = %@; tertiaryText = (unknown)>"),
                      v12,
                      self,
                      v5,
                      v6));
  }

  return v10;
}

- (GEOComposedRouteStep)step
{
  return self->_step;
}

- (void)setStep:(id)a3
{
  objc_storeStrong((id *)&self->_step, a3);
}

- (BOOL)isMissedStep
{
  return self->_isMissedStep;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_step, 0);
  objc_storeStrong((id *)&self->_exitSignImage, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_maneuverArtwork, 0);
  objc_storeStrong((id *)&self->_shieldImage, 0);
  objc_storeStrong((id *)&self->_tertiaryText, 0);
  objc_storeStrong((id *)&self->_secondaryText, 0);
  objc_storeStrong((id *)&self->_primaryText, 0);
}

@end
