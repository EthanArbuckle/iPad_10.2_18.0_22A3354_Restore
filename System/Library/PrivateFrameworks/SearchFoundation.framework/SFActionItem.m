@implementation SFActionItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIsOverlay:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isOverlay = a3;
}

- (BOOL)hasIsOverlay
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setRequiresLocalMedia:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_requiresLocalMedia = a3;
}

- (BOOL)hasRequiresLocalMedia
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setLatitude:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_latitude = a3;
}

- (BOOL)hasLatitude
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setLongitude:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_longitude = a3;
}

- (BOOL)hasLongitude
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsITunes:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isITunes = a3;
}

- (BOOL)hasIsITunes
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setMediaEntityType:(int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_mediaEntityType = a3;
}

- (BOOL)hasMediaEntityType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setShouldSearchDirectionsAlongCurrentRoute:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x40u;
  self->_shouldSearchDirectionsAlongCurrentRoute = a3;
}

- (BOOL)hasShouldSearchDirectionsAlongCurrentRoute
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setDirectionsMode:(int)a3
{
  *(_BYTE *)&self->_has |= 0x80u;
  self->_directionsMode = a3;
}

- (BOOL)hasDirectionsMode
{
  return *(_BYTE *)&self->_has >> 7;
}

- (SFActionItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBActionItem *v6;
  SFActionItem *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBActionItem initWithData:]([_SFPBActionItem alloc], "initWithData:", v5);
  v7 = -[SFActionItem initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBActionItem *v6;

  v4 = a3;
  v6 = -[_SFPBActionItem initWithFacade:]([_SFPBActionItem alloc], "initWithFacade:", self);
  -[_SFPBActionItem data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBActionItem *v2;
  void *v3;

  v2 = -[_SFPBActionItem initWithFacade:]([_SFPBActionItem alloc], "initWithFacade:", self);
  -[_SFPBActionItem dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBActionItem *v2;
  void *v3;

  v2 = -[_SFPBActionItem initWithFacade:]([_SFPBActionItem alloc], "initWithFacade:", self);
  -[_SFPBActionItem jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFActionItem label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setLabel:", v6);

  -[SFActionItem labelForLocalMedia](self, "labelForLocalMedia");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setLabelForLocalMedia:", v8);

  objc_msgSend(v4, "setIsOverlay:", -[SFActionItem isOverlay](self, "isOverlay"));
  -[SFActionItem storeIdentifiers](self, "storeIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setStoreIdentifiers:", v10);

  objc_msgSend(v4, "setRequiresLocalMedia:", -[SFActionItem requiresLocalMedia](self, "requiresLocalMedia"));
  -[SFActionItem localMediaIdentifier](self, "localMediaIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setLocalMediaIdentifier:", v12);

  -[SFActionItem punchout](self, "punchout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setPunchout:", v14);

  -[SFActionItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setApplicationBundleIdentifier:", v16);

  -[SFActionItem contactIdentifier](self, "contactIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setContactIdentifier:", v18);

  -[SFActionItem phoneNumber](self, "phoneNumber");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setPhoneNumber:", v20);

  -[SFActionItem email](self, "email");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setEmail:", v22);

  -[SFActionItem mapsData](self, "mapsData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setMapsData:", v24);

  -[SFActionItem latitude](self, "latitude");
  objc_msgSend(v4, "setLatitude:");
  -[SFActionItem longitude](self, "longitude");
  objc_msgSend(v4, "setLongitude:");
  -[SFActionItem provider](self, "provider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setProvider:", v26);

  -[SFActionItem offerType](self, "offerType");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setOfferType:", v28);

  -[SFActionItem type](self, "type");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v4, "setType:", v30);

  -[SFActionItem labelITunes](self, "labelITunes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v4, "setLabelITunes:", v32);

  objc_msgSend(v4, "setIsITunes:", -[SFActionItem isITunes](self, "isITunes"));
  -[SFActionItem icon](self, "icon");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  objc_msgSend(v4, "setIcon:", v34);

  -[SFActionItem baseIcon](self, "baseIcon");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copy");
  objc_msgSend(v4, "setBaseIcon:", v36);

  -[SFActionItem location](self, "location");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");
  objc_msgSend(v4, "setLocation:", v38);

  -[SFActionItem messageIdentifier](self, "messageIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copy");
  objc_msgSend(v4, "setMessageIdentifier:", v40);

  -[SFActionItem messageURL](self, "messageURL");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "copy");
  objc_msgSend(v4, "setMessageURL:", v42);

  -[SFActionItem persistentID](self, "persistentID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "copy");
  objc_msgSend(v4, "setPersistentID:", v44);

  objc_msgSend(v4, "setMediaEntityType:", -[SFActionItem mediaEntityType](self, "mediaEntityType"));
  -[SFActionItem universalLibraryID](self, "universalLibraryID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v45, "copy");
  objc_msgSend(v4, "setUniversalLibraryID:", v46);

  -[SFActionItem interactionContentType](self, "interactionContentType");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v47, "copy");
  objc_msgSend(v4, "setInteractionContentType:", v48);

  -[SFActionItem customDirectionsPunchout](self, "customDirectionsPunchout");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v49, "copy");
  objc_msgSend(v4, "setCustomDirectionsPunchout:", v50);

  objc_msgSend(v4, "setShouldSearchDirectionsAlongCurrentRoute:", -[SFActionItem shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute"));
  objc_msgSend(v4, "setDirectionsMode:", -[SFActionItem directionsMode](self, "directionsMode"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  SFActionItem *v6;
  SFActionItem *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  BOOL v15;
  uint64_t v16;
  _BOOL4 v17;
  int v18;
  int v19;
  int v20;
  uint64_t v22;
  SFActionItem *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  _BOOL4 v49;
  int v50;
  SFActionItem *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
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
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
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
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
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
  int v162;
  int v163;
  int v164;
  int v165;
  int v166;
  int v167;
  int v168;
  int v169;
  int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  int v175;
  int v176;
  int v177;
  int v178;
  int v179;
  int v180;
  int v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  int v187;
  int v188;
  int v189;
  int v190;
  int v191;
  int v192;
  int v193;
  _QWORD v194[3];
  _BOOL4 v195;
  int v196;
  _BOOL4 v197;
  int v198;
  _BOOL4 v199;
  _BOOL4 v200;
  int v201;
  _BOOL4 v202;
  _BOOL4 v203;
  _BOOL4 v204;
  _BOOL4 v205;
  _BOOL4 v206;
  _BOOL4 v207;
  uint64_t v208;
  int v209;
  int v210;
  id v211;
  id v212;
  _BOOL4 v213;
  _BOOL4 v214;
  _BOOL4 v215;
  _BOOL4 v216;
  _BOOL4 v217;
  _BOOL4 v218;
  __int128 v219;

  v6 = (SFActionItem *)a3;
  if (self == v6)
  {
    v15 = 1;
    goto LABEL_150;
  }
  if (!-[SFActionItem isMemberOfClass:](v6, "isMemberOfClass:", objc_opt_class()))
  {
    v15 = 0;
    goto LABEL_150;
  }
  v7 = v6;
  -[SFActionItem label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;
  -[SFActionItem label](v7, "label");
  v211 = (id)objc_claimAutoreleasedReturnValue();
  v212 = v8;
  v209 = v211 != 0;
  v210 = v9;
  if ((_DWORD)v9 == v209)
  {
    v208 = 0;
    v201 = 0;
    v198 = 0;
    v196 = 0;
    v219 = 0uLL;
    memset(v194, 0, sizeof(v194));
    v11 = 0;
    v189 = 0;
    v191 = 0;
    v218 = 0;
    v186 = 0;
    v187 = 0;
    v217 = 0;
    v181 = 0;
    v184 = 0;
    v216 = 0;
    v173 = 0;
    v167 = 0;
    v215 = 0;
    v175 = 0;
    v179 = 0;
    v214 = 0;
    v168 = 0;
    v176 = 0;
    v213 = 0;
    v164 = 0;
    v170 = 0;
    v207 = 0;
    v162 = 0;
    v163 = 0;
    v206 = 0;
    v165 = 0;
    v171 = 0;
    v205 = 0;
    v166 = 0;
    v174 = 0;
    v204 = 0;
    v169 = 0;
    v177 = 0;
    v203 = 0;
    v172 = 0;
    v180 = 0;
    v202 = 0;
    v178 = 0;
    v183 = 0;
    v200 = 0;
    v182 = 0;
    v185 = 0;
    v199 = 0;
    v188 = 0;
    v190 = 0;
    v197 = 0;
    v192 = 0;
    v193 = 0;
    v195 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_15;
  }
  -[SFActionItem label](self, "label");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;
  v161 = (void *)v3;
  if (v3)
  {
    -[SFActionItem label](self, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFActionItem label](v7, "label");
    v158 = v10;
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "isEqual:"))
    {
      v201 = 0;
      v198 = 0;
      v208 = 0x100000000;
      v196 = 0;
      v219 = 0uLL;
      memset(v194, 0, sizeof(v194));
      v11 = 0;
      v189 = 0;
      v191 = 0;
      v218 = 0;
      v186 = 0;
      v187 = 0;
      v217 = 0;
      v181 = 0;
      v184 = 0;
      v216 = 0;
      v173 = 0;
      v167 = 0;
      v215 = 0;
      v175 = 0;
      v179 = 0;
      v214 = 0;
      v168 = 0;
      v176 = 0;
      v213 = 0;
      v164 = 0;
      v170 = 0;
      v207 = 0;
      v162 = 0;
      v163 = 0;
      v206 = 0;
      v165 = 0;
      v171 = 0;
      v205 = 0;
      v166 = 0;
      v174 = 0;
      v204 = 0;
      v169 = 0;
      v177 = 0;
      v203 = 0;
      v172 = 0;
      v180 = 0;
      v202 = 0;
      v178 = 0;
      v183 = 0;
      v200 = 0;
      v182 = 0;
      v185 = 0;
      v199 = 0;
      v188 = 0;
      v190 = 0;
      v197 = 0;
      v192 = 0;
      v193 = 0;
      v195 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      goto LABEL_15;
    }
  }
  -[SFActionItem labelForLocalMedia](self, "labelForLocalMedia");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v160 == 0;
  -[SFActionItem labelForLocalMedia](v7, "labelForLocalMedia");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v208) = v4;
  if ((_DWORD)v3 == (v159 != 0))
  {
    v198 = 0;
    LODWORD(v208) = 0;
    v196 = 0;
    v219 = 0uLL;
    memset(v194, 0, sizeof(v194));
    v11 = 0;
    v189 = 0;
    v191 = 0;
    v218 = 0;
    v186 = 0;
    v187 = 0;
    v217 = 0;
    v181 = 0;
    v184 = 0;
    v216 = 0;
    v173 = 0;
    v167 = 0;
    v215 = 0;
    v175 = 0;
    v179 = 0;
    v214 = 0;
    v168 = 0;
    v176 = 0;
    v213 = 0;
    v164 = 0;
    v170 = 0;
    v207 = 0;
    v162 = 0;
    v163 = 0;
    v206 = 0;
    v165 = 0;
    v171 = 0;
    v205 = 0;
    v166 = 0;
    v174 = 0;
    v204 = 0;
    v169 = 0;
    v177 = 0;
    v203 = 0;
    v172 = 0;
    v180 = 0;
    v202 = 0;
    v178 = 0;
    v183 = 0;
    v200 = 0;
    v182 = 0;
    v185 = 0;
    v199 = 0;
    v188 = 0;
    v190 = 0;
    v197 = 0;
    v192 = 0;
    v193 = 0;
    v195 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v201 = 1;
    goto LABEL_15;
  }
  -[SFActionItem labelForLocalMedia](self, "labelForLocalMedia");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16 != 0;
  v156 = (void *)v16;
  if (v16)
  {
    -[SFActionItem labelForLocalMedia](self, "labelForLocalMedia");
    v3 = objc_claimAutoreleasedReturnValue();
    -[SFActionItem labelForLocalMedia](v7, "labelForLocalMedia");
    v155 = (void *)v3;
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend((id)v3, "isEqual:"))
    {
      v196 = 0;
      v219 = 0uLL;
      memset(v194, 0, sizeof(v194));
      v11 = 0;
      v189 = 0;
      v191 = 0;
      v218 = 0;
      v186 = 0;
      v187 = 0;
      v217 = 0;
      v181 = 0;
      v184 = 0;
      v216 = 0;
      v173 = 0;
      v167 = 0;
      v215 = 0;
      v175 = 0;
      v179 = 0;
      v214 = 0;
      v168 = 0;
      v176 = 0;
      v213 = 0;
      v164 = 0;
      v170 = 0;
      v207 = 0;
      v162 = 0;
      v163 = 0;
      v206 = 0;
      v165 = 0;
      v171 = 0;
      v205 = 0;
      v166 = 0;
      v174 = 0;
      v204 = 0;
      v169 = 0;
      v177 = 0;
      v203 = 0;
      v172 = 0;
      v180 = 0;
      v202 = 0;
      v178 = 0;
      v183 = 0;
      v200 = 0;
      v182 = 0;
      v185 = 0;
      v199 = 0;
      v188 = 0;
      v190 = 0;
      v197 = 0;
      v192 = 0;
      v193 = 0;
      v195 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v201 = 1;
      v198 = 1;
      LODWORD(v208) = 1;
      goto LABEL_15;
    }
  }
  v3 = -[SFActionItem isOverlay](self, "isOverlay");
  LODWORD(v208) = v17;
  if ((_DWORD)v3 != -[SFActionItem isOverlay](v7, "isOverlay"))
  {
    v196 = 0;
    v219 = 0uLL;
    memset(v194, 0, sizeof(v194));
    v11 = 0;
    v189 = 0;
    v191 = 0;
    v218 = 0;
    v186 = 0;
    v187 = 0;
    v217 = 0;
    v181 = 0;
    v184 = 0;
    v216 = 0;
    v173 = 0;
    v167 = 0;
    v215 = 0;
    v175 = 0;
    v179 = 0;
    v214 = 0;
    v168 = 0;
    v176 = 0;
    v213 = 0;
    v164 = 0;
    v170 = 0;
    v207 = 0;
    v162 = 0;
    v163 = 0;
    v206 = 0;
    v165 = 0;
    v171 = 0;
    v205 = 0;
    v166 = 0;
    v174 = 0;
    v204 = 0;
    v169 = 0;
    v177 = 0;
    v203 = 0;
    v172 = 0;
    v180 = 0;
    v202 = 0;
    v178 = 0;
    v183 = 0;
    v200 = 0;
    v182 = 0;
    v185 = 0;
    v199 = 0;
    v188 = 0;
    v190 = 0;
    v197 = 0;
    v192 = 0;
    v193 = 0;
    v195 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v201 = 1;
    v198 = 1;
    goto LABEL_15;
  }
  -[SFActionItem storeIdentifiers](self, "storeIdentifiers");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v153 == 0;
  -[SFActionItem storeIdentifiers](v7, "storeIdentifiers");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v3 == (v152 != 0))
  {
    v219 = 0uLL;
    memset(v194, 0, sizeof(v194));
    v11 = 0;
    v189 = 0;
    v191 = 0;
    v218 = 0;
    v186 = 0;
    v187 = 0;
    v217 = 0;
    v181 = 0;
    v184 = 0;
    v216 = 0;
    v173 = 0;
    v167 = 0;
    v215 = 0;
    v175 = 0;
    v179 = 0;
    v214 = 0;
    v168 = 0;
    v176 = 0;
    v213 = 0;
    v164 = 0;
    v170 = 0;
    v207 = 0;
    v162 = 0;
    v163 = 0;
    v206 = 0;
    v165 = 0;
    v171 = 0;
    v205 = 0;
    v166 = 0;
    v174 = 0;
    v204 = 0;
    v169 = 0;
    v177 = 0;
    v203 = 0;
    v172 = 0;
    v180 = 0;
    v202 = 0;
    v178 = 0;
    v183 = 0;
    v200 = 0;
    v182 = 0;
    v185 = 0;
    v199 = 0;
    v188 = 0;
    v190 = 0;
    v197 = 0;
    v192 = 0;
    v193 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v201 = 1;
    v198 = 1;
    v195 = 0;
    v196 = 1;
    goto LABEL_15;
  }
  -[SFActionItem storeIdentifiers](self, "storeIdentifiers");
  v3 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v219) = v3 != 0;
  v151 = (void *)v3;
  if (v3)
  {
    -[SFActionItem storeIdentifiers](self, "storeIdentifiers");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v7;
    v24 = (void *)v22;
    v51 = v23;
    -[SFActionItem storeIdentifiers](v23, "storeIdentifiers");
    v150 = v24;
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v24, "isEqual:"))
    {
      *(_QWORD *)((char *)&v219 + 4) = 0;
      memset(v194, 0, 20);
      v11 = 0;
      LODWORD(v219) = 0;
      v189 = 0;
      v191 = 0;
      v218 = 0;
      v186 = 0;
      v187 = 0;
      v217 = 0;
      v181 = 0;
      v184 = 0;
      v216 = 0;
      v173 = 0;
      v167 = 0;
      v215 = 0;
      v175 = 0;
      v179 = 0;
      v214 = 0;
      v168 = 0;
      v176 = 0;
      v213 = 0;
      v164 = 0;
      v170 = 0;
      v207 = 0;
      v162 = 0;
      v163 = 0;
      v206 = 0;
      v165 = 0;
      v171 = 0;
      v205 = 0;
      v166 = 0;
      v174 = 0;
      v204 = 0;
      v169 = 0;
      v177 = 0;
      v203 = 0;
      v172 = 0;
      v180 = 0;
      v202 = 0;
      v178 = 0;
      v183 = 0;
      v200 = 0;
      v182 = 0;
      v185 = 0;
      v199 = 0;
      v188 = 0;
      v190 = 0;
      v197 = 0;
      v192 = 0;
      v193 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v201 = 1;
      v198 = 1;
      v195 = 0;
      v196 = 1;
      HIDWORD(v194[2]) = 1;
      HIDWORD(v219) = 1;
      v7 = v51;
      goto LABEL_15;
    }
    v7 = v51;
  }
  v3 = -[SFActionItem requiresLocalMedia](self, "requiresLocalMedia");
  if ((_DWORD)v3 == -[SFActionItem requiresLocalMedia](v7, "requiresLocalMedia"))
  {
    -[SFActionItem localMediaIdentifier](self, "localMediaIdentifier");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v148 == 0;
    -[SFActionItem localMediaIdentifier](v7, "localMediaIdentifier");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v3 == (v147 != 0))
    {
      v194[2] = 0x100000000;
      *(_QWORD *)((char *)&v219 + 4) = 0;
      *(_QWORD *)((char *)v194 + 4) = 0;
      LODWORD(v194[0]) = 0;
      v11 = 0;
      LODWORD(v219) = 0;
      v189 = 0;
      v191 = 0;
      v218 = 0;
      v186 = 0;
      v187 = 0;
      v217 = 0;
      v181 = 0;
      v184 = 0;
      v216 = 0;
      v173 = 0;
      v167 = 0;
      v215 = 0;
      v175 = 0;
      v179 = 0;
      v214 = 0;
      v168 = 0;
      v176 = 0;
      v213 = 0;
      v164 = 0;
      v170 = 0;
      v207 = 0;
      v162 = 0;
      v163 = 0;
      v206 = 0;
      v165 = 0;
      v171 = 0;
      v205 = 0;
      v166 = 0;
      v174 = 0;
      v204 = 0;
      v169 = 0;
      v177 = 0;
      v203 = 0;
      v172 = 0;
      v180 = 0;
      v202 = 0;
      v178 = 0;
      v183 = 0;
      v200 = 0;
      v182 = 0;
      v185 = 0;
      v199 = 0;
      v188 = 0;
      v190 = 0;
      v197 = 0;
      v192 = 0;
      v193 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v201 = 1;
      v198 = 1;
      v195 = 0;
      v196 = 1;
      HIDWORD(v194[1]) = 1;
    }
    else
    {
      -[SFActionItem localMediaIdentifier](self, "localMediaIdentifier");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      DWORD2(v219) = v146 != 0;
      if (!v146
        || (-[SFActionItem localMediaIdentifier](self, "localMediaIdentifier"),
            v3 = objc_claimAutoreleasedReturnValue(),
            -[SFActionItem localMediaIdentifier](v7, "localMediaIdentifier"),
            v143 = (void *)v3,
            v142 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend((id)v3, "isEqual:")))
      {
        -[SFActionItem punchout](self, "punchout");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = v145 == 0;
        -[SFActionItem punchout](v7, "punchout");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_DWORD)v3 == (v144 != 0))
        {
          v194[1] = 0x100000000;
          *(_QWORD *)&v219 = 0;
          v194[0] = 0x100000000;
          v11 = 0;
          v189 = 0;
          v191 = 0;
          v218 = 0;
          v186 = 0;
          v187 = 0;
          v217 = 0;
          v181 = 0;
          v184 = 0;
          v216 = 0;
          v173 = 0;
          v167 = 0;
          v215 = 0;
          v175 = 0;
          v179 = 0;
          v214 = 0;
          v168 = 0;
          v176 = 0;
          v213 = 0;
          v164 = 0;
          v170 = 0;
          v207 = 0;
          v162 = 0;
          v163 = 0;
          v206 = 0;
          v165 = 0;
          v171 = 0;
          v205 = 0;
          v166 = 0;
          v174 = 0;
          v204 = 0;
          v169 = 0;
          v177 = 0;
          v203 = 0;
          v172 = 0;
          v180 = 0;
          v202 = 0;
          v178 = 0;
          v183 = 0;
          v200 = 0;
          v182 = 0;
          v185 = 0;
          v199 = 0;
          v188 = 0;
          v190 = 0;
          v197 = 0;
          v192 = 0;
          v193 = 0;
          v12 = 0;
          v13 = 0;
          v14 = 0;
          v15 = 0;
          v201 = 1;
          v198 = 1;
          v195 = 0;
          v196 = 1;
          v194[2] = 0x100000001;
        }
        else
        {
          -[SFActionItem punchout](self, "punchout");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          DWORD1(v219) = v141 != 0;
          if (!v141
            || (-[SFActionItem punchout](self, "punchout"),
                v3 = objc_claimAutoreleasedReturnValue(),
                -[SFActionItem punchout](v7, "punchout"),
                v138 = (void *)v3,
                v137 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend((id)v3, "isEqual:")))
          {
            -[SFActionItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            v3 = v140 == 0;
            -[SFActionItem applicationBundleIdentifier](v7, "applicationBundleIdentifier");
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            if ((_DWORD)v3 == (v139 != 0))
            {
              v11 = 0;
              LODWORD(v219) = 0;
              v189 = 0;
              v191 = 0;
              v218 = 0;
              v186 = 0;
              v187 = 0;
              v217 = 0;
              v181 = 0;
              v184 = 0;
              v216 = 0;
              v173 = 0;
              v167 = 0;
              v215 = 0;
              v175 = 0;
              v179 = 0;
              v214 = 0;
              v168 = 0;
              v176 = 0;
              v213 = 0;
              v164 = 0;
              v170 = 0;
              v207 = 0;
              v162 = 0;
              v163 = 0;
              v206 = 0;
              v165 = 0;
              v171 = 0;
              v205 = 0;
              v166 = 0;
              v174 = 0;
              v204 = 0;
              v169 = 0;
              v177 = 0;
              v203 = 0;
              v172 = 0;
              v180 = 0;
              v202 = 0;
              v178 = 0;
              v183 = 0;
              v200 = 0;
              v182 = 0;
              v185 = 0;
              v199 = 0;
              v188 = 0;
              v190 = 0;
              v197 = 0;
              v192 = 0;
              v12 = 0;
              v13 = 0;
              v14 = 0;
              v15 = 0;
              v201 = 1;
              v198 = 1;
              v195 = 0;
              v196 = 1;
              v194[2] = 0x100000001;
              v194[1] = 0x100000001;
              v193 = 0;
              v194[0] = 0x100000001;
            }
            else
            {
              -[SFActionItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
              v25 = objc_claimAutoreleasedReturnValue();
              LODWORD(v219) = v25 != 0;
              v136 = (void *)v25;
              if (!v25
                || (-[SFActionItem applicationBundleIdentifier](self, "applicationBundleIdentifier"),
                    v3 = objc_claimAutoreleasedReturnValue(),
                    -[SFActionItem applicationBundleIdentifier](v7, "applicationBundleIdentifier"),
                    v133 = (void *)v3,
                    v132 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend((id)v3, "isEqual:")))
              {
                -[SFActionItem contactIdentifier](self, "contactIdentifier");
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                v3 = v135 == 0;
                -[SFActionItem contactIdentifier](v7, "contactIdentifier");
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                if ((_DWORD)v3 == (v134 != 0))
                {
                  v191 = 0;
                  v218 = 0;
                  v186 = 0;
                  v187 = 0;
                  v217 = 0;
                  v181 = 0;
                  v184 = 0;
                  v216 = 0;
                  v173 = 0;
                  v167 = 0;
                  v215 = 0;
                  v175 = 0;
                  v179 = 0;
                  v214 = 0;
                  v168 = 0;
                  v176 = 0;
                  v213 = 0;
                  v164 = 0;
                  v170 = 0;
                  v207 = 0;
                  v162 = 0;
                  v163 = 0;
                  v206 = 0;
                  v165 = 0;
                  v171 = 0;
                  v205 = 0;
                  v166 = 0;
                  v174 = 0;
                  v204 = 0;
                  v169 = 0;
                  v177 = 0;
                  v203 = 0;
                  v172 = 0;
                  v180 = 0;
                  v202 = 0;
                  v178 = 0;
                  v183 = 0;
                  v200 = 0;
                  v182 = 0;
                  v185 = 0;
                  v199 = 0;
                  v188 = 0;
                  v190 = 0;
                  v197 = 0;
                  v192 = 0;
                  v12 = 0;
                  v13 = 0;
                  v14 = 0;
                  v15 = 0;
                  v201 = 1;
                  v198 = 1;
                  v195 = 0;
                  v196 = 1;
                  v194[2] = 0x100000001;
                  v194[1] = 0x100000001;
                  v193 = 0;
                  v194[0] = 0x100000001;
                  v11 = 1;
                  v189 = 1;
                }
                else
                {
                  -[SFActionItem contactIdentifier](self, "contactIdentifier");
                  v26 = objc_claimAutoreleasedReturnValue();
                  v218 = v26 != 0;
                  v131 = (void *)v26;
                  if (!v26
                    || (-[SFActionItem contactIdentifier](self, "contactIdentifier"),
                        v3 = objc_claimAutoreleasedReturnValue(),
                        -[SFActionItem contactIdentifier](v7, "contactIdentifier"),
                        v128 = (void *)v3,
                        v127 = (void *)objc_claimAutoreleasedReturnValue(),
                        objc_msgSend((id)v3, "isEqual:")))
                  {
                    -[SFActionItem phoneNumber](self, "phoneNumber");
                    v130 = (void *)objc_claimAutoreleasedReturnValue();
                    v3 = v130 == 0;
                    -[SFActionItem phoneNumber](v7, "phoneNumber");
                    v129 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((_DWORD)v3 == (v129 != 0))
                    {
                      v187 = 0;
                      v217 = 0;
                      v181 = 0;
                      v184 = 0;
                      v216 = 0;
                      v173 = 0;
                      v167 = 0;
                      v215 = 0;
                      v175 = 0;
                      v179 = 0;
                      v214 = 0;
                      v168 = 0;
                      v176 = 0;
                      v213 = 0;
                      v164 = 0;
                      v170 = 0;
                      v207 = 0;
                      v162 = 0;
                      v163 = 0;
                      v206 = 0;
                      v165 = 0;
                      v171 = 0;
                      v205 = 0;
                      v166 = 0;
                      v174 = 0;
                      v204 = 0;
                      v169 = 0;
                      v177 = 0;
                      v203 = 0;
                      v172 = 0;
                      v180 = 0;
                      v202 = 0;
                      v178 = 0;
                      v183 = 0;
                      v200 = 0;
                      v182 = 0;
                      v185 = 0;
                      v199 = 0;
                      v188 = 0;
                      v190 = 0;
                      v197 = 0;
                      v192 = 0;
                      v12 = 0;
                      v13 = 0;
                      v14 = 0;
                      v15 = 0;
                      v201 = 1;
                      v198 = 1;
                      v195 = 0;
                      v196 = 1;
                      v194[2] = 0x100000001;
                      v194[1] = 0x100000001;
                      v193 = 0;
                      v194[0] = 0x100000001;
                      v11 = 1;
                      v189 = 1;
                      v191 = 1;
                      v186 = 1;
                    }
                    else
                    {
                      -[SFActionItem phoneNumber](self, "phoneNumber");
                      v27 = objc_claimAutoreleasedReturnValue();
                      v217 = v27 != 0;
                      v126 = (void *)v27;
                      if (!v27
                        || (-[SFActionItem phoneNumber](self, "phoneNumber"),
                            v3 = objc_claimAutoreleasedReturnValue(),
                            -[SFActionItem phoneNumber](v7, "phoneNumber"),
                            v123 = (void *)v3,
                            v122 = (void *)objc_claimAutoreleasedReturnValue(),
                            objc_msgSend((id)v3, "isEqual:")))
                      {
                        -[SFActionItem email](self, "email");
                        v125 = (void *)objc_claimAutoreleasedReturnValue();
                        v3 = v125 == 0;
                        -[SFActionItem email](v7, "email");
                        v124 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((_DWORD)v3 == (v124 != 0))
                        {
                          v184 = 0;
                          v216 = 0;
                          v173 = 0;
                          v167 = 0;
                          v215 = 0;
                          v175 = 0;
                          v179 = 0;
                          v214 = 0;
                          v168 = 0;
                          v176 = 0;
                          v213 = 0;
                          v164 = 0;
                          v170 = 0;
                          v207 = 0;
                          v162 = 0;
                          v163 = 0;
                          v206 = 0;
                          v165 = 0;
                          v171 = 0;
                          v205 = 0;
                          v166 = 0;
                          v174 = 0;
                          v204 = 0;
                          v169 = 0;
                          v177 = 0;
                          v203 = 0;
                          v172 = 0;
                          v180 = 0;
                          v202 = 0;
                          v178 = 0;
                          v183 = 0;
                          v200 = 0;
                          v182 = 0;
                          v185 = 0;
                          v199 = 0;
                          v188 = 0;
                          v190 = 0;
                          v197 = 0;
                          v192 = 0;
                          v12 = 0;
                          v13 = 0;
                          v14 = 0;
                          v15 = 0;
                          v201 = 1;
                          v198 = 1;
                          v195 = 0;
                          v196 = 1;
                          v194[2] = 0x100000001;
                          v194[1] = 0x100000001;
                          v193 = 0;
                          v194[0] = 0x100000001;
                          v11 = 1;
                          v189 = 1;
                          v191 = 1;
                          v186 = 1;
                          v187 = 1;
                          v181 = 1;
                        }
                        else
                        {
                          -[SFActionItem email](self, "email");
                          v28 = objc_claimAutoreleasedReturnValue();
                          v216 = v28 != 0;
                          v121 = (void *)v28;
                          if (!v28
                            || (-[SFActionItem email](self, "email"),
                                v3 = objc_claimAutoreleasedReturnValue(),
                                -[SFActionItem email](v7, "email"),
                                v118 = (void *)v3,
                                v117 = (void *)objc_claimAutoreleasedReturnValue(),
                                objc_msgSend((id)v3, "isEqual:")))
                          {
                            -[SFActionItem mapsData](self, "mapsData");
                            v120 = (void *)objc_claimAutoreleasedReturnValue();
                            v3 = v120 == 0;
                            -[SFActionItem mapsData](v7, "mapsData");
                            v119 = (void *)objc_claimAutoreleasedReturnValue();
                            if ((_DWORD)v3 == (v119 != 0))
                            {
                              v167 = 0;
                              v215 = 0;
                              v175 = 0;
                              v179 = 0;
                              v214 = 0;
                              v168 = 0;
                              v176 = 0;
                              v213 = 0;
                              v164 = 0;
                              v170 = 0;
                              v207 = 0;
                              v162 = 0;
                              v163 = 0;
                              v206 = 0;
                              v165 = 0;
                              v171 = 0;
                              v205 = 0;
                              v166 = 0;
                              v174 = 0;
                              v204 = 0;
                              v169 = 0;
                              v177 = 0;
                              v203 = 0;
                              v172 = 0;
                              v180 = 0;
                              v202 = 0;
                              v178 = 0;
                              v183 = 0;
                              v200 = 0;
                              v182 = 0;
                              v185 = 0;
                              v199 = 0;
                              v188 = 0;
                              v190 = 0;
                              v197 = 0;
                              v192 = 0;
                              v12 = 0;
                              v13 = 0;
                              v14 = 0;
                              v15 = 0;
                              v201 = 1;
                              v198 = 1;
                              v195 = 0;
                              v196 = 1;
                              v194[2] = 0x100000001;
                              v194[1] = 0x100000001;
                              v193 = 0;
                              v194[0] = 0x100000001;
                              v11 = 1;
                              v189 = 1;
                              v191 = 1;
                              v186 = 1;
                              v187 = 1;
                              v181 = 1;
                              v184 = 1;
                              v173 = 1;
                            }
                            else
                            {
                              -[SFActionItem mapsData](self, "mapsData");
                              v29 = objc_claimAutoreleasedReturnValue();
                              v215 = v29 != 0;
                              v116 = (void *)v29;
                              if (!v29
                                || (-[SFActionItem mapsData](self, "mapsData"),
                                    v3 = objc_claimAutoreleasedReturnValue(),
                                    -[SFActionItem mapsData](v7, "mapsData"),
                                    v114 = (void *)objc_claimAutoreleasedReturnValue(),
                                    v115 = (void *)v3,
                                    objc_msgSend((id)v3, "isEqual:")))
                              {
                                -[SFActionItem latitude](self, "latitude");
                                v31 = v30;
                                -[SFActionItem latitude](v7, "latitude");
                                if (vabdd_f64(v31, v32) >= 2.22044605e-16
                                  || (-[SFActionItem longitude](self, "longitude"),
                                      v34 = v33,
                                      -[SFActionItem longitude](v7, "longitude"),
                                      vabdd_f64(v34, v35) >= 2.22044605e-16))
                                {
                                  v175 = 0;
                                  v179 = 0;
                                  v214 = 0;
                                  v168 = 0;
                                  v176 = 0;
                                  v213 = 0;
                                  v164 = 0;
                                  v170 = 0;
                                  v207 = 0;
                                  v162 = 0;
                                  v163 = 0;
                                  v206 = 0;
                                  v165 = 0;
                                  v171 = 0;
                                  v205 = 0;
                                  v166 = 0;
                                  v174 = 0;
                                  v204 = 0;
                                  v169 = 0;
                                  v177 = 0;
                                  v203 = 0;
                                  v172 = 0;
                                  v180 = 0;
                                  v202 = 0;
                                  v178 = 0;
                                  v183 = 0;
                                  v200 = 0;
                                  v182 = 0;
                                  v185 = 0;
                                  v199 = 0;
                                  v188 = 0;
                                  v190 = 0;
                                  v197 = 0;
                                  v192 = 0;
                                  v12 = 0;
                                  v13 = 0;
                                  v14 = 0;
                                  v15 = 0;
                                  v201 = 1;
                                  v198 = 1;
                                  v195 = 0;
                                  v196 = 1;
                                  v194[2] = 0x100000001;
                                  v194[1] = 0x100000001;
                                  v193 = 0;
                                  v194[0] = 0x100000001;
                                  v11 = 1;
                                  v189 = 1;
                                  v191 = 1;
                                  v186 = 1;
                                  v187 = 1;
                                  v181 = 1;
                                  v184 = 1;
                                  v173 = 1;
                                  v167 = 1;
                                }
                                else
                                {
                                  -[SFActionItem provider](self, "provider");
                                  v113 = (void *)objc_claimAutoreleasedReturnValue();
                                  v3 = v113 == 0;
                                  -[SFActionItem provider](v7, "provider");
                                  v112 = (void *)objc_claimAutoreleasedReturnValue();
                                  if ((_DWORD)v3 == (v112 != 0))
                                  {
                                    v179 = 0;
                                    v214 = 0;
                                    v168 = 0;
                                    v176 = 0;
                                    v213 = 0;
                                    v164 = 0;
                                    v170 = 0;
                                    v207 = 0;
                                    v162 = 0;
                                    v163 = 0;
                                    v206 = 0;
                                    v165 = 0;
                                    v171 = 0;
                                    v205 = 0;
                                    v166 = 0;
                                    v174 = 0;
                                    v204 = 0;
                                    v169 = 0;
                                    v177 = 0;
                                    v203 = 0;
                                    v172 = 0;
                                    v180 = 0;
                                    v202 = 0;
                                    v178 = 0;
                                    v183 = 0;
                                    v200 = 0;
                                    v182 = 0;
                                    v185 = 0;
                                    v199 = 0;
                                    v188 = 0;
                                    v190 = 0;
                                    v197 = 0;
                                    v192 = 0;
                                    v12 = 0;
                                    v13 = 0;
                                    v14 = 0;
                                    v15 = 0;
                                    v201 = 1;
                                    v198 = 1;
                                    v195 = 0;
                                    v196 = 1;
                                    v194[2] = 0x100000001;
                                    v194[1] = 0x100000001;
                                    v193 = 0;
                                    v194[0] = 0x100000001;
                                    v11 = 1;
                                    v189 = 1;
                                    v191 = 1;
                                    v186 = 1;
                                    v187 = 1;
                                    v181 = 1;
                                    v184 = 1;
                                    v173 = 1;
                                    v167 = 1;
                                    v175 = 1;
                                  }
                                  else
                                  {
                                    -[SFActionItem provider](self, "provider");
                                    v36 = objc_claimAutoreleasedReturnValue();
                                    v214 = v36 != 0;
                                    v111 = (void *)v36;
                                    if (!v36
                                      || (-[SFActionItem provider](self, "provider"),
                                          v3 = objc_claimAutoreleasedReturnValue(),
                                          -[SFActionItem provider](v7, "provider"),
                                          v107 = (void *)objc_claimAutoreleasedReturnValue(),
                                          v108 = (void *)v3,
                                          objc_msgSend((id)v3, "isEqual:")))
                                    {
                                      -[SFActionItem offerType](self, "offerType");
                                      v110 = (void *)objc_claimAutoreleasedReturnValue();
                                      v3 = v110 == 0;
                                      -[SFActionItem offerType](v7, "offerType");
                                      v109 = (void *)objc_claimAutoreleasedReturnValue();
                                      if ((_DWORD)v3 == (v109 != 0))
                                      {
                                        v176 = 0;
                                        v213 = 0;
                                        v164 = 0;
                                        v170 = 0;
                                        v207 = 0;
                                        v162 = 0;
                                        v163 = 0;
                                        v206 = 0;
                                        v165 = 0;
                                        v171 = 0;
                                        v205 = 0;
                                        v166 = 0;
                                        v174 = 0;
                                        v204 = 0;
                                        v169 = 0;
                                        v177 = 0;
                                        v203 = 0;
                                        v172 = 0;
                                        v180 = 0;
                                        v202 = 0;
                                        v178 = 0;
                                        v183 = 0;
                                        v200 = 0;
                                        v182 = 0;
                                        v185 = 0;
                                        v199 = 0;
                                        v188 = 0;
                                        v190 = 0;
                                        v197 = 0;
                                        v192 = 0;
                                        v12 = 0;
                                        v13 = 0;
                                        v14 = 0;
                                        v15 = 0;
                                        v201 = 1;
                                        v198 = 1;
                                        v195 = 0;
                                        v196 = 1;
                                        v194[2] = 0x100000001;
                                        v194[1] = 0x100000001;
                                        v193 = 0;
                                        v194[0] = 0x100000001;
                                        v11 = 1;
                                        v189 = 1;
                                        v191 = 1;
                                        v186 = 1;
                                        v187 = 1;
                                        v181 = 1;
                                        v184 = 1;
                                        v173 = 1;
                                        v167 = 1;
                                        v175 = 1;
                                        v179 = 1;
                                        v168 = 1;
                                      }
                                      else
                                      {
                                        -[SFActionItem offerType](self, "offerType");
                                        v37 = objc_claimAutoreleasedReturnValue();
                                        v213 = v37 != 0;
                                        v106 = (void *)v37;
                                        if (!v37
                                          || (-[SFActionItem offerType](self, "offerType"),
                                              v3 = objc_claimAutoreleasedReturnValue(),
                                              -[SFActionItem offerType](v7, "offerType"),
                                              v102 = (void *)objc_claimAutoreleasedReturnValue(),
                                              v103 = (void *)v3,
                                              objc_msgSend((id)v3, "isEqual:")))
                                        {
                                          -[SFActionItem type](self, "type");
                                          v105 = (void *)objc_claimAutoreleasedReturnValue();
                                          v3 = v105 == 0;
                                          -[SFActionItem type](v7, "type");
                                          v104 = (void *)objc_claimAutoreleasedReturnValue();
                                          if ((_DWORD)v3 == (v104 != 0))
                                          {
                                            v170 = 0;
                                            v207 = 0;
                                            v162 = 0;
                                            v163 = 0;
                                            v206 = 0;
                                            v165 = 0;
                                            v171 = 0;
                                            v205 = 0;
                                            v166 = 0;
                                            v174 = 0;
                                            v204 = 0;
                                            v169 = 0;
                                            v177 = 0;
                                            v203 = 0;
                                            v172 = 0;
                                            v180 = 0;
                                            v202 = 0;
                                            v178 = 0;
                                            v183 = 0;
                                            v200 = 0;
                                            v182 = 0;
                                            v185 = 0;
                                            v199 = 0;
                                            v188 = 0;
                                            v190 = 0;
                                            v197 = 0;
                                            v192 = 0;
                                            v12 = 0;
                                            v13 = 0;
                                            v14 = 0;
                                            v15 = 0;
                                            v201 = 1;
                                            v198 = 1;
                                            v195 = 0;
                                            v196 = 1;
                                            v194[2] = 0x100000001;
                                            v194[1] = 0x100000001;
                                            v193 = 0;
                                            v194[0] = 0x100000001;
                                            v11 = 1;
                                            v189 = 1;
                                            v191 = 1;
                                            v186 = 1;
                                            v187 = 1;
                                            v181 = 1;
                                            v184 = 1;
                                            v173 = 1;
                                            v167 = 1;
                                            v175 = 1;
                                            v179 = 1;
                                            v168 = 1;
                                            v176 = 1;
                                            v164 = 1;
                                          }
                                          else
                                          {
                                            -[SFActionItem type](self, "type");
                                            v38 = objc_claimAutoreleasedReturnValue();
                                            v207 = v38 != 0;
                                            v101 = (void *)v38;
                                            if (!v38
                                              || (-[SFActionItem type](self, "type"),
                                                  v3 = objc_claimAutoreleasedReturnValue(),
                                                  -[SFActionItem type](v7, "type"),
                                                  v99 = (void *)objc_claimAutoreleasedReturnValue(),
                                                  v100 = (void *)v3,
                                                  objc_msgSend((id)v3, "isEqual:")))
                                            {
                                              -[SFActionItem labelITunes](self, "labelITunes");
                                              v98 = (void *)objc_claimAutoreleasedReturnValue();
                                              v3 = v98 == 0;
                                              -[SFActionItem labelITunes](v7, "labelITunes");
                                              v97 = (void *)objc_claimAutoreleasedReturnValue();
                                              if ((_DWORD)v3 == (v97 != 0))
                                              {
                                                v163 = 0;
                                                v206 = 0;
                                                v165 = 0;
                                                v171 = 0;
                                                v205 = 0;
                                                v166 = 0;
                                                v174 = 0;
                                                v204 = 0;
                                                v169 = 0;
                                                v177 = 0;
                                                v203 = 0;
                                                v172 = 0;
                                                v180 = 0;
                                                v202 = 0;
                                                v178 = 0;
                                                v183 = 0;
                                                v200 = 0;
                                                v182 = 0;
                                                v185 = 0;
                                                v199 = 0;
                                                v188 = 0;
                                                v190 = 0;
                                                v197 = 0;
                                                v192 = 0;
                                                v12 = 0;
                                                v13 = 0;
                                                v14 = 0;
                                                v15 = 0;
                                                v201 = 1;
                                                v198 = 1;
                                                v195 = 0;
                                                v196 = 1;
                                                v194[2] = 0x100000001;
                                                v194[1] = 0x100000001;
                                                v193 = 0;
                                                v194[0] = 0x100000001;
                                                v11 = 1;
                                                v189 = 1;
                                                v191 = 1;
                                                v186 = 1;
                                                v187 = 1;
                                                v181 = 1;
                                                v184 = 1;
                                                v173 = 1;
                                                v167 = 1;
                                                v175 = 1;
                                                v179 = 1;
                                                v168 = 1;
                                                v176 = 1;
                                                v164 = 1;
                                                v170 = 1;
                                                v162 = 1;
                                              }
                                              else
                                              {
                                                -[SFActionItem labelITunes](self, "labelITunes");
                                                v39 = objc_claimAutoreleasedReturnValue();
                                                v206 = v39 != 0;
                                                v96 = (void *)v39;
                                                if (!v39
                                                  || (-[SFActionItem labelITunes](self, "labelITunes"),
                                                      v3 = objc_claimAutoreleasedReturnValue(),
                                                      -[SFActionItem labelITunes](v7, "labelITunes"),
                                                      v94 = (void *)objc_claimAutoreleasedReturnValue(),
                                                      v95 = (void *)v3,
                                                      objc_msgSend((id)v3, "isEqual:")))
                                                {
                                                  v3 = -[SFActionItem isITunes](self, "isITunes");
                                                  if ((_DWORD)v3 == -[SFActionItem isITunes](v7, "isITunes"))
                                                  {
                                                    -[SFActionItem icon](self, "icon");
                                                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                                                    v3 = v91 == 0;
                                                    -[SFActionItem icon](v7, "icon");
                                                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                                                    if ((_DWORD)v3 == (v88 != 0))
                                                    {
                                                      v171 = 0;
                                                      v205 = 0;
                                                      v166 = 0;
                                                      v174 = 0;
                                                      v204 = 0;
                                                      v169 = 0;
                                                      v177 = 0;
                                                      v203 = 0;
                                                      v172 = 0;
                                                      v180 = 0;
                                                      v202 = 0;
                                                      v178 = 0;
                                                      v183 = 0;
                                                      v200 = 0;
                                                      v182 = 0;
                                                      v185 = 0;
                                                      v199 = 0;
                                                      v188 = 0;
                                                      v190 = 0;
                                                      v197 = 0;
                                                      v192 = 0;
                                                      v12 = 0;
                                                      v13 = 0;
                                                      v14 = 0;
                                                      v15 = 0;
                                                      v201 = 1;
                                                      v198 = 1;
                                                      v195 = 0;
                                                      v196 = 1;
                                                      v194[2] = 0x100000001;
                                                      v194[1] = 0x100000001;
                                                      v193 = 0;
                                                      v194[0] = 0x100000001;
                                                      v11 = 1;
                                                      v189 = 1;
                                                      v191 = 1;
                                                      v186 = 1;
                                                      v187 = 1;
                                                      v181 = 1;
                                                      v184 = 1;
                                                      v173 = 1;
                                                      v167 = 1;
                                                      v175 = 1;
                                                      v179 = 1;
                                                      v168 = 1;
                                                      v176 = 1;
                                                      v164 = 1;
                                                      v170 = 1;
                                                      v162 = 1;
                                                      v163 = 1;
                                                      v165 = 1;
                                                    }
                                                    else
                                                    {
                                                      -[SFActionItem icon](self, "icon");
                                                      v40 = objc_claimAutoreleasedReturnValue();
                                                      v205 = v40 != 0;
                                                      v87 = (void *)v40;
                                                      if (!v40
                                                        || (-[SFActionItem icon](self, "icon"),
                                                            v3 = objc_claimAutoreleasedReturnValue(),
                                                            -[SFActionItem icon](v7, "icon"),
                                                            v92 = (void *)objc_claimAutoreleasedReturnValue(),
                                                            v93 = (void *)v3,
                                                            objc_msgSend((id)v3, "isEqual:")))
                                                      {
                                                        -[SFActionItem baseIcon](self, "baseIcon");
                                                        v86 = (void *)objc_claimAutoreleasedReturnValue();
                                                        v3 = v86 == 0;
                                                        -[SFActionItem baseIcon](v7, "baseIcon");
                                                        v84 = (void *)objc_claimAutoreleasedReturnValue();
                                                        if ((_DWORD)v3 == (v84 != 0))
                                                        {
                                                          v174 = 0;
                                                          v204 = 0;
                                                          v169 = 0;
                                                          v177 = 0;
                                                          v203 = 0;
                                                          v172 = 0;
                                                          v180 = 0;
                                                          v202 = 0;
                                                          v178 = 0;
                                                          v183 = 0;
                                                          v200 = 0;
                                                          v182 = 0;
                                                          v185 = 0;
                                                          v199 = 0;
                                                          v188 = 0;
                                                          v190 = 0;
                                                          v197 = 0;
                                                          v192 = 0;
                                                          v12 = 0;
                                                          v13 = 0;
                                                          v14 = 0;
                                                          v15 = 0;
                                                          v201 = 1;
                                                          v198 = 1;
                                                          v195 = 0;
                                                          v196 = 1;
                                                          v194[2] = 0x100000001;
                                                          v194[1] = 0x100000001;
                                                          v193 = 0;
                                                          v194[0] = 0x100000001;
                                                          v11 = 1;
                                                          v189 = 1;
                                                          v191 = 1;
                                                          v186 = 1;
                                                          v187 = 1;
                                                          v181 = 1;
                                                          v184 = 1;
                                                          v173 = 1;
                                                          v167 = 1;
                                                          v175 = 1;
                                                          v179 = 1;
                                                          v168 = 1;
                                                          v176 = 1;
                                                          v164 = 1;
                                                          v170 = 1;
                                                          v162 = 1;
                                                          v163 = 1;
                                                          v165 = 1;
                                                          v171 = 1;
                                                          v166 = 1;
                                                        }
                                                        else
                                                        {
                                                          -[SFActionItem baseIcon](self, "baseIcon");
                                                          v41 = objc_claimAutoreleasedReturnValue();
                                                          v204 = v41 != 0;
                                                          v82 = (void *)v41;
                                                          if (!v41
                                                            || (-[SFActionItem baseIcon](self, "baseIcon"),
                                                                v3 = objc_claimAutoreleasedReturnValue(),
                                                                -[SFActionItem baseIcon](v7, "baseIcon"),
                                                                v89 = (void *)objc_claimAutoreleasedReturnValue(),
                                                                v90 = (void *)v3,
                                                                objc_msgSend((id)v3, "isEqual:")))
                                                          {
                                                            -[SFActionItem location](self, "location");
                                                            v81 = (void *)objc_claimAutoreleasedReturnValue();
                                                            v3 = v81 == 0;
                                                            -[SFActionItem location](v7, "location");
                                                            v79 = (void *)objc_claimAutoreleasedReturnValue();
                                                            if ((_DWORD)v3 == (v79 != 0))
                                                            {
                                                              v177 = 0;
                                                              v203 = 0;
                                                              v172 = 0;
                                                              v180 = 0;
                                                              v202 = 0;
                                                              v178 = 0;
                                                              v183 = 0;
                                                              v200 = 0;
                                                              v182 = 0;
                                                              v185 = 0;
                                                              v199 = 0;
                                                              v188 = 0;
                                                              v190 = 0;
                                                              v197 = 0;
                                                              v192 = 0;
                                                              v12 = 0;
                                                              v13 = 0;
                                                              v14 = 0;
                                                              v15 = 0;
                                                              v201 = 1;
                                                              v198 = 1;
                                                              v195 = 0;
                                                              v196 = 1;
                                                              v194[2] = 0x100000001;
                                                              v194[1] = 0x100000001;
                                                              v193 = 0;
                                                              v194[0] = 0x100000001;
                                                              v11 = 1;
                                                              v189 = 1;
                                                              v191 = 1;
                                                              v186 = 1;
                                                              v187 = 1;
                                                              v181 = 1;
                                                              v184 = 1;
                                                              v173 = 1;
                                                              v167 = 1;
                                                              v175 = 1;
                                                              v179 = 1;
                                                              v168 = 1;
                                                              v176 = 1;
                                                              v164 = 1;
                                                              v170 = 1;
                                                              v162 = 1;
                                                              v163 = 1;
                                                              v165 = 1;
                                                              v171 = 1;
                                                              v166 = 1;
                                                              v174 = 1;
                                                              v169 = 1;
                                                            }
                                                            else
                                                            {
                                                              -[SFActionItem location](self, "location");
                                                              v42 = objc_claimAutoreleasedReturnValue();
                                                              v203 = v42 != 0;
                                                              v77 = (void *)v42;
                                                              if (!v42
                                                                || (-[SFActionItem location](self, "location"),
                                                                    v3 = objc_claimAutoreleasedReturnValue(),
                                                                    -[SFActionItem location](v7, "location"),
                                                                    v85 = (void *)v3,
                                                                    v83 = (void *)objc_claimAutoreleasedReturnValue(),
                                                                    objc_msgSend((id)v3, "isEqual:")))
                                                              {
                                                                -[SFActionItem messageIdentifier](self, "messageIdentifier");
                                                                v76 = (void *)objc_claimAutoreleasedReturnValue();
                                                                v3 = v76 == 0;
                                                                -[SFActionItem messageIdentifier](v7, "messageIdentifier");
                                                                v75 = (void *)objc_claimAutoreleasedReturnValue();
                                                                if ((_DWORD)v3 == (v75 != 0))
                                                                {
                                                                  v180 = 0;
                                                                  v202 = 0;
                                                                  v178 = 0;
                                                                  v183 = 0;
                                                                  v200 = 0;
                                                                  v182 = 0;
                                                                  v185 = 0;
                                                                  v199 = 0;
                                                                  v188 = 0;
                                                                  v190 = 0;
                                                                  v197 = 0;
                                                                  v192 = 0;
                                                                  v12 = 0;
                                                                  v13 = 0;
                                                                  v14 = 0;
                                                                  v15 = 0;
                                                                  v201 = 1;
                                                                  v198 = 1;
                                                                  v195 = 0;
                                                                  v196 = 1;
                                                                  v194[2] = 0x100000001;
                                                                  v194[1] = 0x100000001;
                                                                  v193 = 0;
                                                                  v194[0] = 0x100000001;
                                                                  v11 = 1;
                                                                  v189 = 1;
                                                                  v191 = 1;
                                                                  v186 = 1;
                                                                  v187 = 1;
                                                                  v181 = 1;
                                                                  v184 = 1;
                                                                  v173 = 1;
                                                                  v167 = 1;
                                                                  v175 = 1;
                                                                  v179 = 1;
                                                                  v168 = 1;
                                                                  v176 = 1;
                                                                  v164 = 1;
                                                                  v170 = 1;
                                                                  v162 = 1;
                                                                  v163 = 1;
                                                                  v165 = 1;
                                                                  v171 = 1;
                                                                  v166 = 1;
                                                                  v174 = 1;
                                                                  v169 = 1;
                                                                  v177 = 1;
                                                                  v172 = 1;
                                                                }
                                                                else
                                                                {
                                                                  -[SFActionItem messageIdentifier](self, "messageIdentifier");
                                                                  v43 = objc_claimAutoreleasedReturnValue();
                                                                  v202 = v43 != 0;
                                                                  v72 = (void *)v43;
                                                                  if (!v43
                                                                    || (-[SFActionItem messageIdentifier](self, "messageIdentifier"), v3 = objc_claimAutoreleasedReturnValue(), -[SFActionItem messageIdentifier](v7, "messageIdentifier"), v80 = (void *)v3, v78 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend((id)v3, "isEqual:")))
                                                                  {
                                                                    -[SFActionItem messageURL](self, "messageURL");
                                                                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    v3 = v71 == 0;
                                                                    -[SFActionItem messageURL](v7, "messageURL");
                                                                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                                                                    if ((_DWORD)v3 == (v70 != 0))
                                                                    {
                                                                      v183 = 0;
                                                                      v200 = 0;
                                                                      v182 = 0;
                                                                      v185 = 0;
                                                                      v199 = 0;
                                                                      v188 = 0;
                                                                      v190 = 0;
                                                                      v197 = 0;
                                                                      v192 = 0;
                                                                      v12 = 0;
                                                                      v13 = 0;
                                                                      v14 = 0;
                                                                      v15 = 0;
                                                                      v201 = 1;
                                                                      v198 = 1;
                                                                      v195 = 0;
                                                                      v196 = 1;
                                                                      v194[2] = 0x100000001;
                                                                      v194[1] = 0x100000001;
                                                                      v193 = 0;
                                                                      v194[0] = 0x100000001;
                                                                      v11 = 1;
                                                                      v189 = 1;
                                                                      v191 = 1;
                                                                      v186 = 1;
                                                                      v187 = 1;
                                                                      v181 = 1;
                                                                      v184 = 1;
                                                                      v173 = 1;
                                                                      v167 = 1;
                                                                      v175 = 1;
                                                                      v179 = 1;
                                                                      v168 = 1;
                                                                      v176 = 1;
                                                                      v164 = 1;
                                                                      v170 = 1;
                                                                      v162 = 1;
                                                                      v163 = 1;
                                                                      v165 = 1;
                                                                      v171 = 1;
                                                                      v166 = 1;
                                                                      v174 = 1;
                                                                      v169 = 1;
                                                                      v177 = 1;
                                                                      v172 = 1;
                                                                      v180 = 1;
                                                                      v178 = 1;
                                                                    }
                                                                    else
                                                                    {
                                                                      -[SFActionItem messageURL](self, "messageURL");
                                                                      v44 = objc_claimAutoreleasedReturnValue();
                                                                      v200 = v44 != 0;
                                                                      v67 = (void *)v44;
                                                                      if (!v44
                                                                        || (-[SFActionItem messageURL](self, "messageURL"), v3 = objc_claimAutoreleasedReturnValue(), -[SFActionItem messageURL](v7, "messageURL"), v73 = (void *)objc_claimAutoreleasedReturnValue(), v74 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                                      {
                                                                        -[SFActionItem persistentID](self, "persistentID");
                                                                        v66 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        v3 = v66 == 0;
                                                                        -[SFActionItem persistentID](v7, "persistentID");
                                                                        v65 = (void *)objc_claimAutoreleasedReturnValue();
                                                                        if ((_DWORD)v3 == (v65 != 0))
                                                                        {
                                                                          v185 = 0;
                                                                          v199 = 0;
                                                                          v188 = 0;
                                                                          v190 = 0;
                                                                          v197 = 0;
                                                                          v192 = 0;
                                                                          v12 = 0;
                                                                          v13 = 0;
                                                                          v14 = 0;
                                                                          v15 = 0;
                                                                          v201 = 1;
                                                                          v198 = 1;
                                                                          v195 = 0;
                                                                          v196 = 1;
                                                                          v194[2] = 0x100000001;
                                                                          v194[1] = 0x100000001;
                                                                          v193 = 0;
                                                                          v194[0] = 0x100000001;
                                                                          v11 = 1;
                                                                          v189 = 1;
                                                                          v191 = 1;
                                                                          v186 = 1;
                                                                          v187 = 1;
                                                                          v181 = 1;
                                                                          v184 = 1;
                                                                          v173 = 1;
                                                                          v167 = 1;
                                                                          v175 = 1;
                                                                          v179 = 1;
                                                                          v168 = 1;
                                                                          v176 = 1;
                                                                          v164 = 1;
                                                                          v170 = 1;
                                                                          v162 = 1;
                                                                          v163 = 1;
                                                                          v165 = 1;
                                                                          v171 = 1;
                                                                          v166 = 1;
                                                                          v174 = 1;
                                                                          v169 = 1;
                                                                          v177 = 1;
                                                                          v172 = 1;
                                                                          v180 = 1;
                                                                          v178 = 1;
                                                                          v183 = 1;
                                                                          v182 = 1;
                                                                        }
                                                                        else
                                                                        {
                                                                          -[SFActionItem persistentID](self, "persistentID");
                                                                          v45 = objc_claimAutoreleasedReturnValue();
                                                                          v199 = v45 != 0;
                                                                          v64 = (void *)v45;
                                                                          if (!v45
                                                                            || (-[SFActionItem persistentID](self, "persistentID"), v3 = objc_claimAutoreleasedReturnValue(), -[SFActionItem persistentID](v7, "persistentID"), v68 = (void *)objc_claimAutoreleasedReturnValue(), v69 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                                          {
                                                                            v3 = -[SFActionItem mediaEntityType](self, "mediaEntityType");
                                                                            if ((_DWORD)v3 == -[SFActionItem mediaEntityType](v7, "mediaEntityType"))
                                                                            {
                                                                              -[SFActionItem universalLibraryID](self, "universalLibraryID");
                                                                              v61 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              v3 = v61 == 0;
                                                                              -[SFActionItem universalLibraryID](v7, "universalLibraryID");
                                                                              v60 = (void *)objc_claimAutoreleasedReturnValue();
                                                                              if ((_DWORD)v3 == (v60 != 0))
                                                                              {
                                                                                v190 = 0;
                                                                                v197 = 0;
                                                                                v192 = 0;
                                                                                v12 = 0;
                                                                                v13 = 0;
                                                                                v14 = 0;
                                                                                v15 = 0;
                                                                                v201 = 1;
                                                                                v198 = 1;
                                                                                v195 = 0;
                                                                                v196 = 1;
                                                                                v194[2] = 0x100000001;
                                                                                v194[1] = 0x100000001;
                                                                                v193 = 0;
                                                                                v194[0] = 0x100000001;
                                                                                v11 = 1;
                                                                                v189 = 1;
                                                                                v191 = 1;
                                                                                v186 = 1;
                                                                                v187 = 1;
                                                                                v181 = 1;
                                                                                v184 = 1;
                                                                                v173 = 1;
                                                                                v167 = 1;
                                                                                v175 = 1;
                                                                                v179 = 1;
                                                                                v168 = 1;
                                                                                v176 = 1;
                                                                                v164 = 1;
                                                                                v170 = 1;
                                                                                v162 = 1;
                                                                                v163 = 1;
                                                                                v165 = 1;
                                                                                v171 = 1;
                                                                                v166 = 1;
                                                                                v174 = 1;
                                                                                v169 = 1;
                                                                                v177 = 1;
                                                                                v172 = 1;
                                                                                v180 = 1;
                                                                                v178 = 1;
                                                                                v183 = 1;
                                                                                v182 = 1;
                                                                                v185 = 1;
                                                                                v188 = 1;
                                                                              }
                                                                              else
                                                                              {
                                                                                -[SFActionItem universalLibraryID](self, "universalLibraryID");
                                                                                v46 = objc_claimAutoreleasedReturnValue();
                                                                                v197 = v46 != 0;
                                                                                v59 = (void *)v46;
                                                                                if (!v46
                                                                                  || (-[SFActionItem universalLibraryID](self, "universalLibraryID"), v3 = objc_claimAutoreleasedReturnValue(), -[SFActionItem universalLibraryID](v7, "universalLibraryID"), v62 = (void *)objc_claimAutoreleasedReturnValue(), v63 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                                                {
                                                                                  -[SFActionItem interactionContentType](self, "interactionContentType");
                                                                                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                  v3 = v56 == 0;
                                                                                  -[SFActionItem interactionContentType](v7, "interactionContentType");
                                                                                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                  if ((_DWORD)v3 == (v55 != 0))
                                                                                  {
                                                                                    v12 = 0;
                                                                                    v13 = 0;
                                                                                    v14 = 0;
                                                                                    v15 = 0;
                                                                                    v201 = 1;
                                                                                    v198 = 1;
                                                                                    v195 = 0;
                                                                                    v196 = 1;
                                                                                    v194[2] = 0x100000001;
                                                                                    v194[1] = 0x100000001;
                                                                                    v193 = 0;
                                                                                    v194[0] = 0x100000001;
                                                                                    v11 = 1;
                                                                                    v189 = 1;
                                                                                    v191 = 1;
                                                                                    v186 = 1;
                                                                                    v187 = 1;
                                                                                    v181 = 1;
                                                                                    v184 = 1;
                                                                                    v173 = 1;
                                                                                    v167 = 1;
                                                                                    v175 = 1;
                                                                                    v179 = 1;
                                                                                    v168 = 1;
                                                                                    v176 = 1;
                                                                                    v164 = 1;
                                                                                    v170 = 1;
                                                                                    v162 = 1;
                                                                                    v163 = 1;
                                                                                    v165 = 1;
                                                                                    v171 = 1;
                                                                                    v166 = 1;
                                                                                    v174 = 1;
                                                                                    v169 = 1;
                                                                                    v177 = 1;
                                                                                    v172 = 1;
                                                                                    v180 = 1;
                                                                                    v178 = 1;
                                                                                    v183 = 1;
                                                                                    v182 = 1;
                                                                                    v185 = 1;
                                                                                    v188 = 1;
                                                                                    v190 = 1;
                                                                                    v192 = 1;
                                                                                  }
                                                                                  else
                                                                                  {
                                                                                    -[SFActionItem interactionContentType](self, "interactionContentType");
                                                                                    v47 = objc_claimAutoreleasedReturnValue();
                                                                                    v195 = v47 != 0;
                                                                                    v54 = (void *)v47;
                                                                                    if (!v47
                                                                                      || (-[SFActionItem interactionContentType](self, "interactionContentType"), v3 = objc_claimAutoreleasedReturnValue(), -[SFActionItem interactionContentType](v7, "interactionContentType"), v57 = (void *)objc_claimAutoreleasedReturnValue(), v58 = (void *)v3, objc_msgSend((id)v3, "isEqual:")))
                                                                                    {
                                                                                      -[SFActionItem customDirectionsPunchout](self, "customDirectionsPunchout");
                                                                                      v4 = objc_claimAutoreleasedReturnValue();
                                                                                      v3 = v4 == 0;
                                                                                      -[SFActionItem customDirectionsPunchout](v7, "customDirectionsPunchout");
                                                                                      v8 = (void *)objc_claimAutoreleasedReturnValue();
                                                                                      if ((_DWORD)v3 == (v8 != 0))
                                                                                      {
                                                                                        v13 = 0;
                                                                                        v14 = 0;
                                                                                        v15 = 0;
                                                                                        v201 = 1;
                                                                                        v198 = 1;
                                                                                        v196 = 1;
                                                                                        v194[2] = 0x100000001;
                                                                                        v194[1] = 0x100000001;
                                                                                        v194[0] = 0x100000001;
                                                                                        v11 = 1;
                                                                                        v189 = 1;
                                                                                        v191 = 1;
                                                                                        v186 = 1;
                                                                                        v187 = 1;
                                                                                        v181 = 1;
                                                                                        v184 = 1;
                                                                                        v173 = 1;
                                                                                        v167 = 1;
                                                                                        v175 = 1;
                                                                                        v179 = 1;
                                                                                        v168 = 1;
                                                                                        v176 = 1;
                                                                                        v164 = 1;
                                                                                        v170 = 1;
                                                                                        v162 = 1;
                                                                                        v163 = 1;
                                                                                        v165 = 1;
                                                                                        v171 = 1;
                                                                                        v166 = 1;
                                                                                        v174 = 1;
                                                                                        v169 = 1;
                                                                                        v177 = 1;
                                                                                        v172 = 1;
                                                                                        v180 = 1;
                                                                                        v178 = 1;
                                                                                        v183 = 1;
                                                                                        v182 = 1;
                                                                                        v185 = 1;
                                                                                        v188 = 1;
                                                                                        v190 = 1;
                                                                                        v192 = 1;
                                                                                        v193 = 1;
                                                                                        v12 = 1;
                                                                                      }
                                                                                      else
                                                                                      {
                                                                                        -[SFActionItem customDirectionsPunchout](self, "customDirectionsPunchout");
                                                                                        v9 = objc_claimAutoreleasedReturnValue();
                                                                                        if (!v9
                                                                                          || (-[SFActionItem customDirectionsPunchout](self, "customDirectionsPunchout"), v48 = (void *)objc_claimAutoreleasedReturnValue(), -[SFActionItem customDirectionsPunchout](v7, "customDirectionsPunchout"), v3 = objc_claimAutoreleasedReturnValue(), v53 = v48, objc_msgSend(v48, "isEqual:", v3)))
                                                                                        {
                                                                                          LODWORD(v51) = v9 != 0;
                                                                                          v49 = -[SFActionItem shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute", v51);
                                                                                          if (v49 == -[SFActionItem shouldSearchDirectionsAlongCurrentRoute](v7, "shouldSearchDirectionsAlongCurrentRoute"))
                                                                                          {
                                                                                            v50 = -[SFActionItem directionsMode](self, "directionsMode");
                                                                                            v15 = v50 == -[SFActionItem directionsMode](v7, "directionsMode");
                                                                                          }
                                                                                          else
                                                                                          {
                                                                                            v15 = 0;
                                                                                          }
                                                                                          v201 = 1;
                                                                                          v198 = 1;
                                                                                          v196 = 1;
                                                                                          v194[2] = 0x100000001;
                                                                                          v194[1] = 0x100000001;
                                                                                          v194[0] = 0x100000001;
                                                                                          v11 = 1;
                                                                                          v189 = 1;
                                                                                          v191 = 1;
                                                                                          v186 = 1;
                                                                                          v187 = 1;
                                                                                          v181 = 1;
                                                                                          v184 = 1;
                                                                                          v173 = 1;
                                                                                          v167 = 1;
                                                                                          v175 = 1;
                                                                                          v179 = 1;
                                                                                          v168 = 1;
                                                                                          v176 = 1;
                                                                                          v164 = 1;
                                                                                          v170 = 1;
                                                                                          v162 = 1;
                                                                                          v163 = 1;
                                                                                          v165 = 1;
                                                                                          v171 = 1;
                                                                                          v166 = 1;
                                                                                          v174 = 1;
                                                                                          v169 = 1;
                                                                                          v177 = 1;
                                                                                          v172 = 1;
                                                                                          v180 = 1;
                                                                                          v178 = 1;
                                                                                          v183 = 1;
                                                                                          v182 = 1;
                                                                                          v185 = 1;
                                                                                          v188 = 1;
                                                                                          v190 = 1;
                                                                                          v192 = 1;
                                                                                          v193 = 1;
                                                                                          v12 = 1;
                                                                                          v13 = 1;
                                                                                          v14 = v52;
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                          v15 = 0;
                                                                                          v201 = 1;
                                                                                          v198 = 1;
                                                                                          v196 = 1;
                                                                                          v194[2] = 0x100000001;
                                                                                          v194[1] = 0x100000001;
                                                                                          v194[0] = 0x100000001;
                                                                                          v11 = 1;
                                                                                          v189 = 1;
                                                                                          v191 = 1;
                                                                                          v186 = 1;
                                                                                          v187 = 1;
                                                                                          v181 = 1;
                                                                                          v184 = 1;
                                                                                          v173 = 1;
                                                                                          v167 = 1;
                                                                                          v175 = 1;
                                                                                          v179 = 1;
                                                                                          v168 = 1;
                                                                                          v176 = 1;
                                                                                          v164 = 1;
                                                                                          v170 = 1;
                                                                                          v162 = 1;
                                                                                          v163 = 1;
                                                                                          v165 = 1;
                                                                                          v171 = 1;
                                                                                          v166 = 1;
                                                                                          v174 = 1;
                                                                                          v169 = 1;
                                                                                          v177 = 1;
                                                                                          v172 = 1;
                                                                                          v180 = 1;
                                                                                          v178 = 1;
                                                                                          v183 = 1;
                                                                                          v182 = 1;
                                                                                          v185 = 1;
                                                                                          v188 = 1;
                                                                                          v190 = 1;
                                                                                          v192 = 1;
                                                                                          v193 = 1;
                                                                                          v12 = 1;
                                                                                          v13 = 1;
                                                                                          v14 = 1;
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                      v12 = 0;
                                                                                      v13 = 0;
                                                                                      v14 = 0;
                                                                                      v15 = 0;
                                                                                      v201 = 1;
                                                                                      v198 = 1;
                                                                                      v196 = 1;
                                                                                      v194[2] = 0x100000001;
                                                                                      v194[1] = 0x100000001;
                                                                                      v194[0] = 0x100000001;
                                                                                      v11 = 1;
                                                                                      v189 = 1;
                                                                                      v191 = 1;
                                                                                      v186 = 1;
                                                                                      v187 = 1;
                                                                                      v181 = 1;
                                                                                      v184 = 1;
                                                                                      v173 = 1;
                                                                                      v167 = 1;
                                                                                      v175 = 1;
                                                                                      v179 = 1;
                                                                                      v168 = 1;
                                                                                      v176 = 1;
                                                                                      v164 = 1;
                                                                                      v170 = 1;
                                                                                      v162 = 1;
                                                                                      v163 = 1;
                                                                                      v165 = 1;
                                                                                      v171 = 1;
                                                                                      v166 = 1;
                                                                                      v174 = 1;
                                                                                      v169 = 1;
                                                                                      v177 = 1;
                                                                                      v172 = 1;
                                                                                      v180 = 1;
                                                                                      v178 = 1;
                                                                                      v183 = 1;
                                                                                      v182 = 1;
                                                                                      v185 = 1;
                                                                                      v188 = 1;
                                                                                      v190 = 1;
                                                                                      v192 = 1;
                                                                                      v193 = 1;
                                                                                      v195 = 1;
                                                                                    }
                                                                                  }
                                                                                }
                                                                                else
                                                                                {
                                                                                  v192 = 0;
                                                                                  v12 = 0;
                                                                                  v13 = 0;
                                                                                  v14 = 0;
                                                                                  v15 = 0;
                                                                                  v201 = 1;
                                                                                  v198 = 1;
                                                                                  v195 = 0;
                                                                                  v196 = 1;
                                                                                  v194[2] = 0x100000001;
                                                                                  v194[1] = 0x100000001;
                                                                                  v193 = 0;
                                                                                  v194[0] = 0x100000001;
                                                                                  v11 = 1;
                                                                                  v189 = 1;
                                                                                  v191 = 1;
                                                                                  v186 = 1;
                                                                                  v187 = 1;
                                                                                  v181 = 1;
                                                                                  v184 = 1;
                                                                                  v173 = 1;
                                                                                  v167 = 1;
                                                                                  v175 = 1;
                                                                                  v179 = 1;
                                                                                  v168 = 1;
                                                                                  v176 = 1;
                                                                                  v164 = 1;
                                                                                  v170 = 1;
                                                                                  v162 = 1;
                                                                                  v163 = 1;
                                                                                  v165 = 1;
                                                                                  v171 = 1;
                                                                                  v166 = 1;
                                                                                  v174 = 1;
                                                                                  v169 = 1;
                                                                                  v177 = 1;
                                                                                  v172 = 1;
                                                                                  v180 = 1;
                                                                                  v178 = 1;
                                                                                  v183 = 1;
                                                                                  v182 = 1;
                                                                                  v185 = 1;
                                                                                  v188 = 1;
                                                                                  v190 = 1;
                                                                                  v197 = 1;
                                                                                }
                                                                              }
                                                                            }
                                                                            else
                                                                            {
                                                                              v188 = 0;
                                                                              v190 = 0;
                                                                              v197 = 0;
                                                                              v192 = 0;
                                                                              v12 = 0;
                                                                              v13 = 0;
                                                                              v14 = 0;
                                                                              v15 = 0;
                                                                              v201 = 1;
                                                                              v198 = 1;
                                                                              v195 = 0;
                                                                              v196 = 1;
                                                                              v194[2] = 0x100000001;
                                                                              v194[1] = 0x100000001;
                                                                              v193 = 0;
                                                                              v194[0] = 0x100000001;
                                                                              v11 = 1;
                                                                              v189 = 1;
                                                                              v191 = 1;
                                                                              v186 = 1;
                                                                              v187 = 1;
                                                                              v181 = 1;
                                                                              v184 = 1;
                                                                              v173 = 1;
                                                                              v167 = 1;
                                                                              v175 = 1;
                                                                              v179 = 1;
                                                                              v168 = 1;
                                                                              v176 = 1;
                                                                              v164 = 1;
                                                                              v170 = 1;
                                                                              v162 = 1;
                                                                              v163 = 1;
                                                                              v165 = 1;
                                                                              v171 = 1;
                                                                              v166 = 1;
                                                                              v174 = 1;
                                                                              v169 = 1;
                                                                              v177 = 1;
                                                                              v172 = 1;
                                                                              v180 = 1;
                                                                              v178 = 1;
                                                                              v183 = 1;
                                                                              v182 = 1;
                                                                              v185 = 1;
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            v188 = 0;
                                                                            v190 = 0;
                                                                            v197 = 0;
                                                                            v192 = 0;
                                                                            v12 = 0;
                                                                            v13 = 0;
                                                                            v14 = 0;
                                                                            v15 = 0;
                                                                            v201 = 1;
                                                                            v198 = 1;
                                                                            v195 = 0;
                                                                            v196 = 1;
                                                                            v194[2] = 0x100000001;
                                                                            v194[1] = 0x100000001;
                                                                            v193 = 0;
                                                                            v194[0] = 0x100000001;
                                                                            v11 = 1;
                                                                            v189 = 1;
                                                                            v191 = 1;
                                                                            v186 = 1;
                                                                            v187 = 1;
                                                                            v181 = 1;
                                                                            v184 = 1;
                                                                            v173 = 1;
                                                                            v167 = 1;
                                                                            v175 = 1;
                                                                            v179 = 1;
                                                                            v168 = 1;
                                                                            v176 = 1;
                                                                            v164 = 1;
                                                                            v170 = 1;
                                                                            v162 = 1;
                                                                            v163 = 1;
                                                                            v165 = 1;
                                                                            v171 = 1;
                                                                            v166 = 1;
                                                                            v174 = 1;
                                                                            v169 = 1;
                                                                            v177 = 1;
                                                                            v172 = 1;
                                                                            v180 = 1;
                                                                            v178 = 1;
                                                                            v183 = 1;
                                                                            v182 = 1;
                                                                            v185 = 1;
                                                                            v199 = 1;
                                                                          }
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v182 = 0;
                                                                        v185 = 0;
                                                                        v199 = 0;
                                                                        v188 = 0;
                                                                        v190 = 0;
                                                                        v197 = 0;
                                                                        v192 = 0;
                                                                        v12 = 0;
                                                                        v13 = 0;
                                                                        v14 = 0;
                                                                        v15 = 0;
                                                                        v201 = 1;
                                                                        v198 = 1;
                                                                        v195 = 0;
                                                                        v196 = 1;
                                                                        v194[2] = 0x100000001;
                                                                        v194[1] = 0x100000001;
                                                                        v193 = 0;
                                                                        v194[0] = 0x100000001;
                                                                        v11 = 1;
                                                                        v189 = 1;
                                                                        v191 = 1;
                                                                        v186 = 1;
                                                                        v187 = 1;
                                                                        v181 = 1;
                                                                        v184 = 1;
                                                                        v173 = 1;
                                                                        v167 = 1;
                                                                        v175 = 1;
                                                                        v179 = 1;
                                                                        v168 = 1;
                                                                        v176 = 1;
                                                                        v164 = 1;
                                                                        v170 = 1;
                                                                        v162 = 1;
                                                                        v163 = 1;
                                                                        v165 = 1;
                                                                        v171 = 1;
                                                                        v166 = 1;
                                                                        v174 = 1;
                                                                        v169 = 1;
                                                                        v177 = 1;
                                                                        v172 = 1;
                                                                        v180 = 1;
                                                                        v178 = 1;
                                                                        v183 = 1;
                                                                        v200 = 1;
                                                                      }
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    v178 = 0;
                                                                    v183 = 0;
                                                                    v200 = 0;
                                                                    v182 = 0;
                                                                    v185 = 0;
                                                                    v199 = 0;
                                                                    v188 = 0;
                                                                    v190 = 0;
                                                                    v197 = 0;
                                                                    v192 = 0;
                                                                    v12 = 0;
                                                                    v13 = 0;
                                                                    v14 = 0;
                                                                    v15 = 0;
                                                                    v201 = 1;
                                                                    v198 = 1;
                                                                    v195 = 0;
                                                                    v196 = 1;
                                                                    v194[2] = 0x100000001;
                                                                    v194[1] = 0x100000001;
                                                                    v193 = 0;
                                                                    v194[0] = 0x100000001;
                                                                    v11 = 1;
                                                                    v189 = 1;
                                                                    v191 = 1;
                                                                    v186 = 1;
                                                                    v187 = 1;
                                                                    v181 = 1;
                                                                    v184 = 1;
                                                                    v173 = 1;
                                                                    v167 = 1;
                                                                    v175 = 1;
                                                                    v179 = 1;
                                                                    v168 = 1;
                                                                    v176 = 1;
                                                                    v164 = 1;
                                                                    v170 = 1;
                                                                    v162 = 1;
                                                                    v163 = 1;
                                                                    v165 = 1;
                                                                    v171 = 1;
                                                                    v166 = 1;
                                                                    v174 = 1;
                                                                    v169 = 1;
                                                                    v177 = 1;
                                                                    v172 = 1;
                                                                    v180 = 1;
                                                                    v202 = 1;
                                                                  }
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v172 = 0;
                                                                v180 = 0;
                                                                v202 = 0;
                                                                v178 = 0;
                                                                v183 = 0;
                                                                v200 = 0;
                                                                v182 = 0;
                                                                v185 = 0;
                                                                v199 = 0;
                                                                v188 = 0;
                                                                v190 = 0;
                                                                v197 = 0;
                                                                v192 = 0;
                                                                v12 = 0;
                                                                v13 = 0;
                                                                v14 = 0;
                                                                v15 = 0;
                                                                v201 = 1;
                                                                v198 = 1;
                                                                v195 = 0;
                                                                v196 = 1;
                                                                v194[2] = 0x100000001;
                                                                v194[1] = 0x100000001;
                                                                v193 = 0;
                                                                v194[0] = 0x100000001;
                                                                v11 = 1;
                                                                v189 = 1;
                                                                v191 = 1;
                                                                v186 = 1;
                                                                v187 = 1;
                                                                v181 = 1;
                                                                v184 = 1;
                                                                v173 = 1;
                                                                v167 = 1;
                                                                v175 = 1;
                                                                v179 = 1;
                                                                v168 = 1;
                                                                v176 = 1;
                                                                v164 = 1;
                                                                v170 = 1;
                                                                v162 = 1;
                                                                v163 = 1;
                                                                v165 = 1;
                                                                v171 = 1;
                                                                v166 = 1;
                                                                v174 = 1;
                                                                v169 = 1;
                                                                v177 = 1;
                                                                v203 = 1;
                                                              }
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v169 = 0;
                                                            v177 = 0;
                                                            v203 = 0;
                                                            v172 = 0;
                                                            v180 = 0;
                                                            v202 = 0;
                                                            v178 = 0;
                                                            v183 = 0;
                                                            v200 = 0;
                                                            v182 = 0;
                                                            v185 = 0;
                                                            v199 = 0;
                                                            v188 = 0;
                                                            v190 = 0;
                                                            v197 = 0;
                                                            v192 = 0;
                                                            v12 = 0;
                                                            v13 = 0;
                                                            v14 = 0;
                                                            v15 = 0;
                                                            v201 = 1;
                                                            v198 = 1;
                                                            v195 = 0;
                                                            v196 = 1;
                                                            v194[2] = 0x100000001;
                                                            v194[1] = 0x100000001;
                                                            v193 = 0;
                                                            v194[0] = 0x100000001;
                                                            v11 = 1;
                                                            v189 = 1;
                                                            v191 = 1;
                                                            v186 = 1;
                                                            v187 = 1;
                                                            v181 = 1;
                                                            v184 = 1;
                                                            v173 = 1;
                                                            v167 = 1;
                                                            v175 = 1;
                                                            v179 = 1;
                                                            v168 = 1;
                                                            v176 = 1;
                                                            v164 = 1;
                                                            v170 = 1;
                                                            v162 = 1;
                                                            v163 = 1;
                                                            v165 = 1;
                                                            v171 = 1;
                                                            v166 = 1;
                                                            v174 = 1;
                                                            v204 = 1;
                                                          }
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v166 = 0;
                                                        v174 = 0;
                                                        v204 = 0;
                                                        v169 = 0;
                                                        v177 = 0;
                                                        v203 = 0;
                                                        v172 = 0;
                                                        v180 = 0;
                                                        v202 = 0;
                                                        v178 = 0;
                                                        v183 = 0;
                                                        v200 = 0;
                                                        v182 = 0;
                                                        v185 = 0;
                                                        v199 = 0;
                                                        v188 = 0;
                                                        v190 = 0;
                                                        v197 = 0;
                                                        v192 = 0;
                                                        v12 = 0;
                                                        v13 = 0;
                                                        v14 = 0;
                                                        v15 = 0;
                                                        v201 = 1;
                                                        v198 = 1;
                                                        v195 = 0;
                                                        v196 = 1;
                                                        v194[2] = 0x100000001;
                                                        v194[1] = 0x100000001;
                                                        v193 = 0;
                                                        v194[0] = 0x100000001;
                                                        v11 = 1;
                                                        v189 = 1;
                                                        v191 = 1;
                                                        v186 = 1;
                                                        v187 = 1;
                                                        v181 = 1;
                                                        v184 = 1;
                                                        v173 = 1;
                                                        v167 = 1;
                                                        v175 = 1;
                                                        v179 = 1;
                                                        v168 = 1;
                                                        v176 = 1;
                                                        v164 = 1;
                                                        v170 = 1;
                                                        v162 = 1;
                                                        v163 = 1;
                                                        v165 = 1;
                                                        v171 = 1;
                                                        v205 = 1;
                                                      }
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v165 = 0;
                                                    v171 = 0;
                                                    v205 = 0;
                                                    v166 = 0;
                                                    v174 = 0;
                                                    v204 = 0;
                                                    v169 = 0;
                                                    v177 = 0;
                                                    v203 = 0;
                                                    v172 = 0;
                                                    v180 = 0;
                                                    v202 = 0;
                                                    v178 = 0;
                                                    v183 = 0;
                                                    v200 = 0;
                                                    v182 = 0;
                                                    v185 = 0;
                                                    v199 = 0;
                                                    v188 = 0;
                                                    v190 = 0;
                                                    v197 = 0;
                                                    v192 = 0;
                                                    v12 = 0;
                                                    v13 = 0;
                                                    v14 = 0;
                                                    v15 = 0;
                                                    v201 = 1;
                                                    v198 = 1;
                                                    v195 = 0;
                                                    v196 = 1;
                                                    v194[2] = 0x100000001;
                                                    v194[1] = 0x100000001;
                                                    v193 = 0;
                                                    v194[0] = 0x100000001;
                                                    v11 = 1;
                                                    v189 = 1;
                                                    v191 = 1;
                                                    v186 = 1;
                                                    v187 = 1;
                                                    v181 = 1;
                                                    v184 = 1;
                                                    v173 = 1;
                                                    v167 = 1;
                                                    v175 = 1;
                                                    v179 = 1;
                                                    v168 = 1;
                                                    v176 = 1;
                                                    v164 = 1;
                                                    v170 = 1;
                                                    v162 = 1;
                                                    v163 = 1;
                                                  }
                                                }
                                                else
                                                {
                                                  v165 = 0;
                                                  v171 = 0;
                                                  v205 = 0;
                                                  v166 = 0;
                                                  v174 = 0;
                                                  v204 = 0;
                                                  v169 = 0;
                                                  v177 = 0;
                                                  v203 = 0;
                                                  v172 = 0;
                                                  v180 = 0;
                                                  v202 = 0;
                                                  v178 = 0;
                                                  v183 = 0;
                                                  v200 = 0;
                                                  v182 = 0;
                                                  v185 = 0;
                                                  v199 = 0;
                                                  v188 = 0;
                                                  v190 = 0;
                                                  v197 = 0;
                                                  v192 = 0;
                                                  v12 = 0;
                                                  v13 = 0;
                                                  v14 = 0;
                                                  v15 = 0;
                                                  v201 = 1;
                                                  v198 = 1;
                                                  v195 = 0;
                                                  v196 = 1;
                                                  v194[2] = 0x100000001;
                                                  v194[1] = 0x100000001;
                                                  v193 = 0;
                                                  v194[0] = 0x100000001;
                                                  v11 = 1;
                                                  v189 = 1;
                                                  v191 = 1;
                                                  v186 = 1;
                                                  v187 = 1;
                                                  v181 = 1;
                                                  v184 = 1;
                                                  v173 = 1;
                                                  v167 = 1;
                                                  v175 = 1;
                                                  v179 = 1;
                                                  v168 = 1;
                                                  v176 = 1;
                                                  v164 = 1;
                                                  v170 = 1;
                                                  v162 = 1;
                                                  v163 = 1;
                                                  v206 = 1;
                                                }
                                              }
                                            }
                                            else
                                            {
                                              v162 = 0;
                                              v163 = 0;
                                              v206 = 0;
                                              v165 = 0;
                                              v171 = 0;
                                              v205 = 0;
                                              v166 = 0;
                                              v174 = 0;
                                              v204 = 0;
                                              v169 = 0;
                                              v177 = 0;
                                              v203 = 0;
                                              v172 = 0;
                                              v180 = 0;
                                              v202 = 0;
                                              v178 = 0;
                                              v183 = 0;
                                              v200 = 0;
                                              v182 = 0;
                                              v185 = 0;
                                              v199 = 0;
                                              v188 = 0;
                                              v190 = 0;
                                              v197 = 0;
                                              v192 = 0;
                                              v12 = 0;
                                              v13 = 0;
                                              v14 = 0;
                                              v15 = 0;
                                              v201 = 1;
                                              v198 = 1;
                                              v195 = 0;
                                              v196 = 1;
                                              v194[2] = 0x100000001;
                                              v194[1] = 0x100000001;
                                              v193 = 0;
                                              v194[0] = 0x100000001;
                                              v11 = 1;
                                              v189 = 1;
                                              v191 = 1;
                                              v186 = 1;
                                              v187 = 1;
                                              v181 = 1;
                                              v184 = 1;
                                              v173 = 1;
                                              v167 = 1;
                                              v175 = 1;
                                              v179 = 1;
                                              v168 = 1;
                                              v176 = 1;
                                              v164 = 1;
                                              v170 = 1;
                                              v207 = 1;
                                            }
                                          }
                                        }
                                        else
                                        {
                                          v164 = 0;
                                          v170 = 0;
                                          v207 = 0;
                                          v162 = 0;
                                          v163 = 0;
                                          v206 = 0;
                                          v165 = 0;
                                          v171 = 0;
                                          v205 = 0;
                                          v166 = 0;
                                          v174 = 0;
                                          v204 = 0;
                                          v169 = 0;
                                          v177 = 0;
                                          v203 = 0;
                                          v172 = 0;
                                          v180 = 0;
                                          v202 = 0;
                                          v178 = 0;
                                          v183 = 0;
                                          v200 = 0;
                                          v182 = 0;
                                          v185 = 0;
                                          v199 = 0;
                                          v188 = 0;
                                          v190 = 0;
                                          v197 = 0;
                                          v192 = 0;
                                          v12 = 0;
                                          v13 = 0;
                                          v14 = 0;
                                          v15 = 0;
                                          v201 = 1;
                                          v198 = 1;
                                          v195 = 0;
                                          v196 = 1;
                                          v194[2] = 0x100000001;
                                          v194[1] = 0x100000001;
                                          v193 = 0;
                                          v194[0] = 0x100000001;
                                          v11 = 1;
                                          v189 = 1;
                                          v191 = 1;
                                          v186 = 1;
                                          v187 = 1;
                                          v181 = 1;
                                          v184 = 1;
                                          v173 = 1;
                                          v167 = 1;
                                          v175 = 1;
                                          v179 = 1;
                                          v168 = 1;
                                          v176 = 1;
                                          v213 = 1;
                                        }
                                      }
                                    }
                                    else
                                    {
                                      v168 = 0;
                                      v176 = 0;
                                      v213 = 0;
                                      v164 = 0;
                                      v170 = 0;
                                      v207 = 0;
                                      v162 = 0;
                                      v163 = 0;
                                      v206 = 0;
                                      v165 = 0;
                                      v171 = 0;
                                      v205 = 0;
                                      v166 = 0;
                                      v174 = 0;
                                      v204 = 0;
                                      v169 = 0;
                                      v177 = 0;
                                      v203 = 0;
                                      v172 = 0;
                                      v180 = 0;
                                      v202 = 0;
                                      v178 = 0;
                                      v183 = 0;
                                      v200 = 0;
                                      v182 = 0;
                                      v185 = 0;
                                      v199 = 0;
                                      v188 = 0;
                                      v190 = 0;
                                      v197 = 0;
                                      v192 = 0;
                                      v12 = 0;
                                      v13 = 0;
                                      v14 = 0;
                                      v15 = 0;
                                      v201 = 1;
                                      v198 = 1;
                                      v195 = 0;
                                      v196 = 1;
                                      v194[2] = 0x100000001;
                                      v194[1] = 0x100000001;
                                      v193 = 0;
                                      v194[0] = 0x100000001;
                                      v11 = 1;
                                      v189 = 1;
                                      v191 = 1;
                                      v186 = 1;
                                      v187 = 1;
                                      v181 = 1;
                                      v184 = 1;
                                      v173 = 1;
                                      v167 = 1;
                                      v175 = 1;
                                      v179 = 1;
                                      v214 = 1;
                                    }
                                  }
                                }
                              }
                              else
                              {
                                v175 = 0;
                                v179 = 0;
                                v214 = 0;
                                v168 = 0;
                                v176 = 0;
                                v213 = 0;
                                v164 = 0;
                                v170 = 0;
                                v207 = 0;
                                v162 = 0;
                                v163 = 0;
                                v206 = 0;
                                v165 = 0;
                                v171 = 0;
                                v205 = 0;
                                v166 = 0;
                                v174 = 0;
                                v204 = 0;
                                v169 = 0;
                                v177 = 0;
                                v203 = 0;
                                v172 = 0;
                                v180 = 0;
                                v202 = 0;
                                v178 = 0;
                                v183 = 0;
                                v200 = 0;
                                v182 = 0;
                                v185 = 0;
                                v199 = 0;
                                v188 = 0;
                                v190 = 0;
                                v197 = 0;
                                v192 = 0;
                                v12 = 0;
                                v13 = 0;
                                v14 = 0;
                                v15 = 0;
                                v201 = 1;
                                v198 = 1;
                                v195 = 0;
                                v196 = 1;
                                v194[2] = 0x100000001;
                                v194[1] = 0x100000001;
                                v193 = 0;
                                v194[0] = 0x100000001;
                                v11 = 1;
                                v189 = 1;
                                v191 = 1;
                                v186 = 1;
                                v187 = 1;
                                v181 = 1;
                                v184 = 1;
                                v173 = 1;
                                v167 = 1;
                                v215 = 1;
                              }
                            }
                          }
                          else
                          {
                            v173 = 0;
                            v167 = 0;
                            v215 = 0;
                            v175 = 0;
                            v179 = 0;
                            v214 = 0;
                            v168 = 0;
                            v176 = 0;
                            v213 = 0;
                            v164 = 0;
                            v170 = 0;
                            v207 = 0;
                            v162 = 0;
                            v163 = 0;
                            v206 = 0;
                            v165 = 0;
                            v171 = 0;
                            v205 = 0;
                            v166 = 0;
                            v174 = 0;
                            v204 = 0;
                            v169 = 0;
                            v177 = 0;
                            v203 = 0;
                            v172 = 0;
                            v180 = 0;
                            v202 = 0;
                            v178 = 0;
                            v183 = 0;
                            v200 = 0;
                            v182 = 0;
                            v185 = 0;
                            v199 = 0;
                            v188 = 0;
                            v190 = 0;
                            v197 = 0;
                            v192 = 0;
                            v12 = 0;
                            v13 = 0;
                            v14 = 0;
                            v15 = 0;
                            v201 = 1;
                            v198 = 1;
                            v195 = 0;
                            v196 = 1;
                            v194[2] = 0x100000001;
                            v194[1] = 0x100000001;
                            v193 = 0;
                            v194[0] = 0x100000001;
                            v11 = 1;
                            v189 = 1;
                            v191 = 1;
                            v186 = 1;
                            v187 = 1;
                            v181 = 1;
                            v184 = 1;
                            v216 = 1;
                          }
                        }
                      }
                      else
                      {
                        v181 = 0;
                        v184 = 0;
                        v216 = 0;
                        v173 = 0;
                        v167 = 0;
                        v215 = 0;
                        v175 = 0;
                        v179 = 0;
                        v214 = 0;
                        v168 = 0;
                        v176 = 0;
                        v213 = 0;
                        v164 = 0;
                        v170 = 0;
                        v207 = 0;
                        v162 = 0;
                        v163 = 0;
                        v206 = 0;
                        v165 = 0;
                        v171 = 0;
                        v205 = 0;
                        v166 = 0;
                        v174 = 0;
                        v204 = 0;
                        v169 = 0;
                        v177 = 0;
                        v203 = 0;
                        v172 = 0;
                        v180 = 0;
                        v202 = 0;
                        v178 = 0;
                        v183 = 0;
                        v200 = 0;
                        v182 = 0;
                        v185 = 0;
                        v199 = 0;
                        v188 = 0;
                        v190 = 0;
                        v197 = 0;
                        v192 = 0;
                        v12 = 0;
                        v13 = 0;
                        v14 = 0;
                        v15 = 0;
                        v201 = 1;
                        v198 = 1;
                        v195 = 0;
                        v196 = 1;
                        v194[2] = 0x100000001;
                        v194[1] = 0x100000001;
                        v193 = 0;
                        v194[0] = 0x100000001;
                        v11 = 1;
                        v189 = 1;
                        v191 = 1;
                        v186 = 1;
                        v187 = 1;
                        v217 = 1;
                      }
                    }
                  }
                  else
                  {
                    v186 = 0;
                    v187 = 0;
                    v217 = 0;
                    v181 = 0;
                    v184 = 0;
                    v216 = 0;
                    v173 = 0;
                    v167 = 0;
                    v215 = 0;
                    v175 = 0;
                    v179 = 0;
                    v214 = 0;
                    v168 = 0;
                    v176 = 0;
                    v213 = 0;
                    v164 = 0;
                    v170 = 0;
                    v207 = 0;
                    v162 = 0;
                    v163 = 0;
                    v206 = 0;
                    v165 = 0;
                    v171 = 0;
                    v205 = 0;
                    v166 = 0;
                    v174 = 0;
                    v204 = 0;
                    v169 = 0;
                    v177 = 0;
                    v203 = 0;
                    v172 = 0;
                    v180 = 0;
                    v202 = 0;
                    v178 = 0;
                    v183 = 0;
                    v200 = 0;
                    v182 = 0;
                    v185 = 0;
                    v199 = 0;
                    v188 = 0;
                    v190 = 0;
                    v197 = 0;
                    v192 = 0;
                    v12 = 0;
                    v13 = 0;
                    v14 = 0;
                    v15 = 0;
                    v201 = 1;
                    v198 = 1;
                    v195 = 0;
                    v196 = 1;
                    v194[2] = 0x100000001;
                    v194[1] = 0x100000001;
                    v193 = 0;
                    v194[0] = 0x100000001;
                    v11 = 1;
                    v189 = 1;
                    v191 = 1;
                    v218 = 1;
                  }
                }
              }
              else
              {
                v189 = 0;
                v191 = 0;
                v218 = 0;
                v186 = 0;
                v187 = 0;
                v217 = 0;
                v181 = 0;
                v184 = 0;
                v216 = 0;
                v173 = 0;
                v167 = 0;
                v215 = 0;
                v175 = 0;
                v179 = 0;
                v214 = 0;
                v168 = 0;
                v176 = 0;
                v213 = 0;
                v164 = 0;
                v170 = 0;
                v207 = 0;
                v162 = 0;
                v163 = 0;
                v206 = 0;
                v165 = 0;
                v171 = 0;
                v205 = 0;
                v166 = 0;
                v174 = 0;
                v204 = 0;
                v169 = 0;
                v177 = 0;
                v203 = 0;
                v172 = 0;
                v180 = 0;
                v202 = 0;
                v178 = 0;
                v183 = 0;
                v200 = 0;
                v182 = 0;
                v185 = 0;
                v199 = 0;
                v188 = 0;
                v190 = 0;
                v197 = 0;
                v192 = 0;
                v12 = 0;
                v13 = 0;
                v14 = 0;
                v15 = 0;
                v201 = 1;
                v198 = 1;
                v195 = 0;
                v196 = 1;
                v194[2] = 0x100000001;
                v194[1] = 0x100000001;
                v193 = 0;
                v194[0] = 0x100000001;
                v11 = 1;
                LODWORD(v219) = 1;
              }
            }
          }
          else
          {
            v194[0] = 0x100000000;
            v11 = 0;
            *(_QWORD *)&v219 = 0x100000000;
            v189 = 0;
            v191 = 0;
            v218 = 0;
            v186 = 0;
            v187 = 0;
            v217 = 0;
            v181 = 0;
            v184 = 0;
            v216 = 0;
            v173 = 0;
            v167 = 0;
            v215 = 0;
            v175 = 0;
            v179 = 0;
            v214 = 0;
            v168 = 0;
            v176 = 0;
            v213 = 0;
            v164 = 0;
            v170 = 0;
            v207 = 0;
            v162 = 0;
            v163 = 0;
            v206 = 0;
            v165 = 0;
            v171 = 0;
            v205 = 0;
            v166 = 0;
            v174 = 0;
            v204 = 0;
            v169 = 0;
            v177 = 0;
            v203 = 0;
            v172 = 0;
            v180 = 0;
            v202 = 0;
            v178 = 0;
            v183 = 0;
            v200 = 0;
            v182 = 0;
            v185 = 0;
            v199 = 0;
            v188 = 0;
            v190 = 0;
            v197 = 0;
            v192 = 0;
            v193 = 0;
            v12 = 0;
            v13 = 0;
            v14 = 0;
            v15 = 0;
            v201 = 1;
            v198 = 1;
            v195 = 0;
            v196 = 1;
            v194[2] = 0x100000001;
            v194[1] = 0x100000001;
          }
        }
      }
      else
      {
        *(_QWORD *)((char *)v194 + 4) = 0;
        *(_QWORD *)&v219 = 0;
        LODWORD(v194[0]) = 0;
        v11 = 0;
        v189 = 0;
        v191 = 0;
        v218 = 0;
        v186 = 0;
        v187 = 0;
        v217 = 0;
        v181 = 0;
        v184 = 0;
        v216 = 0;
        v173 = 0;
        v167 = 0;
        v215 = 0;
        v175 = 0;
        v179 = 0;
        v214 = 0;
        v168 = 0;
        v176 = 0;
        v213 = 0;
        v164 = 0;
        v170 = 0;
        v207 = 0;
        v162 = 0;
        v163 = 0;
        v206 = 0;
        v165 = 0;
        v171 = 0;
        v205 = 0;
        v166 = 0;
        v174 = 0;
        v204 = 0;
        v169 = 0;
        v177 = 0;
        v203 = 0;
        v172 = 0;
        v180 = 0;
        v202 = 0;
        v178 = 0;
        v183 = 0;
        v200 = 0;
        v182 = 0;
        v185 = 0;
        v199 = 0;
        v188 = 0;
        v190 = 0;
        v197 = 0;
        v192 = 0;
        v193 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v201 = 1;
        v198 = 1;
        v195 = 0;
        v196 = 1;
        v194[2] = 0x100000001;
        HIDWORD(v194[1]) = 1;
        DWORD2(v219) = 1;
      }
    }
  }
  else
  {
    *(_QWORD *)((char *)&v219 + 4) = 0;
    memset(v194, 0, 20);
    v11 = 0;
    LODWORD(v219) = 0;
    v189 = 0;
    v191 = 0;
    v218 = 0;
    v186 = 0;
    v187 = 0;
    v217 = 0;
    v181 = 0;
    v184 = 0;
    v216 = 0;
    v173 = 0;
    v167 = 0;
    v215 = 0;
    v175 = 0;
    v179 = 0;
    v214 = 0;
    v168 = 0;
    v176 = 0;
    v213 = 0;
    v164 = 0;
    v170 = 0;
    v207 = 0;
    v162 = 0;
    v163 = 0;
    v206 = 0;
    v165 = 0;
    v171 = 0;
    v205 = 0;
    v166 = 0;
    v174 = 0;
    v204 = 0;
    v169 = 0;
    v177 = 0;
    v203 = 0;
    v172 = 0;
    v180 = 0;
    v202 = 0;
    v178 = 0;
    v183 = 0;
    v200 = 0;
    v182 = 0;
    v185 = 0;
    v199 = 0;
    v188 = 0;
    v190 = 0;
    v197 = 0;
    v192 = 0;
    v193 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v201 = 1;
    v198 = 1;
    v195 = 0;
    v196 = 1;
    HIDWORD(v194[2]) = 1;
  }
LABEL_15:
  if (v14)
  {
    v18 = v11;
    v19 = v13;

    v20 = v19;
    v11 = v18;
    if (!v20)
      goto LABEL_17;
LABEL_152:

    if (!v12)
      goto LABEL_19;
    goto LABEL_18;
  }
  if (v13)
    goto LABEL_152;
LABEL_17:
  if (v12)
  {
LABEL_18:

  }
LABEL_19:
  if (v195)
  {

  }
  if (v193)

  if (v192)
  {

  }
  if (v197)
  {

  }
  if (v190)

  if (v188)
  {

  }
  if (v199)
  {

  }
  if (v185)

  if (v182)
  {

  }
  if (v200)
  {

  }
  if (v183)

  if (v178)
  {

  }
  if (v202)
  {

  }
  if (v180)

  if (v172)
  {

  }
  if (v203)
  {

  }
  if (v177)

  if (v169)
  {

  }
  if (v204)
  {

  }
  if (v174)

  if (v166)
  {

  }
  if (v205)
  {

  }
  if (v171)

  if (v165)
  {

  }
  if (v206)
  {

  }
  if (v163)

  if (v162)
  {

  }
  if (v207)
  {

  }
  if (v170)

  if (v164)
  {

  }
  if (v213)
  {

  }
  if (v176)

  if (v168)
  {

  }
  if (v214)
  {

  }
  if (v179)

  if (v175)
  {

  }
  if (v215)
  {

  }
  if (v167)

  if (v173)
  {

  }
  if (v216)
  {

  }
  if (v184)

  if (v181)
  {

  }
  if (v217)
  {

  }
  if (v187)

  if (v186)
  {

  }
  if (v218)
  {

  }
  if (v191)

  if (v189)
  {

  }
  if ((_DWORD)v219)
  {

  }
  if (v11)

  if (LODWORD(v194[0]))
  {

  }
  if (DWORD1(v219))
  {

  }
  if (LODWORD(v194[1]))

  if (HIDWORD(v194[0]))
  {

  }
  if (DWORD2(v219))
  {

  }
  if (LODWORD(v194[2]))

  if (HIDWORD(v194[1]))
  {

  }
  if (HIDWORD(v219))
  {

  }
  if (HIDWORD(v194[2]))

  if (v196)
  {

  }
  if ((_DWORD)v208)
  {

  }
  if (v198)

  if (v201)
  {

  }
  if (HIDWORD(v208))
  {

  }
  if (v210 != v209)

LABEL_150:
  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  long double v15;
  double v16;
  double v17;
  long double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  unint64_t v46;
  void *v47;
  unint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;

  -[SFActionItem label](self, "label");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v63, "hash");
  -[SFActionItem labelForLocalMedia](self, "labelForLocalMedia");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v62, "hash") ^ v3;
  v5 = v4 ^ -[SFActionItem isOverlay](self, "isOverlay");
  -[SFActionItem storeIdentifiers](self, "storeIdentifiers");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v61, "hash");
  v7 = v5 ^ v6 ^ -[SFActionItem requiresLocalMedia](self, "requiresLocalMedia");
  -[SFActionItem localMediaIdentifier](self, "localMediaIdentifier");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v60, "hash");
  -[SFActionItem punchout](self, "punchout");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 ^ objc_msgSend(v59, "hash");
  -[SFActionItem applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 ^ objc_msgSend(v58, "hash");
  -[SFActionItem contactIdentifier](self, "contactIdentifier");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v7 ^ v10 ^ objc_msgSend(v57, "hash");
  -[SFActionItem phoneNumber](self, "phoneNumber");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v56, "hash");
  -[SFActionItem email](self, "email");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 ^ objc_msgSend(v55, "hash");
  -[SFActionItem mapsData](self, "mapsData");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v12 ^ objc_msgSend(v54, "hash");
  -[SFActionItem latitude](self, "latitude");
  v14 = -v13;
  if (v13 >= 0.0)
    v14 = v13;
  v15 = round(v14);
  v48 = (unint64_t)(fmod(v15, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v14 - v15, 0x40uLL);
  -[SFActionItem longitude](self, "longitude");
  v17 = -v16;
  if (v16 >= 0.0)
    v17 = v16;
  v18 = round(v17);
  v46 = (unint64_t)(fmod(v18, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v17 - v18, 0x40uLL);
  -[SFActionItem provider](self, "provider");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v52, "hash");
  -[SFActionItem offerType](self, "offerType");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v51, "hash");
  -[SFActionItem type](self, "type");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v49, "hash");
  -[SFActionItem labelITunes](self, "labelITunes");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v47, "hash");
  v38 = -[SFActionItem isITunes](self, "isITunes");
  -[SFActionItem icon](self, "icon");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v45, "hash");
  -[SFActionItem baseIcon](self, "baseIcon");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v43, "hash");
  -[SFActionItem location](self, "location");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v40, "hash");
  -[SFActionItem messageIdentifier](self, "messageIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v37, "hash");
  -[SFActionItem messageURL](self, "messageURL");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v35, "hash");
  -[SFActionItem persistentID](self, "persistentID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v19, "hash");
  v20 = -[SFActionItem mediaEntityType](self, "mediaEntityType");
  -[SFActionItem universalLibraryID](self, "universalLibraryID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "hash");
  -[SFActionItem interactionContentType](self, "interactionContentType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "hash");
  -[SFActionItem customDirectionsPunchout](self, "customDirectionsPunchout");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "hash");
  v27 = -[SFActionItem shouldSearchDirectionsAlongCurrentRoute](self, "shouldSearchDirectionsAlongCurrentRoute");
  v28 = v53 ^ v50 ^ v44 ^ v42 ^ v48 ^ v46 ^ v41 ^ v39 ^ v38 ^ v36 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v20 ^ v22 ^ v24 ^ v26 ^ v27 ^ -[SFActionItem directionsMode](self, "directionsMode");

  return v28;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)labelForLocalMedia
{
  return self->_labelForLocalMedia;
}

- (void)setLabelForLocalMedia:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isOverlay
{
  return self->_isOverlay;
}

- (NSArray)storeIdentifiers
{
  return self->_storeIdentifiers;
}

- (void)setStoreIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)requiresLocalMedia
{
  return self->_requiresLocalMedia;
}

- (NSString)localMediaIdentifier
{
  return self->_localMediaIdentifier;
}

- (void)setLocalMediaIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (SFPunchout)punchout
{
  return self->_punchout;
}

- (void)setPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_punchout, a3);
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSData)mapsData
{
  return self->_mapsData;
}

- (void)setMapsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (NSString)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)offerType
{
  return self->_offerType;
}

- (void)setOfferType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)labelITunes
{
  return self->_labelITunes;
}

- (void)setLabelITunes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)isITunes
{
  return self->_isITunes;
}

- (SFImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (SFImage)baseIcon
{
  return self->_baseIcon;
}

- (void)setBaseIcon:(id)a3
{
  objc_storeStrong((id *)&self->_baseIcon, a3);
}

- (SFLatLng)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (void)setMessageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSURL)messageURL
{
  return self->_messageURL;
}

- (void)setMessageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (int)mediaEntityType
{
  return self->_mediaEntityType;
}

- (NSString)universalLibraryID
{
  return self->_universalLibraryID;
}

- (void)setUniversalLibraryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)interactionContentType
{
  return self->_interactionContentType;
}

- (void)setInteractionContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (SFPunchout)customDirectionsPunchout
{
  return self->_customDirectionsPunchout;
}

- (void)setCustomDirectionsPunchout:(id)a3
{
  objc_storeStrong((id *)&self->_customDirectionsPunchout, a3);
}

- (BOOL)shouldSearchDirectionsAlongCurrentRoute
{
  return self->_shouldSearchDirectionsAlongCurrentRoute;
}

- (int)directionsMode
{
  return self->_directionsMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customDirectionsPunchout, 0);
  objc_storeStrong((id *)&self->_interactionContentType, 0);
  objc_storeStrong((id *)&self->_universalLibraryID, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
  objc_storeStrong((id *)&self->_messageURL, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_baseIcon, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_labelITunes, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_offerType, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_mapsData, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_punchout, 0);
  objc_storeStrong((id *)&self->_localMediaIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifiers, 0);
  objc_storeStrong((id *)&self->_labelForLocalMedia, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (SFActionItem)initWithProtobuf:(id)a3
{
  id v4;
  SFActionItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  SFPunchout *v21;
  void *v22;
  SFPunchout *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
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
  SFImage *v47;
  void *v48;
  SFImage *v49;
  void *v50;
  SFImage *v51;
  void *v52;
  SFImage *v53;
  void *v54;
  SFLatLng *v55;
  void *v56;
  SFLatLng *v57;
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
  SFPunchout *v70;
  void *v71;
  SFPunchout *v72;
  SFActionItem *v73;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  objc_super v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v79.receiver = self;
  v79.super_class = (Class)SFActionItem;
  v5 = -[SFActionItem init](&v79, sel_init);

  if (v5)
  {
    objc_msgSend(v4, "label");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "label");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setLabel:](v5, "setLabel:", v7);

    }
    objc_msgSend(v4, "labelForLocalMedia");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "labelForLocalMedia");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setLabelForLocalMedia:](v5, "setLabelForLocalMedia:", v9);

    }
    if (objc_msgSend(v4, "isOverlay"))
      -[SFActionItem setIsOverlay:](v5, "setIsOverlay:", objc_msgSend(v4, "isOverlay"));
    objc_msgSend(v4, "storeIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

    }
    else
    {
      v11 = 0;
    }

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    objc_msgSend(v4, "storeIdentifiers", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v76 != v15)
            objc_enumerationMutation(v12);
          v17 = *(id *)(*((_QWORD *)&v75 + 1) + 8 * i);
          if (v17)
            objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
      }
      while (v14);
    }

    -[SFActionItem setStoreIdentifiers:](v5, "setStoreIdentifiers:", v11);
    if (objc_msgSend(v4, "requiresLocalMedia"))
      -[SFActionItem setRequiresLocalMedia:](v5, "setRequiresLocalMedia:", objc_msgSend(v4, "requiresLocalMedia"));
    objc_msgSend(v4, "localMediaIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v4, "localMediaIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setLocalMediaIdentifier:](v5, "setLocalMediaIdentifier:", v19);

    }
    objc_msgSend(v4, "punchout");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [SFPunchout alloc];
      objc_msgSend(v4, "punchout");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[SFPunchout initWithProtobuf:](v21, "initWithProtobuf:", v22);
      -[SFActionItem setPunchout:](v5, "setPunchout:", v23);

    }
    objc_msgSend(v4, "applicationBundleIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "applicationBundleIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setApplicationBundleIdentifier:](v5, "setApplicationBundleIdentifier:", v25);

    }
    objc_msgSend(v4, "contactIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v4, "contactIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setContactIdentifier:](v5, "setContactIdentifier:", v27);

    }
    objc_msgSend(v4, "phoneNumber");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v4, "phoneNumber");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setPhoneNumber:](v5, "setPhoneNumber:", v29);

    }
    objc_msgSend(v4, "email");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v4, "email");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setEmail:](v5, "setEmail:", v31);

    }
    objc_msgSend(v4, "mapsData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      objc_msgSend(v4, "mapsData");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setMapsData:](v5, "setMapsData:", v33);

    }
    objc_msgSend(v4, "latitude");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      objc_msgSend(v4, "latitude");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "doubleValue");
      -[SFActionItem setLatitude:](v5, "setLatitude:");

    }
    objc_msgSend(v4, "longitude");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v4, "longitude");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValue");
      -[SFActionItem setLongitude:](v5, "setLongitude:");

    }
    objc_msgSend(v4, "provider");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v4, "provider");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setProvider:](v5, "setProvider:", v39);

    }
    objc_msgSend(v4, "offerType");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      objc_msgSend(v4, "offerType");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setOfferType:](v5, "setOfferType:", v41);

    }
    objc_msgSend(v4, "type");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      objc_msgSend(v4, "type");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setType:](v5, "setType:", v43);

    }
    objc_msgSend(v4, "labelITunes");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v4, "labelITunes");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setLabelITunes:](v5, "setLabelITunes:", v45);

    }
    if (objc_msgSend(v4, "isITunes"))
      -[SFActionItem setIsITunes:](v5, "setIsITunes:", objc_msgSend(v4, "isITunes"));
    objc_msgSend(v4, "icon");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v46)
    {
      v47 = [SFImage alloc];
      objc_msgSend(v4, "icon");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[SFImage initWithProtobuf:](v47, "initWithProtobuf:", v48);
      -[SFActionItem setIcon:](v5, "setIcon:", v49);

    }
    objc_msgSend(v4, "baseIcon");
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    if (v50)
    {
      v51 = [SFImage alloc];
      objc_msgSend(v4, "baseIcon");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[SFImage initWithProtobuf:](v51, "initWithProtobuf:", v52);
      -[SFActionItem setBaseIcon:](v5, "setBaseIcon:", v53);

    }
    objc_msgSend(v4, "location");
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    if (v54)
    {
      v55 = [SFLatLng alloc];
      objc_msgSend(v4, "location");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[SFLatLng initWithProtobuf:](v55, "initWithProtobuf:", v56);
      -[SFActionItem setLocation:](v5, "setLocation:", v57);

    }
    objc_msgSend(v4, "messageIdentifier");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      objc_msgSend(v4, "messageIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setMessageIdentifier:](v5, "setMessageIdentifier:", v59);

    }
    objc_msgSend(v4, "messageURL");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      objc_msgSend(v4, "messageURL");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      _SFPBURLHandwrittenTranslator(v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setMessageURL:](v5, "setMessageURL:", v62);

    }
    objc_msgSend(v4, "persistentID");
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63)
    {
      objc_msgSend(v4, "persistentID");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setPersistentID:](v5, "setPersistentID:", v64);

    }
    if (objc_msgSend(v4, "mediaEntityType"))
      -[SFActionItem setMediaEntityType:](v5, "setMediaEntityType:", objc_msgSend(v4, "mediaEntityType"));
    objc_msgSend(v4, "universalLibraryID");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (v65)
    {
      objc_msgSend(v4, "universalLibraryID");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setUniversalLibraryID:](v5, "setUniversalLibraryID:", v66);

    }
    objc_msgSend(v4, "interactionContentType");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (v67)
    {
      objc_msgSend(v4, "interactionContentType");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFActionItem setInteractionContentType:](v5, "setInteractionContentType:", v68);

    }
    objc_msgSend(v4, "customDirectionsPunchout");
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    if (v69)
    {
      v70 = [SFPunchout alloc];
      objc_msgSend(v4, "customDirectionsPunchout");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = -[SFPunchout initWithProtobuf:](v70, "initWithProtobuf:", v71);
      -[SFActionItem setCustomDirectionsPunchout:](v5, "setCustomDirectionsPunchout:", v72);

    }
    if (objc_msgSend(v4, "shouldSearchDirectionsAlongCurrentRoute"))
      -[SFActionItem setShouldSearchDirectionsAlongCurrentRoute:](v5, "setShouldSearchDirectionsAlongCurrentRoute:", objc_msgSend(v4, "shouldSearchDirectionsAlongCurrentRoute"));
    if (objc_msgSend(v4, "directionsMode"))
      -[SFActionItem setDirectionsMode:](v5, "setDirectionsMode:", objc_msgSend(v4, "directionsMode"));
    v73 = v5;

  }
  return v5;
}

@end
