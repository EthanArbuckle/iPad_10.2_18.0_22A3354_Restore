@implementation VUIMediaTagsViewHelper

- (id)tagsViewDictionary
{
  return (id)-[NSMutableDictionary copy](self->_tagsViewDictionary, "copy");
}

- (VUIMediaTagsViewHelper)initWithContentMetadata:(id)a3 additionalMetadata:(id)a4
{
  id v6;
  id v7;
  VUIMediaTagsViewHelper *v8;
  uint64_t v9;
  NSMutableDictionary *tagsViewDictionary;
  uint64_t v11;
  NSDateComponentsFormatter *dateComponentFormatter;
  uint64_t v13;
  NSNumberFormatter *tomatoPercentFormatter;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  NSNumberFormatter *v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  const __CFString *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  const __CFString *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  VUIMediaTagsViewHelper *v134;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  objc_super v162;

  v6 = a3;
  v7 = a4;
  v162.receiver = self;
  v162.super_class = (Class)VUIMediaTagsViewHelper;
  v8 = -[VUIMediaTagsViewHelper init](&v162, sel_init);

  if (!v8)
    goto LABEL_124;
  v9 = objc_opt_new();
  tagsViewDictionary = v8->_tagsViewDictionary;
  v8->_tagsViewDictionary = (NSMutableDictionary *)v9;

  v11 = objc_opt_new();
  dateComponentFormatter = v8->_dateComponentFormatter;
  v8->_dateComponentFormatter = (NSDateComponentsFormatter *)v11;

  -[NSDateComponentsFormatter setUnitsStyle:](v8->_dateComponentFormatter, "setUnitsStyle:", 2);
  -[NSDateComponentsFormatter setAllowedUnits:](v8->_dateComponentFormatter, "setAllowedUnits:", 96);
  v13 = objc_opt_new();
  tomatoPercentFormatter = v8->_tomatoPercentFormatter;
  v8->_tomatoPercentFormatter = (NSNumberFormatter *)v13;

  -[NSNumberFormatter setNumberStyle:](v8->_tomatoPercentFormatter, "setNumberStyle:", 3);
  -[NSNumberFormatter setMultiplier:](v8->_tomatoPercentFormatter, "setMultiplier:", &unk_1EA0B8E60);
  objc_msgSend(v6, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16)
  {
    objc_msgSend(v6, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v17, VUIMediaTagKeyTitle);

  }
  objc_msgSend(v6, "subtitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v19)
  {
    objc_msgSend(v6, "subtitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v20, VUIMediaTagKeySubtitle);

  }
  objc_msgSend(v6, "mediaDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length");

  if (v22)
  {
    objc_msgSend(v6, "mediaDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v23, VUIMediaTagKeyDescription);

  }
  objc_msgSend(v6, "formattedReleaseDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v6, "formattedReleaseDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v25, VUIMediaTagKeyReleasedDate);
  }
  else
  {
    objc_msgSend(v6, "releasedDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
      goto LABEL_13;
    objc_msgSend(v6, "releasedDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaTagsViewHelper _releaseDateDescriptionFromDate:](v8, "_releaseDateDescriptionFromDate:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v27, VUIMediaTagKeyReleasedDate);

  }
LABEL_13:
  objc_msgSend(v6, "duration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v6, "duration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaTagsViewHelper _durationDescriptionFromDuration:](v8, "_durationDescriptionFromDuration:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v30, VUIMediaTagKeyDuration);

  }
  objc_msgSend(v6, "genre");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "length");

  if (v32)
  {
    objc_msgSend(v6, "genre");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v33, VUIMediaTagKeyGenre);

  }
  objc_msgSend(v6, "hasClosedCaptions");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "BOOLValue");

  if (v35)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:", CFSTR("TV.Accessibility.CC"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", CFSTR("cc"), 1, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v38, VUIMediaTagKeyClosedCaptionImage);

  }
  objc_msgSend(v6, "hasADLocales");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "BOOLValue");

  if (v40)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "localizedStringForKey:", CFSTR("TV.Accessibility.AD"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", CFSTR("metadata-ad"), 1, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v43, VUIMediaTagKeyADLocalesImage);

  }
  objc_msgSend(v6, "hasSDHLocales");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "BOOLValue");

  if (v45)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "localizedStringForKey:", CFSTR("TV.Accessibility.SDH"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", CFSTR("metadata-sdh"), 1, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v48, VUIMediaTagKeySDHLocalesImage);

  }
  objc_msgSend(v6, "tomatoPercentage");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[VUIMediaTagsViewHelper _isValidNumber:](v8, "_isValidNumber:", v49);

  if (v50)
  {
    v51 = v8->_tomatoPercentFormatter;
    objc_msgSend(v6, "tomatoPercentage");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](v51, "stringFromNumber:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v53, VUIMediaTagKeyTomatoPercentage);
  }
  objc_msgSend(v6, "commonSenseRecommendedAge");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[VUIMediaTagsViewHelper _isValidNumber:](v8, "_isValidNumber:", v54);

  if (v55)
  {
    objc_msgSend(v6, "commonSenseRecommendedAge");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaTagsViewHelper _commonSenseString:](v8, "_commonSenseString:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v57, VUIMediaTagKeyCommonSenseRating);

    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "localizedStringForKey:", CFSTR("ACCESSIBILITY_COMMON_SENSE"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", CFSTR("cs_badge_white"), 0, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v60, VUIMediaTagKeyCommonSenseImage);

    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "localizedStringForKey:", CFSTR("ACCESSIBILITY_COMMON_SENSE"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", CFSTR("cs_badge_black"), 0, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v63, VUIMediaTagKeyCommonSenseDarkImage);

  }
  objc_msgSend(v6, "ratingAuxiliaryName");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v64, "length"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v64, VUIMediaTagKeyContentRatingAuxiliaryName);
  v150 = v64;
  objc_msgSend(v6, "ratingName");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ratingSystem");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v153, "length") && objc_msgSend(v65, "length"))
  {
    objc_msgSend(v6, "ratingValue");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC69A0]), "initWithRatingSystemString:ratingLabel:rank:ratingDescription:", v153, v65, objc_msgSend(v66, "unsignedIntegerValue"), 0);
    objc_msgSend(MEMORY[0x1E0DC69A8], "sharedInstance");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "badgeForContentRating:drawUnknownRatingBadge:", v67, 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v69, VUIMediaTagKeyRatingImage);

  }
  v70 = objc_msgSend(v6, "tomatoFreshness");
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "localizedStringForKey:", CFSTR("TV.Accessibility.TomatoRating"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", CFSTR("RTLargeRotten"), 0, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (v70 == 2)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "localizedStringForKey:", CFSTR("TV.Accessibility.TomatoRating"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = CFSTR("RTLargeCertified");
    goto LABEL_38;
  }
  if (v70 == 1)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "localizedStringForKey:", CFSTR("TV.Accessibility.TomatoRating"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = CFSTR("RTLargeFresh");
LABEL_38:
    +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", v76, 0, v75);
    v77 = objc_claimAutoreleasedReturnValue();

    v78 = (void *)v77;
    goto LABEL_40;
  }
  v78 = v73;
