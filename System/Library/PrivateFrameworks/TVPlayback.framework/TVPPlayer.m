@implementation TVPPlayer

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if ((void *)__TVPSettingsPreferVideoDescriptionsKVOContext == a6)
  {
    -[TVPPlayer _preferVideoDescriptionsSettingDidChange](self, "_preferVideoDescriptionsSettingDidChange");
    goto LABEL_55;
  }
  if ((void *)__TVPSettingsSubtitleDisplayTypeKVOContext == a6
    || (void *)__TVPSettingsPreferredSubtitleLanguageDidChangeKVOContext == a6
    || (void *)__TVPSettingsPreferSDHOverRegularSubtitlesKVOContext == a6)
  {
    -[TVPPlayer _subtitleSettingsDidChange](self, "_subtitleSettingsDidChange");
    goto LABEL_55;
  }
  if ((void *)__TVPMediaItemLoaderStateKVOContext_0 == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer _mediaItemLoader:stateDidChangeTo:](self, "_mediaItemLoader:stateDidChangeTo:", v11, v14);
LABEL_54:

    goto LABEL_55;
  }
  if ((void *)__TVPPlaylistEndActionKVOContext == a6)
  {
    -[TVPPlayer _playlistEndActionDidChange](self, "_playlistEndActionDidChange");
    goto LABEL_55;
  }
  if ((void *)__AVPlayerMutedKVOContext == a6)
  {
    -[TVPPlayer _playerMutedDidChange](self, "_playerMutedDidChange");
    goto LABEL_55;
  }
  if ((void *)__TVPPlaylistCurrentMediaItemKVOContext == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E78]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v16)
    {
      -[TVPPlayer playlist](self, "playlist");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "changeContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPPlayer _playlistCurrentMediaItemWillChangeWithContext:](self, "_playlistCurrentMediaItemWillChangeWithContext:", v17);
LABEL_53:

      goto LABEL_54;
    }
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v20)
    {

      v14 = 0;
    }
    -[TVPPlayer playlist](self, "playlist");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "changeContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer _playlistCurrentMediaItemDidChangeWithContext:](self, "_playlistCurrentMediaItemDidChangeWithContext:", v19);
LABEL_39:

    goto LABEL_53;
  }
  if ((void *)__TVPPlaylistNextMediaItemKVOContext == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v18)
    {

      v14 = 0;
    }
    -[TVPPlayer playlist](self, "playlist");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "changeContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer _playlistNextMediaItemDidChangeWithContext:](self, "_playlistNextMediaItemDidChangeWithContext:", v19);
    goto LABEL_39;
  }
  if ((void *)__AVPlayerItemStatusKVOContext == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E80]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14
      || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v21,
          v14 == v21))
    {
      v22 = 0;
    }
    else
    {
      v22 = objc_msgSend(v14, "integerValue");
    }
    if (!v17
      || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v24,
          v17 == v24))
    {
      v25 = 0;
    }
    else
    {
      v25 = objc_msgSend(v17, "integerValue");
    }
    -[TVPPlayer _currentPlayerItemStatusDidChangeTo:from:](self, "_currentPlayerItemStatusDidChangeTo:from:", v25, v22);
    goto LABEL_53;
  }
  if ((void *)__AVPlayerItemDurationKVOContext == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = *MEMORY[0x24BDC0D40];
    v51 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 != v23)
        objc_msgSend(v14, "CMTimeValue");
    }
    v48 = v50;
    v49 = v51;
    -[TVPPlayer _currentPlayerItemDurationDidChangeTo:](self, "_currentPlayerItemDurationDidChangeTo:", &v48);
    goto LABEL_54;
  }
  if ((void *)__AVPlayerItemHasVideoContext == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14
      || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v26,
          v14 == v26))
    {
      v27 = 0;
    }
    else
    {
      v27 = objc_msgSend(v14, "BOOLValue");
    }
    -[TVPPlayer _currentPlayerItemHasVideoDidChangeTo:](self, "_currentPlayerItemHasVideoDidChangeTo:", v27);
    goto LABEL_54;
  }
  if ((void *)__AVPlayerItemPresentationSizeContent == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = *MEMORY[0x24BDBF148];
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 != v28)
        objc_msgSend(v14, "getValue:size:", &v50, 16);
    }
    -[TVPPlayer _currentPlayerItemPresentationSizeDidChangeTo:](self, "_currentPlayerItemPresentationSizeDidChangeTo:", v50);
    goto LABEL_54;
  }
  if ((void *)__AVPlayerItemLikelyToKeepUpKVOContext == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14
      || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          v29,
          v14 == v29))
    {
      v30 = 0;
    }
    else
    {
      v30 = objc_msgSend(v14, "BOOLValue");
    }
    -[TVPPlayer _currentPlayerItemLikelyToKeepUpDidChangeTo:](self, "_currentPlayerItemLikelyToKeepUpDidChangeTo:", v30);
    goto LABEL_54;
  }
  if ((void *)__AVPlayerItemBufferFullKVOContext == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14
      || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
          v31 = (void *)objc_claimAutoreleasedReturnValue(),
          v31,
          v14 == v31))
    {
      v32 = 0;
    }
    else
    {
      v32 = objc_msgSend(v14, "BOOLValue");
    }
    -[TVPPlayer _currentPlayerItemBufferFullDidChangeTo:](self, "_currentPlayerItemBufferFullDidChangeTo:", v32);
    goto LABEL_54;
  }
  if ((void *)__AVPlayerItemBufferEmptyKVOContext == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14
      || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
          v33 = (void *)objc_claimAutoreleasedReturnValue(),
          v33,
          v14 == v33))
    {
      v34 = 0;
    }
    else
    {
      v34 = objc_msgSend(v14, "BOOLValue");
    }
    -[TVPPlayer _currentPlayerItemBufferEmptyDidChangeTo:](self, "_currentPlayerItemBufferEmptyDidChangeTo:", v34);
    goto LABEL_54;
  }
  if ((void *)__AVPlayerCurrentItemKVOContext == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E78]);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v35;
    if (v35 && objc_msgSend(v35, "BOOLValue"))
    {
      -[TVPPlayer _currentPlayerItemWillChange](self, "_currentPlayerItemWillChange");
      goto LABEL_54;
    }
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 == v36)
    {

      v17 = 0;
    }
    -[TVPPlayer _currentPlayerItemDidChangeTo:](self, "_currentPlayerItemDidChangeTo:", v17);
    goto LABEL_53;
  }
  if ((void *)__AVPlayerTimeControlStatusKVOContext == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E80]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v37)
    {

      v14 = 0;
    }
    if (!v17
      || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
          v38 = (void *)objc_claimAutoreleasedReturnValue(),
          v38,
          v17 == v38))
    {
      -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v42, "timeControlStatus");

    }
    else
    {
      v39 = objc_msgSend(v17, "integerValue");
    }
    -[TVPPlayer _timeControlStatusDidChangeTo:oldStatusNum:](self, "_timeControlStatusDidChangeTo:oldStatusNum:", v39, v14);
    goto LABEL_53;
  }
  if ((void *)__AVPlayerOutputObscuredDueToInsufficientExternalProtectionKVOContext == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14
      || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
          v40 = (void *)objc_claimAutoreleasedReturnValue(),
          v40,
          v14 == v40))
    {
      v41 = 0;
    }
    else
    {
      v41 = objc_msgSend(v14, "BOOLValue");
    }
    -[TVPPlayer _outputObscuredDidChangeTo:](self, "_outputObscuredDidChangeTo:", v41);
    goto LABEL_54;
  }
  if ((void *)__AVPlayerExternalPlaybackActiveKVOContext == a6)
  {
    -[TVPPlayer _externalPlaybackActiveDidChange](self, "_externalPlaybackActiveDidChange");
    goto LABEL_55;
  }
  if ((void *)__AVPlayerItemLoadedTimeRangesKVOContext == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v43)
    {

      v14 = 0;
    }
    -[TVPPlayer _currentPlayerItemLoadedTimeRangesDidChangeTo:](self, "_currentPlayerItemLoadedTimeRangesDidChangeTo:", v14);
    goto LABEL_54;
  }
  if ((void *)__AVPlayerItemSeekableTimeRangesKVOContext == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v44)
    {

      v14 = 0;
    }
    -[TVPPlayer _currentPlayerItemSeekableTimeRangesDidChangeTo:](self, "_currentPlayerItemSeekableTimeRangesDidChangeTo:", v14);
    goto LABEL_54;
  }
  if ((void *)__AVPlayerItemTimedMetadataKVOContext == a6)
  {
    -[TVPPlayer _currentPlayerItemTimedMetadataDidChange](self, "_currentPlayerItemTimedMetadataDidChange");
    goto LABEL_55;
  }
  if ((void *)__AVPlayerItemTracksKVOContext == a6)
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x24BDD0E80]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD0E70]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v45)
    {

      v14 = 0;
    }
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17 == v46)
    {

      v17 = 0;
    }
    -[TVPPlayer _currentPlayerItemTracksDidChangeTo:from:](self, "_currentPlayerItemTracksDidChangeTo:from:", v17, v14);
    goto LABEL_53;
  }
  v47.receiver = self;
  v47.super_class = (Class)TVPPlayer;
  -[TVPPlayer observeValueForKeyPath:ofObject:change:context:](&v47, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_55:

}

- (TVPMediaItem)currentMediaItem
{
  void *v2;
  void *v3;

  -[TVPPlayer playlist](self, "playlist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentMediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TVPMediaItem *)v3;
}

- (TVPPlaylist)playlistInternal
{
  return self->_playlistInternal;
}

+ (void)initialize
{
  if (initialize_onceToken_5 != -1)
    dispatch_once(&initialize_onceToken_5, &__block_literal_global_10);
}

void __23__TVPPlayer_initialize__block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  os_log_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sActivePlayers;
  sActivePlayers = v0;

  v2 = dispatch_queue_create("TVPPlayer AVAudioSession management queue", 0);
  v3 = (void *)sAVAudioSessionQueue;
  sAVAudioSessionQueue = (uint64_t)v2;

  v4 = os_log_create("com.apple.AppleTV.playback", "TVPPlayer");
  v5 = (void *)sPlayerLogObject;
  sPlayerLogObject = (uint64_t)v4;

}

- (void)_registerStateMachineHandlers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v49;
  id *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  id *v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id *v62;
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  void *v67;
  id *v68;
  id *v69;
  id *v70;
  id *v71;
  id *v72;
  id *v73;
  void *v74;
  id *v75;
  id *v76;
  id *v77;
  void *v78;
  id *v79;
  id *v80;
  id *v81;
  uint64_t v82;
  id *v83;
  id *v84;
  id *v85;
  id v86;
  id v87;
  void *v88;
  id v89;
  id v90;
  id *v91;
  void *v92;
  id v93;
  id *v94;
  id v95;
  id *v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  id *v106;
  void *v107;
  id *v108;
  void *v109;
  id *v110;
  id *v111;
  void *v112;
  void *v113;
  void *v114;
  id *v115;
  id v116;
  id *v117;
  id *v118;
  id *v119;
  id v120;
  id *v121;
  id *v122;
  void *v123;
  id *v124;
  id *v125;
  id *v126;
  id *v127;
  void *v128;
  id *v129;
  id *v130;
  id v131;
  id *v132;
  void *v133;
  id *v134;
  id *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  id v139;
  id v140;
  id v141;
  void *v142;
  id v143;
  id v144;
  id v145;
  id *v146;
  id *v147;
  id *v148;
  id *v149;
  id *v150;
  id *v151;
  id *v152;
  id *v153;
  id *v154;
  id *v155;
  id *v156;
  id *v157;
  id v158;
  id *v159;
  id v160;
  id *v161;
  id *v162;
  id *v163;
  id *v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  id *v176;
  id *v177;
  id *v178;
  id *v179;
  id *location;
  id *v181;
  id *v182;
  id *v183;
  id *v184;
  id *v185;
  id *v186;
  id *v187;
  id *v188;
  id *v189;
  id *v190;
  id *v191;
  id *v192;
  void *v193;
  id v194;
  id v195;
  _QWORD v196[4];
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  _QWORD v202[4];
  id v203;
  id v204;
  _QWORD v205[4];
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  _QWORD v211[4];
  id v212;
  _QWORD v213[4];
  id v214;
  _QWORD v215[4];
  id v216;
  _QWORD v217[4];
  id v218;
  _QWORD v219[4];
  id *v220;
  _QWORD v221[4];
  id *v222;
  id v223;
  _QWORD v224[4];
  id *v225;
  id *v226;
  id *v227;
  id *v228;
  id v229;
  _QWORD v230[4];
  id *v231;
  id *v232;
  id v233;
  _QWORD v234[4];
  id v235;
  id *v236;
  id *v237;
  id v238;
  _QWORD v239[4];
  id *v240;
  id *v241;
  id *v242;
  id *v243;
  id v244;
  _QWORD v245[4];
  id v246;
  id *v247;
  id *v248;
  id *v249;
  id v250;
  _QWORD v251[4];
  id v252;
  id *v253;
  id *v254;
  id *v255;
  id v256;
  _QWORD v257[4];
  id v258;
  id v259;
  _QWORD v260[4];
  id *v261;
  id v262;
  _QWORD v263[4];
  id *v264;
  id v265;
  _QWORD v266[4];
  id *v267;
  _QWORD v268[4];
  id *v269;
  _QWORD v270[4];
  id *v271;
  id v272;
  _QWORD v273[4];
  id *v274;
  id v275;
  _QWORD v276[4];
  id v277;
  id v278;
  _QWORD v279[4];
  id v280;
  id v281;
  _QWORD v282[4];
  id v283;
  id *v284;
  id v285;
  _QWORD v286[4];
  id v287;
  _QWORD v288[4];
  id *v289;
  id v290;
  _QWORD v291[4];
  id v292;
  id v293;
  _QWORD v294[4];
  id *v295;
  id v296;
  _QWORD v297[4];
  id v298;
  id v299;
  _QWORD v300[4];
  id v301;
  id *v302;
  id *v303;
  id *v304;
  id *v305;
  id v306;
  _QWORD v307[4];
  id *v308;
  id v309;
  _QWORD v310[4];
  id v311;
  id *v312;
  id v313;
  id *v314;
  id v315;
  _QWORD v316[4];
  id v317;
  _QWORD v318[4];
  id v319;
  id v320;
  _QWORD v321[4];
  id v322;
  id v323;
  _QWORD v324[4];
  id *v325;
  _QWORD v326[4];
  id *v327;
  id *v328;
  id *v329;
  id v330;
  _QWORD v331[4];
  id *v332;
  _QWORD v333[4];
  id *v334;
  id *v335;
  id *v336;
  id v337;
  _QWORD v338[4];
  id *v339;
  id *v340;
  id *v341;
  id v342;
  _QWORD v343[4];
  id *v344;
  id *v345;
  id *v346;
  id v347;
  _QWORD v348[4];
  id *v349;
  id *v350;
  id *v351;
  id v352;
  _QWORD v353[4];
  id v354;
  id v355;
  _QWORD v356[4];
  id v357;
  id v358;
  _QWORD v359[4];
  id v360;
  id v361;
  _QWORD v362[4];
  id v363;
  _QWORD v364[4];
  id *v365;
  id v366;
  _QWORD v367[4];
  id *v368;
  id v369;
  id v370;
  _QWORD v371[4];
  id *v372;
  id v373;
  id v374;
  id v375;
  _QWORD v376[4];
  id v377;
  id v378;
  _QWORD v379[4];
  id v380;
  id v381;
  id v382;
  _QWORD v383[4];
  id v384;
  id v385;
  _QWORD v386[4];
  id v387;
  id v388;
  _QWORD v389[4];
  id v390;
  _QWORD v391[4];
  id *v392;
  id v393;
  _QWORD v394[4];
  id v395;
  id v396;
  id v397;
  id v398;
  _QWORD v399[4];
  id v400;
  id v401;
  id v402;
  id v403;
  _QWORD v404[4];
  id v405;
  id v406;
  id v407;
  id v408;
  _QWORD v409[4];
  id v410;
  id v411;
  _QWORD v412[4];
  id v413;
  id v414;
  _QWORD v415[4];
  id v416;
  id *v417;
  id v418;
  id v419;
  _QWORD v420[4];
  id v421;
  _QWORD v422[4];
  id *v423;
  id v424;
  _QWORD v425[4];
  id v426;
  id v427;
  id v428;
  id v429;
  id v430;
  _QWORD v431[4];
  id v432;
  id v433;
  _QWORD v434[4];
  id v435;
  id v436;
  id v437;
  id v438;
  _QWORD v439[4];
  id v440;
  id v441;
  id v442;
  id v443;
  _QWORD v444[4];
  id v445;
  _QWORD v446[4];
  id v447;
  _QWORD v448[4];
  id v449;
  _QWORD v450[4];
  id *v451;
  id v452;
  id *v453;
  id v454;
  id v455;
  _QWORD v456[4];
  id *v457;
  id v458;
  _QWORD v459[4];
  id v460;
  _QWORD v461[4];
  id v462;
  _QWORD v463[4];
  id v464;
  _QWORD v465[4];
  id v466;
  _QWORD v467[4];
  id v468;
  _QWORD v469[4];
  id v470;
  id v471;
  _QWORD v472[4];
  id *v473;
  id v474;
  _QWORD v475[4];
  id v476;
  _QWORD v477[4];
  id v478;
  _QWORD v479[4];
  id v480;
  _QWORD v481[4];
  id v482;
  id v483;
  id v484;
  id v485;
  id v486;
  _QWORD v487[4];
  id v488;
  _QWORD v489[4];
  id v490;
  _QWORD v491[4];
  id v492;
  _QWORD v493[4];
  id v494;
  _QWORD v495[4];
  id v496;
  _QWORD v497[4];
  id v498;
  _QWORD v499[4];
  id v500;
  _QWORD v501[4];
  id v502;
  id v503;
  _QWORD v504[3];
  _QWORD v505[4];
  _QWORD v506[2];
  const __CFString *v507;
  _QWORD v508[2];
  _QWORD v509[6];
  _QWORD v510[6];
  _QWORD v511[12];
  _QWORD v512[9];
  _QWORD v513[8];
  _QWORD v514[2];
  _QWORD v515[2];
  _QWORD v516[2];
  _QWORD v517[4];
  _QWORD v518[2];
  _QWORD v519[2];
  _QWORD v520[12];
  _QWORD v521[12];
  _QWORD v522[2];
  _QWORD v523[2];
  _QWORD v524[3];
  _QWORD v525[4];
  _QWORD v526[9];
  _QWORD v527[4];
  _QWORD v528[4];
  _QWORD v529[7];

  v529[5] = *MEMORY[0x24BDAC8D0];
  -[TVPPlayer stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&v503, self);
  v501[0] = MEMORY[0x24BDAC760];
  v501[1] = 3221225472;
  v501[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke;
  v501[3] = &unk_24F15C7B0;
  objc_copyWeak(&v502, &v503);
  v4 = (void *)MEMORY[0x22E2BA4B0](v501);
  v499[0] = MEMORY[0x24BDAC760];
  v499[1] = 3221225472;
  v499[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3;
  v499[3] = &unk_24F15C800;
  objc_copyWeak(&v500, &v503);
  v193 = (void *)MEMORY[0x22E2BA4B0](v499);
  v497[0] = MEMORY[0x24BDAC760];
  v497[1] = 3221225472;
  v497[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5;
  v497[3] = &unk_24F15C800;
  objc_copyWeak(&v498, &v503);
  v192 = (id *)MEMORY[0x22E2BA4B0](v497);
  v495[0] = MEMORY[0x24BDAC760];
  v495[1] = 3221225472;
  v495[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7;
  v495[3] = &unk_24F15C850;
  objc_copyWeak(&v496, &v503);
  v182 = (id *)MEMORY[0x22E2BA4B0](v495);
  v493[0] = MEMORY[0x24BDAC760];
  v493[1] = 3221225472;
  v493[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9;
  v493[3] = &unk_24F15C878;
  objc_copyWeak(&v494, &v503);
  v5 = (void *)MEMORY[0x22E2BA4B0](v493);
  v491[0] = MEMORY[0x24BDAC760];
  v491[1] = 3221225472;
  v491[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_523;
  v491[3] = &unk_24F15C8A0;
  objc_copyWeak(&v492, &v503);
  v187 = (id *)MEMORY[0x22E2BA4B0](v491);
  v489[0] = MEMORY[0x24BDAC760];
  v489[1] = 3221225472;
  v489[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_525;
  v489[3] = &unk_24F15C8C8;
  objc_copyWeak(&v490, &v503);
  v6 = (void *)MEMORY[0x22E2BA4B0](v489);
  v487[0] = MEMORY[0x24BDAC760];
  v487[1] = 3221225472;
  v487[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_527;
  v487[3] = &unk_24F15C8F0;
  objc_copyWeak(&v488, &v503);
  v7 = (void *)MEMORY[0x22E2BA4B0](v487);
  v481[0] = MEMORY[0x24BDAC760];
  v481[1] = 3221225472;
  v481[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_529;
  v481[3] = &unk_24F15C918;
  v8 = v3;
  v482 = v8;
  objc_copyWeak(&v486, &v503);
  v9 = v5;
  v483 = v9;
  v167 = v6;
  v484 = v167;
  v168 = v7;
  v485 = v168;
  v190 = (id *)MEMORY[0x22E2BA4B0](v481);
  v479[0] = MEMORY[0x24BDAC760];
  v479[1] = 3221225472;
  v479[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_534;
  v479[3] = &unk_24F15C088;
  objc_copyWeak(&v480, &v503);
  v10 = (void *)MEMORY[0x22E2BA4B0](v479);
  v477[0] = MEMORY[0x24BDAC760];
  v477[1] = 3221225472;
  v477[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_535;
  v477[3] = &unk_24F15C088;
  objc_copyWeak(&v478, &v503);
  v11 = (void *)MEMORY[0x22E2BA4B0](v477);
  v475[0] = MEMORY[0x24BDAC760];
  v475[1] = 3221225472;
  v475[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_536;
  v475[3] = &unk_24F15C940;
  objc_copyWeak(&v476, &v503);
  v12 = (void *)MEMORY[0x22E2BA4B0](v475);
  v472[0] = MEMORY[0x24BDAC760];
  v472[1] = 3221225472;
  v472[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_544;
  v472[3] = &unk_24F15C968;
  objc_copyWeak(&v474, &v503);
  v185 = v12;
  v473 = v185;
  v186 = (id *)MEMORY[0x22E2BA4B0](v472);
  v469[0] = MEMORY[0x24BDAC760];
  v469[1] = 3221225472;
  v469[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_546;
  v469[3] = &unk_24F15CA08;
  objc_copyWeak(&v471, &v503);
  v13 = v8;
  v470 = v13;
  v14 = (void *)MEMORY[0x22E2BA4B0](v469);
  v467[0] = MEMORY[0x24BDAC760];
  v467[1] = 3221225472;
  v467[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_556;
  v467[3] = &unk_24F15CA80;
  objc_copyWeak(&v468, &v503);
  v15 = (void *)MEMORY[0x22E2BA4B0](v467);
  v465[0] = MEMORY[0x24BDAC760];
  v465[1] = 3221225472;
  v465[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_561;
  v465[3] = &unk_24F15CAF8;
  objc_copyWeak(&v466, &v503);
  v16 = (void *)MEMORY[0x22E2BA4B0](v465);
  v463[0] = MEMORY[0x24BDAC760];
  v463[1] = 3221225472;
  v463[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_566;
  v463[3] = &unk_24F15CB48;
  objc_copyWeak(&v464, &v503);
  v188 = (id *)MEMORY[0x22E2BA4B0](v463);
  v461[0] = MEMORY[0x24BDAC760];
  v461[1] = 3221225472;
  v461[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_570;
  v461[3] = &unk_24F15CB98;
  objc_copyWeak(&v462, &v503);
  v189 = (id *)MEMORY[0x22E2BA4B0](v461);
  v459[0] = MEMORY[0x24BDAC760];
  v459[1] = 3221225472;
  v459[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_574;
  v459[3] = &unk_24F15CBE8;
  objc_copyWeak(&v460, &v503);
  v17 = (void *)MEMORY[0x22E2BA4B0](v459);
  v456[0] = MEMORY[0x24BDAC760];
  v456[1] = 3221225472;
  v456[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_578;
  v456[3] = &unk_24F15CC10;
  objc_copyWeak(&v458, &v503);
  v179 = v14;
  v457 = v179;
  v18 = (void *)MEMORY[0x22E2BA4B0](v456);
  v450[0] = MEMORY[0x24BDAC760];
  v450[1] = 3221225472;
  v450[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_580;
  v450[3] = &unk_24F15CC38;
  objc_copyWeak(&v455, &v503);
  v177 = v16;
  v451 = v177;
  v169 = v18;
  v452 = v169;
  v176 = v15;
  v453 = v176;
  v19 = v17;
  v454 = v19;
  v191 = (id *)MEMORY[0x22E2BA4B0](v450);
  v448[0] = MEMORY[0x24BDAC760];
  v448[1] = 3221225472;
  v448[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_582;
  v448[3] = &unk_24F15CC60;
  objc_copyWeak(&v449, &v503);
  v184 = (id *)MEMORY[0x22E2BA4B0](v448);
  v446[0] = MEMORY[0x24BDAC760];
  v446[1] = 3221225472;
  v446[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_588;
  v446[3] = &unk_24F15CC88;
  objc_copyWeak(&v447, &v503);
  v183 = (id *)MEMORY[0x22E2BA4B0](v446);
  v444[0] = MEMORY[0x24BDAC760];
  v444[1] = 3221225472;
  v444[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_591;
  v444[3] = &unk_24F15C088;
  objc_copyWeak(&v445, &v503);
  v20 = (void *)MEMORY[0x22E2BA4B0](v444);
  v439[0] = MEMORY[0x24BDAC760];
  v439[1] = 3221225472;
  v439[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_593;
  v439[3] = &unk_24F15CCB0;
  v174 = v10;
  v440 = v174;
  v21 = v11;
  v441 = v21;
  objc_copyWeak(&v443, &v503);
  v22 = v20;
  v442 = v22;
  v23 = (void *)MEMORY[0x22E2BA4B0](v439);
  v434[0] = MEMORY[0x24BDAC760];
  v434[1] = 3221225472;
  v434[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_8_595;
  v434[3] = &unk_24F15CCD8;
  objc_copyWeak(&v438, &v503);
  v172 = v22;
  v436 = v172;
  v24 = v13;
  v435 = v24;
  v25 = v23;
  v437 = v25;
  v26 = (void *)MEMORY[0x22E2BA4B0](v434);
  v431[0] = MEMORY[0x24BDAC760];
  v431[1] = 3221225472;
  v431[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_598;
  v431[3] = &unk_24F15CD00;
  objc_copyWeak(&v433, &v503);
  v27 = v24;
  v432 = v27;
  v28 = (void *)MEMORY[0x22E2BA4B0](v431);
  v425[0] = MEMORY[0x24BDAC760];
  v425[1] = 3221225472;
  v425[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_609;
  v425[3] = &unk_24F15CD28;
  objc_copyWeak(&v430, &v503);
  v29 = v25;
  v427 = v29;
  v170 = v26;
  v428 = v170;
  v30 = v27;
  v426 = v30;
  v31 = v28;
  v429 = v31;
  v178 = (id *)MEMORY[0x22E2BA4B0](v425);
  v422[0] = MEMORY[0x24BDAC760];
  v422[1] = 3221225472;
  v422[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_612;
  v422[3] = &unk_24F15CD70;
  objc_copyWeak(&v424, &v503);
  v181 = (id *)v31;
  v423 = v181;
  v32 = (void *)MEMORY[0x22E2BA4B0](v422);
  v33 = MEMORY[0x24BDAC760];
  v420[0] = MEMORY[0x24BDAC760];
  v420[1] = 3221225472;
  v420[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_615;
  v420[3] = &unk_24F15C1B8;
  v34 = v29;
  v421 = v34;
  objc_msgSend(v30, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Stop"), v420);
  v415[0] = v33;
  v415[1] = 3221225472;
  v415[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_617;
  v415[3] = &unk_24F15CD98;
  objc_copyWeak(&v419, &v503);
  v35 = v30;
  v416 = v35;
  location = (id *)v21;
  v417 = location;
  v171 = v34;
  v418 = v171;
  objc_msgSend(v35, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Set playlist"), v415);
  v412[0] = MEMORY[0x24BDAC760];
  v412[1] = 3221225472;
  v412[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_619;
  v412[3] = &unk_24F15C128;
  objc_copyWeak(&v414, &v503);
  v36 = v35;
  v413 = v36;
  objc_msgSend(v36, "registerHandlerForEvent:onState:withBlock:", CFSTR("Continue loading current item"), CFSTR("Waiting for signal after preparing item"), v412);
  v409[0] = v33;
  v409[1] = 3221225472;
  v409[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_621;
  v409[3] = &unk_24F15CDC0;
  v37 = v4;
  v410 = v37;
  v38 = v32;
  v411 = v38;
  objc_msgSend(v36, "registerHandlerForEvent:onState:withBlock:", CFSTR("Play"), CFSTR("Stopped"), v409);
  v529[0] = CFSTR("Waiting for media item to prepare for loading");
  v529[1] = CFSTR("Waiting for AVAsset to load");
  v529[2] = CFSTR("Waiting for media item to prepare for playback initiation");
  v529[3] = CFSTR("Waiting for more playlist items");
  v529[4] = CFSTR("Waiting for signal after preparing item");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v529, 5);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v404[0] = v33;
  v404[1] = 3221225472;
  v404[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_622;
  v404[3] = &unk_24F15CDE8;
  objc_copyWeak(&v408, &v503);
  v40 = v19;
  v405 = v40;
  v41 = v9;
  v406 = v41;
  v42 = v37;
  v407 = v42;
  objc_msgSend(v36, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Play"), v39, v404);

  v528[0] = CFSTR("Waiting for AVPlayerItem status to become ready to play");
  v528[1] = CFSTR("Waiting for sufficient buffer");
  v528[2] = CFSTR("Waiting for time control status to be done waiting");
  v528[3] = CFSTR("Waiting for seek");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v528, 4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v399[0] = MEMORY[0x24BDAC760];
  v399[1] = 3221225472;
  v399[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_624;
  v399[3] = &unk_24F15CDE8;
  objc_copyWeak(&v403, &v503);
  v44 = v40;
  v400 = v44;
  v45 = v41;
  v401 = v45;
  v46 = v42;
  v402 = v46;
  objc_msgSend(v36, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Play"), v43, v399);

  v527[0] = CFSTR("Playing");
  v527[1] = CFSTR("Paused");
  v527[2] = CFSTR("Scanning using AVPlayer");
  v527[3] = CFSTR("Scanning using AVPlayer driven by AVKit");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v527, 4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v394[0] = MEMORY[0x24BDAC760];
  v394[1] = 3221225472;
  v394[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_626;
  v394[3] = &unk_24F15CDE8;
  objc_copyWeak(&v398, &v503);
  v165 = v44;
  v395 = v165;
  v48 = v45;
  v396 = v48;
  v49 = v46;
  v397 = v49;
  objc_msgSend(v36, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Play"), v47, v394);

  v391[0] = MEMORY[0x24BDAC760];
  v391[1] = 3221225472;
  v391[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_630;
  v391[3] = &unk_24F15CE58;
  v50 = v191;
  v392 = v50;
  objc_copyWeak(&v393, &v503);
  objc_msgSend(v36, "registerHandlerForEvent:onState:withBlock:", CFSTR("Play"), CFSTR("Scanning using external images"), v391);
  v389[0] = MEMORY[0x24BDAC760];
  v389[1] = 3221225472;
  v389[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_631;
  v389[3] = &unk_24F15C0D8;
  objc_copyWeak(&v390, &v503);
  objc_msgSend(v36, "registerHandlerForEvent:onState:withBlock:", CFSTR("Play"), CFSTR("Scanning using external images driven by AVKit"), v389);
  v386[0] = MEMORY[0x24BDAC760];
  v386[1] = 3221225472;
  v386[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_632;
  v386[3] = &unk_24F15C060;
  objc_copyWeak(&v388, &v503);
  v51 = v48;
  v387 = v51;
  objc_msgSend(v36, "registerHandlerForEvent:onState:withBlock:", CFSTR("Play"), CFSTR("Scrubbing using progressive jumping"), v386);
  v383[0] = MEMORY[0x24BDAC760];
  v383[1] = 3221225472;
  v383[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_634;
  v383[3] = &unk_24F15C060;
  objc_copyWeak(&v385, &v503);
  v52 = v51;
  v384 = v52;
  objc_msgSend(v36, "registerHandlerForEvent:onState:withBlock:", CFSTR("Play"), CFSTR("Scrubbing using progressive jumping waiting for seek"), v383);
  v379[0] = MEMORY[0x24BDAC760];
  v379[1] = 3221225472;
  v379[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_635;
  v379[3] = &unk_24F15CE80;
  v53 = v52;
  v380 = v53;
  objc_copyWeak(&v382, &v503);
  v160 = v49;
  v381 = v160;
  objc_msgSend(v36, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Play"), v379);
  v376[0] = MEMORY[0x24BDAC760];
  v376[1] = 3221225472;
  v376[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_636;
  v376[3] = &unk_24F15CDC0;
  v54 = v193;
  v377 = v54;
  v166 = v38;
  v378 = v166;
  objc_msgSend(v36, "registerHandlerForEvent:onState:withBlock:", CFSTR("Pause"), CFSTR("Stopped"), v376);
  v526[0] = CFSTR("Waiting for media item to prepare for loading");
  v526[1] = CFSTR("Waiting for AVAsset to load");
  v526[2] = CFSTR("Waiting for media item to prepare for playback initiation");
  v526[3] = CFSTR("Waiting for AVPlayerItem status to become ready to play");
  v526[4] = CFSTR("Waiting for sufficient buffer");
  v526[5] = CFSTR("Waiting for time control status to be done waiting");
  v526[6] = CFSTR("Waiting for seek");
  v526[7] = CFSTR("Waiting for more playlist items");
  v526[8] = CFSTR("Waiting for signal after preparing item");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v526, 9);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v371[0] = MEMORY[0x24BDAC760];
  v371[1] = 3221225472;
  v371[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_637;
  v371[3] = &unk_24F15CEA8;
  v56 = v189;
  v372 = v56;
  objc_copyWeak(&v375, &v503);
  v57 = v53;
  v373 = v57;
  v58 = v54;
  v374 = v58;
  objc_msgSend(v36, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Pause"), v55, v371);

  v525[0] = CFSTR("Paused");
  v525[1] = CFSTR("Playing");
  v525[2] = CFSTR("Scanning using AVPlayer");
  v525[3] = CFSTR("Scanning using AVPlayer driven by AVKit");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v525, 4);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v367[0] = MEMORY[0x24BDAC760];
  v367[1] = 3221225472;
  v367[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_638;
  v367[3] = &unk_24F15CED0;
  v164 = v56;
  v368 = v164;
  v60 = v57;
  v369 = v60;
  v61 = v58;
  v370 = v61;
  objc_msgSend(v36, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Pause"), v59, v367);

  v364[0] = MEMORY[0x24BDAC760];
  v364[1] = 3221225472;
  v364[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_639;
  v364[3] = &unk_24F15CE58;
  v62 = v50;
  v365 = v62;
  objc_copyWeak(&v366, &v503);
  objc_msgSend(v36, "registerHandlerForEvent:onState:withBlock:", CFSTR("Pause"), CFSTR("Scanning using external images"), v364);
  v362[0] = MEMORY[0x24BDAC760];
  v362[1] = 3221225472;
  v362[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_640;
  v362[3] = &unk_24F15C0D8;
  objc_copyWeak(&v363, &v503);
  objc_msgSend(v36, "registerHandlerForEvent:onState:withBlock:", CFSTR("Pause"), CFSTR("Scanning using external images driven by AVKit"), v362);
  v359[0] = MEMORY[0x24BDAC760];
  v359[1] = 3221225472;
  v359[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_641;
  v359[3] = &unk_24F15C060;
  objc_copyWeak(&v361, &v503);
  v63 = v60;
  v360 = v63;
  objc_msgSend(v36, "registerHandlerForEvent:onState:withBlock:", CFSTR("Pause"), CFSTR("Scrubbing using progressive jumping"), v359);
  v356[0] = MEMORY[0x24BDAC760];
  v356[1] = 3221225472;
  v356[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_643;
  v356[3] = &unk_24F15C060;
  objc_copyWeak(&v358, &v503);
  v64 = v63;
  v357 = v64;
  objc_msgSend(v36, "registerHandlerForEvent:onState:withBlock:", CFSTR("Pause"), CFSTR("Scrubbing using progressive jumping waiting for seek"), v356);
  v65 = MEMORY[0x24BDAC760];
  v353[0] = MEMORY[0x24BDAC760];
  v353[1] = 3221225472;
  v353[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_644;
  v353[3] = &unk_24F15CDC0;
  v66 = v64;
  v354 = v66;
  v158 = v61;
  v355 = v158;
  objc_msgSend(v36, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Pause"), v353);
  v524[0] = CFSTR("Playing");
  v524[1] = CFSTR("Scanning using AVPlayer");
  v524[2] = CFSTR("Scanning using AVPlayer driven by AVKit");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v524, 3);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v348[0] = v65;
  v348[1] = 3221225472;
  v348[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_645;
  v348[3] = &unk_24F15CEF8;
  v68 = v188;
  v349 = v68;
  v69 = v190;
  v350 = v69;
  objc_copyWeak(&v352, &v503);
  v70 = v192;
  v351 = v70;
  objc_msgSend(v36, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Scan with rate"), v67, v348);

  v343[0] = MEMORY[0x24BDAC760];
  v343[1] = 3221225472;
  v343[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_646;
  v343[3] = &unk_24F15CEF8;
  v71 = v68;
  v344 = v71;
  v72 = v69;
  v345 = v72;
  objc_copyWeak(&v347, &v503);
  v73 = v70;
  v346 = v73;
  objc_msgSend(v36, "registerHandlerForEvent:onState:withBlock:", CFSTR("Scan with rate"), CFSTR("Paused"), v343);
  v523[0] = CFSTR("Waiting for sufficient buffer");
  v523[1] = CFSTR("Waiting for time control status to be done waiting");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v523, 2);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v338[0] = MEMORY[0x24BDAC760];
  v338[1] = 3221225472;
  v338[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_647;
  v338[3] = &unk_24F15CEA8;
  v75 = v71;
  v339 = v75;
  objc_copyWeak(&v342, &v503);
  v76 = v72;
  v340 = v76;
  v77 = v73;
  v341 = v77;
  objc_msgSend(v36, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Scan with rate"), v74, v338);

  v522[0] = CFSTR("Scanning using external images");
  v522[1] = CFSTR("Scanning using external images driven by AVKit");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v522, 2);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v333[0] = MEMORY[0x24BDAC760];
  v333[1] = 3221225472;
  v333[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_648;
  v333[3] = &unk_24F15CEF8;
  v79 = v75;
  v334 = v79;
  v80 = v76;
  v335 = v80;
  objc_copyWeak(&v337, &v503);
  v81 = v77;
  v336 = v81;
  objc_msgSend(v36, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Scan with rate"), v78, v333);

  v82 = MEMORY[0x24BDAC760];
  v331[0] = MEMORY[0x24BDAC760];
  v331[1] = 3221225472;
  v331[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_649;
  v331[3] = &unk_24F15C1B8;
  v83 = v81;
  v332 = v83;
  objc_msgSend(v36, "registerHandlerForEvent:onState:withBlock:", CFSTR("Scan with rate"), CFSTR("Waiting for AVKit seek after finishing external image scanning"), v331);
  v326[0] = v82;
  v326[1] = 3221225472;
  v326[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_650;
  v326[3] = &unk_24F15CEA8;
  v163 = v79;
  v327 = v163;
  objc_copyWeak(&v330, &v503);
  v84 = v80;
  v328 = v84;
  v85 = v83;
  v329 = v85;
  objc_msgSend(v36, "registerHandlerForEvent:onState:withBlock:", CFSTR("Scan with rate"), CFSTR("Waiting for seek"), v326);
  v324[0] = v82;
  v324[1] = 3221225472;
  v324[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_651;
  v324[3] = &unk_24F15C1B8;
  v153 = v85;
  v325 = v153;
  objc_msgSend(v36, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Scan with rate"), v324);
  v321[0] = v82;
  v321[1] = 3221225472;
  v321[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_8_652;
  v321[3] = &unk_24F15C128;
  objc_copyWeak(&v323, &v503);
  v86 = v36;
  v322 = v86;
  objc_msgSend(v86, "registerHandlerForEvent:onState:withBlock:", CFSTR("Media item loader did prepare item for loading"), CFSTR("Waiting for media item to prepare for loading"), v321);
  v318[0] = MEMORY[0x24BDAC760];
  v318[1] = 3221225472;
  v318[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_10_654;
  v318[3] = &unk_24F15C128;
  objc_copyWeak(&v320, &v503);
  v87 = v86;
  v319 = v87;
  objc_msgSend(v87, "registerHandlerForEvent:onState:withBlock:", CFSTR("Media item loader did load AVAsset keys"), CFSTR("Waiting for AVAsset to load"), v318);
  v521[0] = CFSTR("Paused");
  v521[1] = CFSTR("Playing");
  v521[2] = CFSTR("Scanning using AVPlayer");
  v521[3] = CFSTR("Scanning using AVPlayer driven by AVKit");
  v521[4] = CFSTR("Scanning using external images");
  v521[5] = CFSTR("Scanning using external images driven by AVKit");
  v521[6] = CFSTR("Waiting for AVKit seek after finishing external image scanning");
  v521[7] = CFSTR("Scrubbing using progressive jumping");
  v521[8] = CFSTR("Scrubbing using progressive jumping waiting for seek");
  v521[9] = CFSTR("Waiting for seek");
  v521[10] = CFSTR("Waiting for sufficient buffer");
  v521[11] = CFSTR("Waiting for time control status to be done waiting");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v521, 12);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v316[0] = MEMORY[0x24BDAC760];
  v316[1] = 3221225472;
  v316[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_12;
  v316[3] = &unk_24F15C0D8;
  objc_copyWeak(&v317, &v503);
  objc_msgSend(v87, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Media item loader did load AVAsset keys"), v88, v316);

  v310[0] = MEMORY[0x24BDAC760];
  v310[1] = 3221225472;
  v310[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_13;
  v310[3] = &unk_24F15CF20;
  objc_copyWeak(&v315, &v503);
  v156 = v185;
  v312 = v156;
  v89 = v87;
  v311 = v89;
  v90 = v66;
  v313 = v90;
  v91 = v186;
  v314 = v91;
  objc_msgSend(v89, "registerHandlerForEvent:onState:withBlock:", CFSTR("Media item did prepare for playback initiation"), CFSTR("Waiting for media item to prepare for playback initiation"), v310);
  v520[0] = CFSTR("Paused");
  v520[1] = CFSTR("Playing");
  v520[2] = CFSTR("Scanning using AVPlayer");
  v520[3] = CFSTR("Scanning using AVPlayer driven by AVKit");
  v520[4] = CFSTR("Scanning using external images");
  v520[5] = CFSTR("Scanning using external images driven by AVKit");
  v520[6] = CFSTR("Waiting for AVKit seek after finishing external image scanning");
  v520[7] = CFSTR("Scrubbing using progressive jumping");
  v520[8] = CFSTR("Scrubbing using progressive jumping waiting for seek");
  v520[9] = CFSTR("Waiting for seek");
  v520[10] = CFSTR("Waiting for sufficient buffer");
  v520[11] = CFSTR("Waiting for time control status to be done waiting");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v520, 12);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v307[0] = MEMORY[0x24BDAC760];
  v307[1] = 3221225472;
  v307[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_658;
  v307[3] = &unk_24F15C060;
  objc_copyWeak(&v309, &v503);
  v157 = v91;
  v308 = v157;
  objc_msgSend(v89, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Media item did prepare for playback initiation"), v92, v307);

  v300[0] = MEMORY[0x24BDAC760];
  v300[1] = 3221225472;
  v300[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_659;
  v300[3] = &unk_24F15CF70;
  objc_copyWeak(&v306, &v503);
  v154 = location;
  v302 = v154;
  v161 = v184;
  v303 = v161;
  v162 = v183;
  v304 = v162;
  v93 = v89;
  v301 = v93;
  v94 = v181;
  v305 = v94;
  objc_msgSend(v93, "registerHandlerForEvent:onState:withBlock:", CFSTR("Current player item status did become ready to play"), CFSTR("Waiting for AVPlayerItem status to become ready to play"), v300);
  v297[0] = MEMORY[0x24BDAC760];
  v297[1] = 3221225472;
  v297[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_669;
  v297[3] = &unk_24F15C128;
  objc_copyWeak(&v299, &v503);
  v95 = v93;
  v298 = v95;
  objc_msgSend(v95, "registerHandlerForEvent:onState:withBlock:", CFSTR("Sufficient buffer did become available"), CFSTR("Waiting for sufficient buffer"), v297);
  v294[0] = MEMORY[0x24BDAC760];
  v294[1] = 3221225472;
  v294[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_674;
  v294[3] = &unk_24F15C060;
  objc_copyWeak(&v296, &v503);
  v96 = v187;
  v295 = v96;
  objc_msgSend(v95, "registerHandlerForEvent:onState:withBlock:", CFSTR("Time control status did change"), CFSTR("Waiting for time control status to be done waiting"), v294);
  v291[0] = MEMORY[0x24BDAC760];
  v291[1] = 3221225472;
  v291[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_677;
  v291[3] = &unk_24F15C128;
  objc_copyWeak(&v293, &v503);
  v97 = v95;
  v292 = v97;
  objc_msgSend(v97, "registerHandlerForEvent:onState:withBlock:", CFSTR("Time control status did change"), CFSTR("Playing"), v291);
  v288[0] = MEMORY[0x24BDAC760];
  v288[1] = 3221225472;
  v288[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_679;
  v288[3] = &unk_24F15C060;
  objc_copyWeak(&v290, &v503);
  v151 = v96;
  v289 = v151;
  objc_msgSend(v97, "registerHandlerForEvent:onState:withBlock:", CFSTR("Time control status did change"), CFSTR("Paused"), v288);
  v519[0] = CFSTR("Scanning using AVPlayer");
  v519[1] = CFSTR("Scanning using AVPlayer driven by AVKit");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v519, 2);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v286[0] = MEMORY[0x24BDAC760];
  v286[1] = 3221225472;
  v286[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_680;
  v286[3] = &unk_24F15C0D8;
  objc_copyWeak(&v287, &v503);
  objc_msgSend(v97, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Time control status did change"), v98, v286);

  v518[0] = CFSTR("Scanning using AVPlayer");
  v518[1] = CFSTR("Scanning using AVPlayer driven by AVKit");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v518, 2);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v282[0] = MEMORY[0x24BDAC760];
  v282[1] = 3221225472;
  v282[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_681;
  v282[3] = &unk_24F15CF98;
  objc_copyWeak(&v285, &v503);
  v152 = v84;
  v284 = v152;
  v100 = v97;
  v283 = v100;
  objc_msgSend(v100, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Buffer did become empty"), v99, v282);

  v517[0] = CFSTR("Playing");
  v517[1] = CFSTR("Paused");
  v517[2] = CFSTR("Waiting for sufficient buffer");
  v517[3] = CFSTR("Waiting for time control status to be done waiting");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v517, 4);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v279[0] = MEMORY[0x24BDAC760];
  v279[1] = 3221225472;
  v279[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_682;
  v279[3] = &unk_24F15CFC0;
  v102 = v100;
  v280 = v102;
  objc_copyWeak(&v281, &v503);
  objc_msgSend(v102, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Hit beginning or end"), v101, v279);

  v516[0] = CFSTR("Scanning using AVPlayer");
  v516[1] = CFSTR("Scanning using AVPlayer driven by AVKit");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v516, 2);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v276[0] = MEMORY[0x24BDAC760];
  v276[1] = 3221225472;
  v276[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_686;
  v276[3] = &unk_24F15C060;
  objc_copyWeak(&v278, &v503);
  v104 = v90;
  v277 = v104;
  objc_msgSend(v102, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Hit beginning or end"), v103, v276);

  v515[0] = CFSTR("Scanning using external images");
  v515[1] = CFSTR("Scanning using external images driven by AVKit");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v515, 2);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v273[0] = MEMORY[0x24BDAC760];
  v273[1] = 3221225472;
  v273[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_691;
  v273[3] = &unk_24F15C060;
  objc_copyWeak(&v275, &v503);
  v106 = v62;
  v274 = v106;
  objc_msgSend(v102, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Hit beginning or end"), v105, v273);

  v514[0] = CFSTR("Scrubbing using progressive jumping");
  v514[1] = CFSTR("Scrubbing using progressive jumping waiting for seek");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v514, 2);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v270[0] = MEMORY[0x24BDAC760];
  v270[1] = 3221225472;
  v270[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_692;
  v270[3] = &unk_24F15C060;
  objc_copyWeak(&v272, &v503);
  v108 = v179;
  v271 = v108;
  objc_msgSend(v102, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Hit beginning or end"), v107, v270);

  v513[0] = CFSTR("Playing");
  v513[1] = CFSTR("Scanning using AVPlayer");
  v513[2] = CFSTR("Scanning using AVPlayer driven by AVKit");
  v513[3] = CFSTR("Scanning using external images");
  v513[4] = CFSTR("Scanning using external images driven by AVKit");
  v513[5] = CFSTR("Waiting for AVKit seek after finishing external image scanning");
  v513[6] = CFSTR("Scrubbing using progressive jumping");
  v513[7] = CFSTR("Scrubbing using progressive jumping waiting for seek");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v513, 8);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v268[0] = MEMORY[0x24BDAC760];
  v268[1] = 3221225472;
  v268[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_694;
  v268[3] = &unk_24F15C1B8;
  v110 = v178;
  v269 = v110;
  objc_msgSend(v102, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Playlist current media item did change"), v109, v268);

  v266[0] = MEMORY[0x24BDAC760];
  v266[1] = 3221225472;
  v266[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_695;
  v266[3] = &unk_24F15C1B8;
  v111 = v110;
  v267 = v111;
  objc_msgSend(v102, "registerHandlerForEvent:onState:withBlock:", CFSTR("Playlist current media item did change"), CFSTR("Paused"), v266);
  v512[0] = CFSTR("Waiting for media item to prepare for loading");
  v512[1] = CFSTR("Waiting for AVAsset to load");
  v512[2] = CFSTR("Waiting for signal after preparing item");
  v512[3] = CFSTR("Waiting for media item to prepare for playback initiation");
  v512[4] = CFSTR("Waiting for AVPlayerItem status to become ready to play");
  v512[5] = CFSTR("Waiting for sufficient buffer");
  v512[6] = CFSTR("Waiting for time control status to be done waiting");
  v512[7] = CFSTR("Waiting for seek");
  v512[8] = CFSTR("Waiting for more playlist items");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v512, 9);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v263[0] = MEMORY[0x24BDAC760];
  v263[1] = 3221225472;
  v263[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_8_696;
  v263[3] = &unk_24F15CE58;
  v159 = v111;
  v264 = v159;
  objc_copyWeak(&v265, &v503);
  objc_msgSend(v102, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Playlist current media item did change"), v112, v263);

  v511[0] = CFSTR("Paused");
  v511[1] = CFSTR("Playing");
  v511[2] = CFSTR("Scanning using AVPlayer");
  v511[3] = CFSTR("Scanning using AVPlayer driven by AVKit");
  v511[4] = CFSTR("Scanning using external images");
  v511[5] = CFSTR("Scanning using external images driven by AVKit");
  v511[6] = CFSTR("Waiting for AVKit seek after finishing external image scanning");
  v511[7] = CFSTR("Scrubbing using progressive jumping");
  v511[8] = CFSTR("Scrubbing using progressive jumping waiting for seek");
  v511[9] = CFSTR("Waiting for seek");
  v511[10] = CFSTR("Waiting for sufficient buffer");
  v511[11] = CFSTR("Waiting for time control status to be done waiting");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v511, 12);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v260[0] = MEMORY[0x24BDAC760];
  v260[1] = 3221225472;
  v260[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9_697;
  v260[3] = &unk_24F15C060;
  objc_copyWeak(&v262, &v503);
  v155 = v94;
  v261 = v155;
  objc_msgSend(v102, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Playlist next media item did change"), v113, v260);

  v257[0] = MEMORY[0x24BDAC760];
  v257[1] = 3221225472;
  v257[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_699;
  v257[3] = &unk_24F15CE58;
  v194 = v104;
  v258 = v194;
  objc_copyWeak(&v259, &v503);
  objc_msgSend(v102, "registerHandlerForEvent:onState:withBlock:", CFSTR("Rate used for playback did change"), CFSTR("Playing"), v257);
  v510[0] = CFSTR("Stopped");
  v510[1] = CFSTR("Waiting for media item to prepare for loading");
  v510[2] = CFSTR("Waiting for signal after preparing item");
  v510[3] = CFSTR("Waiting for AVAsset to load");
  v510[4] = CFSTR("Waiting for media item to prepare for playback initiation");
  v510[5] = CFSTR("Waiting for more playlist items");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v510, 6);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v251[0] = MEMORY[0x24BDAC760];
  v251[1] = 3221225472;
  v251[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_700;
  v251[3] = &unk_24F15CF20;
  objc_copyWeak(&v256, &v503);
  v115 = v176;
  v253 = v115;
  v116 = v102;
  v252 = v116;
  v117 = v182;
  v254 = v117;
  v118 = v177;
  v255 = v118;
  objc_msgSend(v116, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Set elapsed time or date"), v114, v251);

  v245[0] = MEMORY[0x24BDAC760];
  v245[1] = 3221225472;
  v245[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_703;
  v245[3] = &unk_24F15CF20;
  objc_copyWeak(&v250, &v503);
  v119 = v118;
  v247 = v119;
  v120 = v116;
  v246 = v120;
  v121 = v117;
  v248 = v121;
  v122 = v115;
  v249 = v122;
  objc_msgSend(v120, "registerHandlerForEvent:onState:withBlock:", CFSTR("Set elapsed time or date"), CFSTR("Waiting for AVPlayerItem status to become ready to play"), v245);
  v509[0] = CFSTR("Playing");
  v509[1] = CFSTR("Paused");
  v509[2] = CFSTR("Scanning using AVPlayer");
  v509[3] = CFSTR("Scanning using AVPlayer driven by AVKit");
  v509[4] = CFSTR("Waiting for sufficient buffer");
  v509[5] = CFSTR("Waiting for time control status to be done waiting");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v509, 6);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v239[0] = MEMORY[0x24BDAC760];
  v239[1] = 3221225472;
  v239[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9_706;
  v239[3] = &unk_24F15D038;
  v124 = v122;
  v240 = v124;
  v125 = v119;
  v241 = v125;
  objc_copyWeak(&v244, &v503);
  v126 = v108;
  v242 = v126;
  v127 = v121;
  v243 = v127;
  objc_msgSend(v120, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Set elapsed time or date"), v123, v239);

  v508[0] = CFSTR("Scanning using external images");
  v508[1] = CFSTR("Scanning using external images driven by AVKit");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v508, 2);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v234[0] = MEMORY[0x24BDAC760];
  v234[1] = 3221225472;
  v234[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_10_707;
  v234[3] = &unk_24F15D060;
  v129 = v124;
  v236 = v129;
  v130 = v125;
  v237 = v130;
  objc_copyWeak(&v238, &v503);
  v131 = v120;
  v235 = v131;
  objc_msgSend(v131, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Set elapsed time or date"), v128, v234);

  v230[0] = MEMORY[0x24BDAC760];
  v230[1] = 3221225472;
  v230[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_11_708;
  v230[3] = &unk_24F15CE80;
  v150 = v106;
  v231 = v150;
  objc_copyWeak(&v233, &v503);
  v132 = v127;
  v232 = v132;
  objc_msgSend(v131, "registerHandlerForEvent:onState:withBlock:", CFSTR("Set elapsed time or date"), CFSTR("Waiting for AVKit seek after finishing external image scanning"), v230);
  v507 = CFSTR("Waiting for seek");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v507, 1);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v224[0] = MEMORY[0x24BDAC760];
  v224[1] = 3221225472;
  v224[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_12_709;
  v224[3] = &unk_24F15D038;
  v148 = v129;
  v225 = v148;
  v149 = v130;
  v226 = v149;
  objc_copyWeak(&v229, &v503);
  v134 = v126;
  v227 = v134;
  v135 = v132;
  v228 = v135;
  objc_msgSend(v131, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Set elapsed time or date"), v133, v224);

  v506[0] = CFSTR("Scrubbing using progressive jumping");
  v506[1] = CFSTR("Scrubbing using progressive jumping waiting for seek");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v506, 2);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v221[0] = MEMORY[0x24BDAC760];
  v221[1] = 3221225472;
  v221[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_13_710;
  v221[3] = &unk_24F15CE58;
  v147 = v134;
  v222 = v147;
  objc_copyWeak(&v223, &v503);
  objc_msgSend(v131, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Set elapsed time or date"), v136, v221);

  v137 = MEMORY[0x24BDAC760];
  v219[0] = MEMORY[0x24BDAC760];
  v219[1] = 3221225472;
  v219[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_14_711;
  v219[3] = &unk_24F15C1B8;
  v146 = v135;
  v220 = v146;
  objc_msgSend(v131, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Set elapsed time or date"), v219);
  v217[0] = v137;
  v217[1] = 3221225472;
  v217[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_15_712;
  v217[3] = &unk_24F15C0D8;
  objc_copyWeak(&v218, &v503);
  objc_msgSend(v131, "registerHandlerForEvent:onState:withBlock:", CFSTR("Seek completed"), CFSTR("Waiting for seek"), v217);
  v215[0] = MEMORY[0x24BDAC760];
  v215[1] = 3221225472;
  v215[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_713;
  v215[3] = &unk_24F15C0D8;
  objc_copyWeak(&v216, &v503);
  objc_msgSend(v131, "registerHandlerForEvent:onState:withBlock:", CFSTR("Seek completed"), CFSTR("Scrubbing using progressive jumping waiting for seek"), v215);
  v213[0] = MEMORY[0x24BDAC760];
  v213[1] = 3221225472;
  v213[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_714;
  v213[3] = &unk_24F15C0D8;
  objc_copyWeak(&v214, &v503);
  objc_msgSend(v131, "registerHandlerForEvent:onState:withBlock:", CFSTR("Interstitial boundary crossed"), CFSTR("Playing"), v213);
  v505[0] = CFSTR("Scanning using AVPlayer");
  v505[1] = CFSTR("Scanning using AVPlayer driven by AVKit");
  v505[2] = CFSTR("Scanning using external images");
  v505[3] = CFSTR("Scanning using external images driven by AVKit");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v505, 4);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v211[0] = MEMORY[0x24BDAC760];
  v211[1] = 3221225472;
  v211[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_716;
  v211[3] = &unk_24F15C0D8;
  objc_copyWeak(&v212, &v503);
  objc_msgSend(v131, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Interstitial boundary crossed"), v138, v211);

  objc_msgSend(v131, "registerHandlerForEvent:onState:withBlock:", CFSTR("Error did occur"), CFSTR("Stopped"), &__block_literal_global_719);
  v205[0] = MEMORY[0x24BDAC760];
  v205[1] = 3221225472;
  v205[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_720;
  v205[3] = &unk_24F15D0D0;
  objc_copyWeak(&v210, &v503);
  v139 = v174;
  v207 = v139;
  v140 = v172;
  v208 = v140;
  v141 = v131;
  v206 = v141;
  v175 = v171;
  v209 = v175;
  objc_msgSend(v141, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Error did occur"), v205);
  v504[0] = CFSTR("Playing");
  v504[1] = CFSTR("Waiting for sufficient buffer");
  v504[2] = CFSTR("Waiting for time control status to be done waiting");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v504, 3);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v202[0] = MEMORY[0x24BDAC760];
  v202[1] = 3221225472;
  v202[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_734;
  v202[3] = &unk_24F15C128;
  objc_copyWeak(&v204, &v503);
  v143 = v141;
  v203 = v143;
  objc_msgSend(v143, "registerHandlerForEvent:onStates:withBlock:", CFSTR("Current player item did stall"), v142, v202);

  v196[0] = MEMORY[0x24BDAC760];
  v196[1] = 3221225472;
  v196[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_738;
  v196[3] = &unk_24F15D0F8;
  objc_copyWeak(&v201, &v503);
  v173 = v194;
  v198 = v173;
  v195 = v139;
  v199 = v195;
  v144 = v140;
  v200 = v144;
  v145 = v143;
  v197 = v145;
  objc_msgSend(v145, "registerDefaultHandlerForEvent:withBlock:", CFSTR("Restart playback"), v196);

  objc_destroyWeak(&v201);
  objc_destroyWeak(&v204);

  objc_destroyWeak(&v210);
  objc_destroyWeak(&v212);
  objc_destroyWeak(&v214);
  objc_destroyWeak(&v216);
  objc_destroyWeak(&v218);

  objc_destroyWeak(&v223);
  objc_destroyWeak(&v229);

  objc_destroyWeak(&v233);
  objc_destroyWeak(&v238);

  objc_destroyWeak(&v244);
  objc_destroyWeak(&v250);

  objc_destroyWeak(&v256);
  objc_destroyWeak(&v259);

  objc_destroyWeak(&v262);
  objc_destroyWeak(&v265);

  objc_destroyWeak(&v272);
  objc_destroyWeak(&v275);

  objc_destroyWeak(&v278);
  objc_destroyWeak(&v281);

  objc_destroyWeak(&v285);
  objc_destroyWeak(&v287);

  objc_destroyWeak(&v290);
  objc_destroyWeak(&v293);

  objc_destroyWeak(&v296);
  objc_destroyWeak(&v299);

  objc_destroyWeak(&v306);
  objc_destroyWeak(&v309);

  objc_destroyWeak(&v315);
  objc_destroyWeak(&v317);

  objc_destroyWeak(&v320);
  objc_destroyWeak(&v323);

  objc_destroyWeak(&v330);
  objc_destroyWeak(&v337);

  objc_destroyWeak(&v342);
  objc_destroyWeak(&v347);

  objc_destroyWeak(&v352);
  objc_destroyWeak(&v358);

  objc_destroyWeak(&v361);
  objc_destroyWeak(&v363);
  objc_destroyWeak(&v366);

  objc_destroyWeak(&v375);
  objc_destroyWeak(&v382);

  objc_destroyWeak(&v385);
  objc_destroyWeak(&v388);
  objc_destroyWeak(&v390);
  objc_destroyWeak(&v393);

  objc_destroyWeak(&v398);
  objc_destroyWeak(&v403);

  objc_destroyWeak(&v408);
  objc_destroyWeak(&v414);

  objc_destroyWeak(&v419);
  objc_destroyWeak(&v424);

  objc_destroyWeak(&v430);
  objc_destroyWeak(&v433);

  objc_destroyWeak(&v438);
  objc_destroyWeak(&v443);

  objc_destroyWeak(&v445);
  objc_destroyWeak(&v447);

  objc_destroyWeak(&v449);
  objc_destroyWeak(&v455);

  objc_destroyWeak(&v458);
  objc_destroyWeak(&v460);

  objc_destroyWeak(&v462);
  objc_destroyWeak(&v464);

  objc_destroyWeak(&v466);
  objc_destroyWeak(&v468);

  objc_destroyWeak(&v471);
  objc_destroyWeak(&v474);

  objc_destroyWeak(&v476);
  objc_destroyWeak(&v478);

  objc_destroyWeak(&v480);
  objc_destroyWeak(&v486);

  objc_destroyWeak(&v488);
  objc_destroyWeak(&v490);

  objc_destroyWeak(&v492);
  objc_destroyWeak(&v494);

  objc_destroyWeak(&v496);
  objc_destroyWeak(&v498);

  objc_destroyWeak(&v500);
  objc_destroyWeak(&v502);
  objc_destroyWeak(&v503);

}

void __66__TVPPlayer__updateCurrentMediaItemAudioInfoForPlayerItem_tracks___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "currentMediaItemAudioFormat") != *(_QWORD *)(a1 + 40))
    {
      v4 = (void *)sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v5 = v4;
        objc_msgSend((id)objc_opt_class(), "_stringForAudioFormat:", *(_QWORD *)(a1 + 40));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v6;
        _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "Audio format: %@", (uint8_t *)&v9, 0xCu);

      }
      objc_msgSend(v3, "setCurrentMediaItemAudioFormat:", *(_QWORD *)(a1 + 40));
    }
    if (objc_msgSend(v3, "currentMediaItemAudioChannels") != *(_QWORD *)(a1 + 48))
    {
      v7 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(void **)(a1 + 48);
        v9 = 134217984;
        v10 = v8;
        _os_log_impl(&dword_228A4E000, v7, OS_LOG_TYPE_DEFAULT, "Audio channels: %ld", (uint8_t *)&v9, 0xCu);
      }
      objc_msgSend(v3, "setCurrentMediaItemAudioChannels:", *(_QWORD *)(a1 + 48));
    }
  }

}

void __66__TVPPlayer__updateCurrentMediaItemAudioInfoForPlayerItem_tracks___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t mChannelLayoutTag_low;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  const opaqueCMFormatDescription *v14;
  int64_t v15;
  const AudioFormatListItem *FormatList;
  uint64_t v18;
  id v19;
  _QWORD block[4];
  id v21[3];
  size_t sizeOut;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v28;
    mChannelLayoutTag_low = -1;
    v18 = *(_QWORD *)v28;
    v19 = v1;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v28 != v5)
          objc_enumerationMutation(v1);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v8, "statusOfValueForKey:error:", CFSTR("enabled"), 0) == 2
          && objc_msgSend(v8, "isEnabled")
          && objc_msgSend(v8, "statusOfValueForKey:error:", CFSTR("formatDescriptions"), 0) == 2)
        {
          objc_msgSend(v8, "formatDescriptions");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v24 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(const opaqueCMFormatDescription **)(*((_QWORD *)&v23 + 1) + 8 * j);
                v15 = +[TVPPlayer _audioFormatForFormatDescription:](TVPPlayer, "_audioFormatForFormatDescription:", v14);
                if (v15 > (uint64_t)v4)
                  v4 = (void *)v15;
                sizeOut = 0;
                FormatList = CMAudioFormatDescriptionGetFormatList(v14, &sizeOut);
                if (FormatList && mChannelLayoutTag_low <= LOWORD(FormatList->mChannelLayoutTag))
                  mChannelLayoutTag_low = LOWORD(FormatList->mChannelLayoutTag);
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v11);
          }

          v5 = v18;
          v1 = v19;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
    mChannelLayoutTag_low = -1;
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__TVPPlayer__updateCurrentMediaItemAudioInfoForPlayerItem_tracks___block_invoke_3;
  block[3] = &unk_24F15C6C0;
  objc_copyWeak(v21, (id *)(a1 + 40));
  v21[1] = v4;
  v21[2] = (id)mChannelLayoutTag_low;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(v21);
}

void __66__TVPPlayer__updateCurrentMediaItemAudioInfoForPlayerItem_tracks___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __58__TVPPlayer__setState_updatedRate_reason_notifyListeners___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  id WeakRetained;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("TVPPlaybackStateDidChangeNotification"), WeakRetained, *(_QWORD *)(a1 + 32));

  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v5, "currentMediaItem");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "reportingDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(double *)(a1 + 64);
    v10 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v6, "mediaItem:didChangeFromPlaybackState:toPlaybackState:updatedRate:player:", v12, v7, v8, v10, v9);

  }
  v11 = objc_loadWeakRetained(v3);
  objc_msgSend(v11, "didChangeValueForKey:", CFSTR("rate"));

}

void __56__TVPPlayer__updateCurrentMediaItemVideoRangeForTracks___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = objc_msgSend((id)objc_opt_class(), "tvpVideoRangeForVideoDynamicRange:", *(unsigned int *)(a1 + 40));
    objc_msgSend(WeakRetained, "setCurrentMediaItemVideoRange:", v3);
    v4 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      objc_msgSend(WeakRetained, "_descriptionForVideoRange:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "Current video range: <%@>", (uint8_t *)&v7, 0xCu);

    }
  }

}

void __56__TVPPlayer__updateCurrentMediaItemVideoRangeForTracks___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  int VideoDynamicRange;
  _QWORD block[4];
  id v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(v1);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v7, "statusOfValueForKey:error:", CFSTR("enabled"), 0) == 2
          && objc_msgSend(v7, "isEnabled")
          && objc_msgSend(v7, "statusOfValueForKey:error:", CFSTR("formatDescriptions"), 0) == 2)
        {
          objc_msgSend(v7, "formatDescriptions");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v19;
            do
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v19 != v11)
                  objc_enumerationMutation(v8);
                VideoDynamicRange = CMVideoFormatDescriptionGetVideoDynamicRange();
              }
              v4 = VideoDynamicRange;
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
            }
            while (v10);
          }

        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__TVPPlayer__updateCurrentMediaItemVideoRangeForTracks___block_invoke_3;
  block[3] = &unk_24F15C6E8;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v17 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v16);
}

void __56__TVPPlayer__updateCurrentMediaItemVideoRangeForTracks___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __50__TVPPlayer_automaticallyNotifiesObserversForKey___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("playlist"), CFSTR("currentMediaItem"), CFSTR("currentMediaItemHasVideoContent"), CFSTR("currentMediaItemIsStreaming"), CFSTR("currentMediaItemPresentationSize"), CFSTR("currentMediaItemHasDates"), CFSTR("state"), CFSTR("errorBehavior"), CFSTR("interactive"), CFSTR("rate"), CFSTR("rateUsedForPlayback"), CFSTR("elapsedTime"), CFSTR("playbackDate"), CFSTR("duration"), CFSTR("muted"), CFSTR("volume"), CFSTR("bufferedTimeRange"),
    CFSTR("seekableTimeRange"),
    CFSTR("seekableDateRange"),
    CFSTR("mediaItemEndAction"),
    CFSTR("maximumBitRate"),
    CFSTR("startPosition"),
    CFSTR("accessLog"),
    CFSTR("errorLog"),
    CFSTR("playlistInternal"),
    CFSTR("currentPlayerItem"),
    CFSTR("cachedDuration"),
    CFSTR("cachedLoadedTimeRanges"),
    CFSTR("cachedSeekableTimeRanges"),
    CFSTR("AVQueuePlayer"),
    CFSTR("chapterCollections"),
    CFSTR("currentChapterCollection"),
    CFSTR("currentChapter"),
    CFSTR("currentInterstitialCollection"),
    CFSTR("currentInterstitial"),
    CFSTR("audioOptions"),
    CFSTR("subtitleOptions"),
    CFSTR("selectedAudioOption"),
    CFSTR("selectedSubtitleOption"),
    CFSTR("currentMediaItemInitialLoadingComplete"),
    CFSTR("preventsSleepDuringVideoPlayback"),
    CFSTR("isLive"),
    CFSTR("allowsExternalPlayback"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)automaticallyNotifiesObserversForKey__keysToNotifyManually;
  automaticallyNotifiesObserversForKey__keysToNotifyManually = v0;

}

uint64_t __48__TVPPlayer__updateVideoViewsWithAVQueuePlayer___block_invoke_2(uint64_t result, void *a2, uint64_t a3)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) != a3)
    return objc_msgSend(a2, "setAVPlayer:", *(_QWORD *)(result + 32));
  return result;
}

uint64_t __48__TVPPlayer__updateVideoViewsWithAVQueuePlayer___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isPrimarySubtitleDisplayer");
  if ((_DWORD)result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

void __48__TVPPlayer__currentMediaItemMetadataDidChange___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("TVPMediaItemMetadataStoreItemIdentifier"), CFSTR("TVPMediaItemMetadataTitle"), CFSTR("TVPMediaItemMetadataSeriesTitle"), CFSTR("TVPMediaItemMetadataSubtitle"), CFSTR("TVPMediaItemMetadataLongDescription"), CFSTR("TVPMediaItemMetadataContentRating"), CFSTR("TVPMediaItemMetadataGenre"), CFSTR("TVPMediaItemMetadataDateReleased"), CFSTR("TVPMediaItemMetadataAlbum"), CFSTR("TVPMediaItemMetadataTomatoPercentage"), CFSTR("TVPMediaItemMetadataTomatoFreshness"), CFSTR("TVPMediaItemMetadataArtworkURLString"), CFSTR("TVPMediaItemMetadataArtworkImageProxy"), CFSTR("TVPMediaItemMetadataInterstitialCollection"), CFSTR("TVPMediaItemMetadataScrubImageVideoMediaItem"), CFSTR("TVPMediaItemMetadataExternalImageConfig"), CFSTR("TVPMediaItemMetadataExternalImageConfigURL"),
         CFSTR("TVPMediaItemMetadataExternalIdentifier"),
         CFSTR("TVPMediaItemMetadataExternalProfileIdentifier"),
         CFSTR("TVPMediaItemMetadataExternalServiceIdentifier"),
         CFSTR("TVPMediaItemMetadataPlaybackProgress"),
         CFSTR("TVPMediaItemMetadataExactStartTime"),
         CFSTR("TVPMediaItemMetadataExactEndTime"),
         CFSTR("TVPMediaItemMetadataProgramScheduleStartTime"),
         CFSTR("TVPMediaItemMetadataProgramScheduleEndTime"),
         CFSTR("TVPMediaItemMetadataSportingVenueName"),
         CFSTR("TVPMediaItemMetadataSportingVenueAddress"),
         CFSTR("TVPMediaItemMetadataSportingLeagueName"),
         CFSTR("TVPMediaItemMetadataSportingLeagueShortName"),
         CFSTR("TVPMediaItemMetadataSportingEventType"),
         CFSTR("TVPMediaItemMetadataCurrentEmbeddedSongAdamID"),
         0);
  v1 = (void *)_currentMediaItemMetadataDidChange__metadataKeysUsedByAVKit;
  _currentMediaItemMetadataDidChange__metadataKeysUsedByAVKit = v0;

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3(uint64_t a1, void *a2, char a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  _QWORD v8[4];
  id v9;
  char v10;

  v5 = a2;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "stateMachine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4;
    v8[3] = &unk_24F15C7D8;
    v9 = v5;
    v10 = a3;
    objc_msgSend(v7, "executeBlockAfterCurrentStateTransition:", v8);

  }
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_15(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVPPlaybackReportingBufferingWillStartNotification"), WeakRetained);

}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_13(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  __CFString *v23;
  double v24;
  double v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  _BOOL4 v30;
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  _BOOL4 v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  NSObject *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  id v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  id v57;
  void *v58;
  _BOOL4 v59;
  void *v61;
  void *v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  uint8_t buf[4];
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v63 = a3;
  v64 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKey:", CFSTR("Media item loader key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mediaItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "playlist");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentMediaItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v12, "isEqualToMediaItem:", v16);

  if ((_DWORD)a4)
  {
    v17 = objc_loadWeakRetained((id *)(a1 + 64));
    v18 = objc_msgSend(v17, "createsPlayerItemButDoesNotEnqueue");

    if (v18)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v20, "setUnqueuedPlayerItem:", v19);

      v21 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v21, "stateMachine");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = MEMORY[0x24BDAC760];
      v71[1] = 3221225472;
      v71[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_14;
      v71[3] = &unk_24F15C088;
      objc_copyWeak(&v72, v13);
      objc_msgSend(v22, "executeBlockAfterCurrentStateTransition:", v71);

      objc_destroyWeak(&v72);
LABEL_26:

      v23 = CFSTR("Waiting for AVPlayerItem status to become ready to play");
      goto LABEL_27;
    }
    objc_msgSend(v11, "timingData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaItem");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "reportingDelegate");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v25 = v24;
    objc_msgSend(v19, "setStartTimeForAVPlayerItemLoading:");
    objc_msgSend(v19, "setStartTimeForBuffering:", v25);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v26 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v61, "mediaItemWillStartBuffering:player:", v62, v26);

    }
    v27 = *(void **)(a1 + 32);
    v69[0] = MEMORY[0x24BDAC760];
    v69[1] = 3221225472;
    v69[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_15;
    v69[3] = &unk_24F15C088;
    objc_copyWeak(&v70, (id *)(a1 + 64));
    objc_msgSend(v27, "executeBlockAfterCurrentStateTransition:", v69);
    v28 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v28, "AVQueuePlayer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29 == 0;

    if (v30)
    {
      v31 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v31, "earlyAVQueuePlayer");
      v32 = (id)objc_claimAutoreleasedReturnValue();

      v33 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v33, "setEarlyAVQueuePlayer:", 0);

      v34 = sPlayerLogObject;
      v35 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
      if (v32)
      {
        if (v35)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_228A4E000, v34, OS_LOG_TYPE_DEFAULT, "Using previously created AVQueuePlayer", buf, 2u);
        }
      }
      else
      {
        if (v35)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_228A4E000, v34, OS_LOG_TYPE_DEFAULT, "Creating AVQueuePlayer", buf, 2u);
        }
        v32 = +[TVPPlayer _newAVQueuePlayer](TVPPlayer, "_newAVQueuePlayer");
      }
      objc_msgSend(v32, "playbackCoordinator");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v36, "setDelegate:", v37);

      v38 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v38, "setAVQueuePlayer:", v32);

      v39 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v39, "_logExternalPlaybackType");

      v40 = *(void **)(a1 + 32);
      v67[0] = MEMORY[0x24BDAC760];
      v67[1] = 3221225472;
      v67[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_656;
      v67[3] = &unk_24F15C088;
      objc_copyWeak(&v68, (id *)(a1 + 64));
      objc_msgSend(v40, "executeBlockAfterCurrentStateTransition:", v67);
      objc_destroyWeak(&v68);

    }
    v41 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v41, "_removePlaybackEndTimeBoundaryObservers");

    v42 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v42, "_addPlaybackEndTimeBoundaryObservers");

    v43 = objc_loadWeakRetained((id *)(a1 + 64));
    if ((objc_msgSend(v43, "haveEverEnqueuedPlayerItem") & 1) == 0)
    {
      v44 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v44, "postLoadingState");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      +[TVPPlaybackState playing](TVPPlaybackState, "playing");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v45 == v46;

      if (!v47)
      {
LABEL_21:
        v53 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v53, "AVQueuePlayer");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "items");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "count") == 0;

        if (v56)
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        v57 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v57, "currentPlayerItem");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "status") == 1;

        if (v59)
        {
          v65[0] = MEMORY[0x24BDAC760];
          v65[1] = 3221225472;
          v65[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_657;
          v65[3] = &unk_24F15C088;
          objc_copyWeak(&v66, (id *)(a1 + 64));
          objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v65);
          objc_destroyWeak(&v66);
        }
        objc_destroyWeak(&v70);

        goto LABEL_26;
      }
      v48 = (id)sPlayerLogObject;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v49, "rateUsedForPlayback");
        *(_DWORD *)buf = 134217984;
        v74 = v50;
        _os_log_impl(&dword_228A4E000, v48, OS_LOG_TYPE_DEFAULT, "Fast start: setting player's rate to %f prior to enqueueing first item", buf, 0xCu);

      }
      v51 = *(_QWORD *)(a1 + 48);
      v43 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v43, "rateUsedForPlayback");
      *(float *)&v52 = v52;
      (*(void (**)(uint64_t, float, double))(v51 + 16))(v51, *(float *)&v52, 0.0);
    }

    goto LABEL_21;
  }
  objc_msgSend(v9, "currentState");
  v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_27:

  return v23;
}

void __39__TVPPlayer__statesThatReturnStartTime__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("Stopped"), CFSTR("Waiting for media item to prepare for loading"), CFSTR("Waiting for signal after preparing item"), CFSTR("Waiting for AVAsset to load"), CFSTR("Waiting for media item to prepare for playback initiation"), CFSTR("Waiting for AVPlayerItem status to become ready to play"), CFSTR("Waiting for more playlist items"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_statesThatReturnStartTime_states;
  _statesThatReturnStartTime_states = v0;

}

- (BOOL)waitsAfterPreparingMediaItems
{
  return self->_waitsAfterPreparingMediaItems;
}

- (NSHashTable)videoViewWeakReferences
{
  return self->_videoViewWeakReferences;
}

- (void)updateAudioSelectionCriteria
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend((id)objc_opt_class(), "savedPreferredAudioLanguageCode");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[TVPPlayer preferredAudioLanguageCode](self, "preferredAudioLanguageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TVPPlayer preferredAudioLanguageCode](self, "preferredAudioLanguageCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  if (v9)
    objc_msgSend(v3, "addObject:", v9);
  v6 = (void *)objc_opt_class();
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPPlayer currentMediaItemLoader](self, "currentMediaItemLoader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_updateAudioSelectionCriteriaForAVQueuePlayer:mediaItemLoader:preferredAudioLanguageCodes:prefersAudioDescriptions:", v7, v8, v3, -[TVPPlayer prefersAudioDescriptions](self, "prefersAudioDescriptions"));

}

- (TVPPlaybackState)state
{
  return self->_state;
}

- (TVPStateMachine)stateMachine
{
  return self->_stateMachine;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startingSeekPrecision
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 640);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 616);
  return self;
}

- (double)startPosition
{
  return self->_startPosition;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setWaitsAfterPreparingMediaItems:(BOOL)a3
{
  self->_waitsAfterPreparingMediaItems = a3;
}

- (void)setTimeBeingSeekedTo:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_timeBeingSeekedTo.epoch = a3->var3;
  *(_OWORD *)&self->_timeBeingSeekedTo.value = v3;
}

- (void)setTimeAtStartOfSeek:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_timeAtStartOfSeek.epoch = a3->var3;
  *(_OWORD *)&self->_timeAtStartOfSeek.value = v3;
}

- (void)setSubtitleOptions:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_subtitleOptions != v5)
  {
    v6 = v5;
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("subtitleOptions"));
    objc_storeStrong((id *)&self->_subtitleOptions, a3);
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("subtitleOptions"));
    v5 = v6;
  }

}

- (void)setStartingSeekPrecision:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_startingSeekPrecision.epoch = a3->var3;
  *(_OWORD *)&self->_startingSeekPrecision.value = v3;
}

- (void)setStartTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_startTime.epoch = a3->var3;
  *(_OWORD *)&self->_startTime.value = v3;
}

- (void)setStartPosition:(double)a3
{
  self->_startPosition = a3;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void)setSendsPlayerReports:(BOOL)a3
{
  TVPPlayerReporter *v4;

  if (self->_sendsPlayerReports != a3)
  {
    self->_sendsPlayerReports = a3;
    if (a3)
    {
      v4 = -[TVPPlayerReporter initWithPlayer:]([TVPPlayerReporter alloc], "initWithPlayer:", self);
      -[TVPPlayer setPlayerReporter:](self, "setPlayerReporter:", v4);

    }
    else
    {
      -[TVPPlayer setPlayerReporter:](self, "setPlayerReporter:", 0);
    }
  }
}

- (void)setPreferredMaximumResolutionForExpensiveNetworks:(CGSize)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->_preferredMaximumResolutionForExpensiveNetworks.width != a3.width
    || self->_preferredMaximumResolutionForExpensiveNetworks.height != a3.height)
  {
    self->_preferredMaximumResolutionForExpensiveNetworks = a3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setPreferredMaximumResolutionForExpensiveNetworks:", self->_preferredMaximumResolutionForExpensiveNetworks.width, self->_preferredMaximumResolutionForExpensiveNetworks.height);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)setPostLoadingState:(id)a3
{
  TVPPlaybackState *v4;
  NSObject *v5;
  TVPPlaybackState *postLoadingState;
  int v7;
  TVPPlaybackState *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (TVPPlaybackState *)a3;
  v5 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "Setting post loading state to %@", (uint8_t *)&v7, 0xCu);
  }
  postLoadingState = self->_postLoadingState;
  self->_postLoadingState = v4;

}

- (void)setPlaylistInternal:(id)a3
{
  TVPPlaylist *v5;
  TVPPlaylist *v6;

  v5 = (TVPPlaylist *)a3;
  if (self->_playlistInternal != v5)
  {
    v6 = v5;
    -[TVPPlayer _removeObserversForPlaylist:](self, "_removeObserversForPlaylist:");
    objc_storeStrong((id *)&self->_playlistInternal, a3);
    -[TVPPlayer _addObserversForPlaylist:](self, "_addObserversForPlaylist:", self->_playlistInternal);
    -[TVPPlayer _updateAVPlayerActionAtItemEnd](self, "_updateAVPlayerActionAtItemEnd");
    -[TVPPlayer setLoadingInitialItemInPlaylist:](self, "setLoadingInitialItemInPlaylist:", 1);
    -[TVPPlayer setInitialMediaItemHasCompletedInitialLoading:](self, "setInitialMediaItemHasCompletedInitialLoading:", 0);
    -[TVPPlayer setCurrentDirectionOfPlaylistChange:](self, "setCurrentDirectionOfPlaylistChange:", 0);
    v5 = v6;
  }

}

- (void)setPlaylist:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v8 = CFSTR("Playlist key");
    v9[0] = a3;
    v4 = (void *)MEMORY[0x24BDBCE70];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[TVPPlayer stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Set playlist"), 0, v6);

}

- (void)setPlayerReporter:(id)a3
{
  objc_storeStrong((id *)&self->_playerReporter, a3);
}

- (void)setPlayerItemChangeIsHappening:(BOOL)a3
{
  self->_playerItemChangeIsHappening = a3;
}

- (void)setPlaybackEndTimeBoundaryObserverTokens:(id)a3
{
  objc_storeStrong((id *)&self->_playbackEndTimeBoundaryObserverTokens, a3);
}

- (void)setPlaybackDateAtStartOfSeek:(id)a3
{
  objc_storeStrong((id *)&self->_playbackDateAtStartOfSeek, a3);
}

- (void)setPeriodicTimeObserverToken:(id)a3
{
  objc_storeStrong(&self->_periodicTimeObserverToken, a3);
}

- (void)setMuted:(BOOL)a3
{
  id v5;

  -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("muted"));
  self->_muted = a3;
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMuted:", self->_muted);
  -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("muted"));

}

- (void)setModifyingAVPlayerRate:(BOOL)a3
{
  self->_modifyingAVPlayerRate = a3;
}

- (void)setModifyingAVPlayerQueue:(BOOL)a3
{
  self->_modifyingAVPlayerQueue = a3;
}

- (void)setMediaItemEndAction:(int64_t)a3
{
  if (self->_mediaItemEndAction != a3)
  {
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("mediaItemEndAction"));
    self->_mediaItemEndAction = a3;
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("mediaItemEndAction"));
    -[TVPPlayer _updateAVPlayerActionAtItemEnd](self, "_updateAVPlayerActionAtItemEnd");
  }
}

- (void)setLoadingInitialItemInPlaylist:(BOOL)a3
{
  self->_loadingInitialItemInPlaylist = a3;
}

- (void)setIsLive:(BOOL)a3
{
  if (self->_isLive != a3)
  {
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isLive"));
    self->_isLive = a3;
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isLive"));
  }
}

- (void)setInitialMediaItemHasCompletedInitialLoading:(BOOL)a3
{
  self->_initialMediaItemHasCompletedInitialLoading = a3;
}

- (void)setHaveEverEnqueuedPlayerItem:(BOOL)a3
{
  self->_haveEverEnqueuedPlayerItem = a3;
}

- (void)setExternalImagePlayer:(id)a3
{
  objc_storeStrong((id *)&self->_externalImagePlayer, a3);
}

- (void)setEarlyAVQueuePlayer:(id)a3
{
  objc_storeStrong((id *)&self->_earlyAVQueuePlayer, a3);
}

- (void)setDateBeingSeekedTo:(id)a3
{
  objc_storeStrong((id *)&self->_dateBeingSeekedTo, a3);
}

- (void)setCurrentPlayerItem:(id)a3
{
  TVPPlayerItem *v5;
  TVPPlayerItem *currentPlayerItem;
  id *p_currentPlayerItem;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (TVPPlayerItem *)a3;
  currentPlayerItem = self->_currentPlayerItem;
  if (currentPlayerItem != v5)
  {
    p_currentPlayerItem = (id *)&self->_currentPlayerItem;
    if (currentPlayerItem)
    {
      v8 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *p_currentPlayerItem;
        v13 = 138412290;
        v14 = v9;
        _os_log_impl(&dword_228A4E000, v8, OS_LOG_TYPE_DEFAULT, "Setting AVPlayerItem delegate to nil for %@", (uint8_t *)&v13, 0xCu);
      }
      objc_msgSend(*p_currentPlayerItem, "setDelegate:", 0);
      v10 = *p_currentPlayerItem;
    }
    else
    {
      v10 = 0;
    }
    -[TVPPlayer _removeObserversForPlayerItem:](self, "_removeObserversForPlayerItem:", v10);
    -[TVPPlayerItem cancelPendingSeeks](self->_currentPlayerItem, "cancelPendingSeeks");
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentPlayerItem"));
    objc_storeStrong((id *)&self->_currentPlayerItem, a3);
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentPlayerItem"));
    -[TVPPlayer _addObserversForPlayerItem:](self, "_addObserversForPlayerItem:", self->_currentPlayerItem);
    if (self->_currentPlayerItem)
    {
      v11 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *p_currentPlayerItem;
        v13 = 138412290;
        v14 = v12;
        _os_log_impl(&dword_228A4E000, v11, OS_LOG_TYPE_DEFAULT, "Setting AVPlayerItem delegate to self for %@", (uint8_t *)&v13, 0xCu);
      }
      -[TVPPlayerItem setDelegate:](self->_currentPlayerItem, "setDelegate:", self);
    }
  }

}

- (void)setCurrentMediaItemVideoRange:(int64_t)a3
{
  self->_currentMediaItemVideoRange = a3;
}

- (void)setCurrentMediaItemPresentationSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;

  height = a3.height;
  width = a3.width;
  if (self->_currentMediaItemPresentationSize.width != a3.width
    || self->_currentMediaItemPresentationSize.height != a3.height)
  {
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentMediaItemPresentationSize"));
    self->_currentMediaItemPresentationSize.width = width;
    self->_currentMediaItemPresentationSize.height = height;
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentMediaItemPresentationSize"));
  }
}

- (void)setCurrentMediaItemIsStreaming:(BOOL)a3
{
  if (self->_currentMediaItemIsStreaming != a3)
  {
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentMediaItemIsStreaming"));
    self->_currentMediaItemIsStreaming = a3;
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentMediaItemIsStreaming"));
  }
}

- (void)setCurrentMediaItemHasVideoContent:(BOOL)a3
{
  if (self->_currentMediaItemHasVideoContent != a3)
  {
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentMediaItemHasVideoContent"));
    self->_currentMediaItemHasVideoContent = a3;
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentMediaItemHasVideoContent"));
  }
}

- (void)setCurrentMediaItemHasDates:(BOOL)a3
{
  if (self->_currentMediaItemHasDates != a3)
  {
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentMediaItemHasDates"));
    self->_currentMediaItemHasDates = a3;
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentMediaItemHasDates"));
  }
}

- (void)setCurrentMediaItemAudioFormat:(int64_t)a3
{
  self->_currentMediaItemAudioFormat = a3;
}

- (void)setCurrentMediaItemAudioChannels:(int64_t)a3
{
  self->_currentMediaItemAudioChannels = a3;
}

- (void)setCurrentInterstitialCollection:(id)a3
{
  TVPInterstitialCollection *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id location;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = (TVPInterstitialCollection *)a3;
  if (self->_currentInterstitialCollection != v5)
  {
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentInterstitialCollection"));
    objc_storeStrong((id *)&self->_currentInterstitialCollection, a3);
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentInterstitialCollection"));
    -[TVPPlayer interstitialBoundaryTimeObserverToken](self, "interstitialBoundaryTimeObserverToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer removeBoundaryTimeObserverWithToken:](self, "removeBoundaryTimeObserverWithToken:", v6);

    -[TVPPlayer setInterstitialBoundaryTimeObserverToken:](self, "setInterstitialBoundaryTimeObserverToken:", 0);
    -[TVPPlayer elapsedTime](self, "elapsedTime");
    -[TVPInterstitialCollection interstitialForTime:](v5, "interstitialForTime:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer setCurrentInterstitial:](self, "setCurrentInterstitial:", v7);

    -[TVPInterstitialCollection interstitials](v5, "interstitials");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v9 = v20;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v25;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v25 != v11)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v12), "timeRange");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v13, "startTime");
            objc_msgSend(v14, "numberWithDouble:");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v15);

            v16 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v13, "endTime");
            objc_msgSend(v16, "numberWithDouble:");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v17);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v10);
      }

      objc_initWeak(&location, self);
      objc_msgSend(v8, "allObjects");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __46__TVPPlayer_setCurrentInterstitialCollection___block_invoke;
      v21[3] = &unk_24F15C530;
      objc_copyWeak(&v22, &location);
      -[TVPPlayer addBoundaryTimeObserverForTimes:withHandler:](self, "addBoundaryTimeObserverForTimes:withHandler:", v18, v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[TVPPlayer setInterstitialBoundaryTimeObserverToken:](self, "setInterstitialBoundaryTimeObserverToken:", v19);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);

    }
  }

}

- (void)setCurrentInterstitial:(id)a3
{
  TVPInterstitial *v5;
  TVPInterstitial *v6;

  v5 = (TVPInterstitial *)a3;
  if (self->_currentInterstitial != v5)
  {
    v6 = v5;
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentInterstitial"));
    objc_storeStrong((id *)&self->_currentInterstitial, a3);
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentInterstitial"));
    v5 = v6;
  }

}

- (void)setCurrentDirectionOfPlaylistChange:(int64_t)a3
{
  self->_currentDirectionOfPlaylistChange = a3;
}

- (void)setCurrentChapterCollection:(id)a3
{
  TVPChapterCollection *v5;
  TVPChapterCollection *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  TVPChapterCollection *v22;
  id v23;
  id location;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = (TVPChapterCollection *)a3;
  v6 = v5;
  if (self->_currentChapterCollection != v5)
  {
    if (!v5
      || (-[TVPPlayer chapterCollections](self, "chapterCollections"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "containsObject:", v6),
          v7,
          v8))
    {
      -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentChapterCollection"));
      objc_storeStrong((id *)&self->_currentChapterCollection, a3);
      -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentChapterCollection"));
      -[TVPPlayer chapterBoundaryTimeObserverToken](self, "chapterBoundaryTimeObserverToken");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPPlayer removeBoundaryTimeObserverWithToken:](self, "removeBoundaryTimeObserverWithToken:", v9);

      -[TVPPlayer setChapterBoundaryTimeObserverToken:](self, "setChapterBoundaryTimeObserverToken:", 0);
      -[TVPPlayer elapsedTime](self, "elapsedTime");
      -[TVPChapterCollection chapterForTime:](v6, "chapterForTime:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPPlayer setCurrentChapter:](self, "setCurrentChapter:", v10);

      -[TVPChapterCollection chapters](v6, "chapters");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "count"))
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v12 = v20;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v26;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v26 != v14)
                objc_enumerationMutation(v12);
              v16 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v15), "timeRange");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "startTime");
              objc_msgSend(v16, "numberWithDouble:");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v18);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          }
          while (v13);
        }

        objc_initWeak(&location, self);
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __41__TVPPlayer_setCurrentChapterCollection___block_invoke;
        v21[3] = &unk_24F15C508;
        objc_copyWeak(&v23, &location);
        v22 = v6;
        -[TVPPlayer addBoundaryTimeObserverForTimes:withHandler:](self, "addBoundaryTimeObserverForTimes:withHandler:", v11, v21);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVPPlayer setChapterBoundaryTimeObserverToken:](self, "setChapterBoundaryTimeObserverToken:", v19);

        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);

      }
    }
  }

}

- (void)setCurrentChapter:(id)a3
{
  TVPChapter *v5;
  TVPChapter *v6;

  v5 = (TVPChapter *)a3;
  if (self->_currentChapter != v5)
  {
    v6 = v5;
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentChapter"));
    objc_storeStrong((id *)&self->_currentChapter, a3);
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentChapter"));
    v5 = v6;
  }

}

- (void)setChapterCollections:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_chapterCollections != v5)
  {
    v6 = v5;
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("chapterCollections"));
    objc_storeStrong((id *)&self->_chapterCollections, a3);
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("chapterCollections"));
    v5 = v6;
  }

}

- (void)setCachedSelectedAudioOption:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSelectedAudioOption, a3);
}

- (void)setCachedSeekableTimeRanges:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_cachedSeekableTimeRanges != v5)
  {
    v6 = v5;
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cachedSeekableTimeRanges"));
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("seekableTimeRange"));
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("seekableDateRange"));
    objc_storeStrong((id *)&self->_cachedSeekableTimeRanges, a3);
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cachedSeekableTimeRanges"));
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("seekableTimeRange"));
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("seekableDateRange"));
    v5 = v6;
  }

}

- (void)setCachedLoadedTimeRanges:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_cachedLoadedTimeRanges != v5)
  {
    v6 = v5;
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cachedLoadedTimeRanges"));
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bufferedTimeRange"));
    objc_storeStrong((id *)&self->_cachedLoadedTimeRanges, a3);
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cachedLoadedTimeRanges"));
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bufferedTimeRange"));
    v5 = v6;
  }

}

- (void)setCachedDuration:(id *)a3
{
  $95D729B680665BEAEFA1D6FCA8238556 *p_cachedDuration;
  __int128 v6;
  $95D729B680665BEAEFA1D6FCA8238556 cachedDuration;
  CMTime time1;

  p_cachedDuration = &self->_cachedDuration;
  time1 = *(CMTime *)a3;
  cachedDuration = self->_cachedDuration;
  if (CMTimeCompare(&time1, (CMTime *)&cachedDuration))
  {
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("cachedDuration"));
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("duration"));
    v6 = *(_OWORD *)&a3->var0;
    p_cachedDuration->epoch = a3->var3;
    *(_OWORD *)&p_cachedDuration->value = v6;
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("cachedDuration"));
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("duration"));
  }
}

- (void)setAudioOptions:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_audioOptions != v5)
  {
    v6 = v5;
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("audioOptions"));
    objc_storeStrong((id *)&self->_audioOptions, a3);
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("audioOptions"));
    v5 = v6;
  }

}

- (void)setAllowsExternalPlayback:(BOOL)a3
{
  id v5;

  -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("allowsExternalPlayback"));
  self->_allowsExternalPlayback = a3;
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsExternalPlayback:", self->_allowsExternalPlayback);
  -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("allowsExternalPlayback"));

}

- (void)setAllowsConstrainedNetworkUsage:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_allowsConstrainedNetworkUsage != a3)
  {
    v3 = a3;
    self->_allowsConstrainedNetworkUsage = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[TVPPlayer mediaItemLoaders](self, "mediaItemLoaders", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setAllowsConstrainedNetworkUsage:", v3);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)setAllowsCellularUsage:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_allowsCellularUsage != a3)
  {
    v3 = a3;
    self->_allowsCellularUsage = a3;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[TVPPlayer mediaItemLoaders](self, "mediaItemLoaders", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setAllowsCellularUsage:", v3);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)setAVQueuePlayer:(id)a3
{
  AVQueuePlayer *v5;
  void *v6;
  uint64_t v7;
  double v8;
  NSObject *v9;
  AVQueuePlayer *AVQueuePlayer;
  _BOOL8 muted;
  double v12;
  uint8_t v13[16];

  v5 = (AVQueuePlayer *)a3;
  if (self->_AVQueuePlayer != v5)
  {
    -[TVPPlayer _removeObserversFromAVQueuePlayer:](self, "_removeObserversFromAVQueuePlayer:");
    -[TVPPlayer _removePeriodicTimeObserverFromAVQueuePlayer:](self, "_removePeriodicTimeObserverFromAVQueuePlayer:", self->_AVQueuePlayer);
    -[TVPPlayer _removeHighFrequencyTimeObserverIfNecessary](self, "_removeHighFrequencyTimeObserverIfNecessary");
    -[TVPPlayer _removeBoundaryTimeObserversFromAVQueuePlayer:](self, "_removeBoundaryTimeObserversFromAVQueuePlayer:", self->_AVQueuePlayer);
    -[TVPPlayer _removePlaybackEndTimeBoundaryObservers](self, "_removePlaybackEndTimeBoundaryObservers");
    -[AVQueuePlayer removeAllItems](self->_AVQueuePlayer, "removeAllItems");
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("AVQueuePlayer"));
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("avPlayer"));
    objc_storeStrong((id *)&self->_AVQueuePlayer, a3);
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("AVQueuePlayer"));
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("avPlayer"));
    -[TVPPlayer _updateVideoViewsWithAVQueuePlayer:](self, "_updateVideoViewsWithAVQueuePlayer:", self->_AVQueuePlayer);
    -[TVPPlayer _addObserversToAVQueuePlayer:](self, "_addObserversToAVQueuePlayer:", self->_AVQueuePlayer);
    -[TVPPlayer _addPeriodicTimeObserverToAVQueuePlayer:](self, "_addPeriodicTimeObserverToAVQueuePlayer:", self->_AVQueuePlayer);
    -[TVPPlayer _addHighFrequencyTimeObserverIfNecessary](self, "_addHighFrequencyTimeObserverIfNecessary");
    -[TVPPlayer boundaryTimeObserverInfos](self, "boundaryTimeObserverInfos");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
      -[TVPPlayer _addBoundaryTimeObserversToAVQueuePlayer:](self, "_addBoundaryTimeObserversToAVQueuePlayer:", self->_AVQueuePlayer);
    LODWORD(v8) = 0;
    -[AVQueuePlayer setMinRateForAudioPlayback:](self->_AVQueuePlayer, "setMinRateForAudioPlayback:", v8);
    if (-[TVPPlayer _isScreenBeingRecorded](self, "_isScreenBeingRecorded"))
    {
      v9 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Screen is being recorded.  Muting AVQueuePlayer", v13, 2u);
      }
      -[TVPPlayer setWasMutedPriorToScreenRecording:](self, "setWasMutedPriorToScreenRecording:", self->_muted);
      AVQueuePlayer = self->_AVQueuePlayer;
      muted = 1;
    }
    else
    {
      AVQueuePlayer = self->_AVQueuePlayer;
      muted = self->_muted;
    }
    -[AVQueuePlayer setMuted:](AVQueuePlayer, "setMuted:", muted);
    *(float *)&v12 = self->_volume;
    -[AVQueuePlayer setVolume:](self->_AVQueuePlayer, "setVolume:", v12);
    -[AVQueuePlayer setAllowsExternalPlayback:](self->_AVQueuePlayer, "setAllowsExternalPlayback:", self->_allowsExternalPlayback);
    if (-[TVPPlayer limitsBandwidthForCellularAccess](self, "limitsBandwidthForCellularAccess"))
      -[AVQueuePlayer _setLimitsBandwidthForCellularAccess:](self->_AVQueuePlayer, "_setLimitsBandwidthForCellularAccess:", 1);
    -[AVQueuePlayer setPreventsDisplaySleepDuringVideoPlayback:](self->_AVQueuePlayer, "setPreventsDisplaySleepDuringVideoPlayback:", -[TVPPlayer preventsSleepDuringVideoPlayback](self, "preventsSleepDuringVideoPlayback"));
    -[TVPPlayer _updateAVPlayerActionAtItemEnd](self, "_updateAVPlayerActionAtItemEnd");
  }

}

- (NSString)reportingCategory
{
  return self->_reportingCategory;
}

- (BOOL)preventsSleepDuringVideoPlayback
{
  return self->_preventsSleepDuringVideoPlayback;
}

- (BOOL)prefersAudioDescriptions
{
  return self->_prefersAudioDescriptions;
}

- (CGSize)preferredMaximumResolution
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredMaximumResolution.width;
  height = self->_preferredMaximumResolution.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)preferredMaximumResolutionForExpensiveNetworks
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredMaximumResolutionForExpensiveNetworks.width;
  height = self->_preferredMaximumResolutionForExpensiveNetworks.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)preferredForwardBufferDuration
{
  return self->_preferredForwardBufferDuration;
}

- (NSString)preferredAudioLanguageCode
{
  return self->_preferredAudioLanguageCode;
}

- (TVPPlaybackState)postLoadingState
{
  return self->_postLoadingState;
}

- (TVPPlayerItem)playerItemFromCacheManager
{
  return self->_playerItemFromCacheManager;
}

- (BOOL)playerItemChangeIsHappening
{
  return self->_playerItemChangeIsHappening;
}

- (NSArray)playbackEndTimeBoundaryObserverTokens
{
  return self->_playbackEndTimeBoundaryObserverTokens;
}

- (id)playbackCoordinator:(id)a3 identifierForPlayerItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "mediaItemLoader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVPPlayer playlist](self, "playlist");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentMediaItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToMediaItem:", v9);

    -[TVPPlayer playlist](self, "playlist");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      objc_msgSend(v11, "currentMediaItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v16 = v13;
      objc_msgSend(v13, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataPlaybackCoordinatorIdentifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    objc_msgSend(v11, "nextMediaItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v7, "isEqualToMediaItem:", v14);

    if (v15)
    {
      -[TVPPlayer playlist](self, "playlist");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "nextMediaItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
  else
  {
    v7 = 0;
  }
  v17 = 0;
LABEL_9:
  v18 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138412546;
    v21 = v17;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_228A4E000, v18, OS_LOG_TYPE_DEFAULT, "Delegate callback playbackCoordinator:identifierForPlayerItem: returning identifier %@ for media item %@", (uint8_t *)&v20, 0x16u);
  }

  return v17;
}

- (id)periodicTimeObserverToken
{
  return self->_periodicTimeObserverToken;
}

- (NSArray)pendingSelectedMediaArray
{
  return self->_pendingSelectedMediaArray;
}

- (void)pause
{
  id v2;

  -[TVPPlayer stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Pause"));

}

- (NSString)name
{
  return self->_name;
}

- (BOOL)modifyingAVPlayerQueue
{
  return self->_modifyingAVPlayerQueue;
}

- (NSMutableSet)mediaItemLoaders
{
  return self->_mediaItemLoaders;
}

- (int64_t)mediaItemEndAction
{
  return self->_mediaItemEndAction;
}

- (double)maximumBitRate
{
  return self->_maximumBitRate;
}

- (BOOL)limitsBandwidthForCellularAccess
{
  return self->_limitsBandwidthForCellularAccess;
}

- (BOOL)interactive
{
  return self->_interactive;
}

- (TVPPlayer)initWithName:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  TVPPlayerBookmarkMonitor *v21;
  void *v22;
  TVPPlayerReporter *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  dispatch_queue_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  TVPStateMachine *v44;
  void *v45;
  __int128 v47;
  __int128 v48;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)TVPPlayer;
  v5 = -[TVPPlayer init](&v49, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)*((_QWORD *)v5 + 9);
    *((_QWORD *)v5 + 9) = v6;

    +[TVPPlaybackState stopped](TVPPlaybackState, "stopped");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v8;

    *((_QWORD *)v5 + 11) = 0;
    *((_QWORD *)v5 + 12) = 0x3FF0000000000000;
    *((_DWORD *)v5 + 12) = 1065353216;
    *((_QWORD *)v5 + 13) = 0;
    *((_QWORD *)v5 + 14) = 0x47EFFFFFE0000000;
    v5[12] = 1;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v5 + 29);
    *((_QWORD *)v5 + 29) = v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v5 + 30);
    *((_QWORD *)v5 + 30) = v12;

    v14 = MEMORY[0x24BDC0D40];
    *(_OWORD *)(v5 + 760) = *MEMORY[0x24BDC0D40];
    v15 = (__int128 *)MEMORY[0x24BDC0D88];
    *((_QWORD *)v5 + 97) = *(_QWORD *)(v14 + 16);
    v47 = *v15;
    *((_OWORD *)v5 + 46) = *v15;
    v16 = *((_QWORD *)v15 + 2);
    *((_QWORD *)v5 + 94) = v16;
    *(_OWORD *)(v5 + 616) = v47;
    *((_QWORD *)v5 + 79) = v16;
    *((_QWORD *)v5 + 82) = v16;
    *((_OWORD *)v5 + 40) = v47;
    *((_QWORD *)v5 + 50) = 0;
    +[TVPPlaybackState playing](TVPPlaybackState, "playing");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v5 + 26);
    *((_QWORD *)v5 + 26) = v17;

    +[TVPPlaybackState playing](TVPPlaybackState, "playing");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)*((_QWORD *)v5 + 27);
    *((_QWORD *)v5 + 27) = v19;

    *((_OWORD *)v5 + 43) = v47;
    *((_QWORD *)v5 + 88) = v16;
    *(_OWORD *)(v5 + 712) = v47;
    *((_QWORD *)v5 + 91) = v16;
    v5[32] = 1;
    v48 = *MEMORY[0x24BDBF148];
    *(_OWORD *)(v5 + 552) = *MEMORY[0x24BDBF148];
    v5[27] = 1;
    v21 = -[TVPPlayerBookmarkMonitor initWithPlayer:]([TVPPlayerBookmarkMonitor alloc], "initWithPlayer:", v5);
    v22 = (void *)*((_QWORD *)v5 + 35);
    *((_QWORD *)v5 + 35) = v21;

    v5[28] = 1;
    v23 = -[TVPPlayerReporter initWithPlayer:]([TVPPlayerReporter alloc], "initWithPlayer:", v5);
    v24 = (void *)*((_QWORD *)v5 + 36);
    *((_QWORD *)v5 + 36) = v23;

    *(_WORD *)(v5 + 15) = 1;
    v5[41] = 0;
    v5[17] = 0;
    v5[25] = 0;
    *(_OWORD *)(v5 + 600) = v48;
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)*((_QWORD *)v5 + 38);
    *((_QWORD *)v5 + 38) = v25;

    v27 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v28 = (void *)*((_QWORD *)v5 + 39);
    *((_QWORD *)v5 + 39) = v27;

    v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v30 = (void *)*((_QWORD *)v5 + 56);
    *((_QWORD *)v5 + 56) = v29;

    *((_QWORD *)v5 + 22) = 0;
    *(_OWORD *)(v5 + 568) = v48;
    *(_OWORD *)(v5 + 584) = v48;
    v5[31] = 0;
    v5[22] = 1;
    v31 = dispatch_queue_create("com.apple.TVPlayback.AVAssetTrackInspectionQueue", 0);
    v32 = (void *)*((_QWORD *)v5 + 45);
    *((_QWORD *)v5 + 45) = v31;

    v33 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v34 = (void *)*((_QWORD *)v5 + 46);
    *((_QWORD *)v5 + 46) = v33;

    v5[23] = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *MEMORY[0x24BDB1728];
    objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v5, sel__audioRouteChanged_, v36, v37);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", v5, sel__screenRecordingStateDidChange_, *MEMORY[0x24BDDCF50], 0);

    v39 = objc_alloc(MEMORY[0x24BDD16A8]);
    v40 = objc_opt_class();
    v41 = initWithName__instanceNumber++;
    v42 = (void *)objc_msgSend(v39, "initWithFormat:", CFSTR("%@ %ld"), v40, v41);
    v43 = v42;
    if (v4)
      objc_msgSend(v42, "appendFormat:", CFSTR(" (%@)"), v4);
    v44 = -[TVPStateMachine initWithName:initialState:mode:]([TVPStateMachine alloc], "initWithName:initialState:mode:", v43, CFSTR("Stopped"), 0);
    v45 = (void *)*((_QWORD *)v5 + 24);
    *((_QWORD *)v5 + 24) = v44;

    objc_msgSend(*((id *)v5 + 24), "setLogObject:", sPlayerLogObject);
    objc_msgSend(v5, "_registerStateMachineHandlers");
    objc_msgSend(*((id *)v5 + 24), "setShouldAcceptEvents:", 1);

  }
  return (TVPPlayer *)v5;
}

- (CGSize)iFramePrefetchMaxSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iFramePrefetchMaxSize.width;
  height = self->_iFramePrefetchMaxSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)highFrequencyElapsedTimeObserverBlock
{
  return self->_highFrequencyElapsedTimeObserverBlock;
}

- (BOOL)haveEverEnqueuedPlayerItem
{
  return self->_haveEverEnqueuedPlayerItem;
}

- (TVPExternalImagePlayer)externalImagePlayer
{
  return self->_externalImagePlayer;
}

- (double)elapsedTime
{
  CMTime v3[2];

  memset(&v3[1], 0, sizeof(CMTime));
  -[TVPPlayer elapsedCMTime](self, "elapsedCMTime");
  v3[0] = v3[1];
  return CMTimeGetSeconds(v3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)elapsedCMTime
{
  void *v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  int v10;
  double v11;
  Float64 v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  int v28;
  CMTimeEpoch epoch;
  void *v30;
  void *v31;
  float v32;
  void *v33;
  int v34;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v36;
  _BYTE v37[24];
  _BYTE v38[24];
  CMTime time;
  CMTime time1;
  CMTime v41;

  -[TVPPlayer stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x24BDC0D88];
  v36 = *MEMORY[0x24BDC0D88];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x24BDC0D88];
  v8 = *(_QWORD *)(v7 + 16);
  retstr->var3 = v8;
  -[TVPPlayer _statesThatReturnStartTime](self, "_statesThatReturnStartTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v6);

  if (v10)
  {
    -[TVPPlayer startPosition](self, "startPosition");
    if (v11 > 0.0)
    {
      v12 = v11;
      -[TVPPlayer currentMediaItemLoader](self, "currentMediaItemLoader");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "AVAsset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
LABEL_11:

        goto LABEL_28;
      }
      memset(&v41, 0, sizeof(v41));
      objc_msgSend(v14, "duration");
      time = v41;
      CMTimeMultiplyByFloat64(&time1, &time, v12);
LABEL_10:
      *(CMTime *)retstr = time1;
      goto LABEL_11;
    }
    memset(&v41, 0, sizeof(v41));
    -[TVPPlayer startTime](self, "startTime");
    time1 = v41;
    *(_OWORD *)&time.value = v36;
    time.epoch = v8;
    if (!CMTimeCompare(&time1, &time))
    {
      -[TVPPlayer currentMediaItem](self, "currentMediaItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataStartTime"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[TVPPlayer currentMediaItem](self, "currentMediaItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataStartTimeIsRelativeToMainContent"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "BOOLValue");

      if (v21)
      {
        -[TVPPlayer currentMediaItem](self, "currentMediaItem");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataFeatureStartTime"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "doubleValue");
        v25 = v24;
        objc_msgSend(v23, "doubleValue");
        CMTimeMakeWithSeconds(&time1, v25 + v26, 1000000);
        v41 = time1;

      }
      else if (v18)
      {
        objc_msgSend(v18, "floatValue");
        CMTimeMakeWithSeconds(&time1, v32, 1000000);
        v41 = time1;
      }

    }
    time = v41;
    -[TVPPlayer _clampInfiniteTimeToSeekableRange:](self, "_clampInfiniteTimeToSeekableRange:", &time);
    goto LABEL_26;
  }
  -[TVPPlayer _statesThatReturnAVPlayerTime](self, "_statesThatReturnAVPlayerTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v6);

  if (v16)
  {
    -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v14, "status"))
      goto LABEL_11;
    memset(&v41, 0, sizeof(v41));
    if (v14)
      objc_msgSend(v14, "currentTime");
    memset(&time1, 0, sizeof(time1));
    -[TVPPlayer cachedDuration](self, "cachedDuration");
    time = v41;
    -[TVPPlayer _clampedElapsedTimeForTime:duration:](self, "_clampedElapsedTimeForTime:duration:", &time, v38);
    if ((time1.flags & 0x1D) != 1)
      goto LABEL_11;
    goto LABEL_10;
  }
  -[TVPPlayer _statesThatReturnSeekTime](self, "_statesThatReturnSeekTime");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "containsObject:", v6);

  if (!v28)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Scanning using external images")) & 1) == 0
      && (objc_msgSend(v6, "isEqualToString:", CFSTR("Scanning using external images driven by AVKit")) & 1) == 0
      && !objc_msgSend(v6, "isEqualToString:", CFSTR("Waiting for AVKit seek after finishing external image scanning")))
    {
      goto LABEL_28;
    }
    memset(&v41, 0, sizeof(v41));
    -[TVPPlayer externalImagePlayer](self, "externalImagePlayer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
      objc_msgSend(v30, "elapsedTime");
    else
      memset(&v41, 0, sizeof(v41));

    memset(&time1, 0, sizeof(time1));
    -[TVPPlayer cachedDuration](self, "cachedDuration");
    time = v41;
    -[TVPPlayer _clampedElapsedTimeForTime:duration:](self, "_clampedElapsedTimeForTime:duration:", &time, v37);
    if ((time1.flags & 0x1D) != 1)
      goto LABEL_28;
LABEL_26:
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&time1.value;
    epoch = time1.epoch;
    goto LABEL_27;
  }
  memset(&v41, 0, sizeof(v41));
  -[TVPPlayer timeBeingSeekedTo](self, "timeBeingSeekedTo");
  time = v41;
  -[TVPPlayer _clampInfiniteTimeToSeekableRange:](self, "_clampInfiniteTimeToSeekableRange:", &time);
  epoch = time1.epoch;
  v41 = time1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&time1.value;
LABEL_27:
  retstr->var3 = epoch;
LABEL_28:
  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "hasTrait:", CFSTR("TVPMediaItemTraitIsScene"));

  if (v34)
  {
    time1 = (CMTime)*retstr;
    -[TVPPlayer _clampedSceneTimeForPlayerTime:](self, "_clampedSceneTimeForPlayerTime:", &time1);
    *(CMTime *)retstr = v41;
  }

  return result;
}

- (AVQueuePlayer)earlyAVQueuePlayer
{
  return self->_earlyAVQueuePlayer;
}

- (double)duration
{
  double result;
  CMTime v3[2];

  memset(&v3[1], 0, sizeof(CMTime));
  -[TVPPlayer durationCMTime](self, "durationCMTime");
  result = 0.0;
  if ((unsigned __int128)0 >> 96)
  {
    if ((v3[1].flags & 0x1D) == 1)
    {
      v3[0] = v3[1];
      return CMTimeGetSeconds(v3);
    }
    else if ((v3[1].flags & 0x10) != 0)
    {
      return 3.40282347e38;
    }
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationCMTime
{
  void *v5;
  int v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTime rhs;
  CMTime lhs;
  CMTime v10;

  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  -[TVPPlayer cachedDuration](self, "cachedDuration");
  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasTrait:", CFSTR("TVPMediaItemTraitIsScene"));

  if (v6)
  {
    -[TVPPlayer _currentMediaItemForwardPlaybackEndTime](self, "_currentMediaItemForwardPlaybackEndTime");
    -[TVPPlayer _currentMediaItemReversePlaybackEndTime](self, "_currentMediaItemReversePlaybackEndTime");
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeSubtract(&v10, &lhs, &rhs);
    *(CMTime *)retstr = v10;
  }
  return result;
}

- (TVPPlayerItem)currentPlayerItem
{
  return self->_currentPlayerItem;
}

- (TVPMediaItemLoader)currentMediaItemLoader
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[TVPPlayer mediaItemLoaders](self, "mediaItemLoaders", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "mediaItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToMediaItem:", v3);

        if (v10)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return (TVPMediaItemLoader *)v5;
}

- (int64_t)currentMediaItemAudioFormat
{
  return self->_currentMediaItemAudioFormat;
}

- (int64_t)currentMediaItemAudioChannels
{
  return self->_currentMediaItemAudioChannels;
}

- (BOOL)createsPlayerItemButDoesNotEnqueue
{
  return self->_createsPlayerItemButDoesNotEnqueue;
}

- (NSArray)cachedLoadedTimeRanges
{
  return self->_cachedLoadedTimeRanges;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 760);
  return self;
}

- (NSMutableDictionary)boundaryTimeObserverInfos
{
  return self->_boundaryTimeObserverInfos;
}

- (OS_dispatch_queue)avAssetTrackInspectionQueue
{
  return self->_avAssetTrackInspectionQueue;
}

- (BOOL)allowsConstrainedNetworkUsage
{
  return self->_allowsConstrainedNetworkUsage;
}

- (BOOL)allowsCellularUsage
{
  return self->_allowsCellularUsage;
}

- (void)addWeakReferenceToVideoView:(id)a3
{
  if (a3)
    -[NSHashTable addObject:](self->_videoViewWeakReferences, "addObject:");
}

- (void)_updateVideoViewsWithAVQueuePlayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  -[TVPPlayer videoViewWeakReferences](self, "videoViewWeakReferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v7 = MEMORY[0x24BDAC760];
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __48__TVPPlayer__updateVideoViewsWithAVQueuePlayer___block_invoke;
  v13[3] = &unk_24F15C670;
  v13[4] = &v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);
  if (v15[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v6, "objectAtIndex:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAVPlayer:", v4);

  }
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __48__TVPPlayer__updateVideoViewsWithAVQueuePlayer___block_invoke_2;
  v10[3] = &unk_24F15C698;
  v12 = &v14;
  v9 = v4;
  v11 = v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  _Block_object_dispose(&v14, 8);
}

- (void)_updateIsLiveForElapsedTime:(id *)a3
{
  void *v5;
  _BOOL8 v6;
  CMTime v7;
  CMTimeRange time1;
  CMTime lhs;
  CMTime v10;
  CMTime time2;
  CMTimeRange v12;
  char v13;
  char v14;

  -[TVPPlayer cachedDuration](self, "cachedDuration");
  if ((v14 & 1) == 0)
    goto LABEL_5;
  -[TVPPlayer cachedDuration](self, "cachedDuration");
  if ((v13 & 0x10) == 0)
    goto LABEL_5;
  memset(&v12, 0, sizeof(v12));
  -[TVPPlayer cachedSeekableTimeRanges](self, "cachedSeekableTimeRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:](TVPTimeRange, "forwardmostCMTimeRangeInCMTimeRanges:", v5);

  if ((a3->var2 & 1) == 0 || (v12.start.flags & 1) == 0)
    goto LABEL_5;
  v6 = 0;
  if ((v12.duration.flags & 1) != 0 && !v12.duration.epoch && (v12.duration.value & 0x8000000000000000) == 0)
  {
    time1.start = v12.duration;
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
    if (!CMTimeCompare(&time1.start, &time2))
    {
LABEL_5:
      v6 = 0;
      goto LABEL_6;
    }
    memset(&time2, 0, sizeof(time2));
    CMTimeMakeWithSeconds(&time2, 10.0, 1000000);
    time1.start = v12.duration;
    v10 = time2;
    if (CMTimeCompare(&time1.start, &v10) < 1)
    {
      v6 = 1;
    }
    else
    {
      memset(&v10, 0, sizeof(v10));
      time1 = v12;
      CMTimeRangeGetEnd(&lhs, &time1);
      time1.start = time2;
      CMTimeSubtract(&v10, &lhs, &time1.start);
      *(_OWORD *)&time1.start.value = *(_OWORD *)&a3->var0;
      time1.start.epoch = a3->var3;
      v7 = v10;
      v6 = CMTimeCompare(&time1.start, &v7) >= 0;
    }
  }
LABEL_6:
  -[TVPPlayer setIsLive:](self, "setIsLive:", v6);
}

- (void)_updateCurrentMediaItemVideoRangeForTracks:(id)a3
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  TVPPlayer *val;
  id obj;
  _QWORD block[4];
  id v17;
  id v18;
  id location;
  _QWORD v20[4];
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  val = self;
  -[TVPPlayer _assetTracksOfType:fromTracks:](self, "_assetTracksOfType:fromTracks:", *MEMORY[0x24BDB1D50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_group_create();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        dispatch_group_enter(v5);
        v26[0] = CFSTR("enabled");
        v26[1] = CFSTR("formatDescriptions");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __56__TVPPlayer__updateCurrentMediaItemVideoRangeForTracks___block_invoke;
        v20[3] = &unk_24F15BEF8;
        v21 = v5;
        objc_msgSend(v9, "loadValuesAsynchronouslyForKeys:completionHandler:", v10, v20);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  objc_initWeak(&location, val);
  -[TVPPlayer avAssetTrackInspectionQueue](val, "avAssetTrackInspectionQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__TVPPlayer__updateCurrentMediaItemVideoRangeForTracks___block_invoke_2;
  block[3] = &unk_24F15C218;
  v17 = obj;
  v12 = obj;
  objc_copyWeak(&v18, &location);
  dispatch_group_notify(v5, v11, block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)_updateCurrentMediaItemAudioInfoForPlayerItem:(id)a3 tracks:(id)a4
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  TVPPlayer *val;
  id obj;
  _QWORD block[4];
  id v20;
  id v21;
  id location;
  _QWORD v23[4];
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[2];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  val = self;
  -[TVPPlayer _assetTracksOfType:fromTracks:](self, "_assetTracksOfType:fromTracks:", *MEMORY[0x24BDB1CF0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_group_create();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v26;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
        dispatch_group_enter(v7);
        v29[0] = CFSTR("enabled");
        v29[1] = CFSTR("formatDescriptions");
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2, v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __66__TVPPlayer__updateCurrentMediaItemAudioInfoForPlayerItem_tracks___block_invoke;
        v23[3] = &unk_24F15BEF8;
        v24 = v7;
        objc_msgSend(v11, "loadValuesAsynchronouslyForKeys:completionHandler:", v12, v23);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  objc_initWeak(&location, val);
  -[TVPPlayer avAssetTrackInspectionQueue](val, "avAssetTrackInspectionQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__TVPPlayer__updateCurrentMediaItemAudioInfoForPlayerItem_tracks___block_invoke_2;
  block[3] = &unk_24F15C218;
  v20 = obj;
  v14 = obj;
  objc_copyWeak(&v21, &location);
  dispatch_group_notify(v7, v13, block);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

- (void)_updateAVPlayerActionAtItemEnd
{
  void *v3;
  void *v4;
  int64_t v5;
  double v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11[16];

  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TVPPlayer playlist](self, "playlist");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[TVPPlayer mediaItemEndAction](self, "mediaItemEndAction");
    -[TVPPlayer duration](self, "duration");
    if (v6 == 3.40282347e38)
    {
      v7 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_228A4E000, v7, OS_LOG_TYPE_DEFAULT, "Setting AVPlayer's actionAtItemEnd to AVPlayerActionAtItemEndNone since this is a live stream", v11, 2u);
      }
      goto LABEL_5;
    }
    if (objc_msgSend(v4, "moreItemsAvailable:", 0))
    {
      if (v5 != 2)
      {
        if (v5)
        {
LABEL_16:
          v8 = v3;
          v9 = 1;
          goto LABEL_6;
        }
        goto LABEL_15;
      }
    }
    else
    {
      v10 = objc_msgSend(v4, "endAction");
      if (v5 == 1 || v10 == 1)
        goto LABEL_16;
      if (v5 != 2)
      {
LABEL_15:
        v8 = v3;
        v9 = 0;
        goto LABEL_6;
      }
    }
LABEL_5:
    v8 = v3;
    v9 = 2;
LABEL_6:
    objc_msgSend(v8, "setActionAtItemEnd:", v9);

  }
}

- (void)_timeControlStatusDidChangeTo:(int64_t)a3 oldStatusNum:(id)a4
{
  id v6;
  void *v7;
  const __CFString *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
    {
      if (a3 == 2)
      {
        v8 = CFSTR("AVPlayerTimeControlStatusPlaying");
      }
      else if (a3 == 1)
      {
        v8 = CFSTR("AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate");
      }
      else
      {
        v8 = CFSTR("Unknown");
      }
    }
    else
    {
      v8 = CFSTR("AVPlayerTimeControlStatusPaused");
    }
    v9 = v7;
    -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reasonForWaitingToPlay");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412546;
    v25 = v8;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "AVPlayer timeControlStatus did change to %@.  reasonForWaiting is %@", (uint8_t *)&v24, 0x16u);

  }
  if (a3 == 2)
  {
    -[TVPPlayer stateMachine](self, "stateMachine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Waiting for seek"));

    if (v14)
    {
      v15 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_228A4E000, v15, OS_LOG_TYPE_DEFAULT, "Sending seek complete event because playback has started while waiting for a seek", (uint8_t *)&v24, 2u);
      }
      -[TVPPlayer stateMachine](self, "stateMachine");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postEvent:", CFSTR("Seek completed"));

    }
    -[TVPPlayer stateMachine](self, "stateMachine");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("Waiting for sufficient buffer"));

    if (v19)
    {
      v20 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_228A4E000, v20, OS_LOG_TYPE_DEFAULT, "Assuming likelyToKeepUp is YES because playback has started", (uint8_t *)&v24, 2u);
      }
      -[TVPPlayer stateMachine](self, "stateMachine");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "postEvent:", CFSTR("Sufficient buffer did become available"));

    }
  }
  if (!v6 || objc_msgSend(v6, "integerValue") != a3)
  {
    -[TVPPlayer stateMachine](self, "stateMachine");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "postEvent:withContext:", CFSTR("Time control status did change"), v23);

  }
}

- (id)_statesThatReturnStartTime
{
  if (_statesThatReturnStartTime_onceToken != -1)
    dispatch_once(&_statesThatReturnStartTime_onceToken, &__block_literal_global_433);
  return (id)_statesThatReturnStartTime_states;
}

- (id)_soundCheckNormalizationForMediaItem:(id)a3
{
  void *v3;
  int v4;
  double v5;
  BOOL v6;
  void *v7;

  objc_msgSend(a3, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataSoundCheckVolumeNormalization"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ((v4 = objc_msgSend(v3, "intValue")) != 0 ? (v6 = v4 == 0xFFFF) : (v6 = 1), v6))
  {
    v7 = 0;
  }
  else
  {
    if (v4 < 1)
      LODWORD(v5) = 1.0;
    else
      *(float *)&v5 = sqrtf(1000.0 / (float)v4);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_setState:(id)a3 updatedRate:(double)a4 reason:(id)a5 notifyListeners:(BOOL)a6
{
  _BOOL4 v6;
  TVPPlaybackState *v11;
  TVPPlaybackState **p_state;
  NSObject *v13;
  TVPPlaybackState *v14;
  TVPPlaybackState *v15;
  TVPPlaybackState *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  TVPPlaybackState *v26;
  TVPPlaybackState *v27;
  TVPPlaybackState *v28;
  id v29;
  _QWORD v30[4];
  TVPPlaybackState *v31;
  TVPPlaybackState *v32;
  TVPPlaybackState *v33;
  id v34[2];
  _QWORD v35[3];
  _QWORD v36[3];
  uint8_t buf[4];
  TVPPlaybackState *v38;
  uint64_t v39;

  v6 = a6;
  v39 = *MEMORY[0x24BDAC8D0];
  v11 = (TVPPlaybackState *)a3;
  v29 = a5;
  p_state = &self->_state;
  if (self->_state != v11
    || (+[TVPPlaybackState scanning](TVPPlaybackState, "scanning"),
        v28 = (TVPPlaybackState *)objc_claimAutoreleasedReturnValue(),
        v28,
        v28 == v11))
  {
    v13 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v11;
      _os_log_impl(&dword_228A4E000, v13, OS_LOG_TYPE_DEFAULT, "Setting state to %@", buf, 0xCu);
    }
    v14 = *p_state;
    v15 = v11;
    v16 = v15;
    if (v6)
    {
      v35[0] = CFSTR("TVPPlaybackStateOldStateKey");
      v35[1] = CFSTR("TVPPlaybackStateNewStateKey");
      v36[0] = v14;
      v36[1] = v15;
      v35[2] = CFSTR("TVPPlaybackStateNewRateKey");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v36[2] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v18);
      v20 = v19;
      if (v29)
        objc_msgSend(v19, "setObject:forKey:", v29, CFSTR("TVPPlaybackStateChangeReasonKey"));
      v21 = v20;
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("TVPPlaybackStateWillChangeNotification"), self, v21);

      -[TVPPlayer currentMediaItem](self, "currentMediaItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "reportingDelegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v24, "mediaItem:willChangeFromPlaybackState:toPlaybackState:updatedRate:player:", v23, v14, v16, self, a4);
      -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rate"), v29);

      objc_storeStrong((id *)&self->_state, a3);
      objc_initWeak((id *)buf, self);
      -[TVPPlayer stateMachine](self, "stateMachine");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __58__TVPPlayer__setState_updatedRate_reason_notifyListeners___block_invoke;
      v30[3] = &unk_24F15C648;
      objc_copyWeak(v34, (id *)buf);
      v26 = (TVPPlaybackState *)v21;
      v31 = v26;
      v32 = v14;
      v33 = v16;
      v34[1] = *(id *)&a4;
      objc_msgSend(v25, "executeBlockAfterCurrentStateTransition:", v30);

      objc_destroyWeak(v34);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v27 = v15;
      v26 = *p_state;
      *p_state = v27;
    }

  }
}

- (void)_setState:(id)a3 updatedRate:(double)a4 notifyListeners:(BOOL)a5
{
  -[TVPPlayer _setState:updatedRate:reason:notifyListeners:](self, "_setState:updatedRate:reason:notifyListeners:", a3, 0, a5, a4);
}

- (void)_removePlaybackEndTimeBoundaryObservers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TVPPlayer playbackEndTimeBoundaryObserverTokens](self, "playbackEndTimeBoundaryObserverTokens", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeTimeObserver:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[TVPPlayer setPlaybackEndTimeBoundaryObserverTokens:](self, "setPlaybackEndTimeBoundaryObserverTokens:", 0);
}

- (void)_removePeriodicTimeObserverFromAVQueuePlayer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    -[TVPPlayer periodicTimeObserverToken](self, "periodicTimeObserverToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v6, "removeTimeObserver:", v4);
      -[TVPPlayer setPeriodicTimeObserverToken:](self, "setPeriodicTimeObserverToken:", 0);
    }
    -[TVPPlayer timeJumpPeriodicObserverToken](self, "timeJumpPeriodicObserverToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v6, "removeTimeObserver:", v5);
      -[TVPPlayer setTimeJumpPeriodicObserverToken:](self, "setTimeJumpPeriodicObserverToken:", 0);
    }

  }
}

- (void)_removeObserversFromAVQueuePlayer:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = __AVPlayerCurrentItemKVOContext;
    v5 = a3;
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem"), v4);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("timeControlStatus"), __AVPlayerTimeControlStatusKVOContext);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("outputObscuredDueToInsufficientExternalProtection"), __AVPlayerOutputObscuredDueToInsufficientExternalProtectionKVOContext);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("externalPlaybackActive"), __AVPlayerExternalPlaybackActiveKVOContext);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("muted"), __AVPlayerMutedKVOContext);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.status"), __AVPlayerItemStatusKVOContext);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.duration"), __AVPlayerItemDurationKVOContext);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.hasVideo"), __AVPlayerItemHasVideoContext);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.presentationSize"), __AVPlayerItemPresentationSizeContent);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.playbackLikelyToKeepUp"), __AVPlayerItemLikelyToKeepUpKVOContext);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.playbackBufferFull"), __AVPlayerItemBufferFullKVOContext);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.playbackBufferEmpty"), __AVPlayerItemBufferEmptyKVOContext);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.loadedTimeRanges"), __AVPlayerItemLoadedTimeRangesKVOContext);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.seekableTimeRanges"), __AVPlayerItemSeekableTimeRangesKVOContext);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.timedMetadata"), __AVPlayerItemTimedMetadataKVOContext);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("currentItem.tracks"), __AVPlayerItemTracksKVOContext);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDB2060], v5);

  }
}

- (void)_removeObserversForPlaylist:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    v4 = __TVPPlaylistEndActionKVOContext;
    v5 = a3;
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("endAction"), v4);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("currentMediaItem"), __TVPPlaylistCurrentMediaItemKVOContext);
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("nextMediaItem"), __TVPPlaylistNextMediaItemKVOContext);

  }
}

- (void)_removeObserversForPlayerItem:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDB1FA8], v5);
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDB1FF0], v5);
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDB1FF8], v5);
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDB2010], v5);
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDB1FB8], v5);
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDB1FE8], v5);
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDB2018], v5);
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDB2020], v5);

  }
}

- (void)_removeObserversForMediaItem:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("TVPMediaItemMetadataDidChangeNotification"), v5);

  }
}

- (void)_removeHighFrequencyTimeObserverIfNecessary
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[TVPPlayer highFrequencyTimeObserverToken](self, "highFrequencyTimeObserverToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPPlayer highFrequencyTimeObserverToken](self, "highFrequencyTimeObserverToken");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeTimeObserver:", v7);

      -[TVPPlayer setHighFrequencyTimeObserverToken:](self, "setHighFrequencyTimeObserverToken:", 0);
    }
  }
}

- (void)_removeBoundaryTimeObserversFromAVQueuePlayer:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[TVPPlayer boundaryTimeObserverInfos](self, "boundaryTimeObserverInfos");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __59__TVPPlayer__removeBoundaryTimeObserversFromAVQueuePlayer___block_invoke;
    v6[3] = &unk_24F15C580;
    v7 = v5;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
}

- (void)_postCurrentMediaItemWillChangeNotificationWithDirection:(id)a3 reason:(id)a4 didHitBeginningOfPlaylist:(BOOL)a5 didHitEndOfPlaylist:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  __CFString **v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a6;
  v7 = a5;
  v17 = a3;
  v10 = a4;
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v12 = v11;
  if (v17)
    objc_msgSend(v11, "setObject:forKey:", v17, CFSTR("TVPPlaybackCurrentMediaItemChangeDirectionKey"));
  if (v10)
    objc_msgSend(v12, "setObject:forKey:", v10, CFSTR("TVPPlaybackCurrentMediaItemChangeReasonKey"));
  if (v7 || v6)
  {
    v13 = TVPPlaybackCurrentMediaItemChangeDitHitBeginningOfPlaylistKey;
    if (!v7)
      v13 = TVPPlaybackCurrentMediaItemChangeDidHitEndOfPlaylistKey;
    objc_msgSend(v12, "setObject:forKey:", MEMORY[0x24BDBD1C8], *v13);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("TVPPlaybackCurrentMediaItemWillChangeNotification"), self, v12);

  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reportingDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16, "mediaItemWillNoLongerBeCurrentItem:player:reason:", v15, self, v10);

}

- (void)_postCurrentMediaItemDidChangeNotificationWithDirection:(id)a3 reason:(id)a4 didHitBeginningOfPlaylist:(BOOL)a5 didHitEndOfPlaylist:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  __CFString **v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a6;
  v7 = a5;
  v17 = a3;
  v10 = a4;
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v12 = v11;
  if (v17)
    objc_msgSend(v11, "setObject:forKey:", v17, CFSTR("TVPPlaybackCurrentMediaItemChangeDirectionKey"));
  if (v10)
    objc_msgSend(v12, "setObject:forKey:", v10, CFSTR("TVPPlaybackCurrentMediaItemChangeReasonKey"));
  if (v7 || v6)
  {
    v13 = TVPPlaybackCurrentMediaItemChangeDitHitBeginningOfPlaylistKey;
    if (!v7)
      v13 = TVPPlaybackCurrentMediaItemChangeDidHitEndOfPlaylistKey;
    objc_msgSend(v12, "setObject:forKey:", MEMORY[0x24BDBD1C8], *v13);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("TVPPlaybackCurrentMediaItemDidChangeNotification"), self, v12);

  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reportingDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v16, "mediaItemDidBecomeCurrentItem:player:reason:", v15, self, v10);

}

- (void)_populatePlayerItem:(id)a3 withMetadataFromMediaItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  double v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  NSObject *v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  double v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  int v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  NSObject *v81;
  void *v82;
  id v83;
  id v84;
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
  id v101;
  void *v103;
  _QWORD v104[4];
  id v105;
  id v106;
  id v107;
  uint8_t buf[4];
  NSObject *v109;
  __int16 v110;
  id v111;
  uint64_t v112;

  v112 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataStoreItemIdentifier"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    if (v103 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDB25B8]);
      objc_msgSend(v9, "setIdentifier:", *MEMORY[0x24BDB2748]);
      objc_msgSend(v9, "setExtendedLanguageTag:", CFSTR("und"));
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v103, "longLongValue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:", v10);

      objc_msgSend(v8, "addObject:", v9);
    }
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataExternalIdentifier"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (v90)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_alloc_init(MEMORY[0x24BDB25B8]);
        objc_msgSend(v11, "setIdentifier:", *MEMORY[0x24BDB2700]);
        objc_msgSend(v11, "setExtendedLanguageTag:", CFSTR("und"));
        objc_msgSend(v11, "setValue:", v90);
        objc_msgSend(v8, "addObject:", v11);

      }
    }
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataExternalProfileIdentifier"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (v89)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = objc_alloc_init(MEMORY[0x24BDB25B8]);
        objc_msgSend(v12, "setIdentifier:", *MEMORY[0x24BDB2708]);
        objc_msgSend(v12, "setExtendedLanguageTag:", CFSTR("und"));
        objc_msgSend(v12, "setValue:", v89);
        objc_msgSend(v8, "addObject:", v12);

      }
    }
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataExternalServiceIdentifier"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (v88)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_alloc_init(MEMORY[0x24BDB25B8]);
        objc_msgSend(v13, "setIdentifier:", *MEMORY[0x24BDB2740]);
        objc_msgSend(v13, "setExtendedLanguageTag:", CFSTR("und"));
        objc_msgSend(v13, "setValue:", v88);
        objc_msgSend(v8, "addObject:", v13);

      }
    }
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataBrandID"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (v87)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = objc_alloc_init(MEMORY[0x24BDB25B8]);
        objc_msgSend(v14, "setIdentifier:", *MEMORY[0x24BDB26F0]);
        objc_msgSend(v14, "setExtendedLanguageTag:", CFSTR("und"));
        objc_msgSend(v14, "setValue:", v87);
        objc_msgSend(v8, "addObject:", v14);

      }
    }
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataPlaybackProgress"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (v86)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = objc_alloc_init(MEMORY[0x24BDB25B8]);
        objc_msgSend(v15, "setIdentifier:", *MEMORY[0x24BDB2718]);
        objc_msgSend(v15, "setExtendedLanguageTag:", CFSTR("und"));
        objc_msgSend(v15, "setValue:", v86);
        objc_msgSend(v8, "addObject:", v15);

      }
    }
    v101 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setLocale:", v85);
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataSeasonNumber"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (v93)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = objc_alloc_init(MEMORY[0x24BDB25B8]);
        objc_msgSend(v16, "setIdentifier:", *MEMORY[0x24BDB2738]);
        objc_msgSend(v16, "setExtendedLanguageTag:", CFSTR("und"));
        objc_msgSend(v101, "stringFromNumber:", v93);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)v17;
        if (v17)
          v19 = (void *)v17;
        else
          v19 = v93;
        objc_msgSend(v16, "setValue:", v19);
        objc_msgSend(v8, "addObject:", v16);

      }
    }
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataEpisodeNumber"));
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (v92)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = objc_alloc_init(MEMORY[0x24BDB25B8]);
        objc_msgSend(v20, "setIdentifier:", *MEMORY[0x24BDB26F8]);
        objc_msgSend(v20, "setExtendedLanguageTag:", CFSTR("und"));
        objc_msgSend(v101, "stringFromNumber:", v92);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        if (v21)
          v23 = (void *)v21;
        else
          v23 = v92;
        objc_msgSend(v20, "setValue:", v23);
        objc_msgSend(v8, "addObject:", v20);

      }
    }
    v106 = 0;
    v107 = 0;
    v24 = -[TVPPlayer _getStringForTitleLabel:subtitleLabel:forMediaItem:](self, "_getStringForTitleLabel:subtitleLabel:forMediaItem:", &v107, &v106, v7);
    v84 = v107;
    v83 = v106;
    if (v24)
    {
      if (objc_msgSend(v84, "length"))
      {
        v25 = objc_alloc_init(MEMORY[0x24BDB25B8]);
        objc_msgSend(v25, "setIdentifier:", *MEMORY[0x24BDB1D78]);
        objc_msgSend(v25, "setExtendedLanguageTag:", CFSTR("und"));
        objc_msgSend(v25, "setValue:", v84);
        objc_msgSend(v8, "addObject:", v25);

      }
      if (objc_msgSend(v83, "length"))
      {
        v26 = objc_alloc_init(MEMORY[0x24BDB25B8]);
        objc_msgSend(v26, "setIdentifier:", *MEMORY[0x24BDB1E30]);
        objc_msgSend(v26, "setExtendedLanguageTag:", CFSTR("und"));
        objc_msgSend(v26, "setValue:", v83);
        objc_msgSend(v8, "addObject:", v26);

      }
    }
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataLongDescription"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v100, "length"))
    {
      v27 = objc_alloc_init(MEMORY[0x24BDB25B8]);
      objc_msgSend(v27, "setIdentifier:", *MEMORY[0x24BDB1D70]);
      objc_msgSend(v27, "setExtendedLanguageTag:", CFSTR("und"));
      objc_msgSend(v27, "setValue:", v100);
      objc_msgSend(v8, "addObject:", v27);

    }
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataContentRatingDisplayName"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "length"))
    {
      v29 = v28;
    }
    else
    {
      objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataContentRating"));
      v30 = objc_claimAutoreleasedReturnValue();

      v29 = (void *)v30;
    }
    if (objc_msgSend(v29, "length", v29))
    {
      v31 = objc_alloc_init(MEMORY[0x24BDB25B8]);
      objc_msgSend(v31, "setIdentifier:", *MEMORY[0x24BDB1E20]);
      objc_msgSend(v31, "setExtendedLanguageTag:", CFSTR("und"));
      objc_msgSend(v31, "setValue:", v82);
      objc_msgSend(v8, "addObject:", v31);

    }
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataGenre"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v99, "length"))
    {
      v32 = objc_alloc_init(MEMORY[0x24BDB25B8]);
      objc_msgSend(v32, "setIdentifier:", *MEMORY[0x24BDB1E18]);
      objc_msgSend(v32, "setExtendedLanguageTag:", CFSTR("und"));
      objc_msgSend(v32, "setValue:", v99);
      objc_msgSend(v8, "addObject:", v32);

    }
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataDateReleased"));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (v98)
    {
      v33 = objc_alloc_init(MEMORY[0x24BDB25B8]);
      objc_msgSend(v33, "setIdentifier:", *MEMORY[0x24BDB1E28]);
      objc_msgSend(v33, "setExtendedLanguageTag:", CFSTR("und"));
      objc_msgSend(v33, "setValue:", v98);
      objc_msgSend(v8, "addObject:", v33);

    }
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataAlbum"));
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v97, "length"))
    {
      v34 = objc_alloc_init(MEMORY[0x24BDB25B8]);
      objc_msgSend(v34, "setIdentifier:", *MEMORY[0x24BDB1D58]);
      objc_msgSend(v34, "setExtendedLanguageTag:", CFSTR("und"));
      objc_msgSend(v34, "setValue:", v97);
      objc_msgSend(v8, "addObject:", v34);

    }
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataTomatoPercentage"));
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataTomatoFreshness"));
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    if (v94 && v91)
    {
      v35 = objc_alloc_init(MEMORY[0x24BDB25B8]);
      objc_msgSend(v35, "setIdentifier:", *MEMORY[0x24BDB2730]);
      objc_msgSend(v35, "setExtendedLanguageTag:", CFSTR("und"));
      objc_msgSend(v35, "setValue:", v94);
      v36 = objc_alloc_init(MEMORY[0x24BDB25B8]);
      objc_msgSend(v36, "setIdentifier:", *MEMORY[0x24BDB2728]);
      objc_msgSend(v36, "setExtendedLanguageTag:", CFSTR("und"));
      objc_msgSend(v36, "setValue:", v91);
      objc_msgSend(v8, "addObject:", v35);
      objc_msgSend(v8, "addObject:", v36);

    }
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataLocalizedScheduledTimeString"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (v96)
    {
      v37 = objc_alloc_init(MEMORY[0x24BDB25B8]);
      objc_msgSend(v37, "setIdentifier:", *MEMORY[0x24BDB2720]);
      objc_msgSend(v37, "setExtendedLanguageTag:", CFSTR("und"));
      objc_msgSend(v37, "setValue:", v96);
      objc_msgSend(v8, "addObject:", v37);

    }
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataSportingLeagueShortName"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v95, "length"))
    {
      v38 = objc_alloc_init(MEMORY[0x24BDB25B8]);
      objc_msgSend(v38, "setIdentifier:", *MEMORY[0x24BDB2710]);
      objc_msgSend(v38, "setExtendedLanguageTag:", CFSTR("und"));
      objc_msgSend(v38, "setValue:", v95);
      objc_msgSend(v8, "addObject:", v38);

    }
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataExactStartTime"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "doubleForKey:", CFSTR("ExactStartTimeOverrideInMS"));
    v42 = v41;

    if (v42 > 0.0)
    {
      v43 = (id)sPlayerLogObject;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v42 / 1000.0);
        v44 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v109 = v44;
        _os_log_impl(&dword_228A4E000, v43, OS_LOG_TYPE_DEFAULT, "Overriding exact start time with date %@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v42);
      v45 = objc_claimAutoreleasedReturnValue();

      v39 = (void *)v45;
    }
    if (v39)
    {
      v46 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v39, "doubleValue");
      objc_msgSend(v46, "dateWithTimeIntervalSince1970:", v47 / 1000.0);
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = (id)sPlayerLogObject;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        -[TVPPlayer seekableDateRange](self, "seekableDateRange");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "startDate");
        v51 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v109 = v48;
        v110 = 2112;
        v111 = v51;
        _os_log_impl(&dword_228A4E000, v49, OS_LOG_TYPE_DEFAULT, "Setting approximate start date %@ with seekable start date %@", buf, 0x16u);

      }
      v52 = objc_alloc_init(MEMORY[0x24BDB25B8]);
      objc_msgSend(v52, "setIdentifier:", *MEMORY[0x24BDB26E8]);
      objc_msgSend(v52, "setExtendedLanguageTag:", CFSTR("und"));
      objc_msgSend(v52, "setValue:", v48);
      objc_msgSend(v8, "addObject:", v52);

    }
    else
    {
      v48 = (id)sPlayerLogObject;
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v48, OS_LOG_TYPE_DEFAULT, "Not setting approximate start date because none was provided", buf, 2u);
      }
    }

    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataExactEndTime"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "doubleForKey:", CFSTR("ExactEndTimeOverrideInMS"));
    v56 = v55;

    if (v56 > 0.0)
    {
      v57 = (id)sPlayerLogObject;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", v56 / 1000.0);
        v58 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v109 = v58;
        _os_log_impl(&dword_228A4E000, v57, OS_LOG_TYPE_DEFAULT, "Overriding exact end time with date %@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v56);
      v59 = objc_claimAutoreleasedReturnValue();

      v53 = (void *)v59;
    }
    if (v53)
    {
      v60 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v53, "doubleValue");
      objc_msgSend(v60, "dateWithTimeIntervalSince1970:", v61 / 1000.0);
      v62 = objc_claimAutoreleasedReturnValue();
      v63 = (id)sPlayerLogObject;
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        -[TVPPlayer seekableDateRange](self, "seekableDateRange");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "endDate");
        v65 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v109 = v62;
        v110 = 2112;
        v111 = v65;
        _os_log_impl(&dword_228A4E000, v63, OS_LOG_TYPE_DEFAULT, "Setting approximate end date %@ with seekable end date %@", buf, 0x16u);

      }
      v66 = objc_alloc_init(MEMORY[0x24BDB25B8]);
      objc_msgSend(v66, "setIdentifier:", *MEMORY[0x24BDB26E0]);
      objc_msgSend(v66, "setExtendedLanguageTag:", CFSTR("und"));
      objc_msgSend(v66, "setValue:", v62);
      objc_msgSend(v8, "addObject:", v66);

    }
    else
    {
      v62 = (id)sPlayerLogObject;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v62, OS_LOG_TYPE_DEFAULT, "Not setting approximate end date because none was provided", buf, 2u);
      }
    }

    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataArtworkURLString"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v67, "length"))
    {
      objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataArtworkURLFormat"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v68, "length"))
      {
        v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB4040]), "initUrlWithProperties:imageSize:focusSizeIncrease:cropCode:urlFormat:", v68, 0, CFSTR("jpeg"), 195.547, 110.0, 0.0);
        objc_msgSend(MEMORY[0x24BEB4058], "imageURLWithDescription:", v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "absoluteString");
        v71 = objc_claimAutoreleasedReturnValue();

        v67 = (void *)v71;
      }

    }
    if (objc_msgSend(v67, "length"))
    {
      +[TVPReachabilityMonitor sharedInstance](TVPReachabilityMonitor, "sharedInstance");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend(v72, "isNetworkReachable");

      if (v73)
      {
        v74 = v67;
        v75 = objc_alloc(MEMORY[0x24BEB4050]);
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v74);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = (void *)objc_msgSend(v75, "initWithURL:headers:identifier:decrypter:", v76, 0, v74, 0);

        v78 = objc_alloc(MEMORY[0x24BEB4038]);
        objc_msgSend(MEMORY[0x24BEB4048], "sharedInstance");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = (void *)objc_msgSend(v78, "initWithObject:imageLoader:groupType:", v77, v79, 0);

        if (v80)
          goto LABEL_86;
      }
    }
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataArtworkImageProxy"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80)
    {
LABEL_86:
      objc_msgSend(v5, "setPosterProxy:", v80);
      objc_initWeak((id *)buf, v5);
      v104[0] = MEMORY[0x24BDAC760];
      v104[1] = 3221225472;
      v104[2] = __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke;
      v104[3] = &unk_24F15BAB0;
      objc_copyWeak(&v105, (id *)buf);
      objc_msgSend(v80, "setCompletionHandler:", v104);
      objc_msgSend(v80, "load");
      objc_destroyWeak(&v105);
      objc_destroyWeak((id *)buf);

    }
    v81 = (id)sPlayerLogObject;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v81, OS_LOG_TYPE_DEFAULT, "Updating player item external metadata", buf, 2u);
    }

    objc_msgSend(v5, "setExternalMetadata:", v8);
  }

}

- (void)_playerMutedDidChange
{
  -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("muted"));
  -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("muted"));
}

- (void)_mediaItemLoader:(id)a3 stateDidChangeTo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint8_t buf[4];
  id v47;
  const __CFString *v48;
  void *v49;
  const __CFString *v50;
  id v51;
  const __CFString *v52;
  id v53;
  const __CFString *v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", 0x24F163DB8))
  {
    v54 = CFSTR("Media item loader key");
    v55[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer stateMachine](self, "stateMachine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postEvent:withContext:userInfo:", CFSTR("Media item loader did prepare item for loading"), 0, v8);

    objc_msgSend(v6, "mediaItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reportingDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "timingData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "startTimeForPreparingForLoading");
      v14 = v13;
      objc_msgSend(v12, "endTimeForPreparingForLoading");
      objc_msgSend(v11, "mediaItemDidPrepareForLoading:timeTakenForOperation:player:", v10, self, v15 - v14);

    }
    goto LABEL_31;
  }
  if (objc_msgSend(v7, "isEqualToString:", 0x24F163DF8))
  {
    objc_msgSend(v6, "mediaItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reportingDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "timingData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "startTimeForLoadingAVAssetKeys");
      v18 = v17;
      objc_msgSend(v16, "endTimeForLoadingAVAssetKeys");
      objc_msgSend(v10, "mediaItemDidLoadAVAssetKeys:timeTakenForOperation:player:", v8, self, v19 - v18);

    }
    -[TVPPlayer currentMediaItem](self, "currentMediaItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToMediaItem:", v20))
    {
      -[TVPPlayer cachedDuration](self, "cachedDuration");

      if ((v45 & 1) != 0)
      {
LABEL_29:
        v52 = CFSTR("Media item loader key");
        v53 = v6;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1, v42, v43, v44);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVPPlayer stateMachine](self, "stateMachine");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        v29 = CFSTR("Media item loader did load AVAsset keys");
LABEL_30:
        objc_msgSend(v27, "postEvent:withContext:userInfo:", v29, 0, v11);

LABEL_31:
        goto LABEL_32;
      }
      v21 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v21, OS_LOG_TYPE_DEFAULT, "Setting cached duration to value from AVAsset", buf, 2u);
      }
      objc_msgSend(v6, "AVAsset");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v22;
      if (v22)
      {
        objc_msgSend(v22, "duration");
      }
      else
      {
        v42 = 0;
        v43 = 0;
        v44 = 0;
      }
      -[TVPPlayer setCachedDuration:](self, "setCachedDuration:", &v42);
    }

    goto LABEL_29;
  }
  if (objc_msgSend(v7, "isEqualToString:", 0x24F163E38))
  {
    objc_msgSend(v6, "mediaItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reportingDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "timingData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "startTimeForPreparingForPlaybackInitiation");
      v25 = v24;
      objc_msgSend(v23, "endTimeForPreparingForPlaybackInitiation");
      objc_msgSend(v10, "mediaItemDidPrepareForPlaybackInitiation:timeTakenForOperation:player:", v8, self, v26 - v25);

    }
    v50 = CFSTR("Media item loader key");
    v51 = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer stateMachine](self, "stateMachine");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    v29 = CFSTR("Media item did prepare for playback initiation");
    goto LABEL_30;
  }
  if (objc_msgSend(v7, "isEqualToString:", 0x24F15F8F8))
  {
    objc_msgSend(v6, "mediaItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer playlist](self, "playlist");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "currentMediaItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v30, "isEqualToMediaItem:", v32);

    if (v33)
    {
      objc_msgSend(v6, "error");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mediaItem");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPPlayer playbackErrorFromError:forMediaItem:](self, "playbackErrorFromError:forMediaItem:", v34, v35);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = CFSTR("Error key");
      v49 = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPPlayer stateMachine](self, "stateMachine");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "postEvent:withContext:userInfo:", CFSTR("Error did occur"), 0, v10);

LABEL_32:
LABEL_33:

      goto LABEL_34;
    }
    objc_msgSend(v6, "mediaItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer playlist](self, "playlist");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "nextMediaItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v37, "isEqualToMediaItem:", v39);

    if (v40)
    {
      v41 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v6;
        _os_log_impl(&dword_228A4E000, v41, OS_LOG_TYPE_DEFAULT, "Cleaning up next item's media item loader that has failed: %@", buf, 0xCu);
      }
      -[TVPPlayer _removeObserversForMediaItemLoader:](self, "_removeObserversForMediaItemLoader:", v6);
      objc_msgSend(v6, "cleanupIfNecessary");
      -[TVPPlayer mediaItemLoaders](self, "mediaItemLoaders");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObject:", v6);
      goto LABEL_33;
    }
  }
LABEL_34:

}

- (void)_logExternalPlaybackType
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  NSObject *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (-[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "externalPlaybackType"),
        v4,
        v5 <= 2))
  {
    v6 = off_24F15D118[v5];
  }
  else
  {
    v6 = CFSTR("unknown (no AVPlayer)");
  }
  v7 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_228A4E000, v7, OS_LOG_TYPE_DEFAULT, "externalPlaybackType is %@", (uint8_t *)&v8, 0xCu);
  }
}

- (BOOL)_isScreenBeingRecorded
{
  return objc_msgSend(MEMORY[0x24BDF6D38], "_isProbablyBeingRecorded");
}

- (BOOL)_getStringForTitleLabel:(id *)a3 subtitleLabel:(id *)a4 forMediaItem:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;

  v7 = a5;
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataTitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataSeriesTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataSubtitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
  {
    *a3 = objc_retainAutorelease(v9);
    v11 = v8;
  }
  else
  {
    if (!objc_msgSend(v8, "length"))
    {
      v14 = objc_retainAutorelease(v10);
      v12 = 0;
      *a3 = v14;
      goto LABEL_6;
    }
    *a3 = objc_retainAutorelease(v8);
    v11 = v10;
  }
  v12 = objc_retainAutorelease(v11);
LABEL_6:
  *a4 = v12;

  return 1;
}

- (id)_descriptionForVideoRange:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("TVPVideoRangeUnknown");
  else
    return off_24F15D148[a3 - 1];
}

- (void)_currentPlayerItemWillChange
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_228A4E000, v3, OS_LOG_TYPE_DEFAULT, "Current player item will change", v6, 2u);
  }
  -[TVPPlayer setPlayerItemChangeIsHappening:](self, "setPlayerItemChangeIsHappening:", 1);
  if (!-[TVPPlayer modifyingAVPlayerQueue](self, "modifyingAVPlayerQueue"))
  {
    -[TVPPlayer mediaItemChangeReason](self, "mediaItemChangeReason");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer playlist](self, "playlist");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer _postCurrentMediaItemWillChangeNotificationWithDirection:reason:didHitBeginningOfPlaylist:didHitEndOfPlaylist:](self, "_postCurrentMediaItemWillChangeNotificationWithDirection:reason:didHitBeginningOfPlaylist:didHitEndOfPlaylist:", &unk_24F173540, v4, 0, objc_msgSend(v5, "moreItemsAvailable:", 0) ^ 1);

  }
}

- (void)_currentPlayerItemTracksDidChangeTo:(id)a3 from:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v7;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_228A4E000, v8, OS_LOG_TYPE_DEFAULT, "Current player item tracks did change.  Old tracks: %@ New tracks: %@", buf, 0x16u);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v15, "tracks");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v6, "isEqual:", v16);

        if (v17)
        {
          if (!objc_msgSend(v7, "count") && objc_msgSend(v6, "count"))
          {
            -[TVPPlayer _configureSoundCheckForPlayerItem:tracks:](self, "_configureSoundCheckForPlayerItem:tracks:", v15, v6);
            -[TVPPlayer _updateCurrentMediaItemVideoRangeForTracks:](self, "_updateCurrentMediaItemVideoRangeForTracks:", v6);
          }
          if (objc_msgSend(v6, "count"))
            -[TVPPlayer _updateCurrentMediaItemAudioInfoForPlayerItem:tracks:](self, "_updateCurrentMediaItemAudioInfoForPlayerItem:tracks:", v15, v6);
          goto LABEL_17;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_17:

  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reportingDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(v6, "count"))
    {
      if (objc_msgSend(v7, "count"))
      {
        if (-[TVPPlayer currentMediaItemIsStreaming](self, "currentMediaItemIsStreaming"))
        {
          v20 = -[TVPPlayer _videoTrackIDFromTracks:](self, "_videoTrackIDFromTracks:", v7);
          v21 = -[TVPPlayer _videoTrackIDFromTracks:](self, "_videoTrackIDFromTracks:", v6);
          if (v20)
          {
            if (v21 && v20 != v21)
              objc_msgSend(v19, "mediaItemDidSwitchVariantStreams:player:", v18, self);
          }
        }
      }
    }
  }

}

- (void)_currentPlayerItemTimedMetadataDidChange
{
  -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("timedMetadata"));
  -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("timedMetadata"));
}

- (void)_currentPlayerItemStatusDidChangeTo:(int64_t)a3 from:(int64_t)a4
{
  NSObject *v7;
  const __CFString *v8;
  _BOOL4 v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  uint8_t buf[4];
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("AVPlayerItemStatusFailed");
    if (a3 == 1)
      v8 = CFSTR("AVPlayerItemStatusReadyToPlay");
    if (!a3)
      v8 = CFSTR("AVPlayerItemStatusUnknown");
    *(_DWORD *)buf = 138412290;
    v26 = v8;
    _os_log_impl(&dword_228A4E000, v7, OS_LOG_TYPE_DEFAULT, "Current player item status did change to %@", buf, 0xCu);
  }
  v9 = -[TVPPlayer playerItemChangeIsHappening](self, "playerItemChangeIsHappening");
  if (a3 == 2 && v9)
  {
    v10 = sPlayerLogObject;
    if (!os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v11 = "Temporarily ignoring player item status change to AVPlayerItemStatusFailed since item transition is in progres"
          "s.  Will handle when transition completes";
LABEL_14:
    _os_log_impl(&dword_228A4E000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
    return;
  }
  if (a3 == a4)
  {
    v10 = sPlayerLogObject;
    if (!os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v11 = "Ignoring player item status change since it hasn't actually changed";
    goto LABEL_14;
  }
  -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPreviousStatus:", a4);

  if (a3 == 1)
  {
    -[TVPPlayer stateMachine](self, "stateMachine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postEvent:", CFSTR("Current player item status did become ready to play"));

    return;
  }
  if (a3 == 2)
  {
    -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer currentMediaItem](self, "currentMediaItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer playbackErrorFromError:forMediaItem:](self, "playbackErrorFromError:forMediaItem:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDB1C58]))
    {
      v19 = objc_msgSend(v17, "code");

      if (v19 == -11819)
      {
        v20 = sPlayerLogObject;
        if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_228A4E000, v20, OS_LOG_TYPE_DEFAULT, "Ignoring player item failure due to media services reset.  Error from media item loader should be sent shortly.", buf, 2u);
        }
        goto LABEL_24;
      }
    }
    else
    {

    }
    -[TVPPlayer stateMachine](self, "stateMachine");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("Error key");
    v24 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "postEvent:withContext:userInfo:", CFSTR("Error did occur"), 0, v22);

LABEL_24:
  }
}

- (void)_currentPlayerItemSeekableTimeRangesDidChangeTo:(id)a3
{
  Float64 v4;
  CMTime v5;

  -[TVPPlayer setCachedSeekableTimeRanges:](self, "setCachedSeekableTimeRanges:", a3);
  -[TVPPlayer elapsedTime](self, "elapsedTime");
  CMTimeMakeWithSeconds(&v5, v4, 1000000);
  -[TVPPlayer _updateIsLiveForElapsedTime:](self, "_updateIsLiveForElapsedTime:", &v5);
}

- (void)_currentPlayerItemPresentationSizeDidChangeTo:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  CGSize v12;

  height = a3.height;
  width = a3.width;
  v11 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v12.width = width;
    v12.height = height;
    NSStringFromCGSize(v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_228A4E000, v7, OS_LOG_TYPE_DEFAULT, "Current player item presentationSize did change to %@", (uint8_t *)&v9, 0xCu);

  }
  -[TVPPlayer setCurrentMediaItemPresentationSize:](self, "setCurrentMediaItemPresentationSize:", width, height);
}

- (void)_currentPlayerItemLoadedTimeRangesDidChangeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  Float64 v8;
  Float64 v9;
  NSObject *v10;
  void *v11;
  CMTimeRange v12;
  CMTimeRange v13;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v16;
  CMTimeRange v17;
  CMTime end;
  CMTime start;
  CMTimeRange v20;

  v4 = a3;
  -[TVPPlayer cachedLoadedTimeRanges](self, "cachedLoadedTimeRanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPPlayer setCachedLoadedTimeRanges:](self, "setCachedLoadedTimeRanges:", v4);
  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataForwardPlaybackEndTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    memset(&v20, 0, sizeof(v20));
    -[TVPPlayer elapsedTime](self, "elapsedTime");
    CMTimeMakeWithSeconds(&start, v8, 1000000);
    objc_msgSend(v7, "doubleValue");
    CMTimeMakeWithSeconds(&end, v9, 1000000);
    CMTimeRangeFromTimeToTime(&v20, &start, &end);
    memset(&v17, 0, sizeof(v17));
    +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:](TVPTimeRange, "forwardmostCMTimeRangeInCMTimeRanges:", v4);
    range = v17;
    memset(&v16, 0, sizeof(v16));
    otherRange = v20;
    CMTimeRangeGetIntersection(&v16, &range, &otherRange);
    memset(&range, 0, sizeof(range));
    +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:](TVPTimeRange, "forwardmostCMTimeRangeInCMTimeRanges:", v5);
    v13 = range;
    memset(&otherRange, 0, sizeof(otherRange));
    v12 = v20;
    CMTimeRangeGetIntersection(&otherRange, &v13, &v12);
    v13.start = otherRange.duration;
    v12.start = v20.duration;
    if (CMTimeCompare(&v13.start, &v12.start) < 0)
    {
      v13.start = v16.duration;
      v12.start = v20.duration;
      if ((CMTimeCompare(&v13.start, &v12.start) & 0x80000000) == 0)
      {
        v10 = sPlayerLogObject;
        if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v13.start.value) = 0;
          _os_log_impl(&dword_228A4E000, v10, OS_LOG_TYPE_DEFAULT, "Sending \"Sufficient Buffer Did Become Available\" since entire scene is loaded", (uint8_t *)&v13, 2u);
        }
        -[TVPPlayer setSceneCompletelyBuffered:](self, "setSceneCompletelyBuffered:", 1);
        -[TVPPlayer stateMachine](self, "stateMachine");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "postEvent:", CFSTR("Sufficient buffer did become available"));

      }
    }
    else
    {
      v13.start = v16.duration;
      v12.start = v20.duration;
      if (CMTimeCompare(&v13.start, &v12.start) < 0)
        -[TVPPlayer setSceneCompletelyBuffered:](self, "setSceneCompletelyBuffered:", 0);
    }
  }

}

- (void)_currentPlayerItemLikelyToKeepUpDidChangeTo:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "Current player item playbackLikelyToKeepUp did change to %@", (uint8_t *)&v8, 0xCu);
  }
  if (v3)
  {
    -[TVPPlayer stateMachine](self, "stateMachine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postEvent:", CFSTR("Sufficient buffer did become available"));

  }
}

- (void)_currentPlayerItemHasVideoDidChangeTo:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  v5 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "Current player item hasVideo did change to %@", (uint8_t *)&v10, 0xCu);
  }
  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasTrait:", CFSTR("TVPMediaItemTraitTreatAsVideo"));

  if (v8)
  {
    v9 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Treating as video since it has TVPMediaItemTraitTreatAsVideo", (uint8_t *)&v10, 2u);
    }
    v3 = 1;
  }
  -[TVPPlayer setCurrentMediaItemHasVideoContent:](self, "setCurrentMediaItemHasVideoContent:", v3);
}

- (void)_currentPlayerItemDurationDidChangeTo:(id *)a3
{
  void *v5;
  NSObject *v6;
  __CFString *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *a3;
    v6 = v5;
    v7 = (__CFString *)CMTimeCopyDescription(0, (CMTime *)&v8);
    LODWORD(v8.var0) = 138412290;
    *(int64_t *)((char *)&v8.var0 + 4) = (int64_t)v7;
    _os_log_impl(&dword_228A4E000, v6, OS_LOG_TYPE_DEFAULT, "Current player item duration did change to %@", (uint8_t *)&v8, 0xCu);

  }
  v8 = *a3;
  -[TVPPlayer setCachedDuration:](self, "setCachedDuration:", &v8);
}

- (void)_currentPlayerItemDidChangeTo:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  uint8_t buf[16];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "Current player item did change to %@", buf, 0xCu);
  }
  -[TVPPlayer setPlayerItemChangeIsHappening:](self, "setPlayerItemChangeIsHappening:", 0);
  -[TVPPlayer setCurrentPlayerItem:](self, "setCurrentPlayerItem:", v4);
  -[TVPPlayer setCurrentMediaItemHasDates:](self, "setCurrentMediaItemHasDates:", 0);
  -[TVPPlayer setChapterCollections:](self, "setChapterCollections:", 0);
  -[TVPPlayer setCurrentChapterCollection:](self, "setCurrentChapterCollection:", 0);
  -[TVPPlayer setCurrentChapter:](self, "setCurrentChapter:", 0);
  -[TVPPlayer setCurrentInterstitialCollection:](self, "setCurrentInterstitialCollection:", 0);
  -[TVPPlayer setCurrentInterstitial:](self, "setCurrentInterstitial:", 0);
  -[TVPPlayer setAudioOptions:](self, "setAudioOptions:", 0);
  -[TVPPlayer setSubtitleOptions:](self, "setSubtitleOptions:", 0);
  *(_OWORD *)buf = *MEMORY[0x24BDC0D88];
  v17 = *(_OWORD *)buf;
  v24 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v6 = v24;
  -[TVPPlayer setTimeBeingSeekedTo:](self, "setTimeBeingSeekedTo:", buf);
  -[TVPPlayer setDateBeingSeekedTo:](self, "setDateBeingSeekedTo:", 0);
  *(_OWORD *)buf = v17;
  v24 = v6;
  -[TVPPlayer setTimeAtStartOfSeek:](self, "setTimeAtStartOfSeek:", buf);
  -[TVPPlayer setPlaybackDateAtStartOfSeek:](self, "setPlaybackDateAtStartOfSeek:", 0);
  -[TVPPlayer externalImagePlayer](self, "externalImagePlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[TVPPlayer setExternalImagePlayer:](self, "setExternalImagePlayer:", 0);
  -[TVPPlayer setCachedSelectedAudioOption:](self, "setCachedSelectedAudioOption:", 0);
  -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("selectedAudioOption"));
  -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("selectedAudioOption"));
  -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("selectedSubtitleOption"));
  -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("selectedSubtitleOption"));
  v8 = -[TVPPlayer modifyingAVPlayerQueue](self, "modifyingAVPlayerQueue");
  v9 = MEMORY[0x24BDAC760];
  if (!v8)
  {
    -[TVPPlayer playlist](self, "playlist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v11, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("Changing media because AVFoundation advanced key"));
    -[TVPPlayer mediaItemChangeReason](self, "mediaItemChangeReason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[TVPPlayer mediaItemChangeReason](self, "mediaItemChangeReason");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("TVPPlaybackCurrentMediaItemChangeReasonKey"));

      -[TVPPlayer setMediaItemChangeReason:](self, "setMediaItemChangeReason:", 0);
    }
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __43__TVPPlayer__currentPlayerItemDidChangeTo___block_invoke;
    block[3] = &unk_24F15BCB0;
    v21 = v10;
    v22 = v11;
    v14 = v11;
    v15 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  if (objc_msgSend(v4, "status") == 2)
  {
    v16 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v16, OS_LOG_TYPE_DEFAULT, "Player item changed to an item that has already failed", buf, 2u);
    }
    objc_initWeak((id *)buf, self);
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __43__TVPPlayer__currentPlayerItemDidChangeTo___block_invoke_409;
    v18[3] = &unk_24F15C088;
    objc_copyWeak(&v19, (id *)buf);
    dispatch_async(MEMORY[0x24BDAC9B8], v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_currentPlayerItemBufferFullDidChangeTo:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  v5 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "Current player item playbackBufferFull did change to %@", (uint8_t *)&v8, 0xCu);
  }
  if (v3)
  {
    -[TVPPlayer stateMachine](self, "stateMachine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postEvent:", CFSTR("Sufficient buffer did become available"));

  }
}

- (void)_currentPlayerItemBufferEmptyDidChangeTo:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v5 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("NO");
    if (v3)
      v6 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "Current player item playbackBufferEmpty did change to %@", buf, 0xCu);
  }
  if (v3)
  {
    -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rate");
    v9 = v8;

    -[TVPPlayer stateMachine](self, "stateMachine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9, CFSTR("Rate key"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postEvent:withContext:userInfo:", CFSTR("Buffer did become empty"), 0, v12);

  }
}

- (void)_currentPlayerItemAccessLogDidChange:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_228A4E000, v4, OS_LOG_TYPE_DEFAULT, "Current player item access log did change", v5, 2u);
  }
  -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("accessLog"));
  -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("accessLog"));
}

- (void)_currentMediaItemMetadataDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFDictionary *v34;
  void *v35;
  void *v36;
  const __CFDictionary *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  CMTime v49;
  CMTime v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("TVPMediaItemMetadataChangesKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "containsObject:", CFSTR("TVPMediaItemMetadataChapterCollections")))
  {
    -[TVPPlayer currentMediaItem](self, "currentMediaItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataChapterCollections"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    -[TVPPlayer chapterCollections](self, "chapterCollections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v56 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          if (objc_msgSend(v14, "type") != 2)
            objc_msgSend(v8, "addObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      }
      while (v11);
    }

    objc_msgSend(v8, "addObjectsFromArray:", v7);
    -[TVPPlayer currentChapterCollection](self, "currentChapterCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "firstObject");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v48 = v7;
      v18 = v7;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      if (v19)
      {
        v20 = v19;
        v46 = v17;
        v47 = v5;
        v21 = *(_QWORD *)v52;
        while (2)
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v52 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
            objc_msgSend(v23, "name");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "isEqual:", v16);

            if (v25)
            {
              v17 = v23;

              v5 = v47;
              goto LABEL_22;
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
          if (v20)
            continue;
          break;
        }
        v17 = v46;
        v5 = v47;
      }
LABEL_22:

      v7 = v48;
    }
    -[TVPPlayer setChapterCollections:](self, "setChapterCollections:", v8);
    -[TVPPlayer setCurrentChapterCollection:](self, "setCurrentChapterCollection:", v17);

  }
  if (objc_msgSend(v5, "containsObject:", CFSTR("TVPMediaItemMetadataWebVTTStyles")))
  {
    -[TVPPlayer currentMediaItem](self, "currentMediaItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataWebVTTStyles"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDB26B0], "textStyleRulesFromPropertyList:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTextStyleRules:", v29);

  }
  if (objc_msgSend(v5, "containsObject:", CFSTR("TVPMediaItemMetadataScrubPlayerItem")))
  {
    -[TVPPlayer currentMediaItem](self, "currentMediaItem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataScrubPlayerItem"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer _setScrubPlayerItem:onPlayerItem:](self, "_setScrubPlayerItem:onPlayerItem:", v31, v32);

  }
  if ((objc_msgSend(v5, "containsObject:", CFSTR("TVPMediaItemMetadataUpNextPresentationTime")) & 1) != 0
    || objc_msgSend(v5, "containsObject:", CFSTR("TVPMediaItemMetadataUpNextAutomaticAcceptanceInterval")))
  {
    -[TVPPlayer _populateCurrentPlayerItemWithUpNextMetadata](self, "_populateCurrentPlayerItemWithUpNextMetadata");
  }
  if (objc_msgSend(v5, "containsObject:", CFSTR("TVPMediaItemMetadataTimeToPauseBuffering")))
  {
    -[TVPPlayer currentMediaItem](self, "currentMediaItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataTimeToPauseBuffering"));
    v34 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&v50, v34);
      objc_msgSend(v35, "setTimeToPauseBuffering:", &v50);

    }
  }
  if (objc_msgSend(v5, "containsObject:", CFSTR("TVPMediaItemMetadataTimeToPausePlayback")))
  {
    -[TVPPlayer currentMediaItem](self, "currentMediaItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataTimeToPausePlayback"));
    v37 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      CMTimeMakeFromDictionary(&v49, v37);
      objc_msgSend(v38, "setTimeToPausePlayback:", &v49);

    }
  }
  if (_currentMediaItemMetadataDidChange__onceToken != -1)
    dispatch_once(&_currentMediaItemMetadataDidChange__onceToken, &__block_literal_global_421);
  -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v40 = (void *)v39;
    -[TVPPlayer currentMediaItem](self, "currentMediaItem");
    v41 = objc_claimAutoreleasedReturnValue();
    if (!v41)
    {
LABEL_45:

      goto LABEL_46;
    }
    v42 = (void *)v41;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "intersectsSet:", _currentMediaItemMetadataDidChange__metadataKeysUsedByAVKit);

    if (v44)
    {
      -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPPlayer currentMediaItem](self, "currentMediaItem");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPPlayer _populatePlayerItem:withMetadataFromMediaItem:](self, "_populatePlayerItem:withMetadataFromMediaItem:", v40, v45);

      goto LABEL_45;
    }
  }
LABEL_46:

}

- (void)_configureSoundCheckForPlayerItem:(id)a3 tracks:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(a3, "mediaItemLoader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataSoundCheckDictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v23 = v8;
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    v24 = v7;
    objc_msgSend(v7, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataSoundCheckMediaKind"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v9, "setObject:forKey:", v10, *MEMORY[0x24BDB6D60]);
    v22 = (void *)v10;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v25 = v5;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      v15 = *MEMORY[0x24BDB1CF0];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v17, "isEnabled", v22))
          {
            objc_msgSend(v17, "assetTrack");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "mediaType");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", v15);

            if (v20)
            {
              v21 = sPlayerLogObject;
              if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v31 = v9;
                _os_log_impl(&dword_228A4E000, v21, OS_LOG_TYPE_DEFAULT, "Sound check: setting AVPlayerItemTrack loudnessInfo to %@", buf, 0xCu);
              }
              objc_msgSend(v17, "setLoudnessInfo:", v9);
            }
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v13);
    }

    v7 = v24;
    v5 = v25;
    v8 = v23;
  }

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_clampInfiniteTimeToSeekableRange:(SEL)a3
{
  void *v7;
  __int128 v8;
  CMTimeRange v9;
  CMTime time;
  CMTime v11;
  CMTimeRange v12;

  *retstr = *a4;
  if ((~a4->var2 & 5) == 0 || (a4->var2 & 9) == 9)
  {
    -[$3CC8671D27C23BF42ADDB32F2B5E48AE cachedSeekableTimeRanges](self, "cachedSeekableTimeRanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v12, 0, sizeof(v12));
    +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:](TVPTimeRange, "forwardmostCMTimeRangeInCMTimeRanges:", v7);
    v8 = *(_OWORD *)&a4->var0;
    time.epoch = a4->var3;
    v9 = v12;
    *(_OWORD *)&time.value = v8;
    CMTimeClampToRange(&v11, &time, &v9);
    *(CMTime *)retstr = v11;

  }
  return self;
}

- (BOOL)_beingUsedForIFrameOnlyPlayback
{
  double v2;
  double v3;

  -[TVPPlayer iFramePrefetchMaxSize](self, "iFramePrefetchMaxSize");
  return v3 != *(double *)(MEMORY[0x24BDBF148] + 8) || v2 != *MEMORY[0x24BDBF148];
}

- (id)_assetTracksOfType:(id)a3 fromTracks:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "assetTrack", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "statusOfValueForKey:error:", CFSTR("mediaType"), 0) == 2)
        {
          objc_msgSend(v13, "mediaType");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", v5);

          if (v15)
            objc_msgSend(v7, "addObject:", v13);
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)_addPlaybackEndTimeBoundaryObservers
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  Float64 v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  Float64 v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  CMTime v31;
  id location;
  CMTime v33;
  void *v34;
  _QWORD v35[3];

  v35[1] = *MEMORY[0x24BDAC8D0];
  -[TVPPlayer currentMediaItemLoader](self, "currentMediaItemLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsStreamingAVAsset");

  if (v4)
  {
    -[TVPPlayer playlist](self, "playlist");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentMediaItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataForwardPlaybackEndTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (v7)
    {
      memset(&v33, 0, sizeof(v33));
      objc_msgSend(v7, "doubleValue");
      CMTimeMakeWithSeconds(&v33, v9, 1000000);
      objc_initWeak(&location, self);
      -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v33;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v31);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x24BDAC9B8];
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __49__TVPPlayer__addPlaybackEndTimeBoundaryObservers__block_invoke;
      v29[3] = &unk_24F15C088;
      objc_copyWeak(&v30, &location);
      objc_msgSend(v10, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v12, MEMORY[0x24BDAC9B8], v29);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        objc_msgSend(v8, "addObject:", v14);

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
    -[TVPPlayer playlist](self, "playlist");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentMediaItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataReversePlaybackEndTime"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      memset(&v33, 0, sizeof(v33));
      objc_msgSend(v17, "doubleValue");
      CMTimeMakeWithSeconds(&v33, v18, 1000000);
      objc_initWeak(&location, self);
      -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v33;
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v31);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x24BDAC9B8];
      v24 = MEMORY[0x24BDAC760];
      v25 = 3221225472;
      v26 = __49__TVPPlayer__addPlaybackEndTimeBoundaryObservers__block_invoke_372;
      v27 = &unk_24F15C088;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v19, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v21, MEMORY[0x24BDAC9B8], &v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        objc_msgSend(v8, "addObject:", v23, v24, v25, v26, v27);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
    -[TVPPlayer setPlaybackEndTimeBoundaryObserverTokens:](self, "setPlaybackEndTimeBoundaryObserverTokens:", v8, v24, v25, v26, v27);

  }
}

- (void)_addPeriodicTimeObserverToAVQueuePlayer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  CMTime v14;
  _QWORD v15[4];
  id v16;
  CMTime v17;
  id location;

  v4 = a3;
  if (v4)
  {
    -[TVPPlayer periodicTimeObserverToken](self, "periodicTimeObserverToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_initWeak(&location, self);
      memset(&v17, 0, sizeof(v17));
      CMTimeMakeWithSeconds(&v17, 1.0, 1000000);
      v6 = MEMORY[0x24BDAC9B8];
      v7 = MEMORY[0x24BDAC9B8];
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __53__TVPPlayer__addPeriodicTimeObserverToAVQueuePlayer___block_invoke;
      v15[3] = &unk_24F15C558;
      objc_copyWeak(&v16, &location);
      v14 = v17;
      objc_msgSend(v4, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v14, v6, v15);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[TVPPlayer setPeriodicTimeObserverToken:](self, "setPeriodicTimeObserverToken:", v8);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    -[TVPPlayer timeJumpPeriodicObserverToken](self, "timeJumpPeriodicObserverToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      memset(&v17, 0, sizeof(v17));
      CMTimeMakeWithSeconds(&v17, 10000000.0, 1000);
      objc_initWeak(&location, self);
      v10 = MEMORY[0x24BDAC9B8];
      v11 = MEMORY[0x24BDAC9B8];
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __53__TVPPlayer__addPeriodicTimeObserverToAVQueuePlayer___block_invoke_2;
      v12[3] = &unk_24F15C558;
      objc_copyWeak(&v13, &location);
      v14 = v17;
      objc_msgSend(v4, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v14, v10, v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[TVPPlayer setTimeJumpPeriodicObserverToken:](self, "setTimeJumpPeriodicObserverToken:", v9);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }

  }
}

- (void)_addObserversToAVQueuePlayer:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = __AVPlayerCurrentItemKVOContext;
    v5 = a3;
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem"), 9, v4);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("timeControlStatus"), 7, __AVPlayerTimeControlStatusKVOContext);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("outputObscuredDueToInsufficientExternalProtection"), 1, __AVPlayerOutputObscuredDueToInsufficientExternalProtectionKVOContext);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("externalPlaybackActive"), 0, __AVPlayerExternalPlaybackActiveKVOContext);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("muted"), 0, __AVPlayerMutedKVOContext);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem.status"), 3, __AVPlayerItemStatusKVOContext);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem.duration"), 1, __AVPlayerItemDurationKVOContext);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem.hasVideo"), 1, __AVPlayerItemHasVideoContext);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem.presentationSize"), 1, __AVPlayerItemPresentationSizeContent);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem.playbackLikelyToKeepUp"), 1, __AVPlayerItemLikelyToKeepUpKVOContext);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem.playbackBufferFull"), 1, __AVPlayerItemBufferFullKVOContext);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem.playbackBufferEmpty"), 1, __AVPlayerItemBufferEmptyKVOContext);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem.loadedTimeRanges"), 1, __AVPlayerItemLoadedTimeRangesKVOContext);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem.seekableTimeRanges"), 1, __AVPlayerItemSeekableTimeRangesKVOContext);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem.timedMetadata"), 0, __AVPlayerItemTimedMetadataKVOContext);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItem.tracks"), 3, __AVPlayerItemTracksKVOContext);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__avPlayerRateDidChange_, *MEMORY[0x24BDB2060], v5);

  }
}

- (void)_addObserversForPlaylist:(id)a3
{
  uint64_t v4;
  id v5;

  if (a3)
  {
    v4 = __TVPPlaylistEndActionKVOContext;
    v5 = a3;
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("endAction"), 1, v4);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("currentMediaItem"), 9, __TVPPlaylistCurrentMediaItemKVOContext);
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", self, CFSTR("nextMediaItem"), 1, __TVPPlaylistNextMediaItemKVOContext);

  }
}

- (void)_addObserversForPlayerItem:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__currentPlayerItemDidHitBeginningOrEnd_, *MEMORY[0x24BDB1FA8], v5);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__currentPlayerItemAccessLogDidChange_, *MEMORY[0x24BDB1FF0], v5);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__currentPlayerItemErrorLogDidChange_, *MEMORY[0x24BDB1FF8], v5);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__currentPlayerItemDidStall_, *MEMORY[0x24BDB2010], v5);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__currentPlayerItemDidFailToPlayToEnd_, *MEMORY[0x24BDB1FB8], v5);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__currentPlayerItemMediaSelectionDidChange_, *MEMORY[0x24BDB1FE8], v5);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__currentPlayerItemReachedTimeToPauseBuffering_, *MEMORY[0x24BDB2018], v5);
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__currentPlayerItemReachedTimeToPausePlayback_, *MEMORY[0x24BDB2020], v5);

  }
}

- (void)_addObserversForMediaItemLoader:(id)a3
{
  if (a3)
    objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("state"), 1, __TVPMediaItemLoaderStateKVOContext_0);
}

- (void)_addObserversForMediaItem:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__currentMediaItemMetadataDidChange_, CFSTR("TVPMediaItemMetadataDidChangeNotification"), v5);

  }
}

- (void)_addHighFrequencyTimeObserverIfNecessary
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  CMTime v14;
  id location;

  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v11 = (id)v3;
    -[TVPPlayer highFrequencyElapsedTimeObserverBlock](self, "highFrequencyElapsedTimeObserverBlock");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[TVPPlayer highFrequencyTimeObserverToken](self, "highFrequencyTimeObserverToken");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        objc_initWeak(&location, self);
        -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        CMTimeMakeWithSeconds(&v14, 0.1, 1000000);
        v8 = MEMORY[0x24BDAC9B8];
        v9 = MEMORY[0x24BDAC9B8];
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __53__TVPPlayer__addHighFrequencyTimeObserverIfNecessary__block_invoke;
        v12[3] = &unk_24F15C558;
        objc_copyWeak(&v13, &location);
        objc_msgSend(v7, "addPeriodicTimeObserverForInterval:queue:usingBlock:", &v14, v8, v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        -[TVPPlayer setHighFrequencyTimeObserverToken:](self, "setHighFrequencyTimeObserverToken:", v10);
        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
      }
    }
    else
    {

    }
  }
}

- (AVQueuePlayer)AVQueuePlayer
{
  return self->_AVQueuePlayer;
}

+ (int64_t)tvpVideoRangeForVideoDynamicRange:(int)a3
{
  if ((a3 - 1) > 9)
    return 0;
  else
    return qword_228AB2D80[a3 - 1];
}

+ (id)savedPreferredAudioLanguageCode
{
  return 0;
}

+ (void)removeTemporaryDownloadDirectory
{
  +[TVPMediaItemLoader removeTemporaryDownloadDirectory](TVPMediaItemLoader, "removeTemporaryDownloadDirectory");
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if (automaticallyNotifiesObserversForKey__onceToken != -1)
    dispatch_once(&automaticallyNotifiesObserversForKey__onceToken, &__block_literal_global_156);
  if ((objc_msgSend((id)automaticallyNotifiesObserversForKey__keysToNotifyManually, "containsObject:", v4) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___TVPPlayer;
    v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

+ (void)_updateAudioSelectionCriteriaForAVQueuePlayer:(id)a3 mediaItemLoader:(id)a4 preferredAudioLanguageCodes:(id)a5 prefersAudioDescriptions:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v6 = a6;
  v17 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if (v9)
  {
    v10 = a5;
    v11 = a4;
    objc_msgSend(v9, "tvp_cachedAudioSelectionCriteria");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_audioSelectionCriteriaForPreferredAudioLanguageCodes:mediaItemLoader:prefersAudioDescriptions:", v10, v11, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 != v13 && (objc_msgSend(v12, "tvp_isEqualToCriteria:", v13) & 1) == 0)
    {
      v14 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v13;
        _os_log_impl(&dword_228A4E000, v14, OS_LOG_TYPE_DEFAULT, "Setting audible media selection criteria to %@", (uint8_t *)&v15, 0xCu);
      }
      objc_msgSend(v9, "setTvp_cachedAudioSelectionCriteria:", v13);
      objc_msgSend(v9, "setMediaSelectionCriteria:forMediaCharacteristic:", v13, *MEMORY[0x24BDB1C90]);
    }

  }
}

+ (id)_stringForAudioFormat:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3)
    return CFSTR("Unknown");
  else
    return off_24F15D168[a3 - 1];
}

+ (void)_playerWillBecomeActive:(id)a3
{
  if (a3)
  {
    sNeedsAVAudioSessionDeactivation = 0;
    objc_msgSend((id)sActivePlayers, "addObject:");
  }
}

+ (id)_newAVQueuePlayer
{
  TVPBackgroundQueuePlayer *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(TVPBackgroundQueuePlayer);
  -[TVPBackgroundQueuePlayer setUsesExternalPlaybackWhileExternalScreenIsActive:](v3, "setUsesExternalPlaybackWhileExternalScreenIsActive:", 1);
  -[TVPBackgroundQueuePlayer setAllowsOutOfBandTextTrackRendering:](v3, "setAllowsOutOfBandTextTrackRendering:", 1);
  objc_msgSend((id)objc_opt_class(), "savedPreferredAudioLanguageCode");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v10[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(a1, "_updateAudioSelectionCriteriaForAVQueuePlayer:mediaItemLoader:preferredAudioLanguageCodes:prefersAudioDescriptions:", v3, 0, v6, 0);
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB2658]), "initWithPreferredLanguages:preferredMediaCharacteristics:", v7, 0);
  -[TVPBackgroundQueuePlayer setAllowsLegibleFallbackForAllAudibleMediaSelections:](v3, "setAllowsLegibleFallbackForAllAudibleMediaSelections:", 1);
  -[TVPBackgroundQueuePlayer setLegibleFallbackMediaSelectionCriteria:](v3, "setLegibleFallbackMediaSelectionCriteria:", v8);

  return v3;
}

+ (id)_audioSelectionCriteriaForPreferredAudioLanguageCodes:(id)a3 mediaItemLoader:(id)a4 prefersAudioDescriptions:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  uint8_t buf[16];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  _BYTE v45[128];
  _QWORD v46[2];
  _QWORD v47[3];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5
    || (v11 = (void *)MAAudibleMediaPrefCopyPreferDescriptiveVideo(),
        v12 = objc_msgSend(v11, "BOOLValue"),
        v11,
        v12))
  {
    if (v10)
    {
      if (v7)
      {
        objc_msgSend(v7, "arrayByAddingObject:", v10);
        v13 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v13;
      }
      else
      {
        v47[0] = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 1);
        v7 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    v14 = objc_alloc(MEMORY[0x24BDB2658]);
    v18 = *MEMORY[0x24BDB1CB0];
    v46[0] = *MEMORY[0x24BDB1CC8];
    v46[1] = v18;
    v15 = (void *)MEMORY[0x24BDBCE30];
    v16 = v46;
    v17 = 2;
    goto LABEL_10;
  }
  if (objc_msgSend(v7, "count"))
  {
    v14 = objc_alloc(MEMORY[0x24BDB2658]);
    v42 = *MEMORY[0x24BDB1CC8];
    v15 = (void *)MEMORY[0x24BDBCE30];
    v16 = &v42;
    v17 = 1;
LABEL_10:
    objc_msgSend(v15, "arrayWithObjects:count:", v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v14, "initWithPreferredLanguages:preferredMediaCharacteristics:", v7, v19);
    goto LABEL_11;
  }
  objc_msgSend(v8, "mediaItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hasTrait:", CFSTR("TVPMediaItemTraitIsLocal"));

  if (v23)
  {
    objc_msgSend(v8, "AVAsset");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "assetCache");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v19, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x24BDB1C90]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "defaultOption");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v24;
      objc_msgSend(v24, "mediaSelectionOptionsInMediaSelectionGroup:", v25);
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v39;
        while (2)
        {
          v31 = 0;
          do
          {
            if (*(_QWORD *)v39 != v30)
              objc_enumerationMutation(v27);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v31), "isEqual:", v26) & 1) != 0)
            {

              v33 = sPlayerLogObject;
              if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_228A4E000, v33, OS_LOG_TYPE_DEFAULT, "Default audio option is downloaded.  Will pick default audio option", buf, 2u);
              }

              goto LABEL_29;
            }
            ++v31;
          }
          while (v29 != v31);
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
          if (v29)
            continue;
          break;
        }
      }

      v24 = v36;
    }
    v32 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v32, OS_LOG_TYPE_DEFAULT, "Default audio option is not downloaded.  Will let Core Media pick whatever it wants", buf, 2u);
    }

    v20 = 0;
  }
  else
  {
LABEL_29:
    v34 = objc_alloc(MEMORY[0x24BDB2658]);
    v44 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = *MEMORY[0x24BDB1CC8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v34, "initWithPrincipalMediaCharacteristics:preferredLanguages:preferredMediaCharacteristics:", &unk_24F173910, v19, v35);

  }
LABEL_11:

  return v20;
}

+ (int64_t)_audioFormatForFormatDescription:(opaqueCMFormatDescription *)a3
{
  signed int MediaSubType;
  int64_t result;
  int v6;
  int v7;
  const AudioFormatListItem *FormatList;
  int mFormatID;
  int v10;
  signed int v11;
  int64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  unsigned __int16 v17;
  unsigned __int16 v18;
  size_t sizeOut;

  MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
  result = 4;
  if (MediaSubType <= 1885692722)
  {
    if (MediaSubType > 1700997938)
    {
      if (MediaSubType == 1700997939)
        return result;
      if (MediaSubType != 1700998451)
      {
        v6 = 1885547315;
        goto LABEL_16;
      }
LABEL_18:
      sizeOut = 0;
      FormatList = CMAudioFormatDescriptionGetFormatList(a3, &sizeOut);
      if (!FormatList || sizeOut <= 0x2F)
        goto LABEL_28;
      mFormatID = FormatList->mASBD.mFormatID;
      if (mFormatID <= 1885547314)
      {
        if (mFormatID == 1667574579)
          return 4;
        v10 = 1700997939;
      }
      else
      {
        if (mFormatID == 1885547315 || mFormatID == 1902324531)
          return 4;
        v10 = 2053319475;
      }
      if (mFormatID != v10)
        goto LABEL_28;
      return 4;
    }
    if (MediaSubType == 1667574579)
      return result;
    v7 = 1667575091;
LABEL_12:
    if (MediaSubType != v7)
      goto LABEL_28;
    goto LABEL_18;
  }
  if (MediaSubType > 1902469938)
  {
    if (MediaSubType == 2053464883)
      goto LABEL_18;
    if (MediaSubType == 2053319475)
      return result;
    v7 = 1902469939;
    goto LABEL_12;
  }
  if (MediaSubType == 1885692723)
    goto LABEL_18;
  v6 = 1902324531;
LABEL_16:
  if (MediaSubType == v6)
    return result;
LABEL_28:
  v11 = CMFormatDescriptionGetMediaSubType(a3);
  v12 = 4;
  result = 1;
  if (v11 > 1885430114)
  {
    if (v11 <= 1902207855)
    {
      if (v11 > 1885547314)
      {
        if (v11 > 1902207330)
        {
          if (v11 == 1902207331)
            return result;
          if (v11 != 1902207795)
          {
            v13 = 1902207848;
            goto LABEL_81;
          }
          return 2;
        }
        if (v11 != 1885547315)
        {
          v14 = 1885692723;
          goto LABEL_72;
        }
        return v12;
      }
      if (v11 <= 1885430631)
      {
        if (v11 == 1885430115)
          return result;
        v15 = 1885430579;
LABEL_53:
        if (v11 != v15)
          return 0;
        return 2;
      }
      if (v11 == 1885430632)
        return result;
      v13 = 1885430640;
      goto LABEL_81;
    }
    if (v11 > 2053202738)
    {
      if (v11 > 2053202799)
      {
        if (v11 == 2053202800)
          return result;
        if (v11 == 2053319475)
          return v12;
        v14 = 2053464883;
LABEL_72:
        if (v11 == v14)
          return 3;
        return 0;
      }
      if (v11 == 2053202739)
        return 2;
      v18 = 25448;
      goto LABEL_80;
    }
    if (v11 <= 1902469938)
    {
      if (v11 == 1902207856)
        return result;
      v16 = 1902324531;
      goto LABEL_76;
    }
    if (v11 != 1902469939)
    {
      v18 = 24931;
LABEL_80:
      v13 = v18 | 0x7A610000;
      goto LABEL_81;
    }
    return 3;
  }
  if (v11 > 1667312946)
  {
    if (v11 <= 1667326831)
    {
      if (v11 > 1667326770)
      {
        if (v11 == 1667326771)
          return 2;
        v17 = 25448;
      }
      else
      {
        if (v11 == 1667312947)
          return 2;
        v17 = 24931;
      }
      v13 = v17 | 0x63610000;
      goto LABEL_81;
    }
    if (v11 <= 1667575090)
    {
      if (v11 == 1667326832)
        return result;
      v16 = 1667574579;
LABEL_76:
      if (v11 != v16)
        return 0;
      return v12;
    }
    if (v11 != 1667575091)
    {
      if (v11 != 1700997939)
      {
        v14 = 1700998451;
        goto LABEL_72;
      }
      return v12;
    }
    return 3;
  }
  if (v11 > 1633772388)
  {
    if ((v11 - 1633772389) <= 0xB && ((1 << (v11 - 101)) & 0x80F) != 0)
      return result;
    v15 = 1633889587;
    goto LABEL_53;
  }
  if (v11 == 1633771875)
    return result;
  v13 = 1633772320;
LABEL_81:
  if (v11 != v13)
    return 0;
  return result;
}

+ (BOOL)shouldDeactivateAVAudioSession
{
  return sShouldDeactivateAVAudioSession;
}

+ (void)setShouldDeactivateAVAudioSession:(BOOL)a3
{
  sShouldDeactivateAVAudioSession = a3;
}

+ (void)_playerDidBecomeInactive:(id)a3
{
  uint64_t v3;
  BOOL v4;
  dispatch_time_t v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    v3 = objc_msgSend((id)sActivePlayers, "count");
    objc_msgSend((id)sActivePlayers, "removeObject:", v6);
    if (v3)
    {
      if (objc_msgSend((id)sActivePlayers, "count"))
        v4 = 1;
      else
        v4 = sShouldDeactivateAVAudioSession == 0;
      if (!v4)
      {
        sNeedsAVAudioSessionDeactivation = 1;
        v5 = dispatch_time(0, 1000000000);
        dispatch_after(v5, MEMORY[0x24BDAC9B8], &__block_literal_global_246);
      }
    }
  }

}

void __38__TVPPlayer__playerDidBecomeInactive___block_invoke()
{
  if (sNeedsAVAudioSessionDeactivation == 1)
  {
    sNeedsAVAudioSessionDeactivation = 0;
    dispatch_async((dispatch_queue_t)sAVAudioSessionQueue, &__block_literal_global_247);
  }
}

void __38__TVPPlayer__playerDidBecomeInactive___block_invoke_2()
{
  NSObject *v0;
  void *v1;
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[8];
  id v7;
  uint8_t buf[16];

  v0 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228A4E000, v0, OS_LOG_TYPE_DEFAULT, "Deactivating audio session since no players are active", buf, 2u);
  }
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v1, "setActive:error:", 0, &v7);
  v2 = v7;

  v3 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_228A4E000, v3, OS_LOG_TYPE_DEFAULT, "Done deactivating audio session", v6, 2u);
  }
  if (v2)
  {
    v4 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_ERROR))
      __38__TVPPlayer__playerDidBecomeInactive___block_invoke_2_cold_1((uint64_t)v2, v4, v5);
  }

}

- (TVPPlayer)init
{
  return -[TVPPlayer initWithName:](self, "initWithName:", 0);
}

- (void)dealloc
{
  void *v3;
  TVPStateMachine *stateMachine;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    stateMachine = self->_stateMachine;
    v5 = v3;
    -[TVPStateMachine name](stateMachine, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "%@ deallocated", buf, 0xCu);

  }
  if (!self->_invalidated)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCA98];
    v9 = (void *)MEMORY[0x24BDD17C8];
    -[TVPStateMachine name](self->_stateMachine, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Instance of TVPPlayer with name [%@] was deallocated without being invalidated"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v11, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)TVPPlayer;
  -[TVPPlayer dealloc](&v13, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  TVPStateMachine *stateMachine;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  _QWORD block[5];
  void (**v15)(_QWORD);
  _QWORD v16[5];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!-[TVPPlayer invalidated](self, "invalidated"))
  {
    v3 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      stateMachine = self->_stateMachine;
      v5 = v3;
      -[TVPStateMachine name](stateMachine, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "%@ invalidated", buf, 0xCu);

    }
    -[TVPPlayer setInvalidated:](self, "setInvalidated:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:", self);

    v8 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __23__TVPPlayer_invalidate__block_invoke;
    v16[3] = &unk_24F15BEF8;
    v16[4] = self;
    v9 = (void (**)(_QWORD))MEMORY[0x22E2BA4B0](v16);
    -[TVPPlayer stateMachine](self, "stateMachine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "eventCount");

    if (v11)
    {
      v12 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v12, OS_LOG_TYPE_DEFAULT, "During invalidation, deferring cleanup to give stack a chance to unwind", buf, 2u);
      }
      -[TVPPlayer stateMachine](self, "stateMachine");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShouldAcceptEvents:", 0);

      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __23__TVPPlayer_invalidate__block_invoke_277;
      block[3] = &unk_24F15C3E8;
      block[4] = self;
      v15 = v9;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
    else
    {
      v9[2](v9);
    }

  }
}

void __23__TVPPlayer_invalidate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("Being invalidated key");
  v6[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:withContext:userInfo:", CFSTR("Set playlist"), 0, v3);

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterHandlers");

}

uint64_t __23__TVPPlayer_invalidate__block_invoke_277(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShouldAcceptEvents:", 1);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)setCurrentMediaItem:(id)a3
{
  id v4;
  TVPPlaylist *v5;
  void *v6;
  TVPPlaylist *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a3;
    v5 = [TVPPlaylist alloc];
    v8[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[TVPPlaylist initWithMediaItems:index:isCollection:](v5, "initWithMediaItems:index:isCollection:", v6, 0, 0);
  }
  else
  {
    v7 = 0;
  }
  -[TVPPlayer setPlaylist:](self, "setPlaylist:", v7);

}

- (BOOL)currentMediaItemPreparedForLoading
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[TVPPlayer currentMediaItemLoader](self, "currentMediaItemLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqual:", 0x24F163DB8) & 1) != 0 || (objc_msgSend(v4, "isEqual:", 0x24F163DD8) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[TVPPlayer currentMediaItemLoader](self, "currentMediaItemLoader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "AVAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 != 0;

  }
  return v5;
}

- (BOOL)currentMediaItemHasVideoContent
{
  return self->_currentMediaItemHasVideoContent;
}

- (BOOL)currentMediaItemIsStreaming
{
  return self->_currentMediaItemIsStreaming;
}

- (CGSize)currentMediaItemPresentationSize
{
  double width;
  double height;
  CGSize result;

  width = self->_currentMediaItemPresentationSize.width;
  height = self->_currentMediaItemPresentationSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)currentMediaItemHasDates
{
  return self->_currentMediaItemHasDates;
}

- (void)changeMediaInDirection:(int64_t)a3
{
  -[TVPPlayer changeMediaInDirection:reason:ignoreDelegate:](self, "changeMediaInDirection:reason:ignoreDelegate:", a3, CFSTR("changeMediaInDirection: called"), 0);
}

- (void)changeMediaInDirection:(int64_t)a3 reason:(id)a4
{
  -[TVPPlayer changeMediaInDirection:reason:ignoreDelegate:](self, "changeMediaInDirection:reason:ignoreDelegate:", a3, a4, 0);
}

- (void)changeMediaInDirection:(int64_t)a3 reason:(id)a4 ignoreDelegate:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  TVPAsyncPlayerDelegateOperation *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25[2];
  id location;
  id buf;
  const __CFString *v28;
  id v29;
  const __CFString *v30;
  id v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (a5)
    goto LABEL_9;
  -[TVPPlayer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TVPPlayer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "player:shouldChangeMediaInDirection:", self, a3);

    if ((v11 & 1) == 0)
      goto LABEL_24;
    goto LABEL_9;
  }
  -[TVPPlayer asyncDelegate](self, "asyncDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_9:
    -[TVPPlayer playlist](self, "playlist");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a3)
    {
      if (v8)
      {
        v28 = CFSTR("TVPPlaybackCurrentMediaItemChangeReasonKey");
        v29 = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      objc_msgSend(v17, "changeMedia:withContext:", 1, v18);
    }
    else if (objc_msgSend(v16, "endAction") == 1 && (objc_msgSend(v17, "moreItemsAvailable:", 0) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "postNotificationName:object:", CFSTR("TVPPlaybackPlaylistDidFinishNotification"), self);

      v20 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_228A4E000, v20, OS_LOG_TYPE_DEFAULT, "Sending pause event on changeMediaInDirection because playlist end action is TVPPlaylistEndActionPause.", (uint8_t *)&buf, 2u);
      }
      -[TVPPlayer stateMachine](self, "stateMachine");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("Ignore delegate key");
      v33[0] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postEvent:withContext:userInfo:", CFSTR("Pause"), 0, v21);

    }
    else
    {
      if (v8)
      {
        v30 = CFSTR("TVPPlaybackCurrentMediaItemChangeReasonKey");
        v31 = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = 0;
      }
      objc_msgSend(v17, "changeMedia:withContext:", 0, v18);
    }

    goto LABEL_24;
  }
  v13 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_228A4E000, v13, OS_LOG_TYPE_DEFAULT, "Async delegate: shouldChangeMediaInDirection returning NO until delegate is consulted", (uint8_t *)&buf, 2u);
  }
  objc_initWeak(&buf, self);
  v14 = objc_alloc_init(TVPAsyncPlayerDelegateOperation);
  objc_initWeak(&location, v14);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __58__TVPPlayer_changeMediaInDirection_reason_ignoreDelegate___block_invoke;
  v22[3] = &unk_24F15C460;
  objc_copyWeak(&v24, &buf);
  v25[1] = (id)a3;
  objc_copyWeak(v25, &location);
  v23 = v8;
  -[TVPAsyncPlayerDelegateOperation setBlock:](v14, "setBlock:", v22);
  v15 = objc_loadWeakRetained(&buf);
  objc_msgSend(v15, "_enqueueAsyncDelegateOperation:", v14);

  objc_destroyWeak(v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  objc_destroyWeak(&buf);
LABEL_24:

}

void __58__TVPPlayer_changeMediaInDirection_reason_ignoreDelegate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10[2];
  uint8_t buf[16];

  v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Async delegate: shouldChangeMediaInDirection calling delegate", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "asyncDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 56);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__TVPPlayer_changeMediaInDirection_reason_ignoreDelegate___block_invoke_284;
  v7[3] = &unk_24F15C438;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  objc_copyWeak(v10, (id *)(a1 + 40));
  v10[1] = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "player:shouldChangeMediaInDirection:completion:", v5, v6, v7);

  objc_destroyWeak(v10);
  objc_destroyWeak(&v9);
}

void __58__TVPPlayer_changeMediaInDirection_reason_ignoreDelegate___block_invoke_284(id *a1, int a2)
{
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17[2];
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (!WeakRetained)
    goto LABEL_10;
  v5 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v5, "asyncDelegateOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", WeakRetained);

  if (v8)
  {
    v9 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("NO");
      if (a2)
        v10 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Async delegate: shouldChangeMediaInDirection response: %@", buf, 0xCu);
    }
    v11 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v11, "asyncDelegateOperations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectAtIndex:", 0);

    if (a2)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __58__TVPPlayer_changeMediaInDirection_reason_ignoreDelegate___block_invoke_289;
      block[3] = &unk_24F15C410;
      objc_copyWeak(v17, a1 + 6);
      v17[1] = a1[7];
      v16 = a1[4];
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      objc_destroyWeak(v17);
    }
    v13 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v13, "_processNextAsyncDelegateOperation");

  }
  else
  {
LABEL_10:
    v14 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v14, OS_LOG_TYPE_DEFAULT, "Async delegate: ignoring shouldChangeMediaInDirection response", buf, 2u);
    }
  }

}

void __58__TVPPlayer_changeMediaInDirection_reason_ignoreDelegate___block_invoke_289(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "changeMediaInDirection:reason:ignoreDelegate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), 1);

}

- (void)changeToMediaAtIndex:(unint64_t)a3 reason:(id)a4
{
  -[TVPPlayer changeToMediaAtIndex:reason:ignoreDelegate:](self, "changeToMediaAtIndex:reason:ignoreDelegate:", a3, a4, 0);
}

- (void)changeToMediaAtIndex:(unint64_t)a3 reason:(id)a4 ignoreDelegate:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  NSObject *v13;
  TVPAsyncPlayerDelegateOperation *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21[2];
  id location;
  id buf;
  const __CFString *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if (a5)
    goto LABEL_9;
  -[TVPPlayer delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TVPPlayer delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "player:shouldChangeToMediaAtIndex:", self, a3);

    if ((v11 & 1) == 0)
      goto LABEL_13;
    goto LABEL_9;
  }
  -[TVPPlayer asyncDelegate](self, "asyncDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_9:
    if (v8)
    {
      v24 = CFSTR("TVPPlaybackCurrentMediaItemChangeReasonKey");
      v25[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    -[TVPPlayer playlist](self, "playlist");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "changeToActiveListIndex:withContext:", a3, v16);

    goto LABEL_13;
  }
  v13 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_228A4E000, v13, OS_LOG_TYPE_DEFAULT, "Async delegate: changeToMediaAtIndex returning NO until delegate is consulted", (uint8_t *)&buf, 2u);
  }
  objc_initWeak(&buf, self);
  v14 = objc_alloc_init(TVPAsyncPlayerDelegateOperation);
  objc_initWeak(&location, v14);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __56__TVPPlayer_changeToMediaAtIndex_reason_ignoreDelegate___block_invoke;
  v18[3] = &unk_24F15C460;
  objc_copyWeak(&v20, &buf);
  v21[1] = (id)a3;
  objc_copyWeak(v21, &location);
  v19 = v8;
  -[TVPAsyncPlayerDelegateOperation setBlock:](v14, "setBlock:", v18);
  v15 = objc_loadWeakRetained(&buf);
  objc_msgSend(v15, "_enqueueAsyncDelegateOperation:", v14);

  objc_destroyWeak(v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  objc_destroyWeak(&buf);
LABEL_13:

}

void __56__TVPPlayer_changeToMediaAtIndex_reason_ignoreDelegate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10[2];
  uint8_t buf[16];

  v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Async delegate: shouldChangeToMediaAtIndex calling delegate", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "asyncDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = *(_QWORD *)(a1 + 56);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__TVPPlayer_changeToMediaAtIndex_reason_ignoreDelegate___block_invoke_291;
  v7[3] = &unk_24F15C438;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  objc_copyWeak(v10, (id *)(a1 + 40));
  v10[1] = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "player:shouldChangeToMediaAtIndex:completion:", v5, v6, v7);

  objc_destroyWeak(v10);
  objc_destroyWeak(&v9);
}

void __56__TVPPlayer_changeToMediaAtIndex_reason_ignoreDelegate___block_invoke_291(id *a1, int a2)
{
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17[2];
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (!WeakRetained)
    goto LABEL_10;
  v5 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v5, "asyncDelegateOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", WeakRetained);

  if (v8)
  {
    v9 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("NO");
      if (a2)
        v10 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Async delegate: shouldChangeToMediaAtIndex response: %@", buf, 0xCu);
    }
    v11 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v11, "asyncDelegateOperations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectAtIndex:", 0);

    if (a2)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __56__TVPPlayer_changeToMediaAtIndex_reason_ignoreDelegate___block_invoke_292;
      block[3] = &unk_24F15C410;
      objc_copyWeak(v17, a1 + 6);
      v17[1] = a1[7];
      v16 = a1[4];
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      objc_destroyWeak(v17);
    }
    v13 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v13, "_processNextAsyncDelegateOperation");

  }
  else
  {
LABEL_10:
    v14 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v14, OS_LOG_TYPE_DEFAULT, "Async delegate: ignoring shouldChangeToMediaAtIndex response", buf, 2u);
    }
  }

}

void __56__TVPPlayer_changeToMediaAtIndex_reason_ignoreDelegate___block_invoke_292(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "changeToMediaAtIndex:reason:ignoreDelegate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), 1);

}

- (void)setErrorBehavior:(int64_t)a3
{
  if (self->_errorBehavior != a3)
  {
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("errorBehavior"));
    self->_errorBehavior = a3;
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("errorBehavior"));
  }
}

- (int64_t)errorBehavior
{
  return self->_errorBehavior;
}

- (void)setInteractive:(BOOL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  CMTime v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CMTime v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->_interactive != a3)
  {
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("interactive"));
    self->_interactive = a3;
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("interactive"));
    memset(&v17, 0, sizeof(v17));
    if (-[TVPPlayer interactive](self, "interactive"))
      CMTimeMakeWithSeconds(&v17, -1.0, 1000000);
    else
      v17 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          v12 = v17;
          objc_msgSend(v11, "setMaximumTrailingBufferDuration:", &v12);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v8);
    }

  }
}

- (double)rate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  float v15;

  -[TVPPlayer stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Scanning using external images")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("Scanning using external images driven by AVKit")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("Waiting for AVKit seek after finishing external image scanning")))
  {
    -[TVPPlayer externalImagePlayer](self, "externalImagePlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v6 = v5;
    objc_msgSend(v5, "rate");
    v8 = v7;
    goto LABEL_6;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Scrubbing using progressive jumping")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("Scrubbing using progressive jumping waiting for seek")))
  {
    -[TVPPlayer progressiveJumpingScrubber](self, "progressiveJumpingScrubber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[TVPPlayer state](self, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVPPlaybackState playing](TVPPlaybackState, "playing");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v10 == (void *)v11)
  {

  }
  else
  {
    v12 = (void *)v11;
    -[TVPPlayer state](self, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[TVPPlaybackState scanning](TVPPlaybackState, "scanning");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0.0;
    if (v13 != v14)
      goto LABEL_7;
  }
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rate");
  v8 = v15;
LABEL_6:

LABEL_7:
  return v8;
}

- (void)setRateUsedForPlayback:(double)a3
{
  id v5;

  if (self->_rateUsedForPlayback != a3)
  {
    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("rateUsedForPlayback"));
    self->_rateUsedForPlayback = a3;
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("rateUsedForPlayback"));
    -[TVPPlayer stateMachine](self, "stateMachine");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postEvent:", CFSTR("Rate used for playback did change"));

  }
}

- (double)rateUsedForPlayback
{
  return self->_rateUsedForPlayback;
}

- (void)continueLoadingCurrentItem
{
  id v2;

  -[TVPPlayer stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Continue loading current item"));

}

- (void)play
{
  id v2;

  -[TVPPlayer stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Play"));

}

- (void)playIgnoringDelegate:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v3 = a3;
  v8[1] = *MEMORY[0x24BDAC8D0];
  -[TVPPlayer stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("Ignore delegate key");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Play"), 0, v6);

}

- (void)playWithVolumeRampDuration:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[TVPPlayer stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("Volume ramp duration key");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Play"), 0, v6);

}

- (void)playWithAVKitCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v7 = CFSTR("Play completion key");
    v4 = (void *)objc_msgSend(a3, "copy");
    v8[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  -[TVPPlayer stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Play"), 0, v5);

}

- (void)pauseWithVolumeRampDuration:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[TVPPlayer stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("Volume ramp duration key");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Pause"), 0, v6);

}

- (void)pauseIgnoringDelegate:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v3 = a3;
  v8[1] = *MEMORY[0x24BDAC8D0];
  -[TVPPlayer stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("Ignore delegate key");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Pause"), 0, v6);

}

- (void)pauseWithAVKitCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v7 = CFSTR("Play completion key");
    v4 = (void *)objc_msgSend(a3, "copy");
    v8[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  -[TVPPlayer stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEvent:withContext:userInfo:", CFSTR("Pause"), 0, v5);

}

- (void)togglePlayPause
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;

  -[TVPPlayer state](self, "state");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  +[TVPPlaybackState paused](TVPPlaybackState, "paused");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v3)
  {
    -[TVPPlayer stateMachine](self, "stateMachine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Play");
LABEL_11:
    objc_msgSend(v10, "postEvent:", v12);

    v7 = v13;
    goto LABEL_12;
  }
  +[TVPPlaybackState playing](TVPPlaybackState, "playing");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 == v4)
  {

    goto LABEL_10;
  }
  +[TVPPlaybackState loading](TVPPlaybackState, "loading");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v5)
  {
LABEL_10:
    -[TVPPlayer stateMachine](self, "stateMachine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("Pause");
    goto LABEL_11;
  }
  +[TVPPlaybackState scanning](TVPPlaybackState, "scanning");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v13;
  if (v13 == v6)
  {
    -[TVPPlayer rate](self, "rate");
    v9 = v8;
    -[TVPPlayer stateMachine](self, "stateMachine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9 <= -1.0 || v9 >= 1.0)
      v12 = CFSTR("Play");
    else
      v12 = CFSTR("Pause");
    goto LABEL_11;
  }
LABEL_12:

}

- (void)scanWithRate:(double)a3
{
  -[TVPPlayer scanWithRate:withAVKitCompletion:](self, "scanWithRate:withAVKitCompletion:", 0, a3);
}

- (void)scanWithRate:(double)a3 withAVKitCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v15 = CFSTR("Rate key");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (v6)
  {
    -[TVPPlayer state](self, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[TVPPlaybackState paused](TVPPlaybackState, "paused");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v11)
      +[TVPPlaybackState paused](TVPPlaybackState, "paused");
    else
      +[TVPPlaybackState playing](TVPPlaybackState, "playing");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer setPostAVKitScanningState:](self, "setPostAVKitScanningState:", v12);

    v13 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("Play completion key"));

  }
  -[TVPPlayer stateMachine](self, "stateMachine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postEvent:withContext:userInfo:", CFSTR("Scan with rate"), 0, v9);

}

- (void)stop
{
  id v2;

  -[TVPPlayer stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Stop"));

}

- (void)stopWithVolumeRampDuration:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[TVPPlayer stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("Volume ramp duration key");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Stop"), 0, v6);

}

- (void)setElapsedTime:(double)a3
{
  __int128 v3;
  uint64_t v4;

  v3 = *MEMORY[0x24BDC0D88];
  v4 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  -[TVPPlayer setElapsedTime:seekPrecision:ignoreDelegate:withAVKitCompletion:](self, "setElapsedTime:seekPrecision:ignoreDelegate:withAVKitCompletion:", &v3, 0, 0, a3);
}

- (void)setElapsedTime:(double)a3 precise:(BOOL)a4
{
  __int128 *v4;
  __int128 v5;
  uint64_t v6;

  if (a4)
    v4 = (__int128 *)MEMORY[0x24BDC0D88];
  else
    v4 = (__int128 *)MEMORY[0x24BDC0D58];
  v5 = *v4;
  v6 = *((_QWORD *)v4 + 2);
  -[TVPPlayer setElapsedTime:seekPrecision:ignoreDelegate:withAVKitCompletion:](self, "setElapsedTime:seekPrecision:ignoreDelegate:withAVKitCompletion:", &v5, 0, 0, a3);
}

- (void)setElapsedTime:(double)a3 seekPrecision:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4;

  v4 = *a4;
  -[TVPPlayer setElapsedTime:seekPrecision:ignoreDelegate:withAVKitCompletion:](self, "setElapsedTime:seekPrecision:ignoreDelegate:withAVKitCompletion:", &v4, 0, 0, a3);
}

- (void)setElapsedTime:(double)a3 seekPrecision:(id *)a4 ignoreDelegate:(BOOL)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a4;
  -[TVPPlayer setElapsedTime:seekPrecision:ignoreDelegate:withAVKitCompletion:](self, "setElapsedTime:seekPrecision:ignoreDelegate:withAVKitCompletion:", &v5, a5, 0, a3);
}

- (void)setElapsedTime:(double)a3 orPlaybackDate:(id)a4 withAVKitCompletion:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a4)
  {
    -[TVPPlayer setPlaybackDate:withAVKitCompletion:](self, "setPlaybackDate:withAVKitCompletion:", a4, a5, a3);
  }
  else
  {
    v9 = v5;
    v10 = v6;
    v7 = *MEMORY[0x24BDC0D88];
    v8 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    -[TVPPlayer setElapsedTime:seekPrecision:ignoreDelegate:withAVKitCompletion:](self, "setElapsedTime:seekPrecision:ignoreDelegate:withAVKitCompletion:", &v7, 0, a5, a3);
  }
}

- (void)setElapsedTime:(double)a3 seekPrecision:(id *)a4 ignoreDelegate:(BOOL)a5 withAVKitCompletion:(id)a6
{
  _BOOL8 v6;
  id v10;
  double v11;
  void *v12;
  CMTimeEpoch epoch;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  CMTime v23;
  CMTime lhs;
  CMTime v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTime v29;
  _QWORD v30[3];
  _QWORD v31[4];

  v6 = a5;
  v31[3] = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  memset(&v29, 0, sizeof(v29));
  CMTimeMakeWithSeconds(&v29, a3, 1000000);
  if (a3 == -1000000000.0)
  {
    -[TVPPlayer duration](self, "duration", -1000000000.0);
    if (v11 == 3.40282347e38)
    {
      v27 = 0u;
      v28 = 0u;
      v26 = 0u;
      -[TVPPlayer cachedSeekableTimeRanges](self, "cachedSeekableTimeRanges");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:](TVPTimeRange, "forwardmostCMTimeRangeInCMTimeRanges:", v12);

    }
    else
    {
      -[TVPPlayer _currentMediaItemReversePlaybackEndTime](self, "_currentMediaItemReversePlaybackEndTime");
    }
    *(_OWORD *)&v29.value = v26;
    epoch = v27;
    goto LABEL_8;
  }
  if (a3 == INFINITY)
  {
    *(_OWORD *)&v29.value = *MEMORY[0x24BDC0D58];
    epoch = *(_QWORD *)(MEMORY[0x24BDC0D58] + 16);
LABEL_8:
    v29.epoch = epoch;
    goto LABEL_9;
  }
  -[TVPPlayer currentMediaItem](self, "currentMediaItem", INFINITY);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "hasTrait:", CFSTR("TVPMediaItemTraitIsScene"));

  if (!v10 && v22)
  {
    v26 = 0uLL;
    *(_QWORD *)&v27 = 0;
    -[TVPPlayer _currentMediaItemReversePlaybackEndTime](self, "_currentMediaItemReversePlaybackEndTime");
    *(_OWORD *)&lhs.value = v26;
    lhs.epoch = v27;
    v23 = v29;
    CMTimeAdd(&v25, &lhs, &v23);
    *(_OWORD *)&v29.value = *(_OWORD *)&v25.value;
    epoch = v25.epoch;
    goto LABEL_8;
  }
LABEL_9:
  v26 = *(_OWORD *)&v29.value;
  *(_QWORD *)&v27 = v29.epoch;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v14;
  v30[0] = CFSTR("Elapsed CMTime key");
  v30[1] = CFSTR("Seek precision key");
  v26 = *(_OWORD *)&a4->var0;
  *(_QWORD *)&v27 = a4->var3;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v15;
  v30[2] = CFSTR("Ignore delegate key");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  if (v10)
  {
    v19 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("Play completion key"));

  }
  -[TVPPlayer stateMachine](self, "stateMachine");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "postEvent:withContext:userInfo:", CFSTR("Set elapsed time or date"), 0, v18);

}

- (double)cachedElapsedTime
{
  double result;
  CMTime v3[2];

  memset(&v3[1], 0, sizeof(CMTime));
  -[TVPPlayer cachedElapsedCMTime](self, "cachedElapsedCMTime");
  result = 0.0;
  if ((unsigned __int128)0 >> 96 == 1)
  {
    v3[0] = v3[1];
    return CMTimeGetSeconds(v3);
  }
  return result;
}

- (void)setPlaybackDate:(id)a3
{
  -[TVPPlayer setPlaybackDate:withAVKitCompletion:](self, "setPlaybackDate:withAVKitCompletion:", a3, 0);
}

- (void)setPlaybackDate:(id)a3 withAVKitCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a3)
  {
    v13 = CFSTR("Playback date key");
    v14[0] = a3;
    v7 = (void *)MEMORY[0x24BDBCE70];
    v8 = a3;
    objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    if (v6)
    {
      v11 = (void *)objc_msgSend(v6, "copy");
      objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("Play completion key"));

    }
    -[TVPPlayer stateMachine](self, "stateMachine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "postEvent:withContext:userInfo:", CFSTR("Set elapsed time or date"), 0, v10);

  }
}

- (NSDate)playbackDate
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;

  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataTreatAsTimeBasedNotDateBased"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if ((v5 & 1) == 0)
  {
    -[TVPPlayer stateMachine](self, "stateMachine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVPPlayer _statesThatReturnStartTime](self, "_statesThatReturnStartTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", v8);

    if (v10)
    {
      -[TVPPlayer startDate](self, "startDate");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v6 = (void *)v11;
LABEL_18:

      return (NSDate *)v6;
    }
    -[TVPPlayer _statesThatReturnAVPlayerTime](self, "_statesThatReturnAVPlayerTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v8);

    if (v13)
    {
      -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "status"))
      {
        v6 = 0;
        goto LABEL_17;
      }
      -[TVPPlayer _currentDateFromPlayerItem:](self, "_currentDateFromPlayerItem:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[TVPPlayer _statesThatReturnSeekTime](self, "_statesThatReturnSeekTime");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "containsObject:", v8);

      if (v17)
      {
        -[TVPPlayer dateBeingSeekedTo](self, "dateBeingSeekedTo");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Scanning using external images")) & 1) == 0
        && (objc_msgSend(v8, "isEqualToString:", CFSTR("Scanning using external images driven by AVKit")) & 1) == 0
        && !objc_msgSend(v8, "isEqualToString:", CFSTR("Waiting for AVKit seek after finishing external image scanning")))
      {
        v6 = 0;
        goto LABEL_18;
      }
      -[TVPPlayer externalImagePlayer](self, "externalImagePlayer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "playbackDate");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v15;
LABEL_17:

    goto LABEL_18;
  }
  v6 = 0;
  return (NSDate *)v6;
}

- (void)avKitSeekDidComplete
{
  id v2;

  -[TVPPlayer stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Seek completed"));

}

- (void)avKitDidFinishScanning
{
  void *v3;
  void *v4;

  -[TVPPlayer postAVKitScanningState](self, "postAVKitScanningState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVPPlaybackState paused](TVPPlaybackState, "paused");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
    -[TVPPlayer pauseWithAVKitCompletion:](self, "pauseWithAVKitCompletion:", &__block_literal_global_296);
  else
    -[TVPPlayer playWithAVKitCompletion:](self, "playWithAVKitCompletion:", &__block_literal_global_298);
}

- (id)addElapsedTimeObserver:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD1880];
    v5 = a3;
    objc_msgSend(v4, "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer elapsedTimeObserverBlocks](self, "elapsedTimeObserverBlocks");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "copy");

    objc_msgSend(v7, "setObject:forKey:", v8, v6);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)removeElapsedTimeObserverWithToken:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[TVPPlayer elapsedTimeObserverBlocks](self, "elapsedTimeObserverBlocks");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v4);

  }
}

- (id)addBoundaryTimeObserverForTimes:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  TVPBoundaryTimeObserverInfo *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  void *v27;
  Float64 v28;
  void *v29;
  void *v30;
  void *v31;
  TVPBoundaryTimeObserverInfo *v33;
  TVPPlayer *v34;
  id v35;
  CMTime v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  CMTime time;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_msgSend(v6, "count");
    v9 = 0;
    if (v7 && v8)
    {
      v10 = objc_alloc_init(TVPBoundaryTimeObserverInfo);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPPlayer currentMediaItem](self, "currentMediaItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "hasTrait:", CFSTR("TVPMediaItemTraitIsScene"));

      v34 = self;
      v33 = v10;
      if (v13)
      {
        v14 = (void *)MEMORY[0x24BDD16E0];
        -[TVPPlayer _currentMediaItemReversePlaybackEndTime](self, "_currentMediaItemReversePlaybackEndTime");
        objc_msgSend(v14, "numberWithDouble:", CMTimeGetSeconds(&time));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v35 = v6;
      v16 = v6;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v38 != v19)
              objc_enumerationMutation(v16);
            v21 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * i);
            if (v15)
            {
              v22 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v15, "doubleValue");
              v24 = v23;
              objc_msgSend(v21, "doubleValue");
              objc_msgSend(v22, "numberWithDouble:", v24 + v25);
              v26 = objc_claimAutoreleasedReturnValue();

              v21 = (id)v26;
            }
            v27 = (void *)MEMORY[0x24BDD1968];
            objc_msgSend(v21, "doubleValue");
            CMTimeMakeWithSeconds(&v36, v28, 1000000);
            objc_msgSend(v27, "valueWithCMTime:", &v36);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v29);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v18);
      }

      -[TVPBoundaryTimeObserverInfo setTimes:](v33, "setTimes:", v11);
      -[TVPBoundaryTimeObserverInfo setHandler:](v33, "setHandler:", v7);
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPPlayer boundaryTimeObserverInfos](v34, "boundaryTimeObserverInfos");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setObject:forKey:", v33, v9);

      -[TVPPlayer AVQueuePlayer](v34, "AVQueuePlayer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPPlayer _addBoundaryTimeObserversToAVQueuePlayer:](v34, "_addBoundaryTimeObserversToAVQueuePlayer:", v31);

      v6 = v35;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)addBoundaryTimeObserverForDates:(id)a3 withHandler:(id)a4
{
  return 0;
}

- (void)removeBoundaryTimeObserverWithToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    -[TVPPlayer boundaryTimeObserverInfos](self, "boundaryTimeObserverInfos");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tokenFromAVPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeTimeObserver:", v7);

    }
    objc_msgSend(v5, "removeObjectForKey:", v9);

    v4 = v9;
  }

}

- (BOOL)isLive
{
  return self->_isLive;
}

- (BOOL)muted
{
  void *v3;
  void *v4;
  char v5;

  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return self->_muted;
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMuted");

  return v5;
}

- (BOOL)allowsExternalPlayback
{
  void *v3;
  void *v4;
  char v5;

  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return self->_allowsExternalPlayback;
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowsExternalPlayback");

  return v5;
}

- (void)setVolume:(float)a3
{
  void *v5;
  double v6;

  -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("volume"));
  self->_volume = a3;
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = self->_volume;
  objc_msgSend(v5, "setVolume:", v6);

  -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("volume"));
}

- (float)volume
{
  void *v3;
  void *v4;
  float v5;
  float v6;

  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return self->_volume;
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "volume");
  v6 = v5;

  return v6;
}

- (NSArray)chapterCollections
{
  return self->_chapterCollections;
}

- (TVPChapter)currentChapter
{
  return self->_currentChapter;
}

void __41__TVPPlayer_setCurrentChapterCollection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  v5 = WeakRetained;
  objc_msgSend(v5, "elapsedTime");
  objc_msgSend(v3, "chapterForTime:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentChapter:", v4);

}

- (TVPChapterCollection)currentChapterCollection
{
  return self->_currentChapterCollection;
}

- (void)skipToNextChapterInDirection:(int64_t)a3
{
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  BOOL v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  BOOL v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  TVPPlayer *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[TVPPlayer elapsedTime](self, "elapsedTime");
  v6 = v5;
  -[TVPPlayer playbackDate](self, "playbackDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[TVPPlayer currentChapterCollection](self, "currentChapterCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chapters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (!v10)
  {
    v12 = 0;
LABEL_38:

    goto LABEL_39;
  }
  v11 = v10;
  v31 = self;
  v12 = 0;
  if (a3 == 1)
    v13 = -1.79769313e308;
  else
    v13 = 1.79769313e308;
  v14 = *(_QWORD *)v33;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v33 != v14)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      objc_msgSend(v16, "dateRange");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        v18 = v7 == 0;
      else
        v18 = 1;
      if (v18)
      {
        objc_msgSend(v16, "timeRange");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "startTime");
        v23 = v19 - v6;
      }
      else
      {
        objc_msgSend(v16, "dateRange");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "startDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSinceDate:", v7);
        v23 = v22;

      }
      v24 = -v23;
      if (v23 >= 0.0)
        v24 = v23;
      if (v24 > 2.0)
      {
        if (!a3 && (v23 > 0.0 ? (v25 = v23 < v13) : (v25 = 0), v25)
          || a3 == 1 && (v23 < 0.0 ? (v26 = v23 <= v13) : (v26 = 1), !v26))
        {
          v27 = v16;

          v13 = v23;
          v12 = v27;
        }
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  }
  while (v11);

  if (v12)
  {
    objc_msgSend(v12, "timeRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateRange");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      objc_msgSend(v28, "startDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPPlayer setPlaybackDate:](v31, "setPlaybackDate:", v30);

    }
    else if (v9)
    {
      objc_msgSend(v9, "startTime");
      -[TVPPlayer setElapsedTime:](v31, "setElapsedTime:");
    }

    goto LABEL_38;
  }
LABEL_39:

}

- (TVPInterstitial)currentInterstitial
{
  return self->_currentInterstitial;
}

void __46__TVPPlayer_setCurrentInterstitialCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("Due to time jump key");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Interstitial boundary crossed"), 0, v6);

}

- (TVPInterstitialCollection)currentInterstitialCollection
{
  return self->_currentInterstitialCollection;
}

- (NSArray)audioOptions
{
  NSArray *audioOptions;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  TVPAudioOption *v14;
  TVPAudioOption *v15;
  NSArray *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  audioOptions = self->_audioOptions;
  if (!audioOptions)
  {
    -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "status") == 1)
    {
      objc_msgSend(v4, "asset");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "tvp_sortedAudioAVMediaSelectionOptions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
            v14 = [TVPAudioOption alloc];
            v15 = -[TVPAudioOption initWithOption:](v14, "initWithOption:", v13, (_QWORD)v18);
            -[NSArray addObject:](v7, "addObject:", v15);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v10);
      }

      v16 = self->_audioOptions;
      self->_audioOptions = v7;

    }
    audioOptions = self->_audioOptions;
  }
  return audioOptions;
}

- (void)setSelectedAudioOption:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "avMediaSelectionOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x24BDB1C90]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("selectedAudioOption"));
  if (v5)
    objc_msgSend(v8, "selectMediaOption:inMediaSelectionGroup:", v5, v7);
  else
    objc_msgSend(v8, "selectMediaOptionAutomaticallyInMediaSelectionGroup:", v7);
  -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("selectedAudioOption"));

}

- (TVPAudioOption)selectedAudioOption
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "status") == 1)
  {
    objc_msgSend(v4, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x24BDB1C90]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "currentMediaSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedMediaOptionInMediaSelectionGroup:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[TVPPlayer audioOptions](self, "audioOptions", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v13, "avMediaSelectionOption");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqual:", v8);

          if (v15)
          {
            v10 = v13;
            goto LABEL_14;
          }
        }
        v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v10 = 0;
  }

  return (TVPAudioOption *)v10;
}

- (NSArray)subtitleOptions
{
  NSArray *subtitleOptions;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  TVPSubtitleOption *v17;
  TVPSubtitleOption *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSArray *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  subtitleOptions = self->_subtitleOptions;
  if (!subtitleOptions)
  {
    -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "status") == 1)
    {
      objc_msgSend(v5, "asset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tvp_sortedSubtitleAVMediaSelectionOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      +[TVPSubtitleOption offSubtitleOption](TVPSubtitleOption, "offSubtitleOption");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray addObject:](v8, "addObject:", v9);

      if (objc_msgSend(v7, "count"))
      {
        +[TVPSubtitleOption autoSubtitleOption](TVPSubtitleOption, "autoSubtitleOption");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v8, "addObject:", v10);

        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v11 = v7;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v25;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v25 != v14)
                objc_enumerationMutation(v11);
              v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v15);
              v17 = [TVPSubtitleOption alloc];
              v18 = -[TVPSubtitleOption initWithAVMediaSelectionOption:](v17, "initWithAVMediaSelectionOption:", v16, (_QWORD)v24);
              -[NSArray addObject:](v8, "addObject:", v18);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v13);
        }

      }
      -[TVPPlayer delegate](self, "delegate", (_QWORD)v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v19, "player:filteredSubtitleOptionsFromOptions:", self, v8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSArray isEqual:](v8, "isEqual:", v20) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v20);
          v21 = objc_claimAutoreleasedReturnValue();

          -[TVPPlayer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateSelectedSubtitleForFilteredOptions_, v20, 0.0);
          v8 = (NSArray *)v21;
        }

      }
      v22 = self->_subtitleOptions;
      self->_subtitleOptions = v8;

    }
    subtitleOptions = self->_subtitleOptions;
  }
  return subtitleOptions;
}

- (void)setSelectedSubtitleOption:(id)a3
{
  -[TVPPlayer _setSelectedSubtitleOption:userOverridesSystemSubtitleSettings:](self, "_setSelectedSubtitleOption:userOverridesSystemSubtitleSettings:", a3, 1);
}

- (TVPSubtitleOption)selectedSubtitleOption
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MACaptionAppearanceDisplayType DisplayType;
  TVPAutoSubtitleOption *v10;
  void *v11;
  void *v12;
  int v13;
  TVPAutoSubtitleOption *v14;
  TVPAutoSubtitleOption *v15;
  __objc2_class *v16;

  -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "status") == 1)
  {
    objc_msgSend(v4, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x24BDB1CD8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "currentMediaSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedMediaOptionInMediaSelectionGroup:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    DisplayType = MACaptionAppearanceGetDisplayType(kMACaptionAppearanceDomainUser);
    v10 = -[TVPSubtitleOption initWithAVMediaSelectionOption:]([TVPAutoSubtitleOption alloc], "initWithAVMediaSelectionOption:", v8);
    -[TVPPlayer temporarySubtitleOverrideType](self, "temporarySubtitleOverrideType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 || DisplayType != kMACaptionAppearanceDisplayTypeAutomatic)
    {

    }
    else
    {
      -[TVPPlayer subtitleOptions](self, "subtitleOptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "containsObject:", v10);

      if (v13)
      {
        v14 = v10;
LABEL_15:
        v15 = v14;

        goto LABEL_16;
      }
    }
    if (v8
      && (!objc_msgSend(v8, "hasMediaCharacteristic:", *MEMORY[0x24BDB1CA0])
       || (objc_msgSend(v8, "hasMediaCharacteristic:", *MEMORY[0x24BDB1CC0]) & 1) != 0))
    {
      v16 = TVPSubtitleOption;
    }
    else
    {
      v16 = TVPOffSubtitleOption;
    }
    v14 = (TVPAutoSubtitleOption *)objc_msgSend([v16 alloc], "initWithAVMediaSelectionOption:", v8);
    goto LABEL_15;
  }
  v15 = 0;
LABEL_16:

  return (TVPSubtitleOption *)v15;
}

- (id)selectedSubtitleOptionWithNoOffOrAutoOption
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TVPSubtitleOption *v8;

  -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "status") == 1)
  {
    objc_msgSend(v3, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x24BDB1CD8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "currentMediaSelection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedMediaOptionInMediaSelectionGroup:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[TVPSubtitleOption initWithAVMediaSelectionOption:]([TVPSubtitleOption alloc], "initWithAVMediaSelectionOption:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)updateSubtitleOptions
{
  NSArray *subtitleOptions;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("subtitleOptions"));
  subtitleOptions = self->_subtitleOptions;
  self->_subtitleOptions = 0;

  -[TVPPlayer delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TVPPlayer delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
      v8 = -[TVPPlayer subtitleOptions](self, "subtitleOptions");
  }
  -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("subtitleOptions"));
}

- (void)updateSubtitleOptionsAndSelection
{
  -[TVPPlayer updateSubtitleOptions](self, "updateSubtitleOptions");
  -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("selectedSubtitleOption"));
  -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("selectedSubtitleOption"));
}

- (void)setCurrentMediaItemInitialLoadingComplete:(BOOL)a3
{
  -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentMediaItemInitialLoadingComplete"));
  self->_currentMediaItemInitialLoadingComplete = a3;
  -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentMediaItemInitialLoadingComplete"));
}

- (BOOL)currentMediaItemInitialLoadingComplete
{
  return self->_currentMediaItemInitialLoadingComplete;
}

- (TVPTimeRange)bufferedTimeRange
{
  void *v3;
  void *v4;
  int v5;
  TVPTimeRange *v6;
  TVPTimeRange *v7;
  CMTime v9;
  CMTime v10;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v13;
  CMTime end;
  CMTime start;
  CMTimeRange v16;
  CMTimeRange v17;

  -[TVPPlayer cachedLoadedTimeRanges](self, "cachedLoadedTimeRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v17, 0, sizeof(v17));
  +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:](TVPTimeRange, "forwardmostCMTimeRangeInCMTimeRanges:", v3);
  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasTrait:", CFSTR("TVPMediaItemTraitIsScene"));

  if (v5)
  {
    memset(&v16, 0, sizeof(v16));
    -[TVPPlayer _currentMediaItemReversePlaybackEndTime](self, "_currentMediaItemReversePlaybackEndTime");
    -[TVPPlayer _currentMediaItemForwardPlaybackEndTime](self, "_currentMediaItemForwardPlaybackEndTime");
    CMTimeRangeFromTimeToTime(&v16, &start, &end);
    range = v17;
    memset(&v13, 0, sizeof(v13));
    otherRange = v16;
    CMTimeRangeGetIntersection(&v13, &range, &otherRange);
    -[TVPPlayer _currentMediaItemReversePlaybackEndTime](self, "_currentMediaItemReversePlaybackEndTime");
    *(_OWORD *)&range.start.value = *(_OWORD *)&v13.start.value;
    range.start.epoch = v13.start.epoch;
    CMTimeSubtract(&v10, &range.start, &v9);
    otherRange.start = v13.duration;
    CMTimeRangeMake(&range, &v10, &otherRange.start);
    v17 = range;
  }
  v6 = [TVPTimeRange alloc];
  v16 = v17;
  v7 = -[TVPTimeRange initWithCMTimeRange:](v6, "initWithCMTimeRange:", &v16);

  return v7;
}

- (TVPTimeRange)seekableTimeRange
{
  void *v3;
  void *v4;
  int v5;
  TVPTimeRange *v6;
  TVPTimeRange *v7;
  CMTime v9;
  CMTime v10;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v13;
  CMTime end;
  CMTime start;
  CMTimeRange v16;
  CMTimeRange v17;

  -[TVPPlayer cachedSeekableTimeRanges](self, "cachedSeekableTimeRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v17, 0, sizeof(v17));
  +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:](TVPTimeRange, "forwardmostCMTimeRangeInCMTimeRanges:", v3);
  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasTrait:", CFSTR("TVPMediaItemTraitIsScene"));

  if (v5)
  {
    memset(&v16, 0, sizeof(v16));
    -[TVPPlayer _currentMediaItemReversePlaybackEndTime](self, "_currentMediaItemReversePlaybackEndTime");
    -[TVPPlayer _currentMediaItemForwardPlaybackEndTime](self, "_currentMediaItemForwardPlaybackEndTime");
    CMTimeRangeFromTimeToTime(&v16, &start, &end);
    range = v17;
    memset(&v13, 0, sizeof(v13));
    otherRange = v16;
    CMTimeRangeGetIntersection(&v13, &range, &otherRange);
    -[TVPPlayer _currentMediaItemReversePlaybackEndTime](self, "_currentMediaItemReversePlaybackEndTime");
    *(_OWORD *)&range.start.value = *(_OWORD *)&v13.start.value;
    range.start.epoch = v13.start.epoch;
    CMTimeSubtract(&v10, &range.start, &v9);
    otherRange.start = v13.duration;
    CMTimeRangeMake(&range, &v10, &otherRange.start);
    v17 = range;
  }
  v6 = [TVPTimeRange alloc];
  v16 = v17;
  v7 = -[TVPTimeRange initWithCMTimeRange:](v6, "initWithCMTimeRange:", &v16);

  return v7;
}

- (TVPDateRange)seekableDateRange
{
  void *v3;
  void *v4;
  TVPDateRange *v5;
  CMTime v7;
  __int128 v8;
  _OWORD v9[2];

  if (-[TVPPlayer _currentPlayerItemContainsDates](self, "_currentPlayerItemContainsDates"))
  {
    -[TVPPlayer cachedSeekableTimeRanges](self, "cachedSeekableTimeRanges");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    memset(v9, 0, sizeof(v9));
    v8 = 0u;
    +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:](TVPTimeRange, "forwardmostCMTimeRangeInCMTimeRanges:", v3);
    *(_OWORD *)&v7.value = v8;
    v7.epoch = *(_QWORD *)&v9[0];
    -[TVPPlayer _estimatedPlaybackDateForCMTime:](self, "_estimatedPlaybackDateForCMTime:", &v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(CMTime *)((char *)v9 + 8);
    v5 = -[TVPDateRange initWithStartDate:duration:]([TVPDateRange alloc], "initWithStartDate:duration:", v4, CMTimeGetSeconds(&v7));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (double)forwardPlaybackEndTime
{
  double result;
  CMTime v3[2];

  memset(&v3[1], 0, sizeof(CMTime));
  -[TVPPlayer _currentMediaItemForwardPlaybackEndTime](self, "_currentMediaItemForwardPlaybackEndTime");
  result = 0.0;
  if ((unsigned __int128)0 >> 96)
  {
    v3[0] = v3[1];
    return CMTimeGetSeconds(v3);
  }
  return result;
}

- (double)reversePlaybackEndTime
{
  double result;
  CMTime v3[2];

  memset(&v3[1], 0, sizeof(CMTime));
  -[TVPPlayer _currentMediaItemReversePlaybackEndTime](self, "_currentMediaItemReversePlaybackEndTime");
  result = 0.0;
  if ((unsigned __int128)0 >> 96)
  {
    v3[0] = v3[1];
    return CMTimeGetSeconds(v3);
  }
  return result;
}

- (void)setMaximumBitRate:(double)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_maximumBitRate != a3)
  {
    self->_maximumBitRate = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setPreferredPeakBitRate:", self->_maximumBitRate);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)playerDidHitBeginningOrEnd
{
  id v2;

  -[TVPPlayer stateMachine](self, "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:", CFSTR("Hit beginning or end"));

}

- (BOOL)currentMediaItemSupportsScrubbingUsingPlayer
{
  void *v3;
  void *v4;
  char v5;

  if (!-[TVPPlayer currentMediaItemIsStreaming](self, "currentMediaItemIsStreaming"))
    return 0;
  -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "status") == 1)
    v5 = objc_msgSend(v4, "canPlayFastForward");
  else
    v5 = 0;

  return v5;
}

- (BOOL)seeking
{
  void *v4;
  void *v5;
  char v6;

  if (-[TVPPlayer numOutstandingSeeks](self, "numOutstandingSeeks") > 0)
    return 1;
  -[TVPPlayer stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Waiting for seek"));

  return v6;
}

- (void)setPreventsSleepDuringVideoPlayback:(BOOL)a3
{
  void *v4;
  id v5;

  self->_preventsSleepDuringVideoPlayback = a3;
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "setPreventsDisplaySleepDuringVideoPlayback:", self->_preventsSleepDuringVideoPlayback);
    v4 = v5;
  }

}

- (void)removeWeakReferenceToVideoView:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_videoViewWeakReferences, "removeObject:");
}

- (void)setHighFrequencyElapsedTimeObserverBlock:(id)a3
{
  void *v4;
  id highFrequencyElapsedTimeObserverBlock;

  v4 = (void *)objc_msgSend(a3, "copy");
  highFrequencyElapsedTimeObserverBlock = self->_highFrequencyElapsedTimeObserverBlock;
  self->_highFrequencyElapsedTimeObserverBlock = v4;

  if (self->_highFrequencyElapsedTimeObserverBlock)
    -[TVPPlayer _addHighFrequencyTimeObserverIfNecessary](self, "_addHighFrequencyTimeObserverIfNecessary");
  else
    -[TVPPlayer _removeHighFrequencyTimeObserverIfNecessary](self, "_removeHighFrequencyTimeObserverIfNecessary");
}

- (int64_t)currentScanMode
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  int64_t v7;

  -[TVPPlayer stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Scanning using AVPlayer")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("Scanning using AVPlayer driven by AVKit")))
  {
    if (-[TVPPlayer currentMediaItemIsStreaming](self, "currentMediaItemIsStreaming"))
    {
      -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "canPlayFastForward");

      if (v6)
        v7 = 1;
      else
        v7 = 2;
    }
    else
    {
      v7 = 2;
    }
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Scanning using external images")) & 1) != 0
         || objc_msgSend(v4, "isEqualToString:", CFSTR("Scanning using external images driven by AVKit")))
  {
    v7 = 3;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setUpdatesBookmarks:(BOOL)a3
{
  TVPPlayerBookmarkMonitor *v4;

  if (self->_updatesBookmarks != a3)
  {
    self->_updatesBookmarks = a3;
    if (a3)
    {
      v4 = -[TVPPlayerBookmarkMonitor initWithPlayer:]([TVPPlayerBookmarkMonitor alloc], "initWithPlayer:", self);
      -[TVPPlayer setBookmarkMonitor:](self, "setBookmarkMonitor:", v4);

    }
    else
    {
      -[TVPPlayer setBookmarkMonitor:](self, "setBookmarkMonitor:", 0);
    }
  }
}

- (void)selectMediaArray:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TVPPlayer _selectMediaArray:withItem:](self, "_selectMediaArray:withItem:", v4, v5);

}

- (id)AVQueuePlayerCreateIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  uint8_t v8[16];

  v3 = a3;
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[TVPPlayer earlyAVQueuePlayer](self, "earlyAVQueuePlayer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5 && v3)
    {
      v6 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_228A4E000, v6, OS_LOG_TYPE_DEFAULT, "Creating AVQueuePlayer earlier than normal upon request", v8, 2u);
      }
      v5 = +[TVPPlayer _newAVQueuePlayer](TVPPlayer, "_newAVQueuePlayer");
      -[TVPPlayer setEarlyAVQueuePlayer:](self, "setEarlyAVQueuePlayer:", v5);
    }
  }
  return v5;
}

- (void)restartPlaybackWithState:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v8 = CFSTR("Post loading state key");
    v9[0] = a3;
    v4 = (void *)MEMORY[0x24BDBCE70];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  -[TVPPlayer stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Restart playback"), 0, v6);

}

- (void)_selectMediaArray:(id)a3 withItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *pendingSelectedMediaArray;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSArray *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "asset");
    pendingSelectedMediaArray = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v20 = 0;
          objc_msgSend(pendingSelectedMediaArray, "mediaSelectionGroupForPropertyList:mediaSelectionOption:", v15, &v20);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v20;
          if (v16)
            objc_msgSend(v8, "selectMediaOption:inMediaSelectionGroup:", v17, v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }

  }
  else
  {
    v18 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v27 = 0;
      _os_log_impl(&dword_228A4E000, v18, OS_LOG_TYPE_DEFAULT, "Player item %p is not ready to receive the selectedMediaArray. Holding it until it is ready...", buf, 0xCu);
    }
    v19 = (NSArray *)v6;
    pendingSelectedMediaArray = self->_pendingSelectedMediaArray;
    self->_pendingSelectedMediaArray = v19;
  }

}

- (id)accessLog
{
  void *v2;
  void *v3;

  -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessLog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)errorLog
{
  void *v2;
  void *v3;

  -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorLog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)timedMetadata
{
  void *v2;
  void *v3;

  -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "status") == 1)
  {
    objc_msgSend(v2, "timedMetadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setLimitReadAhead:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResourceConservationLevelWhilePaused:", v3);

}

- (BOOL)limitReadAhead
{
  void *v2;
  BOOL v3;

  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resourceConservationLevelWhilePaused") == 1;

  return v3;
}

- (void)setMediaRemoteUpdatingEnabled:(BOOL)a3
{
  if (self->_mediaRemoteUpdatingEnabled != a3)
  {
    self->_mediaRemoteUpdatingEnabled = a3;
    -[TVPPlayer _updateMediaRemoteManager](self, "_updateMediaRemoteManager");
  }
}

- (void)setUpdatesMediaRemoteInfoAutomatically:(BOOL)a3
{
  if (self->_updatesMediaRemoteInfoAutomatically != a3)
  {
    self->_updatesMediaRemoteInfoAutomatically = a3;
    -[TVPPlayer _updateMediaRemoteManager](self, "_updateMediaRemoteManager");
  }
}

- (void)setRespondsToRemoteControlEvents:(BOOL)a3
{
  if (self->_respondsToRemoteControlEvents != a3)
  {
    self->_respondsToRemoteControlEvents = a3;
    -[TVPPlayer _updateMediaRemoteManager](self, "_updateMediaRemoteManager");
  }
}

- (void)setPlaybackHUDString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setAncillaryPerformanceInformationForDisplay:", v4);

}

- (void)setPreferredForwardBufferDuration:(double)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (a3 >= 0.0 && self->_preferredForwardBufferDuration != a3)
  {
    self->_preferredForwardBufferDuration = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setPreferredForwardBufferDuration:", self->_preferredForwardBufferDuration);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)setPreferredMaximumResolution:(CGSize)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->_preferredMaximumResolution.width != a3.width || self->_preferredMaximumResolution.height != a3.height)
  {
    self->_preferredMaximumResolution = a3;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setPreferredMaximumResolution:", self->_preferredMaximumResolution.width, self->_preferredMaximumResolution.height);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)setReportingCategory:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_reportingCategory, a3);
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_228A4E000, v8, OS_LOG_TYPE_DEFAULT, "Setting AVPlayerItem reportingCategory to %@", (uint8_t *)&v9, 0xCu);
    }
    objc_msgSend(v7, "setReportingCategory:", v5);
  }

}

- (void)setReportingValueWithString:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = v6;
    v26 = 2112;
    v27 = v7;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Setting reporting value %@ for key %@; player %@",
      buf,
      0x20u);

  }
  if (v7)
  {
    -[TVPPlayer reportingValues](self, "reportingValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v6)
      objc_msgSend(v11, "setObject:forKey:", v6, v7);
    else
      objc_msgSend(v11, "removeObjectForKey:", v7);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "setReportingValueWithString:forKey:", v6, v7);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

- (void)setReportingValueWithNumber:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v25 = v6;
    v26 = 2112;
    v27 = v7;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Setting reporting value %@ for key %@; player %@",
      buf,
      0x20u);

  }
  if (v7)
  {
    -[TVPPlayer reportingValues](self, "reportingValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v6)
      objc_msgSend(v11, "setObject:forKey:", v6, v7);
    else
      objc_msgSend(v11, "removeObjectForKey:", v7);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v18++), "setReportingValueWithNumber:forKey:", v6, v7);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

- (void)setPrefersSDRVideo:(BOOL)a3
{
  if (self->_prefersSDRVideo != a3)
    self->_prefersSDRVideo = a3;
}

- (BOOL)prefersSDRVideo
{
  return self->_prefersSDRVideo;
}

- (void)setLimitsBandwidthForCellularAccess:(BOOL)a3
{
  id v4;

  if (self->_limitsBandwidthForCellularAccess != a3)
  {
    self->_limitsBandwidthForCellularAccess = a3;
    -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setLimitsBandwidthForCellularAccess:", self->_limitsBandwidthForCellularAccess);

  }
}

- (int64_t)externalPlaybackType
{
  void *v2;
  uint64_t v3;

  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "externalPlaybackType");

  if (v3 == 2)
    return 2;
  else
    return v3 == 1;
}

- (BOOL)playerItem:(id)a3 shouldSeekToTime:(id *)a4 toleranceBefore:(id *)a5 toleranceAfter:(id *)a6
{
  id v8;
  unsigned int *p_var2;
  int64_t *p_var3;
  CMTimeFlags v11;
  CMTimeEpoch v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD block[5];
  id v25;
  CMTime v26;
  CMTime time;
  void *v28;
  CMTimeValue var0;
  CMTimeScale var1;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (objc_msgSend(v8, "status") == 1)
  {
    var0 = *MEMORY[0x24BDC0D40];
    var1 = *(_DWORD *)(MEMORY[0x24BDC0D40] + 8);
    if (a4)
    {
      var0 = a4->var0;
      var1 = a4->var1;
      p_var2 = &a4->var2;
      p_var3 = &a4->var3;
    }
    else
    {
      p_var2 = (unsigned int *)(MEMORY[0x24BDC0D40] + 12);
      p_var3 = (int64_t *)(MEMORY[0x24BDC0D40] + 16);
    }
    v11 = *p_var2;
    v12 = *p_var3;
    memset(&v26, 0, sizeof(v26));
    if (v8)
      objc_msgSend(v8, "currentTime");
    objc_msgSend(v8, "currentDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v15 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      time.value = var0;
      time.timescale = var1;
      time.flags = v11;
      time.epoch = v12;
      v16 = v15;
      v17 = (__CFString *)CMTimeCopyDescription(0, &time);
      time = v26;
      v18 = v17;
      v19 = (__CFString *)CMTimeCopyDescription(0, &time);
      LODWORD(time.value) = 138412802;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v17;
      LOWORD(time.flags) = 2112;
      *(_QWORD *)((char *)&time.flags + 2) = v19;
      HIWORD(time.epoch) = 2112;
      v28 = v13;
      _os_log_impl(&dword_228A4E000, v16, OS_LOG_TYPE_DEFAULT, "playerItem shouldSeekToTime:%@ currentTime:%@ currentDate:%@", (uint8_t *)&time, 0x20u);

    }
    if ((v26.flags & 0x1D) == 1)
    {
      time = v26;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CMTimeGetSeconds(&time));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v20, CFSTR("TVPPlaybackTimePriorToSeekKey"));

    }
    if ((v11 & 0x1D) == 1)
    {
      time.value = var0;
      time.timescale = var1;
      time.flags = v11;
      time.epoch = v12;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CMTimeGetSeconds(&time));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKey:", v21, CFSTR("TVPPlaybackSeekTargetTimeKey"));

    }
    if (v13)
      objc_msgSend(v14, "setObject:forKey:", v13, CFSTR("TVPPlaybackDatePriorToSeekKey"));
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("TVPPlayerCurrentMediaItemWillSeekNotification"), self, v14);

    }
    else
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __72__TVPPlayer_playerItem_shouldSeekToTime_toleranceBefore_toleranceAfter___block_invoke;
      block[3] = &unk_24F15BCB0;
      block[4] = self;
      v25 = v14;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
  }

  return 1;
}

void __72__TVPPlayer_playerItem_shouldSeekToTime_toleranceBefore_toleranceAfter___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("TVPPlayerCurrentMediaItemWillSeekNotification"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_subtitleSettingsDidChange
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_updateSubtitleOptionsAndSelection, 0);
  -[TVPPlayer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_updateSubtitleOptionsAndSelection, 0, 0.0);
}

- (void)_removeObserversForMediaItemLoader:(id)a3
{
  if (a3)
    objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("state"), __TVPMediaItemLoaderStateKVOContext_0);
}

void __53__TVPPlayer__addPeriodicTimeObserverToAVQueuePlayer___block_invoke(uint64_t a1, __int128 *a2)
{
  id WeakRetained;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = *a2;
  v5 = *((_QWORD *)a2 + 2);
  objc_msgSend(WeakRetained, "_avPlayerTimeDidChangeTo:", &v4);

}

void __53__TVPPlayer__addPeriodicTimeObserverToAVQueuePlayer___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  uint8_t v5[16];

  v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Current player item time did jump", v5, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVPPlayerTimeDidJumpNotification"), WeakRetained);

}

void __53__TVPPlayer__addHighFrequencyTimeObserverIfNecessary__block_invoke(uint64_t a1, CMTime *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void (**v22)(_QWORD, double);
  Float64 Seconds;
  CMTime v24;
  CMTime time;
  _QWORD v26[3];
  CMTime v27;

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "highFrequencyElapsedTimeObserverBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "_statesThatReturnAVPlayerTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_loadWeakRetained(v3);
    objc_msgSend(v8, "stateMachine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "containsObject:", v10);

    if (v11)
    {
      memset(&v27, 0, sizeof(v27));
      v12 = objc_loadWeakRetained(v3);
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "cachedDuration");
        time = *a2;
        objc_msgSend(v13, "_clampedElapsedTimeForTime:duration:", &time, v26);
      }
      else
      {
        memset(v26, 0, sizeof(v26));
        memset(&v27, 0, sizeof(v27));
      }

      v14 = objc_loadWeakRetained(v3);
      objc_msgSend(v14, "currentMediaItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "hasTrait:", CFSTR("TVPMediaItemTraitIsScene"));

      if (v16)
      {
        v17 = objc_loadWeakRetained(v3);
        v18 = v17;
        if (v17)
        {
          v24 = v27;
          objc_msgSend(v17, "_clampedSceneTimeForPlayerTime:", &v24);
        }
        else
        {
          memset(&time, 0, sizeof(time));
        }
        v27 = time;

      }
      v19 = objc_loadWeakRetained(v3);
      v20 = v19;
      if (v19)
      {
        v24 = v27;
        objc_msgSend(v19, "_clampInfiniteTimeToSeekableRange:", &v24);
      }
      else
      {
        memset(&time, 0, sizeof(time));
      }
      v27 = time;

      v21 = objc_loadWeakRetained(v3);
      objc_msgSend(v21, "highFrequencyElapsedTimeObserverBlock");
      v22 = (void (**)(_QWORD, double))objc_claimAutoreleasedReturnValue();
      time = v27;
      Seconds = CMTimeGetSeconds(&time);
      v22[2](v22, Seconds);

    }
  }
}

- (void)_addBoundaryTimeObserversToAVQueuePlayer:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[TVPPlayer boundaryTimeObserverInfos](self, "boundaryTimeObserverInfos");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __54__TVPPlayer__addBoundaryTimeObserversToAVQueuePlayer___block_invoke;
    v6[3] = &unk_24F15C580;
    v7 = v5;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
}

void __54__TVPPlayer__addBoundaryTimeObserversToAVQueuePlayer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "tokenFromAVPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_initWeak(&location, v6);
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v6, "times");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC9B8];
    v11 = MEMORY[0x24BDAC9B8];
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __54__TVPPlayer__addBoundaryTimeObserversToAVQueuePlayer___block_invoke_2;
    v16 = &unk_24F15C088;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v8, "addBoundaryTimeObserverForTimes:queue:usingBlock:", v9, v10, &v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setTokenFromAVPlayer:", v12, v13, v14, v15, v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

void __54__TVPPlayer__addBoundaryTimeObserversToAVQueuePlayer___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handler");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v2 = v3;
  if (v3)
  {
    (*((void (**)(id, _QWORD))v3 + 2))(v3, 0);
    v2 = v3;
  }

}

void __59__TVPPlayer__removeBoundaryTimeObserversFromAVQueuePlayer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "tokenFromAVPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeTimeObserver:", v4);
    objc_msgSend(v5, "setTokenFromAVPlayer:", 0);
  }

}

void __49__TVPPlayer__addPlaybackEndTimeBoundaryObservers__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[8];
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Boundary time observer for forward playback end time fired.", v11, 2u);
  }
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Playing")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("Scanning using AVPlayer")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("Scanning using AVPlayer driven by AVKit")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("Scanning using external images")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("Scanning using external images driven by AVKit")))
  {
    v7 = objc_loadWeakRetained(v3);
    objc_msgSend(v7, "stateMachine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("Requires manual AVQueuePlayer advance key");
    v13[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postEvent:withContext:userInfo:", CFSTR("Hit beginning or end"), 0, v9);

  }
  else
  {
    v10 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_228A4E000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring forward playback boundary time observer since player isn't playing or scanning.", v11, 2u);
    }
  }

}

void __49__TVPPlayer__addPlaybackEndTimeBoundaryObservers__block_invoke_372(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[8];
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Boundary time observer for reverse playback end time fired.", v11, 2u);
  }
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Scanning using AVPlayer")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("Scanning using AVPlayer driven by AVKit")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("Scanning using external images")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("Scanning using external images driven by AVKit")))
  {
    v7 = objc_loadWeakRetained(v3);
    objc_msgSend(v7, "stateMachine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR("Reset to start time key");
    v13[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postEvent:withContext:userInfo:", CFSTR("Hit beginning or end"), 0, v9);

  }
  else
  {
    v10 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_228A4E000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring reverse playback boundary time observer since player isn't scanning.", v11, 2u);
    }
  }

}

- (void)_playlistEndActionDidChange
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[TVPPlayer playlist](self, "playlist");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134217984;
    v7 = objc_msgSend(v5, "endAction");
    _os_log_impl(&dword_228A4E000, v4, OS_LOG_TYPE_DEFAULT, "Playlist end action did change to %ld", (uint8_t *)&v6, 0xCu);

  }
  -[TVPPlayer _updateAVPlayerActionAtItemEnd](self, "_updateAVPlayerActionAtItemEnd");
}

- (void)_playlistCurrentMediaItemWillChangeWithContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  _BYTE v18[24];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("Changing media because AVFoundation advanced key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("TVPPlaylistDidHitBeginningKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("TVPPlaylistDidHitEndKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("NO");
    if (v6)
      v13 = CFSTR("YES");
    else
      v13 = CFSTR("NO");
    if ((_DWORD)v8)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    *(_DWORD *)v18 = 138412802;
    *(_QWORD *)&v18[4] = v13;
    *(_WORD *)&v18[12] = 2112;
    *(_QWORD *)&v18[14] = v14;
    if ((_DWORD)v10)
      v12 = CFSTR("YES");
    *(_WORD *)&v18[22] = 2112;
    v19 = v12;
    _os_log_impl(&dword_228A4E000, v11, OS_LOG_TYPE_DEFAULT, "Playlist's current media item will change.  Due to AVFoundation advancing? %@  Did hit beginning of playlist? %@  Did hit end of playlist? %@", v18, 0x20u);
  }
  -[TVPPlayer currentMediaItem](self, "currentMediaItem", *(_OWORD *)v18, *(_QWORD *)&v18[16]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPPlayer _removeObserversForMediaItem:](self, "_removeObserversForMediaItem:", v15);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("direction"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("TVPPlaybackCurrentMediaItemChangeReasonKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer _postCurrentMediaItemWillChangeNotificationWithDirection:reason:didHitBeginningOfPlaylist:didHitEndOfPlaylist:](self, "_postCurrentMediaItemWillChangeNotificationWithDirection:reason:didHitBeginningOfPlaylist:didHitEndOfPlaylist:", v16, v17, v8, v10);

  }
}

- (void)_playlistCurrentMediaItemDidChangeWithContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BYTE v23[24];
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("Changing media because AVFoundation advanced key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("TVPPlaylistDidHitBeginningKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("TVPPlaylistDidHitEndKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    -[TVPPlayer currentMediaItem](self, "currentMediaItem");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("NO");
    if (v6)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    *(_DWORD *)v23 = 138413058;
    *(_QWORD *)&v23[4] = v13;
    if ((_DWORD)v8)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    *(_QWORD *)&v23[14] = v16;
    *(_WORD *)&v23[12] = 2112;
    *(_WORD *)&v23[22] = 2112;
    if ((_DWORD)v10)
      v15 = CFSTR("YES");
    v24 = v17;
    v25 = 2112;
    v26 = v15;
    _os_log_impl(&dword_228A4E000, v12, OS_LOG_TYPE_DEFAULT, "Playlist's current media item did change to %@.  Due to AVFoundation advancing? %@  Did hit beginning of playlist? %@  Did hit end of playlist? %@", v23, 0x2Au);

  }
  -[TVPPlayer currentMediaItem](self, "currentMediaItem", *(_OWORD *)v23, *(_QWORD *)&v23[16]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPPlayer setCurrentMediaItemIsStreaming:](self, "setCurrentMediaItemIsStreaming:", objc_msgSend(v18, "hasTrait:", CFSTR("TVPMediaItemTraitIsStreaming")));

  -[TVPPlayer setCurrentMediaItemInitialLoadingComplete:](self, "setCurrentMediaItemInitialLoadingComplete:", 0);
  -[TVPPlayer setInitialMediaItemHasCompletedInitialLoading:](self, "setInitialMediaItemHasCompletedInitialLoading:", 0);
  -[TVPPlayer _removePlaybackEndTimeBoundaryObservers](self, "_removePlaybackEndTimeBoundaryObservers");
  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPPlayer _addObserversForMediaItem:](self, "_addObserversForMediaItem:", v19);

  objc_msgSend(v4, "objectForKey:", CFSTR("direction"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("TVPPlaybackCurrentMediaItemChangeReasonKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPPlayer _postCurrentMediaItemDidChangeNotificationWithDirection:reason:didHitBeginningOfPlaylist:didHitEndOfPlaylist:](self, "_postCurrentMediaItemDidChangeNotificationWithDirection:reason:didHitBeginningOfPlaylist:didHitEndOfPlaylist:", v20, v21, v8, v10);

  -[TVPPlayer stateMachine](self, "stateMachine");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "postEvent:withContext:userInfo:", CFSTR("Playlist current media item did change"), 0, v4);

}

- (void)_playlistNextMediaItemDidChangeWithContext:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[TVPPlayer playlist](self, "playlist");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextMediaItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "Playlist's next media item did change to %@", (uint8_t *)&v9, 0xCu);

  }
  -[TVPPlayer stateMachine](self, "stateMachine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postEvent:", CFSTR("Playlist next media item did change"));

}

- (void)_avPlayerRateDidChangeTo:(float)a3
{
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "AVPlayer rate did change to %f", (uint8_t *)&v8, 0xCu);
  }
  if (!-[TVPPlayer modifyingAVPlayerRate](self, "modifyingAVPlayerRate"))
  {
    v6 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_228A4E000, v6, OS_LOG_TYPE_DEFAULT, "Rate change was external", (uint8_t *)&v8, 2u);
    }
    if (a3 >= 0.5 && a3 <= 2.0)
    {
      v7 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 134217984;
        v9 = a3;
        _os_log_impl(&dword_228A4E000, v7, OS_LOG_TYPE_DEFAULT, "Rate used for playback was set to %f", (uint8_t *)&v8, 0xCu);
      }
      -[TVPPlayer setRateUsedForPlayback:](self, "setRateUsedForPlayback:", a3);
    }
  }
}

- (void)_outputObscuredDidChangeTo:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  if (-[TVPPlayer outputObscuredDueToInsufficientExternalProtection](self, "outputObscuredDueToInsufficientExternalProtection") != a3)
  {
    v5 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "outputObscuredDueToInsufficientExternalProtection did change to %@ due to AVPlayer KVO notification", buf, 0xCu);
    }
    -[TVPPlayer setOutputObscuredDueToInsufficientExternalProtection:](self, "setOutputObscuredDueToInsufficientExternalProtection:", v3);
    if (v3 && -[TVPPlayer externalPlaybackType](self, "externalPlaybackType") == 2)
    {
      v7 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v7, OS_LOG_TYPE_DEFAULT, "Stopping with error because external playack type is TVOut", buf, 2u);
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 807, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPPlayer stateMachine](self, "stateMachine");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("Error key");
      v12 = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postEvent:withContext:userInfo:", CFSTR("Error did occur"), 0, v10);

    }
  }
}

- (void)_externalPlaybackActiveDidChange
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[8];
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v3 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_228A4E000, v3, OS_LOG_TYPE_DEFAULT, "externalPlaybackActive did change", v11, 2u);
  }
  -[TVPPlayer _logExternalPlaybackType](self, "_logExternalPlaybackType");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("TVPPlayerExternalPlaybackTypeDidChangeNotification"), self);

  if (-[TVPPlayer externalPlaybackType](self, "externalPlaybackType") == 2)
  {
    -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "outputObscuredDueToInsufficientExternalProtection");

    if (v6)
    {
      v7 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_228A4E000, v7, OS_LOG_TYPE_DEFAULT, "Stopping with error because external playack type is TVOut", v11, 2u);
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 807, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPPlayer stateMachine](self, "stateMachine");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("Error key");
      v13[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postEvent:withContext:userInfo:", CFSTR("Error did occur"), 0, v10);

    }
  }
}

- (void)_avPlayerTimeDidChangeTo:(id *)a3
{
  void *v3;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  char v23;
  CMTime v24;
  _BYTE v25[24];
  CMTime v26;
  CMTime time;

  -[TVPPlayer cachedElapsedCMTime](self, "cachedElapsedCMTime");
  v6 = floor(CMTimeGetSeconds(&time));
  v26 = *(CMTime *)a3;
  if (v6 != floor(CMTimeGetSeconds(&v26)))
  {
    -[TVPPlayer _statesThatReturnAVPlayerTime](self, "_statesThatReturnAVPlayerTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPPlayer stateMachine](self, "stateMachine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "containsObject:", v9);

    if (v10)
    {
      memset(&v26, 0, sizeof(v26));
      -[TVPPlayer cachedDuration](self, "cachedDuration");
      v24 = (CMTime)*a3;
      -[TVPPlayer _clampedElapsedTimeForTime:duration:](self, "_clampedElapsedTimeForTime:duration:", &v24, v25);
      -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      if (objc_msgSend(v11, "status") == 1)
      {
        -[TVPPlayer cachedDuration](self, "cachedDuration");
        if ((v23 & 1) != 0 && (-[TVPPlayer cachedDuration](self, "cachedDuration"), (v22 & 0x10) != 0))
        {
          -[TVPPlayer _currentDateFromPlayerItem:](self, "_currentDateFromPlayerItem:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = 0;
        }
      }
      -[TVPPlayer stateMachine](self, "stateMachine");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Scanning using AVPlayer"));
      if ((v15 & 1) == 0)
      {
        -[TVPPlayer stateMachine](self, "stateMachine");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "currentState");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Scanning using AVPlayer driven by AVKit")))
        {

LABEL_16:
          v24 = v26;
          -[TVPPlayer _notifyListenersOfElapsedTimeChange:playbackDate:dueToTimeJump:](self, "_notifyListenersOfElapsedTimeChange:playbackDate:dueToTimeJump:", &v24, v12, 0);
LABEL_17:

          goto LABEL_18;
        }
        v21 = v16;
      }
      v17 = v12;
      v18 = v11;
      -[TVPPlayer currentInterstitialCollection](self, "currentInterstitialCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v26;
      objc_msgSend(v19, "interstitialForTime:", CMTimeGetSeconds(&v24));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v15 & 1) == 0)
      {

      }
      v11 = v18;
      v12 = v17;
      if (v20)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
LABEL_18:
  v26 = (CMTime)*a3;
  -[TVPPlayer setCachedElapsedCMTime:](self, "setCachedElapsedCMTime:", &v26);
}

uint64_t __43__TVPPlayer__currentPlayerItemDidChangeTo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "changeMedia:withContext:", 0, *(_QWORD *)(a1 + 40));
}

void __43__TVPPlayer__currentPlayerItemDidChangeTo___block_invoke_409(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentPlayerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  v5 = sPlayerLogObject;
  v6 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
  if (v4 == 2)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "Current player item is still failed after item transition", buf, 2u);
    }
    v7 = objc_loadWeakRetained(v1);
    objc_msgSend(v7, "_currentPlayerItemStatusDidChangeTo:from:", 2, 0);

  }
  else if (v6)
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "Current player item is no longer failed", v8, 2u);
  }
}

- (void)_currentPlayerItemDidHitBeginningOrEnd:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v4 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_228A4E000, v4, OS_LOG_TYPE_DEFAULT, "Current player item did hit beginning or end", v6, 2u);
  }
  -[TVPPlayer stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postEvent:", CFSTR("Hit beginning or end"));

}

- (void)_currentPlayerItemErrorLogDidChange:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[TVPPlayer errorLog](self, "errorLog");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "Current player item error log did change: %@", (uint8_t *)&v7, 0xCu);

  }
  -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("errorLog"));
  -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("errorLog"));
}

- (void)_currentPlayerItemDidStall:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v4 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_228A4E000, v4, OS_LOG_TYPE_DEFAULT, "Current player item did stall", v6, 2u);
  }
  -[TVPPlayer stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postEvent:", CFSTR("Current player item did stall"));

}

- (void)_currentPlayerItemDidFailToPlayToEnd:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[8];
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_228A4E000, v5, OS_LOG_TYPE_DEFAULT, "Current player item did fail to play to end", v12, 2u);
  }
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDB1FB0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPPlayer playbackErrorFromError:forMediaItem:](self, "playbackErrorFromError:forMediaItem:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = CFSTR("Error key");
  v14[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPPlayer stateMachine](self, "stateMachine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postEvent:withContext:userInfo:", CFSTR("Error did occur"), 0, v10);

}

- (void)_currentPlayerItemMediaSelectionDidChange:(id)a3
{
  void *v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  int v18;
  const __CFString *v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  __CFString *v23;
  NSObject *v24;
  __CFString *v25;
  void *v26;
  int v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v27) = 0;
    _os_log_impl(&dword_228A4E000, v6, OS_LOG_TYPE_DEFAULT, "Current player item media selection did change", (uint8_t *)&v27, 2u);
  }
  -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("selectedAudioOption"));
  -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("selectedAudioOption"));
  -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("selectedSubtitleOption"));
  -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("selectedSubtitleOption"));
  -[TVPPlayer selectedAudioOption](self, "selectedAudioOption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    || (-[TVPPlayer cachedSelectedAudioOption](self, "cachedSelectedAudioOption"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[TVPPlayer cachedSelectedAudioOption](self, "cachedSelectedAudioOption");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v7)
    {
      if ((v9 & 1) != 0)
        goto LABEL_20;
    }
    else
    {

      if ((v9 & 1) != 0)
        goto LABEL_20;
    }
    -[TVPPlayer setCachedSelectedAudioOption:](self, "setCachedSelectedAudioOption:", v7);
    -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x24BDB1C90]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "defaultOption");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "avMediaSelectionOption");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqual:", v14);

    v16 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = objc_msgSend(v7, "hasAudioDescriptions");
      v19 = CFSTR("NO");
      if (v18)
        v19 = CFSTR("YES");
      v27 = 138412290;
      v28 = v19;
      _os_log_impl(&dword_228A4E000, v17, OS_LOG_TYPE_DEFAULT, "Setting player prefers audio descriptions %@", (uint8_t *)&v27, 0xCu);

    }
    -[TVPPlayer setPrefersAudioDescriptions:](self, "setPrefersAudioDescriptions:", objc_msgSend(v7, "hasAudioDescriptions"));
    v20 = (void *)sPlayerLogObject;
    v21 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v21)
      {
        v22 = v20;
        objc_msgSend(v7, "languageCodeBCP47");
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v27 = 138412290;
        v28 = v23;
        _os_log_impl(&dword_228A4E000, v22, OS_LOG_TYPE_DEFAULT, "Setting player's preferred audio language code to nil since selected language option, %@, is the default", (uint8_t *)&v27, 0xCu);

      }
      -[TVPPlayer setPreferredAudioLanguageCode:](self, "setPreferredAudioLanguageCode:", 0);
    }
    else
    {
      if (v21)
      {
        v24 = v20;
        objc_msgSend(v7, "languageCodeBCP47");
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v27 = 138412290;
        v28 = v25;
        _os_log_impl(&dword_228A4E000, v24, OS_LOG_TYPE_DEFAULT, "Setting player's preferred audio language code to %@", (uint8_t *)&v27, 0xCu);

      }
      objc_msgSend(v7, "languageCodeBCP47");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVPPlayer setPreferredAudioLanguageCode:](self, "setPreferredAudioLanguageCode:", v26);

    }
  }
LABEL_20:

}

- (void)_currentPlayerItemReachedTimeToPauseBuffering:(id)a3
{
  void *v3;
  id v4;

  -[TVPPlayer currentMediaItem](self, "currentMediaItem", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVPPlayerItemReachedTimeToPauseBufferingNotification"), v4);

  }
}

- (void)_currentPlayerItemReachedTimeToPausePlayback:(id)a3
{
  void *v3;
  id v4;

  -[TVPPlayer currentMediaItem](self, "currentMediaItem", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVPPlayerItemReachedTimeToPausePlaybackNotification"), v4);

  }
}

- (void)_audioRouteChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __32__TVPPlayer__audioRouteChanged___block_invoke;
  v6[3] = &unk_24F15BCB0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __32__TVPPlayer__audioRouteChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  if (objc_msgSend(*(id *)(a1 + 32), "pausesOnRouteChange"))
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[TVPPlaybackState playing](TVPPlaybackState, "playing");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v2 == (void *)v3)
    {

    }
    else
    {
      v4 = (void *)v3;
      objc_msgSend(*(id *)(a1 + 32), "state");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[TVPPlaybackState loading](TVPPlaybackState, "loading");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5 != v6)
        return;
    }
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDB1738]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "unsignedIntegerValue") == 2)
    {
      v9 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Pausing for audio route change", v10, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "pause");
    }

  }
}

- (void)_screenRecordingStateDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__TVPPlayer__screenRecordingStateDidChange___block_invoke;
  block[3] = &unk_24F15BEF8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __44__TVPPlayer__screenRecordingStateDidChange___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_isScreenBeingRecorded");
  objc_msgSend(*(id *)(a1 + 32), "AVQueuePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = sPlayerLogObject;
  v5 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v2)
    {
      if (v5)
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_228A4E000, v4, OS_LOG_TYPE_DEFAULT, "Screen is being recorded.  Muting AVQueuePlayer", (uint8_t *)&v13, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "setWasMutedPriorToScreenRecording:", objc_msgSend(*(id *)(a1 + 32), "muted"));
      objc_msgSend(*(id *)(a1 + 32), "AVQueuePlayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMuted:", 1);

    }
    else
    {
      if (v5)
      {
        v8 = *(void **)(a1 + 32);
        v9 = v4;
        v10 = objc_msgSend(v8, "muted");
        v11 = CFSTR("NO");
        if (v10)
          v11 = CFSTR("YES");
        v13 = 138412290;
        v14 = v11;
        _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Screen is NOT being recorded.  Restoring previous mute value of %@", (uint8_t *)&v13, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "AVQueuePlayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setMuted:", objc_msgSend(*(id *)(a1 + 32), "wasMutedPriorToScreenRecording"));

    }
  }
  else if (v5)
  {
    v7 = CFSTR("NOT ");
    if (v2)
      v7 = &stru_24F15E1B8;
    v13 = 138412290;
    v14 = v7;
    _os_log_impl(&dword_228A4E000, v4, OS_LOG_TYPE_DEFAULT, "Screen is %@being recorded, but AVQueuePlayer does not exist yet.  Will handle when AVQueuePlayer is created.", (uint8_t *)&v13, 0xCu);
  }
}

- (void)_avPlayerRateDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rate");
  -[TVPPlayer _avPlayerRateDidChangeTo:](self, "_avPlayerRateDidChangeTo:");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("TVPPlaybackRateDidChangeNotification"), self, v6);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_clampedElapsedTimeForTime:(SEL)a3 duration:(id *)a4
{
  CMTimeEpoch v7;
  CMTimeEpoch epoch;
  __int128 v9;
  CMTime v10;
  CMTime time2;
  CMTime time1;

  *retstr = *a4;
  if ((a4->var2 & 0x1D) == 1 && (a5->var2 & 0x1D) == 1)
  {
    time1 = *(CMTime *)a5;
    v9 = *MEMORY[0x24BDC0D88];
    *(_OWORD *)&time2.value = *MEMORY[0x24BDC0D88];
    v7 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    time2.epoch = v7;
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&time1, &time2);
    if ((int)self >= 1)
    {
      time2 = (CMTime)*retstr;
      *(_OWORD *)&v10.value = v9;
      v10.epoch = v7;
      CMTimeMaximum(&time1, &time2, &v10);
      *(_OWORD *)&retstr->var0 = *(_OWORD *)&time1.value;
      epoch = time1.epoch;
      retstr->var3 = time1.epoch;
      *(_OWORD *)&time2.value = *(_OWORD *)&retstr->var0;
      time2.epoch = epoch;
      v10 = (CMTime)*a5;
      self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMinimum(&time1, &time2, &v10);
      *(CMTime *)retstr = time1;
    }
  }
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_clampedSceneTimeForPlayerTime:(SEL)a3
{
  CMTime v7;
  CMTime rhs;
  CMTime lhs;
  CMTime v10;
  CMTime v11[2];

  memset(&v11[1], 0, sizeof(CMTime));
  -[TVPPlayer _currentMediaItemReversePlaybackEndTime](self, "_currentMediaItemReversePlaybackEndTime");
  memset(v11, 0, 24);
  -[TVPPlayer _currentMediaItemForwardPlaybackEndTime](self, "_currentMediaItemForwardPlaybackEndTime");
  memset(&v10, 0, sizeof(v10));
  lhs = v11[0];
  rhs = v11[1];
  CMTimeSubtract(&v10, &lhs, &rhs);
  memset(&lhs, 0, sizeof(lhs));
  rhs = *(CMTime *)a4;
  v7 = v11[1];
  CMTimeSubtract(&lhs, &rhs, &v7);
  rhs = lhs;
  v7 = v10;
  return -[TVPPlayer _clampedElapsedTimeForTime:duration:](self, "_clampedElapsedTimeForTime:duration:", &rhs, &v7);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_estimatedCMTimeForPlaybackDate:(SEL)a3 referenceTime:(id)a4 referenceDate:(id *)a5
{
  Float64 v8;
  CMTime v10;
  CMTime rhs;

  objc_msgSend(a4, "timeIntervalSinceDate:", a6);
  CMTimeMakeWithSeconds(&rhs, v8, 1000000);
  v10 = *(CMTime *)a5;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd((CMTime *)retstr, &v10, &rhs);
}

- (id)_estimatedPlaybackDateForCMTime:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CMTime v10;
  CMTime rhs;
  CMTime v12;

  -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((a3->var2 & 0x1D) == 1
    && objc_msgSend(v5, "status") == 1
    && -[TVPPlayer _currentPlayerItemContainsDates](self, "_currentPlayerItemContainsDates"))
  {
    -[TVPPlayer _currentDateFromPlayerItem:](self, "_currentDateFromPlayerItem:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      memset(&v12, 0, sizeof(v12));
      if (v6)
        objc_msgSend(v6, "currentTime");
      else
        memset(&rhs, 0, sizeof(rhs));
      v10 = (CMTime)*a3;
      CMTimeSubtract(&v12, &v10, &rhs);
      v10 = v12;
      objc_msgSend(v7, "dateByAddingTimeInterval:", CMTimeGetSeconds(&v10));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_notifyListenersOfElapsedTimeChange:(id *)a3 playbackDate:(id)a4 dueToTimeJump:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  CMTimeEpoch epoch;
  void *v10;
  int v11;
  double Seconds;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v28;
  _BYTE v29[24];
  CMTime time;
  _BYTE v31[128];
  uint64_t v32;

  v5 = a5;
  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  -[TVPPlayer cachedDuration](self, "cachedDuration");
  v28 = *a3;
  -[TVPPlayer _clampedElapsedTimeForTime:duration:](self, "_clampedElapsedTimeForTime:duration:", &v28, v29);
  *(_OWORD *)&a3->var0 = *(_OWORD *)&time.value;
  epoch = time.epoch;
  a3->var3 = time.epoch;
  *(_OWORD *)&v28.var0 = *(_OWORD *)&a3->var0;
  v28.var3 = epoch;
  -[TVPPlayer _clampInfiniteTimeToSeekableRange:](self, "_clampInfiniteTimeToSeekableRange:", &v28);
  *(CMTime *)a3 = time;
  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasTrait:", CFSTR("TVPMediaItemTraitIsScene"));

  if (v11)
  {
    v28 = *a3;
    -[TVPPlayer _clampedSceneTimeForPlayerTime:](self, "_clampedSceneTimeForPlayerTime:", &v28);
    *(CMTime *)a3 = time;
  }
  time = (CMTime)*a3;
  Seconds = CMTimeGetSeconds(&time);
  -[TVPPlayer elapsedTimeObserverBlocks](self, "elapsedTimeObserverBlocks");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v14, "objectEnumerator", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v19);
        -[TVPPlayer rate](self, "rate");
        (*(void (**)(uint64_t, id, _BOOL8, double, double))(v20 + 16))(v20, v8, v5, Seconds, v21);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v17);
  }

  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "reportingDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v23, "mediaItem:elapsedTimeDidChangeTo:playbackDateDidChangeTo:dueToTimeJump:", v22, v8, v5, Seconds);
  time = (CMTime)*a3;
  -[TVPPlayer _updateIsLiveForElapsedTime:](self, "_updateIsLiveForElapsedTime:", &time);

}

- (id)_statesThatReturnAVPlayerTime
{
  if (_statesThatReturnAVPlayerTime_onceToken != -1)
    dispatch_once(&_statesThatReturnAVPlayerTime_onceToken, &__block_literal_global_434);
  return (id)_statesThatReturnAVPlayerTime_states;
}

void __42__TVPPlayer__statesThatReturnAVPlayerTime__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("Waiting for sufficient buffer"), CFSTR("Waiting for time control status to be done waiting"), CFSTR("Playing"), CFSTR("Paused"), CFSTR("Scanning using AVPlayer"), CFSTR("Scanning using AVPlayer driven by AVKit"), CFSTR("Scrubbing using progressive jumping"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_statesThatReturnAVPlayerTime_states;
  _statesThatReturnAVPlayerTime_states = v0;

}

- (id)_statesThatReturnSeekTime
{
  if (_statesThatReturnSeekTime_onceToken != -1)
    dispatch_once(&_statesThatReturnSeekTime_onceToken, &__block_literal_global_435);
  return (id)_statesThatReturnSeekTime_states;
}

void __38__TVPPlayer__statesThatReturnSeekTime__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("Waiting for seek"), CFSTR("Scrubbing using progressive jumping waiting for seek"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_statesThatReturnSeekTime_states;
  _statesThatReturnSeekTime_states = v0;

}

- (void)_notifyOfBoundaryCrossingBetweenPreviousTime:(id *)a3 updatedTime:(id *)a4
{
  void *v7;
  _QWORD v8[4];
  CMTimeRange v9;
  CMTime end;
  CMTimeRange time1;
  CMTime start;
  CMTime time2;
  CMTime v14;

  if ((a3->var2 & 0x1D) == 1 && (a4->var2 & 0x1D) == 1)
  {
    memset(&v14, 0, sizeof(v14));
    time1.start = (CMTime)*a3;
    time2 = *(CMTime *)a4;
    CMTimeMinimum(&v14, &time1.start, &time2);
    memset(&time2, 0, sizeof(time2));
    time1.start = (CMTime)*a3;
    start = (CMTime)*a4;
    CMTimeMaximum(&time2, &time1.start, &start);
    memset(&time1, 0, sizeof(time1));
    start = v14;
    end = time2;
    CMTimeRangeFromTimeToTime(&time1, &start, &end);
    -[TVPPlayer boundaryTimeObserverInfos](self, "boundaryTimeObserverInfos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __70__TVPPlayer__notifyOfBoundaryCrossingBetweenPreviousTime_updatedTime___block_invoke;
    v8[3] = &__block_descriptor_80_e52_v32__0__NSUUID_8__TVPBoundaryTimeObserverInfo_16_B24l;
    v9 = time1;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

void __70__TVPPlayer__notifyOfBoundaryCrossingBetweenPreviousTime_updatedTime___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  CMTimeRange v15;
  CMTime time;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "times");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = (_OWORD *)(a1 + 32);
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (v11)
          objc_msgSend(v11, "CMTimeValue");
        else
          memset(&time, 0, sizeof(time));
        v12 = v9[1];
        *(_OWORD *)&v15.start.value = *v9;
        *(_OWORD *)&v15.start.epoch = v12;
        *(_OWORD *)&v15.duration.timescale = v9[2];
        if (CMTimeRangeContainsTime(&v15, &time))
        {
          objc_msgSend(v4, "handler");
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = (void *)v13;
          if (v13)
            (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 1);

          goto LABEL_16;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_16:

}

- (BOOL)_currentPlayerItemCanScanAtRate:(double)a3
{
  BOOL v4;
  void *v6;
  void *v7;
  char v10;

  if (a3 != 0.0 && a3 != 1.0)
  {
    -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a3 > 0.0 && a3 < 1.0)
    {
      v10 = objc_msgSend(v6, "canPlaySlowForward");
    }
    else
    {
      if (a3 >= 1.0 && a3 <= 2.0)
        goto LABEL_27;
      if (a3 <= 2.0)
      {
        if (a3 == -1.0)
        {
          v10 = objc_msgSend(v6, "canPlayReverse");
        }
        else if (a3 <= -1.0 || a3 >= 0.0)
        {
          if (a3 >= -1.0)
          {
LABEL_27:
            v4 = 1;
            goto LABEL_28;
          }
          v10 = objc_msgSend(v6, "canPlayFastReverse");
        }
        else
        {
          v10 = objc_msgSend(v6, "canPlaySlowReverse");
        }
      }
      else
      {
        v10 = objc_msgSend(v6, "canPlayFastForward");
      }
    }
    v4 = v10;
LABEL_28:

    return v4;
  }
  return 0;
}

- (int)_videoTrackIDFromTracks:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    v8 = *MEMORY[0x24BDB1D50];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "assetTrack");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "statusOfValueForKey:error:", CFSTR("mediaType"), 0) == 2)
        {
          objc_msgSend(v10, "mediaType");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqualToString:", v8)
            && objc_msgSend(v10, "statusOfValueForKey:error:", CFSTR("trackID"), 0) == 2)
          {
            v6 = objc_msgSend(v10, "trackID");
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_resetAndReselectAudioOptions
{
  -[TVPPlayer updateAudioSelectionCriteria](self, "updateAudioSelectionCriteria");
  -[TVPPlayer setAudioOptions:](self, "setAudioOptions:", 0);
  -[TVPPlayer setSelectedAudioOption:](self, "setSelectedAudioOption:", 0);
}

- (void)_updateSelectedSubtitleForFilteredOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  TVPSubtitleOption *v10;
  TVPSubtitleOption *v11;
  TVPSubtitleOption *v12;
  id v13;

  v13 = a3;
  -[TVPPlayer selectedSubtitleOption](self, "selectedSubtitleOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "containsObject:", v4) & 1) == 0)
  {
    objc_msgSend(v13, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[TVPSubtitleOption autoSubtitleOption](TVPSubtitleOption, "autoSubtitleOption");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "isEqual:", v6);

      if (v7)
      {
        objc_msgSend(v4, "avMediaSelectionOption");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8 && !objc_msgSend(v8, "hasMediaCharacteristic:", *MEMORY[0x24BDB1CA0]))
        {
          v10 = -[TVPSubtitleOption initWithAVMediaSelectionOption:]([TVPSubtitleOption alloc], "initWithAVMediaSelectionOption:", v9);
        }
        else
        {
          +[TVPSubtitleOption offSubtitleOption](TVPSubtitleOption, "offSubtitleOption");
          v10 = (TVPSubtitleOption *)objc_claimAutoreleasedReturnValue();
        }
        v11 = v10;
        if (objc_msgSend(v13, "containsObject:", v10))
        {
          v12 = v11;

          v5 = v12;
        }

      }
    }
    else
    {
      +[TVPSubtitleOption offSubtitleOption](TVPSubtitleOption, "offSubtitleOption");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[TVPPlayer _setSelectedSubtitleOption:userOverridesSystemSubtitleSettings:](self, "_setSelectedSubtitleOption:userOverridesSystemSubtitleSettings:", v5, 0);

  }
}

- (void)_setSelectedSubtitleOption:(id)a3 userOverridesSystemSubtitleSettings:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v4 = a4;
  v28[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "status") == 1)
  {
    objc_msgSend(v7, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x24BDB1CD8];
    objc_msgSend(v8, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x24BDB1CD8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVPPlayer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("selectedSubtitleOption"));
    if (v6)
    {
      +[TVPSubtitleOption offSubtitleOption](TVPSubtitleOption, "offSubtitleOption");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "isEqual:", v11);

      if (v12
        || (+[TVPSubtitleOption autoSubtitleOption](TVPSubtitleOption, "autoSubtitleOption"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v6, "isEqual:", v13),
            v13,
            v14))
      {
        -[TVPPlayer setTemporarySubtitleOverrideType:](self, "setTemporarySubtitleOverrideType:", 0);
        -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setMediaSelectionCriteria:forMediaCharacteristic:", 0, v9);

        MACaptionAppearancePrefSetDisplayType();
        MACaptionAppearancePrefSetPreferredLanguages();
        objc_msgSend(v7, "selectMediaOptionAutomaticallyInMediaSelectionGroup:", v10);
      }
      else
      {
        objc_msgSend(v6, "languageCodeFromLocale");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v4)
        {
          MACaptionAppearancePrefSetDisplayType();
          MACaptionAppearancePrefSetPreferredLanguages();
          objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "tvp_subtitleLanguageCode");
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v19)
            MACaptionAppearanceAddSelectedLanguage(kMACaptionAppearanceDomainUser, v19);

          v20 = 0;
          v21 = 0;
        }
        else
        {
          if (v16)
          {
            v22 = objc_alloc(MEMORY[0x24BDB2658]);
            v28[0] = v17;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = *MEMORY[0x24BDB1CC8];
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(v22, "initWithPreferredLanguages:preferredMediaCharacteristics:", v23, v24);

          }
          else
          {
            v21 = 0;
          }
          v20 = &unk_24F1735A0;
        }
        -[TVPPlayer setTemporarySubtitleOverrideType:](self, "setTemporarySubtitleOverrideType:", v20);
        -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setMediaSelectionCriteria:forMediaCharacteristic:", v21, v9);

        objc_msgSend(v6, "avMediaSelectionOption");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "selectMediaOption:inMediaSelectionGroup:", v26, v10);

      }
    }
    else
    {
      objc_msgSend(v7, "selectMediaOption:inMediaSelectionGroup:", 0, v10);
    }
    -[TVPPlayer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("selectedSubtitleOption"));

  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentMediaItemForwardPlaybackEndTime
{
  void *v5;
  void *v6;
  void *v7;
  CMTimeEpoch epoch;
  void *v9;
  Float64 v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  CMTimeRange v12;
  CMTime v13;
  CMTimeRange v14;
  __int128 v15;
  CMTimeEpoch v16;

  v15 = 0uLL;
  v16 = 0;
  -[TVPPlayer cachedDuration](self, "cachedDuration");
  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  retstr->var0 = 0;
  if ((~HIDWORD(v15) & 0x11) != 0)
  {
    objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataForwardPlaybackEndTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      CMTimeMakeWithSeconds(&v14.start, v10, 1000000);
      *(_OWORD *)&retstr->var0 = *(_OWORD *)&v14.start.value;
      epoch = v14.start.epoch;
    }
    else
    {
      *(_OWORD *)&retstr->var0 = v15;
      epoch = v16;
    }
  }
  else
  {
    -[TVPPlayer cachedSeekableTimeRanges](self, "cachedSeekableTimeRanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v14, 0, sizeof(v14));
    +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:](TVPTimeRange, "forwardmostCMTimeRangeInCMTimeRanges:", v7);
    v12 = v14;
    CMTimeRangeGetEnd(&v13, &v12);
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&v13.value;
    epoch = v13.epoch;
  }
  retstr->var3 = epoch;

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_currentMediaItemReversePlaybackEndTime
{
  void *v5;
  void *v6;
  void *v7;
  Float64 v8;
  uint64_t v9;
  int64_t v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  char v16;

  -[TVPPlayer currentMediaItem](self, "currentMediaItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  retstr->var0 = 0;
  -[TVPPlayer cachedDuration](self, "cachedDuration");
  if ((v16 & 1) != 0)
  {
    -[TVPPlayer cachedDuration](self, "cachedDuration");
    if ((v15 & 0x10) != 0)
    {
      -[TVPPlayer cachedSeekableTimeRanges](self, "cachedSeekableTimeRanges");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0u;
      v14 = 0u;
      v12 = 0u;
      +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:](TVPTimeRange, "forwardmostCMTimeRangeInCMTimeRanges:", v7);
      goto LABEL_7;
    }
  }
  objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataReversePlaybackEndTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    CMTimeMakeWithSeconds((CMTime *)&v12, v8, 1000000);
LABEL_7:
    *(_OWORD *)&retstr->var0 = v12;
    v10 = v13;
    goto LABEL_8;
  }
  v9 = MEMORY[0x24BDC0D88];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x24BDC0D88];
  v10 = *(_QWORD *)(v9 + 16);
LABEL_8:
  retstr->var3 = v10;

  return result;
}

- (BOOL)_isPlaybackLikelyToKeepUp
{
  void *v3;
  BOOL v4;
  void *v5;

  -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isPlaybackLikelyToKeepUp") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_msgSend(v5, "isPlaybackBufferFull") & 1) != 0
      || -[TVPPlayer sceneCompletelyBuffered](self, "sceneCompletelyBuffered");

  }
  return v4;
}

- (id)playbackErrorFromError:(id)a3 forMediaItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  id *v21;
  uint64_t *v22;
  void *v23;
  int v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  void *v29;
  char v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  unsigned int v41;
  void *v42;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  id v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  _QWORD v74[2];

  v74[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD1308])
      && (objc_msgSend(v6, "code") == -1009 || objc_msgSend(v6, "code") == -1018))
    {

      goto LABEL_8;
    }
    objc_msgSend(v6, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SSErrorDomain")) & 1) != 0)
    {
      v10 = objc_msgSend(v6, "code");

      if (v10 == 110)
      {
LABEL_8:
        v73 = *MEMORY[0x24BDD1398];
        v74[0] = v6;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "mutableCopy");

        objc_msgSend(v6, "userInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BDD1330]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          if (objc_msgSend(v14, "integerValue"))
          {
            if (objc_msgSend(v14, "integerValue") == 2)
            {
LABEL_38:
              v36 = 834;
              goto LABEL_46;
            }
            goto LABEL_35;
          }
LABEL_45:
          v41 = objc_msgSend(v7, "hasTrait:", CFSTR("TVPMediaItemTraitCellularPlaybackProhibited"));
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v42, CFSTR("TVPlaybackCellularPlaybackProhibitedErrorReasonKey"));

          v36 = 824;
          goto LABEL_46;
        }
        +[TVPReachabilityMonitor sharedInstance](TVPReachabilityMonitor, "sharedInstance");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "networkType") == 2)
        {
          if (!-[TVPPlayer allowsCellularUsage](self, "allowsCellularUsage"))
          {

            goto LABEL_43;
          }
          v30 = objc_msgSend(v7, "hasTrait:", CFSTR("TVPMediaItemTraitCellularPlaybackProhibited"));

          if ((v30 & 1) != 0)
          {
LABEL_43:
            v40 = sPlayerLogObject;
            if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_228A4E000, v40, OS_LOG_TYPE_DEFAULT, "Network type is cellular and cellular playback is prohibited.  Assuming internet not connected error occurred due to cellular policy", buf, 2u);
            }
            goto LABEL_45;
          }
        }
        else
        {

        }
        if (!-[TVPPlayer allowsConstrainedNetworkUsage](self, "allowsConstrainedNetworkUsage"))
        {
          v37 = sPlayerLogObject;
          if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_228A4E000, v37, OS_LOG_TYPE_DEFAULT, "Constrained network playback is prohibited. Assuming internet not connected error occurred due to constrained network policy", buf, 2u);
          }
          goto LABEL_38;
        }
LABEL_35:
        v36 = 808;
LABEL_46:
        v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), v36, v12);

        goto LABEL_47;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDB1C58]);

    if (v17)
    {
      v15 = v6;
      if (objc_msgSend(v15, "code") == -11835)
      {
        -[TVPPlayer currentMediaItem](self, "currentMediaItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "hasTrait:", CFSTR("TVPMediaItemTraitIsHomeSharingContent"));

        if (v19)
        {
          v71 = *MEMORY[0x24BDD1398];
          v72 = v15;
          v20 = (void *)MEMORY[0x24BDBCE70];
          v21 = &v72;
          v22 = &v71;
        }
        else
        {
          v69 = *MEMORY[0x24BDD1398];
          v70 = v15;
          v20 = (void *)MEMORY[0x24BDBCE70];
          v21 = &v70;
          v22 = &v69;
        }
        objc_msgSend(v20, "dictionaryWithObjects:forKeys:count:", v21, v22, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 811, v38);

LABEL_41:
        v15 = v39;
        goto LABEL_47;
      }
      if (objc_msgSend(v15, "code") == -11807)
        goto LABEL_31;
      objc_msgSend(v15, "userInfo");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *MEMORY[0x24BDD1398];
      objc_msgSend(v31, "objectForKey:", *MEMORY[0x24BDD1398]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "code");

      if (v34 == -12541)
      {
LABEL_31:
        v35 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 825, 0);

      }
      else
      {
        if (objc_msgSend(v15, "code") == -11868)
        {
          v44 = objc_alloc(MEMORY[0x24BDD1540]);
          v67 = v32;
          v68 = v15;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v44;
          v47 = 826;
        }
        else
        {
          if (objc_msgSend(v15, "code") == -11870)
          {
            v48 = objc_alloc(MEMORY[0x24BDD1540]);
            v65 = v32;
            v66 = v15;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (void *)objc_msgSend(v48, "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 827, v49);

            -[TVPPlayer currentMediaItem](self, "currentMediaItem");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v48) = objc_opt_respondsToSelector();

            if ((v48 & 1) != 0)
            {
              -[TVPPlayer currentMediaItem](self, "currentMediaItem");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "replacementErrorForPlaybackError:", v39);
              v52 = (void *)objc_claimAutoreleasedReturnValue();

              if (v52 && v52 != v39)
              {
                v53 = sPlayerLogObject;
                if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v62 = v39;
                  v63 = 2112;
                  v64 = v52;
                  _os_log_impl(&dword_228A4E000, v53, OS_LOG_TYPE_DEFAULT, "Media item replaced original error %@ with %@", buf, 0x16u);
                }
                v54 = v52;

                v39 = v54;
              }

            }
            goto LABEL_41;
          }
          objc_msgSend(v15, "userInfo");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "objectForKey:", v32);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = objc_msgSend(v56, "code");

          if ((v57 & 0xFFFFFFFFFFFFFFFBLL) != 0xFFFFFFFFFFFFBCB8)
            goto LABEL_47;
          v58 = objc_alloc(MEMORY[0x24BDD1540]);
          v59 = v32;
          v60 = v15;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v58;
          v47 = 830;
        }
        v35 = objc_msgSend(v46, "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), v47, v45);

      }
      v15 = (id)v35;
    }
    else
    {
      -[TVPPlayer currentMediaItem](self, "currentMediaItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_opt_respondsToSelector();

      v15 = v6;
      if ((v24 & 1) != 0)
      {
        -[TVPPlayer currentMediaItem](self, "currentMediaItem");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "replacementErrorForPlaybackError:", v15);
        v26 = (id)objc_claimAutoreleasedReturnValue();

        if (v26 && v26 != v15)
        {
          v27 = sPlayerLogObject;
          if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v62 = v15;
            v63 = 2112;
            v64 = v26;
            _os_log_impl(&dword_228A4E000, v27, OS_LOG_TYPE_DEFAULT, "Media item replaced original error %@ with %@", buf, 0x16u);
          }
          v28 = v26;

          v15 = v28;
        }

      }
    }
  }
  else
  {
    v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 801, 0);
  }
LABEL_47:

  return v15;
}

- (id)beginCoordinatedPlaybackSuspensionWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playbackCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "beginSuspensionForReason:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Beginning coordinated playback suspension: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    v10 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_228A4E000, v10, OS_LOG_TYPE_DEFAULT, "Unable to begin playback suspension because AVPlayer has not been created yet", (uint8_t *)&v12, 2u);
    }
    v8 = 0;
  }

  return v8;
}

- (void)endCoordinatedPlaybackSuspension:(id)a3
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = sPlayerLogObject;
  v5 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_228A4E000, v4, OS_LOG_TYPE_DEFAULT, "Ending coordinated playback suspension: %@", (uint8_t *)&v6, 0xCu);
    }
    objc_msgSend(v3, "end");
  }
  else if (v5)
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_228A4E000, v4, OS_LOG_TYPE_DEFAULT, "Unable to end playback suspension because suspension is nil", (uint8_t *)&v6, 2u);
  }

}

- (void)_enqueueAsyncDelegateOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[TVPPlayer asyncDelegateOperations](self, "asyncDelegateOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[TVPPlayer asyncDelegateOperations](self, "asyncDelegateOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 == 1)
  {
    -[TVPPlayer setAsyncDelegateInProgress:](self, "setAsyncDelegateInProgress:", 1);
    -[TVPPlayer _processNextAsyncDelegateOperation](self, "_processNextAsyncDelegateOperation");
  }
}

- (void)_processNextAsyncDelegateOperation
{
  uint64_t v2;
  _QWORD v3[6];

  v2 = sTVPPlaybackPerfToken++;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__TVPPlayer__processNextAsyncDelegateOperation__block_invoke;
  v3[3] = &unk_24F15BF70;
  v3[4] = self;
  v3[5] = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

void __47__TVPPlayer__processNextAsyncDelegateOperation__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(void);
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "asyncDelegateOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "asyncDelegateOperations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "block");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v8, "block");
      v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v7[2]();

    }
  }
  else
  {
    objc_msgSend(v4, "setAsyncDelegateInProgress:", 0);
  }
}

- (id)_currentDateFromPlayerItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "status") == 1)
  {
    objc_msgSend(v4, "currentDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_logAccessLogEvents
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  NSObject *v8;
  void *v9;
  double v10;
  void *v11;
  NSObject *v12;
  void *v13;
  double v14;
  void *v15;
  NSObject *v16;
  void *v17;
  double v18;
  void *v19;
  NSObject *v20;
  void *v21;
  double v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[TVPPlayer accessLog](self, "accessLog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "events");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "observedBitrate");
  if (v6 > 0.0)
  {
    v7 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      objc_msgSend(v5, "observedBitrate");
      -[TVPPlayer _bitRateString:](self, "_bitRateString:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412290;
      v27 = v9;
      _os_log_impl(&dword_228A4E000, v8, OS_LOG_TYPE_DEFAULT, "network bandwidth: %@", (uint8_t *)&v26, 0xCu);

    }
  }
  objc_msgSend(v5, "averageVideoBitrate");
  if (v10 > 0.0)
  {
    v11 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      objc_msgSend(v5, "averageVideoBitrate");
      -[TVPPlayer _bitRateString:](self, "_bitRateString:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412290;
      v27 = v13;
      _os_log_impl(&dword_228A4E000, v12, OS_LOG_TYPE_DEFAULT, "average bitrate video: %@", (uint8_t *)&v26, 0xCu);

    }
  }
  objc_msgSend(v5, "averageAudioBitrate");
  if (v14 > 0.0)
  {
    v15 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v5, "averageAudioBitrate");
      -[TVPPlayer _bitRateString:](self, "_bitRateString:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412290;
      v27 = v17;
      _os_log_impl(&dword_228A4E000, v16, OS_LOG_TYPE_DEFAULT, "average bitrate audio: %@", (uint8_t *)&v26, 0xCu);

    }
  }
  objc_msgSend(v5, "indicatedBitrate");
  if (v18 > 0.0)
  {
    v19 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      objc_msgSend(v5, "indicatedBitrate");
      -[TVPPlayer _bitRateString:](self, "_bitRateString:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412290;
      v27 = v21;
      _os_log_impl(&dword_228A4E000, v20, OS_LOG_TYPE_DEFAULT, "indicated bitrate peak: %@", (uint8_t *)&v26, 0xCu);

    }
  }
  objc_msgSend(v5, "indicatedAverageBitrate");
  if (v22 > 0.0)
  {
    v23 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v24 = v23;
      objc_msgSend(v5, "indicatedAverageBitrate");
      -[TVPPlayer _bitRateString:](self, "_bitRateString:");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412290;
      v27 = v25;
      _os_log_impl(&dword_228A4E000, v24, OS_LOG_TYPE_DEFAULT, "indicated bitrate avg: %@", (uint8_t *)&v26, 0xCu);

    }
  }

}

- (id)_bitRateString:(double)a3
{
  double v3;
  const __CFString *v4;

  v3 = a3 / 1000.0;
  if (a3 / 1000.0 <= 1.0)
  {
    v4 = CFSTR("bps");
  }
  else
  {
    a3 = v3 / 1000.0;
    if (v3 / 1000.0 <= 1.0)
    {
      v4 = CFSTR("kbps");
      a3 = v3;
    }
    else
    {
      v4 = CFSTR("Mbps");
    }
  }
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.2f%@"), *(_QWORD *)&a3, v4);
}

- (id)_descriptionForVideoResolutionClass:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("TVPVideoResolutionClassUnknown");
  else
    return off_24F15D130[a3 - 1];
}

- (BOOL)_currentPlayerItemContainsDates
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  char v8;
  char v9;

  -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "status") == 1)
  {
    -[TVPPlayer cachedDuration](self, "cachedDuration");
    if ((v9 & 1) != 0 && (-[TVPPlayer cachedDuration](self, "cachedDuration"), (v8 & 0x10) != 0))
    {
      v6 = 1;
    }
    else
    {
      -[TVPPlayer currentPlayerItem](self, "currentPlayerItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "currentDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5 != 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4)
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v6 = a2;
  dispatch_get_global_queue(21, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke_2;
  block[3] = &unk_24F15C760;
  v12 = a4;
  v10 = v6;
  v8 = v6;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
}

void __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  if (*(_BYTE *)(a1 + 48))
  {
    v2 = *(void **)(a1 + 32);
    if (v2)
    {
      objc_msgSend(v2, "uiImage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_alloc_init(MEMORY[0x24BDF6AA0]);
      objc_msgSend(v4, "setPreferredRange:", 1);
      v5 = objc_alloc(MEMORY[0x24BDF6A98]);
      objc_msgSend(v3, "size");
      v6 = (void *)objc_msgSend(v5, "initWithSize:format:", v4);
      objc_msgSend(*(id *)(a1 + 32), "imageType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = MEMORY[0x24BDAC760];
      if (!v7)
      {
        v10 = 0;
        v13 = 0;
LABEL_12:
        block[0] = v8;
        block[1] = 3221225472;
        block[2] = __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke_5;
        block[3] = &unk_24F15C738;
        objc_copyWeak(&v19, (id *)(a1 + 40));
        v17 = v13;
        v18 = v10;
        v14 = v10;
        v15 = v13;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

        objc_destroyWeak(&v19);
        return;
      }
      objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "conformsToType:", *MEMORY[0x24BDF84F8]))
      {
        v10 = (id)*MEMORY[0x24BDC0BF0];
        v22[0] = v8;
        v22[1] = 3221225472;
        v22[2] = __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke_3;
        v22[3] = &unk_24F15C710;
        v11 = &v23;
        v23 = v3;
        objc_msgSend(v6, "PNGDataWithActions:", v22);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v9, "conformsToType:", *MEMORY[0x24BDF8438]))
        {
          v10 = 0;
          v13 = 0;
          goto LABEL_11;
        }
        v10 = (id)*MEMORY[0x24BDC0BE0];
        v20[0] = v8;
        v20[1] = 3221225472;
        v20[2] = __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke_4;
        v20[3] = &unk_24F15C710;
        v11 = &v21;
        v21 = v3;
        objc_msgSend(v6, "JPEGDataWithCompressionQuality:actions:", v20, 1.0);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v13 = (void *)v12;

      v8 = MEMORY[0x24BDAC760];
LABEL_11:

      goto LABEL_12;
    }
  }
}

uint64_t __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

uint64_t __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

void __59__TVPPlayer__populatePlayerItem_withMetadataFromMediaItem___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v3 = objc_alloc_init(MEMORY[0x24BDB25B8]);
    if (objc_msgSend(*(id *)(a1 + 32), "length"))
    {
      objc_msgSend(v3, "setIdentifier:", *MEMORY[0x24BDB1D68]);
      objc_msgSend(v3, "setExtendedLanguageTag:", CFSTR("und"));
      objc_msgSend(v3, "setValue:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v3, "setDataType:", *(_QWORD *)(a1 + 40));
      v4 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(v7, "externalMetadata");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "arrayWithArray:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "addObject:", v3);
      objc_msgSend(v7, "setExternalMetadata:", v6);
      objc_msgSend(v7, "setPosterProxy:", 0);

    }
    WeakRetained = v7;
  }

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  char v14;

  v7 = a2;
  v8 = a4;
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "stateMachine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2;
    v11[3] = &unk_24F15C788;
    v13 = v7;
    v14 = a3;
    v12 = v8;
    objc_msgSend(v10, "executeBlockAfterCurrentStateTransition:", v11);

  }
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5(uint64_t a1, void *a2, char a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  _QWORD v8[4];
  id v9;
  char v10;

  v5 = a2;
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "stateMachine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6;
    v8[3] = &unk_24F15C7D8;
    v9 = v5;
    v10 = a3;
    objc_msgSend(v7, "executeBlockAfterCurrentStateTransition:", v8);

  }
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7(uint64_t a1, void *a2, char a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  char v18;

  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "stateMachine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_8;
    v14[3] = &unk_24F15C828;
    v17 = v9;
    v18 = a3;
    v15 = v10;
    v16 = v11;
    objc_msgSend(v13, "executeBlockAfterCurrentStateTransition:", v14);

  }
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9(uint64_t a1, float a2, Float64 a3)
{
  id *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  float v10;
  float v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  void *v16;
  double v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  double v23;
  id v24;
  CMTime v25;
  uint8_t buf[4];
  double v27;
  __int16 v28;
  Float64 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "AVQueuePlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v18 = sPlayerLogObject;
    if (!os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v19 = "Unable to set rate since AVQueuePlayer is nil";
    v20 = v18;
    v21 = 2;
LABEL_11:
    _os_log_impl(&dword_228A4E000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    return;
  }
  v8 = objc_loadWeakRetained(v5);
  objc_msgSend(v8, "AVQueuePlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rate");
  v11 = v10;

  if (v11 == a2)
  {
    v22 = sPlayerLogObject;
    if (!os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 134217984;
    v27 = a2;
    v19 = "Not setting rate to %f since it's already the player's rate";
    v20 = v22;
    v21 = 12;
    goto LABEL_11;
  }
  v12 = objc_loadWeakRetained(v5);
  objc_msgSend(v12, "setModifyingAVPlayerRate:", 1);

  v13 = sPlayerLogObject;
  v14 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
  if (a3 <= 0.0)
  {
    if (v14)
    {
      *(_DWORD *)buf = 134217984;
      v27 = a2;
      _os_log_impl(&dword_228A4E000, v13, OS_LOG_TYPE_DEFAULT, "Setting AVPlayer rate to %f", buf, 0xCu);
    }
    v15 = objc_loadWeakRetained(v5);
    objc_msgSend(v15, "AVQueuePlayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v23 = a2;
    objc_msgSend(v16, "setRate:", v23);
  }
  else
  {
    if (v14)
    {
      *(_DWORD *)buf = 134218240;
      v27 = a2;
      v28 = 2048;
      v29 = a3;
      _os_log_impl(&dword_228A4E000, v13, OS_LOG_TYPE_DEFAULT, "Setting AVPlayer rate to %f with volume ramp duration of %f", buf, 0x16u);
    }
    v15 = objc_loadWeakRetained(v5);
    objc_msgSend(v15, "AVQueuePlayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeWithSeconds(&v25, a3, 1000000);
    *(float *)&v17 = a2;
    objc_msgSend(v16, "setRate:withVolumeRampDuration:", &v25, v17);
  }

  v24 = objc_loadWeakRetained(v5);
  objc_msgSend(v24, "setModifyingAVPlayerRate:", 0);

}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_523(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateMediaRemoteManager");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "_updateAVPlayerActionAtItemEnd");

  v4 = objc_loadWeakRetained(v1);
  +[TVPPlaybackState playing](TVPPlaybackState, "playing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "rateUsedForPlayback");
  objc_msgSend(v4, "_setState:updatedRate:notifyListeners:", v5, 1);

  return CFSTR("Playing");
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_525(uint64_t a1, CMTime *a2, CMTime *a3, void *a4, double a5)
{
  id v9;
  id v10;
  void *v11;
  id WeakRetained;
  void *v13;
  id *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD *v19;
  id v20;
  void *v21;
  void *v22;
  void (*v23)(_QWORD *, CMTime *, void *);
  void (**v24)(_QWORD, double);
  void *v25;
  id *v26;
  id v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  _QWORD *v37;
  id v38;
  void *v39;
  void *v40;
  void (*v41)(_QWORD *, CMTime *, void *);
  id v42;
  id v43;
  void *v44;
  int v45;
  id v46;
  void *v47;
  Float64 Seconds;
  CMTime v49;
  CMTime time1;
  CMTime time;

  v9 = a4;
  if (a5 <= 0.0)
  {
    if (a5 < 0.0)
    {
      memset(&time, 0, sizeof(time));
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      v13 = WeakRetained;
      if (WeakRetained)
        objc_msgSend(WeakRetained, "_currentMediaItemReversePlaybackEndTime");
      else
        memset(&time, 0, sizeof(time));

      time1 = *a2;
      v49 = time;
      if (CMTimeCompare(&time1, &v49) <= 0)
      {
LABEL_9:
        *a2 = time;
        v14 = (id *)(a1 + 32);
        v15 = objc_loadWeakRetained(v14);
        objc_msgSend(v15, "AVKitExternalImageScanningUpdateBlock");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = objc_loadWeakRetained(v14);
          time = *a2;
          objc_msgSend(v17, "setLastTimeSentToAVKitImageHandler:", &time);

          v18 = objc_loadWeakRetained(v14);
          objc_msgSend(v18, "AVKitExternalImageScanningUpdateBlock");
          v19 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          v20 = objc_loadWeakRetained(v14);
          objc_msgSend(v20, "externalImagePlayer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "currentImage");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void (*)(_QWORD *, CMTime *, void *))v19[2];
          time = *a2;
          v23(v19, &time, v22);

        }
        v24 = (void (**)(_QWORD, double))objc_loadWeakRetained(v14);
        objc_msgSend(v24, "stateMachine");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "postEvent:", CFSTR("Hit beginning or end"));

        goto LABEL_26;
      }
    }
  }
  else
  {
    memset(&time, 0, sizeof(time));
    v10 = objc_loadWeakRetained((id *)(a1 + 32));
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "_currentMediaItemForwardPlaybackEndTime");
    else
      memset(&time, 0, sizeof(time));

    time1 = *a2;
    v49 = time;
    if ((CMTimeCompare(&time1, &v49) & 0x80000000) == 0)
      goto LABEL_9;
  }
  v26 = (id *)(a1 + 32);
  v27 = objc_loadWeakRetained(v26);
  time = *a3;
  time1 = *a2;
  objc_msgSend(v27, "_notifyOfBoundaryCrossingBetweenPreviousTime:updatedTime:", &time, &time1);

  time = *a2;
  v28 = floor(CMTimeGetSeconds(&time));
  time = *a3;
  if (v28 != floor(CMTimeGetSeconds(&time)))
  {
    v29 = objc_loadWeakRetained(v26);
    objc_msgSend(v29, "currentInterstitialCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    time = *a2;
    objc_msgSend(v30, "interstitialForTime:", CMTimeGetSeconds(&time));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      v32 = objc_loadWeakRetained(v26);
      time = *a2;
      objc_msgSend(v32, "_notifyListenersOfElapsedTimeChange:playbackDate:dueToTimeJump:", &time, v9, 0);

    }
    v33 = objc_loadWeakRetained(v26);
    objc_msgSend(v33, "AVKitExternalImageScanningUpdateBlock");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = objc_loadWeakRetained(v26);
      time = *a2;
      objc_msgSend(v35, "setLastTimeSentToAVKitImageHandler:", &time);

      v36 = objc_loadWeakRetained(v26);
      objc_msgSend(v36, "AVKitExternalImageScanningUpdateBlock");
      v37 = (_QWORD *)objc_claimAutoreleasedReturnValue();
      v38 = objc_loadWeakRetained(v26);
      objc_msgSend(v38, "externalImagePlayer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "currentImage");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void (*)(_QWORD *, CMTime *, void *))v37[2];
      time = *a2;
      v41(v37, &time, v40);

    }
  }
  v42 = objc_loadWeakRetained(v26);
  objc_msgSend(v42, "highFrequencyElapsedTimeObserverBlock");
  v24 = (void (**)(_QWORD, double))objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v43 = objc_loadWeakRetained(v26);
    objc_msgSend(v43, "currentMediaItem");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "hasTrait:", CFSTR("TVPMediaItemTraitIsScene"));

    if (v45)
    {
      v46 = objc_loadWeakRetained(v26);
      v47 = v46;
      if (v46)
      {
        time1 = *a2;
        objc_msgSend(v46, "_clampedSceneTimeForPlayerTime:", &time1);
      }
      else
      {
        memset(&time, 0, sizeof(time));
      }
      *a2 = time;

    }
    time = *a2;
    Seconds = CMTimeGetSeconds(&time);
    v24[2](v24, Seconds);
  }
LABEL_26:

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_527(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v8 = CFSTR("TVPPlayerStillImageKey");
    v9[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("TVPPlayerStillImageDidChangeNotification"), WeakRetained, v5);

}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_529(uint64_t a1, uint64_t a2, char a3, int a4, double a5)
{
  NSObject *v8;
  __CFString *v9;
  id *v13;
  id WeakRetained;
  int v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  TVPProgressiveJumpingScrubber *v23;
  double v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  TVPExternalImagePlayer *v30;
  id v31;
  void *v32;
  id v33;
  int v34;
  void *v35;
  id v36;
  TVPExternalImagePlayer *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  __CFString *v46;
  float v48;
  id v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t);
  void *v54;
  id v55;
  char v56;
  __int128 v57;
  uint64_t v58;
  uint8_t buf[16];
  uint64_t v60;

  if (a5 == 0.0 || a5 == 1.0)
  {
    v8 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring scan request because requested rate is 0.0 or 1.0", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "currentState");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (id *)(a1 + 64);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v15 = objc_msgSend(WeakRetained, "currentMediaItemHasVideoContent");

    if (!v15)
    {
      v23 = objc_alloc_init(TVPProgressiveJumpingScrubber);
      if (a5 <= 0.0)
        v24 = -1.0;
      else
        v24 = 1.0;
      v25 = objc_loadWeakRetained((id *)(a1 + 64));
      -[TVPProgressiveJumpingScrubber setPlayer:](v23, "setPlayer:", v25);

      v26 = objc_loadWeakRetained(v13);
      objc_msgSend(v26, "setProgressiveJumpingScrubber:", v23);

      -[TVPProgressiveJumpingScrubber startScrubWithRate:](v23, "startScrubWithRate:", v24);
      v27 = objc_loadWeakRetained(v13);
      +[TVPPlaybackState scanning](TVPPlaybackState, "scanning");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "_setState:updatedRate:notifyListeners:", v28, 1, v24);

      v9 = CFSTR("Scrubbing using progressive jumping");
      return v9;
    }
    v16 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v16, "AVQueuePlayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActionAtItemEnd:", 1);

    if ((a3 & 1) == 0)
    {
      v18 = objc_loadWeakRetained((id *)(a1 + 64));
      if ((objc_msgSend(v18, "_currentPlayerItemCanScanAtRate:", a5) & 1) != 0)
      {
        v19 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v19, "currentInterstitialCollection");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          v21 = sPlayerLogObject;
          v22 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
          if ((a4 & 1) != 0)
          {
            if (v22)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_228A4E000, v21, OS_LOG_TYPE_DEFAULT, "In _scanWithRateFromTime, not setting player rate since AVKit will do it for us", buf, 2u);
            }
            v9 = CFSTR("Scanning using AVPlayer driven by AVKit");
          }
          else
          {
            if (v22)
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_228A4E000, v21, OS_LOG_TYPE_DEFAULT, "In _scanWithRateFromTime, calling _setAVPlayerRate", buf, 2u);
            }
            v48 = a5;
            (*(void (**)(float, double))(*(_QWORD *)(a1 + 40) + 16))(v48, 0.0);
            v9 = CFSTR("Scanning using AVPlayer");
          }
          v49 = objc_loadWeakRetained((id *)(a1 + 64));
          +[TVPPlaybackState scanning](TVPPlaybackState, "scanning");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "_setState:updatedRate:notifyListeners:", v50, 1, a5);

          return v9;
        }
      }
      else
      {

      }
    }
    v29 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v29, "externalImagePlayer");
    v30 = (TVPExternalImagePlayer *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      v31 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v31, "currentPlayerItem");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      *(_OWORD *)buf = *MEMORY[0x24BDC0D88];
      v60 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
      v33 = objc_loadWeakRetained((id *)(a1 + 64));
      v34 = objc_msgSend(v33, "_currentPlayerItemContainsDates");

      if (v34)
      {
        if (v32)
        {
          objc_msgSend(v32, "currentTime");
        }
        else
        {
          v57 = 0uLL;
          v58 = 0;
        }
        *(_OWORD *)buf = v57;
        v60 = v58;
        v36 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v36, "_currentDateFromPlayerItem:", v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v35 = 0;
      }
      v37 = [TVPExternalImagePlayer alloc];
      v38 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v38, "currentMediaItem");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = *(_OWORD *)buf;
      v58 = v60;
      v30 = -[TVPExternalImagePlayer initWithMediaItem:referenceTime:forDate:](v37, "initWithMediaItem:referenceTime:forDate:", v39, &v57, v35);

      -[TVPExternalImagePlayer setElapsedTimeUpdateBlock:](v30, "setElapsedTimeUpdateBlock:", *(_QWORD *)(a1 + 48));
      -[TVPExternalImagePlayer setImageUpdateBlock:](v30, "setImageUpdateBlock:", *(_QWORD *)(a1 + 56));
      v40 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v40, "setExternalImagePlayer:", v30);

      v41 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v41, "AVQueuePlayer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setResourceConservationLevelWhilePaused:", 1);

      v51 = MEMORY[0x24BDAC760];
      v52 = 3221225472;
      v53 = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_531;
      v54 = &unk_24F15C7D8;
      v56 = a4;
      v43 = *(void **)(a1 + 32);
      v55 = *(id *)(a1 + 40);
      objc_msgSend(v43, "executeBlockAfterCurrentStateTransition:", &v51);

    }
    *(_OWORD *)buf = *(_OWORD *)a2;
    v60 = *(_QWORD *)(a2 + 16);
    -[TVPExternalImagePlayer setElapsedTime:](v30, "setElapsedTime:", buf, v51, v52, v53, v54);
    -[TVPExternalImagePlayer setRate:](v30, "setRate:", a5);
    v44 = objc_loadWeakRetained((id *)(a1 + 64));
    +[TVPPlaybackState scanning](TVPPlaybackState, "scanning");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_setState:updatedRate:notifyListeners:", v45, 1, a5);

    v46 = CFSTR("Scanning using external images");
    if (a4)
      v46 = CFSTR("Scanning using external images driven by AVKit");
    v9 = v46;

  }
  return v9;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_531(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = sPlayerLogObject;
  v4 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_228A4E000, v3, OS_LOG_TYPE_DEFAULT, "In _scanWithRateFromTime, not setting player rate during external image player startup since AVKit will do it for us", v5, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v3, OS_LOG_TYPE_DEFAULT, "In _scanWithRateFromTime, calling _setAVPlayerRate during external image player startup", buf, 2u);
    }
    (*(void (**)(float, double))(*(_QWORD *)(a1 + 32) + 16))(0.0, 0.0);
  }
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_534(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  double v12;
  Float64 v13;
  id v14;
  id v15;
  CMTime v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    goto LABEL_8;
  }
  objc_msgSend(WeakRetained, "cachedDuration");
  if ((v23 & 0x100000000) == 0)
  {
LABEL_8:

    goto LABEL_9;
  }
  v4 = objc_loadWeakRetained(v1);
  v5 = v4;
  if (!v4)
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;

    goto LABEL_8;
  }
  objc_msgSend(v4, "cachedDuration");

  if ((v20 & 0x1000000000) != 0)
  {
    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "setStartDate:", 0);

    v7 = objc_loadWeakRetained(v1);
    v17 = *MEMORY[0x24BDC0D88];
    v18 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    objc_msgSend(v7, "setStartTime:", &v17);
    goto LABEL_13;
  }
LABEL_9:
  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "playbackDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_loadWeakRetained(v1);
  v10 = v9;
  if (v7)
  {
    objc_msgSend(v9, "setStartDate:", v7);

    v11 = objc_loadWeakRetained(v1);
    v17 = *MEMORY[0x24BDC0D88];
    v18 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    objc_msgSend(v11, "setStartTime:", &v17);
  }
  else
  {
    objc_msgSend(v9, "elapsedTime");
    v13 = v12;

    v14 = objc_loadWeakRetained(v1);
    CMTimeMakeWithSeconds(&v16, v13, 1000000);
    objc_msgSend(v14, "setStartTime:", &v16);

    v11 = objc_loadWeakRetained(v1);
    objc_msgSend(v11, "setStartDate:", 0);
  }

LABEL_13:
  v15 = objc_loadWeakRetained(v1);
  objc_msgSend(v15, "setStartPosition:", 0.0);

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_535(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setStartDate:", 0);

  v3 = objc_loadWeakRetained(v1);
  v8 = *MEMORY[0x24BDC0D88];
  v7 = v8;
  v9 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v4 = v9;
  objc_msgSend(v3, "setStartTime:", &v8);

  v5 = objc_loadWeakRetained(v1);
  v8 = v7;
  v9 = v4;
  objc_msgSend(v5, "setStartingSeekPrecision:", &v8);

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "setStartPosition:", 0.0);

}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_536(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  id v35;
  void *v36;
  NSObject *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  double v44;
  double v45;
  id v46;
  id v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  double v55;
  Float64 v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  CMTimeEpoch v61;
  int32_t v62;
  __int128 v63;
  void *v64;
  id *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  NSObject *v76;
  void *v77;
  float v78;
  void *v79;
  char v80;
  void **p_vtable;
  NSObject *v82;
  _BOOL4 v83;
  __CFString *v84;
  id v85;
  char v86;
  id v87;
  double v88;
  double v89;
  double v90;
  double v91;
  id v92;
  void *v93;
  void *v94;
  Float64 v95;
  void *v96;
  void *v97;
  Float64 v98;
  uint64_t v99;
  NSObject *v100;
  NSObject *v101;
  id v102;
  float v103;
  float v104;
  NSObject *v105;
  const char *v106;
  void *v107;
  float v108;
  double v109;
  uint64_t v110;
  id *v111;
  id v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  int v118;
  id v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t i;
  uint64_t v125;
  id v126;
  void *v127;
  void *v128;
  id v129;
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
  __int128 v141;
  void *v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  CMTime time;
  CMTime time2;
  CMTime v149;
  CMTime v150;
  _BYTE v151[128];
  CMTime buf;
  void *v153;
  uint64_t v154;

  v154 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "playlist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a3)
    objc_msgSend(v8, "nextMediaItem");
  else
    objc_msgSend(v8, "currentMediaItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v11 = objc_loadWeakRetained(v6);
  objc_msgSend(v11, "playerItemFromCacheManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_loadWeakRetained(v6);
    objc_msgSend(v13, "playerItemFromCacheManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_loadWeakRetained(v6);
    objc_msgSend(v15, "setPlayerItemFromCacheManager:", 0);

  }
  else
  {
    v14 = (void *)objc_msgSend(v5, "newPlayerItem");
  }
  v16 = objc_loadWeakRetained(v6);
  objc_msgSend(v16, "_populatePlayerItem:withMetadataFromMediaItem:", v14, v10);

  v17 = objc_loadWeakRetained(v6);
  objc_msgSend(v17, "maximumBitRate");
  v19 = v18;

  if (v19 != 3.40282347e38)
  {
    v20 = objc_loadWeakRetained(v6);
    objc_msgSend(v20, "maximumBitRate");
    objc_msgSend(v14, "setPreferredPeakBitRate:");

  }
  v21 = objc_loadWeakRetained(v6);
  objc_msgSend(v21, "preferredMaximumResolution");
  v23 = v22;
  v25 = v24;
  v27 = *MEMORY[0x24BDBF148];
  v26 = *(double *)(MEMORY[0x24BDBF148] + 8);

  if (v23 != v27 || v25 != v26)
  {
    v28 = objc_loadWeakRetained(v6);
    objc_msgSend(v28, "preferredMaximumResolution");
    objc_msgSend(v14, "setPreferredMaximumResolution:");

  }
  v29 = objc_loadWeakRetained(v6);
  objc_msgSend(v29, "preferredMaximumResolutionForExpensiveNetworks");
  v31 = v30;
  v33 = v32;

  if (v31 != v27 || v33 != v26)
  {
    v34 = objc_loadWeakRetained(v6);
    objc_msgSend(v34, "preferredMaximumResolutionForExpensiveNetworks");
    objc_msgSend(v14, "setPreferredMaximumResolutionForExpensiveNetworks:");

  }
  v35 = objc_loadWeakRetained(v6);
  objc_msgSend(v35, "reportingCategory");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v37 = (id)sPlayerLogObject;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = objc_loadWeakRetained(v6);
      objc_msgSend(v38, "reportingCategory");
      v39 = v14;
      v40 = (id)objc_claimAutoreleasedReturnValue();
      LODWORD(buf.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v40;
      _os_log_impl(&dword_228A4E000, v37, OS_LOG_TYPE_DEFAULT, "Setting AVPlayerItem reportingCategory to %@", (uint8_t *)&buf, 0xCu);

      v14 = v39;
    }

    v41 = objc_loadWeakRetained(v6);
    objc_msgSend(v41, "reportingCategory");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setReportingCategory:", v42);

  }
  v43 = objc_loadWeakRetained(v6);
  objc_msgSend(v43, "preferredForwardBufferDuration");
  v45 = v44;

  if (v45 > 0.0)
  {
    v46 = objc_loadWeakRetained(v6);
    objc_msgSend(v46, "preferredForwardBufferDuration");
    objc_msgSend(v14, "setPreferredForwardBufferDuration:");

  }
  v47 = objc_loadWeakRetained(v6);
  if ((objc_msgSend(v47, "_beingUsedForIFrameOnlyPlayback") & 1) != 0)
    v48 = 0;
  else
    v48 = objc_msgSend(v10, "hasTrait:", CFSTR("TVPMediaItemTraitMinimizeNetworkUsageWhilePaused")) ^ 1;
  objc_msgSend(v14, "setCanUseNetworkResourcesForLiveStreamingWhilePaused:", v48);

  memset(&v150, 0, sizeof(v150));
  v49 = objc_loadWeakRetained(v6);
  v50 = v49;
  if (v49)
    objc_msgSend(v49, "startTime");
  else
    memset(&v150, 0, sizeof(v150));

  memset(&v149, 0, sizeof(v149));
  v51 = objc_loadWeakRetained(v6);
  if ((objc_msgSend(v51, "_beingUsedForIFrameOnlyPlayback") & 1) != 0)
  {
    CMTimeMakeWithSeconds(&v149, 10.0, 1000000);
  }
  else
  {
    v52 = objc_loadWeakRetained(v6);
    v53 = v52;
    if (v52)
      objc_msgSend(v52, "startingSeekPrecision");
    else
      memset(&v149, 0, sizeof(v149));

  }
  v54 = objc_loadWeakRetained(v6);
  objc_msgSend(v54, "startPosition");
  v56 = v55;

  v57 = objc_loadWeakRetained(v6);
  objc_msgSend(v57, "startDate");
  v58 = objc_claimAutoreleasedReturnValue();

  if (!v58)
  {
    objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataStartDate"));
    v58 = objc_claimAutoreleasedReturnValue();
  }
  if (v56 != 0.0)
  {
    memset(&buf, 0, sizeof(buf));
    objc_msgSend(v14, "asset");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    if (v59)
      objc_msgSend(v59, "duration");
    else
      memset(&buf, 0, sizeof(buf));

    if ((buf.flags & 0x1D) == 1)
    {
      time = buf;
      CMTimeMultiplyByFloat64(&time2, &time, v56);
      v150 = time2;
    }
  }
  buf = v150;
  *(_OWORD *)&time2.value = *MEMORY[0x24BDC0D88];
  v141 = *(_OWORD *)&time2.value;
  v61 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  time2.epoch = v61;
  v62 = CMTimeCompare(&buf, &time2);
  v63 = v141;
  v139 = v10;
  v140 = (void *)v58;
  if (!v62)
  {
    v64 = v14;
    v65 = v6;
    objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataStartTime"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataStartTimeIsRelativeToMainContent"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "BOOLValue");

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "stringForKey:", CFSTR("MovieAndTVShowStartLocationSetting.v2"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (v70 && objc_msgSend(v70, "isEqualToString:", CFSTR("Beginning")))
    {
      *(_OWORD *)&v150.value = v141;
      v150.epoch = v61;
    }
    else
    {
      if (!v68)
      {
        v6 = v65;
        if (v66)
        {
          objc_msgSend(v66, "floatValue");
          CMTimeMakeWithSeconds(&buf, v78, 1000000);
          v150 = buf;
        }
        goto LABEL_52;
      }
      objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataFeatureStartTime"));
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "doubleValue");
      v73 = v72;
      objc_msgSend(v71, "doubleValue");
      v75 = v73 + v74;
      CMTimeMakeWithSeconds(&buf, v75, 1000000);
      v150 = buf;
      v76 = (id)sPlayerLogObject;
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v75);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.value) = 138412802;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v66;
        LOWORD(buf.flags) = 2112;
        *(_QWORD *)((char *)&buf.flags + 2) = v71;
        HIWORD(buf.epoch) = 2112;
        v153 = v77;
        _os_log_impl(&dword_228A4E000, v76, OS_LOG_TYPE_DEFAULT, "Using main content relative start time of %@.  Main content start time is %@; translating to absolute start time of %@",
          (uint8_t *)&buf,
          0x20u);

        v10 = v139;
      }

    }
    v6 = v65;
LABEL_52:

    v14 = v64;
    v58 = (uint64_t)v140;
    v63 = v141;
  }
  buf = v150;
  *(_OWORD *)&time2.value = v63;
  time2.epoch = v61;
  if (CMTimeCompare(&buf, &time2))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "BOOLForKey:", CFSTR("DisableResume"));

    p_vtable = TVPChapterCollection.vtable;
    v82 = (id)sPlayerLogObject;
    v83 = os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT);
    if ((v80 & 1) != 0)
    {
      if (v83)
      {
        LOWORD(buf.value) = 0;
        _os_log_impl(&dword_228A4E000, v82, OS_LOG_TYPE_DEFAULT, "Ignoring start time since DisableResume pref key is YES", (uint8_t *)&buf, 2u);
      }

    }
    else
    {
      if (v83)
      {
        buf = v150;
        v84 = (__CFString *)CMTimeCopyDescription(0, &buf);
        LODWORD(buf.value) = 138412290;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v84;
        _os_log_impl(&dword_228A4E000, v82, OS_LOG_TYPE_DEFAULT, "Prior to enqueueing item, seeking player item to %@", (uint8_t *)&buf, 0xCu);

      }
      buf = v150;
      time2 = v149;
      time = v149;
      objc_msgSend(v14, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &buf, &time2, &time, 0);
    }
  }
  else
  {
    p_vtable = (void **)(TVPChapterCollection + 24);
    if (v58)
      objc_msgSend(v14, "setInitialDate:", v58);
  }
  v85 = objc_loadWeakRetained(v6);
  v86 = objc_msgSend(v85, "interactive");

  if ((v86 & 1) == 0)
  {
    *(_OWORD *)&buf.value = v141;
    buf.epoch = v61;
    objc_msgSend(v14, "setMaximumTrailingBufferDuration:", &buf);
  }
  v87 = objc_loadWeakRetained(v6);
  objc_msgSend(v87, "iFramePrefetchMaxSize");
  v89 = v88;
  v91 = v90;

  if (v89 != v27 || v91 != v26)
  {
    v92 = objc_loadWeakRetained(v6);
    objc_msgSend(v92, "iFramePrefetchMaxSize");
    objc_msgSend(v14, "setIFramePrefetchTargetDimensions:");

  }
  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataForwardPlaybackEndTime"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v93;
  if (v93)
  {
    memset(&buf, 0, sizeof(buf));
    objc_msgSend(v93, "doubleValue");
    CMTimeMakeWithSeconds(&buf, v95, 1000000);
    time2 = buf;
    objc_msgSend(v14, "setForwardPlaybackEndTime:", &time2);
  }
  v137 = v94;
  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataReversePlaybackEndTime"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v96;
  if (v96)
  {
    memset(&buf, 0, sizeof(buf));
    objc_msgSend(v96, "doubleValue");
    CMTimeMakeWithSeconds(&buf, v98, 1000000);
    time2 = buf;
    objc_msgSend(v14, "setReversePlaybackEndTime:", &time2);
  }
  v136 = v97;
  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataSoundCheckMediaKind"));
  v99 = objc_claimAutoreleasedReturnValue();
  if (v99)
  {
    v100 = p_vtable[216];
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 138412290;
      *(CMTimeValue *)((char *)&buf.value + 4) = v99;
      _os_log_impl(&dword_228A4E000, v100, OS_LOG_TYPE_DEFAULT, "Sound check: setting player item mediaKind to %@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(v14, "setMediaKind:", v99);
  }
  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataSoundCheckDictionary"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = (void *)v99;
  if (!objc_msgSend(v134, "count"))
  {
    v102 = objc_loadWeakRetained(v6);
    objc_msgSend(v102, "_soundCheckNormalizationForMediaItem:", v10);
    v101 = objc_claimAutoreleasedReturnValue();

    if (v101)
    {
      -[NSObject floatValue](v101, "floatValue");
      v104 = floor(log10(v103) * 20.0 + 0.5);
      v105 = p_vtable[216];
      if (!os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
      {
LABEL_86:

        *(float *)&v109 = v104;
        objc_msgSend(v14, "setSoundCheckVolumeNormalization:", v109);
        goto LABEL_87;
      }
      LODWORD(buf.value) = 134217984;
      *(double *)((char *)&buf.value + 4) = v104;
      v106 = "Sound check: setting player item soundCheckVolumeNormalization to value from mediaItem: %f";
    }
    else
    {
      objc_msgSend(v5, "AVAsset");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "preferredSoundCheckVolumeNormalization");
      v104 = v108;

      if (v104 == 0.0)
        goto LABEL_87;
      v105 = p_vtable[216];
      if (!os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
        goto LABEL_86;
      LODWORD(buf.value) = 134217984;
      *(double *)((char *)&buf.value + 4) = v104;
      v106 = "Sound check: setting player item soundCheckVolumeNormalization to value from AVAsset: %f";
    }
    _os_log_impl(&dword_228A4E000, v105, OS_LOG_TYPE_DEFAULT, v106, (uint8_t *)&buf, 0xCu);
    goto LABEL_86;
  }
  v101 = p_vtable[216];
  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.value) = 0;
    _os_log_impl(&dword_228A4E000, v101, OS_LOG_TYPE_DEFAULT, "Sound check: not setting soundCheckVolumeNormalization since raw sound check info dict exists.", (uint8_t *)&buf, 2u);
  }
LABEL_87:

  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataScrubPlayerItem"));
  v110 = objc_claimAutoreleasedReturnValue();
  v111 = v6;
  v112 = objc_loadWeakRetained(v6);
  v133 = (void *)v110;
  v142 = v14;
  objc_msgSend(v112, "_setScrubPlayerItem:onPlayerItem:", v110, v14);

  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataSavedAudioOption"));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v132, "propertyListRepresentation");
  v113 = objc_claimAutoreleasedReturnValue();
  if (v113)
  {
    objc_msgSend(v5, "AVAsset");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "tvp_mediaSelectionGroupForMediaCharacteristic:", *MEMORY[0x24BDB1C90]);
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v115, "mediaSelectionOptionWithPropertyList:", v113);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (v116)
      objc_msgSend(v142, "selectMediaOption:inMediaSelectionGroup:", v116, v115);

  }
  objc_msgSend(v5, "mediaItem", v113);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = objc_msgSend(v117, "hasTrait:", CFSTR("TVPMediaItemTraitIsLocal"));

  if (v118)
    objc_msgSend(v142, "setRestrictsAutomaticMediaSelectionToAvailableOfflineOptions:", 1);
  v138 = v5;
  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  v119 = objc_loadWeakRetained(v111);
  objc_msgSend(v119, "reportingValues");
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  v121 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v143, v151, 16);
  if (v121)
  {
    v122 = v121;
    v123 = *(_QWORD *)v144;
    do
    {
      for (i = 0; i != v122; ++i)
      {
        if (*(_QWORD *)v144 != v123)
          objc_enumerationMutation(v120);
        v125 = *(_QWORD *)(*((_QWORD *)&v143 + 1) + 8 * i);
        v126 = objc_loadWeakRetained(v111);
        objc_msgSend(v126, "reportingValues");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "objectForKey:", v125);
        v128 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v142, "setReportingValueWithString:forKey:", v128, v125);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v142, "setReportingValueWithNumber:forKey:", v128, v125);
        }

      }
      v122 = objc_msgSend(v120, "countByEnumeratingWithState:objects:count:", &v143, v151, 16);
    }
    while (v122);
  }

  v129 = v142;
  return v129;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_544(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  int v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  CMTime v35;
  CMTime v36;
  _QWORD v37[3];
  CMTime buf;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "playlist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a3)
    objc_msgSend(v8, "nextMediaItem");
  else
    objc_msgSend(v8, "currentMediaItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addStartEventWithName:", TVPPlaybackReportingEventCreatePlayerItemToLikelyToKeepUp);

  v12 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v12, "AVQueuePlayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "items");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "count");

  if (!a3)
  {
    v16 = objc_loadWeakRetained(v6);
    objc_msgSend(v16, "updateAudioSelectionCriteria");

    v17 = objc_loadWeakRetained(v6);
    objc_msgSend(v17, "pendingSelectedMediaArray");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.value) = 134217984;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v14;
        _os_log_impl(&dword_228A4E000, v19, OS_LOG_TYPE_DEFAULT, "Applying pending selectedMediaArray to item %p.", (uint8_t *)&buf, 0xCu);
      }
      v20 = objc_loadWeakRetained(v6);
      objc_msgSend(v20, "setPendingSelectedMediaArray:", 0);

      v21 = objc_loadWeakRetained(v6);
      objc_msgSend(v21, "_selectMediaArray:withItem:", v18, v14);

    }
  }
  v22 = objc_loadWeakRetained(v6);
  objc_msgSend(v22, "setHaveEverEnqueuedPlayerItem:", 1);

  v23 = objc_loadWeakRetained(v6);
  objc_msgSend(v23, "setModifyingAVPlayerRate:", 1);

  v24 = objc_loadWeakRetained(v6);
  objc_msgSend(v24, "setModifyingAVPlayerQueue:", 1);

  objc_msgSend(v13, "insertItem:afterItem:", v14, 0);
  v25 = objc_loadWeakRetained(v6);
  objc_msgSend(v25, "setModifyingAVPlayerRate:", 0);

  v26 = objc_loadWeakRetained(v6);
  objc_msgSend(v26, "setModifyingAVPlayerQueue:", 0);

  v27 = objc_loadWeakRetained(v6);
  v28 = objc_msgSend(v27, "_beingUsedForIFrameOnlyPlayback");

  if (v28)
  {
    v29 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_228A4E000, v29, OS_LOG_TYPE_DEFAULT, "Seeking after inserting item for iframe-only playback", (uint8_t *)&buf, 2u);
    }
    memset(&buf, 0, sizeof(buf));
    CMTimeMakeWithSeconds(&buf, 10.0, 1000000);
    if (v14)
      objc_msgSend(v14, "currentTime");
    else
      memset(v37, 0, sizeof(v37));
    v36 = buf;
    v35 = buf;
    objc_msgSend(v14, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", v37, &v36, &v35, 0);
  }
  v30 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v31 = v30;
    v32 = objc_loadWeakRetained(v6);
    objc_msgSend(v32, "AVQueuePlayer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "items");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.value) = 138412290;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v34;
    _os_log_impl(&dword_228A4E000, v31, OS_LOG_TYPE_DEFAULT, "Player queue after enqueueing item: %@", (uint8_t *)&buf, 0xCu);

  }
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_546(uint64_t a1, uint64_t a2, void *a3, CMTime *a4, void *a5, int a6, double a7)
{
  id v11;
  id *v12;
  id WeakRetained;
  id v14;
  double v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  CMTimeFlags flags;
  id v21;
  void *v22;
  CMTimeEpoch v23;
  id v24;
  void *v25;
  void *v26;
  BOOL v27;
  NSObject *v28;
  _BOOL4 v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  _BOOL4 v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  CMTime *v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id v58[2];
  CMTimeScale v59;
  CMTimeFlags v60;
  CMTimeEpoch v61;
  _QWORD block[4];
  id v63;
  __int128 v64;
  CMTimeEpoch v65;
  _QWORD v66[4];
  id v67[2];
  CMTimeScale v68;
  CMTimeFlags v69;
  CMTimeEpoch v70;
  __int128 v71;
  CMTimeEpoch epoch;
  _QWORD v73[3];
  CMTimeRange range;
  CMTime v75;
  CMTimeRange buf;
  _QWORD v77[4];
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  void *value;
  CMTimeScale timescale;
  uint64_t v84;

  v48 = a4;
  v84 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v54 = a5;
  v12 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "currentMediaItemLoader");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v14, "currentMediaItem");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v53, "reportingDelegate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "timingData");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "startTimeForBuffering");
  if (v15 == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    objc_msgSend(v55, "setStartTimeForBuffering:");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v51, "mediaItemWillStartBuffering:player:", v53, v16);

    }
    v17 = *(void **)(a1 + 32);
    v80[0] = MEMORY[0x24BDAC760];
    v80[1] = 3221225472;
    v80[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_549;
    v80[3] = &unk_24F15C088;
    objc_copyWeak(&v81, (id *)(a1 + 40));
    objc_msgSend(v17, "executeBlockAfterCurrentStateTransition:", v80);
    objc_destroyWeak(&v81);
  }
  v18 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v18, "currentPlayerItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v77[0] = MEMORY[0x24BDAC760];
  v77[1] = 3221225472;
  v77[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_550;
  v77[3] = &unk_24F15C508;
  objc_copyWeak(&v79, (id *)(a1 + 40));
  v78 = *(id *)(a1 + 32);
  v50 = (void *)MEMORY[0x22E2BA4B0](v77);
  value = *(void **)a2;
  flags = *(_DWORD *)(a2 + 12);
  timescale = *(_DWORD *)(a2 + 8);
  if ((~flags & 5) != 0)
  {
    if ((~flags & 9) != 0)
    {
      if ((flags & 0x1D) == 1)
      {
        v23 = *(_QWORD *)(a2 + 16);
        if (!v11)
          goto LABEL_28;
      }
      else
      {
        value = (void *)*MEMORY[0x24BDC0D88];
        flags = *(_DWORD *)(MEMORY[0x24BDC0D88] + 12);
        timescale = *(_DWORD *)(MEMORY[0x24BDC0D88] + 8);
        v23 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
        if (!v11)
        {
LABEL_28:
          memset(&buf, 0, 24);
          if (v19)
            objc_msgSend(v19, "currentTime");
          v37 = objc_loadWeakRetained(v12);
          objc_msgSend(v37, "stateMachine");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v66[0] = MEMORY[0x24BDAC760];
          v66[1] = 3221225472;
          v66[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_552;
          v66[3] = &unk_24F15C9B8;
          objc_copyWeak(v67, v12);
          v67[1] = value;
          v68 = timescale;
          v69 = flags;
          v70 = v23;
          v71 = *(_OWORD *)&buf.start.value;
          epoch = buf.start.epoch;
          objc_msgSend(v38, "executeBlockAfterCurrentStateTransition:", v66);

          v39 = sPlayerLogObject;
          if ((*(_DWORD *)(a2 + 12) & 0x11) == 1)
          {
            v40 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
            if (a6)
            {
              if (v40)
              {
                LOWORD(range.start.value) = 0;
                _os_log_impl(&dword_228A4E000, v39, OS_LOG_TYPE_DEFAULT, "In _setElapsedTimeOrDateOnCurrentPlayerItem, calling seekToTime", (uint8_t *)&range, 2u);
              }
              v41 = objc_loadWeakRetained(v12);
              objc_msgSend(v41, "setNumOutstandingSeeks:", objc_msgSend(v41, "numOutstandingSeeks") + 1);

              *(_OWORD *)&range.start.value = *(_OWORD *)a2;
              range.start.epoch = *(_QWORD *)(a2 + 16);
              v75 = *v48;
              v64 = *(_OWORD *)&v48->value;
              v65 = v48->epoch;
              objc_msgSend(v19, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &range, &v75, &v64, v50);
            }
            else if (v40)
            {
              LOWORD(range.start.value) = 0;
              _os_log_impl(&dword_228A4E000, v39, OS_LOG_TYPE_DEFAULT, "In _setElapsedTimeOrDateOnCurrentPlayerItem, bypassing seekToTime", (uint8_t *)&range, 2u);
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_ERROR))
              __42__TVPPlayer__registerStateMachineHandlers__block_invoke_546_cold_1();
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_553;
            block[3] = &unk_24F15C038;
            v63 = v50;
            dispatch_async(MEMORY[0x24BDAC9B8], block);

          }
          objc_destroyWeak(v67);
          goto LABEL_41;
        }
      }
    }
    else
    {
      memset(&buf, 0, sizeof(buf));
      v24 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v24, "cachedSeekableTimeRanges");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:](TVPTimeRange, "forwardmostCMTimeRangeInCMTimeRanges:", v25);

      value = 0;
      flags = 0;
      timescale = 0;
      v23 = 0;
      *(_OWORD *)a2 = 0u;
      *(_QWORD *)(a2 + 16) = 0;
      if (!v11)
        goto LABEL_28;
    }
  }
  else
  {
    memset(&buf, 0, sizeof(buf));
    v21 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v21, "cachedSeekableTimeRanges");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[TVPTimeRange forwardmostCMTimeRangeInCMTimeRanges:](TVPTimeRange, "forwardmostCMTimeRangeInCMTimeRanges:", v22);

    range = buf;
    CMTimeRangeGetEnd(&v75, &range);
    value = (void *)v75.value;
    flags = v75.flags;
    timescale = v75.timescale;
    v23 = v75.epoch;
    if (!v11)
      goto LABEL_28;
  }
  if (objc_msgSend(v19, "status", v48) != 1
    || (objc_msgSend(v19, "currentDate"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        v27 = v26 == 0,
        v26,
        v27))
  {
    v31 = objc_loadWeakRetained(v12);
    objc_msgSend(v31, "currentPlayerItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
      objc_msgSend(v32, "currentTime");
    else
      memset(v73, 0, sizeof(v73));
    v34 = objc_loadWeakRetained(v12);
    objc_msgSend(v34, "currentPlayerItem");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_currentDateFromPlayerItem:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
      objc_msgSend(v31, "_estimatedCMTimeForPlaybackDate:referenceTime:referenceDate:", v11, v73, v36);
    else
      memset(&buf, 0, 24);
    *(_OWORD *)a2 = *(_OWORD *)&buf.start.value;
    *(_QWORD *)(a2 + 16) = buf.start.epoch;

    value = *(void **)a2;
    flags = *(_DWORD *)(a2 + 12);
    timescale = *(_DWORD *)(a2 + 8);
    v23 = *(_QWORD *)(a2 + 16);
    goto LABEL_28;
  }
  v28 = sPlayerLogObject;
  v29 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
  if (a6)
  {
    if (v29)
    {
      LOWORD(buf.start.value) = 0;
      _os_log_impl(&dword_228A4E000, v28, OS_LOG_TYPE_DEFAULT, "In _setElapsedTimeOrDateOnCurrentPlayerItem, calling seekToDate", (uint8_t *)&buf, 2u);
    }
    v30 = objc_loadWeakRetained(v12);
    objc_msgSend(v30, "setNumOutstandingSeeks:", objc_msgSend(v30, "numOutstandingSeeks") + 1);

    objc_msgSend(v19, "seekToDate:completionHandler:", v11, v50);
  }
  else if (v29)
  {
    LOWORD(buf.start.value) = 0;
    _os_log_impl(&dword_228A4E000, v28, OS_LOG_TYPE_DEFAULT, "In _setElapsedTimeOrDateOnCurrentPlayerItem, bypassing seekToDate", (uint8_t *)&buf, 2u);
  }
LABEL_41:
  v42 = objc_loadWeakRetained(v12);
  objc_msgSend(v42, "setDateBeingSeekedTo:", v11);

  v43 = objc_loadWeakRetained(v12);
  buf.start.value = (CMTimeValue)value;
  buf.start.timescale = timescale;
  buf.start.flags = flags;
  buf.start.epoch = v23;
  objc_msgSend(v43, "setTimeBeingSeekedTo:", &buf);

  if (v54)
  {
    v44 = objc_loadWeakRetained(v12);
    objc_msgSend(v44, "_setState:updatedRate:notifyListeners:", v54, 1, a7);

  }
  v45 = objc_loadWeakRetained(v12);
  objc_msgSend(v45, "stateMachine");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = MEMORY[0x24BDAC760];
  v56[1] = 3221225472;
  v56[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_554;
  v56[3] = &unk_24F15C9E0;
  objc_copyWeak(v58, v12);
  v58[1] = value;
  v59 = timescale;
  v60 = flags;
  v61 = v23;
  v47 = v11;
  v57 = v47;
  objc_msgSend(v46, "executeBlockAfterCurrentStateTransition:", v56);

  objc_destroyWeak(v58);
  objc_destroyWeak(&v79);

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_549(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVPPlaybackReportingBufferingWillStartNotification"), WeakRetained);

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_550(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v4;
  id v5;
  char v6;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_551;
  block[3] = &unk_24F15C990;
  v6 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v5);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_551(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 48))
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Seek completion handler called.  finished param is %@", (uint8_t *)&v9, 0xCu);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_msgSend(WeakRetained, "numOutstandingSeeks");

  if (v5 >= 1)
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v6, "setNumOutstandingSeeks:", objc_msgSend(v6, "numOutstandingSeeks") - 1);

  }
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = objc_msgSend(v7, "numOutstandingSeeks");

  if (!v8)
    objc_msgSend(*(id *)(a1 + 32), "postEvent:", CFSTR("Seek completed"));
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_552(uint64_t a1)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;
  __int128 v7;
  uint64_t v8;
  CMTime time;

  v2 = (id *)(a1 + 32);
  v3 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "currentChapterCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  time = *(CMTime *)(a1 + 40);
  objc_msgSend(v4, "chapterForTime:", CMTimeGetSeconds(&time));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentChapter:", v5);

  WeakRetained = objc_loadWeakRetained(v2);
  time = *(CMTime *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 56);
  objc_msgSend(WeakRetained, "_notifyOfBoundaryCrossingBetweenPreviousTime:updatedTime:", &time, &v7);

}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_553(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_554(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  objc_msgSend(WeakRetained, "_notifyListenersOfElapsedTimeChange:playbackDate:dueToTimeJump:", &v4, v3, 1);

}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_556(uint64_t a1, CMTime *a2, char a3, void *a4, void *a5, _BYTE *a6)
{
  id v11;
  id *v12;
  id WeakRetained;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  double v22;
  _BOOL4 v23;
  double Seconds;
  id v25;
  uint64_t v26;
  int v27;
  void *v28;
  TVPAsyncPlayerDelegateOperation *v29;
  void *v30;
  NSObject *v31;
  int v32;
  const __CFString *v33;
  double v34;
  int v35;
  NSObject *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44[2];
  CMTime v45;
  CMTime rhs;
  CMTime lhs;
  CMTime time1;
  CMTime v49;
  CMTime time2;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v39 = a4;
  v11 = a5;
  v12 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_loadWeakRetained(v12);
  objc_msgSend(v15, "asyncDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6)
    *a6 = 0;
  memset(&v49, 0, sizeof(v49));
  v17 = objc_loadWeakRetained(v12);
  v18 = v17;
  if (v17)
    objc_msgSend(v17, "_currentMediaItemReversePlaybackEndTime", v39);
  else
    memset(&v49, 0, sizeof(v49));

  if ((v49.flags & 1) != 0)
  {
    time1 = *a2;
    time2 = v49;
    if (CMTimeCompare(&time1, &time2) < 0)
      *a2 = v49;
  }
  memset(&time1, 0, sizeof(time1));
  v19 = objc_loadWeakRetained(v12);
  v20 = v19;
  if (v19)
    objc_msgSend(v19, "_currentMediaItemForwardPlaybackEndTime");
  else
    memset(&time1, 0, sizeof(time1));

  if ((time1.flags & 1) != 0)
  {
    time2 = *a2;
    lhs = time1;
    if ((CMTimeCompare(&time2, &lhs) & 0x80000000) == 0)
    {
      v21 = objc_loadWeakRetained(v12);
      objc_msgSend(v21, "duration");
      v23 = v22 == 3.40282347e38;

      if (v23)
      {
        CMTimeMakeWithSeconds(&rhs, 0.01, 1000000);
        lhs = time1;
        CMTimeAdd(&time2, &lhs, &rhs);
      }
      else
      {
        CMTimeMakeWithSeconds(&v45, 0.01, 1000000);
        lhs = time1;
        CMTimeSubtract(&time2, &lhs, &v45);
      }
      *a2 = time2;
    }
  }
  if ((a3 & 1) != 0)
    goto LABEL_38;
  time2 = *a2;
  Seconds = CMTimeGetSeconds(&time2);
  *(double *)&lhs.value = Seconds;
  if (v14)
  {
    v25 = objc_loadWeakRetained(v12);
    v26 = objc_msgSend(v14, "player:shouldSeekToTime:playbackDate:", v25, &lhs, 0);

    if (*(double *)&lhs.value == Seconds)
      v27 = 0;
    else
      v27 = v26;
    if (v27 == 1)
    {
      CMTimeMakeWithSeconds(&time2, *(Float64 *)&lhs.value, 1000000);
      *a2 = time2;
LABEL_38:
      v26 = 1;
    }
  }
  else
  {
    if (!v16)
      goto LABEL_38;
    objc_msgSend(v11, "objectForKey:", CFSTR("Async delegate response key"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("Adjusted time key"));
      v29 = (TVPAsyncPlayerDelegateOperation *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        v32 = objc_msgSend(v28, "BOOLValue");
        v33 = CFSTR("NO");
        if (v32)
          v33 = CFSTR("YES");
        LODWORD(time2.value) = 138412546;
        *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v33;
        LOWORD(time2.flags) = 2112;
        *(_QWORD *)((char *)&time2.flags + 2) = v29;
        _os_log_impl(&dword_228A4E000, v31, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToSeekToTime returning saved delegate response of %@, %@", (uint8_t *)&time2, 0x16u);

      }
      v26 = objc_msgSend(v28, "BOOLValue", v39);
      v34 = Seconds;
      if (v29)
      {
        -[TVPAsyncPlayerDelegateOperation doubleValue](v29, "doubleValue", Seconds);
        *(double *)&lhs.value = v34;
      }
      if (v34 == Seconds)
        v35 = 0;
      else
        v35 = v26;
      if (v35 == 1)
      {
        CMTimeMakeWithSeconds(&time2, v34, 1000000);
        *a2 = time2;
      }
    }
    else
    {
      v37 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(time2.value) = 0;
        _os_log_impl(&dword_228A4E000, v37, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToSeekToTime returning NO until delegate is consulted", (uint8_t *)&time2, 2u);
      }
      if (a6)
        *a6 = 1;
      v29 = objc_alloc_init(TVPAsyncPlayerDelegateOperation);
      objc_initWeak((id *)&time2, v29);
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_557;
      v40[3] = &unk_24F15CA58;
      objc_copyWeak(&v43, v12);
      v44[1] = *(id *)&Seconds;
      objc_copyWeak(v44, (id *)&time2);
      v41 = v11;
      v42 = v39;
      -[TVPAsyncPlayerDelegateOperation setBlock:](v29, "setBlock:", v40);
      v38 = objc_loadWeakRetained(v12);
      objc_msgSend(v38, "_enqueueAsyncDelegateOperation:", v29);

      objc_destroyWeak(v44);
      objc_destroyWeak(&v43);
      objc_destroyWeak((id *)&time2);
      v26 = 0;
    }

  }
  return v26;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_557(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  double v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint8_t buf[16];

  v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToSeekToTime calling delegate", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "asyncDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = *(double *)(a1 + 64);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_558;
  v7[3] = &unk_24F15CA30;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v4, "player:shouldSeekToTime:completion:", v5, v7, v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_558(uint64_t a1, uint64_t a2, double a3)
{
  id WeakRetained;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  int v24;
  const __CFString *v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    goto LABEL_9;
  v7 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v7, "asyncDelegateOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", WeakRetained);

  if (v10)
  {
    v11 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("NO");
      if ((_DWORD)a2)
        v12 = CFSTR("YES");
      v24 = 138412546;
      v25 = v12;
      v26 = 2048;
      v27 = a3;
      _os_log_impl(&dword_228A4E000, v11, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToSeekToTime response: %@, %f", (uint8_t *)&v24, 0x16u);
    }
    v13 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v13, "asyncDelegateOperations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectAtIndex:", 0);

    v15 = *(void **)(a1 + 32);
    if (v15)
      v16 = (id)objc_msgSend(v15, "mutableCopy");
    else
      v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v18 = v16;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("Async delegate response key"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v20, CFSTR("Adjusted time key"));

    v21 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v21, "stateMachine");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "postEvent:withContext:userInfo:", *(_QWORD *)(a1 + 40), 0, v18);

    v23 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v23, "_processNextAsyncDelegateOperation");

  }
  else
  {
LABEL_9:
    v17 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_228A4E000, v17, OS_LOG_TYPE_DEFAULT, "Async delegate: ignoring allowedToSeekToTime response", (uint8_t *)&v24, 2u);
    }
  }

}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_561(uint64_t a1, id *a2, char a3, void *a4, void *a5, _BYTE *a6)
{
  id v11;
  id *v12;
  id WeakRetained;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  TVPAsyncPlayerDelegateOperation *v25;
  void *v26;
  NSObject *v27;
  int v28;
  const __CFString *v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  const __CFString *v45;
  __int16 v46;
  TVPAsyncPlayerDelegateOperation *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v37 = a4;
  v11 = a5;
  v12 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_loadWeakRetained(v12);
  objc_msgSend(v15, "asyncDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6)
    *a6 = 0;
  v17 = objc_loadWeakRetained(v12);
  objc_msgSend(v17, "seekableDateRange");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v18, "startDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dateByAddingTimeInterval:", 10.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*a2, "laterDate:", v21);
      *a2 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  if ((a3 & 1) != 0)
    goto LABEL_7;
  if (v14)
  {
    v23 = objc_loadWeakRetained(v12);
    v22 = objc_msgSend(v14, "player:shouldSeekToTime:playbackDate:", v23, 0, a2);

    goto LABEL_27;
  }
  if (!v16)
  {
LABEL_7:
    v22 = 1;
  }
  else
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("Async delegate response key"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("Adjusted date key"));
      v25 = (TVPAsyncPlayerDelegateOperation *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v26;
        v28 = objc_msgSend(v24, "BOOLValue");
        v29 = CFSTR("NO");
        if (v28)
          v29 = CFSTR("YES");
        *(_DWORD *)buf = 138412546;
        v45 = v29;
        v46 = 2112;
        v47 = v25;
        _os_log_impl(&dword_228A4E000, v27, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToSeekToDate returning saved delegate response of %@, %@", buf, 0x16u);

      }
      v30 = objc_msgSend(v24, "BOOLValue");
      v22 = v30;
      if (v25)
        v31 = v30;
      else
        v31 = 0;
      if (v31 == 1)
      {
        v25 = objc_retainAutorelease(v25);
        *a2 = v25;
      }
    }
    else
    {
      v32 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v32, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToSeekToDate returning NO until delegate is consulted", buf, 2u);
      }
      if (a6)
        *a6 = 1;
      v25 = objc_alloc_init(TVPAsyncPlayerDelegateOperation);
      objc_initWeak((id *)buf, v25);
      v33 = *a2;
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_562;
      v38[3] = &unk_24F15CAD0;
      objc_copyWeak(&v42, v12);
      v34 = v33;
      v39 = v34;
      objc_copyWeak(&v43, (id *)buf);
      v40 = v11;
      v41 = v37;
      -[TVPAsyncPlayerDelegateOperation setBlock:](v25, "setBlock:", v38);
      v35 = objc_loadWeakRetained(v12);
      objc_msgSend(v35, "_enqueueAsyncDelegateOperation:", v25);

      objc_destroyWeak(&v43);
      objc_destroyWeak(&v42);

      objc_destroyWeak((id *)buf);
      v22 = 0;
    }

  }
LABEL_27:

  return v22;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_562(id *a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint8_t buf[16];

  v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToSeekToDate calling delegate", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "asyncDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(a1 + 7);
  v6 = a1[4];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_563;
  v7[3] = &unk_24F15CAA8;
  objc_copyWeak(&v11, a1 + 8);
  objc_copyWeak(&v12, a1 + 7);
  v8 = a1[5];
  v9 = a1[4];
  v10 = a1[6];
  objc_msgSend(v4, "player:shouldSeekToDate:completion:", v5, v6, v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_563(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  int v25;
  const __CFString *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
    goto LABEL_9;
  v7 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v7, "asyncDelegateOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", WeakRetained);

  if (v10)
  {
    v11 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("NO");
      if ((_DWORD)a2)
        v12 = CFSTR("YES");
      v25 = 138412546;
      v26 = v12;
      v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_228A4E000, v11, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToSeekToDate response: %@, %@", (uint8_t *)&v25, 0x16u);
    }
    v13 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v13, "asyncDelegateOperations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectAtIndex:", 0);

    v15 = *(void **)(a1 + 32);
    if (v15)
      v16 = (id)objc_msgSend(v15, "mutableCopy");
    else
      v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v18 = v16;
    v19 = v5;
    if (!v5)
      v19 = *(void **)(a1 + 40);
    v20 = v19;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v21, CFSTR("Async delegate response key"));

    if (v20)
      objc_msgSend(v18, "setObject:forKey:", v20, CFSTR("Adjusted date key"));
    v22 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v22, "stateMachine");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "postEvent:withContext:userInfo:", *(_QWORD *)(a1 + 48), 0, v18);

    v24 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v24, "_processNextAsyncDelegateOperation");

  }
  else
  {
LABEL_9:
    v17 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_228A4E000, v17, OS_LOG_TYPE_DEFAULT, "Async delegate: ignoring allowedToSeekToDate response", (uint8_t *)&v25, 2u);
    }
  }

}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_566(uint64_t a1, void *a2, void *a3, _BYTE *a4, double a5)
{
  id v9;
  id v10;
  id *v11;
  id WeakRetained;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  int v22;
  const __CFString *v23;
  TVPAsyncPlayerDelegateOperation *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31[2];
  uint8_t buf[4];
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_loadWeakRetained(v11);
  objc_msgSend(v14, "asyncDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
    *a4 = 0;
  if (v13)
  {
    v16 = objc_loadWeakRetained(v11);
    v17 = objc_msgSend(v13, "player:shouldScanAtRate:", v16, a5);

  }
  else if (v15)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("Async delegate response key"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = sPlayerLogObject;
    v20 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        v21 = v19;
        v22 = objc_msgSend(v18, "BOOLValue");
        v23 = CFSTR("NO");
        if (v22)
          v23 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v33 = v23;
        _os_log_impl(&dword_228A4E000, v21, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToScan returning saved delegate response of %@", buf, 0xCu);

      }
      v17 = objc_msgSend(v18, "BOOLValue");
    }
    else
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v19, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToScan returning NO until delegate is consulted", buf, 2u);
      }
      if (a4)
        *a4 = 1;
      v24 = objc_alloc_init(TVPAsyncPlayerDelegateOperation);
      objc_initWeak((id *)buf, v24);
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_567;
      v27[3] = &unk_24F15CA58;
      objc_copyWeak(&v30, v11);
      v31[1] = *(id *)&a5;
      objc_copyWeak(v31, (id *)buf);
      v28 = v10;
      v29 = v9;
      -[TVPAsyncPlayerDelegateOperation setBlock:](v24, "setBlock:", v27);
      v25 = objc_loadWeakRetained(v11);
      objc_msgSend(v25, "_enqueueAsyncDelegateOperation:", v24);

      objc_destroyWeak(v31);
      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);

      v17 = 0;
    }

  }
  else
  {
    v17 = 1;
  }

  return v17;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_567(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  double v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  uint8_t buf[16];

  v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToScan calling delegate", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "asyncDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = *(double *)(a1 + 64);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_568;
  v7[3] = &unk_24F15CB20;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  objc_copyWeak(&v11, (id *)(a1 + 48));
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v4, "player:shouldScanAtRate:completion:", v5, v7, v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_568(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    goto LABEL_9;
  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v5, "asyncDelegateOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", WeakRetained);

  if (v8)
  {
    v9 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("NO");
      if ((_DWORD)a2)
        v10 = CFSTR("YES");
      v21 = 138412290;
      v22 = v10;
      _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToScan response: %@", (uint8_t *)&v21, 0xCu);
    }
    v11 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v11, "asyncDelegateOperations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectAtIndex:", 0);

    v13 = *(void **)(a1 + 32);
    if (v13)
      v14 = (id)objc_msgSend(v13, "mutableCopy");
    else
      v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v16 = v14;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("Async delegate response key"));

    v18 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v18, "stateMachine");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postEvent:withContext:userInfo:", *(_QWORD *)(a1 + 40), 0, v16);

    v20 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v20, "_processNextAsyncDelegateOperation");

  }
  else
  {
LABEL_9:
    v15 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_228A4E000, v15, OS_LOG_TYPE_DEFAULT, "Async delegate: ignoring allowedToScan response", (uint8_t *)&v21, 2u);
    }
  }

}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_570(uint64_t a1, char a2, void *a3, void *a4, _BYTE *a5)
{
  id v9;
  id v10;
  id *v11;
  id WeakRetained;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  int v22;
  const __CFString *v23;
  TVPAsyncPlayerDelegateOperation *v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(id *);
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_loadWeakRetained(v11);
  objc_msgSend(v14, "asyncDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = 0;
  if ((a2 & 1) != 0)
    goto LABEL_4;
  if (v13)
  {
    v17 = objc_loadWeakRetained(v11);
    v16 = objc_msgSend(v13, "playerShouldPause:", v17);

    goto LABEL_20;
  }
  if (!v15)
  {
LABEL_4:
    v16 = 1;
  }
  else
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("Async delegate response key"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = sPlayerLogObject;
    v20 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        v21 = v19;
        v22 = objc_msgSend(v18, "BOOLValue");
        v23 = CFSTR("NO");
        if (v22)
          v23 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v36 = v23;
        _os_log_impl(&dword_228A4E000, v21, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToPause returning saved delegate response of %@", buf, 0xCu);

      }
      v16 = objc_msgSend(v18, "BOOLValue");
    }
    else
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v19, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToPause returning NO until delegate is consulted", buf, 2u);
      }
      if (a5)
        *a5 = 1;
      v24 = objc_alloc_init(TVPAsyncPlayerDelegateOperation);
      objc_initWeak((id *)buf, v24);
      v27 = MEMORY[0x24BDAC760];
      v28 = 3221225472;
      v29 = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_571;
      v30 = &unk_24F15CB70;
      objc_copyWeak(&v33, v11);
      objc_copyWeak(&v34, (id *)buf);
      v31 = v10;
      v32 = v9;
      -[TVPAsyncPlayerDelegateOperation setBlock:](v24, "setBlock:", &v27);
      v25 = objc_loadWeakRetained(v11);
      objc_msgSend(v25, "_enqueueAsyncDelegateOperation:", v24, v27, v28, v29, v30);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);

      v16 = 0;
    }

  }
LABEL_20:

  return v16;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_571(id *a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint8_t buf[16];

  v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToPause calling delegate", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "asyncDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(a1 + 6);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_572;
  v6[3] = &unk_24F15CB20;
  objc_copyWeak(&v9, a1 + 7);
  objc_copyWeak(&v10, a1 + 6);
  v7 = a1[4];
  v8 = a1[5];
  objc_msgSend(v4, "player:shouldPauseWithCompletion:", v5, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_572(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  const __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    goto LABEL_9;
  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v5, "asyncDelegateOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", WeakRetained);

  if (v8)
  {
    v9 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v10 = CFSTR("NO");
      if ((_DWORD)a2)
        v10 = CFSTR("YES");
      v21 = 138412290;
      v22 = v10;
      _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToPause response: %@", (uint8_t *)&v21, 0xCu);
    }
    v11 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v11, "asyncDelegateOperations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectAtIndex:", 0);

    v13 = *(void **)(a1 + 32);
    if (v13)
      v14 = (id)objc_msgSend(v13, "mutableCopy");
    else
      v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v16 = v14;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("Async delegate response key"));

    v18 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v18, "stateMachine");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postEvent:withContext:userInfo:", *(_QWORD *)(a1 + 40), 0, v16);

    v20 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v20, "_processNextAsyncDelegateOperation");

  }
  else
  {
LABEL_9:
    v15 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_228A4E000, v15, OS_LOG_TYPE_DEFAULT, "Async delegate: ignoring allowedToPause response", (uint8_t *)&v21, 2u);
    }
  }

}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_574(uint64_t a1, char a2, CMTime *a3, _BYTE *a4, void *a5, void *a6, _BYTE *a7)
{
  id v13;
  id v14;
  id *v15;
  id WeakRetained;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  double v21;
  id v22;
  void *v23;
  TVPAsyncPlayerDelegateOperation *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  int v28;
  const __CFString *v29;
  double v30;
  double v31;
  double v32;
  Float64 v33;
  NSObject *v34;
  id v35;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  Float64 seconds;
  CMTime time;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v13 = a5;
  v14 = a6;
  v15 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_loadWeakRetained(v15);
  objc_msgSend(v18, "asyncDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (a7)
    *a7 = 0;
  if ((a2 & 1) != 0)
    goto LABEL_4;
  if (v17)
  {
    time = *a3;
    v21 = CMTimeGetSeconds(&time);
    seconds = v21;
    v22 = objc_loadWeakRetained(v15);
    v20 = objc_msgSend(v17, "playerShouldPlay:timeFromWhichToPlay:", v22, &seconds);

    if (vabdd_f64(seconds, v21) > 0.01)
    {
      CMTimeMakeWithSeconds(&time, seconds, 1000000);
      *a3 = time;
      if (a4)
        *a4 = 1;
    }
  }
  else
  {
    if (!v19)
    {
LABEL_4:
      v20 = 1;
      goto LABEL_27;
    }
    objc_msgSend(v14, "objectForKey:", CFSTR("Async delegate response key"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v14, "objectForKey:", CFSTR("Adjusted time key"));
      v24 = (TVPAsyncPlayerDelegateOperation *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("Original time key"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v26;
        v28 = objc_msgSend(v23, "BOOLValue");
        v29 = CFSTR("NO");
        if (v28)
          v29 = CFSTR("YES");
        LODWORD(time.value) = 138412546;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v29;
        LOWORD(time.flags) = 2112;
        *(_QWORD *)((char *)&time.flags + 2) = v24;
        _os_log_impl(&dword_228A4E000, v27, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToPlay returning saved delegate response of %@, %@", (uint8_t *)&time, 0x16u);

      }
      v20 = objc_msgSend(v23, "BOOLValue");
      if (v24)
      {
        if (v25)
        {
          -[TVPAsyncPlayerDelegateOperation doubleValue](v24, "doubleValue");
          v31 = v30;
          objc_msgSend(v25, "doubleValue");
          if (vabdd_f64(v31, v32) > 0.01)
          {
            -[TVPAsyncPlayerDelegateOperation doubleValue](v24, "doubleValue");
            CMTimeMakeWithSeconds(&time, v33, 1000000);
            *a3 = time;
            if (a4)
              *a4 = 1;
          }
        }
      }

    }
    else
    {
      v34 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(time.value) = 0;
        _os_log_impl(&dword_228A4E000, v34, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToPlay returning NO until delegate is consulted", (uint8_t *)&time, 2u);
      }
      if (a7)
        *a7 = 1;
      v24 = objc_alloc_init(TVPAsyncPlayerDelegateOperation);
      objc_initWeak((id *)&time, v24);
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_575;
      v37[3] = &unk_24F15CB70;
      objc_copyWeak(&v40, v15);
      objc_copyWeak(&v41, (id *)&time);
      v38 = v14;
      v39 = v13;
      -[TVPAsyncPlayerDelegateOperation setBlock:](v24, "setBlock:", v37);
      v35 = objc_loadWeakRetained(v15);
      objc_msgSend(v35, "_enqueueAsyncDelegateOperation:", v24);

      objc_destroyWeak(&v41);
      objc_destroyWeak(&v40);
      objc_destroyWeak((id *)&time);
      v20 = 0;
    }

  }
LABEL_27:

  return v20;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_575(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14[2];
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "elapsedTime");
  v5 = v4;

  v6 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = v5;
    _os_log_impl(&dword_228A4E000, v6, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToPlay calling delegate with proposed time of %f", buf, 0xCu);
  }
  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "asyncDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained(v2);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_576;
  v10[3] = &unk_24F15CBC0;
  objc_copyWeak(&v13, a1 + 7);
  objc_copyWeak(v14, v2);
  v11 = a1[4];
  v14[1] = v5;
  v12 = a1[5];
  objc_msgSend(v8, "player:shouldPlayFromTime:completion:", v9, v10, *(double *)&v5);

  objc_destroyWeak(v14);
  objc_destroyWeak(&v13);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_576(uint64_t a1, uint64_t a2, double a3)
{
  id WeakRetained;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  const __CFString *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  int v25;
  const __CFString *v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    goto LABEL_9;
  v7 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v7, "asyncDelegateOperations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", WeakRetained);

  if (v10)
  {
    v11 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("NO");
      if ((_DWORD)a2)
        v12 = CFSTR("YES");
      v25 = 138412546;
      v26 = v12;
      v27 = 2048;
      v28 = a3;
      _os_log_impl(&dword_228A4E000, v11, OS_LOG_TYPE_DEFAULT, "Async delegate: allowedToPlay response: %@, %f", (uint8_t *)&v25, 0x16u);
    }
    v13 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v13, "asyncDelegateOperations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectAtIndex:", 0);

    v15 = *(void **)(a1 + 32);
    if (v15)
      v16 = (id)objc_msgSend(v15, "mutableCopy");
    else
      v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v18 = v16;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v19, CFSTR("Async delegate response key"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 64));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v20, CFSTR("Original time key"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKey:", v21, CFSTR("Adjusted time key"));

    v22 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v22, "stateMachine");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "postEvent:withContext:userInfo:", *(_QWORD *)(a1 + 40), 0, v18);

    v24 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v24, "_processNextAsyncDelegateOperation");

  }
  else
  {
LABEL_9:
    v17 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      _os_log_impl(&dword_228A4E000, v17, OS_LOG_TYPE_DEFAULT, "Async delegate: ignoring allowedToPlay response", (uint8_t *)&v25, 2u);
    }
  }

}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_578(uint64_t a1, __int128 *a2, void *a3, void *a4, uint64_t a5)
{
  id *v9;
  id v10;
  id v11;
  id WeakRetained;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void (*v17)(uint64_t, __int128 *, id, __int128 *, void *, uint64_t, double);
  id v18;
  void *v19;
  id v20;
  __int128 v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;

  v9 = (id *)(a1 + 40);
  v10 = a4;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained(v9);
  objc_msgSend(WeakRetained, "setPostLoadingState:", v10);

  v13 = objc_loadWeakRetained(v9);
  objc_msgSend(v13, "AVQueuePlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setResourceConservationLevelWhilePaused:", 0);

  v15 = *(_QWORD *)(a1 + 32);
  +[TVPPlaybackState loading](TVPPlaybackState, "loading");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(void (**)(uint64_t, __int128 *, id, __int128 *, void *, uint64_t, double))(v15 + 16);
  v24 = *a2;
  v25 = *((_QWORD *)a2 + 2);
  v22 = *MEMORY[0x24BDC0D88];
  v23 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v17(v15, &v24, v11, &v22, v16, a5, 0.0);

  v18 = objc_loadWeakRetained(v9);
  objc_msgSend(v18, "externalImagePlayer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "invalidate");

  v20 = objc_loadWeakRetained(v9);
  objc_msgSend(v20, "setExternalImagePlayer:", 0);

  return CFSTR("Waiting for seek");
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_580(uint64_t a1, __int128 *a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, _QWORD *a9)
{
  id v14;
  id *v15;
  id WeakRetained;
  int v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  int v24;
  id v25;
  void (*v26)(void);
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void (*v31)(void);
  uint64_t v32;
  void (*v33)(void);
  uint64_t v34;
  void (*v35)(void);
  void *v36;
  void (*v37)(void);
  void (*v38)(void);
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  uint64_t v50;
  id v51;

  v14 = a3;
  v46 = a5;
  v48 = a6;
  v47 = a7;
  v15 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v17 = objc_msgSend(WeakRetained, "usesLegacyDelegateBehavior");

  v18 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v18, "stateMachine");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "currentState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v22 = v21;
  if (a9)
    *a9 = objc_retainAutorelease(v21);
  if (!v17)
  {
    +[TVPPlaybackState playing](TVPPlaybackState, "playing");
    v29 = (id)objc_claimAutoreleasedReturnValue();

    if (v29 == v46)
    {
      if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
      {
        if (v14)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
          v25 = v14;

          v35 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
          v49 = *a2;
          v50 = *((_QWORD *)a2 + 2);
          v27 = v46;
          v35();
          v32 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          v38 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
          v49 = *a2;
          v50 = *((_QWORD *)a2 + 2);
          v27 = v46;
          v38();
          v32 = objc_claimAutoreleasedReturnValue();
          v25 = 0;
        }

        v49 = *a2;
        v50 = *((_QWORD *)a2 + 2);
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v49);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKey:", v39, CFSTR("Elapsed CMTime key"));

        goto LABEL_25;
      }
    }
    else
    {
      +[TVPPlaybackState paused](TVPPlaybackState, "paused");
      v30 = (id)objc_claimAutoreleasedReturnValue();

      if (v30 == v46)
      {
        if (v14)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
          v25 = v14;

          v31 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
          v49 = *a2;
          v50 = *((_QWORD *)a2 + 2);
          v27 = v46;
          v31();
          v32 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          v37 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
          v49 = *a2;
          v50 = *((_QWORD *)a2 + 2);
          v27 = v46;
          v37();
          v32 = objc_claimAutoreleasedReturnValue();

          v25 = 0;
        }
LABEL_25:
        v20 = (void *)v32;
        goto LABEL_26;
      }
    }
    v25 = v14;
    v27 = v46;
    goto LABEL_26;
  }
  if (v14)
  {
    v23 = *(_QWORD *)(a1 + 32);
    v51 = v14;
    v24 = (*(uint64_t (**)(void))(v23 + 16))();
    v25 = v14;

    if (v24)
    {
      v26 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      v49 = *a2;
      v50 = *((_QWORD *)a2 + 2);
      v27 = v46;
      v26();
      v28 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v28;
      if (!v25)
        goto LABEL_26;
      goto LABEL_19;
    }
    v27 = v46;
    if (v25)
LABEL_19:
      objc_msgSend(v22, "setObject:forKey:", v25, CFSTR("Playback date key"));
  }
  else
  {
    if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
    {
      v33 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
      v49 = *a2;
      v50 = *((_QWORD *)a2 + 2);
      v27 = v46;
      v33();
      v34 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v34;
    }
    else
    {
      v27 = v46;
    }
    v49 = *a2;
    v50 = *((_QWORD *)a2 + 2);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v49);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v36, CFSTR("Elapsed CMTime key"));

    v25 = 0;
  }
LABEL_26:
  v40 = objc_loadWeakRetained(v15);
  objc_msgSend(v40, "stateMachine");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "currentState");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v20, "isEqualToString:", v42) ^ 1;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:forKey:", v44, CFSTR("Allowed key"));

  return v20;
}

TVPMutableChapterCollection *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_582(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  TVPAVTimedMetadataGroupChapter *v21;
  TVPMutableChapterCollection *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "selectedAudioOption");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "languageCodeBCP47");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v4, "addObject:", v6);
  if (v9)
    objc_msgSend(v4, "addObject:", v9);
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v3, "statusOfValueForKey:error:", CFSTR("availableChapterLocales"), 0) == 2)
  {
    objc_msgSend(v3, "chapterMetadataGroupsBestMatchingPreferredLanguages:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v3;
    if (!objc_msgSend(v11, "count"))
    {
      objc_msgSend(v3, "availableChapterLocales");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v30[0] = *MEMORY[0x24BDB1D90];
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "chapterMetadataGroupsWithTitleLocale:containingItemsWithCommonKeys:", v13, v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v15;
      }

    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v16 = v11;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v26;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v16);
          v21 = -[TVPAVTimedMetadataGroupChapter initWithAVTimedMetadataGroup:filterByLanguages:]([TVPAVTimedMetadataGroupChapter alloc], "initWithAVTimedMetadataGroup:filterByLanguages:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v20), v4);
          objc_msgSend(v10, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v18);
    }

    v3 = v24;
  }
  if (objc_msgSend(v10, "count"))
  {
    v22 = objc_alloc_init(TVPMutableChapterCollection);
    -[TVPChapterCollection setChapters:](v22, "setChapters:", v10);
    -[TVPChapterCollection setType:](v22, "setType:", 0);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

TVPMutableChapterCollection *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_588(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double Seconds;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  TVPMutableChapter *v22;
  TVPTimeRange *v23;
  TVPMutableChapterCollection *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  TVPMutableChapter *v29;
  TVPTimeRange *v30;
  TVPMutableChapter *v31;
  TVPTimeRange *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CMTime time;
  CMTime v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  memset(&v39, 0, sizeof(v39));
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "cachedDuration");
  else
    memset(&v39, 0, sizeof(v39));

  if ((v39.flags & 0x1D) == 1)
  {
    v4 = objc_loadWeakRetained(v1);
    objc_msgSend(v4, "currentMediaItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataInterstitialCollection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    time = v39;
    Seconds = CMTimeGetSeconds(&time);
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (v6)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      objc_msgSend(v6, "interstitialsWithAdjacentsMerged", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v35;
        v13 = 0.0;
        do
        {
          v14 = 0;
          v15 = v13;
          do
          {
            if (*(_QWORD *)v35 != v12)
              objc_enumerationMutation(v9);
            v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v14);
            objc_msgSend(v16, "timeRange");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "endTime");
            v13 = v18;

            if (v15 != 0.0
              || (objc_msgSend(v16, "timeRange"),
                  v19 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v19, "startTime"),
                  v21 = v20,
                  v19,
                  v21 != 0.0))
            {
              v22 = objc_alloc_init(TVPMutableChapter);
              v23 = -[TVPTimeRange initWithStartTime:endTime:]([TVPTimeRange alloc], "initWithStartTime:endTime:", v15, v13);
              -[TVPChapter setTimeRange:](v22, "setTimeRange:", v23);
              objc_msgSend(v8, "addObject:", v22);

            }
            ++v14;
            v15 = v13;
          }
          while (v11 != v14);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
        }
        while (v11);
      }
      else
      {
        v13 = 0.0;
      }

      if (v13 < Seconds)
      {
        v31 = objc_alloc_init(TVPMutableChapter);
        v32 = -[TVPTimeRange initWithStartTime:endTime:]([TVPTimeRange alloc], "initWithStartTime:endTime:", v13, Seconds);
        -[TVPChapter setTimeRange:](v31, "setTimeRange:", v32);
        objc_msgSend(v8, "addObject:", v31);

      }
    }
    else
    {
      if (Seconds / 20.0 >= 30.0)
        v25 = Seconds / 20.0;
      else
        v25 = 30.0;
      if (Seconds > 0.0)
      {
        v26 = 0.0;
        do
        {
          v27 = v25 + v26;
          if (v25 + v26 <= Seconds)
            v28 = v25 + v26;
          else
            v28 = Seconds;
          v29 = objc_alloc_init(TVPMutableChapter);
          v30 = -[TVPTimeRange initWithStartTime:endTime:]([TVPTimeRange alloc], "initWithStartTime:endTime:", v26, v28);
          -[TVPChapter setTimeRange:](v29, "setTimeRange:", v30);
          objc_msgSend(v8, "addObject:", v29);

          v26 = v25 + v26;
        }
        while (v27 < Seconds);
      }
    }
    if (objc_msgSend(v8, "count"))
    {
      v24 = objc_alloc_init(TVPMutableChapterCollection);
      -[TVPChapterCollection setChapters:](v24, "setChapters:", v8);
      -[TVPChapterCollection setType:](v24, "setType:", 1);
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }
  return v24;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_591(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCurrentPlayerItem:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setPlayerItemFromCacheManager:", 0);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setAVQueuePlayer:", 0);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "setHaveEverEnqueuedPlayerItem:", 0);

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "setEarlyAVQueuePlayer:", 0);

  v7 = objc_loadWeakRetained(v1);
  objc_msgSend(v7, "externalImagePlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  v9 = objc_loadWeakRetained(v1);
  objc_msgSend(v9, "setExternalImagePlayer:", 0);

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v10 = objc_loadWeakRetained(v1);
  objc_msgSend(v10, "mediaItemLoaders");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v52;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v52 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v15);
        v17 = objc_loadWeakRetained(v1);
        objc_msgSend(v17, "_removeObserversForMediaItemLoader:", v16);

        objc_msgSend(v16, "cleanupIfNecessary");
        v18 = objc_loadWeakRetained(v1);
        objc_msgSend(v18, "mediaItemLoaders");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v13);
  }

  v20 = objc_loadWeakRetained(v1);
  +[TVPPlaybackState playing](TVPPlaybackState, "playing");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPostLoadingState:", v21);

  v22 = objc_loadWeakRetained(v1);
  v49 = *MEMORY[0x24BDC0D88];
  v46 = v49;
  v50 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v23 = v50;
  objc_msgSend(v22, "setTimeBeingSeekedTo:", &v49);

  v24 = objc_loadWeakRetained(v1);
  v49 = v46;
  v50 = v23;
  objc_msgSend(v24, "setTimeAtStartOfSeek:", &v49);

  v25 = objc_loadWeakRetained(v1);
  objc_msgSend(v25, "setPlaybackDateAtStartOfSeek:", 0);

  v26 = objc_loadWeakRetained(v1);
  objc_msgSend(v26, "setDateBeingSeekedTo:", 0);

  v27 = objc_loadWeakRetained(v1);
  objc_msgSend(v27, "setLoadingInitialItemInPlaylist:", 1);

  v28 = objc_loadWeakRetained(v1);
  objc_msgSend(v28, "setInitialMediaItemHasCompletedInitialLoading:", 0);

  v29 = objc_loadWeakRetained(v1);
  objc_msgSend(v29, "setCurrentDirectionOfPlaylistChange:", 0);

  v30 = objc_loadWeakRetained(v1);
  objc_msgSend(v30, "setCurrentMediaItemVideoRange:", 0);

  v31 = objc_loadWeakRetained(v1);
  objc_msgSend(v31, "setCurrentMediaItemAudioFormat:", 0);

  v32 = objc_loadWeakRetained(v1);
  objc_msgSend(v32, "setCurrentMediaItemAudioChannels:", -1);

  v33 = objc_loadWeakRetained(v1);
  v49 = v46;
  v50 = v23;
  objc_msgSend(v33, "setCachedElapsedCMTime:", &v49);

  v34 = objc_loadWeakRetained(v1);
  objc_msgSend(v34, "progressiveJumpingScrubber");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "cancelScrub");

  v36 = objc_loadWeakRetained(v1);
  objc_msgSend(v36, "setProgressiveJumpingScrubber:", 0);

  v37 = objc_loadWeakRetained(v1);
  objc_msgSend(v37, "setMediaItemChangeReason:", 0);

  v38 = objc_loadWeakRetained(v1);
  objc_msgSend(v38, "setSceneCompletelyBuffered:", 0);

  v39 = objc_loadWeakRetained(v1);
  objc_msgSend(v39, "asyncDelegateOperations");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "removeAllObjects");

  v41 = objc_loadWeakRetained(v1);
  objc_msgSend(v41, "setTemporarySubtitleOverrideType:", 0);

  v42 = objc_loadWeakRetained(v1);
  objc_msgSend(v42, "setUnqueuedPlayerItem:", 0);

  v43 = objc_loadWeakRetained(v1);
  objc_msgSend(v43, "setPlayerItemChangeIsHappening:", 0);

  v44 = objc_loadWeakRetained(v1);
  objc_msgSend(v44, "stateMachine");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_592;
  v47[3] = &unk_24F15C088;
  objc_copyWeak(&v48, v1);
  objc_msgSend(v45, "executeBlockAfterCurrentStateTransition:", v47);

  objc_destroyWeak(&v48);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_592(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  __int128 v25;
  uint64_t v26;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setWaitsAfterPreparingMediaItems:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setCurrentMediaItemInitialLoadingComplete:", 0);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setCurrentMediaItemHasVideoContent:", 0);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "setCurrentMediaItemIsStreaming:", 0);

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "setIsLive:", 0);

  v7 = objc_loadWeakRetained(v1);
  objc_msgSend(v7, "setCurrentMediaItemPresentationSize:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));

  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "setCurrentMediaItemHasDates:", 0);

  v9 = objc_loadWeakRetained(v1);
  objc_msgSend(v9, "setNumOutstandingSeeks:", 0);

  v10 = objc_loadWeakRetained(v1);
  v25 = *MEMORY[0x24BDC0D40];
  v26 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
  objc_msgSend(v10, "setCachedDuration:", &v25);

  v11 = objc_loadWeakRetained(v1);
  objc_msgSend(v11, "setCachedLoadedTimeRanges:", 0);

  v12 = objc_loadWeakRetained(v1);
  objc_msgSend(v12, "setCachedSeekableTimeRanges:", 0);

  v13 = objc_loadWeakRetained(v1);
  objc_msgSend(v13, "setChapterCollections:", 0);

  v14 = objc_loadWeakRetained(v1);
  objc_msgSend(v14, "setCurrentChapterCollection:", 0);

  v15 = objc_loadWeakRetained(v1);
  objc_msgSend(v15, "setCurrentChapter:", 0);

  v16 = objc_loadWeakRetained(v1);
  objc_msgSend(v16, "setCurrentInterstitialCollection:", 0);

  v17 = objc_loadWeakRetained(v1);
  objc_msgSend(v17, "setCurrentInterstitial:", 0);

  v18 = objc_loadWeakRetained(v1);
  objc_msgSend(v18, "setAudioOptions:", 0);

  v19 = objc_loadWeakRetained(v1);
  objc_msgSend(v19, "setSubtitleOptions:", 0);

  v20 = objc_loadWeakRetained(v1);
  objc_msgSend(v20, "setCachedSelectedAudioOption:", 0);

  v21 = objc_loadWeakRetained(v1);
  objc_msgSend(v21, "willChangeValueForKey:", CFSTR("selectedAudioOption"));

  v22 = objc_loadWeakRetained(v1);
  objc_msgSend(v22, "didChangeValueForKey:", CFSTR("selectedAudioOption"));

  v23 = objc_loadWeakRetained(v1);
  objc_msgSend(v23, "willChangeValueForKey:", CFSTR("selectedSubtitleOption"));

  v24 = objc_loadWeakRetained(v1);
  objc_msgSend(v24, "didChangeValueForKey:", CFSTR("selectedSubtitleOption"));

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_593(uint64_t a1, int a2, void *a3)
{
  uint64_t v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v5 = 40;
  if (a2)
    v5 = 32;
  (*(void (**)(void))(*(_QWORD *)(a1 + v5) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  +[TVPPlaybackState stopped](TVPPlaybackState, "stopped");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_setState:updatedRate:reason:notifyListeners:", v7, v9, 1, 0.0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v8 = objc_loadWeakRetained((id *)(a1 + 56));
  if (v8)
    objc_msgSend((id)objc_opt_class(), "_playerDidBecomeInactive:", v8);

}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_8_595(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  NSObject *v18;
  uint8_t v20[8];
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "playlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endAction");

  v6 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v6, "playlist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "endAction");

  if (v8 == 2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v9 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v9, "setPostLoadingState:", v3);

    v10 = objc_loadWeakRetained((id *)(a1 + 56));
    +[TVPPlaybackState loading](TVPPlaybackState, "loading");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_setState:updatedRate:notifyListeners:", v11, 1, 0.0);

    v12 = *(void **)(a1 + 32);
    v13 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9_596;
    v25[3] = &unk_24F15C088;
    v14 = &v26;
    objc_copyWeak(&v26, (id *)(a1 + 56));
    objc_msgSend(v12, "executeBlockAfterCurrentStateTransition:", v25);
    v15 = *(void **)(a1 + 32);
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_10;
    v23[3] = &unk_24F15C088;
    objc_copyWeak(&v24, (id *)(a1 + 56));
    objc_msgSend(v15, "executeBlockAfterCurrentStateTransition:", v23);
    objc_destroyWeak(&v24);
    v16 = CFSTR("Waiting for more playlist items");
  }
  else
  {
    v17 = *(void **)(a1 + 32);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_11;
    v21[3] = &unk_24F15C088;
    v14 = &v22;
    objc_copyWeak(&v22, (id *)(a1 + 56));
    objc_msgSend(v17, "executeBlockAfterCurrentStateTransition:", v21);
    v18 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_228A4E000, v18, OS_LOG_TYPE_DEFAULT, "Stopping because the end of the playlist has been reached", v20, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v16 = CFSTR("Stopped");
  }
  objc_destroyWeak(v14);

  return v16;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9_596(uint64_t a1)
{
  id WeakRetained;
  __int128 v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = *MEMORY[0x24BDC0D88];
  v3 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  objc_msgSend(WeakRetained, "_notifyListenersOfElapsedTimeChange:playbackDate:dueToTimeJump:", &v2, 0, 1);

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVPPlaybackPlaylistDidFinishNotification"), WeakRetained);

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_11(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVPPlaybackPlaylistDidFinishNotification"), WeakRetained);

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_598(uint64_t a1, uint64_t a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  char v18;
  NSObject *v19;
  const __CFString *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  __CFString *v30;
  void *v31;
  void *v32;
  char v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  __CFString *v38;
  __CFString **v39;
  __CFString *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD *v46;
  id *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v53;
  void *v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[5];
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  const __CFString *v67;
  __int16 v68;
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "playlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentMediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "playlist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nextMediaItem");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {
    if (a2 == 1)
    {
      if (v54)
      {
        if ((objc_msgSend(v54, "hasTrait:", CFSTR("TVPMediaItemTraitOptimizeForHighLatency")) & 1) == 0
          && (objc_msgSend(v54, "hasTrait:", CFSTR("TVPMediaItemTraitPreventSpeculativeLoading")) & 1) == 0)
        {
          objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("DisableSpeculativeLoading"));

          if ((v10 & 1) == 0)
          {
            v11 = v54;
            goto LABEL_9;
          }
        }
      }
    }
  }
  else
  {
    v11 = v6;
    if (v11)
    {
LABEL_9:
      +[TVPMediaItemLoader loaderForMediaItem:](TVPMediaItemLoader, "loaderForMediaItem:", v11, v11);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_loadWeakRetained(v3);
      objc_msgSend(v53, "setAllowsCellularUsage:", objc_msgSend(v12, "allowsCellularUsage"));

      v13 = objc_loadWeakRetained(v3);
      objc_msgSend(v53, "setAllowsConstrainedNetworkUsage:", objc_msgSend(v13, "allowsConstrainedNetworkUsage"));

      objc_msgSend(v53, "state");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", 0x24F15F8F8);

      v51 = v15;
      if (v15)
        objc_msgSend(v53, "cleanupIfNecessary");
      v16 = objc_loadWeakRetained(v3);
      objc_msgSend(v16, "mediaItemLoaders");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "containsObject:", v53);

      if ((v18 & 1) == 0)
      {
        v19 = sPlayerLogObject;
        if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
        {
          v20 = CFSTR("next");
          if (!a2)
            v20 = CFSTR("current");
          *(_DWORD *)buf = 138412546;
          v67 = v20;
          v68 = 2112;
          v69 = v53;
          _os_log_impl(&dword_228A4E000, v19, OS_LOG_TYPE_DEFAULT, "Loading %@ media item: %@", buf, 0x16u);
        }
        v21 = objc_loadWeakRetained(v3);
        objc_msgSend(v21, "mediaItemLoaders");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v53);

        v23 = objc_loadWeakRetained(v3);
        objc_msgSend(v23, "_addObserversForMediaItemLoader:", v53);

        v51 = 1;
      }
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v24 = objc_loadWeakRetained(v3);
      objc_msgSend(v24, "mediaItemLoaders");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v25, "copy");

      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v62 != v28)
              objc_enumerationMutation(v26);
            v30 = *(__CFString **)(*((_QWORD *)&v61 + 1) + 8 * i);
            -[__CFString mediaItem](v30, "mediaItem");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v31, "isEqualToMediaItem:", v6) & 1) == 0)
            {
              -[__CFString mediaItem](v30, "mediaItem");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "isEqualToMediaItem:", v54);

              if ((v33 & 1) != 0)
                continue;
              v34 = sPlayerLogObject;
              if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v67 = v30;
                _os_log_impl(&dword_228A4E000, v34, OS_LOG_TYPE_DEFAULT, "Cleaning up media item loader that is no longer in use: %@", buf, 0xCu);
              }
              v35 = objc_loadWeakRetained(v3);
              objc_msgSend(v35, "_removeObserversForMediaItemLoader:", v30);

              -[__CFString cleanupIfNecessary](v30, "cleanupIfNecessary");
              v31 = objc_loadWeakRetained(v3);
              objc_msgSend(v31, "mediaItemLoaders");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "removeObject:", v30);

            }
          }
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
        }
        while (v27);
      }

      objc_msgSend(v53, "state");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = TVPPlaybackReportingHLSPlaylistPreloadStateNone;
      if ((objc_msgSend(v37, "isEqualToString:", 0x24F163DD8) & 1) != 0)
      {
        v39 = &TVPPlaybackReportingHLSPlaylistPreloadStatePartial;
      }
      else
      {
        if ((objc_msgSend(v37, "isEqualToString:", 0x24F163DF8) & 1) == 0
          && (objc_msgSend(v37, "isEqualToString:", 0x24F163E18) & 1) == 0
          && !objc_msgSend(v37, "isEqualToString:", 0x24F163E38))
        {
LABEL_37:
          v41 = objc_loadWeakRetained(v3);
          objc_msgSend(v41, "currentMediaItem");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "addSingleShotEventWithName:value:", TVPPlaybackReportingEventHLSPlaylistPreloadState, v38);

          if (v51)
            objc_msgSend(v53, "loadIfNecessary");
          objc_msgSend(v53, "state");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v44, "isEqualToString:", 0x24F163D98) & 1) != 0)
            goto LABEL_44;
          if ((objc_msgSend(v44, "isEqualToString:", 0x24F163DB8) & 1) != 0
            || objc_msgSend(v44, "isEqualToString:", 0x24F163DD8))
          {
            v45 = *(void **)(a1 + 32);
            v59[0] = MEMORY[0x24BDAC760];
            v59[1] = 3221225472;
            v59[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_605;
            v59[3] = &unk_24F15C218;
            v46 = v59;
            v59[4] = v53;
            v47 = &v60;
            objc_copyWeak(&v60, v3);
            objc_msgSend(v45, "executeBlockAfterCurrentStateTransition:", v59);
          }
          else if ((objc_msgSend(v44, "isEqualToString:", 0x24F163DF8) & 1) != 0
                 || objc_msgSend(v44, "isEqualToString:", 0x24F163E18))
          {
            v48 = *(void **)(a1 + 32);
            v57[0] = MEMORY[0x24BDAC760];
            v57[1] = 3221225472;
            v57[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_606;
            v57[3] = &unk_24F15C218;
            v46 = v57;
            v57[4] = v53;
            v47 = &v58;
            objc_copyWeak(&v58, v3);
            objc_msgSend(v48, "executeBlockAfterCurrentStateTransition:", v57);
          }
          else
          {
            if (!objc_msgSend(v44, "isEqualToString:", 0x24F163E38))
              goto LABEL_44;
            v49 = *(void **)(a1 + 32);
            v55[0] = MEMORY[0x24BDAC760];
            v55[1] = 3221225472;
            v55[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_607;
            v55[3] = &unk_24F15C218;
            v46 = v55;
            v55[4] = v53;
            v47 = &v56;
            objc_copyWeak(&v56, v3);
            objc_msgSend(v49, "executeBlockAfterCurrentStateTransition:", v55);
          }
          objc_destroyWeak(v47);

LABEL_44:
          goto LABEL_45;
        }
        v39 = &TVPPlaybackReportingHLSPlaylistPreloadStateFull;
      }
      v40 = *v39;

      v38 = v40;
      goto LABEL_37;
    }
  }
LABEL_45:

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_605(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("Media item loader key");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postEvent:withContext:userInfo:", CFSTR("Media item loader did prepare item for loading"), 0, v3);

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_606(uint64_t a1)
{
  id *v1;
  uint64_t v2;
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v1 = (id *)a1;
  v9[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v8 = CFSTR("Media item loader key");
  v9[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v1 += 5;
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postEvent:withContext:userInfo:", CFSTR("Media item loader did prepare item for loading"), 0, v3);

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Media item loader did load AVAsset keys"), 0, v3);

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_607(uint64_t a1)
{
  id *v1;
  uint64_t v2;
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v1 = (id *)a1;
  v11[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v10 = CFSTR("Media item loader key");
  v11[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v1 += 5;
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postEvent:withContext:userInfo:", CFSTR("Media item loader did prepare item for loading"), 0, v3);

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postEvent:withContext:userInfo:", CFSTR("Media item loader did load AVAsset keys"), 0, v3);

  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "stateMachine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postEvent:withContext:userInfo:", CFSTR("Media item did prepare for playback initiation"), 0, v3);

}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_609(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  NSObject *v17;
  __CFString *v18;
  int v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  int v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "currentMediaItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("direction"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  objc_msgSend(v6, "objectForKey:", CFSTR("TVPPlaylistDidHitBeginningKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v6, "objectForKey:", CFSTR("TVPPlaylistDidHitEndKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v6, "objectForKey:", CFSTR("Changing media because AVFoundation advanced key"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  if (!v12)
  {
    if (v8)
      v19 = v14;
    else
      v19 = 1;
    if (v19 == 1)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    objc_msgSend(v8, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addEndEventWithName:", TVPPlaybackReportingEventUserPlayToLoadingInitiation);

    if ((v16 & 1) != 0)
    {
LABEL_23:
      v30 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v30, "setCurrentDirectionOfPlaylistChange:", v10);

      v31 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v31, "_updateAVPlayerActionAtItemEnd");

      v32 = *(void **)(a1 + 32);
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_610;
      v39[3] = &unk_24F15C218;
      v40 = v8;
      objc_copyWeak(&v41, (id *)(a1 + 64));
      objc_msgSend(v32, "executeBlockAfterCurrentStateTransition:", v39);
      v33 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v33, "setPostLoadingState:", v5);

      v34 = objc_loadWeakRetained((id *)(a1 + 64));
      +[TVPPlaybackState loading](TVPPlaybackState, "loading");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "_setState:updatedRate:notifyListeners:", v35, 1, 0.0);

      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      objc_destroyWeak(&v41);

      v18 = CFSTR("Waiting for media item to prepare for loading");
      goto LABEL_24;
    }
    v21 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v21, "AVQueuePlayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "items");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v24, "setModifyingAVPlayerQueue:", 1);

    if (!v10 && objc_msgSend(v23, "count") == 2)
    {
      objc_msgSend(v23, "objectAtIndex:", 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v25, "mediaItemLoader");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "mediaItem");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v26, "isEqualToMediaItem:", v8);

        if (v37)
        {
          v27 = sPlayerLogObject;
          if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_228A4E000, v27, OS_LOG_TYPE_DEFAULT, "Calling advanceToNextItem since item added previously matches newly current item", buf, 2u);
          }
          objc_msgSend(v22, "advanceToNextItem");
LABEL_22:
          v29 = objc_loadWeakRetained((id *)(a1 + 64));
          objc_msgSend(v29, "setModifyingAVPlayerQueue:", 0);

          goto LABEL_23;
        }
      }
      else
      {

      }
    }
    v28 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v28, OS_LOG_TYPE_DEFAULT, "Calling removeAllItems", buf, 2u);
    }
    objc_msgSend(v22, "removeAllItems");
    goto LABEL_22;
  }
  v17 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228A4E000, v17, OS_LOG_TYPE_DEFAULT, "Stopping because there are no more items in playlist going backwards", buf, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v18 = CFSTR("Stopped");
LABEL_24:

  return v18;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_610(uint64_t a1)
{
  void *v2;
  void *v3;
  Float64 v4;
  id WeakRetained;
  CMTime v6;
  CMTime v7;

  objc_msgSend(*(id *)(a1 + 32), "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataStartTime"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  memset(&v7, 0, sizeof(v7));
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    CMTimeMakeWithSeconds(&v7, v4, 1000000);
  }
  else
  {
    v7 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v7;
  objc_msgSend(WeakRetained, "_notifyListenersOfElapsedTimeChange:playbackDate:dueToTimeJump:", &v6, 0, 1);

}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_612(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  void *v14;
  const __CFString *v15;
  _QWORD block[4];
  char v18;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "playlist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentMediaItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v7)
      objc_msgSend((id)objc_opt_class(), "_playerWillBecomeActive:", v7);
    v8 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v8, "_updateMediaRemoteManager");

    v9 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v9, "playlist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumConsecutivePlaybackFailures:", 0);

    v11 = objc_msgSend(v6, "hasTrait:", CFSTR("TVPMediaItemTraitForceSoundCheck"));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_613;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    v18 = v11;
    dispatch_async((dispatch_queue_t)sAVAudioSessionQueue, block);
    v12 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v12, "setPostLoadingState:", v3);

    v13 = objc_loadWeakRetained((id *)(a1 + 40));
    +[TVPPlaybackState loading](TVPPlaybackState, "loading");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setState:updatedRate:notifyListeners:", v14, 1, 0.0);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v15 = CFSTR("Waiting for media item to prepare for loading");
  }
  else
  {
    v15 = CFSTR("Stopped");
  }

  return v15;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_613(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  void *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 32))
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Setting forceSoundCheck to %@", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForceSoundCheck:error:", *(unsigned __int8 *)(a1 + 32), 0);

}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_615(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return CFSTR("Stopped");
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_617(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  id WeakRetained;
  void *v13;
  __CFString *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  __CFString *v23;
  __CFString *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  __CFString *v34;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  __CFString *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v36 = a2;
  v37 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKey:", CFSTR("Playlist key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "playlistInternal");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11 && v13 || v11 && !v13 || v11 && v13 && (objc_msgSend(v11, "isEqual:", v13) & 1) == 0)
  {
    v15 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v11, "currentMediaItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v17;
      _os_log_impl(&dword_228A4E000, v16, OS_LOG_TYPE_DEFAULT, "Playlist's initial current media item: %@", buf, 0xCu);

    }
    v18 = (void *)sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      objc_msgSend(v11, "nextMediaItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v20;
      _os_log_impl(&dword_228A4E000, v19, OS_LOG_TYPE_DEFAULT, "Playlist's initial next media item: %@", buf, 0xCu);

    }
    objc_msgSend(v10, "objectForKey:", CFSTR("Being invalidated key"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    v23 = CFSTR("Player invalidated");
    if (!v22)
      v23 = CFSTR("New playlist set");
    v24 = v23;
    v25 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v25, "currentMediaItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_removeObserversForMediaItem:", v26);

    v27 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v27, "willChangeValueForKey:", CFSTR("playlistInternal"));

    v28 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v28, "willChangeValueForKey:", CFSTR("playlist"));

    v29 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v29, "_postCurrentMediaItemWillChangeNotificationWithDirection:reason:didHitBeginningOfPlaylist:didHitEndOfPlaylist:", 0, v24, 0, 0);

    objc_msgSend(*(id *)(a1 + 32), "currentState");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = objc_msgSend(v30, "isEqualToString:", CFSTR("Stopped"));

    if ((_DWORD)v26)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    else
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v31 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v11, "currentMediaItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_addObserversForMediaItem:", v32);

    v33 = *(void **)(a1 + 32);
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_618;
    v38[3] = &unk_24F15C738;
    objc_copyWeak(&v41, (id *)(a1 + 56));
    v39 = v11;
    v34 = v24;
    v40 = v34;
    objc_msgSend(v33, "executeBlockAfterCurrentStateTransition:", v38);

    objc_destroyWeak(&v41);
    v14 = CFSTR("Stopped");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "currentState");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_618(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setPlaylistInternal:", *(_QWORD *)(a1 + 32));

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "didChangeValueForKey:", CFSTR("playlistInternal"));

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "didChangeValueForKey:", CFSTR("playlist"));

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "_postCurrentMediaItemDidChangeNotificationWithDirection:reason:didHitBeginningOfPlaylist:didHitEndOfPlaylist:", 0, *(_QWORD *)(a1 + 40), 0, 0);

  v8 = objc_loadWeakRetained(v2);
  objc_msgSend(v8, "currentMediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCurrentMediaItemIsStreaming:", objc_msgSend(v7, "hasTrait:", CFSTR("TVPMediaItemTraitIsStreaming")));

}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_619(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "currentMediaItemLoader");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", 0x24F163DF8))
  {
    v5 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_620;
    v7[3] = &unk_24F15BCB0;
    v8 = v3;
    v9 = *(id *)(a1 + 32);
    objc_msgSend(v5, "executeBlockAfterCurrentStateTransition:", v7);

  }
  return CFSTR("Waiting for AVAsset to load");
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_620(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v4 = CFSTR("Media item loader key");
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "postEvent:withContext:userInfo:", CFSTR("Media item loader did load AVAsset keys"), 0, v3);

}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_621(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(a5, "objectForKey:", CFSTR("Play completion key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v7 = *(_QWORD *)(a1 + 40);
  +[TVPPlaybackState playing](TVPPlaybackState, "playing");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_622(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id WeakRetained;
  void *v17;
  void *v18;
  id v20;
  void *v21;
  id v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  const char *v26;
  uint64_t v27;
  id v28;
  double v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[16];
  __int16 v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v32 = a3;
  v30 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKey:", CFSTR("Play completion key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("Ignore delegate key"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v10, "objectForKey:", CFSTR("Volume ramp duration key"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  v37 = 0uLL;
  v38 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v17 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "startTime", v30);
  }
  else
  {
    v37 = 0uLL;
    v38 = 0;
  }

  v35 = v37;
  v36 = v38;
  v34 = 0;
  if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_8;
  }
  v20 = objc_loadWeakRetained((id *)(a1 + 56));
  +[TVPPlaybackState playing](TVPPlaybackState, "playing");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPostLoadingState:", v21);

  v22 = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(v22, "AVQueuePlayer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23 == 0;

  if (v24)
  {
    v25 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v26 = "No AVPlayer exists yet, will set rate when AVPlayer is created";
      goto LABEL_15;
    }
  }
  else
  {
    if (!v11)
    {
      v27 = *(_QWORD *)(a1 + 40);
      v28 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v28, "rateUsedForPlayback");
      *(float *)&v29 = v29;
      (*(void (**)(uint64_t, float, double))(v27 + 16))(v27, *(float *)&v29, v15);

      goto LABEL_6;
    }
    v25 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v26 = "Not setting AVPlayer rate since AVKit will set it for us";
LABEL_15:
      _os_log_impl(&dword_228A4E000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 2u);
    }
  }
LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_8:
  objc_msgSend(v9, "currentState", v30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_623(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:withContext:userInfo:", CFSTR("Set elapsed time or date"), 0, *(_QWORD *)(a1 + 32));

}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_624(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id WeakRetained;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  double v29;
  __int128 v30;
  id v31;
  uint8_t buf[16];
  char v33;
  __int128 v34;
  uint64_t v35;
  char v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v31 = a4;
  v11 = a5;
  objc_msgSend(v11, "objectForKey:", CFSTR("Play completion key"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("Ignore delegate key"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v11, "objectForKey:", CFSTR("Volume ramp duration key"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  v30 = *MEMORY[0x24BDC0D88];
  v37 = *MEMORY[0x24BDC0D88];
  v38 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v36 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "currentPlayerItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v19, "currentPlayerItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      objc_msgSend(v20, "currentTime");
    }
    else
    {
      v34 = 0uLL;
      v35 = 0;
    }
    v37 = v34;
    v38 = v35;

  }
  v34 = v37;
  v35 = v38;
  v33 = 0;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v24 = objc_loadWeakRetained((id *)(a1 + 56));
    +[TVPPlaybackState playing](TVPPlaybackState, "playing");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setPostLoadingState:", v25);

    if (v12)
    {
      v26 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v26, OS_LOG_TYPE_DEFAULT, "Not setting AVPlayer rate since AVKit will set it for us", buf, 2u);
      }
    }
    else
    {
      v27 = *(_QWORD *)(a1 + 40);
      v28 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v28, "rateUsedForPlayback");
      *(float *)&v29 = v29;
      (*(void (**)(uint64_t, float, double))(v27 + 16))(v27, *(float *)&v29, v16);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  objc_msgSend(v9, "currentState", v30);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_625(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:withContext:userInfo:", CFSTR("Set elapsed time or date"), 0, *(_QWORD *)(a1 + 32));

}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_626(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id WeakRetained;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  double v22;
  void *v23;
  id v25;
  id v26;
  uint8_t buf[16];
  __int16 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v26 = a3;
  v25 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKey:", CFSTR("Play completion key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("Ignore delegate key"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v10, "objectForKey:", CFSTR("Volume ramp duration key"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  v31 = 0uLL;
  v32 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "currentPlayerItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "currentTime");
  }
  else
  {
    v31 = 0uLL;
    v32 = 0;
  }

  v29 = v31;
  v30 = v32;
  v28 = 0;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    if (v11)
    {
      v19 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v19, OS_LOG_TYPE_DEFAULT, "Not setting AVPlayer rate since AVKit will set it for us", buf, 2u);
      }
    }
    else
    {
      v20 = *(_QWORD *)(a1 + 40);
      v21 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v21, "rateUsedForPlayback");
      *(float *)&v22 = v22;
      (*(void (**)(uint64_t, float, double))(v20 + 16))(v20, *(float *)&v22, v15);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  objc_msgSend(v9, "currentState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_627(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CMTime v9;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = (void *)objc_msgSend(&__block_literal_global_629, "copy");
    objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("Play completion key"));

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postEvent:withContext:userInfo:", CFSTR("Set elapsed time or date"), 0, v2);

  v7 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v9 = *(CMTime *)(a1 + 64);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CMTimeGetSeconds(&v9));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v6 + 16))(v6, v7, 1, v8);

}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_630(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v22;
  _QWORD v23[3];

  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "objectForKey:", CFSTR("Ignore delegate key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("Play completion key"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "externalImagePlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "elapsedTime");
  else
    memset(v23, 0, sizeof(v23));
  v16 = objc_loadWeakRetained(v12);
  objc_msgSend(v16, "externalImagePlayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "playbackDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVPPlaybackState playing](TVPPlaybackState, "playing");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD *, void *, _QWORD, void *, id, id, BOOL, _QWORD))(v11 + 16))(v11, v23, v18, v22, v19, v8, v7, v10 == 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_631(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[3];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "externalImagePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRate:", 0.0);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "externalImagePlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v1);
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "lastTimeSentToAVKitImageHandler");
  else
    memset(v9, 0, sizeof(v9));
  objc_msgSend(v5, "setElapsedTime:", v9);

  return CFSTR("Waiting for AVKit seek after finishing external image scanning");
}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_632(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id *v13;
  id WeakRetained;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  double v23;
  id v24;
  void *v25;
  uint64_t v26;
  _QWORD v28[4];
  id v29;
  uint64_t v30;

  v7 = a2;
  v8 = a5;
  objc_msgSend(v8, "objectForKey:", CFSTR("Play completion key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("Volume ramp duration key"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  v13 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "progressiveJumpingScrubber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cancelScrub");

  v16 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v16, "setProgressiveJumpingScrubber:", 0);

  v17 = objc_loadWeakRetained((id *)(a1 + 40));
  +[TVPPlaybackState playing](TVPPlaybackState, "playing");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setPostLoadingState:", v18);

  v19 = objc_loadWeakRetained((id *)(a1 + 40));
  +[TVPPlaybackState loading](TVPPlaybackState, "loading");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setState:updatedRate:notifyListeners:", v20, 1, 0.0);

  v21 = *(_QWORD *)(a1 + 32);
  v22 = objc_loadWeakRetained(v13);
  objc_msgSend(v22, "rateUsedForPlayback");
  *(float *)&v23 = v23;
  (*(void (**)(uint64_t, float, double))(v21 + 16))(v21, *(float *)&v23, v12);

  v24 = objc_loadWeakRetained(v13);
  objc_msgSend(v24, "AVQueuePlayer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "timeControlStatus");

  if (v26 != 1)
  {
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_633;
    v28[3] = &unk_24F15BF70;
    v29 = v7;
    v30 = v26;
    objc_msgSend(v29, "executeBlockAfterCurrentStateTransition:", v28);

  }
  return CFSTR("Waiting for time control status to be done waiting");
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_633(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Posting time control status change since it is not AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate", v5, 2u);
  }
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:withContext:", CFSTR("Time control status did change"), v4);

}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id *v11;
  id WeakRetained;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  double v21;

  v6 = a5;
  objc_msgSend(v6, "objectForKey:", CFSTR("Play completion key"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("Volume ramp duration key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v11 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "progressiveJumpingScrubber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cancelScrub");

  v14 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v14, "setProgressiveJumpingScrubber:", 0);

  v15 = objc_loadWeakRetained((id *)(a1 + 40));
  +[TVPPlaybackState playing](TVPPlaybackState, "playing");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPostLoadingState:", v16);

  v17 = objc_loadWeakRetained((id *)(a1 + 40));
  +[TVPPlaybackState loading](TVPPlaybackState, "loading");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_setState:updatedRate:notifyListeners:", v18, 1, 0.0);

  v19 = *(_QWORD *)(a1 + 32);
  v20 = objc_loadWeakRetained(v11);
  objc_msgSend(v20, "rateUsedForPlayback");
  *(float *)&v21 = v21;
  (*(void (**)(uint64_t, float, double))(v19 + 16))(v19, *(float *)&v21, v10);

  return CFSTR("Waiting for seek");
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_635(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  id WeakRetained;
  double v16;
  void *v17;
  uint8_t v19[16];

  v7 = a5;
  v8 = a2;
  objc_msgSend(v7, "objectForKey:", CFSTR("Play completion key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("Volume ramp duration key"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  if (v9)
  {
    v13 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_228A4E000, v13, OS_LOG_TYPE_DEFAULT, "Not setting AVPlayer rate since AVKit will set it for us", v19, 2u);
    }
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "rateUsedForPlayback");
    *(float *)&v16 = v16;
    (*(void (**)(uint64_t, float, double))(v14 + 16))(v14, *(float *)&v16, v12);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(v8, "currentState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_636(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(a5, "objectForKey:", CFSTR("Play completion key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v7 = *(_QWORD *)(a1 + 40);
  +[TVPPlaybackState paused](TVPPlaybackState, "paused");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_637(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id WeakRetained;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  uint8_t *v20;
  void *v21;
  uint64_t v23;
  __int16 v24;
  char v25;

  v8 = a2;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v9, "objectForKey:", CFSTR("Ignore delegate key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", CFSTR("Play completion key"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v13 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  if (v13)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    +[TVPPlaybackState paused](TVPPlaybackState, "paused");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPostLoadingState:", v15);

    v16 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v16, "AVQueuePlayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (!v12)
      {
        (*(void (**)(float, double))(*(_QWORD *)(a1 + 40) + 16))(0.0, 0.0);
        goto LABEL_11;
      }
      v18 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 0;
        v19 = "Not setting AVPlayer rate since AVKit will set it for us";
        v20 = (uint8_t *)&v24;
LABEL_9:
        _os_log_impl(&dword_228A4E000, v18, OS_LOG_TYPE_DEFAULT, v19, v20, 2u);
      }
    }
    else
    {
      v18 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        v19 = "No AVPlayer exists yet, will set rate when AVPlayer is created";
        v20 = (uint8_t *)&v23;
        goto LABEL_9;
      }
    }
LABEL_11:
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
    goto LABEL_12;
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
LABEL_12:
  objc_msgSend(v8, "currentState", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_638(_QWORD *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  NSObject *v17;
  void (*v18)(void);
  void *v19;
  uint8_t v21[15];
  char v22;

  v8 = a2;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v9, "objectForKey:", CFSTR("Ignore delegate key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", CFSTR("Volume ramp duration key"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v9, "objectForKey:", CFSTR("Play completion key"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v16 = (*(uint64_t (**)(void))(a1[4] + 16))();

  if (v16)
  {
    if (v15)
    {
      v17 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_228A4E000, v17, OS_LOG_TYPE_DEFAULT, "Not setting AVPlayer rate since AVKit will set it for us", v21, 2u);
      }
    }
    else
    {
      (*(void (**)(float, double))(a1[5] + 16))(0.0, v14);
    }
    v18 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    v18 = *(void (**)(void))(a1[6] + 16);
  }
  v18();
  objc_msgSend(v8, "currentState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_639(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v22;
  _QWORD v23[3];

  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "objectForKey:", CFSTR("Ignore delegate key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("Play completion key"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "externalImagePlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "elapsedTime");
  else
    memset(v23, 0, sizeof(v23));
  v16 = objc_loadWeakRetained(v12);
  objc_msgSend(v16, "externalImagePlayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "playbackDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVPPlaybackState paused](TVPPlaybackState, "paused");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD *, void *, _QWORD, void *, id, id, BOOL, _QWORD))(v11 + 16))(v11, v23, v18, v22, v19, v8, v7, v10 == 0, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_640(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[3];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "externalImagePlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRate:", 0.0);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "externalImagePlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v1);
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "lastTimeSentToAVKitImageHandler");
  else
    memset(v9, 0, sizeof(v9));
  objc_msgSend(v5, "setElapsedTime:", v9);

  return CFSTR("Waiting for AVKit seek after finishing external image scanning");
}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_641(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[4];
  id v21;
  uint64_t v22;

  v7 = a2;
  objc_msgSend(a5, "objectForKey:", CFSTR("Play completion key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "progressiveJumpingScrubber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancelScrub");

  v11 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v11, "setProgressiveJumpingScrubber:", 0);

  v12 = objc_loadWeakRetained((id *)(a1 + 40));
  +[TVPPlaybackState paused](TVPPlaybackState, "paused");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPostLoadingState:", v13);

  v14 = objc_loadWeakRetained((id *)(a1 + 40));
  +[TVPPlaybackState loading](TVPPlaybackState, "loading");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setState:updatedRate:notifyListeners:", v15, 1, 0.0);

  (*(void (**)(float, double))(*(_QWORD *)(a1 + 32) + 16))(0.0, 0.0);
  v16 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v16, "AVQueuePlayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "timeControlStatus");

  if (v18 != 1)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_642;
    v20[3] = &unk_24F15BF70;
    v21 = v7;
    v22 = v18;
    objc_msgSend(v21, "executeBlockAfterCurrentStateTransition:", v20);

  }
  return CFSTR("Waiting for time control status to be done waiting");
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_642(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Posting time control status change since it is not AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate", v5, 2u);
  }
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:withContext:", CFSTR("Time control status did change"), v4);

}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_643(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  objc_msgSend(a5, "objectForKey:", CFSTR("Play completion key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "progressiveJumpingScrubber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancelScrub");

  v9 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v9, "setProgressiveJumpingScrubber:", 0);

  v10 = objc_loadWeakRetained((id *)(a1 + 40));
  +[TVPPlaybackState paused](TVPPlaybackState, "paused");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPostLoadingState:", v11);

  v12 = objc_loadWeakRetained((id *)(a1 + 40));
  +[TVPPlaybackState loading](TVPPlaybackState, "loading");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setState:updatedRate:notifyListeners:", v13, 1, 0.0);

  (*(void (**)(float, double))(*(_QWORD *)(a1 + 32) + 16))(0.0, 0.0);
  return CFSTR("Waiting for seek");
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_644(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t v12[16];

  v7 = a2;
  objc_msgSend(a5, "objectForKey:", CFSTR("Play completion key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Not setting AVPlayer rate since AVKit will set it for us", v12, 2u);
    }
  }
  else
  {
    (*(void (**)(float, double))(*(_QWORD *)(a1 + 32) + 16))(0.0, 0.0);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(v7, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_645(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  uint64_t v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];
  char v23;

  v8 = a2;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v9, "objectForKey:", CFSTR("Rate key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;
  objc_msgSend(v9, "objectForKey:", CFSTR("Play completion key"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v15 = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v13);

  if (v15)
  {
    v16 = *(_QWORD *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "currentPlayerItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      objc_msgSend(v18, "currentTime");
    else
      memset(v22, 0, sizeof(v22));
    (*(void (**)(uint64_t, _QWORD *, _QWORD, BOOL, double))(v16 + 16))(v16, v22, 0, v14 != 0, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, void *, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v14, 1);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(v8, "currentState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_646(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  uint64_t v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];
  char v23;

  v8 = a2;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v9, "objectForKey:", CFSTR("Rate key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;
  objc_msgSend(v9, "objectForKey:", CFSTR("Play completion key"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v15 = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v13);

  if (v15)
  {
    v16 = *(_QWORD *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "currentPlayerItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      objc_msgSend(v18, "currentTime");
    else
      memset(v22, 0, sizeof(v22));
    (*(void (**)(uint64_t, _QWORD *, _QWORD, BOOL, double))(v16 + 16))(v16, v22, 0, v14 != 0, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, void *, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v14, 1);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(v8, "currentState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_647(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  id WeakRetained;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v26[3];
  char v27;

  v8 = a2;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v9, "objectForKey:", CFSTR("Rate key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;
  objc_msgSend(v9, "objectForKey:", CFSTR("Play completion key"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v15 = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v13);

  if (v15)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if ((objc_msgSend(WeakRetained, "currentMediaItemIsStreaming") & 1) != 0)
    {
      v17 = 0;
    }
    else
    {
      v19 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v19, "currentPlayerItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v20, "isPlaybackBufferEmpty");

    }
    v21 = *(_QWORD *)(a1 + 40);
    v22 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v22, "currentPlayerItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
      objc_msgSend(v23, "currentTime");
    else
      memset(v26, 0, sizeof(v26));
    (*(void (**)(uint64_t, _QWORD *, uint64_t, BOOL, double))(v21 + 16))(v21, v26, v17, v14 != 0, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, void *, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v14, 1);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(v8, "currentState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_648(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  uint64_t v16;
  id WeakRetained;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[3];
  char v23;

  v8 = a2;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v9, "objectForKey:", CFSTR("Rate key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;
  objc_msgSend(v9, "objectForKey:", CFSTR("Play completion key"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v15 = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v13);

  if (v15)
  {
    v16 = *(_QWORD *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "externalImagePlayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      objc_msgSend(v18, "elapsedTime");
    else
      memset(v22, 0, sizeof(v22));
    (*(void (**)(uint64_t, _QWORD *, uint64_t, BOOL, double))(v16 + 16))(v16, v22, 1, v14 != 0, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, void *, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v14, 1);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(v8, "currentState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_649(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  void *v9;

  v7 = a2;
  objc_msgSend(a5, "objectForKey:", CFSTR("Play completion key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v7, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_650(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  int v15;
  id WeakRetained;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[3];
  char v24;

  v8 = a2;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v9, "objectForKey:", CFSTR("Rate key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;
  objc_msgSend(v9, "objectForKey:", CFSTR("Play completion key"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v15 = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v13);

  if (v15)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    v17 = objc_msgSend(WeakRetained, "currentMediaItemIsStreaming") ^ 1;

    v18 = *(_QWORD *)(a1 + 40);
    v19 = objc_loadWeakRetained((id *)(a1 + 56));
    v20 = v19;
    if (v19)
      objc_msgSend(v19, "timeBeingSeekedTo");
    else
      memset(v23, 0, sizeof(v23));
    (*(void (**)(uint64_t, _QWORD *, uint64_t, BOOL, double))(v18 + 16))(v18, v23, v17, v14 != 0, v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(_QWORD, void *, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v14, 1);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_msgSend(v8, "currentState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_651(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  void *v9;

  v7 = a2;
  objc_msgSend(a5, "objectForKey:", CFSTR("Play completion key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v7, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_8_652(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  __CFString *v20;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v9 = a2;
  v23 = a3;
  v22 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKey:", CFSTR("Media item loader key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mediaItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "playlist");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentMediaItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v12, "isEqualToMediaItem:", v16);

  if ((_DWORD)a4)
  {
    v17 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9_653;
    v24[3] = &unk_24F15C088;
    objc_copyWeak(&v25, v13);
    objc_msgSend(v17, "executeBlockAfterCurrentStateTransition:", v24);
    v18 = objc_loadWeakRetained(v13);
    v19 = objc_msgSend(v18, "waitsAfterPreparingMediaItems");

    if (v19)
      v20 = CFSTR("Waiting for signal after preparing item");
    else
      v20 = CFSTR("Waiting for AVAsset to load");
    objc_destroyWeak(&v25);
  }
  else
  {
    objc_msgSend(v9, "currentState");
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9_653(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVPPlaybackMediaItemDidBecomePreparedNotification"), WeakRetained);

}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_10_654(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v9 = a2;
  v21 = a3;
  v20 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKey:", CFSTR("Media item loader key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mediaItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "playlist");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentMediaItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v12, "isEqualToMediaItem:", v15);

  if ((_DWORD)a4)
  {
    v16 = v9;
    v17 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_11_655;
    v22[3] = &unk_24F15BA88;
    objc_copyWeak(&v24, (id *)(a1 + 40));
    v23 = v11;
    objc_msgSend(v17, "executeBlockAfterCurrentStateTransition:", v22);

    objc_destroyWeak(&v24);
    v18 = CFSTR("Waiting for media item to prepare for playback initiation");
  }
  else
  {
    v16 = v9;
    objc_msgSend(v9, "currentState");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_11_655(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCurrentMediaItemIsStreaming:", objc_msgSend(*(id *)(a1 + 32), "containsStreamingAVAsset"));

  return objc_msgSend(*(id *)(a1 + 32), "prepareForPlaybackInitiation");
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_12(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v7 = a2;
  objc_msgSend(a5, "objectForKey:", CFSTR("Media item loader key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "playlist");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nextMediaItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "isEqualToMediaItem:", v12);

  if (v13)
    objc_msgSend(v8, "prepareForPlaybackInitiation");
  objc_msgSend(v7, "currentState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_14(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVPPlayerUnqueueudPlayerItemReadyNotification"), WeakRetained);

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_656(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVPPlayerExternalPlaybackTypeDidChangeNotification"), WeakRetained);

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_657(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:", CFSTR("Current player item status did become ready to play"));

}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_658(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  uint8_t v17[16];

  v7 = a2;
  objc_msgSend(a5, "objectForKey:", CFSTR("Media item loader key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "playlist");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nextMediaItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "isEqualToMediaItem:", v12);

  if (v13)
  {
    v14 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_228A4E000, v14, OS_LOG_TYPE_DEFAULT, "Enqueueing player item for next media item", v17, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  objc_msgSend(v7, "currentState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_659(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  NSObject *v33;
  id v34;
  int v35;
  const __CFString *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  int v44;
  void *v45;
  void *v46;
  id v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  uint8_t buf[4];
  const __CFString *v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v48 = a2;
  v50 = a3;
  v51 = a4;
  v52 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "currentMediaItemLoader");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v56, "timingData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v11, "playlist");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentMediaItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "reportingDelegate");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v15 = v14;
  objc_msgSend(v10, "setEndTimeForAVPlayerItemLoading:");
  objc_msgSend(v10, "setStartTimeForBuffering:", v15);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "startTimeForAVPlayerItemLoading", v48, v50, v51, v52);
    v17 = v16;
    objc_msgSend(v10, "endTimeForAVPlayerItemLoading");
    v19 = v18 - v17;
    v20 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v57, "mediaItemPlayerItemStatusDidBecomeReadyToPlay:timeTakenForOperation:player:", v13, v20, v19);

  }
  objc_msgSend(v13, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"), v48);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setInitialFPSRequestsComplete:", 1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v22 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v22, "setCurrentDirectionOfPlaylistChange:", 0);

  v23 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v23, "setLoadingInitialItemInPlaylist:", 0);

  v24 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v24, "updateAudioSelectionCriteria");

  v25 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v25, "currentPlayerItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataChapterCollections"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v28, "currentMediaItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "hasTrait:", CFSTR("TVPMediaItemTraitIsScene"));

  if ((v30 & 1) == 0)
  {
    if (v54)
      objc_msgSend(v27, "addObject:");
    if (v53)
      objc_msgSend(v27, "addObjectsFromArray:");
    if (v55)
      objc_msgSend(v27, "addObject:", v55);
  }
  objc_msgSend(v27, "firstObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v33 = v32;
    v34 = objc_loadWeakRetained((id *)(a1 + 72));
    v35 = objc_msgSend(v34, "currentMediaItemIsStreaming");
    v36 = CFSTR("FILE");
    if (v35)
      v36 = CFSTR("HLS");
    *(_DWORD *)buf = 138412290;
    v69 = v36;
    _os_log_impl(&dword_228A4E000, v33, OS_LOG_TYPE_DEFAULT, "Media Type: %@", buf, 0xCu);

  }
  v37 = *(void **)(a1 + 32);
  v38 = MEMORY[0x24BDAC760];
  v62[0] = MEMORY[0x24BDAC760];
  v62[1] = 3221225472;
  v62[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_666;
  v62[3] = &unk_24F15CF48;
  v39 = v26;
  v63 = v39;
  objc_copyWeak(&v67, (id *)(a1 + 72));
  v40 = v27;
  v64 = v40;
  v41 = v31;
  v65 = v41;
  v42 = v13;
  v66 = v42;
  objc_msgSend(v37, "executeBlockAfterCurrentStateTransition:", v62);
  v43 = objc_loadWeakRetained((id *)(a1 + 72));
  v44 = objc_msgSend(v43, "_isPlaybackLikelyToKeepUp");

  if (v44)
  {
    v45 = *(void **)(a1 + 32);
    v60[0] = v38;
    v60[1] = 3221225472;
    v60[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_667;
    v60[3] = &unk_24F15BEF8;
    v61 = v45;
    objc_msgSend(v61, "executeBlockAfterCurrentStateTransition:", v60);

  }
  v46 = *(void **)(a1 + 32);
  v58[0] = v38;
  v58[1] = 3221225472;
  v58[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_668;
  v58[3] = &unk_24F15C038;
  v59 = *(id *)(a1 + 64);
  objc_msgSend(v46, "executeBlockAfterCurrentStateTransition:", v58);

  objc_destroyWeak(&v67);
  return CFSTR("Waiting for sufficient buffer");
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_666(uint64_t a1)
{
  int v2;
  NSObject *v3;
  const __CFString *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  double v54;
  double v55;
  id v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  id v62;
  _QWORD v63[3];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[3];
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  const __CFString *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "hasVideo");
  v3 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    v4 = CFSTR("NO");
    if (v2)
      v4 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v76 = v4;
    _os_log_impl(&dword_228A4E000, v3, OS_LOG_TYPE_DEFAULT, "hasVideo: %@", buf, 0xCu);
  }
  v5 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "currentMediaItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasTrait:", CFSTR("TVPMediaItemTraitTreatAsVideo"));

  if (v8)
  {
    v9 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v9, OS_LOG_TYPE_DEFAULT, "Treating as video since it has TVPMediaItemTraitTreatAsVideo", buf, 2u);
    }
  }
  else if (!v2)
  {
    goto LABEL_10;
  }
  v10 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v10, "setCurrentMediaItemHasVideoContent:", 1);

LABEL_10:
  v11 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v11, "setCurrentMediaItemInitialLoadingComplete:", 1);

  v12 = objc_loadWeakRetained((id *)(a1 + 64));
  v13 = *(void **)(a1 + 32);
  if (v13)
    objc_msgSend(v13, "currentTime");
  else
    memset(v72, 0, sizeof(v72));
  v14 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v14, "_currentDateFromPlayerItem:", *(_QWORD *)(a1 + 32));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_notifyListenersOfElapsedTimeChange:playbackDate:dueToTimeJump:", v72, v15, 0);

  v16 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v16, "willChangeValueForKey:", CFSTR("selectedAudioOption"));

  v17 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v17, "didChangeValueForKey:", CFSTR("selectedAudioOption"));

  v18 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v18, "willChangeValueForKey:", CFSTR("selectedSubtitleOption"));

  v19 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v19, "didChangeValueForKey:", CFSTR("selectedSubtitleOption"));

  v20 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v20, "willChangeValueForKey:", CFSTR("audioOptions"));

  v21 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v21, "didChangeValueForKey:", CFSTR("audioOptions"));

  v22 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v22, "updateSubtitleOptions");

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v23 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v23, "subtitleOptions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v69;
    while (2)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v69 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        if (objc_msgSend(v29, "subtitleType") == 2 || objc_msgSend(v29, "subtitleType") == 1)
        {
          v30 = objc_loadWeakRetained((id *)(a1 + 64));
          objc_msgSend(v30, "currentMediaItem");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setMediaItemMetadata:forProperty:", MEMORY[0x24BDBD1C8], CFSTR("TVPMediaItemMetadataContainsClosedCaptions"));

          goto LABEL_24;
        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v68, v74, 16);
      if (v26)
        continue;
      break;
    }
  }
LABEL_24:

  v32 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v32, "selectedAudioOption");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setCachedSelectedAudioOption:", v33);

  v34 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v35 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v35, "audioOptions");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v65;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v65 != v39)
          objc_enumerationMutation(v36);
        objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * j), "languageCodeBCP47");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v41 && (objc_msgSend(v34, "containsObject:", v41) & 1) == 0)
          objc_msgSend(v34, "addObject:", v41);

      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v64, v73, 16);
    }
    while (v38);
  }

  v42 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend((id)objc_opt_class(), "updateSupplementaryAvailableAudioLanguageCodes:", v34);

  v43 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v43, "setChapterCollections:", *(_QWORD *)(a1 + 40));

  v44 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v44, "setCurrentChapterCollection:", *(_QWORD *)(a1 + 48));

  v45 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v45, "currentMediaItem");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataInterstitialCollection"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setCurrentInterstitialCollection:", v47);

  v48 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v48, "willChangeValueForKey:", CFSTR("seekableDateRange"));

  v49 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v49, "didChangeValueForKey:", CFSTR("seekableDateRange"));

  v50 = objc_loadWeakRetained((id *)(a1 + 64));
  v51 = *(void **)(a1 + 32);
  if (v51)
    objc_msgSend(v51, "currentTime");
  else
    memset(v63, 0, sizeof(v63));
  objc_msgSend(v50, "_updateIsLiveForElapsedTime:", v63);

  v52 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v52, "setCurrentMediaItemHasDates:", objc_msgSend(v52, "_currentPlayerItemContainsDates"));

  v53 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v53, "duration");
  v55 = v54;

  if (v55 > 0.0 && v55 != 3.40282347e38)
  {
    v56 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v56, "currentMediaItem");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataInterstitialCollection"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      objc_msgSend(v58, "timeAdjustedByRemovingInterstitials:", v55);
      v55 = v59;
    }
    v60 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v55);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setMediaItemMetadata:forProperty:", v61, CFSTR("TVPMediaItemMetadataDuration"));

  }
  v62 = objc_loadWeakRetained(v5);
  objc_msgSend(v62, "_populateCurrentPlayerItemWithUpNextMetadata");

}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_667(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:", CFSTR("Sufficient buffer did become available"));
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_668(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_669(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;

  v9 = a2;
  v32 = a3;
  v31 = a4;
  v29 = a5;
  v10 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "currentMediaItemLoader");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "timingData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mediaItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "reportingDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  objc_msgSend(v13, "setEndTimeForBuffering:");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v13, "startTimeForBuffering", v29, v31, v32);
    v17 = v16;
    objc_msgSend(v13, "endTimeForBuffering");
    v19 = v18 - v17;
    v20 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v15, "mediaItemBufferingDidBecomeLikelyToKeepUp:timeTakenForOperation:player:", v14, v20, v19);

  }
  v21 = *(void **)(a1 + 32);
  v22 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_672;
  v36[3] = &unk_24F15C088;
  objc_copyWeak(&v37, v10);
  objc_msgSend(v21, "executeBlockAfterCurrentStateTransition:", v36);
  if ((objc_msgSend(v13, "initialLoadingComplete") & 1) == 0)
  {
    objc_msgSend(v14, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addEndEventWithName:", TVPPlaybackReportingEventCreatePlayerItemToLikelyToKeepUp);

    objc_msgSend(v14, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addStartEventWithName:", TVPPlaybackReportingEventWaitingForTimeControlStatus);

  }
  objc_msgSend(v13, "setStartTimeForBuffering:", 0.0, v29);
  objc_msgSend(v13, "setEndTimeForBuffering:", 0.0);
  v25 = objc_loadWeakRetained(v10);
  objc_msgSend(v25, "AVQueuePlayer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "timeControlStatus");

  if (v27 != 1)
  {
    v33[0] = v22;
    v33[1] = 3221225472;
    v33[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_673;
    v33[3] = &unk_24F15BF70;
    v34 = v9;
    v35 = v27;
    objc_msgSend(v34, "executeBlockAfterCurrentStateTransition:", v33);

  }
  objc_destroyWeak(&v37);

  return CFSTR("Waiting for time control status to be done waiting");
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_672(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVPPlaybackReportingBufferingDidBecomeLikelyToKeepUpNotification"), WeakRetained);

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_673(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Posting time control status change since it is not AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate", v5, 2u);
  }
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:withContext:", CFSTR("Time control status did change"), v4);

}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_674(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  void *v16;
  NSObject *v17;
  id *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  id v27;
  id v28;
  char v29;
  id v30;
  id v31;
  void *v32;
  const __CFString *v33;
  id v34;
  void *v35;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  uint8_t buf[16];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    v13 = objc_msgSend(v11, "integerValue");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "AVQueuePlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "timeControlStatus");

  }
  objc_msgSend(v9, "currentState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 != 1)
  {
    v40 = v12;
    v37 = a1;
    v38 = v10;
    v18 = (id *)(a1 + 40);
    v19 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v19, "currentMediaItemLoader");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "timingData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "mediaItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "reportingDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "initialLoadingComplete") & 1) == 0)
    {
      objc_msgSend(v21, "setInitialLoadingComplete:", 1);
      objc_msgSend(v22, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addEndEventWithName:", TVPPlaybackReportingEventWaitingForTimeControlStatus);

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v21, "totalInitialLoadingTime");
        v26 = v25;
        v27 = objc_loadWeakRetained(v18);
        objc_msgSend(v23, "mediaItemAllInitialLoadingComplete:totalTime:player:", v22, v27, v26);

      }
    }
    v39 = v23;
    v28 = objc_loadWeakRetained(v18);
    v29 = objc_msgSend(v28, "initialMediaItemHasCompletedInitialLoading");

    if ((v29 & 1) == 0)
    {
      v30 = objc_loadWeakRetained(v18);
      objc_msgSend(v30, "setInitialMediaItemHasCompletedInitialLoading:", 1);

    }
    v31 = objc_loadWeakRetained(v18);
    objc_msgSend(v31, "playlist");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setNumConsecutivePlaybackFailures:", 0);

    if (v13)
    {
      if (v13 != 2)
      {
        v10 = v38;
        goto LABEL_18;
      }
      (*(void (**)(void))(*(_QWORD *)(v37 + 32) + 16))();
      v33 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = objc_loadWeakRetained(v18);
      +[TVPPlaybackState paused](TVPPlaybackState, "paused");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "_setState:updatedRate:notifyListeners:", v35, 1, 0.0);

      v33 = CFSTR("Paused");
    }
    v10 = v38;

    v16 = (void *)v33;
LABEL_18:

    v12 = v40;
    goto LABEL_19;
  }
  v17 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228A4E000, v17, OS_LOG_TYPE_DEFAULT, "Ignoring time control status change since it's still AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate", buf, 2u);
  }
LABEL_19:

  return v16;
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_677(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  __CFString *v16;
  id *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  id v25;
  void *v26;
  __CFString *v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  __CFString *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint8_t buf[8];
  _QWORD v47[4];
  id v48;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    v13 = objc_msgSend(v11, "integerValue");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "AVQueuePlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "timeControlStatus");

  }
  objc_msgSend(v9, "currentState");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (v13 == 1)
    {
      v44 = v12;
      v45 = v10;
      v17 = (id *)(a1 + 40);
      v18 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v18, "currentMediaItemLoader");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(v20, "currentMediaItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "reportingDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timingData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "startTimeForBuffering");
      if (v24 == 0.0)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
        objc_msgSend(v23, "setStartTimeForBuffering:");
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v25 = objc_loadWeakRetained((id *)(a1 + 40));
          objc_msgSend(v22, "mediaItemWillStartBuffering:player:", v21, v25);

        }
        v26 = *(void **)(a1 + 32);
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_678;
        v47[3] = &unk_24F15C088;
        objc_copyWeak(&v48, v17);
        objc_msgSend(v26, "executeBlockAfterCurrentStateTransition:", v47);
        objc_destroyWeak(&v48);
      }
      v41 = v22;
      v42 = v21;
      v43 = v19;
      v27 = CFSTR("TVPPlaybackChangeReasonPlaybackDidStartBuffering");
      v28 = objc_loadWeakRetained(v17);
      objc_msgSend(v28, "AVQueuePlayer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "reasonForWaitingToPlay");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqualToString:", *MEMORY[0x24BDB20B0]);

      if (v31)
      {
        v32 = CFSTR("TVPPlaybackChangeReasonWaitingForCoordinatedPlayback");

        v27 = v32;
      }
      v33 = objc_loadWeakRetained(v17);
      +[TVPPlaybackState playing](TVPPlaybackState, "playing");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setPostLoadingState:", v34);

      v35 = objc_loadWeakRetained(v17);
      +[TVPPlaybackState loading](TVPPlaybackState, "loading");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "_setState:updatedRate:reason:notifyListeners:", v36, v27, 1, 0.0);

      v16 = CFSTR("Waiting for time control status to be done waiting");
      v12 = v44;
      v10 = v45;
    }
    else
    {
      v39 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v39, OS_LOG_TYPE_DEFAULT, "Ignoring time control status change to AVPlayerTimeControlStatusPlaying since we're already playing", buf, 2u);
      }
    }
  }
  else
  {
    v37 = objc_loadWeakRetained((id *)(a1 + 40));
    +[TVPPlaybackState paused](TVPPlaybackState, "paused");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_setState:updatedRate:notifyListeners:", v38, 1, 0.0);

    v16 = CFSTR("Paused");
  }

  return v16;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_678(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVPPlaybackReportingBufferingWillStartNotification"), WeakRetained);

}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_679(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  __CFString *v16;
  id *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint8_t v25[16];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    v13 = objc_msgSend(v11, "integerValue");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "AVQueuePlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "timeControlStatus");

  }
  objc_msgSend(v9, "currentState");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v13 == 2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v22 = objc_claimAutoreleasedReturnValue();

    v16 = (__CFString *)v22;
  }
  else if (v13 == 1)
  {
    v17 = (id *)(a1 + 40);
    v18 = objc_loadWeakRetained(v17);
    +[TVPPlaybackState playing](TVPPlaybackState, "playing");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPostLoadingState:", v19);

    v20 = objc_loadWeakRetained(v17);
    +[TVPPlaybackState loading](TVPPlaybackState, "loading");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_setState:updatedRate:notifyListeners:", v21, 1, 0.0);

    v16 = CFSTR("Waiting for time control status to be done waiting");
  }
  else
  {
    v23 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_228A4E000, v23, OS_LOG_TYPE_DEFAULT, "Ignoring change to AVPlayerTimeControlStatusPaused since player is already in paused state", v25, 2u);
    }
  }

  return v16;
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_680(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint8_t v21[16];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    v13 = objc_msgSend(v11, "integerValue");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "AVQueuePlayer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "timeControlStatus");

  }
  objc_msgSend(v9, "currentState");
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v17 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_228A4E000, v17, OS_LOG_TYPE_DEFAULT, "During scanning, ignoring time control status change to something other than paused", v21, 2u);
    }
  }
  else
  {
    v18 = objc_loadWeakRetained((id *)(a1 + 32));
    +[TVPPlaybackState paused](TVPPlaybackState, "paused");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_setState:updatedRate:notifyListeners:", v19, 1, 0.0);

    v16 = CFSTR("Paused");
  }

  return v16;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_681(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  double v9;
  double v10;
  id WeakRetained;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v7 = a2;
  objc_msgSend(a5, "objectForKey:", CFSTR("Rate key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v12 = objc_msgSend(WeakRetained, "currentMediaItemIsStreaming");

  if ((v12 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "currentState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("Scanning using AVPlayer driven by AVKit"));

    v16 = *(_QWORD *)(a1 + 40);
    v17 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v17, "currentPlayerItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      objc_msgSend(v18, "currentTime");
    else
      memset(v21, 0, sizeof(v21));
    (*(void (**)(uint64_t, _QWORD *, uint64_t, uint64_t, double))(v16 + 16))(v16, v21, 1, v15, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_682(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  _QWORD block[4];
  id v27;
  uint8_t buf[8];
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32[2];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = *(void **)(a1 + 32);
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_683;
  v31[3] = &unk_24F15C088;
  v14 = (id *)(a1 + 40);
  objc_copyWeak(v32, (id *)(a1 + 40));
  objc_msgSend(v13, "executeBlockAfterCurrentStateTransition:", v31);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "playlist");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "endAction") == 1 && (objc_msgSend(v16, "moreItemsAvailable:", 0) & 1) == 0)
  {
    v17 = *(void **)(a1 + 32);
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_684;
    v29[3] = &unk_24F15C088;
    objc_copyWeak(&v30, v14);
    objc_msgSend(v17, "executeBlockAfterCurrentStateTransition:", v29);
    objc_destroyWeak(&v30);
  }
  v18 = objc_loadWeakRetained(v14);
  v19 = objc_msgSend(v18, "mediaItemEndAction");

  if (v19 != 1)
  {
    v20 = objc_loadWeakRetained(v14);
    objc_msgSend(v20, "setMediaItemChangeReason:", CFSTR("Played to end of media item"));

    objc_msgSend(v12, "objectForKey:", CFSTR("Requires manual AVQueuePlayer advance key"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    if (v22)
    {
      v23 = sPlayerLogObject;
      if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_228A4E000, v23, OS_LOG_TYPE_DEFAULT, "Scheduling call to advanceToNextItem since RequiresManualAVQueuePlayerAdvance is YES", buf, 2u);
      }
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_685;
      block[3] = &unk_24F15C088;
      objc_copyWeak(&v27, v14);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      objc_destroyWeak(&v27);
    }
  }
  objc_msgSend(v9, "currentState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v32);
  return v24;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_683(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVPPlaybackDidPlayToEndOfMediaItemNotification"), WeakRetained);

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_684(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVPPlaybackPlaylistDidFinishNotification"), WeakRetained);

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_685(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "AVQueuePlayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "advanceToNextItem");

}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_686(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id WeakRetained;
  void *v15;
  float v16;
  float v17;
  void *v18;
  char v19;
  void *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  BOOL v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t);
  void *v43;
  id v44;
  id v45;
  CMTime time2;
  CMTime time1;
  CMTime v48;
  CMTime rhs;
  CMTime lhs;
  CMTime buf;
  _QWORD v52[4];
  id v53[2];
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD block[4];
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  char v65;
  _QWORD v66[4];
  _QWORD v67[5];

  v67[4] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "AVQueuePlayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rate");
  v17 = v16;

  objc_msgSend(v9, "currentState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("Scanning using AVPlayer driven by AVKit"));

  if (v17 < 0.0)
  {
    v61[0] = MEMORY[0x24BDAC760];
    v61[1] = 3221225472;
    v61[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_687;
    v61[3] = &unk_24F15CFE8;
    v65 = v19;
    v62 = v9;
    v63 = v12;
    objc_copyWeak(&v64, (id *)(a1 + 40));
    objc_msgSend(v62, "executeBlockAfterCurrentStateTransition:", v61);
    objc_destroyWeak(&v64);

    goto LABEL_27;
  }
  objc_msgSend(v12, "objectForKey:", CFSTR("Requires manual AVQueuePlayer advance key"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLValue");

  if (v21)
  {
    v22 = sPlayerLogObject;
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_228A4E000, v22, OS_LOG_TYPE_DEFAULT, "Scheduling call to advanceToNextItem since RequiresManualAVQueuePlayerAdvance is YES", (uint8_t *)&buf, 2u);
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_688;
    block[3] = &unk_24F15C088;
    objc_copyWeak(&v60, v13);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v60);
    goto LABEL_27;
  }
  if ((v19 & 1) != 0)
    goto LABEL_27;
  v23 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.value) = 0;
    _os_log_impl(&dword_228A4E000, v23, OS_LOG_TYPE_DEFAULT, "Calling _setAVPlayerRate", (uint8_t *)&buf, 2u);
  }
  (*(void (**)(float, double))(*(_QWORD *)(a1 + 32) + 16))(0.0, 0.0);
  v24 = objc_loadWeakRetained((id *)(a1 + 40));
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "cachedDuration");
    if ((v57 & 0x100000000) != 0)
    {
      v26 = objc_loadWeakRetained(v13);
      v27 = v26;
      if (v26)
      {
        objc_msgSend(v26, "cachedDuration");
        v28 = (v54 & 0x1000000000) == 0;

        if (!v28)
        {
          v52[0] = MEMORY[0x24BDAC760];
          v52[1] = 3221225472;
          v52[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_689;
          v52[3] = &unk_24F15C088;
          objc_copyWeak(v53, v13);
          objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v52);
          objc_destroyWeak(v53);
          goto LABEL_27;
        }
        goto LABEL_18;
      }
      v53[1] = 0;
      v54 = 0;
      v55 = 0;

    }
  }
  else
  {
    v56 = 0;
    v57 = 0;
    v58 = 0;
  }

LABEL_18:
  memset(&buf, 0, sizeof(buf));
  v29 = objc_loadWeakRetained(v13);
  v30 = v29;
  if (v29)
    objc_msgSend(v29, "_currentMediaItemForwardPlaybackEndTime");
  else
    memset(&lhs, 0, sizeof(lhs));
  CMTimeMakeWithSeconds(&rhs, 5.0, 1000000);
  CMTimeSubtract(&buf, &lhs, &rhs);

  memset(&v48, 0, sizeof(v48));
  v31 = objc_loadWeakRetained(v13);
  v32 = v31;
  if (v31)
    objc_msgSend(v31, "_currentMediaItemReversePlaybackEndTime");
  else
    memset(&v48, 0, sizeof(v48));

  time1 = buf;
  time2 = v48;
  if (CMTimeCompare(&time1, &time2) < 0)
    buf = v48;
  v66[0] = CFSTR("Elapsed CMTime key");
  time1 = buf;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &time1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v33;
  v66[1] = CFSTR("Seek precision key");
  time1 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &time1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v34;
  v67[2] = MEMORY[0x24BDBD1C8];
  v66[2] = CFSTR("Ignore delegate key");
  v66[3] = CFSTR("Post loading state key");
  +[TVPPlaybackState paused](TVPPlaybackState, "paused");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v67[3] = v35;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = MEMORY[0x24BDAC760];
  v41 = 3221225472;
  v42 = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_690;
  v43 = &unk_24F15BA88;
  objc_copyWeak(&v45, v13);
  v37 = v36;
  v44 = v37;
  objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", &v40);

  objc_destroyWeak(&v45);
LABEL_27:
  objc_msgSend(v9, "currentState", v40, v41, v42, v43);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_687(uint64_t a1)
{
  void *v2;
  int v3;
  id WeakRetained;

  if (!*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "postEvent:", CFSTR("Play"));
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("Reset to start time key"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "setElapsedTime:", -1000000000.0);

  }
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_688(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "AVQueuePlayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "advanceToNextItem");

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_689(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stateMachine");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postEvent:", CFSTR("Play"));

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_690(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postEvent:withContext:userInfo:", CFSTR("Set elapsed time or date"), 0, *(_QWORD *)(a1 + 32));

}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_691(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id *v11;
  id WeakRetained;
  void *v13;
  double v14;
  double v15;
  id *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void (*v37)(uint64_t, CMTime *, void *, _QWORD, void *, id, id, uint64_t, _QWORD);
  CMTime time2;
  CMTime time1;
  CMTime v41;
  CMTime rhs;
  CMTime lhs;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  CMTime v50;

  v8 = a2;
  v9 = a3;
  v10 = a5;
  v50 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  v11 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "externalImagePlayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rate");
  v15 = v14;

  v16 = (id *)(a1 + 40);
  if (v15 <= 0.0)
  {
    v21 = objc_loadWeakRetained(v16);
    v22 = v21;
    if (v21)
      objc_msgSend(v21, "_currentMediaItemReversePlaybackEndTime");
    else
      memset(&v41, 0, sizeof(v41));
    v50 = v41;

    goto LABEL_12;
  }
  v17 = objc_loadWeakRetained(v16);
  v18 = v17;
  if (!v17)
  {
    v47 = 0;
    v48 = 0;
    v49 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v17, "cachedDuration");
  if ((v48 & 0x100000000) == 0)
  {
LABEL_14:

    goto LABEL_15;
  }
  v19 = objc_loadWeakRetained((id *)(a1 + 40));
  v20 = v19;
  if (!v19)
  {
    v44 = 0;
    v45 = 0;
    v46 = 0;

    goto LABEL_14;
  }
  objc_msgSend(v19, "cachedDuration");

  if ((v45 & 0x1000000000) != 0)
  {
    v50 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D58];
LABEL_12:
    +[TVPPlaybackState playing](TVPPlaybackState, "playing");
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
LABEL_15:
  v24 = objc_loadWeakRetained((id *)(a1 + 40));
  v25 = v24;
  if (v24)
    objc_msgSend(v24, "_currentMediaItemForwardPlaybackEndTime");
  else
    memset(&lhs, 0, sizeof(lhs));
  CMTimeMakeWithSeconds(&rhs, 5.0, 1000000);
  CMTimeSubtract(&v50, &lhs, &rhs);

  memset(&v41, 0, sizeof(v41));
  v26 = objc_loadWeakRetained((id *)(a1 + 40));
  v27 = v26;
  if (v26)
    objc_msgSend(v26, "_currentMediaItemReversePlaybackEndTime");
  else
    memset(&v41, 0, sizeof(v41));

  time1 = v50;
  time2 = v41;
  if (CMTimeCompare(&time1, &time2) < 0)
    v50 = v41;
  +[TVPPlaybackState paused](TVPPlaybackState, "paused");
  v23 = objc_claimAutoreleasedReturnValue();
LABEL_24:
  v28 = (void *)v23;
  v29 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v29, "externalImagePlayer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setRate:", 0.0);

  objc_msgSend(v8, "currentState");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v30) = objc_msgSend(v31, "isEqualToString:", CFSTR("Scanning using external images driven by AVKit"));

  if ((_DWORD)v30)
  {
    v32 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v32, "setPostAVKitScanningState:", v28);

    objc_msgSend(v8, "currentState");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = *(_QWORD *)(a1 + 32);
    v35 = objc_loadWeakRetained(v11);
    v41 = v50;
    objc_msgSend(v35, "_estimatedPlaybackDateForCMTime:", &v41);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *(void (**)(uint64_t, CMTime *, void *, _QWORD, void *, id, id, uint64_t, _QWORD))(v34 + 16);
    v41 = v50;
    v37(v34, &v41, v36, 0, v28, v9, v10, 1, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v33;
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_692(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id WeakRetained;
  void *v15;
  double v16;
  double v17;
  __CFString *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void (*v26)(uint64_t, __int128 *, _QWORD, __int128 *, void *, uint64_t, double);
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "progressiveJumpingScrubber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rate");
  v17 = v16;

  objc_msgSend(v9, "currentState");
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v19 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v19, "progressiveJumpingScrubber");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cancelScrub");

  v21 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v21, "setProgressiveJumpingScrubber:", 0);

  if (v17 <= 0.0)
  {
    v24 = *(_QWORD *)(a1 + 32);
    +[TVPPlaybackState loading](TVPPlaybackState, "loading");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *(void (**)(uint64_t, __int128 *, _QWORD, __int128 *, void *, uint64_t, double))(v24 + 16);
    v30 = *MEMORY[0x24BDC0D88];
    v31 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    v28 = v30;
    v29 = v31;
    v26(v24, &v30, 0, &v28, v25, 1, 0.0);

    v18 = CFSTR("Waiting for seek");
  }
  else
  {
    v22 = objc_loadWeakRetained((id *)(a1 + 40));
    +[TVPPlaybackState playing](TVPPlaybackState, "playing");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setPostLoadingState:", v23);

    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_693;
    v32[3] = &unk_24F15C088;
    objc_copyWeak(&v33, v13);
    objc_msgSend(v9, "executeBlockAfterCurrentStateTransition:", v32);
    objc_destroyWeak(&v33);
  }

  return v18;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_693(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "changeMediaInDirection:reason:ignoreDelegate:", 0, CFSTR("Fast forwarded to end of media item"), 1);

}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a5;
  +[TVPPlaybackState playing](TVPPlaybackState, "playing");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_695(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a5;
  +[TVPPlaybackState paused](TVPPlaybackState, "paused");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_8_696(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  id *v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = (id *)(a1 + 40);
  v7 = a5;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "postLoadingState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_9_697(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[16];

  v3 = a2;
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "AVQueuePlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count") != 2)
  {
LABEL_9:
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_698;
    v24[3] = &unk_24F15C038;
    v25 = *(id *)(a1 + 32);
    objc_msgSend(v3, "executeBlockAfterCurrentStateTransition:", v24);
    v21 = objc_loadWeakRetained(v4);
    objc_msgSend(v21, "_populateCurrentPlayerItemWithUpNextMetadata");

    objc_msgSend(v3, "currentState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v25;
    goto LABEL_10;
  }
  v23 = a1;
  objc_msgSend(v7, "objectAtIndex:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaItemLoader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v11, "playlist");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nextMediaItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "isEqualToMediaItem:", v13);

  v15 = sPlayerLogObject;
  v16 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
  if (!v14)
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_228A4E000, v15, OS_LOG_TYPE_DEFAULT, "Removing previously added speculative player item", buf, 2u);
    }
    v18 = objc_loadWeakRetained(v4);
    objc_msgSend(v18, "AVQueuePlayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeItem:", v20);

    a1 = v23;
    goto LABEL_9;
  }
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228A4E000, v15, OS_LOG_TYPE_DEFAULT, "Existing speculative player item matches next media item, so not loading it", buf, 2u);
  }
  objc_msgSend(v3, "currentState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v17;
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_698(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_699(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v3;
  id v4;
  id WeakRetained;
  double v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "rateUsedForPlayback");
  *(float *)&v6 = v6;
  (*(void (**)(uint64_t, float, double))(v2 + 16))(v2, *(float *)&v6, 0.0);

  objc_msgSend(v4, "currentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_700(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  CMTimeEpoch v17;
  id WeakRetained;
  void *v19;
  uint64_t v20;
  int v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  char v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id *location;
  id v42;
  __int128 v43;
  id v44;
  id v45;
  uint64_t v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50[2];
  _QWORD v51[4];
  id v52;
  id v53;
  CMTime v54;
  CMTime v55;
  CMTime time2;
  CMTime time1;
  CMTime v58;
  CMTime v59;
  char v60;
  CMTime v61;

  v9 = a2;
  v10 = a3;
  v45 = a4;
  v11 = a5;
  objc_msgSend(v11, "objectForKey:", CFSTR("Elapsed CMTime key"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("Playback date key"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("Post loading state key"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("Ignore delegate key"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v11, "objectForKey:", CFSTR("Play completion key"));
  v46 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("Seek precision key"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v43 = *MEMORY[0x24BDC0D88];
  *(_OWORD *)&v61.value = *MEMORY[0x24BDC0D88];
  v17 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v61.epoch = v17;
  v60 = 0;
  if (v15)
    objc_msgSend(v15, "CMTimeValue");
  if (v12)
  {
    v44 = v9;
    memset(&v59, 0, sizeof(v59));
    objc_msgSend(v12, "CMTimeValue");
    memset(&v58, 0, sizeof(v58));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    v19 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "startTime");
    else
      memset(&v58, 0, sizeof(v58));

    if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    {
      time1 = v59;
      time2 = v58;
      if (CMTimeCompare(&time1, &time2))
      {
        v27 = objc_loadWeakRetained((id *)(a1 + 64));
        time1 = v59;
        objc_msgSend(v27, "setStartTime:", &time1);

        v28 = objc_loadWeakRetained((id *)(a1 + 64));
        time1 = v61;
        objc_msgSend(v28, "setStartingSeekPrecision:", &time1);

        v29 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v29, "setStartDate:", 0);

        v30 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v30, "setStartPosition:", 0.0);

        if (v47)
        {
          v31 = objc_loadWeakRetained((id *)(a1 + 64));
          objc_msgSend(v31, "setPostLoadingState:", v47);

        }
        v32 = *(void **)(a1 + 32);
        v51[0] = MEMORY[0x24BDAC760];
        v51[1] = 3221225472;
        v51[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_701;
        v51[3] = &unk_24F15D010;
        objc_copyWeak(&v53, (id *)(a1 + 64));
        v54 = v58;
        v55 = v59;
        v52 = v13;
        objc_msgSend(v32, "executeBlockAfterCurrentStateTransition:", v51);
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        v9 = v44;

        objc_destroyWeak(&v53);
        goto LABEL_16;
      }
    }
    v9 = v44;
    v33 = (void *)v46;
    if (!v60)
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (!v13)
    {
LABEL_16:
      v33 = (void *)v46;
      goto LABEL_22;
    }
    v20 = *(_QWORD *)(a1 + 56);
    v50[1] = v13;
    v21 = (*(uint64_t (**)(void))(v20 + 16))();
    v22 = v13;

    if (!v21)
      goto LABEL_9;
    location = (id *)(a1 + 64);
    v42 = v10;
    v23 = v9;
    v24 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v24, "startDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v22, "isEqual:", v25);

    v9 = v23;
    v10 = v42;
    if ((v26 & 1) == 0)
    {
      v34 = objc_loadWeakRetained(location);
      objc_msgSend(v34, "setStartDate:", v22);

      v35 = objc_loadWeakRetained(location);
      *(_OWORD *)&v59.value = v43;
      v59.epoch = v17;
      objc_msgSend(v35, "setStartTime:", &v59);

      v36 = objc_loadWeakRetained(location);
      objc_msgSend(v36, "setStartPosition:", 0.0);

      if (v47)
      {
        v37 = objc_loadWeakRetained(location);
        objc_msgSend(v37, "setPostLoadingState:", v47);

      }
      v38 = *(void **)(a1 + 32);
      v48[0] = MEMORY[0x24BDAC760];
      v48[1] = 3221225472;
      v48[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_702;
      v48[3] = &unk_24F15BA88;
      objc_copyWeak(v50, location);
      v13 = v22;
      v49 = v13;
      objc_msgSend(v38, "executeBlockAfterCurrentStateTransition:", v48);
      v33 = (void *)v46;
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

      objc_destroyWeak(v50);
    }
    else
    {
LABEL_9:
      v33 = (void *)v46;
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v13 = v22;
    }
  }
LABEL_22:
  objc_msgSend(*(id *)(a1 + 32), "currentState", location);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_701(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = *(_OWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 88);
  objc_msgSend(WeakRetained, "_notifyOfBoundaryCrossingBetweenPreviousTime:updatedTime:", &v8, &v6);

  v4 = objc_loadWeakRetained(v2);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 88);
  objc_msgSend(v4, "_notifyListenersOfElapsedTimeChange:playbackDate:dueToTimeJump:", &v8, v5, 1);

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_702(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *MEMORY[0x24BDC0D88];
  v5 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  objc_msgSend(WeakRetained, "_notifyListenersOfElapsedTimeChange:playbackDate:dueToTimeJump:", &v4, v3, 1);

}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_703(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  uint64_t v18;
  int v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  id v49;
  __int128 v50;
  uint64_t v51;
  void *v52;
  char v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;

  v29 = a2;
  v31 = a3;
  v27 = a4;
  v9 = a5;
  objc_msgSend(v9, "objectForKey:", CFSTR("Elapsed CMTime key"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v56 = 0uLL;
  v57 = 0;
  if (v10)
    objc_msgSend(v10, "CMTimeValue");
  objc_msgSend(v9, "objectForKey:", CFSTR("Playback date key"), v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("Seek precision key"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = *MEMORY[0x24BDC0D88];
  v55 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  objc_msgSend(v9, "objectForKey:", CFSTR("Post loading state key"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("Ignore delegate key"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", CFSTR("Play completion key"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "currentPlayerItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v13, "CMTimeValue");
  if (v12)
  {
    v18 = *(_QWORD *)(a1 + 40);
    v52 = v12;
    v19 = (*(uint64_t (**)(void))(v18 + 16))();
    v20 = v12;

    if (v19)
    {
      if (v30)
      {
        v21 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v21, "setPostLoadingState:", v30);

      }
      objc_msgSend(v17, "seekToDate:completionHandler:", v20, 0);
      v22 = *(void **)(a1 + 32);
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_704;
      v47[3] = &unk_24F15C9E0;
      objc_copyWeak(&v49, (id *)(a1 + 64));
      v50 = v56;
      v51 = v57;
      v20 = v20;
      v48 = v20;
      objc_msgSend(v22, "executeBlockAfterCurrentStateTransition:", v47);
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

      objc_destroyWeak(&v49);
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  else
  {
    if (v11)
    {
      v45 = 0uLL;
      v46 = 0;
      if (v17)
        objc_msgSend(v17, "currentTime");
      if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
      {
        if (v30)
        {
          v23 = objc_loadWeakRetained((id *)(a1 + 64));
          objc_msgSend(v23, "setPostLoadingState:", v30);

        }
        v43 = v56;
        v44 = v57;
        v41 = v54;
        v42 = v55;
        v39 = v54;
        v40 = v55;
        objc_msgSend(v17, "seekToTime:toleranceBefore:toleranceAfter:completionHandler:", &v43, &v41, &v39, 0);
        v24 = *(void **)(a1 + 32);
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_8_705;
        v32[3] = &unk_24F15D010;
        objc_copyWeak(&v34, (id *)(a1 + 64));
        v35 = v45;
        v36 = v46;
        v37 = v56;
        v38 = v57;
        v33 = 0;
        objc_msgSend(v24, "executeBlockAfterCurrentStateTransition:", v32);
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        objc_destroyWeak(&v34);
      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
    }
    v20 = 0;
  }
  objc_msgSend(v29, "currentState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_704(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  objc_msgSend(WeakRetained, "_notifyListenersOfElapsedTimeChange:playbackDate:dueToTimeJump:", &v4, v3, 1);

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_8_705(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = *(_OWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 64);
  v6 = *(_OWORD *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 88);
  objc_msgSend(WeakRetained, "_notifyOfBoundaryCrossingBetweenPreviousTime:updatedTime:", &v8, &v6);

  v4 = objc_loadWeakRetained(v2);
  v5 = *(_QWORD *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 88);
  objc_msgSend(v4, "_notifyListenersOfElapsedTimeChange:playbackDate:dueToTimeJump:", &v8, v5, 1);

}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_9_706(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  int v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  Float64 v25;
  id v26;
  id v27;
  uint64_t v28;
  int v29;
  id v30;
  __CFString *v31;
  uint64_t v32;
  void *v33;
  void (*v34)(uint64_t, CMTime *, void *, CMTime *, void *, BOOL, double);
  id v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  CMTime lhs;
  CMTime rhs;
  CMTime v51;
  CMTime time;
  void *v53;
  char v54;
  CMTime v55;
  CMTime v56;

  v8 = a2;
  v9 = a3;
  v10 = a5;
  objc_msgSend(v10, "objectForKey:", CFSTR("Elapsed CMTime key"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  memset(&v56, 0, sizeof(v56));
  if (v11)
    objc_msgSend(v11, "CMTimeValue");
  objc_msgSend(v10, "objectForKey:", CFSTR("Playback date key"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("Seek precision key"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("Post loading state key"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  objc_msgSend(v10, "objectForKey:", CFSTR("Ignore delegate key"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v10, "objectForKey:", CFSTR("Play completion key"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  if (v14)
    objc_msgSend(v14, "CMTimeValue");
  if (v12)
  {
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
      goto LABEL_7;
  }
  else
  {
    v48 = v8;
    if (!v13)
    {
      v47 = v9;
      goto LABEL_16;
    }
    v28 = *(_QWORD *)(a1 + 40);
    v53 = v13;
    v29 = (*(uint64_t (**)(void))(v28 + 16))();
    v30 = v13;

    v13 = v30;
    v8 = v48;
    if (v29)
    {
LABEL_7:
      v47 = v9;
      v48 = v8;
      if (v13)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        v19 = objc_msgSend(WeakRetained, "_currentPlayerItemContainsDates");

        if (v19)
        {
          v20 = objc_loadWeakRetained((id *)(a1 + 64));
          objc_msgSend(v20, "currentPlayerItem");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = objc_loadWeakRetained((id *)(a1 + 64));
          objc_msgSend(v22, "_currentDateFromPlayerItem:", v21);
          v45 = objc_claimAutoreleasedReturnValue();

          memset(&time, 0, sizeof(time));
          v46 = v21;
          if (v21)
            objc_msgSend(v21, "currentTime");
          v23 = (void *)v45;
          objc_msgSend(v13, "timeIntervalSinceDate:", v45, v45);
          v25 = v24;
          v26 = objc_loadWeakRetained((id *)(a1 + 64));
          v51 = time;
          objc_msgSend(v26, "setTimeAtStartOfSeek:", &v51);

          v27 = objc_loadWeakRetained((id *)(a1 + 64));
          objc_msgSend(v27, "setPlaybackDateAtStartOfSeek:", v23);

          CMTimeMakeWithSeconds(&rhs, v25, 1000000);
          lhs = time;
          CMTimeAdd(&v51, &lhs, &rhs);
          v56 = v51;

        }
      }
LABEL_16:
      v32 = *(_QWORD *)(a1 + 48);
      +[TVPPlaybackState loading](TVPPlaybackState, "loading");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = *(void (**)(uint64_t, CMTime *, void *, CMTime *, void *, BOOL, double))(v32 + 16);
      time = v56;
      v51 = v55;
      v34(v32, &time, v13, &v51, v33, v17 == 0, 0.0);

      if (v15)
      {
        v35 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v35, "setPostLoadingState:", v15);
      }
      else
      {
        objc_msgSend(v48, "currentState");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("Playing"));

        if (v37)
        {
          v35 = objc_loadWeakRetained((id *)(a1 + 64));
          +[TVPPlaybackState playing](TVPPlaybackState, "playing");
          v38 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v48, "currentState");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("Paused"));

          if (!v40)
          {
LABEL_24:
            v42 = *(_QWORD *)(a1 + 56);
            time = v56;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CMTimeGetSeconds(&time));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *, uint64_t, void *, void *))(v42 + 16))(v42, v17, 1, v43, v13);

            v31 = CFSTR("Waiting for seek");
            v9 = v47;
            v8 = v48;
            goto LABEL_25;
          }
          v35 = objc_loadWeakRetained((id *)(a1 + 64));
          +[TVPPlaybackState paused](TVPPlaybackState, "paused");
          v38 = objc_claimAutoreleasedReturnValue();
        }
        v41 = (void *)v38;
        objc_msgSend(v35, "setPostLoadingState:", v38);

      }
      goto LABEL_24;
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(v8, "currentState");
  v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v31;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_10_707(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;
  id v16;
  int v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id WeakRetained;
  void *v24;
  void *v25;
  _QWORD v27[3];
  __int128 v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  uint64_t v32;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "objectForKey:", CFSTR("Playback date key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("Elapsed CMTime key"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v31 = 0uLL;
  v32 = 0;
  if (v10)
    objc_msgSend(v10, "CMTimeValue");
  objc_msgSend(v8, "objectForKey:", CFSTR("Ignore delegate key"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "BOOLValue");

  if (v11)
  {
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) == 0)
      goto LABEL_18;
    goto LABEL_8;
  }
  if (!v9)
  {
LABEL_17:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "externalImagePlayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v31;
    v29 = v32;
    objc_msgSend(v24, "setElapsedTime:", &v28);

    goto LABEL_18;
  }
  v13 = *(_QWORD *)(a1 + 48);
  v30 = v9;
  v14 = (*(uint64_t (**)(void))(v13 + 16))();
  v15 = v9;

  v9 = v15;
  if (v14)
  {
LABEL_8:
    if (v9)
    {
      v16 = objc_loadWeakRetained((id *)(a1 + 56));
      v17 = objc_msgSend(v16, "_currentPlayerItemContainsDates");

      if (v17)
      {
        v18 = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend(v18, "currentPlayerItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = objc_loadWeakRetained((id *)(a1 + 56));
        if (v19)
          objc_msgSend(v19, "currentTime");
        else
          memset(v27, 0, sizeof(v27));
        v21 = objc_loadWeakRetained((id *)(a1 + 56));
        objc_msgSend(v21, "_currentDateFromPlayerItem:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend(v20, "_estimatedCMTimeForPlaybackDate:referenceTime:referenceDate:", v9, v27, v22);
        }
        else
        {
          v28 = 0uLL;
          v29 = 0;
        }
        v31 = v28;
        v32 = v29;

      }
    }
    goto LABEL_17;
  }
LABEL_18:
  objc_msgSend(*(id *)(a1 + 32), "currentState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_11_708(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id WeakRetained;
  void *v17;
  void (*v18)(uint64_t, __int128 *, void *, uint64_t, void *, id, id, BOOL, id *);
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void (*v31)(uint64_t, void *, uint64_t, void *, void *);
  uint64_t v32;
  void *v33;
  void (*v34)(uint64_t, uint64_t, uint64_t, _QWORD, void *);
  uint64_t v35;
  void *v37;
  CMTime time;
  __int128 v39;
  uint64_t v40;
  id v41;
  __int128 v42;
  uint64_t v43;

  v7 = a5;
  v8 = a3;
  objc_msgSend(v7, "objectForKey:", CFSTR("Playback date key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("Elapsed CMTime key"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v42 = 0uLL;
  v43 = 0;
  if (v10)
    objc_msgSend(v10, "CMTimeValue");
  objc_msgSend(v7, "objectForKey:", CFSTR("Play completion key"));
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("Ignore delegate key"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  v15 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "postAVKitScanningState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)v12;
  v41 = 0;
  v18 = *(void (**)(uint64_t, __int128 *, void *, uint64_t, void *, id, id, BOOL, id *))(v15 + 16);
  v39 = v42;
  v40 = v43;
  v18(v15, &v39, v9, v14, v17, v8, v7, v12 == 0, &v41);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v41;
  objc_msgSend(v20, "objectForKey:", CFSTR("Allowed key"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  objc_msgSend(v20, "objectForKey:", CFSTR("Elapsed CMTime key"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("Playback date key"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *(_QWORD *)(a1 + 40);
  if (v23)
  {
    v26 = v11;
    v27 = v9;
    v28 = v19;
    v29 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v23, "CMTimeValue");
    objc_msgSend(v29, "numberWithDouble:", CMTimeGetSeconds(&time));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = *(void (**)(uint64_t, void *, uint64_t, void *, void *))(v25 + 16);
    v32 = v25;
    v33 = v37;
    v31(v32, v37, v22, v30, v24);

    v19 = v28;
    v9 = v27;
    v11 = v26;
  }
  else
  {
    v34 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, void *))(v25 + 16);
    v35 = v25;
    v33 = (void *)v12;
    v34(v35, v12, v22, 0, v24);
  }

  return v19;
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_12_709(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id WeakRetained;
  int v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  int v25;
  void *v26;
  id v27;
  void *v28;
  __CFString *v29;
  Float64 v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void (*v36)(uint64_t, CMTime *, void *, CMTime *, void *, BOOL, double);
  uint64_t v37;
  void *v38;
  void *v40;
  void *v41;
  id v42;
  CMTime lhs;
  CMTime rhs;
  CMTime v45;
  CMTime time;
  void *v47;
  char v48;
  CMTime v49;
  CMTime v50;

  v42 = a2;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v9, "objectForKey:", CFSTR("Elapsed CMTime key"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  memset(&v50, 0, sizeof(v50));
  if (v10)
    objc_msgSend(v10, "CMTimeValue");
  objc_msgSend(v9, "objectForKey:", CFSTR("Playback date key"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("Seek precision key"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  objc_msgSend(v9, "objectForKey:", CFSTR("Post loading state key"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("Ignore delegate key"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v9, "objectForKey:", CFSTR("Play completion key"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  if (v13)
    objc_msgSend(v13, "CMTimeValue");
  if (v11)
  {
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) != 0)
      goto LABEL_7;
LABEL_13:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    v28 = v42;
    objc_msgSend(v42, "currentState");
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (!v12)
  {
    v41 = v13;
    goto LABEL_18;
  }
  v24 = *(_QWORD *)(a1 + 40);
  v47 = v12;
  v25 = (*(uint64_t (**)(void))(v24 + 16))();
  v26 = v14;
  v27 = v12;

  v12 = v27;
  v14 = v26;
  if (!v25)
    goto LABEL_13;
LABEL_7:
  v41 = v13;
  if (!v12)
  {
LABEL_18:
    v28 = v42;
    goto LABEL_19;
  }
  v17 = v14;
  v18 = v8;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v20 = objc_msgSend(WeakRetained, "_currentPlayerItemContainsDates");

  if (v20)
  {
    v21 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v21, "playbackDateAtStartOfSeek");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    memset(&time, 0, sizeof(time));
    v22 = objc_loadWeakRetained((id *)(a1 + 64));
    v23 = v22;
    v14 = v17;
    if (v22)
      objc_msgSend(v22, "timeAtStartOfSeek");
    else
      memset(&time, 0, sizeof(time));
    v8 = v18;

    objc_msgSend(v12, "timeIntervalSinceDate:", v40);
    CMTimeMakeWithSeconds(&rhs, v30, 1000000);
    lhs = time;
    CMTimeAdd(&v45, &lhs, &rhs);
    v50 = v45;

    goto LABEL_18;
  }
  v28 = v42;
  v8 = v18;
  v14 = v17;
LABEL_19:
  v31 = v8;
  if (v14)
  {
    v32 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v32, "setPostLoadingState:", v14);

  }
  v33 = *(_QWORD *)(a1 + 48);
  +[TVPPlaybackState loading](TVPPlaybackState, "loading");
  v34 = v14;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = *(void (**)(uint64_t, CMTime *, void *, CMTime *, void *, BOOL, double))(v33 + 16);
  time = v50;
  v45 = v49;
  v36(v33, &time, v12, &v45, v35, v16 == 0, 0.0);

  v37 = *(_QWORD *)(a1 + 56);
  time = v50;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CMTimeGetSeconds(&time));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, void *, void *))(v37 + 16))(v37, v16, 1, v38, v12);

  v14 = v34;
  v29 = CFSTR("Waiting for seek");
  v8 = v31;
  v13 = v41;
LABEL_22:

  return v29;
}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_13_710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  void (*v13)(uint64_t, __int128 *, _QWORD, __int128 *, _QWORD, uint64_t);
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  v6 = a5;
  objc_msgSend(v6, "objectForKey:", CFSTR("Elapsed CMTime key"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v19 = 0uLL;
  v20 = 0;
  if (v7)
    objc_msgSend(v7, "CMTimeValue");
  objc_msgSend(v6, "objectForKey:", CFSTR("Play completion key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "progressiveJumpingScrubber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rate");
  v13 = *(void (**)(uint64_t, __int128 *, _QWORD, __int128 *, _QWORD, uint64_t))(v10 + 16);
  v17 = v19;
  v18 = v20;
  v15 = *MEMORY[0x24BDC0D88];
  v16 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v13(v10, &v17, 0, &v15, 0, 1);

  return CFSTR("Scrubbing using progressive jumping waiting for seek");
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_14_711(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  void *v9;

  v7 = a2;
  objc_msgSend(a5, "objectForKey:", CFSTR("Play completion key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_msgSend(v7, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_15_712(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentPlayerItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained(v4);
  v23 = *MEMORY[0x24BDC0D88];
  v24 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  objc_msgSend(v7, "setTimeAtStartOfSeek:", &v23);

  v8 = objc_loadWeakRetained(v4);
  objc_msgSend(v8, "setPlaybackDateAtStartOfSeek:", 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_loadWeakRetained(v4);
  objc_msgSend(v9, "postNotificationName:object:", CFSTR("TVPPlayerStillImageDidChangeNotification"), v10);

  v11 = objc_loadWeakRetained(v4);
  if ((objc_msgSend(v11, "remainLoadingWhenSeekCompletes") & 1) == 0)
  {
    v12 = objc_loadWeakRetained(v4);
    objc_msgSend(v12, "postLoadingState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[TVPPlaybackState paused](TVPPlaybackState, "paused");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 != v14)
      goto LABEL_5;
    v11 = objc_loadWeakRetained(v4);
    +[TVPPlaybackState paused](TVPPlaybackState, "paused");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setState:updatedRate:notifyListeners:", v15, 1, 0.0);

  }
LABEL_5:
  v16 = objc_loadWeakRetained(v4);
  objc_msgSend(v16, "AVQueuePlayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "timeControlStatus");

  if (v18 != 1)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_16;
    v20[3] = &unk_24F15BF70;
    v21 = v3;
    v22 = v18;
    objc_msgSend(v21, "executeBlockAfterCurrentStateTransition:", v20);

  }
  return CFSTR("Waiting for time control status to be done waiting");
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_16(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  v2 = sPlayerLogObject;
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_228A4E000, v2, OS_LOG_TYPE_DEFAULT, "Posting time control status change since it is not AVPlayerTimeControlStatusWaitingToPlayAtSpecifiedRate", v5, 2u);
  }
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postEvent:withContext:", CFSTR("Time control status did change"), v4);

}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_713(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  __int128 v5;
  uint64_t v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = *MEMORY[0x24BDC0D88];
  v6 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  objc_msgSend(WeakRetained, "setTimeAtStartOfSeek:", &v5);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setPlaybackDateAtStartOfSeek:", 0);

  return CFSTR("Scrubbing using progressive jumping");
}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_714(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  Float64 v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32[2];
  CMTime v33;
  char v34;
  CMTime v35;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentInterstitialCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", CFSTR("Due to time jump key"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(WeakRetained) = objc_msgSend(v16, "BOOLValue");

  v17 = objc_loadWeakRetained(v13);
  objc_msgSend(v17, "elapsedTime");
  v19 = v18;

  memset(&v35, 0, sizeof(v35));
  v20 = objc_loadWeakRetained(v13);
  objc_msgSend(v20, "elapsedTime");
  CMTimeMakeWithSeconds(&v35, v21, 1000000);

  v22 = objc_loadWeakRetained(v13);
  objc_msgSend(v22, "stateMachine");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x24BDAC760];
  v28 = 3221225472;
  v29 = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_715;
  v30 = &unk_24F15D088;
  objc_copyWeak(v32, v13);
  v33 = v35;
  v34 = (char)WeakRetained;
  v24 = v15;
  v31 = v24;
  v32[1] = v19;
  objc_msgSend(v23, "executeBlockAfterCurrentStateTransition:", &v27);

  objc_msgSend(v9, "currentState", v27, v28, v29, v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(v32);
  return v25;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_715(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  void *v6;
  __int128 v7;
  uint64_t v8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = *(unsigned __int8 *)(a1 + 80);
  v7 = *(_OWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 72);
  objc_msgSend(WeakRetained, "_notifyListenersOfElapsedTimeChange:playbackDate:dueToTimeJump:", &v7, 0, v4);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(*(id *)(a1 + 32), "interstitialForTime:", *(double *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCurrentInterstitial:", v6);

}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_716(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id *v11;
  id WeakRetained;
  void *v13;
  id v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  Float64 v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  CMTime v41;
  CMTime v42;
  _QWORD v43[3];
  _QWORD v44[5];

  v44[3] = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v35 = a3;
  v37 = a4;
  v10 = a5;
  v11 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "currentInterstitialCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_loadWeakRetained(v11);
  objc_msgSend(v14, "rate");
  v16 = v15;

  v17 = objc_loadWeakRetained(v11);
  objc_msgSend(v17, "elapsedTime");
  v19 = v18;

  objc_msgSend(v13, "mergedInterstitialForTime:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20 && v16 != 0.0)
  {
    objc_msgSend(v20, "timeRange", v35, v37);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v16 <= 0.0)
    {
      objc_msgSend(v22, "startTime");
      v25 = -0.1;
    }
    else
    {
      objc_msgSend(v22, "endTime");
      v25 = 0.1;
    }
    v26 = v24 + v25;

    memset(&v42, 0, sizeof(v42));
    CMTimeMakeWithSeconds(&v42, v26, 1000000);
    v41 = v42;
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v41);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v27;
    v43[0] = CFSTR("Elapsed CMTime key");
    v43[1] = CFSTR("Seek precision key");
    v41 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCMTime:", &v41);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v28;
    v43[2] = CFSTR("Ignore delegate key");
    v44[2] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_loadWeakRetained(v11);
    objc_msgSend(v30, "stateMachine");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_717;
    v38[3] = &unk_24F15BA88;
    objc_copyWeak(&v40, v11);
    v32 = v29;
    v39 = v32;
    objc_msgSend(v31, "executeBlockAfterCurrentStateTransition:", v38);

    objc_destroyWeak(&v40);
  }
  objc_msgSend(v9, "currentState", v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_717(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCurrentInterstitial:", 0);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postEvent:withContext:userInfo:", CFSTR("Set elapsed time or date"), 0, *(_QWORD *)(a1 + 32));

}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_6_718(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "currentState");
}

__CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_720(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  id WeakRetained;
  id v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  id v24;
  void *v25;
  BOOL v26;
  int v27;
  NSObject *v28;
  _BOOL4 v29;
  int v30;
  int v31;
  id v32;
  id v33;
  uint64_t v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  unsigned int v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  __CFString *v52;
  void *v53;
  __CFString *v54;
  void *v55;
  __CFString *v56;
  id v57;
  void *v58;
  unint64_t v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  __CFString *v81;
  _QWORD v82[4];
  id v83;
  uint8_t buf[16];
  _QWORD v85[2];
  _QWORD v86[4];

  v86[2] = *MEMORY[0x24BDAC8D0];
  v75 = a2;
  v72 = a3;
  v73 = a4;
  v74 = a5;
  objc_msgSend(v74, "objectForKey:", CFSTR("Error key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TVPlaybackErrorDomain"), 801, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", 0x24F163E58);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  v13 = sPlayerLogObject;
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_ERROR))
      __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_720_cold_5((uint64_t)v9, v13, v15);
    objc_msgSend(v9, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x24BDB1C58]))
      v17 = objc_msgSend(v9, "code") == -11819;
    else
      v17 = 0;

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "currentMediaItem");
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v19 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v19, "currentPlayerItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "status") == 1)
      {

LABEL_26:
        v30 = 0;
        v31 = 1;
        goto LABEL_38;
      }
      v24 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v24, "currentPlayerItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "previousStatus") == 1;

      if (v26)
        goto LABEL_26;
    }
    else
    {
      objc_msgSend(v76, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemMetadataHasAttemptedPlaybackRetryDueToError"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "BOOLValue");

      if (v22)
      {
        v23 = sPlayerLogObject;
        if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_228A4E000, v23, OS_LOG_TYPE_DEFAULT, "Already retried playing this media item due to previous error.  Not retrying again", buf, 2u);
        }
        objc_msgSend(v76, "setMediaItemMetadata:forProperty:", MEMORY[0x24BDBD1C0], CFSTR("TVPMediaItemMetadataHasAttemptedPlaybackRetryDueToError"));
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v27 = objc_msgSend(v76, "shouldRetryPlaybackForError:", v9);
        v28 = sPlayerLogObject;
        v29 = os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT);
        if (v27)
        {
          if (v29)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_228A4E000, v28, OS_LOG_TYPE_DEFAULT, "Media item wants to retry playback for this error", buf, 2u);
          }
          objc_msgSend(v76, "setMediaItemMetadata:forProperty:", MEMORY[0x24BDBD1C8], CFSTR("TVPMediaItemMetadataHasAttemptedPlaybackRetryDueToError"));
          goto LABEL_26;
        }
        if (v29)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_228A4E000, v28, OS_LOG_TYPE_DEFAULT, "Media item does not want to retry playback for this error", buf, 2u);
        }
      }
    }
    v32 = objc_loadWeakRetained((id *)(a1 + 64));
    if (objc_msgSend(v32, "errorBehavior") == 2)
    {
      v30 = 1;
LABEL_37:

      v31 = 0;
LABEL_38:
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "bundleIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("com.apple.TVIdleScreen"));

      v41 = v40 & v17 | v30;
      v85[0] = CFSTR("TVPPlaybackErrorKey");
      v85[1] = CFSTR("TVPPlaybackWillStopDueToErrorKey");
      v86[0] = v9;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v86[1] = v42;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = (void *)MEMORY[0x24BDD16C8];
      v44 = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v43, "notificationWithName:object:userInfo:", CFSTR("TVPPlaybackErrorNotification"), v44, v71);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "postNotification:", v69);

      objc_msgSend(v76, "reportingDelegate");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v47 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v46, "mediaItem:errorDidOccur:player:", v76, v9, v47);

      }
      objc_msgSend(v76, "mediaItemMetadataForProperty:", CFSTR("TVPMediaItemPlaybackReportingEventCollection"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v48, "containsEventWithName:", TVPPlaybackReportingEventError) & 1) == 0)
      {
        objc_msgSend(v48, "addSingleShotEventWithName:value:", TVPPlaybackReportingEventError, v9);
        objc_msgSend(v48, "addSingleShotEventWithName:value:", TVPPlaybackReportingEventErrorEvent, TVPPlaybackReportingEventTotalStartupSequence);
      }
      if (v31)
      {
        if (v17 && os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_ERROR))
          __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_720_cold_1();
        v49 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v49, "postLoadingState");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        objc_msgSend(v75, "currentState");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = CFSTR("Pause");
        if ((objc_msgSend(v51, "isEqualToString:", CFSTR("Paused")) & 1) == 0)
        {
          if ((objc_msgSend(v51, "isEqualToString:", CFSTR("Waiting for media item to prepare for loading")) & 1) != 0
            || (objc_msgSend(v51, "isEqualToString:", CFSTR("Waiting for signal after preparing item")) & 1) != 0
            || (objc_msgSend(v51, "isEqualToString:", CFSTR("Waiting for AVAsset to load")) & 1) != 0
            || (objc_msgSend(v51, "isEqualToString:", CFSTR("Waiting for media item to prepare for playback initiation")) & 1) != 0|| (objc_msgSend(v51, "isEqualToString:", CFSTR("Waiting for AVPlayerItem status to become ready to play")) & 1) != 0|| (objc_msgSend(v51, "isEqualToString:", CFSTR("Waiting for sufficient buffer")) & 1) != 0|| objc_msgSend(v51, "isEqualToString:", CFSTR("Waiting for time control status to be done waiting")))
          {
            +[TVPPlaybackState paused](TVPPlaybackState, "paused");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = CFSTR("Play");
            if (v50 == v53)
              v54 = CFSTR("Pause");
            v52 = v54;

          }
          else
          {
            v52 = CFSTR("Play");
          }
        }
        v55 = *(void **)(a1 + 32);
        v79[0] = MEMORY[0x24BDAC760];
        v79[1] = 3221225472;
        v79[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_730;
        v79[3] = &unk_24F15BCB0;
        v80 = v55;
        v81 = v52;
        v56 = v52;
        objc_msgSend(v80, "executeBlockAfterCurrentStateTransition:", v79);

      }
      else
      {
        v57 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v57, "playlist");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "numConsecutivePlaybackFailures");

        v60 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v60, "playlist");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setNumConsecutivePlaybackFailures:", ++v59);

        v62 = objc_loadWeakRetained((id *)(a1 + 64));
        objc_msgSend(v62, "playlist");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v59) = v59 < objc_msgSend(v63, "count");

        if ((v59 & 1) != 0)
        {
          if (!v41)
          {
            v64 = (void *)sPlayerLogObject;
            if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_ERROR))
              __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_720_cold_3(v64, (id *)(a1 + 64));
            v65 = *(void **)(a1 + 32);
            v77[0] = MEMORY[0x24BDAC760];
            v77[1] = 3221225472;
            v77[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_733;
            v77[3] = &unk_24F15C088;
            objc_copyWeak(&v78, (id *)(a1 + 64));
            objc_msgSend(v65, "executeBlockAfterCurrentStateTransition:", v77);
            objc_msgSend(*(id *)(a1 + 32), "currentState");
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_destroyWeak(&v78);
            goto LABEL_70;
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_ERROR))
            __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_720_cold_4();
          v66 = objc_loadWeakRetained((id *)(a1 + 64));
          objc_msgSend(v66, "playlist");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setNumConsecutivePlaybackFailures:", 0);

        }
        if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_ERROR))
          __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_720_cold_2();
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
      v14 = CFSTR("Stopped");
LABEL_70:

      goto LABEL_71;
    }
    v33 = objc_loadWeakRetained((id *)(a1 + 64));
    v34 = objc_msgSend(v33, "errorBehavior");
    if (v34
      || (v70 = objc_loadWeakRetained((id *)(a1 + 64)), (objc_msgSend(v70, "loadingInitialItemInPlaylist") & 1) == 0))
    {
      v35 = v34 == 0;
      objc_msgSend(v9, "userInfo");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectForKey:", CFSTR("TVPMediaItemPlaybackErrorShouldStopKey"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v37, "BOOLValue");

      if (!v35)
      {
LABEL_36:

        goto LABEL_37;
      }
    }
    else
    {
      v30 = 1;
    }

    goto LABEL_36;
  }
  if (os_log_type_enabled((os_log_t)sPlayerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_228A4E000, v13, OS_LOG_TYPE_DEFAULT, "Supressing error and stopping due to media item loader request", buf, 2u);
  }
  v82[0] = MEMORY[0x24BDAC760];
  v82[1] = 3221225472;
  v82[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_721;
  v82[3] = &unk_24F15C088;
  objc_copyWeak(&v83, (id *)(a1 + 64));
  objc_msgSend(v75, "executeBlockAfterCurrentStateTransition:", v82);
  objc_msgSend(v75, "currentState");
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v83);
LABEL_71:

  return v14;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_721(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "stop");

}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_730(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:", *(_QWORD *)(a1 + 40));
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_733(uint64_t a1)
{
  id v1;

  v1 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v1, "changeMediaInDirection:reason:ignoreDelegate:", objc_msgSend(v1, "currentDirectionOfPlaylistChange"), CFSTR("Error did occur"), 1);

}

id __42__TVPPlayer__registerStateMachineHandlers__block_invoke_2_734(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "currentMediaItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "reportingDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v15, "mediaItemDidStall:player:", v14, v16);

  }
  v17 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_737;
  v20[3] = &unk_24F15C088;
  objc_copyWeak(&v21, (id *)(a1 + 40));
  objc_msgSend(v17, "executeBlockAfterCurrentStateTransition:", v20);
  objc_msgSend(*(id *)(a1 + 32), "currentState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v21);

  return v18;
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_3_737(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVPPlaybackDidStallNotification"), WeakRetained);

}

const __CFString *__42__TVPPlayer__registerStateMachineHandlers__block_invoke_4_738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  const __CFString *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  __CFString *v15;

  objc_msgSend(a5, "objectForKey:", CFSTR("Post loading state key"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVPPlaybackState paused](TVPPlaybackState, "paused");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "AVQueuePlayer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    (*(void (**)(float, double))(*(_QWORD *)(a1 + 40) + 16))(0.0, 0.0);
  if (v6 == v7)
    v10 = CFSTR("Pause");
  else
    v10 = CFSTR("Play");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v11 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_739;
  v13[3] = &unk_24F15BCB0;
  v14 = v11;
  v15 = (__CFString *)v10;
  objc_msgSend(v14, "executeBlockAfterCurrentStateTransition:", v13);

  return CFSTR("Stopped");
}

uint64_t __42__TVPPlayer__registerStateMachineHandlers__block_invoke_5_739(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "postEvent:", *(_QWORD *)(a1 + 40));
}

- (TVPPlaybackDelegate)delegate
{
  return (TVPPlaybackDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVPASyncPlaybackDelegate)asyncDelegate
{
  return (TVPASyncPlaybackDelegate *)objc_loadWeakRetained((id *)&self->_asyncDelegate);
}

- (void)setAsyncDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_asyncDelegate, a3);
}

- (BOOL)updatesMediaRemoteInfoAutomatically
{
  return self->_updatesMediaRemoteInfoAutomatically;
}

- (BOOL)respondsToRemoteControlEvents
{
  return self->_respondsToRemoteControlEvents;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (TVPPlaybackState)postAVKitScanningState
{
  return self->_postAVKitScanningState;
}

- (void)setPostAVKitScanningState:(id)a3
{
  objc_storeStrong((id *)&self->_postAVKitScanningState, a3);
}

- (void)setCurrentMediaItemLoader:(id)a3
{
  objc_storeStrong((id *)&self->_currentMediaItemLoader, a3);
}

- (NSMutableDictionary)elapsedTimeObserverBlocks
{
  return self->_elapsedTimeObserverBlocks;
}

- (void)setElapsedTimeObserverBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_elapsedTimeObserverBlocks, a3);
}

- (void)setBoundaryTimeObserverInfos:(id)a3
{
  objc_storeStrong((id *)&self->_boundaryTimeObserverInfos, a3);
}

- (id)timeJumpPeriodicObserverToken
{
  return self->_timeJumpPeriodicObserverToken;
}

- (void)setTimeJumpPeriodicObserverToken:(id)a3
{
  objc_storeStrong(&self->_timeJumpPeriodicObserverToken, a3);
}

- (id)highFrequencyTimeObserverToken
{
  return self->_highFrequencyTimeObserverToken;
}

- (void)setHighFrequencyTimeObserverToken:(id)a3
{
  objc_storeStrong(&self->_highFrequencyTimeObserverToken, a3);
}

- (TVPPlayerBookmarkMonitor)bookmarkMonitor
{
  return self->_bookmarkMonitor;
}

- (void)setBookmarkMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_bookmarkMonitor, a3);
}

- (TVPPlayerReporter)playerReporter
{
  return self->_playerReporter;
}

- (int64_t)numOutstandingSeeks
{
  return self->_numOutstandingSeeks;
}

- (void)setNumOutstandingSeeks:(int64_t)a3
{
  self->_numOutstandingSeeks = a3;
}

- (void)setVideoViewWeakReferences:(id)a3
{
  objc_storeStrong((id *)&self->_videoViewWeakReferences, a3);
}

- (void)setMediaItemLoaders:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItemLoaders, a3);
}

- (BOOL)handleRemoteCommandsWithoutUpdatingMediaRemote
{
  return self->_handleRemoteCommandsWithoutUpdatingMediaRemote;
}

- (void)setHandleRemoteCommandsWithoutUpdatingMediaRemote:(BOOL)a3
{
  self->_handleRemoteCommandsWithoutUpdatingMediaRemote = a3;
}

- (BOOL)pausesOnRouteChange
{
  return self->_pausesOnRouteChange;
}

- (void)setPausesOnRouteChange:(BOOL)a3
{
  self->_pausesOnRouteChange = a3;
}

- (BOOL)updatesBookmarks
{
  return self->_updatesBookmarks;
}

- (BOOL)sendsPlayerReports
{
  return self->_sendsPlayerReports;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lastTimeSentToAVKitImageHandler
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 664);
  return self;
}

- (void)setLastTimeSentToAVKitImageHandler:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_lastTimeSentToAVKitImageHandler.epoch = a3->var3;
  *(_OWORD *)&self->_lastTimeSentToAVKitImageHandler.value = v3;
}

- (BOOL)pausesOnHDCPProtectionDown
{
  return self->_pausesOnHDCPProtectionDown;
}

- (void)setPausesOnHDCPProtectionDown:(BOOL)a3
{
  self->_pausesOnHDCPProtectionDown = a3;
}

- (int64_t)currentMediaItemVideoRange
{
  return self->_currentMediaItemVideoRange;
}

- (void)setPendingSelectedMediaArray:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (BOOL)wasMutedPriorToScreenRecording
{
  return self->_wasMutedPriorToScreenRecording;
}

- (void)setWasMutedPriorToScreenRecording:(BOOL)a3
{
  self->_wasMutedPriorToScreenRecording = a3;
}

- (void)setPreferredAudioLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAudioLanguageCode, a3);
}

- (void)setPrefersAudioDescriptions:(BOOL)a3
{
  self->_prefersAudioDescriptions = a3;
}

- (void)setAvAssetTrackInspectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_avAssetTrackInspectionQueue, a3);
}

- (NSMutableDictionary)reportingValues
{
  return self->_reportingValues;
}

- (void)setReportingValues:(id)a3
{
  objc_storeStrong((id *)&self->_reportingValues, a3);
}

- (BOOL)loadingInitialItemInPlaylist
{
  return self->_loadingInitialItemInPlaylist;
}

- (BOOL)modifyingAVPlayerRate
{
  return self->_modifyingAVPlayerRate;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeBeingSeekedTo
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 688);
  return self;
}

- (NSDate)dateBeingSeekedTo
{
  return self->_dateBeingSeekedTo;
}

- (NSDate)playbackDateAtStartOfSeek
{
  return self->_playbackDateAtStartOfSeek;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeAtStartOfSeek
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 712);
  return self;
}

- (int64_t)currentDirectionOfPlaylistChange
{
  return self->_currentDirectionOfPlaylistChange;
}

- (id)chapterBoundaryTimeObserverToken
{
  return self->_chapterBoundaryTimeObserverToken;
}

- (void)setChapterBoundaryTimeObserverToken:(id)a3
{
  objc_storeStrong(&self->_chapterBoundaryTimeObserverToken, a3);
}

- (id)interstitialBoundaryTimeObserverToken
{
  return self->_interstitialBoundaryTimeObserverToken;
}

- (void)setInterstitialBoundaryTimeObserverToken:(id)a3
{
  objc_storeStrong(&self->_interstitialBoundaryTimeObserverToken, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)cachedElapsedCMTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 736);
  return self;
}

- (void)setCachedElapsedCMTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_cachedElapsedCMTime.epoch = a3->var3;
  *(_OWORD *)&self->_cachedElapsedCMTime.value = v3;
}

- (TVPProgressiveJumpingScrubber)progressiveJumpingScrubber
{
  return self->_progressiveJumpingScrubber;
}

- (void)setProgressiveJumpingScrubber:(id)a3
{
  objc_storeStrong((id *)&self->_progressiveJumpingScrubber, a3);
}

- (NSString)mediaItemChangeReason
{
  return self->_mediaItemChangeReason;
}

- (void)setMediaItemChangeReason:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItemChangeReason, a3);
}

- (BOOL)sceneCompletelyBuffered
{
  return self->_sceneCompletelyBuffered;
}

- (void)setSceneCompletelyBuffered:(BOOL)a3
{
  self->_sceneCompletelyBuffered = a3;
}

- (NSMutableArray)asyncDelegateOperations
{
  return self->_asyncDelegateOperations;
}

- (void)setAsyncDelegateOperations:(id)a3
{
  objc_storeStrong((id *)&self->_asyncDelegateOperations, a3);
}

- (NSNumber)temporarySubtitleOverrideType
{
  return self->_temporarySubtitleOverrideType;
}

- (void)setTemporarySubtitleOverrideType:(id)a3
{
  objc_storeStrong((id *)&self->_temporarySubtitleOverrideType, a3);
}

- (TVPAudioOption)cachedSelectedAudioOption
{
  return self->_cachedSelectedAudioOption;
}

- (NSArray)cachedSeekableTimeRanges
{
  return self->_cachedSeekableTimeRanges;
}

- (void)setPlayerItemFromCacheManager:(id)a3
{
  objc_storeStrong((id *)&self->_playerItemFromCacheManager, a3);
}

- (BOOL)outputObscuredDueToInsufficientExternalProtection
{
  return self->_outputObscuredDueToInsufficientExternalProtection;
}

- (void)setOutputObscuredDueToInsufficientExternalProtection:(BOOL)a3
{
  self->_outputObscuredDueToInsufficientExternalProtection = a3;
}

- (void)setIFramePrefetchMaxSize:(CGSize)a3
{
  self->_iFramePrefetchMaxSize = a3;
}

- (BOOL)asyncDelegateInProgress
{
  return self->_asyncDelegateInProgress;
}

- (void)setAsyncDelegateInProgress:(BOOL)a3
{
  self->_asyncDelegateInProgress = a3;
}

- (BOOL)usesLegacyDelegateBehavior
{
  return self->_usesLegacyDelegateBehavior;
}

- (void)setUsesLegacyDelegateBehavior:(BOOL)a3
{
  self->_usesLegacyDelegateBehavior = a3;
}

- (void)setCreatesPlayerItemButDoesNotEnqueue:(BOOL)a3
{
  self->_createsPlayerItemButDoesNotEnqueue = a3;
}

- (AVPlayerItem)unqueuedPlayerItem
{
  return self->_unqueuedPlayerItem;
}

- (void)setUnqueuedPlayerItem:(id)a3
{
  objc_storeStrong((id *)&self->_unqueuedPlayerItem, a3);
}

- (id)AVKitExternalImageScanningUpdateBlock
{
  return self->_AVKitExternalImageScanningUpdateBlock;
}

- (void)setAVKitExternalImageScanningUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (BOOL)mediaRemoteUpdatingEnabled
{
  return self->_mediaRemoteUpdatingEnabled;
}

- (BOOL)remainLoadingWhenSeekCompletes
{
  return self->_remainLoadingWhenSeekCompletes;
}

- (void)setRemainLoadingWhenSeekCompletes:(BOOL)a3
{
  self->_remainLoadingWhenSeekCompletes = a3;
}

- (BOOL)initialMediaItemHasCompletedInitialLoading
{
  return self->_initialMediaItemHasCompletedInitialLoading;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_AVKitExternalImageScanningUpdateBlock, 0);
  objc_storeStrong((id *)&self->_unqueuedPlayerItem, 0);
  objc_storeStrong(&self->_highFrequencyElapsedTimeObserverBlock, 0);
  objc_storeStrong((id *)&self->_playerItemFromCacheManager, 0);
  objc_storeStrong((id *)&self->_AVQueuePlayer, 0);
  objc_storeStrong((id *)&self->_cachedSeekableTimeRanges, 0);
  objc_storeStrong((id *)&self->_cachedLoadedTimeRanges, 0);
  objc_storeStrong((id *)&self->_earlyAVQueuePlayer, 0);
  objc_storeStrong((id *)&self->_cachedSelectedAudioOption, 0);
  objc_storeStrong((id *)&self->_playbackEndTimeBoundaryObserverTokens, 0);
  objc_storeStrong((id *)&self->_temporarySubtitleOverrideType, 0);
  objc_storeStrong((id *)&self->_asyncDelegateOperations, 0);
  objc_storeStrong((id *)&self->_mediaItemChangeReason, 0);
  objc_storeStrong((id *)&self->_progressiveJumpingScrubber, 0);
  objc_storeStrong(&self->_interstitialBoundaryTimeObserverToken, 0);
  objc_storeStrong((id *)&self->_externalImagePlayer, 0);
  objc_storeStrong(&self->_chapterBoundaryTimeObserverToken, 0);
  objc_storeStrong((id *)&self->_playbackDateAtStartOfSeek, 0);
  objc_storeStrong((id *)&self->_dateBeingSeekedTo, 0);
  objc_storeStrong((id *)&self->_currentPlayerItem, 0);
  objc_storeStrong((id *)&self->_reportingValues, 0);
  objc_storeStrong((id *)&self->_avAssetTrackInspectionQueue, 0);
  objc_storeStrong((id *)&self->_preferredAudioLanguageCode, 0);
  objc_storeStrong((id *)&self->_pendingSelectedMediaArray, 0);
  objc_storeStrong((id *)&self->_mediaItemLoaders, 0);
  objc_storeStrong((id *)&self->_videoViewWeakReferences, 0);
  objc_storeStrong((id *)&self->_playerReporter, 0);
  objc_storeStrong((id *)&self->_bookmarkMonitor, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_highFrequencyTimeObserverToken, 0);
  objc_storeStrong(&self->_timeJumpPeriodicObserverToken, 0);
  objc_storeStrong(&self->_periodicTimeObserverToken, 0);
  objc_storeStrong((id *)&self->_boundaryTimeObserverInfos, 0);
  objc_storeStrong((id *)&self->_elapsedTimeObserverBlocks, 0);
  objc_storeStrong((id *)&self->_currentMediaItemLoader, 0);
  objc_storeStrong((id *)&self->_postAVKitScanningState, 0);
  objc_storeStrong((id *)&self->_postLoadingState, 0);
  objc_storeStrong((id *)&self->_playlistInternal, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_reportingCategory, 0);
  objc_storeStrong((id *)&self->_subtitleOptions, 0);
  objc_storeStrong((id *)&self->_audioOptions, 0);
  objc_storeStrong((id *)&self->_currentInterstitial, 0);
  objc_storeStrong((id *)&self->_currentInterstitialCollection, 0);
  objc_storeStrong((id *)&self->_currentChapter, 0);
  objc_storeStrong((id *)&self->_currentChapterCollection, 0);
  objc_storeStrong((id *)&self->_chapterCollections, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_asyncDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

void __38__TVPPlayer__playerDidBecomeInactive___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_0(&dword_228A4E000, a2, a3, "Error deactivating audio session: %@", (uint8_t *)&v3);
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_546_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Not issuing seek because it's invalid or indefinite", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_720_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "mediaserverd died; restarting current media item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_720_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Stopping due to error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_720_cold_3(void *a1, id *a2)
{
  NSObject *v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  WeakRetained = objc_loadWeakRetained(a2);
  v5 = objc_msgSend(WeakRetained, "currentDirectionOfPlaylistChange");
  v7 = CFSTR("previous");
  if (!v5)
    v7 = CFSTR("next");
  v8 = 138412290;
  v9 = v7;
  OUTLINED_FUNCTION_1_0(&dword_228A4E000, v3, v6, "Changing to %@ media item due to error", (uint8_t *)&v8);

}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_720_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_228A4E000, v0, v1, "Stopping because every item in the playlist failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42__TVPPlayer__registerStateMachineHandlers__block_invoke_7_720_cold_5(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_1_0(&dword_228A4E000, a2, a3, "Error occurred: %{public}@", (uint8_t *)&v3);
}

@end