LABEL_40:
  v148 = v78;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:");
  objc_msgSend(v6, "videoDynamicRange");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[VUIMediaTagsViewHelper _isValidNumber:](v8, "_isValidNumber:", v79))
    goto LABEL_49;
  v80 = objc_msgSend(v79, "integerValue");
  switch(v80)
  {
    case 2:
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "localizedStringForKey:", CFSTR("ACCESSIBILITY_HDR"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = CFSTR("hdr");
      break;
    case 4:
      +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", CFSTR("hdr10+"), 1, 0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v81, VUIMediaTagKeyVideoDynamicRangeImage);
      goto LABEL_48;
    case 3:
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "localizedStringForKey:", CFSTR("ACCESSIBILITY_DOLBY_VISION"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = CFSTR("dolby-vision");
      break;
    default:
      goto LABEL_49;
  }
  +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", v83, 1, v82);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v84, VUIMediaTagKeyVideoDynamicRangeImage);

LABEL_48:
LABEL_49:
  objc_msgSend(v6, "videoResolutionClass");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VUIMediaTagsViewHelper _isValidNumber:](v8, "_isValidNumber:"))
  {
    v85 = objc_msgSend(v159, "integerValue");
    if (v85 == 2)
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "localizedStringForKey:", CFSTR("TV.Accessibility.HD"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = CFSTR("hd");
      goto LABEL_54;
    }
    if (v85 == 3)
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "localizedStringForKey:", CFSTR("ACCESSIBILITY_4K"));
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = CFSTR("4k");
LABEL_54:
      +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", v88, 1, v87);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v89, VUIMediaTagKeyVideoResolutionImage);

    }
  }
  objc_msgSend(v6, "has3D");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VUIMediaTagsViewHelper _isValidNumber:](v8, "_isValidNumber:") && objc_msgSend(v158, "BOOLValue"))
  {
    +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", CFSTR("3d.badge.fill"), 1, 0);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v90, VUIMediaTagKey3DImage);

  }
  objc_msgSend(v6, "hasImmersive");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VUIMediaTagsViewHelper _isValidNumber:](v8, "_isValidNumber:") && objc_msgSend(v157, "BOOLValue"))
  {
    +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", CFSTR("immersive.badge.fill"), 1, 0);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v91, VUIMediaTagKeyImmersiveImage);

  }
  objc_msgSend(v6, "immersiveText");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v92, "length"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v92, VUIMediaTagKeyImmersiveText);
  objc_msgSend(v6, "hasHighMotion");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VUIMediaTagsViewHelper _isValidNumber:](v8, "_isValidNumber:") && objc_msgSend(v156, "BOOLValue"))
  {
    +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", CFSTR("high.motion.badge"), 1, 0);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v93, VUIMediaTagKeyHighMotionImage);

  }
  objc_msgSend(v6, "highMotionText");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v94, "length"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v94, VUIMediaTagKeyHighMotionText);
  objc_msgSend(v6, "hasDolbyAtmos");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = v94;
  v146 = v92;
  if (-[VUIMediaTagsViewHelper _isValidNumber:](v8, "_isValidNumber:") && objc_msgSend(v155, "BOOLValue"))
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "localizedStringForKey:", CFSTR("ACCESSIBILITY_DOLBY_ATMOS"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", CFSTR("dolby-atmos"), 1, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v97, VUIMediaTagKeyDolbyAtmosImage);

  }
  objc_msgSend(v6, "rentalExpiration");
  v98 = objc_claimAutoreleasedReturnValue();
  if (v98)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v98, VUIMediaTagKeyRentalExpiration);
  v144 = (void *)v98;
  objc_msgSend(v7, "vui_stringForKey:", CFSTR("comingSoonText"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v99, "length"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v99, VUIMediaTagKeyComingSoonText);
  v143 = v99;
  objc_msgSend(v7, "vui_stringForKey:", CFSTR("availabilityText"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vui_attrStringForKey:", CFSTR("availabilityText"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v100, "length") || objc_msgSend(v101, "length"))
  {
    if (objc_msgSend(v100, "length"))
      v102 = v100;
    else
      v102 = v101;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v102, VUIMediaTagKeyAvailabilityText);
  }
  -[VUIMediaTagsViewHelper addSeperatorKey:](v8, "addSeperatorKey:", CFSTR("·"));
  objc_msgSend(v7, "vui_stringForKey:", CFSTR("availabilityImage"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v103;
  if (objc_msgSend(v103, "length"))
  {
    +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", v103, 1, 0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v104, VUIMediaTagKeyAvailabilityImage);

  }
  objc_msgSend(v7, "vui_stringForKey:", CFSTR("episodeNumberTitleAbbreviated"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v105, "length"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v105, VUIMediaTagKeyEpisodeNumberTitle);
  v139 = v105;
  if (objc_msgSend(v6, "isSharedWatchEnabled")
    && objc_msgSend(v7, "vui_BOOLForKey:defaultValue:", CFSTR("isGroupWatchActivityEligible"), 0))
  {
    +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", CFSTR("shareplay"), 1, 0);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v106, VUIMediaTagKeyGroupActivityImage);

  }
  objc_msgSend(v6, "episodeNumber");
  v107 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "seasonNumber");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberOfSeasons");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "seasonTitle");
  v109 = objc_claimAutoreleasedReturnValue();
  v154 = (void *)v107;
  v152 = v108;
  v161 = v7;
  v149 = v65;
  v147 = v79;
  v141 = v101;
  v142 = v100;
  v151 = (void *)v109;
  if (v107 && v108)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "localizedStringForKey:", CFSTR("TV.SeasonEpisode.Abbreviated"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "vui_languageAwareDescription");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "stringByReplacingOccurrencesOfString:withString:", CFSTR("@@seasonNumber@@"), v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "vui_languageAwareDescription");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "stringByReplacingOccurrencesOfString:withString:", CFSTR("@@episodeNumber@@"), v114);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v115, VUIMediaTagKeySeasonEpisode);

  }
  else if (v109)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v109, VUIMediaTagKeySeasonEpisode);
  }
  if (v160)
  {
    v116 = (void *)MEMORY[0x1E0CB3940];
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "localizedStringForKey:", CFSTR("TV.SeasonsCount"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "stringWithValidatedFormat:validFormatSpecifiers:error:", v118, CFSTR("%d"), 0, objc_msgSend(v160, "intValue"));
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v119, VUIMediaTagKeySeasonCount);
LABEL_97:

    goto LABEL_98;
  }
  if (v108)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "localizedStringForKey:", CFSTR("TV.SeasonsOrdinalCount"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "vui_languageAwareDescription");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "stringByReplacingOccurrencesOfString:withString:", CFSTR("@@seasonNumber@@"), v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v120, VUIMediaTagKeySeasonCount);

    goto LABEL_97;
  }
LABEL_98:
  objc_msgSend(v6, "channelName");
  v121 = objc_claimAutoreleasedReturnValue();
  if (v121)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v121, VUIMediaTagKeyChannel);
  if (objc_msgSend(v6, "isFederated"))
  {
    +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", CFSTR("arrow.up.forward.square.fill"), 1, 0);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v122, VUIMediaTagKeyFederated);

  }
  objc_msgSend(v6, "leagueShortName");
  v123 = objc_claimAutoreleasedReturnValue();
  if (v123)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v123, VUIMediaTagKeyLeagueShortName);
  objc_msgSend(v6, "gameStartTime");
  v124 = objc_claimAutoreleasedReturnValue();
  if (v124)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v124, VUIMediaTagKeyGameStartTime);
  objc_msgSend(v6, "gameVenue");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  if (v125)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v125, VUIMediaTagKeyGameVenue);
  v136 = (void *)v124;
  objc_msgSend(v6, "liveTextBadge");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  if (v126)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v126, VUIMediaTagKeyLiveTextBadge);
  v138 = (void *)v121;
  objc_msgSend(v6, "timeTextBadge");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  if (v127)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v127, VUIMediaTagKeyTimeTextBadge);
  v137 = (void *)v123;
  objc_msgSend(v6, "versionCount");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v128, "length"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v128, VUIMediaTagKeyVersionCount);
  objc_msgSend(v6, "teamAbbreviation");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v129, "length"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v129, VUIMediaTagKeyTeamAbbreviation);
  objc_msgSend(v6, "shootoutsText");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v130, "length"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v130, VUIMediaTagKeyShootoutsText);
  objc_msgSend(v6, "contentUnavailabilityText");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v131;
  if (v131 && objc_msgSend(v131, "length"))
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v132, VUIMediaTagKeyContentUnavailabilityText);
  objc_msgSend(v161, "objectForKey:", CFSTR("BrandLinkbutton"));
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  if (v133)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_tagsViewDictionary, "setObject:forKeyedSubscript:", v133, VUIMediaTagKeyBrandLinkButton);

  v7 = v161;
LABEL_124:
  v134 = v8;

  return v134;
}

- (void)addSeperatorKey:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tagsViewDictionary, "setObject:forKeyedSubscript:", a3, VUIMediaTagKeySeparator);
}

- (BOOL)_isValidNumber:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "notANumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToNumber:", v4) ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tomatoPercentFormatter, 0);
  objc_storeStrong((id *)&self->_dateComponentFormatter, 0);
  objc_storeStrong((id *)&self->_tagsViewDictionary, 0);
}

- (VUIMediaTagsViewHelper)initWithVUIMediaItem:(id)a3
{
  id v4;
  VUIMediaTagsViewHelper *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *tagsViewDictionary;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VUIMediaTagsViewHelper;
  v5 = -[VUIMediaTagsViewHelper init](&v14, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tagsViewDictionary = v5->_tagsViewDictionary;
    v5->_tagsViewDictionary = v6;

    objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", *MEMORY[0x1E0DC6B40]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "duration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transformedValue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "releaseDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v11, 3, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_tagsViewDictionary, "setObject:forKeyedSubscript:", v10, VUIMediaTagKeyDuration);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_tagsViewDictionary, "setObject:forKeyedSubscript:", v12, VUIMediaTagKeyReleasedDate);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[VUIMediaTagsViewHelper _mediaBagdesWithVUIMediaEntity:](v5, "_mediaBagdesWithVUIMediaEntity:", v4);

  }
  return v5;
}

- (VUIMediaTagsViewHelper)initWithVUIMediaEntity:(id)a3
{
  id v4;
  VUIMediaTagsViewHelper *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *tagsViewDictionary;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)VUIMediaTagsViewHelper;
  v5 = -[VUIMediaTagsViewHelper init](&v24, sel_init);
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tagsViewDictionary = v5->_tagsViewDictionary;
    v5->_tagsViewDictionary = v6;

    objc_msgSend(v4, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v8;
    if (v8 != (void *)v9)
    {
      v11 = (void *)v9;
      objc_msgSend(v4, "type");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v12 != (void *)v13)
      {
        v14 = (void *)v13;
        objc_msgSend(v4, "type");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[VUIMediaEntityType homeVideo](VUIMediaEntityType, "homeVideo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15 != v16)
        {
LABEL_9:
          objc_msgSend(v4, "releaseYear");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringValue");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_tagsViewDictionary, "setObject:forKeyedSubscript:", v21, VUIMediaTagKeyReleasedDate);
          objc_msgSend(v4, "genreTitle");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_tagsViewDictionary, "setObject:forKeyedSubscript:", v22, VUIMediaTagKeyGenre);

          -[VUIMediaTagsViewHelper _mediaBagdesWithVUIMediaEntity:](v5, "_mediaBagdesWithVUIMediaEntity:", v4);
          goto LABEL_10;
        }
LABEL_8:
        objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", *MEMORY[0x1E0DC6B40]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "duration");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "transformedValue:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_tagsViewDictionary, "setObject:forKeyedSubscript:", v19, VUIMediaTagKeyDuration);
        goto LABEL_9;
      }

      v10 = v11;
    }

    goto LABEL_8;
  }
LABEL_10:

  return v5;
}

- (id)_releaseDateDescriptionFromDate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (v3)
  {
    if (_releaseDateDescriptionFromDate__onceToken != -1)
      dispatch_once(&_releaseDateDescriptionFromDate__onceToken, &__block_literal_global_4);
    objc_msgSend((id)_releaseDateDescriptionFromDate__dateFormatter, "stringFromDate:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __58__VUIMediaTagsViewHelper__releaseDateDescriptionFromDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_releaseDateDescriptionFromDate__dateFormatter;
  _releaseDateDescriptionFromDate__dateFormatter = (uint64_t)v0;

  return objc_msgSend((id)_releaseDateDescriptionFromDate__dateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("y"));
}

- (id)_durationDescriptionFromDuration:(id)a3
{
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (a3)
  {
    objc_msgSend(a3, "doubleValue");
    v5 = v4;
    if (v4 >= 600.0)
      v6 = 96;
    else
      v6 = 192;
    -[NSDateComponentsFormatter setAllowedUnits:](self->_dateComponentFormatter, "setAllowedUnits:", v6);
    -[NSDateComponentsFormatter stringFromTimeInterval:](self->_dateComponentFormatter, "stringFromTimeInterval:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(","), &stru_1E9FF3598);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_mediaBagdesWithVUIMediaEntity:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  char v16;
  char v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  int IsHDRCapable;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;

  v43 = a3;
  objc_msgSend(v43, "HLSResolution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v43, "resolution");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v43, "HLSColorCapability");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v43, "colorCapability");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v43, "HLSAudioCapability");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
  }
  else
  {
    objc_msgSend(v43, "audioCapability");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  v15 = objc_msgSend(v7, "unsignedIntegerValue");
  v16 = objc_msgSend(v11, "unsignedIntegerValue");
  v17 = objc_msgSend(v14, "unsignedIntegerValue");
  if ((unint64_t)(v15 - 1) > 1)
  {
    if (v15 != 3)
      goto LABEL_15;
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:", CFSTR("ACCESSIBILITY_4K"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("4k");
  }
  else
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:", CFSTR("TV.Accessibility.CC"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = CFSTR("hd");
  }
  +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", v20, 1, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tagsViewDictionary, "setObject:forKeyedSubscript:", v21, VUIMediaTagKeyVideoResolutionImage);

LABEL_15:
  IsHDRCapable = SSDeviceIsHDRCapable();
  v23 = v43;
  if (!IsHDRCapable)
    goto LABEL_21;
  if ((v16 & 2) != 0)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:", CFSTR("ACCESSIBILITY_DOLBY_VISION"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = CFSTR("dolby-vision");
  }
  else
  {
    if ((v16 & 1) == 0)
      goto LABEL_21;
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:", CFSTR("ACCESSIBILITY_HDR"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = CFSTR("hdr");
  }
  +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", v26, 1, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tagsViewDictionary, "setObject:forKeyedSubscript:", v27, VUIMediaTagKeyVideoDynamicRangeImage);

  v23 = v43;
LABEL_21:
  objc_msgSend(v23, "contentRating");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC69A8], "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "badgeForContentRating:drawUnknownRatingBadge:", v28, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tagsViewDictionary, "setObject:forKeyedSubscript:", v30, VUIMediaTagKeyRatingImage);
  if ((v17 & 1) != 0)
  {
    +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:", CFSTR("ACCESSIBILITY_DOLBY_ATMOS"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", CFSTR("dolby-atmos"), 1, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tagsViewDictionary, "setObject:forKeyedSubscript:", v33, VUIMediaTagKeyDolbyAtmosImage);

  }
  objc_msgSend(v43, "type");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
  v35 = objc_claimAutoreleasedReturnValue();
  if (v34 == (void *)v35)
  {

  }
  else
  {
    v36 = (void *)v35;
    objc_msgSend(v43, "type");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIMediaEntityType homeVideo](VUIMediaEntityType, "homeVideo");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37 != v38)
      goto LABEL_31;
  }
  objc_msgSend(v43, "extrasURL");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "absoluteString");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "length");

  if (v41)
  {
    +[VUIMediaTagsImageHelper imageWithName:flatten:accessibilityDescription:](VUIMediaTagsImageHelper, "imageWithName:flatten:accessibilityDescription:", CFSTR("itunes-extras-badge"), 0, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tagsViewDictionary, "setObject:forKeyedSubscript:", v42, VUIMediaTagKeyItunesExtras);

  }
LABEL_31:

}

- (id)_commonSenseString:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_msgSend(a3, "unsignedIntValue");
  v4 = (void *)MEMORY[0x1E0CB3940];
  +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:", CFSTR("TV.CommonSense.AgeRating"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%u"), 0, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
