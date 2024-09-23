uint64_t sub_244EB72E4(unint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  BOOL v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _DWORD v21[74];
  _DWORD v22[76];

  if (a1 >> 62)
  {
LABEL_31:
    swift_bridgeObjectRetain();
    result = sub_244EE209C();
    v6 = result;
    if (result)
      goto LABEL_3;
  }
  else
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v6)
    {
LABEL_3:
      v8 = 0;
      v9 = a1 & 0xC000000000000001;
      v10 = MEMORY[0x24BEE4AF8];
      v18 = v6;
      do
      {
        if (v9)
        {
          v12 = MEMORY[0x249529C58](v8, a1);
          v13 = __OFADD__(v8++, 1);
          if (v13)
            goto LABEL_30;
        }
        else
        {
          if (v8 >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            return result;
          }
          v12 = *(_QWORD *)(a1 + 32 + 8 * v8);
          swift_retain();
          v13 = __OFADD__(v8++, 1);
          if (v13)
          {
LABEL_30:
            __break(1u);
            goto LABEL_31;
          }
        }
        if (!*(_QWORD *)(*a2 + 16) || (sub_244EB9538(v12), (v14 & 1) == 0))
        {
          v20 = v12;
          v15 = sub_244ECDF60();
          v19 = sub_244EB7878(v10);
          if (v15 >> 62)
          {
            swift_bridgeObjectRetain();
            v16 = sub_244EE209C();
            swift_bridgeObjectRelease();
            if (v16)
            {
LABEL_19:
              while (1)
              {
                v13 = __OFSUB__(v16--, 1);
                if (v13)
                  break;
                if ((v15 & 0xC000000000000001) != 0)
                {
                  v17 = MEMORY[0x249529C58](v16, v15);
                }
                else
                {
                  if ((v16 & 0x8000000000000000) != 0)
                    goto LABEL_27;
                  if (v16 >= *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
                    goto LABEL_28;
                  v17 = *(_QWORD *)(v15 + 32 + 8 * v16);
                  swift_retain();
                }
                sub_244EB7974(v17, a2, a3, v21);
                sub_244EBBA84((uint64_t)v21);
                swift_release();
                if (!v16)
                  goto LABEL_4;
              }
              __break(1u);
LABEL_27:
              __break(1u);
LABEL_28:
              __break(1u);
              return swift_bridgeObjectRelease();
            }
          }
          else
          {
            v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
            if (v16)
              goto LABEL_19;
          }
LABEL_4:
          swift_bridgeObjectRelease();
          sub_244EB7974(v20, a2, a3, v22);
          sub_244EBBA84((uint64_t)v22);
          v10 = MEMORY[0x24BEE4AF8];
          v11 = sub_244EB8DCC(MEMORY[0x24BEE4AF8]);
          sub_244EBDB28(v19, a2, v11);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v9 = a1 & 0xC000000000000001;
          v6 = v18;
        }
        result = swift_release();
      }
      while (v8 != v6);
    }
  }
  return swift_bridgeObjectRelease();
}

unint64_t sub_244EB757C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AEA8);
  v2 = (_QWORD *)sub_244EE20C0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_DWORD *)(a1 + 40);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 1);
    v6 = *v4;
    v7 = swift_retain();
    result = sub_244EB9538(v7);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v2[6] + 8 * result) = v5;
    *(_DWORD *)(v2[7] + 4 * result) = v6;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 4;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_244EB7678(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_244EE20C0();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v7 = *(v5 - 1);
    v6 = *v5;
    swift_retain();
    swift_bridgeObjectRetain();
    result = sub_244EB9538(v7);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v3[6] + v10) = v7;
    *(_QWORD *)(v3[7] + v10) = v6;
    v11 = v3[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v3[2] = v13;
    v5 += 2;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_244EB777C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AF08);
  v2 = (_QWORD *)sub_244EE20C0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v5 = *(v4 - 1);
    v6 = *v4;
    v7 = swift_retain();
    result = sub_244EB9538(v7);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v2[6] + v10) = v5;
    *(_QWORD *)(v2[7] + v10) = v6;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 2;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_244EB7878(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AF40);
  v2 = (_QWORD *)sub_244EE20C0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_BYTE *)(a1 + 40);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 1);
    v6 = *v4;
    v7 = swift_retain();
    result = sub_244EB9538(v7);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v2[6] + 8 * result) = v5;
    *(_BYTE *)(v2[7] + result) = v6;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 16;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_244EB7974@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X2>, _DWORD *a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  char v21;
  __int128 v22;
  char v23;
  int v24;
  char v25;
  int v26;
  char v27;
  int v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t result;
  char v33;
  int v34;
  char v35;
  int v36;
  char v37;
  uint64_t v38;
  char v39;
  int v40;
  char v41;
  int v42;
  char v43;
  int v44;
  char v45;
  int v46;
  char v47;
  uint64_t v48;
  char v49;
  void (*v50)(char *, char *, uint64_t);
  __int128 v51;
  char v52;
  int v53;
  char v54;
  int v55;
  char v56;
  int v57;
  char v58;
  uint64_t v59;
  char v60;
  int v61;
  char v62;
  int v63;
  char v64;
  int v65;
  char v66;
  uint64_t v67;
  char v68;
  int v69;
  char v70;
  int v71;
  char v72;
  int v73;
  char v74;
  int v75;
  char v76;
  uint64_t v77;
  int v78;
  char i;
  _BYTE *v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  _QWORD *v96;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v98;
  char v99;
  _DWORD *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  _DWORD *v109;
  char *v110;
  uint64_t v111;
  _BYTE *v112;
  _QWORD *v113;
  uint64_t *v114;
  uint64_t v115;
  char *v116;
  int v117;
  int v118;
  int v119;
  int v120;
  uint64_t v121;
  int v122;
  int v123;
  int v124;
  uint64_t v125;
  int v126;
  int v127;
  int v128;
  int v129;
  uint64_t v130;
  int v131;
  int v132;
  int v133;
  uint64_t v134;
  int v135;
  int v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  int v140;
  int v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  char v148;
  char v149;
  char v150;
  char v151;
  char v152;
  char v153;
  char v154;
  char v155;
  char v156;
  char v157;
  char v158;
  char v159;
  char v160;
  _DWORD v161[2];
  char v162;
  __int16 v163;
  char v164;
  char v165;
  __int16 v166;
  char v167;
  char v168;
  __int16 v169;
  char v170;
  char v171;
  __int16 v172;
  char v173;
  char v174;
  __int16 v175;
  char v176;
  char v177;
  __int16 v178;
  char v179;
  char v180;
  __int16 v181;
  char v182;
  char v183;
  __int16 v184;
  char v185;
  char v186;
  __int16 v187;
  char v188;
  char v189;
  __int16 v190;
  char v191;
  char v192;
  __int16 v193;
  char v194;
  char v195;
  __int16 v196;
  char v197;
  char v198;
  _DWORD v199[2];
  char v200;
  __int16 v201;
  char v202;
  char v203;
  __int16 v204;
  char v205;
  char v206;
  __int16 v207;
  char v208;
  char v209;
  _DWORD v210[2];
  char v211;
  __int16 v212;
  char v213;
  char v214;
  __int16 v215;
  char v216;
  char v217;
  __int16 v218;
  char v219;
  char v220;
  __int16 v221;
  char v222;
  char v223;
  __int16 v224;
  char v225;
  char v226;
  __int16 v227;
  char v228;
  char v229;
  __int16 v230;
  char v231;
  char v232;
  __int16 v233;
  char v234;
  char v235;
  _QWORD v236[37];
  int v237;
  char v238;
  int v239;
  char v240;
  int v241;
  char v242;
  int v243;
  char v244;
  int v245;
  char v246;
  uint64_t v247;
  int v248;
  char v249;
  int v250;
  char v251;
  int v252;
  char v253;
  uint64_t v254;
  char v255;
  __int128 v256;
  int v257;
  char v258;
  int v259;
  char v260;
  int v261;
  char v262;
  uint64_t v263;
  char v264;
  int v265;
  unsigned __int8 v266;
  int v267;
  unsigned __int8 v268;
  int v269;
  unsigned __int8 v270;
  int v271;
  unsigned __int8 v272;
  int v273;
  unsigned __int8 v274;
  uint64_t v275;
  int v276;
  unsigned __int8 v277;
  int v278;
  unsigned __int8 v279;
  int v280;
  unsigned __int8 v281;
  uint64_t v282;
  int v283;
  unsigned __int8 v284;
  int v285;
  unsigned __int8 v286;
  int v287;
  unsigned __int8 v288;
  uint64_t v289;
  int v290;
  char v291;
  uint64_t v292;
  uint64_t v293;
  char v294;
  uint64_t v295;
  _QWORD v296[37];
  int v297;
  char v298;
  int v299;
  char v300;
  int v301;
  char v302;
  int v303;
  char v304;
  int v305;
  char v306;
  uint64_t v307;
  int v308;
  char v309;
  int v310;
  char v311;
  int v312;
  char v313;
  uint64_t v314;
  char v315;
  __int128 v316;
  int v317;
  char v318;
  int v319;
  char v320;
  int v321;
  char v322;
  uint64_t v323;
  char v324;
  int v325;
  unsigned __int8 v326;
  int v327;
  unsigned __int8 v328;
  int v329;
  unsigned __int8 v330;
  int v331;
  unsigned __int8 v332;
  int v333;
  unsigned __int8 v334;
  uint64_t v335;
  int v336;
  unsigned __int8 v337;
  int v338;
  unsigned __int8 v339;
  int v340;
  unsigned __int8 v341;
  uint64_t v342;
  int v343;
  unsigned __int8 v344;
  int v345;
  unsigned __int8 v346;
  int v347;
  unsigned __int8 v348;
  uint64_t v349;
  int v350;
  char v351;
  uint64_t v352;
  uint64_t v353;
  char v354;
  uint64_t v355;
  _BYTE v356[40];
  _BYTE v357[56];
  _BYTE v358[40];
  _BYTE v359[40];
  _BYTE v360[72];
  char v361[8];
  int v362;
  char v363;
  int v364;
  char v365;
  int v366;
  char v367;
  int v368;
  char v369;
  uint64_t v370;
  int v371;
  char v372;
  int v373;
  char v374;
  int v375;
  char v376;
  uint64_t v377;
  char v378;
  uint64_t v379;
  uint64_t v380;
  int v381;
  char v382;
  int v383;
  char v384;
  int v385;
  char v386;
  uint64_t v387;
  char v388;
  int v389;
  char v390;
  int v391;
  char v392;
  int v393;
  unsigned __int8 v394;
  int v395;
  unsigned __int8 v396;
  int v397;
  unsigned __int8 v398;
  uint64_t v399;
  int v400;
  unsigned __int8 v401;
  int v402;
  unsigned __int8 v403;
  int v404;
  unsigned __int8 v405;
  uint64_t v406;
  int v407;
  unsigned __int8 v408;
  int v409;
  unsigned __int8 v410;
  int v411;
  unsigned __int8 v412;
  uint64_t v413;
  int v414;
  unsigned __int8 v415;
  uint64_t v416;
  uint64_t v417;
  unsigned __int8 v418;
  uint64_t v419;
  int v420;
  char v421;
  int v422;
  char v423;
  int v424;
  char v425;
  int v426;
  char v427;
  int v428;
  char v429;
  uint64_t v430;
  unsigned int v431;
  char v432;
  int v433;
  char v434;
  int v435;
  char v436;
  uint64_t v437;
  char v438;
  __int128 v439;
  int v440;
  char v441;
  int v442;
  char v443;
  int v444;
  char v445;
  uint64_t v446;
  char v447;
  int v448;
  unsigned __int8 v449;
  int v450;
  unsigned __int8 v451;
  int v452;
  unsigned __int8 v453;
  int v454;
  unsigned __int8 v455;
  int v456;
  unsigned __int8 v457;
  uint64_t v458;
  int v459;
  unsigned __int8 v460;
  int v461;
  char v462;
  int v463;
  char v464;
  uint64_t v465;
  int v466;
  unsigned __int8 v467;
  int v468;
  unsigned __int8 v469;
  int v470;
  unsigned __int8 v471;
  uint64_t v472;
  int v473;
  char v474;
  uint64_t v475;
  uint64_t v476;
  char v477;
  uint64_t v478;
  char v479;
  char v480;
  char v481;
  int v482[74];
  _QWORD v483[38];

  v114 = a3;
  v109 = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE60);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v107 = (char *)&v102 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AF30);
  v108 = *(_QWORD *)(v115 - 8);
  MEMORY[0x24BDAC7A8](v115);
  v116 = (char *)&v102 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_244EE1A0C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v102 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v102 - v15;
  v113 = a2;
  v17 = *a2;
  if (*(_QWORD *)(v17 + 16))
  {
    v18 = swift_retain();
    v19 = sub_244EB9538(v18);
    if ((v20 & 1) != 0)
    {
      memcpy(v483, (const void *)(*(_QWORD *)(v17 + 56) + 296 * v19), 0x128uLL);
      sub_244EBEE3C((uint64_t)v483);
      swift_release();
      LODWORD(v145) = v483[32];
      v143 = v483[34];
      v144 = v483[33];
      v117 = LOBYTE(v483[35]);
      v118 = BYTE4(v483[32]);
      v142 = v483[36];
      v132 = BYTE4(v483[28]);
      v140 = v483[29];
      v141 = v483[28];
      v129 = BYTE4(v483[29]);
      LODWORD(v139) = v483[30];
      v137 = v483[27];
      v138 = v483[31];
      v126 = BYTE4(v483[18]);
      v127 = BYTE4(v483[30]);
      v135 = v483[19];
      v136 = v483[18];
      v124 = BYTE4(v483[20]);
      LODWORD(v125) = BYTE4(v483[19]);
      v133 = v483[21];
      LODWORD(v134) = v483[20];
      v131 = v483[22];
      v122 = BYTE4(v483[22]);
      v123 = BYTE4(v483[21]);
      v130 = v483[23];
      v128 = v483[24];
      v120 = v483[25];
      LODWORD(v121) = BYTE4(v483[24]);
      v21 = BYTE4(v483[25]);
      v119 = v483[26];
      v22 = *(_OWORD *)&v483[11];
      v23 = BYTE4(v483[26]);
      v24 = v483[13];
      v25 = BYTE4(v483[13]);
      v26 = v483[14];
      v27 = BYTE4(v483[14]);
      v28 = v483[15];
      v29 = BYTE4(v483[15]);
      v30 = v483[16];
      v31 = v483[17];
      result = LODWORD(v483[6]);
      v33 = BYTE4(v483[6]);
      v34 = v483[7];
      v35 = BYTE4(v483[7]);
      v36 = v483[8];
      v37 = BYTE4(v483[8]);
      v38 = v483[9];
      v39 = v483[10];
      v40 = v483[1];
      v41 = BYTE4(v483[1]);
      v42 = v483[2];
      v43 = BYTE4(v483[2]);
      v44 = v483[3];
      v45 = BYTE4(v483[3]);
      v46 = v483[4];
      v47 = BYTE4(v483[4]);
      v48 = v483[5];
      LODWORD(v146) = v483[0];
      v49 = BYTE4(v483[0]);
LABEL_11:
      LOBYTE(v236[0]) = v49;
      LOBYTE(v210[0]) = v41;
      LOBYTE(v199[0]) = v43;
      LOBYTE(v161[0]) = v45;
      LOBYTE(v233) = v47;
      LOBYTE(v230) = v33;
      LOBYTE(v227) = v35;
      LOBYTE(v224) = v37;
      LOBYTE(v221) = v39;
      LOBYTE(v218) = v25;
      LOBYTE(v215) = v27;
      LOBYTE(v212) = v29;
      LOBYTE(v207) = v31;
      LOBYTE(v204) = v126;
      LOBYTE(v201) = v125;
      LOBYTE(v196) = v124;
      LOBYTE(v193) = v123;
      LOBYTE(v190) = v122;
      LOBYTE(v187) = v121;
      LOBYTE(v184) = v21;
      LOBYTE(v181) = v23;
      LOBYTE(v178) = v132;
      LOBYTE(v175) = v129;
      LOBYTE(v172) = v127;
      LOBYTE(v169) = v118;
      LOBYTE(v166) = v117;
      v100 = v109;
      *v109 = v146;
      v100[2] = v40;
      *((_BYTE *)v100 + 4) = v236[0];
      *((_BYTE *)v100 + 12) = v210[0];
      v100[4] = v42;
      *((_BYTE *)v100 + 20) = v199[0];
      v100[6] = v44;
      *((_BYTE *)v100 + 28) = v161[0];
      v100[8] = v46;
      *((_BYTE *)v100 + 36) = v233;
      *((_QWORD *)v100 + 5) = v48;
      v100[12] = result;
      *((_BYTE *)v100 + 52) = v230;
      v100[14] = v34;
      *((_BYTE *)v100 + 60) = v227;
      v100[16] = v36;
      *((_BYTE *)v100 + 68) = v224;
      *((_QWORD *)v100 + 9) = v38;
      *((_BYTE *)v100 + 80) = v221;
      *(_OWORD *)(v100 + 22) = v22;
      v100[26] = v24;
      *((_BYTE *)v100 + 108) = v218;
      v100[28] = v26;
      *((_BYTE *)v100 + 116) = v215;
      v100[30] = v28;
      *((_BYTE *)v100 + 124) = v212;
      *((_QWORD *)v100 + 16) = v30;
      *((_BYTE *)v100 + 136) = v207;
      v100[36] = v136;
      *((_BYTE *)v100 + 148) = v204;
      v100[38] = v135;
      *((_BYTE *)v100 + 156) = v201;
      v100[40] = v134;
      *((_BYTE *)v100 + 164) = v196;
      v100[42] = v133;
      *((_BYTE *)v100 + 172) = v193;
      v100[44] = v131;
      *((_BYTE *)v100 + 180) = v190;
      *((_QWORD *)v100 + 23) = v130;
      v100[48] = v128;
      *((_BYTE *)v100 + 196) = v187;
      v100[50] = v120;
      *((_BYTE *)v100 + 204) = v184;
      v100[52] = v119;
      *((_BYTE *)v100 + 212) = v181;
      *((_QWORD *)v100 + 27) = v137;
      v100[56] = v141;
      *((_BYTE *)v100 + 228) = v178;
      v100[58] = v140;
      *((_BYTE *)v100 + 236) = v175;
      v100[60] = v139;
      *((_BYTE *)v100 + 244) = v172;
      *((_QWORD *)v100 + 31) = v138;
      v100[64] = v145;
      *((_BYTE *)v100 + 260) = v169;
      v101 = v143;
      *((_QWORD *)v100 + 33) = v144;
      *((_QWORD *)v100 + 34) = v101;
      *((_BYTE *)v100 + 280) = v166;
      *((_QWORD *)v100 + 36) = v142;
      return result;
    }
    swift_release();
  }
  v103 = v7;
  v104 = v6;
  v112 = (char *)&v236[32] + 4;
  sub_244EE1A6C();
  v106 = a1;
  sub_244EE173C();
  sub_244ECFB74((uint64_t)&v237);
  v105 = v11;
  v50 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v110 = v16;
  v111 = v10;
  v50(v14, v16, v10);
  sub_244EE19F4();
  LODWORD(v146) = v290;
  v481 = v291;
  v144 = v293;
  v145 = v292;
  v480 = v294;
  v143 = v295;
  LODWORD(v138) = v283;
  v136 = v285;
  v141 = v286;
  LODWORD(v142) = v284;
  v140 = v288;
  v139 = v289;
  v130 = v282;
  v128 = v265;
  LODWORD(v137) = v266;
  LODWORD(v125) = v267;
  v135 = v268;
  v124 = v269;
  v133 = v287;
  LODWORD(v134) = v270;
  v132 = v272;
  v122 = v273;
  v123 = v271;
  v131 = v274;
  v121 = v275;
  v129 = v277;
  v119 = v278;
  v120 = v276;
  v118 = v280;
  v126 = v281;
  v127 = v279;
  v51 = v256;
  v117 = v294 & 1;
  v52 = v291 & 1;
  v53 = v257;
  v54 = v258;
  v55 = v259;
  v56 = v260;
  v57 = v261;
  v58 = v262;
  v59 = v263;
  v60 = v264;
  v61 = v248;
  v62 = v249;
  v63 = v250;
  v64 = v251;
  v65 = v252;
  v66 = v253;
  v67 = v254;
  v68 = v255;
  v69 = v239;
  v70 = v240;
  v71 = v241;
  v72 = v242;
  v73 = v243;
  v74 = v244;
  v75 = v245;
  v76 = v246;
  v77 = v247;
  v78 = v237;
  for (i = v238; ; i = v298)
  {
    LODWORD(v236[0]) = v78;
    LODWORD(v236[1]) = v69;
    LODWORD(v236[2]) = v71;
    LODWORD(v236[3]) = v73;
    LODWORD(v236[4]) = v75;
    v236[5] = v77;
    LODWORD(v236[6]) = v61;
    LODWORD(v236[7]) = v63;
    LODWORD(v236[8]) = v65;
    v236[9] = v67;
    LODWORD(v236[13]) = v53;
    LODWORD(v236[14]) = v55;
    LODWORD(v236[15]) = v57;
    v236[16] = v59;
    LODWORD(v236[18]) = v128;
    LODWORD(v236[19]) = v125;
    LODWORD(v236[20]) = v124;
    LODWORD(v236[21]) = v123;
    LODWORD(v236[22]) = v122;
    v236[23] = v121;
    LODWORD(v236[24]) = v120;
    LODWORD(v236[25]) = v119;
    LODWORD(v236[26]) = v118;
    v236[27] = v130;
    LODWORD(v236[28]) = v138;
    LODWORD(v236[29]) = v136;
    LODWORD(v236[30]) = v133;
    BYTE4(v236[0]) = i & 1;
    BYTE4(v236[1]) = v70 & 1;
    BYTE4(v236[2]) = v72 & 1;
    BYTE4(v236[3]) = v74 & 1;
    BYTE4(v236[4]) = v76 & 1;
    BYTE4(v236[6]) = v62 & 1;
    BYTE4(v236[7]) = v64 & 1;
    BYTE4(v236[8]) = v66 & 1;
    LOBYTE(v236[10]) = v68 & 1;
    *(_OWORD *)&v236[11] = v51;
    BYTE4(v236[13]) = v54 & 1;
    BYTE4(v236[14]) = v56 & 1;
    BYTE4(v236[15]) = v58 & 1;
    LOBYTE(v236[17]) = v60 & 1;
    BYTE4(v236[18]) = v137 & 1;
    BYTE4(v236[19]) = v135 & 1;
    BYTE4(v236[20]) = v134 & 1;
    BYTE4(v236[21]) = v132 & 1;
    BYTE4(v236[22]) = v131 & 1;
    BYTE4(v236[24]) = v129 & 1;
    BYTE4(v236[25]) = v127 & 1;
    BYTE4(v236[26]) = v126 & 1;
    BYTE4(v236[28]) = v142 & 1;
    BYTE4(v236[29]) = v141 & 1;
    BYTE4(v236[30]) = v140 & 1;
    v236[31] = v139;
    LODWORD(v236[32]) = v146;
    v80 = v112;
    *v112 = v52 & 1;
    v236[33] = v145;
    v236[34] = v144;
    v80[20] = v117 & 1;
    v236[36] = v143;
    memcpy(v482, v236, sizeof(v482));
    sub_244EE1A00();
    if (!v483[0])
      break;
    sub_244EB7974(v296, v483[0], v113, v114);
    sub_244ED3008((int *)v296, (uint64_t)&v297);
    swift_release();
    sub_244EBBA84((uint64_t)v296);
    sub_244EBBA84((uint64_t)v236);
    LODWORD(v146) = v350;
    v144 = v353;
    v145 = v352;
    v143 = v355;
    LODWORD(v138) = v343;
    v136 = v345;
    v141 = v346;
    LODWORD(v142) = v344;
    v140 = v348;
    v139 = v349;
    v130 = v342;
    v128 = v325;
    LODWORD(v137) = v326;
    LODWORD(v125) = v327;
    v135 = v328;
    v124 = v329;
    v133 = v347;
    LODWORD(v134) = v330;
    v132 = v332;
    v122 = v333;
    v123 = v331;
    v131 = v334;
    v121 = v335;
    v129 = v337;
    v119 = v338;
    v120 = v336;
    v118 = v340;
    v126 = v341;
    v127 = v339;
    v51 = v316;
    v117 = v354 & 1;
    v52 = v351 & 1;
    v53 = v317;
    v54 = v318;
    v55 = v319;
    v56 = v320;
    v57 = v321;
    v58 = v322;
    v59 = v323;
    v60 = v324;
    v61 = v308;
    v62 = v309;
    v63 = v310;
    v64 = v311;
    v65 = v312;
    v66 = v313;
    v67 = v314;
    v68 = v315;
    v69 = v299;
    v70 = v300;
    v71 = v301;
    v72 = v302;
    v73 = v303;
    v74 = v304;
    v75 = v305;
    v76 = v306;
    v77 = v307;
    v78 = v297;
  }
  (*(void (**)(char *, uint64_t))(v108 + 8))(v116, v115);
  sub_244EBEF9C((unint64_t *)&qword_25742AF38, (uint64_t (*)(uint64_t))MEMORY[0x24BDE7138], MEMORY[0x24BDE7150]);
  sub_244EE1EC8();
  sub_244EE1EEC();
  result = sub_244EE1EE0();
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (result <= 0x7FFFFFFF)
  {
    LOBYTE(v483[0]) = 0;
    v81 = sub_244ED0664(result);
    v82 = v106;
    v83 = sub_244EBBD9C(v106);
    v85 = v84;
    v87 = v86;
    v146 = v88;
    sub_244EBC110(v82, (uint64_t)v356);
    sub_244EBC7E8(v82, (uint64_t)v357);
    v89 = v107;
    sub_244EE1970();
    v90 = v104;
    v91 = sub_244EE18BC();
    (*(void (**)(char *, uint64_t))(v103 + 8))(v89, v90);
    v92 = nullsub_1(v91);
    sub_244EBD170(v82, (uint64_t)v358);
    sub_244EBD378((uint64_t)v359);
    sub_244EBD4F8(v82, (uint64_t)v360);
    LOBYTE(v483[0]) = BYTE4(v83) & 1;
    LOBYTE(v420) = BYTE4(v85) & 1;
    v361[0] = BYTE4(v87) & 1;
    sub_244ED2D10(v81 | ((HIDWORD(v81) & 1) << 32), v83 | ((HIDWORD(v83) & 1) << 32), v85 | ((unint64_t)(BYTE4(v85) & 1) << 32), v87 | ((unint64_t)(BYTE4(v87) & 1) << 32), v146, (uint64_t)v356, (uint64_t)v357, v92, (uint64_t)v361, (uint64_t)v358, (uint64_t)v359, (uint64_t)v360);
    LODWORD(v146) = v362;
    v479 = v363;
    v160 = v365;
    v127 = v366;
    v128 = v364;
    v159 = v367;
    v126 = v368;
    v158 = v369;
    v125 = v370;
    v124 = v371;
    v157 = v372;
    v117 = v373;
    v156 = v374;
    LODWORD(v107) = v375;
    v155 = v376;
    v154 = v378;
    v102 = v379;
    v103 = v377;
    v93 = v380;
    LODWORD(v89) = v381;
    v153 = v382;
    LODWORD(v85) = v383;
    v152 = v384;
    v94 = v385;
    v151 = v386;
    v95 = v387;
    v150 = v388;
    v149 = v390;
    LODWORD(v87) = v391;
    v148 = v392;
    v129 = v389;
    LODWORD(v130) = v393;
    v122 = v396;
    v123 = v394;
    v131 = v395;
    v132 = v397;
    v134 = v399;
    v133 = v400;
    v120 = v401;
    LODWORD(v121) = v398;
    v135 = v402;
    v136 = v404;
    v118 = v405;
    v119 = v403;
    v138 = v406;
    LODWORD(v137) = v407;
    LODWORD(v116) = v408;
    LODWORD(v139) = v409;
    LODWORD(v115) = v410;
    LODWORD(v112) = v412;
    v140 = v411;
    v141 = v414;
    LODWORD(v108) = v415;
    v142 = v413;
    v143 = v417;
    LODWORD(v104) = v418;
    v144 = v416;
    v145 = v419;
    sub_244EBEE3C((uint64_t)v361);
    sub_244ED3008(v482, (uint64_t)&v420);
    sub_244EBBA84((uint64_t)v236);
    sub_244EBBA84((uint64_t)v361);
    swift_retain();
    sub_244EBEE3C((uint64_t)&v420);
    v96 = v113;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v483[0] = *v96;
    *v96 = 0x8000000000000000;
    sub_244EBAE28(&v420, v82, isUniquelyReferenced_nonNull_native);
    *v96 = v483[0];
    swift_release();
    swift_bridgeObjectRelease();
    LODWORD(v483[1]) = v146;
    LODWORD(v483[2]) = v128;
    LODWORD(v483[3]) = v127;
    LODWORD(v483[4]) = v126;
    v483[5] = v125;
    LODWORD(v483[6]) = v124;
    LODWORD(v483[7]) = v117;
    LODWORD(v483[8]) = (_DWORD)v107;
    v483[9] = v103;
    v483[11] = v102;
    v483[12] = v93;
    LODWORD(v483[13]) = (_DWORD)v89;
    LODWORD(v483[14]) = v85;
    LODWORD(v483[15]) = v94;
    v483[16] = v95;
    LODWORD(v483[19]) = v87;
    v232 = v479;
    v229 = v160;
    v226 = v159;
    v223 = v158;
    v220 = v157;
    v217 = v156;
    v214 = v155;
    v211 = v154;
    v209 = v153;
    v206 = v152;
    v203 = v151;
    v200 = v150;
    v198 = v149;
    v195 = v148;
    v192 = v123 & 1;
    v189 = v122 & 1;
    LOBYTE(v93) = v421;
    v235 = v421;
    v186 = v121 & 1;
    v183 = v120 & 1;
    v180 = v119 & 1;
    v177 = v118 & 1;
    v174 = v116 & 1;
    v171 = v115 & 1;
    v168 = v112 & 1;
    v165 = v108 & 1;
    v162 = v104 & 1;
    LODWORD(v146) = v420;
    LODWORD(v483[0]) = v420;
    BYTE4(v483[0]) = v421;
    *(_WORD *)((char *)v483 + 5) = v233;
    HIBYTE(v483[0]) = v234;
    BYTE4(v483[1]) = v479;
    *(_WORD *)((char *)&v483[1] + 5) = v230;
    HIBYTE(v483[1]) = v231;
    BYTE4(v483[2]) = v160;
    HIBYTE(v483[2]) = v228;
    *(_WORD *)((char *)&v483[2] + 5) = v227;
    BYTE4(v483[3]) = v159;
    HIBYTE(v483[3]) = v225;
    *(_WORD *)((char *)&v483[3] + 5) = v224;
    BYTE4(v483[4]) = v158;
    HIBYTE(v483[4]) = v222;
    *(_WORD *)((char *)&v483[4] + 5) = v221;
    BYTE4(v483[6]) = v157;
    HIBYTE(v483[6]) = v219;
    *(_WORD *)((char *)&v483[6] + 5) = v218;
    BYTE4(v483[7]) = v156;
    HIBYTE(v483[7]) = v216;
    *(_WORD *)((char *)&v483[7] + 5) = v215;
    BYTE4(v483[8]) = v155;
    HIBYTE(v483[8]) = v213;
    *(_WORD *)((char *)&v483[8] + 5) = v212;
    LOBYTE(v483[10]) = v154;
    HIDWORD(v483[10]) = *(_DWORD *)((char *)v210 + 3);
    *(_DWORD *)((char *)&v483[10] + 1) = v210[0];
    BYTE4(v483[13]) = v153;
    HIBYTE(v483[13]) = v208;
    *(_WORD *)((char *)&v483[13] + 5) = v207;
    BYTE4(v483[14]) = v152;
    HIBYTE(v483[14]) = v205;
    *(_WORD *)((char *)&v483[14] + 5) = v204;
    BYTE4(v483[15]) = v151;
    HIBYTE(v483[15]) = v202;
    *(_WORD *)((char *)&v483[15] + 5) = v201;
    LOBYTE(v483[17]) = v150;
    HIDWORD(v483[17]) = *(_DWORD *)((char *)v199 + 3);
    *(_DWORD *)((char *)&v483[17] + 1) = v199[0];
    LODWORD(v483[18]) = v129;
    BYTE4(v483[18]) = v149;
    HIBYTE(v483[18]) = v197;
    *(_WORD *)((char *)&v483[18] + 5) = v196;
    BYTE4(v483[19]) = v148;
    HIBYTE(v483[19]) = v194;
    *(_WORD *)((char *)&v483[19] + 5) = v193;
    LODWORD(v483[20]) = v130;
    BYTE4(v483[20]) = v123 & 1;
    HIBYTE(v483[20]) = v191;
    *(_WORD *)((char *)&v483[20] + 5) = v190;
    LODWORD(v483[21]) = v131;
    BYTE4(v483[21]) = v122 & 1;
    HIBYTE(v483[21]) = v188;
    *(_WORD *)((char *)&v483[21] + 5) = v187;
    LODWORD(v483[22]) = v132;
    BYTE4(v483[22]) = v121 & 1;
    HIBYTE(v483[22]) = v185;
    *(_WORD *)((char *)&v483[22] + 5) = v184;
    v483[23] = v134;
    LODWORD(v483[24]) = v133;
    BYTE4(v483[24]) = v120 & 1;
    HIBYTE(v483[24]) = v182;
    *(_WORD *)((char *)&v483[24] + 5) = v181;
    LODWORD(v483[25]) = v135;
    BYTE4(v483[25]) = v119 & 1;
    HIBYTE(v483[25]) = v179;
    *(_WORD *)((char *)&v483[25] + 5) = v178;
    LODWORD(v483[26]) = v136;
    BYTE4(v483[26]) = v118 & 1;
    HIBYTE(v483[26]) = v176;
    *(_WORD *)((char *)&v483[26] + 5) = v175;
    v483[27] = v138;
    LODWORD(v483[28]) = v137;
    BYTE4(v483[28]) = v116 & 1;
    HIBYTE(v483[28]) = v173;
    *(_WORD *)((char *)&v483[28] + 5) = v172;
    LODWORD(v483[29]) = v139;
    BYTE4(v483[29]) = v115 & 1;
    HIBYTE(v483[29]) = v170;
    *(_WORD *)((char *)&v483[29] + 5) = v169;
    LODWORD(v483[30]) = v140;
    BYTE4(v483[30]) = v112 & 1;
    HIBYTE(v483[30]) = v167;
    *(_WORD *)((char *)&v483[30] + 5) = v166;
    v483[31] = v142;
    LODWORD(v483[32]) = v141;
    BYTE4(v483[32]) = v108 & 1;
    *(_WORD *)((char *)&v483[32] + 5) = v163;
    HIBYTE(v483[32]) = v164;
    v483[33] = v144;
    v483[34] = v143;
    LOBYTE(v483[35]) = v104 & 1;
    *(_DWORD *)((char *)&v483[35] + 1) = v161[0];
    HIDWORD(v483[35]) = *(_DWORD *)((char *)v161 + 3);
    v483[36] = v145;
    swift_retain();
    v98 = v114;
    v99 = swift_isUniquelyReferenced_nonNull_native();
    v147 = *v98;
    *v98 = 0x8000000000000000;
    sub_244EBAE28(v483, v82, v99);
    *v98 = v147;
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v105 + 8))(v110, v111);
    LODWORD(v145) = v473;
    LOBYTE(v147) = v474;
    v143 = v476;
    v144 = v475;
    v479 = v477;
    v142 = v478;
    v132 = v467;
    v140 = v468;
    v141 = v466;
    v129 = v469;
    LODWORD(v139) = v470;
    v138 = v472;
    v137 = v465;
    v136 = v448;
    v126 = v449;
    v127 = v471;
    v135 = v450;
    LODWORD(v134) = v452;
    v124 = v453;
    LODWORD(v125) = v451;
    v133 = v454;
    v131 = v456;
    v122 = v457;
    v123 = v455;
    v130 = v458;
    v128 = v459;
    LODWORD(v121) = v460;
    v22 = v439;
    v39 = v438 & 1;
    v37 = v436 & 1;
    v35 = v434 & 1;
    v33 = v432 & 1;
    v49 = v93;
    v117 = v477 & 1;
    v118 = v474 & 1;
    v21 = v462;
    v119 = v463;
    v120 = v461;
    v23 = v464;
    v24 = v440;
    v25 = v441;
    v26 = v442;
    v27 = v443;
    v28 = v444;
    v29 = v445;
    v30 = v446;
    v31 = v447;
    result = v431;
    v34 = v433;
    v36 = v435;
    v38 = v437;
    v40 = v422;
    v41 = v423;
    v42 = v424;
    v43 = v425;
    v44 = v426;
    v45 = v427;
    v46 = v428;
    v47 = v429;
    v48 = v430;
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

unint64_t sub_244EB8DCC(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t i;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  unint64_t v12;

  v1 = a1;
  if ((a1 & 0x8000000000000000) != 0 || (a1 & 0x4000000000000000) != 0)
    goto LABEL_39;
  v2 = a1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v12 = v1 & 0xFFFFFFFFFFFFFF8;
LABEL_4:
  if ((v2 & 0x4000000000000000) == 0)
  {
    v3 = *(_QWORD *)(v2 + 16);
    swift_bridgeObjectRelease();
    v4 = (unint64_t)v3 >> 1;
    goto LABEL_6;
  }
  while (1)
  {
    swift_retain();
    v3 = sub_244EE209C();
    swift_bridgeObjectRelease();
    swift_release();
    v11 = v3 >= 0 ? v3 : v3 + 1;
    if (v3 < -1)
      __break(1u);
    v4 = v11 >> 1;
LABEL_6:
    if ((unint64_t)(v3 + 1) < 3)
      return v2;
    for (i = 0; ; ++i)
    {
      v6 = i + 1;
      v1 = v3 - (i + 1);
      if (__OFSUB__(v3, i + 1))
        break;
      if (i != v1)
      {
        if ((v12 & 0xC000000000000001) != 0)
        {
          v8 = MEMORY[0x249529C58](i, v12);
          v9 = MEMORY[0x249529C58](v3 - (i + 1), v12);
        }
        else
        {
          if ((i & 0x8000000000000000) != 0)
            goto LABEL_33;
          v7 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (i >= v7)
            goto LABEL_34;
          v8 = *(_QWORD *)(v12 + 8 * i + 32);
          swift_retain();
          if ((v1 & 0x8000000000000000) != 0)
            goto LABEL_35;
          if (v1 >= v7)
            goto LABEL_37;
          v9 = *(_QWORD *)(v12 + 32 + 8 * v1);
          swift_retain();
        }
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || (v12 & 0x8000000000000000) != 0
          || (v12 & 0x4000000000000000) != 0)
        {
          sub_244EB962C(v12);
        }
        swift_release();
        *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 8 * i + 0x20) = v9;
        sub_244EE1E8C();
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || (v12 & 0x8000000000000000) != 0
          || (v12 & 0x4000000000000000) != 0)
        {
          sub_244EB962C(v12);
        }
        if ((v1 & 0x8000000000000000) != 0)
          goto LABEL_36;
        if (v1 >= *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_38;
        swift_release();
        *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 8 * v1 + 0x20) = v8;
        sub_244EE1E8C();
      }
      if (v4 == v6)
        return v12;
    }
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    v2 = (uint64_t)sub_244EBBB14(v1);
    v12 = v2;
    if ((v2 & 0x8000000000000000) == 0)
      goto LABEL_4;
  }
}

double sub_244EB8FE8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;
  __int128 v4;
  _OWORD v5[2];
  uint64_t v6;

  sub_244EBC110(a1, (uint64_t)v5);
  result = *(double *)v5;
  v4 = v5[1];
  *(_OWORD *)a2 = v5[0];
  *(_OWORD *)(a2 + 16) = v4;
  *(_QWORD *)(a2 + 32) = v6;
  return result;
}

_QWORD *sub_244EB9028@<X0>(_DWORD *a1@<X8>)
{
  return sub_244EB9144(MEMORY[0x24BDE6FA8], a1);
}

_QWORD *sub_244EB9034@<X0>(_DWORD *a1@<X8>)
{
  return sub_244EB9144(MEMORY[0x24BDE6F90], a1);
}

_QWORD *sub_244EB9040@<X0>(_DWORD *a1@<X8>)
{
  return sub_244EB9144(MEMORY[0x24BDE6F60], a1);
}

_QWORD *sub_244EB904C@<X0>(_DWORD *a1@<X8>)
{
  return sub_244EB9144((_QWORD *(*)(uint64_t *__return_ptr, uint64_t))sub_244EC3210, a1);
}

double sub_244EB9058@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v3;
  double result;
  _OWORD v5[2];
  __int128 v6;
  uint64_t v7;

  sub_244EBC7E8(a1, (uint64_t)v5);
  v3 = v5[1];
  *(_OWORD *)a2 = v5[0];
  *(_OWORD *)(a2 + 16) = v3;
  result = *(double *)&v6;
  *(_OWORD *)(a2 + 32) = v6;
  *(_QWORD *)(a2 + 48) = v7;
  return result;
}

double sub_244EB90A0@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  _OWORD v4[2];
  char v5;

  sub_244EBD378((uint64_t)v4);
  result = *(double *)v4;
  v3 = v4[1];
  *(_OWORD *)a1 = v4[0];
  *(_OWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 32) = v5;
  return result;
}

__n128 sub_244EB90E0@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v3;
  __n128 result;
  _OWORD v5[3];
  _BYTE v6[21];

  sub_244EBD4F8(a1, (uint64_t)v5);
  v3 = *(_OWORD *)v6;
  *(_OWORD *)(a2 + 32) = v5[2];
  *(_OWORD *)(a2 + 48) = v3;
  *(_QWORD *)(a2 + 61) = *(_QWORD *)&v6[13];
  result = (__n128)v5[1];
  *(_OWORD *)a2 = v5[0];
  *(__n128 *)(a2 + 16) = result;
  return result;
}

_QWORD *sub_244EB912C@<X0>(_DWORD *a1@<X8>)
{
  return sub_244EB9144(MEMORY[0x24BDE6FA0], a1);
}

_QWORD *sub_244EB9138@<X0>(_DWORD *a1@<X8>)
{
  return sub_244EB9144(MEMORY[0x24BDE6FC0], a1);
}

_QWORD *sub_244EB9144@<X0>(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t)@<X3>, _DWORD *a2@<X8>)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE60);
  result = a1(&v6, v4);
  *a2 = v6;
  return result;
}

uint64_t sub_244EB9194()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE60);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EE1970();
  v4 = sub_244EE18BC();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return nullsub_1(v4);
}

uint64_t sub_244EB9228(uint64_t a1)
{
  unint64_t v1;

  v1 = sub_244EBBD9C(a1);
  return v1 | ((HIDWORD(v1) & 1) << 32);
}

double sub_244EB927C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;
  __int128 v4;
  _OWORD v5[2];
  uint64_t v6;

  sub_244EBD170(a1, (uint64_t)v5);
  result = *(double *)v5;
  v4 = v5[1];
  *(_OWORD *)a2 = v5[0];
  *(_OWORD *)(a2 + 16) = v4;
  *(_QWORD *)(a2 + 32) = v6;
  return result;
}

uint64_t sub_244EB92BC(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  unint64_t v4;

  v1 = sub_244ECDDF8(a1);
  if (v1 >> 62)
  {
    v2 = sub_244EE209C();
    result = swift_bridgeObjectRelease();
    if (v2 < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
      goto LABEL_7;
    }
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRelease();
  }
  if (v2 <= 0x7FFFFFFF)
  {
    v4 = sub_244ED0664(v2);
    return v4 | ((HIDWORD(v4) & 1) << 32);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_244EB935C(uint64_t result, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  unint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  int v16;
  char v17;
  _BYTE __dst[296];
  _BYTE __src[296];
  _DWORD v20[74];

  v3 = *a2;
  if (*(_QWORD *)(*a2 + 16))
  {
    v6 = result;
    v7 = swift_retain();
    v8 = sub_244EB9538(v7);
    if ((v9 & 1) == 0)
      return swift_release();
    memcpy(__dst, (const void *)(*(_QWORD *)(v3 + 56) + 296 * v8), sizeof(__dst));
    sub_244EBEE3C((uint64_t)__dst);
    swift_release();
    memcpy(__src, __dst, sizeof(__src));
    sub_244EBEE3C((uint64_t)__dst);
    sub_244ED6324();
    swift_beginAccess();
    memcpy(v20, __dst, sizeof(v20));
    swift_retain();
    swift_getAtKeyPath();
    swift_release();
    sub_244EBBA84((uint64_t)__dst);
    result = swift_beginAccess();
    if (v17)
      v10 = 0;
    else
      v10 = v16;
    v11 = __OFADD__(v10, a3);
    v12 = v10 + a3;
    if (v11)
    {
      __break(1u);
    }
    else
    {
      v13 = v12 & ~(v12 >> 63);
      if (!(v13 >> 31))
      {
        v20[0] = v13;
        LOBYTE(v20[1]) = 0;
        swift_retain();
        swift_setAtWritableKeyPath();
        swift_release();
        memcpy(v20, __src, sizeof(v20));
        swift_retain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v15 = *a2;
        *a2 = 0x8000000000000000;
        sub_244EBAE28(v20, v6, isUniquelyReferenced_nonNull_native);
        *a2 = v15;
        swift_release();
        return swift_bridgeObjectRelease();
      }
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_244EB9538(uint64_t a1)
{
  uint64_t v2;

  sub_244EE1A6C();
  sub_244EBEF9C(&qword_25742AF00, (uint64_t (*)(uint64_t))MEMORY[0x24BDE71E8], MEMORY[0x24BDE71F8]);
  v2 = sub_244EE1DC0();
  return sub_244EB9694(a1, v2);
}

unint64_t sub_244EB95C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_244EE2168();
  sub_244EE1E20();
  v4 = sub_244EE2180();
  return sub_244EB9774(a1, a2, v4);
}

void sub_244EB962C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_244EE209C();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x249529C64);
}

unint64_t sub_244EB9694(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    sub_244EE1A6C();
    sub_244EBEF9C(&qword_25742AF10, (uint64_t (*)(uint64_t))MEMORY[0x24BDE71E8], MEMORY[0x24BDE7200]);
    do
    {
      if ((sub_244EE1DD8() & 1) != 0)
        break;
      v4 = (v4 + 1) & v5;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_244EB9774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_244EE2114() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_244EE2114() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_244EB9854(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  _QWORD *v36;
  uint64_t v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;
  char v51;
  char v52;
  char v53;
  char v54;
  uint64_t v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;
  char v61;
  char v62;
  int v63;
  uint64_t v64;
  int v65;
  int v66;
  int v67;
  uint64_t v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  int v77;
  int v78;
  uint64_t v79;
  int v80;
  int v81;
  int v82;
  uint64_t v83;
  int v84;
  int v85;
  int v86;
  uint64_t v87;
  int v88;
  int v89;
  int v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  int64_t v96;
  _QWORD __dst[38];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AEF8);
  v38 = a2;
  v6 = sub_244EE20B4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = (_QWORD *)(v5 + 64);
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  v37 = v5;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35)
      break;
    v19 = v36;
    v20 = v36[v18];
    ++v13;
    if (!v20)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v35)
        goto LABEL_34;
      v20 = v36[v13];
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          if ((v38 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v20 = v36[v21];
        if (!v20)
        {
          while (1)
          {
            v13 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_43;
            if (v13 >= v35)
              goto LABEL_34;
            v20 = v36[v13];
            ++v21;
            if (v20)
              goto LABEL_21;
          }
        }
        v13 = v21;
      }
    }
LABEL_21:
    v10 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    v96 = v13;
    v22 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v17);
    if ((v38 & 1) != 0)
    {
      v23 = *(_QWORD *)(v5 + 56) + 296 * v17;
      v66 = *(_DWORD *)v23;
      v80 = *(_DWORD *)(v23 + 8);
      v61 = *(_BYTE *)(v23 + 12);
      v78 = *(_DWORD *)(v23 + 16);
      v72 = *(_DWORD *)(v23 + 24);
      v53 = *(_BYTE *)(v23 + 4);
      v54 = *(_BYTE *)(v23 + 28);
      v69 = *(_DWORD *)(v23 + 32);
      v49 = *(_BYTE *)(v23 + 36);
      v64 = *(_QWORD *)(v23 + 40);
      v84 = *(_DWORD *)(v23 + 48);
      v82 = *(_DWORD *)(v23 + 56);
      v58 = *(_BYTE *)(v23 + 20);
      v59 = *(_BYTE *)(v23 + 60);
      v81 = *(_DWORD *)(v23 + 64);
      v79 = *(_QWORD *)(v23 + 72);
      v52 = *(_BYTE *)(v23 + 80);
      v76 = *(_QWORD *)(v23 + 88);
      v74 = *(_QWORD *)(v23 + 96);
      v89 = *(_DWORD *)(v23 + 104);
      v39 = *(_BYTE *)(v23 + 52);
      v40 = *(_BYTE *)(v23 + 108);
      v86 = *(_DWORD *)(v23 + 112);
      v60 = *(_BYTE *)(v23 + 116);
      v85 = *(_DWORD *)(v23 + 120);
      v56 = *(_BYTE *)(v23 + 68);
      v57 = *(_BYTE *)(v23 + 124);
      v41 = *(_BYTE *)(v23 + 260);
      v62 = *(_BYTE *)(v23 + 280);
      v55 = *(_QWORD *)(v23 + 128);
      v24 = *(_BYTE *)(v23 + 136);
      v77 = *(_DWORD *)(v23 + 144);
      v75 = *(_DWORD *)(v23 + 152);
      v46 = *(_BYTE *)(v23 + 156);
      v47 = *(_BYTE *)(v23 + 148);
      v73 = *(_DWORD *)(v23 + 160);
      v44 = *(_BYTE *)(v23 + 172);
      v45 = *(_BYTE *)(v23 + 164);
      v70 = *(_DWORD *)(v23 + 176);
      v71 = *(_DWORD *)(v23 + 168);
      v68 = *(_QWORD *)(v23 + 184);
      v67 = *(_DWORD *)(v23 + 192);
      v42 = *(_BYTE *)(v23 + 196);
      v43 = *(_BYTE *)(v23 + 180);
      v65 = *(_DWORD *)(v23 + 200);
      v25 = *(_BYTE *)(v23 + 204);
      v63 = *(_DWORD *)(v23 + 208);
      v26 = *(_BYTE *)(v23 + 212);
      v83 = *(_QWORD *)(v23 + 216);
      v91 = *(_DWORD *)(v23 + 224);
      v90 = *(_DWORD *)(v23 + 232);
      v50 = *(_BYTE *)(v23 + 236);
      v51 = *(_BYTE *)(v23 + 228);
      v88 = *(_DWORD *)(v23 + 240);
      v48 = *(_BYTE *)(v23 + 244);
      v87 = *(_QWORD *)(v23 + 248);
      v95 = *(_DWORD *)(v23 + 256);
      v93 = *(_QWORD *)(v23 + 272);
      v94 = *(_QWORD *)(v23 + 264);
      v92 = *(_QWORD *)(v23 + 288);
    }
    else
    {
      memcpy(__dst, (const void *)(*(_QWORD *)(v5 + 56) + 296 * v17), 0x128uLL);
      v95 = __dst[32];
      v41 = BYTE4(__dst[32]);
      v93 = __dst[34];
      v94 = __dst[33];
      v62 = __dst[35];
      v92 = __dst[36];
      v91 = __dst[28];
      v90 = __dst[29];
      v50 = BYTE4(__dst[29]);
      v51 = BYTE4(__dst[28]);
      v88 = __dst[30];
      v87 = __dst[31];
      v83 = __dst[27];
      v77 = __dst[18];
      v47 = BYTE4(__dst[18]);
      v48 = BYTE4(__dst[30]);
      v75 = __dst[19];
      v73 = __dst[20];
      v45 = BYTE4(__dst[20]);
      v46 = BYTE4(__dst[19]);
      v70 = __dst[22];
      v71 = __dst[21];
      v43 = BYTE4(__dst[22]);
      v44 = BYTE4(__dst[21]);
      v68 = __dst[23];
      v67 = __dst[24];
      v42 = BYTE4(__dst[24]);
      v65 = __dst[25];
      v25 = BYTE4(__dst[25]);
      v63 = __dst[26];
      v26 = BYTE4(__dst[26]);
      v89 = __dst[13];
      v86 = __dst[14];
      v85 = __dst[15];
      v55 = __dst[16];
      v24 = __dst[17];
      v84 = __dst[6];
      v39 = BYTE4(__dst[6]);
      v40 = BYTE4(__dst[13]);
      v82 = __dst[7];
      v59 = BYTE4(__dst[7]);
      v60 = BYTE4(__dst[14]);
      v56 = BYTE4(__dst[8]);
      v57 = BYTE4(__dst[15]);
      v79 = __dst[9];
      v52 = __dst[10];
      v76 = __dst[11];
      v74 = __dst[12];
      v80 = __dst[1];
      v81 = __dst[8];
      v61 = BYTE4(__dst[1]);
      v78 = __dst[2];
      v58 = BYTE4(__dst[2]);
      v72 = __dst[3];
      v69 = __dst[4];
      v49 = BYTE4(__dst[4]);
      v64 = __dst[5];
      v66 = __dst[0];
      v53 = BYTE4(__dst[0]);
      v54 = BYTE4(__dst[3]);
      swift_retain();
      sub_244EBEE3C((uint64_t)__dst);
    }
    __dst[0] = v22;
    sub_244EE1A6C();
    sub_244EBEF9C(&qword_25742AF00, (uint64_t (*)(uint64_t))MEMORY[0x24BDE71E8], MEMORY[0x24BDE71F8]);
    result = sub_244EE1DC0();
    v27 = -1 << *(_BYTE *)(v7 + 32);
    v28 = result & ~v27;
    v29 = v28 >> 6;
    if (((-1 << v28) & ~*(_QWORD *)(v11 + 8 * (v28 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v32 = v29 == v31;
        if (v29 == v31)
          v29 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v11 + 8 * v29);
      }
      while (v33 == -1);
      v14 = __clz(__rbit64(~v33)) + (v29 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v14) = v22;
    v15 = *(_QWORD *)(v7 + 56) + 296 * v14;
    *(_DWORD *)v15 = v66;
    *(_BYTE *)(v15 + 4) = v53;
    *(_DWORD *)(v15 + 8) = v80;
    *(_BYTE *)(v15 + 12) = v61;
    *(_DWORD *)(v15 + 16) = v78;
    *(_BYTE *)(v15 + 20) = v58;
    *(_DWORD *)(v15 + 24) = v72;
    *(_BYTE *)(v15 + 28) = v54;
    *(_DWORD *)(v15 + 32) = v69;
    *(_BYTE *)(v15 + 36) = v49;
    *(_QWORD *)(v15 + 40) = v64;
    *(_DWORD *)(v15 + 48) = v84;
    *(_BYTE *)(v15 + 52) = v39;
    *(_DWORD *)(v15 + 56) = v82;
    *(_BYTE *)(v15 + 60) = v59;
    *(_DWORD *)(v15 + 64) = v81;
    *(_BYTE *)(v15 + 68) = v56;
    *(_QWORD *)(v15 + 72) = v79;
    *(_BYTE *)(v15 + 80) = v52;
    *(_QWORD *)(v15 + 88) = v76;
    *(_QWORD *)(v15 + 96) = v74;
    *(_DWORD *)(v15 + 104) = v89;
    *(_BYTE *)(v15 + 108) = v40;
    *(_DWORD *)(v15 + 112) = v86;
    *(_BYTE *)(v15 + 116) = v60;
    *(_DWORD *)(v15 + 120) = v85;
    *(_BYTE *)(v15 + 124) = v57;
    *(_QWORD *)(v15 + 128) = v55;
    *(_BYTE *)(v15 + 136) = v24;
    *(_DWORD *)(v15 + 144) = v77;
    *(_BYTE *)(v15 + 148) = v47;
    *(_DWORD *)(v15 + 152) = v75;
    *(_BYTE *)(v15 + 156) = v46;
    *(_DWORD *)(v15 + 160) = v73;
    *(_BYTE *)(v15 + 164) = v45;
    *(_DWORD *)(v15 + 168) = v71;
    *(_BYTE *)(v15 + 172) = v44;
    *(_DWORD *)(v15 + 176) = v70;
    *(_BYTE *)(v15 + 180) = v43;
    *(_QWORD *)(v15 + 184) = v68;
    *(_DWORD *)(v15 + 192) = v67;
    *(_BYTE *)(v15 + 196) = v42;
    *(_DWORD *)(v15 + 200) = v65;
    *(_BYTE *)(v15 + 204) = v25;
    *(_DWORD *)(v15 + 208) = v63;
    *(_BYTE *)(v15 + 212) = v26;
    *(_QWORD *)(v15 + 216) = v83;
    *(_DWORD *)(v15 + 224) = v91;
    *(_BYTE *)(v15 + 228) = v51;
    *(_DWORD *)(v15 + 232) = v90;
    *(_BYTE *)(v15 + 236) = v50;
    *(_DWORD *)(v15 + 240) = v88;
    *(_BYTE *)(v15 + 244) = v48;
    *(_QWORD *)(v15 + 248) = v87;
    *(_DWORD *)(v15 + 256) = v95;
    *(_BYTE *)(v15 + 260) = v41;
    *(_QWORD *)(v15 + 264) = v94;
    *(_QWORD *)(v15 + 272) = v93;
    *(_BYTE *)(v15 + 280) = v62;
    *(_QWORD *)(v15 + 288) = v92;
    ++*(_QWORD *)(v7 + 16);
    v5 = v37;
    v13 = v96;
  }
  swift_release();
  v19 = v36;
  if ((v38 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v19, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_244EBA1AC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  char v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AF08);
  v35 = a2;
  v6 = sub_244EE20B4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v34 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v33 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v33)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v34 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v33)
        goto LABEL_33;
      v23 = *(_QWORD *)(v34 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v33)
        {
LABEL_33:
          swift_release();
          if ((v35 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v34 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v33)
              goto LABEL_33;
            v23 = *(_QWORD *)(v34 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = 8 * v20;
    v30 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v29);
    v31 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v29);
    if ((v35 & 1) == 0)
      swift_retain();
    sub_244EE1A6C();
    sub_244EBEF9C(&qword_25742AF00, (uint64_t (*)(uint64_t))MEMORY[0x24BDE71E8], MEMORY[0x24BDE71F8]);
    result = sub_244EE1DC0();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 8 * v17;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18) = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v31;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v35 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v32 = 1 << *(_BYTE *)(v5 + 32);
  if (v32 >= 64)
    bzero(v22, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v32;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_244EBA4D8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AED8);
  v37 = a2;
  v6 = sub_244EE20B4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_DWORD *)(*(_QWORD *)(v5 + 56) + 4 * v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_244EE2168();
    sub_244EE1E20();
    result = sub_244EE2180();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_DWORD *)(*(_QWORD *)(v7 + 56) + 4 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_244EBA7E0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  _QWORD *v38;
  char v39;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE90);
  v39 = a2;
  v6 = sub_244EE20B4();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v38 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v37 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v21 = v20 | (v13 << 6);
      }
      else
      {
        v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v37)
          goto LABEL_33;
        v23 = v38[v22];
        ++v13;
        if (!v23)
        {
          v13 = v22 + 1;
          if (v22 + 1 >= v37)
            goto LABEL_33;
          v23 = v38[v13];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v37)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v39 & 1) != 0)
              {
                v36 = 1 << *(_BYTE *)(v5 + 32);
                if (v36 >= 64)
                  bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v38 = -1 << v36;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v38[v24];
            if (!v23)
            {
              while (1)
              {
                v13 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_40;
                if (v13 >= v37)
                  goto LABEL_33;
                v23 = v38[v13];
                ++v24;
                if (v23)
                  goto LABEL_30;
              }
            }
            v13 = v24;
          }
        }
LABEL_30:
        v10 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
      v31 = *v29;
      v30 = v29[1];
      v32 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 24 * v21);
      v34 = *v32;
      v33 = v32[1];
      v35 = v32[2];
      if ((v39 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_244EE2168();
      sub_244EE1E20();
      result = sub_244EE2180();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v27 = v16 == v26;
          if (v16 == v26)
            v16 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v11 + 8 * v16);
        }
        while (v28 == -1);
        v17 = __clz(__rbit64(~v28)) + (v16 << 6);
      }
      *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
      *v18 = v31;
      v18[1] = v30;
      v19 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 24 * v17);
      *v19 = v34;
      v19[1] = v33;
      v19[2] = v35;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_244EBAB04(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int64_t v37;
  _QWORD *v38;
  uint64_t i;
  char v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE88);
  v40 = a2;
  v6 = sub_244EE20B4();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v38 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v37 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    for (i = v5; ; v5 = i)
    {
      if (v10)
      {
        v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v21 = v20 | (v13 << 6);
      }
      else
      {
        v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v37)
          goto LABEL_33;
        v23 = v38[v22];
        ++v13;
        if (!v23)
        {
          v13 = v22 + 1;
          if (v22 + 1 >= v37)
            goto LABEL_33;
          v23 = v38[v13];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v37)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v40 & 1) != 0)
              {
                v36 = 1 << *(_BYTE *)(v5 + 32);
                if (v36 >= 64)
                  bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v38 = -1 << v36;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v38[v24];
            if (!v23)
            {
              while (1)
              {
                v13 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_40;
                if (v13 >= v37)
                  goto LABEL_33;
                v23 = v38[v13];
                ++v24;
                if (v23)
                  goto LABEL_30;
              }
            }
            v13 = v24;
          }
        }
LABEL_30:
        v10 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
      v31 = *v29;
      v30 = v29[1];
      v32 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 24 * v21);
      v33 = *v32;
      v34 = v32[1];
      v35 = v32[2];
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      sub_244EE2168();
      sub_244EE1E20();
      result = sub_244EE2180();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v27 = v16 == v26;
          if (v16 == v26)
            v16 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v11 + 8 * v16);
        }
        while (v28 == -1);
        v17 = __clz(__rbit64(~v28)) + (v16 << 6);
      }
      *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
      *v18 = v31;
      v18[1] = v30;
      v19 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 24 * v17);
      *v19 = v33;
      v19[1] = v34;
      v19[2] = v35;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_244EBAE28(const void *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t result;
  unint64_t v18;
  char v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v8 = *v3;
  v10 = sub_244EB9538(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_244EBB0C4();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      return sub_244EBEECC((uint64_t)a1, v16[7] + 296 * v10);
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_QWORD *)(v16[6] + 8 * v10) = a2;
    memcpy((void *)(v16[7] + 296 * v10), a1, 0x128uLL);
    v20 = v16[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return swift_retain();
    }
    goto LABEL_14;
  }
  sub_244EB9854(v13, a3 & 1);
  v18 = sub_244EB9538(a2);
  if ((v14 & 1) == (v19 & 1))
  {
    v10 = v18;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      return sub_244EBEECC((uint64_t)a1, v16[7] + 296 * v10);
    goto LABEL_11;
  }
LABEL_15:
  sub_244EE1A6C();
  result = sub_244EE2144();
  __break(1u);
  return result;
}

uint64_t sub_244EBAF80(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v4 = v3;
  v8 = *v3;
  v10 = sub_244EB9538(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_244EBB2B4();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      *(_QWORD *)(v16[7] + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v18 = 8 * v10;
    *(_QWORD *)(v16[6] + v18) = a2;
    *(_QWORD *)(v16[7] + v18) = a1;
    v19 = v16[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return swift_retain();
    }
    goto LABEL_14;
  }
  sub_244EBA1AC(result, a3 & 1);
  result = sub_244EB9538(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_244EE1A6C();
  result = sub_244EE2144();
  __break(1u);
  return result;
}

void *sub_244EBB0C4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  _BYTE __dst[304];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AEF8);
  v2 = *v0;
  v3 = sub_244EE20A8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v22 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 296 * v15;
    memcpy(__dst, (const void *)(*(_QWORD *)(v2 + 56) + 296 * v15), 0x128uLL);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    memcpy((void *)(*(_QWORD *)(v4 + 56) + v18), __dst, 0x128uLL);
    swift_retain();
    result = (void *)sub_244EBEE3C((uint64_t)__dst);
  }
  v21 = v19 + 2;
  if (v21 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v22;
    goto LABEL_28;
  }
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_244EBB2B4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AF08);
  v2 = *v0;
  v3 = sub_244EE20A8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_retain();
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_244EBB454()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AED8);
  v2 = *v0;
  v3 = sub_244EE20A8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 4 * v15;
    LODWORD(v17) = *(_DWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    *(_DWORD *)(*(_QWORD *)(v4 + 56) + v20) = (_DWORD)v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_244EBB600()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE90);
  v2 = *v0;
  v3 = sub_244EE20A8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v27 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v13)
      goto LABEL_26;
    v28 = *(_QWORD *)(v6 + 8 * v27);
    ++v9;
    if (!v28)
    {
      v9 = v27 + 1;
      if (v27 + 1 >= v13)
        goto LABEL_26;
      v28 = *(_QWORD *)(v6 + 8 * v9);
      if (!v28)
        break;
    }
LABEL_25:
    v12 = (v28 - 1) & v28;
    v15 = __clz(__rbit64(v28)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 24 * v15;
    v21 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = *v21;
    v23 = v21[1];
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    v25 = v21[2];
    *v24 = v19;
    v24[1] = v18;
    v26 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v20);
    *v26 = v22;
    v26[1] = v23;
    v26[2] = v25;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v29 = v27 + 2;
  if (v29 >= v13)
    goto LABEL_26;
  v28 = *(_QWORD *)(v6 + 8 * v29);
  if (v28)
  {
    v9 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v28 = *(_QWORD *)(v6 + 8 * v9);
    ++v29;
    if (v28)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_244EBB7C8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE88);
  v2 = *v0;
  v3 = sub_244EE20A8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v27 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v13)
      goto LABEL_26;
    v28 = *(_QWORD *)(v6 + 8 * v27);
    ++v9;
    if (!v28)
    {
      v9 = v27 + 1;
      if (v27 + 1 >= v13)
        goto LABEL_26;
      v28 = *(_QWORD *)(v6 + 8 * v9);
      if (!v28)
        break;
    }
LABEL_25:
    v12 = (v28 - 1) & v28;
    v15 = __clz(__rbit64(v28)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 24 * v15;
    v21 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = *v21;
    v23 = v21[1];
    v24 = v21[2];
    v25 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v25 = v19;
    v25[1] = v18;
    v26 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v20);
    *v26 = v22;
    v26[1] = v23;
    v26[2] = v24;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v29 = v27 + 2;
  if (v29 >= v13)
    goto LABEL_26;
  v28 = *(_QWORD *)(v6 + 8 * v29);
  if (v28)
  {
    v9 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v28 = *(_QWORD *)(v6 + 8 * v9);
    ++v29;
    if (v28)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void (*sub_244EBB990(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_244EBBA10(v6, a2, a3);
  return sub_244EBB9E4;
}

void sub_244EBB9E4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_244EBBA10(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = MEMORY[0x249529C58](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_retain();
LABEL_5:
    *v3 = v4;
    return sub_244EBBA7C;
  }
  __break(1u);
  return result;
}

uint64_t sub_244EBBA7C()
{
  return swift_release();
}

uint64_t sub_244EBBA84(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *sub_244EBBB14(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742AF18);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_244EBBC08((uint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = sub_244EE209C();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_244EBBC08(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13[4])();

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_244EE209C();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_244EE209C();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_244EBEF0C();
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_25742AF20);
            v10 = sub_244EBB990(v13, i, a3);
            v12 = *v11;
            swift_retain();
            ((void (*)(uint64_t (**)(), _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_244EE1A6C();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_244EBBD9C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  char v13;
  int v14;
  char v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t);
  unint64_t result;
  char v20;
  char *v21;
  uint64_t v22;
  uint64_t inited;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  char *v27;
  uint64_t v28;
  char v29;
  int v30;
  char v31;
  __int128 v32;
  uint64_t KeyPath;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  unsigned __int8 v40;
  int v41;
  char v42;
  int v43;
  char v44;
  uint64_t v45;

  v2 = sub_244EE19E8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE60);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v27 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - v10;
  sub_244ECFD54();
  v41 = v12;
  v42 = v13 & 1;
  v43 = v14;
  v44 = v15 & 1;
  v45 = v16;
  sub_244EE1970();
  sub_244EC3590();
  v26 = *(void (**)(char *, uint64_t))(v7 + 8);
  v26(v11, v6);
  v39 = v30;
  v40 = 0;
  v32 = xmmword_244EE25F0;
  KeyPath = swift_getKeyPath();
  v34 = sub_244EE1820();
  v35 = MEMORY[0x24BDE66A0];
  v36 = swift_getKeyPath();
  v37 = sub_244EE17FC();
  v38 = MEMORY[0x24BDE65A8];
  swift_retain();
  v28 = a1;
  sub_244EE197C();
  v17 = sub_244EE19D0();
  v18 = *(void (**)(char *, uint64_t))(v3 + 8);
  v18(v5, v2);
  v30 = v17 & 1;
  v31 = 0;
  swift_setAtWritableKeyPath();
  result = swift_release();
  if ((unint64_t)v32 < 2)
  {
    __break(1u);
  }
  else
  {
    swift_retain();
    sub_244EE197C();
    v20 = sub_244EE19D0();
    v18(v5, v2);
    v30 = v20 & 1;
    v31 = 0;
    swift_setAtWritableKeyPath();
    swift_release();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE98);
    swift_arrayDestroy();
    v21 = v27;
    sub_244EE1970();
    v22 = sub_244EE191C();
    v26(v21, v6);
    if ((v22 & 0x100000000) != 0)
    {
      v24 = MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742AEA0);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_244EE2600;
      *(_QWORD *)(inited + 32) = v28;
      *(_DWORD *)(inited + 40) = v22;
      swift_retain();
      v24 = inited;
    }
    sub_244EB757C(v24);
    swift_bridgeObjectRelease();
    v25 = v39;
    LOBYTE(v39) = v40;
    LOBYTE(v30) = v42;
    v29 = v44;
    return v25 | ((unint64_t)v40 << 32);
  }
  return result;
}

uint64_t sub_244EBC110@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t inited;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  char v9;
  int v10;
  char v11;
  int v12;
  char v13;
  int v14;
  char v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char v21;
  int v22;
  __int128 v23;
  _QWORD v24[8];
  int v25;
  char v26;
  int v27;
  char v28;
  int v29;
  char v30;
  int v31;
  char v32;

  v17 = a1;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE60);
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EBEDF4();
  swift_retain();
  sub_244EE1964();
  sub_244ECFD3C((uint64_t)&v25);
  v23 = xmmword_244EE2610;
  v16 = v24;
  v24[0] = swift_getKeyPath();
  v24[1] = swift_getKeyPath();
  v24[2] = swift_getKeyPath();
  v24[3] = swift_getKeyPath();
  v24[4] = swift_getKeyPath();
  v24[5] = swift_getKeyPath();
  v24[6] = swift_getKeyPath();
  v24[7] = swift_getKeyPath();
  swift_retain();
  swift_retain();
  swift_getAtKeyPath();
  v20 = v22;
  v21 = 0;
  swift_setAtWritableKeyPath();
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  swift_getAtKeyPath();
  v20 = v22;
  v21 = 0;
  swift_setAtWritableKeyPath();
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  swift_getAtKeyPath();
  v20 = v22;
  v21 = 0;
  swift_setAtWritableKeyPath();
  swift_release();
  swift_release();
  swift_retain();
  swift_retain();
  swift_getAtKeyPath();
  v20 = v22;
  v21 = 0;
  swift_setAtWritableKeyPath();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AEE0);
  swift_arrayDestroy();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AEE8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_244EE2600;
  *(_QWORD *)(inited + 32) = v17;
  swift_retain();
  v6 = v18;
  *(_QWORD *)(inited + 40) = sub_244EC2C8C();
  v7 = sub_244EB7678(inited, &qword_25742AEF0);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v6);
  result = swift_bridgeObjectRelease();
  v9 = v26;
  v10 = v27;
  v11 = v28;
  v12 = v29;
  v13 = v30;
  v14 = v31;
  v15 = v32;
  *(_DWORD *)a2 = v25;
  *(_BYTE *)(a2 + 4) = v9;
  *(_DWORD *)(a2 + 8) = v10;
  *(_BYTE *)(a2 + 12) = v11;
  *(_DWORD *)(a2 + 16) = v12;
  *(_BYTE *)(a2 + 20) = v13;
  *(_DWORD *)(a2 + 24) = v14;
  *(_BYTE *)(a2 + 28) = v15;
  *(_QWORD *)(a2 + 32) = v7;
  return result;
}

uint64_t sub_244EBC4A0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t *v22;
  char isUniquelyReferenced_nonNull_native;
  char v24;
  unint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  char v29;
  unint64_t v30;
  char v31;
  uint64_t *v32;
  uint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t result;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v41;
  int64_t v42;

  v5 = 1 << *(_BYTE *)(a2 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a2 + 64);
  v38 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  v8 = 0;
  v39 = a3;
  while (1)
  {
    if (v7)
    {
      v41 = (v7 - 1) & v7;
      v42 = v8;
      v9 = __clz(__rbit64(v7)) | (v8 << 6);
    }
    else
    {
      v10 = v8 + 1;
      if (__OFADD__(v8, 1))
        goto LABEL_43;
      if (v10 >= v38)
      {
LABEL_40:
        swift_release();
        return (uint64_t)a1;
      }
      v11 = *(_QWORD *)(v37 + 8 * v10);
      v12 = v8 + 1;
      if (!v11)
      {
        v12 = v8 + 2;
        if (v8 + 2 >= v38)
          goto LABEL_40;
        v11 = *(_QWORD *)(v37 + 8 * v12);
        if (!v11)
        {
          v12 = v8 + 3;
          if (v8 + 3 >= v38)
            goto LABEL_40;
          v11 = *(_QWORD *)(v37 + 8 * v12);
          if (!v11)
          {
            v12 = v8 + 4;
            if (v8 + 4 >= v38)
              goto LABEL_40;
            v11 = *(_QWORD *)(v37 + 8 * v12);
            if (!v11)
            {
              v13 = v8 + 5;
              if (v8 + 5 >= v38)
                goto LABEL_40;
              v11 = *(_QWORD *)(v37 + 8 * v13);
              if (!v11)
              {
                while (1)
                {
                  v12 = v13 + 1;
                  if (__OFADD__(v13, 1))
                    goto LABEL_44;
                  if (v12 >= v38)
                    goto LABEL_40;
                  v11 = *(_QWORD *)(v37 + 8 * v12);
                  ++v13;
                  if (v11)
                    goto LABEL_23;
                }
              }
              v12 = v8 + 5;
            }
          }
        }
      }
LABEL_23:
      v41 = (v11 - 1) & v11;
      v42 = v12;
      v9 = __clz(__rbit64(v11)) + (v12 << 6);
    }
    v14 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v9);
    v16 = *v14;
    v15 = v14[1];
    v17 = *(_DWORD *)(*(_QWORD *)(a2 + 56) + 4 * v9);
    v18 = *(_QWORD *)(a3 + 16);
    swift_bridgeObjectRetain_n();
    if (v18)
    {
      swift_bridgeObjectRetain();
      v19 = sub_244EB95C8(v16, v15);
      v20 = v15;
      if ((v21 & 1) != 0)
      {
        v22 = (uint64_t *)(*(_QWORD *)(a3 + 56) + 16 * v19);
        v16 = *v22;
        v20 = v22[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v20 = v15;
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = sub_244EB95C8(v16, v20);
    v26 = a1[2];
    v27 = (v24 & 1) == 0;
    v28 = v26 + v27;
    if (__OFADD__(v26, v27))
      break;
    v29 = v24;
    if (a1[3] >= v28)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v24 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_244EBB454();
        if ((v29 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_244EBA4D8(v28, isUniquelyReferenced_nonNull_native);
      v30 = sub_244EB95C8(v16, v20);
      if ((v29 & 1) != (v31 & 1))
        goto LABEL_45;
      v25 = v30;
      if ((v29 & 1) != 0)
      {
LABEL_4:
        *(_DWORD *)(a1[7] + 4 * v25) = v17;
        goto LABEL_5;
      }
    }
    a1[(v25 >> 6) + 8] |= 1 << v25;
    v32 = (uint64_t *)(a1[6] + 16 * v25);
    *v32 = v16;
    v32[1] = v20;
    *(_DWORD *)(a1[7] + 4 * v25) = v17;
    v33 = a1[2];
    v34 = __OFADD__(v33, 1);
    v35 = v33 + 1;
    if (v34)
      goto LABEL_42;
    a1[2] = v35;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a3 = v39;
    v7 = v41;
    v8 = v42;
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  result = sub_244EE2144();
  __break(1u);
  return result;
}

uint64_t sub_244EBC7E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t);
  char v14;
  char v15;
  uint64_t result;
  uint64_t v17;
  uint64_t inited;
  uint64_t v19;
  unint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD v26[3];
  uint64_t v27;

  v4 = sub_244EE19E8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE60);
  v25 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EBEDF4();
  swift_retain();
  sub_244EE1964();
  v11 = sub_244EE1898();
  v12 = sub_244EC37C4();
  v24 = sub_244EBC4A0(MEMORY[0x24BEE4B00], v11, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_244EE197C();
  sub_244EE1A90();
  v23 = sub_244EE19D0();
  v13 = *(void (**)(char *, uint64_t))(v5 + 8);
  v13(v7, v4);
  sub_244EE197C();
  sub_244EE1A78();
  v14 = sub_244EE19D0();
  v13(v7, v4);
  sub_244EE197C();
  sub_244EE1A84();
  v15 = sub_244EE19D0();
  v13(v7, v4);
  result = sub_244EE18A4();
  v17 = LODWORD(v26[0]);
  if ((v26[0] & 0x80000000) != 0)
  {
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742AEC8);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_244EE2600;
    v19 = v24;
    *(_QWORD *)(inited + 32) = a1;
    *(_QWORD *)(inited + 40) = v19;
    swift_retain();
    v20 = sub_244EB7678(inited, &qword_25742AED0);
    LOBYTE(v26[0]) = 0;
    sub_244ED1054(v23 & 1, v14 & 1, v15 & 1, v17, 0, 0, v20, (uint64_t)v26);
    result = (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v10, v8);
    v21 = v26[1];
    *(_OWORD *)a2 = v26[0];
    *(_OWORD *)(a2 + 16) = v21;
    *(_OWORD *)(a2 + 32) = v26[2];
    *(_QWORD *)(a2 + 48) = v27;
  }
  return result;
}

uint64_t sub_244EBCA90(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t *v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char isUniquelyReferenced_nonNull_native;
  char v26;
  unint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  uint64_t v30;
  char v31;
  unint64_t v32;
  char v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t result;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v44;
  int64_t v45;

  v5 = 1 << *(_BYTE *)(a2 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a2 + 64);
  v41 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  v8 = 0;
  v42 = a3;
  while (1)
  {
    if (v7)
    {
      v44 = (v7 - 1) & v7;
      v45 = v8;
      v10 = __clz(__rbit64(v7)) | (v8 << 6);
    }
    else
    {
      v11 = v8 + 1;
      if (__OFADD__(v8, 1))
        goto LABEL_43;
      if (v11 >= v41)
      {
LABEL_40:
        swift_release();
        return (uint64_t)a1;
      }
      v12 = *(_QWORD *)(v40 + 8 * v11);
      v13 = v8 + 1;
      if (!v12)
      {
        v13 = v8 + 2;
        if (v8 + 2 >= v41)
          goto LABEL_40;
        v12 = *(_QWORD *)(v40 + 8 * v13);
        if (!v12)
        {
          v13 = v8 + 3;
          if (v8 + 3 >= v41)
            goto LABEL_40;
          v12 = *(_QWORD *)(v40 + 8 * v13);
          if (!v12)
          {
            v13 = v8 + 4;
            if (v8 + 4 >= v41)
              goto LABEL_40;
            v12 = *(_QWORD *)(v40 + 8 * v13);
            if (!v12)
            {
              v14 = v8 + 5;
              if (v8 + 5 >= v41)
                goto LABEL_40;
              v12 = *(_QWORD *)(v40 + 8 * v14);
              if (!v12)
              {
                while (1)
                {
                  v13 = v14 + 1;
                  if (__OFADD__(v14, 1))
                    goto LABEL_44;
                  if (v13 >= v41)
                    goto LABEL_40;
                  v12 = *(_QWORD *)(v40 + 8 * v13);
                  ++v14;
                  if (v12)
                    goto LABEL_23;
                }
              }
              v13 = v8 + 5;
            }
          }
        }
      }
LABEL_23:
      v44 = (v12 - 1) & v12;
      v45 = v13;
      v10 = __clz(__rbit64(v12)) + (v13 << 6);
    }
    v15 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v10);
    v17 = *v15;
    v16 = v15[1];
    v18 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v10);
    v19 = *(_QWORD *)(a3 + 16);
    swift_bridgeObjectRetain_n();
    if (v19)
    {
      swift_bridgeObjectRetain();
      v20 = sub_244EB95C8(v17, v16);
      if ((v21 & 1) != 0)
      {
        v22 = (uint64_t *)(*(_QWORD *)(a3 + 56) + 16 * v20);
        v24 = *v22;
        v23 = v22[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_29;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain();
    v24 = v17;
    v23 = v16;
LABEL_29:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v27 = sub_244EB95C8(v24, v23);
    v28 = a1[2];
    v29 = (v26 & 1) == 0;
    v30 = v28 + v29;
    if (__OFADD__(v28, v29))
      break;
    v31 = v26;
    if (a1[3] >= v30)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v26 & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        sub_244EBB600();
        if ((v31 & 1) != 0)
          goto LABEL_4;
      }
    }
    else
    {
      sub_244EBA7E0(v30, isUniquelyReferenced_nonNull_native);
      v32 = sub_244EB95C8(v24, v23);
      if ((v31 & 1) != (v33 & 1))
        goto LABEL_45;
      v27 = v32;
      if ((v31 & 1) != 0)
      {
LABEL_4:
        v9 = (uint64_t *)(a1[7] + 24 * v27);
        swift_bridgeObjectRelease();
        *v9 = v17;
        v9[1] = v16;
        v9[2] = v18;
        goto LABEL_5;
      }
    }
    a1[(v27 >> 6) + 8] |= 1 << v27;
    v34 = (uint64_t *)(a1[6] + 16 * v27);
    *v34 = v24;
    v34[1] = v23;
    v35 = (uint64_t *)(a1[7] + 24 * v27);
    *v35 = v17;
    v35[1] = v16;
    v35[2] = v18;
    v36 = a1[2];
    v37 = __OFADD__(v36, 1);
    v38 = v36 + 1;
    if (v37)
      goto LABEL_42;
    a1[2] = v38;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a3 = v42;
    v7 = v44;
    v8 = v45;
  }
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  result = sub_244EE2144();
  __break(1u);
  return result;
}

uint64_t sub_244EBCE08(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t *v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char isUniquelyReferenced_nonNull_native;
  char v26;
  unint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  uint64_t v30;
  char v31;
  unint64_t v32;
  char v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t result;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  uint64_t v44;
  int64_t v45;
  uint64_t v46;

  v5 = 1 << *(_BYTE *)(a2 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a2 + 64);
  v41 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain();
  v8 = 0;
  v42 = a3;
  while (1)
  {
    if (v7)
    {
      v44 = (v7 - 1) & v7;
      v45 = v8;
      v10 = __clz(__rbit64(v7)) | (v8 << 6);
    }
    else
    {
      v11 = v8 + 1;
      if (__OFADD__(v8, 1))
        goto LABEL_41;
      if (v11 >= v41)
      {
LABEL_38:
        swift_release();
        return (uint64_t)a1;
      }
      v12 = *(_QWORD *)(v40 + 8 * v11);
      v13 = v8 + 1;
      if (!v12)
      {
        v13 = v8 + 2;
        if (v8 + 2 >= v41)
          goto LABEL_38;
        v12 = *(_QWORD *)(v40 + 8 * v13);
        if (!v12)
        {
          v13 = v8 + 3;
          if (v8 + 3 >= v41)
            goto LABEL_38;
          v12 = *(_QWORD *)(v40 + 8 * v13);
          if (!v12)
          {
            v13 = v8 + 4;
            if (v8 + 4 >= v41)
              goto LABEL_38;
            v12 = *(_QWORD *)(v40 + 8 * v13);
            if (!v12)
            {
              v14 = v8 + 5;
              if (v8 + 5 >= v41)
                goto LABEL_38;
              v12 = *(_QWORD *)(v40 + 8 * v14);
              if (!v12)
              {
                while (1)
                {
                  v13 = v14 + 1;
                  if (__OFADD__(v14, 1))
                    goto LABEL_42;
                  if (v13 >= v41)
                    goto LABEL_38;
                  v12 = *(_QWORD *)(v40 + 8 * v13);
                  ++v14;
                  if (v12)
                    goto LABEL_23;
                }
              }
              v13 = v8 + 5;
            }
          }
        }
      }
LABEL_23:
      v44 = (v12 - 1) & v12;
      v45 = v13;
      v10 = __clz(__rbit64(v12)) + (v13 << 6);
    }
    v15 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v10);
    v17 = *v15;
    v16 = v15[1];
    v18 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v10);
    v19 = *(_QWORD *)(a3 + 16);
    swift_bridgeObjectRetain_n();
    v46 = v18;
    if (v19)
    {
      swift_bridgeObjectRetain();
      v20 = sub_244EB95C8(v17, v16);
      if ((v21 & 1) != 0)
      {
        v22 = (uint64_t *)(*(_QWORD *)(a3 + 56) + 16 * v20);
        v24 = *v22;
        v23 = v22[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        goto LABEL_29;
      }
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain();
    v24 = v17;
    v23 = v16;
LABEL_29:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v27 = sub_244EB95C8(v24, v23);
    v28 = a1[2];
    v29 = (v26 & 1) == 0;
    v30 = v28 + v29;
    if (__OFADD__(v28, v29))
      break;
    v31 = v26;
    if (a1[3] >= v30)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_244EBB7C8();
    }
    else
    {
      sub_244EBAB04(v30, isUniquelyReferenced_nonNull_native);
      v32 = sub_244EB95C8(v24, v23);
      if ((v31 & 1) != (v33 & 1))
        goto LABEL_43;
      v27 = v32;
    }
    if ((v31 & 1) != 0)
    {
      v9 = (uint64_t *)(a1[7] + 24 * v27);
      swift_bridgeObjectRelease();
      *v9 = v17;
      v9[1] = v16;
      v9[2] = v46;
    }
    else
    {
      a1[(v27 >> 6) + 8] |= 1 << v27;
      v34 = (uint64_t *)(a1[6] + 16 * v27);
      *v34 = v24;
      v34[1] = v23;
      v35 = (uint64_t *)(a1[7] + 24 * v27);
      *v35 = v17;
      v35[1] = v16;
      v35[2] = v46;
      v36 = a1[2];
      v37 = __OFADD__(v36, 1);
      v38 = v36 + 1;
      if (v37)
        goto LABEL_40;
      a1[2] = v38;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    a3 = v42;
    v7 = v44;
    v8 = v45;
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  result = sub_244EE2144();
  __break(1u);
  return result;
}

double sub_244EBD170@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t inited;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  double result;
  __int128 v20;
  __int128 v21;
  _OWORD v22[2];
  uint64_t v23;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE60);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EE1970();
  v8 = sub_244EE1904();
  v9 = *(void (**)(char *, uint64_t))(v5 + 8);
  v9(v7, v4);
  sub_244EE1970();
  v10 = sub_244EE18F8();
  v9(v7, v4);
  sub_244EE1970();
  v11 = sub_244EC37C4();
  v9(v7, v4);
  swift_bridgeObjectRetain();
  v12 = (_QWORD *)MEMORY[0x24BEE4B00];
  v13 = sub_244EBCA90(MEMORY[0x24BEE4B00], v8, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v14 = sub_244EBCE08(v12, v10, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE68);
  inited = swift_initStackObject();
  v21 = xmmword_244EE2600;
  *(_OWORD *)(inited + 16) = xmmword_244EE2600;
  *(_QWORD *)(inited + 32) = a1;
  *(_QWORD *)(inited + 40) = v13;
  swift_retain();
  v16 = sub_244EB7678(inited, &qword_25742AE80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE70);
  v17 = swift_initStackObject();
  *(_OWORD *)(v17 + 16) = v21;
  *(_QWORD *)(v17 + 32) = a1;
  *(_QWORD *)(v17 + 40) = v14;
  swift_retain();
  v18 = sub_244EB7678(v17, &qword_25742AE78);
  sub_244ED284C(v16, v18, (uint64_t)v22);
  result = *(double *)v22;
  v20 = v22[1];
  *(_OWORD *)a2 = v22[0];
  *(_OWORD *)(a2 + 16) = v20;
  *(_QWORD *)(a2 + 32) = v23;
  return result;
}

uint64_t sub_244EBD378@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t result;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  _BYTE v17[40];

  v2 = sub_244EE19E8();
  v14 = *(_QWORD *)(v2 - 8);
  v15 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE60);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EBEDF4();
  swift_retain();
  sub_244EE1964();
  sub_244ECFD44((uint64_t)v17);
  sub_244EE18EC();
  v9 = v16;
  sub_244EE18C8();
  v10 = v16;
  result = sub_244EE188C();
  v12 = v16;
  if ((v16 & 0x80000000) != 0)
  {
    __break(1u);
  }
  else
  {
    sub_244EE197C();
    v13 = sub_244EE19AC();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v4, v15);
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_DWORD *)a1 = v9;
    *(_BYTE *)(a1 + 4) = 0;
    *(_DWORD *)(a1 + 8) = v10;
    *(_BYTE *)(a1 + 12) = 0;
    *(_DWORD *)(a1 + 16) = v13 & 1;
    *(_BYTE *)(a1 + 20) = 0;
    *(_QWORD *)(a1 + 24) = v12;
    *(_BYTE *)(a1 + 32) = 0;
  }
  return result;
}

uint64_t sub_244EBD4F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t inited;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  char v23;
  void (*v24)(char *, uint64_t);
  char v25;
  char v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  char v29;
  char *v30;
  uint64_t v31;
  uint64_t (*v32)(char *, uint64_t);
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char v39;
  int v40;
  char v41;
  int v42;
  char v43;
  int v44;
  char v45;
  int v46;
  char v47;
  char v48;
  int v49;
  char v50;
  int v51;
  char v52;
  _QWORD v53[2];
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  void (*v58)(char *, uint64_t);
  uint64_t v59;
  int v60;
  int v61;
  char v62;
  __int128 v63;
  uint64_t KeyPath;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  char v69;
  int v70;
  char v71;
  int v72;
  char v73;
  int v74;
  char v75;
  int v76;
  char v77;
  uint64_t v78;
  unsigned int v79;
  char v80;
  int v81;
  char v82;
  int v83;
  char v84;

  v4 = sub_244EE19E8();
  v58 = *(void (**)(char *, uint64_t))(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE60);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v56 = (char *)v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v53 - v11;
  sub_244EBEDF4();
  swift_retain();
  v55 = v12;
  sub_244EE1964();
  sub_244ECFD48((uint64_t)&v68);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AEB8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_244EE2610;
  *(_QWORD *)(inited + 32) = swift_getKeyPath();
  v14 = sub_244EE1838();
  v15 = MEMORY[0x24BDE67A8];
  *(_QWORD *)(inited + 40) = v14;
  *(_QWORD *)(inited + 48) = v15;
  *(_QWORD *)(inited + 56) = swift_getKeyPath();
  v16 = sub_244EE1844();
  v17 = MEMORY[0x24BDE6860];
  *(_QWORD *)(inited + 64) = v16;
  *(_QWORD *)(inited + 72) = v17;
  *(_QWORD *)(inited + 80) = swift_getKeyPath();
  v18 = sub_244EE1814();
  v19 = MEMORY[0x24BDE6690];
  *(_QWORD *)(inited + 88) = v18;
  *(_QWORD *)(inited + 96) = v19;
  *(_QWORD *)(inited + 104) = swift_getKeyPath();
  v20 = sub_244EE1808();
  v21 = MEMORY[0x24BDE65F0];
  *(_QWORD *)(inited + 112) = v20;
  *(_QWORD *)(inited + 120) = v21;
  v63 = xmmword_244EE25F0;
  KeyPath = swift_getKeyPath();
  v65 = swift_getKeyPath();
  v66 = swift_getKeyPath();
  result = swift_getKeyPath();
  v67 = result;
  if (!*(_QWORD *)(inited + 16))
  {
    __break(1u);
    goto LABEL_12;
  }
  v54 = v8;
  v57 = v7;
  v59 = v4;
  swift_retain();
  sub_244EE197C();
  v23 = sub_244EE19D0();
  v24 = (void (*)(char *, uint64_t))*((_QWORD *)v58 + 1);
  v24(v6, v59);
  v61 = v23 & 1;
  v62 = 0;
  swift_setAtWritableKeyPath();
  result = swift_release();
  if (*(_QWORD *)(inited + 16) < 2uLL)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v58 = v24;
  swift_retain();
  sub_244EE197C();
  v25 = sub_244EE19D0();
  v58(v6, v59);
  v61 = v25 & 1;
  v62 = 0;
  swift_setAtWritableKeyPath();
  result = swift_release();
  if (*(_QWORD *)(inited + 16) < 3uLL)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  swift_retain();
  sub_244EE197C();
  v26 = sub_244EE19D0();
  v27 = v58;
  v58(v6, v59);
  v61 = v26 & 1;
  v62 = 0;
  swift_setAtWritableKeyPath();
  result = swift_release();
  if (*(_QWORD *)(inited + 16) < 4uLL)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  swift_retain();
  sub_244EE197C();
  v28 = v59;
  v29 = sub_244EE19D0();
  v27(v6, v28);
  v61 = v29 & 1;
  v62 = 0;
  swift_setAtWritableKeyPath();
  swift_bridgeObjectRelease();
  swift_release();
  v30 = v56;
  v53[1] = a1;
  sub_244EE1970();
  v31 = v57;
  sub_244EC34C0();
  v32 = *(uint64_t (**)(char *, uint64_t))(v54 + 8);
  result = v32(v30, v31);
  v83 = v61;
  v84 = 0;
  v33 = v63;
  if (!(_QWORD)v63)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  swift_retain();
  swift_retain();
  v34 = v55;
  swift_getAtKeyPath();
  v61 = v60;
  v62 = 0;
  swift_setAtWritableKeyPath();
  swift_release();
  result = swift_release();
  if (v33 == 1)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  v35 = v28;
  swift_retain();
  swift_retain();
  swift_getAtKeyPath();
  v61 = v60;
  v62 = 0;
  swift_setAtWritableKeyPath();
  v36 = v57;
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AEC0);
  swift_arrayDestroy();
  sub_244EE197C();
  v37 = sub_244EE19A0();
  v58(v6, v35);
  v76 = v37 & 1;
  v77 = 0;
  sub_244EE18D4();
  if (v61)
  {
    v38 = sub_244EE18E0();
    v32(v34, v36);
    swift_bridgeObjectRelease();
  }
  else
  {
    v32(v34, v36);
    v38 = v78;
  }
  v39 = v69;
  v40 = v70;
  v41 = v71;
  v42 = v72;
  v43 = v73;
  v44 = v74;
  v45 = v75;
  v46 = v76;
  v47 = v77;
  result = v79;
  v48 = v80;
  v49 = v81;
  v50 = v82;
  v51 = v83;
  v52 = v84;
  *(_DWORD *)a2 = v68;
  *(_BYTE *)(a2 + 4) = v39;
  *(_DWORD *)(a2 + 8) = v40;
  *(_BYTE *)(a2 + 12) = v41;
  *(_DWORD *)(a2 + 16) = v42;
  *(_BYTE *)(a2 + 20) = v43;
  *(_DWORD *)(a2 + 24) = v44;
  *(_BYTE *)(a2 + 28) = v45;
  *(_DWORD *)(a2 + 32) = v46;
  *(_BYTE *)(a2 + 36) = v47;
  *(_QWORD *)(a2 + 40) = v38;
  *(_DWORD *)(a2 + 48) = result;
  *(_BYTE *)(a2 + 52) = v48;
  *(_DWORD *)(a2 + 56) = v49;
  *(_BYTE *)(a2 + 60) = v50;
  *(_DWORD *)(a2 + 64) = v51;
  *(_BYTE *)(a2 + 68) = v52;
  return result;
}

uint64_t sub_244EBDB28(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  char v47;
  int v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t *v65;
  char v66;
  _QWORD *v67;
  char v68;
  unint64_t v69;
  uint64_t v70;
  _BOOL8 v71;
  uint64_t v72;
  char v73;
  unint64_t v74;
  char v75;
  _QWORD *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  unint64_t v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  char v89;
  unint64_t v90;
  uint64_t v91;
  _BOOL8 v92;
  uint64_t v93;
  char v94;
  unint64_t v95;
  char v96;
  _QWORD *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  unint64_t v120;
  char v121;
  int64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  char v127;
  uint64_t v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t *v133;
  char v134;
  _QWORD *v135;
  char v136;
  unint64_t v137;
  uint64_t v138;
  _BOOL8 v139;
  uint64_t v140;
  char v141;
  unint64_t v142;
  char v143;
  _QWORD *v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  char v151;
  char v152;
  unint64_t v153;
  uint64_t v154;
  _BOOL8 v155;
  uint64_t v156;
  char v157;
  unint64_t v158;
  unint64_t v159;
  char v160;
  _QWORD *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  char v166;
  uint64_t result;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  unint64_t v179;
  unint64_t v180;
  uint64_t v181;
  uint64_t v182;
  char *v183;
  char *v184;
  uint64_t *v185;
  uint64_t v186;
  unint64_t v187;
  unint64_t v188;
  unint64_t v189;
  _QWORD v190[37];
  _QWORD *v191;
  _QWORD v192[37];
  _QWORD v193[37];
  _QWORD v194[37];

  v175 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE60);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v168 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v168 - v10;
  v12 = *a2;
  v185 = a2;
  v186 = v12;
  v194[0] = MEMORY[0x24BEE4AF8];
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v13 = sub_244EE209C();
  }
  else
  {
    v13 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v181 = v5;
  v182 = v6;
  v183 = v9;
  v184 = v11;
  if (!v13)
  {
    swift_bridgeObjectRelease();
    v33 = MEMORY[0x24BEE4AF8];
    if (MEMORY[0x24BEE4AF8] >> 62)
      goto LABEL_180;
LABEL_37:
    v34 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v34)
      return swift_bridgeObjectRelease();
LABEL_38:
    if ((v33 & 0xC000000000000001) != 0)
    {
      v35 = MEMORY[0x249529C58](0, v33);
    }
    else
    {
      if (!*(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
LABEL_205:
        __break(1u);
LABEL_206:
        __break(1u);
LABEL_207:
        __break(1u);
LABEL_208:
        __break(1u);
LABEL_209:
        __break(1u);
LABEL_210:
        __break(1u);
LABEL_211:
        __break(1u);
LABEL_212:
        __break(1u);
LABEL_213:
        __break(1u);
LABEL_214:
        __break(1u);
LABEL_215:
        sub_244EE2144();
        __break(1u);
LABEL_216:
        sub_244EE1A6C();
        sub_244EE2144();
        __break(1u);
LABEL_217:
        result = sub_244EE2144();
        __break(1u);
        return result;
      }
      v35 = *(_QWORD *)(v33 + 32);
      swift_retain();
    }
    if (!*(_QWORD *)(v175 + 16))
      goto LABEL_201;
    v36 = swift_retain();
    v37 = sub_244EB9538(v36);
    if ((v38 & 1) == 0)
      goto LABEL_183;
    v176 = v35;
    v170 = v33 & 0xFFFFFFFFFFFFFF8;
    v171 = v33 & 0xC000000000000001;
    v169 = v33 + 32;
    v39 = MEMORY[0x24BEE4AF8];
    v40 = 1;
    v172 = v33;
    v173 = v34;
    while (1)
    {
      v174 = v40;
      v41 = *(unsigned __int8 *)(*(_QWORD *)(v175 + 56) + v37);
      swift_release();
      v187 = sub_244EB777C(v39);
      LODWORD(v186) = v41;
      v42 = v41 ? 1 : -1;
      v178 = v42;
      v43 = sub_244ECDF60();
      v188 = v43;
      if (v43 >> 62)
      {
        swift_bridgeObjectRetain();
        v44 = sub_244EE209C();
        swift_bridgeObjectRelease();
      }
      else
      {
        v44 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      if (v44)
        break;
LABEL_112:
      swift_bridgeObjectRelease();
      v101 = v187;
      if (!*(_QWORD *)(v187 + 16))
      {
        swift_release();
LABEL_166:
        v106 = v172;
        v105 = v173;
        goto LABEL_167;
      }
      v102 = v176;
      v103 = swift_retain();
      v104 = sub_244EB9538(v103);
      v106 = v172;
      v105 = v173;
      if ((v107 & 1) == 0)
      {
        swift_release_n();
LABEL_167:
        v115 = v174;
        goto LABEL_168;
      }
      v108 = *(_QWORD *)(*(_QWORD *)(v101 + 56) + 8 * v104);
      swift_release();
      if ((unsigned __int128)(v108 * (__int128)v178) >> 64 != (v108 * v178) >> 63)
        goto LABEL_212;
      sub_244EB935C(v102, v185, v108 * v178);
      v109 = sub_244EE1A6C();
      v110 = sub_244EE1730();
      if (v110)
      {
        v111 = v110;
        swift_retain();
        v112 = v187;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v194[0] = v112;
        sub_244EBAF80(v108, v111, isUniquelyReferenced_nonNull_native);
        v114 = v194[0];
        swift_release_n();
        swift_bridgeObjectRelease();
        v115 = v174;
      }
      else
      {
        v115 = v174;
        v114 = v187;
      }
      v187 = v114;
      swift_retain();
      v116 = sub_244EE1730();
      v5 = v181;
      if (!v116)
        goto LABEL_177;
      v189 = v109;
      do
      {
        v117 = v116;
        while (1)
        {
          v118 = v187;
          if (!*(_QWORD *)(v187 + 16))
          {
            swift_release();
LABEL_161:
            swift_release();
            swift_release();
            goto LABEL_165;
          }
          v119 = swift_retain();
          v120 = sub_244EB9538(v119);
          if ((v121 & 1) == 0)
          {
            swift_release();
            swift_release();
            goto LABEL_161;
          }
          v122 = *(_QWORD *)(*(_QWORD *)(v118 + 56) + 8 * v120);
          swift_release();
          v123 = v122 * v178;
          if ((unsigned __int128)(v122 * (__int128)v178) >> 64 != (v122 * v178) >> 63)
            goto LABEL_205;
          v124 = *v185;
          if (!*(_QWORD *)(*v185 + 16))
          {
            swift_release();
            goto LABEL_164;
          }
          v125 = swift_retain();
          v126 = sub_244EB9538(v125);
          if ((v127 & 1) == 0)
          {
            swift_release();
            swift_release();
LABEL_164:
            swift_release();
            swift_release();
            v5 = v181;
LABEL_165:
            v9 = v183;
            goto LABEL_166;
          }
          memcpy(v193, (const void *)(*(_QWORD *)(v124 + 56) + 296 * v126), sizeof(v193));
          sub_244EBEE3C((uint64_t)v193);
          swift_release();
          memcpy(v194, v193, sizeof(v194));
          sub_244EBEE3C((uint64_t)v193);
          sub_244ED6324();
          swift_beginAccess();
          memcpy(v192, v193, sizeof(v192));
          swift_retain();
          swift_getAtKeyPath();
          swift_release();
          sub_244EBBA84((uint64_t)v193);
          v128 = SLODWORD(v190[0]);
          v129 = BYTE4(v190[0]);
          swift_beginAccess();
          if (v129)
            v130 = 0;
          else
            v130 = v128;
          v17 = __OFADD__(v130, v123);
          v131 = v130 + v123;
          if (v17)
            goto LABEL_206;
          v132 = v131 & ~(v131 >> 63);
          if (v132 >> 31)
            goto LABEL_207;
          LODWORD(v190[0]) = v132;
          BYTE4(v190[0]) = 0;
          swift_retain();
          swift_setAtWritableKeyPath();
          swift_release();
          memcpy(v192, v194, sizeof(v192));
          swift_retain();
          v133 = v185;
          v134 = swift_isUniquelyReferenced_nonNull_native();
          v191 = (_QWORD *)*v133;
          v135 = v191;
          *v133 = 0x8000000000000000;
          v137 = sub_244EB9538(v117);
          v138 = v135[2];
          v139 = (v136 & 1) == 0;
          v140 = v138 + v139;
          if (__OFADD__(v138, v139))
            goto LABEL_208;
          v141 = v136;
          if (v135[3] >= v140)
          {
            if ((v134 & 1) == 0)
              sub_244EBB0C4();
          }
          else
          {
            sub_244EB9854(v140, v134);
            v142 = sub_244EB9538(v117);
            if ((v141 & 1) != (v143 & 1))
              goto LABEL_217;
            v137 = v142;
          }
          v11 = v184;
          v188 = v122;
          if ((v141 & 1) != 0)
          {
            v144 = v191;
            v145 = (void *)(v191[7] + 296 * v137);
            memcpy(v190, v145, sizeof(v190));
            sub_244EBBA84((uint64_t)v190);
            memcpy(v145, v192, 0x128uLL);
          }
          else
          {
            v144 = v191;
            v191[(v137 >> 6) + 8] |= 1 << v137;
            *(_QWORD *)(v144[6] + 8 * v137) = v117;
            memcpy((void *)(v144[7] + 296 * v137), v192, 0x128uLL);
            v146 = v144[2];
            v17 = __OFADD__(v146, 1);
            v147 = v146 + 1;
            if (v17)
              goto LABEL_210;
            v144[2] = v147;
            swift_retain();
          }
          *v185 = (uint64_t)v144;
          swift_release();
          swift_bridgeObjectRelease();
          v148 = sub_244EE1730();
          if (v148)
            break;
          swift_release();
          v117 = sub_244EE1730();
          v5 = v181;
          if (!v117)
          {
            v106 = v172;
            v115 = v174;
            goto LABEL_177;
          }
        }
        v149 = v148;
        swift_retain();
        v150 = v187;
        v151 = swift_isUniquelyReferenced_nonNull_native();
        v190[0] = v150;
        v153 = sub_244EB9538(v149);
        v154 = *(_QWORD *)(v150 + 16);
        v155 = (v152 & 1) == 0;
        v156 = v154 + v155;
        if (__OFADD__(v154, v155))
          goto LABEL_213;
        v157 = v152;
        v158 = v188;
        if (*(_QWORD *)(v150 + 24) >= v156)
        {
          if ((v151 & 1) == 0)
            sub_244EBB2B4();
        }
        else
        {
          sub_244EBA1AC(v156, v151);
          v159 = sub_244EB9538(v149);
          if ((v157 & 1) != (v160 & 1))
            goto LABEL_217;
          v153 = v159;
        }
        v161 = (_QWORD *)v190[0];
        v187 = v190[0];
        if ((v157 & 1) != 0)
        {
          *(_QWORD *)(*(_QWORD *)(v190[0] + 56) + 8 * v153) = v158;
        }
        else
        {
          *(_QWORD *)(v190[0] + 8 * (v153 >> 6) + 64) |= 1 << v153;
          v162 = 8 * v153;
          *(_QWORD *)(v161[6] + v162) = v149;
          *(_QWORD *)(v161[7] + v162) = v158;
          v163 = v161[2];
          v17 = __OFADD__(v163, 1);
          v164 = v163 + 1;
          if (v17)
            goto LABEL_214;
          v161[2] = v164;
          swift_retain();
        }
        v6 = v182;
        v11 = v184;
        swift_release();
        swift_release_n();
        swift_bridgeObjectRelease();
        v116 = sub_244EE1730();
        v5 = v181;
        v106 = v172;
        v115 = v174;
      }
      while (v116);
LABEL_177:
      swift_release();
      swift_release();
      v9 = v183;
      v105 = v173;
LABEL_168:
      swift_bridgeObjectRelease();
      if (v115 == v105)
        return swift_bridgeObjectRelease();
      if (v171)
      {
        v176 = MEMORY[0x249529C58](v115, v106);
        goto LABEL_173;
      }
      if (v115 >= *(_QWORD *)(v170 + 16))
        goto LABEL_211;
      v176 = *(_QWORD *)(v169 + 8 * v115);
      swift_retain();
LABEL_173:
      v17 = __OFADD__(v115, 1);
      v40 = v115 + 1;
      if (v17)
        goto LABEL_209;
      if (!*(_QWORD *)(v175 + 16))
        goto LABEL_201;
      v165 = swift_retain();
      v37 = sub_244EB9538(v165);
      v39 = MEMORY[0x24BEE4AF8];
      if ((v166 & 1) == 0)
      {
LABEL_183:
        swift_bridgeObjectRelease();
        swift_release();
        return swift_release();
      }
    }
    v189 = v188 & 0xC000000000000001;
    v179 = v188 + 32;
    v180 = v188 & 0xFFFFFFFFFFFFFF8;
    while (1)
    {
      v17 = __OFSUB__(v44--, 1);
      if (v17)
        goto LABEL_186;
      if (v189)
      {
        v46 = MEMORY[0x249529C58](v44, v188);
      }
      else
      {
        if ((v44 & 0x8000000000000000) != 0)
          goto LABEL_187;
        if (v44 >= *(_QWORD *)(v180 + 16))
          goto LABEL_188;
        v46 = *(_QWORD *)(v179 + 8 * v44);
        swift_retain();
      }
      sub_244EBEDF4();
      swift_retain();
      sub_244EE1964();
      v47 = sub_244EE194C();
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
      if ((v47 & 1) == 0)
      {
        swift_release();
        v45 = *(void (**)(char *, uint64_t))(v6 + 8);
        v45(v9, v5);
LABEL_52:
        v45(v11, v5);
        goto LABEL_53;
      }
      v48 = sub_244EE18B0();
      v45 = *(void (**)(char *, uint64_t))(v6 + 8);
      v45(v9, v5);
      if (((v186 ^ v48) & 1) == 0)
      {
        swift_release();
        goto LABEL_52;
      }
      v49 = v187;
      if (*(_QWORD *)(v187 + 16))
      {
        v50 = swift_retain();
        v51 = sub_244EB9538(v50);
        if ((v52 & 1) != 0)
          v53 = *(_QWORD *)(*(_QWORD *)(v49 + 56) + 8 * v51);
        else
          v53 = 0;
        swift_release();
      }
      else
      {
        v53 = 0;
      }
      v54 = v53 + 1;
      if (__OFADD__(v53, 1))
        goto LABEL_189;
      v55 = v54 * v178;
      if ((unsigned __int128)(v54 * (__int128)v178) >> 64 != (v54 * v178) >> 63)
        goto LABEL_190;
      v56 = *v185;
      if (*(_QWORD *)(*v185 + 16))
        break;
LABEL_91:
      v177 = sub_244EE1A6C();
      v80 = sub_244EE1730();
      if (!v80)
      {
        v11 = v184;
        v45(v184, v5);
        swift_release();
        v6 = v182;
        goto LABEL_53;
      }
      v81 = v80;
      v82 = (_QWORD *)v187;
      if (*(_QWORD *)(v187 + 16))
      {
        v83 = swift_retain();
        v84 = sub_244EB9538(v83);
        if ((v85 & 1) != 0)
        {
          v86 = *(_QWORD *)(v82[7] + 8 * v84);
          swift_release();
          if (v55 < 0)
            goto LABEL_99;
          goto LABEL_100;
        }
        swift_release();
      }
      v86 = 0;
      if (v55 < 0)
      {
LABEL_99:
        v55 = -v55;
        if (v55 < 0)
          goto LABEL_191;
      }
LABEL_100:
      v87 = v86 + v55;
      if (__OFADD__(v86, v55))
        goto LABEL_192;
      swift_retain();
      v88 = swift_isUniquelyReferenced_nonNull_native();
      v194[0] = v82;
      v90 = sub_244EB9538(v81);
      v91 = v82[2];
      v92 = (v89 & 1) == 0;
      v93 = v91 + v92;
      if (__OFADD__(v91, v92))
        goto LABEL_193;
      v94 = v89;
      if (v82[3] >= v93)
      {
        if ((v88 & 1) == 0)
          sub_244EBB2B4();
      }
      else
      {
        sub_244EBA1AC(v93, v88);
        v95 = sub_244EB9538(v81);
        if ((v94 & 1) != (v96 & 1))
          goto LABEL_215;
        v90 = v95;
      }
      v9 = v183;
      v97 = (_QWORD *)v194[0];
      v187 = v194[0];
      if ((v94 & 1) != 0)
      {
        *(_QWORD *)(*(_QWORD *)(v194[0] + 56) + 8 * v90) = v87;
      }
      else
      {
        *(_QWORD *)(v194[0] + 8 * (v90 >> 6) + 64) |= 1 << v90;
        v98 = 8 * v90;
        *(_QWORD *)(v97[6] + v98) = v81;
        *(_QWORD *)(v97[7] + v98) = v87;
        v99 = v97[2];
        v17 = __OFADD__(v99, 1);
        v100 = v99 + 1;
        if (v17)
          goto LABEL_198;
        v97[2] = v100;
        swift_retain();
      }
      swift_release();
      swift_release_n();
      swift_bridgeObjectRelease();
      v11 = v184;
      v5 = v181;
      v45(v184, v181);
      v6 = v182;
LABEL_53:
      if (!v44)
        goto LABEL_112;
    }
    v57 = swift_retain();
    v58 = sub_244EB9538(v57);
    if ((v59 & 1) == 0)
    {
      swift_release();
      goto LABEL_91;
    }
    memcpy(v193, (const void *)(*(_QWORD *)(v56 + 56) + 296 * v58), sizeof(v193));
    sub_244EBEE3C((uint64_t)v193);
    swift_release();
    memcpy(v194, v193, sizeof(v194));
    sub_244EBEE3C((uint64_t)v193);
    sub_244ED6324();
    swift_beginAccess();
    memcpy(v192, v193, sizeof(v192));
    swift_retain();
    swift_getAtKeyPath();
    swift_release();
    sub_244EBBA84((uint64_t)v193);
    v60 = SLODWORD(v190[0]);
    v61 = BYTE4(v190[0]);
    swift_beginAccess();
    if (v61)
      v62 = 0;
    else
      v62 = v60;
    v17 = __OFADD__(v62, v55);
    v63 = v62 + v55;
    if (v17)
      goto LABEL_195;
    v64 = v63 & ~(v63 >> 63);
    if (v64 >> 31)
      goto LABEL_196;
    LODWORD(v192[0]) = v64;
    BYTE4(v192[0]) = 0;
    swift_retain();
    swift_setAtWritableKeyPath();
    swift_release();
    memcpy(v192, v194, sizeof(v192));
    swift_retain();
    v65 = v185;
    v66 = swift_isUniquelyReferenced_nonNull_native();
    v191 = (_QWORD *)*v65;
    v67 = v191;
    *v65 = 0x8000000000000000;
    v69 = sub_244EB9538(v46);
    v70 = v67[2];
    v71 = (v68 & 1) == 0;
    v72 = v70 + v71;
    if (__OFADD__(v70, v71))
      goto LABEL_197;
    v73 = v68;
    if (v67[3] < v72)
    {
      sub_244EB9854(v72, v66);
      v74 = sub_244EB9538(v46);
      if ((v73 & 1) != (v75 & 1))
        goto LABEL_216;
      v69 = v74;
      if ((v73 & 1) == 0)
        goto LABEL_88;
LABEL_86:
      v76 = v191;
      v77 = (void *)(v191[7] + 296 * v69);
      memcpy(v190, v77, sizeof(v190));
      sub_244EBBA84((uint64_t)v190);
      memcpy(v77, v192, 0x128uLL);
LABEL_90:
      *v185 = (uint64_t)v76;
      swift_release();
      swift_bridgeObjectRelease();
      v5 = v181;
      goto LABEL_91;
    }
    if ((v66 & 1) != 0)
    {
      if ((v68 & 1) != 0)
        goto LABEL_86;
    }
    else
    {
      sub_244EBB0C4();
      if ((v73 & 1) != 0)
        goto LABEL_86;
    }
LABEL_88:
    v76 = v191;
    v191[(v69 >> 6) + 8] |= 1 << v69;
    *(_QWORD *)(v76[6] + 8 * v69) = v46;
    memcpy((void *)(v76[7] + 296 * v69), v192, 0x128uLL);
    v78 = v76[2];
    v17 = __OFADD__(v78, 1);
    v79 = v78 + 1;
    if (v17)
      goto LABEL_200;
    v76[2] = v79;
    swift_retain();
    goto LABEL_90;
  }
  v14 = 0;
  v179 = a3;
  v180 = a3 & 0xC000000000000001;
  v176 = a3 + 32;
  v177 = a3 & 0xFFFFFFFFFFFFFF8;
  v178 = v13;
  while (1)
  {
    if (v180)
    {
      v16 = MEMORY[0x249529C58](v14, a3);
      v17 = __OFADD__(v14++, 1);
      if (v17)
        goto LABEL_194;
    }
    else
    {
      if (v14 >= *(_QWORD *)(v177 + 16))
        goto LABEL_199;
      v16 = *(_QWORD *)(v176 + 8 * v14);
      swift_retain();
      v17 = __OFADD__(v14++, 1);
      if (v17)
        goto LABEL_194;
    }
    sub_244EE1A6C();
    swift_retain();
    v18 = sub_244EE1730();
    if (v18)
      break;
LABEL_31:
    swift_release();
    swift_release();
    v5 = v181;
    v6 = v182;
LABEL_32:
    v15 = v178;
    a3 = v179;
LABEL_6:
    v11 = v184;
    if (v14 == v15)
    {
      swift_bridgeObjectRelease();
      v33 = v194[0];
      if (!(v194[0] >> 62))
        goto LABEL_37;
LABEL_180:
      swift_bridgeObjectRetain();
      v34 = sub_244EE209C();
      swift_bridgeObjectRelease();
      if (!v34)
        return swift_bridgeObjectRelease();
      goto LABEL_38;
    }
  }
  v19 = v18;
  v20 = v16;
  v187 = v16;
  v188 = v14;
  while (1)
  {
    v21 = v194[0];
    v189 = v20;
    if (v194[0] >> 62)
      break;
    v22 = *(_QWORD *)((v194[0] & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (v22)
      goto LABEL_17;
LABEL_25:
    swift_bridgeObjectRelease_n();
    if (!*(_QWORD *)(v186 + 16)
      || (v28 = swift_retain(), sub_244EB9538(v28), v30 = v29, swift_release(), (v30 & 1) == 0))
    {
      v32 = swift_retain();
      MEMORY[0x249529AE4](v32);
      v5 = v181;
      v6 = v182;
      v9 = v183;
      v14 = v188;
      if (*(_QWORD *)((v194[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v194[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_244EE1E98();
      sub_244EE1EA4();
      sub_244EE1E8C();
      swift_release();
      swift_release();
      swift_release();
      goto LABEL_32;
    }
    v31 = v19;
    swift_release();
    v19 = sub_244EE1730();
    v20 = v31;
    v9 = v183;
    v14 = v188;
    if (!v19)
      goto LABEL_31;
  }
  swift_bridgeObjectRetain_n();
  v22 = sub_244EE209C();
  swift_bridgeObjectRelease();
  if (!v22)
    goto LABEL_25;
LABEL_17:
  v23 = 4;
  while (1)
  {
    v24 = v23 - 4;
    if ((v21 & 0xC000000000000001) == 0)
      break;
    v25 = MEMORY[0x249529C58](v23 - 4, v21);
    v26 = v23 - 3;
    if (__OFADD__(v24, 1))
      goto LABEL_185;
LABEL_23:
    v193[0] = v25;
    v192[0] = v19;
    sub_244EBEF9C(&qword_25742AF10, (uint64_t (*)(uint64_t))MEMORY[0x24BDE71E8], MEMORY[0x24BDE7200]);
    v27 = sub_244EE1DD8();
    swift_release();
    if ((v27 & 1) != 0)
    {
      swift_bridgeObjectRelease_n();
      swift_release();
      swift_release();
      swift_release();
      v5 = v181;
      v6 = v182;
      v9 = v183;
      v15 = v178;
      a3 = v179;
      v14 = v188;
      goto LABEL_6;
    }
    ++v23;
    if (v26 == v22)
      goto LABEL_25;
  }
  v25 = *(_QWORD *)(v21 + 8 * v23);
  swift_retain();
  v26 = v23 - 3;
  if (!__OFADD__(v24, 1))
    goto LABEL_23;
LABEL_185:
  __break(1u);
LABEL_186:
  __break(1u);
LABEL_187:
  __break(1u);
LABEL_188:
  __break(1u);
LABEL_189:
  __break(1u);
LABEL_190:
  __break(1u);
LABEL_191:
  __break(1u);
LABEL_192:
  __break(1u);
LABEL_193:
  __break(1u);
LABEL_194:
  __break(1u);
LABEL_195:
  __break(1u);
LABEL_196:
  __break(1u);
LABEL_197:
  __break(1u);
LABEL_198:
  __break(1u);
LABEL_199:
  __break(1u);
LABEL_200:
  __break(1u);
LABEL_201:
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24952A0D8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_244EBEDF4()
{
  unint64_t result;

  result = qword_25742AEB0;
  if (!qword_25742AEB0)
  {
    result = MEMORY[0x24952A0F0](MEMORY[0x24BEE3FC8], MEMORY[0x24BEE3F88]);
    atomic_store(result, (unint64_t *)&qword_25742AEB0);
  }
  return result;
}

uint64_t sub_244EBEE3C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_244EBEECC(uint64_t a1, uint64_t a2)
{
  assignWithTake for Metrics(a2, a1);
  return a2;
}

unint64_t sub_244EBEF0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25742AF28;
  if (!qword_25742AF28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742AF20);
    result = MEMORY[0x24952A0F0](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_25742AF28);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24952A0E4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_244EBEF9C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24952A0F0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t RealityKitHierarchyExporter.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t RealityKitHierarchyExporter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_244EBEFF4()
{
  return swift_allocObject();
}

uint64_t sub_244EBF004()
{
  uint64_t v0;

  return v0;
}

uint64_t static RealityKitHierarchyExporter.exportDebugRepresentation(for:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(_QWORD *, _QWORD);
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  uint64_t v14;

  v2 = sub_244EE1850();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EE1874();
  sub_244EE185C();
  swift_release();
  sub_244EBF3CC();
  v6 = sub_244EE1ED4();
  v7 = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v8 = v6;
    v14 = MEMORY[0x24BEE4AF8];
    sub_244EE2030();
    sub_244EE1EC8();
    if (v8 < 0)
    {
      __break(1u);
      goto LABEL_11;
    }
    do
    {
      v9 = (void (*)(_QWORD *, _QWORD))sub_244EE1F04();
      swift_retain();
      v9(v13, 0);
      sub_244EE2018();
      sub_244EE203C();
      sub_244EE2048();
      sub_244EE2024();
      sub_244EE1EF8();
      --v8;
    }
    while (v8);
    v10 = v14;
  }
  else
  {
    v10 = MEMORY[0x24BEE4AF8];
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  a1 = (void *)sub_244EBF204(v10, a1);
  swift_bridgeObjectRelease();
  v13[0] = v7;
  if (a1)
  {
    v11 = a1;
    MEMORY[0x249529AE4]();
    if (*(_QWORD *)((v13[0] & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((v13[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    {
LABEL_8:
      sub_244EE1EA4();
      sub_244EE1E8C();
      v7 = v13[0];
      goto LABEL_9;
    }
LABEL_11:
    sub_244EE1E98();
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

uint64_t sub_244EBF204(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  _QWORD v25[4];

  v4 = sub_244EE1700();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v25 - v9;
  sub_244EE16F4();
  type metadata accessor for SceneDebugRepresentationProvider();
  sub_244EC390C();
  v11 = sub_244ECAE98(a1, a2);
  v13 = v12;
  v14 = swift_release();
  if (v13 >> 60 == 15)
    v15 = 0;
  else
    v15 = v11;
  if (v13 >> 60 == 15)
    v16 = 0xC000000000000000;
  else
    v16 = v13;
  v25[2] = v16;
  v25[3] = v15;
  nullsub_1(v14);
  v17 = sub_244ECECC8(a1, a2);
  if (v18 >> 60 == 15)
    v19 = 0;
  else
    v19 = v17;
  v25[1] = v19;
  type metadata accessor for InspectorSceneStatisticsProvider();
  v20 = sub_244EBEFF4();
  (*(void (**)(uint64_t, void *))(*(_QWORD *)v20 + 80))(a1, a2);
  v21 = swift_release();
  nullsub_1(v21);
  sub_244EC2914(a1, a2);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  v22 = objc_allocWithZone((Class)sub_244EE1AA8());
  v23 = sub_244EE1A9C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  return v23;
}

unint64_t sub_244EBF3CC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25742AF48;
  if (!qword_25742AF48)
  {
    v1 = sub_244EE1850();
    result = MEMORY[0x24952A0F0](MEMORY[0x24BDE6EC8], v1);
    atomic_store(result, (unint64_t *)&qword_25742AF48);
  }
  return result;
}

uint64_t type metadata accessor for RealityKitHierarchyExporter()
{
  return objc_opt_self();
}

uint64_t method lookup function for RealityKitHierarchyExporter()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_244EBF440()
{
  sub_244EE1A30();
  return sub_244EE1D00();
}

BOOL sub_244EBF464()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  _BOOL8 v4;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AFE8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EE1A30();
  sub_244EE1D00();
  v3 = sub_244EE1D18();
  v4 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 48))(v2, 1, v3) != 1;
  sub_244EBFC74((uint64_t)v2, &qword_25742AFE8);
  return v4;
}

uint64_t sub_244EBF508()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_244EE1724();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EE1880();
  sub_244EE1718();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_244EE1DFC();
  REEntitySetName();
  return swift_release();
}

uint64_t (*sub_244EBF5D0())()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*result)();
  uint64_t (*v34)(_QWORD *, _QWORD);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[4];
  uint64_t v52;
  unint64_t v53;

  v1 = v0;
  v2 = sub_244EE1A0C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_244EE1724();
  v6 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AFE8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EE1A30();
  sub_244EE1D00();
  v15 = sub_244EE1D18();
  v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 48))(v14, 1, v15);
  sub_244EBFC74((uint64_t)v14, &qword_25742AFE8);
  if (v16 != 1)
    return (uint64_t (*)())nullsub_1;
  v49 = v3;
  v17 = sub_244EE1A30();
  v47 = v18;
  v48 = v17;
  v51[0] = sub_244EE1A30();
  v51[1] = v19;
  v52 = 58;
  v53 = 0xE100000000000000;
  v20 = sub_244EE170C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v11, 1, 1, v20);
  sub_244EBFC30();
  sub_244EE1F70();
  v22 = v21;
  sub_244EBFC74((uint64_t)v11, &qword_25742AFF0);
  swift_bridgeObjectRelease();
  if ((v22 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    v23 = sub_244EE1E44();
    v25 = v24;
    v27 = v26;
    v29 = v28;
    swift_bridgeObjectRelease();
    MEMORY[0x249529A78](v23, v25, v27, v29);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_244EE1A24();
  sub_244EE1CE8();
  swift_bridgeObjectRelease();
  sub_244EE1880();
  sub_244EE1718();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v50);
  sub_244EE1DFC();
  REEntitySetName();
  swift_bridgeObjectRelease();
  swift_release();
  sub_244EE1A6C();
  sub_244EE173C();
  sub_244EBFCB0();
  v30 = sub_244EE1ED4();
  v31 = MEMORY[0x24BEE4AF8];
  if (!v30)
    goto LABEL_14;
  v32 = v30;
  v52 = MEMORY[0x24BEE4AF8];
  sub_244EC0358(0, v30 & ~(v30 >> 63), 0);
  result = (uint64_t (*)())sub_244EE1EC8();
  if ((v32 & 0x8000000000000000) == 0)
  {
    v50 = v1;
    do
    {
      v34 = (uint64_t (*)(_QWORD *, _QWORD))sub_244EE1F04();
      swift_retain();
      v35 = v34(v51, 0);
      v36 = sub_244EBF5D0(v35);
      v38 = v37;
      v39 = swift_allocObject();
      *(_QWORD *)(v39 + 16) = v36;
      *(_QWORD *)(v39 + 24) = v38;
      swift_release();
      v31 = v52;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_244EC0358(0, *(_QWORD *)(v31 + 16) + 1, 1);
        v31 = v52;
      }
      v41 = *(_QWORD *)(v31 + 16);
      v40 = *(_QWORD *)(v31 + 24);
      if (v41 >= v40 >> 1)
      {
        sub_244EC0358((_QWORD *)(v40 > 1), v41 + 1, 1);
        v31 = v52;
      }
      *(_QWORD *)(v31 + 16) = v41 + 1;
      v42 = v31 + 16 * v41;
      *(_QWORD *)(v42 + 32) = sub_244EC0398;
      *(_QWORD *)(v42 + 40) = v39;
      sub_244EE1EF8();
      --v32;
    }
    while (v32);
LABEL_14:
    (*(void (**)(char *, uint64_t))(v49 + 8))(v5, v2);
    v43 = swift_allocObject();
    swift_weakInit();
    v44 = (_QWORD *)swift_allocObject();
    v45 = v48;
    v44[2] = v43;
    v44[3] = v45;
    v44[4] = v47;
    v44[5] = v31;
    return sub_244EC0410;
  }
  __break(1u);
  return result;
}

uint64_t sub_244EBFAC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[4];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AFF0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[2] = a1;
  v18[3] = a2;
  v18[0] = 58;
  v18[1] = 0xE100000000000000;
  v7 = sub_244EE170C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_244EBFC30();
  sub_244EE1F70();
  v9 = v8;
  sub_244EBFC74((uint64_t)v6, &qword_25742AFF0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if ((v9 & 1) == 0)
  {
    v10 = sub_244EE1E44();
    v12 = v11;
    v14 = v13;
    v16 = v15;
    swift_bridgeObjectRelease();
    a1 = MEMORY[0x249529A78](v10, v12, v14, v16);
    swift_bridgeObjectRelease();
  }
  return a1;
}

unint64_t sub_244EBFC30()
{
  unint64_t result;

  result = qword_25742AFF8;
  if (!qword_25742AFF8)
  {
    result = MEMORY[0x24952A0F0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25742AFF8);
  }
  return result;
}

uint64_t sub_244EBFC74(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_244EBFCB0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25742AF38;
  if (!qword_25742AF38)
  {
    v1 = sub_244EE1A0C();
    result = MEMORY[0x24952A0F0](MEMORY[0x24BDE7150], v1);
    atomic_store(result, (unint64_t *)&qword_25742AF38);
  }
  return result;
}

uint64_t sub_244EBFCF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  v5 = sub_244EE1724();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_244EE1880();
    sub_244EE1718();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_244EE1DFC();
    REEntitySetName();
    swift_release();
    result = swift_release();
  }
  v10 = *(_QWORD *)(a4 + 16);
  if (v10)
  {
    swift_bridgeObjectRetain();
    v11 = a4 + 40;
    do
    {
      v12 = *(void (**)(uint64_t))(v11 - 8);
      v13 = swift_retain();
      v12(v13);
      swift_release();
      v11 += 16;
      --v10;
    }
    while (v10);
    return swift_bridgeObjectRelease();
  }
  return result;
}

Swift::Void __swiftcall Entity.removePersistentIDFromName(recursive:)(Swift::Bool recursive)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;

  v13 = recursive;
  v1 = sub_244EE1A0C();
  MEMORY[0x24BDAC7A8](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AF30);
  v12 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_244EE1724();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EE1A30();
  sub_244EE1CF4();
  v10 = v9;
  swift_bridgeObjectRelease();
  if (v10)
  {
    sub_244EE1880();
    sub_244EE1718();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_244EE1DFC();
    REEntitySetName();
    swift_bridgeObjectRelease();
    swift_release();
  }
  if (v13)
  {
    sub_244EE1A6C();
    sub_244EE173C();
    sub_244EE19F4();
    while (1)
    {
      sub_244EE1A00();
      if (!v14)
        break;
      Entity.removePersistentIDFromName(recursive:)(1);
      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v4, v2);
  }
}

uint64_t Entity.augmentedWithPersistentIDs(_:)(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t (*v3)();
  uint64_t v4;

  v3 = sub_244EBF5D0();
  v4 = a1(v1);
  ((void (*)(uint64_t))v3)(v4);
  return swift_release();
}

uint64_t Entity.augmentedWithPersistentIDs<A>(_:)(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t (*v3)();
  uint64_t v4;

  v3 = sub_244EBF5D0();
  v4 = a1(v1);
  ((void (*)(uint64_t))v3)(v4);
  return swift_release();
}

uint64_t sub_244EC010C()
{
  uint64_t v0;
  char v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B000);
  if (sub_244EE1DF0() == 0xD000000000000014 && v0 == 0x8000000244EE39F0)
  {
    swift_bridgeObjectRelease();
    v1 = 1;
  }
  else
  {
    v1 = sub_244EE2114();
    swift_bridgeObjectRelease();
  }
  return v1 & 1;
}

uint64_t sub_244EC01BC()
{
  char v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B000);
  sub_244EE1DF0();
  sub_244EC041C();
  sub_244EC0460();
  v0 = sub_244EE1DCC();
  swift_bridgeObjectRelease();
  return v0 & 1;
}

uint64_t sub_244EC0264(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD v11[4];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AFF0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[2] = a1;
  v11[3] = a2;
  v11[0] = 58;
  v11[1] = 0xE100000000000000;
  v7 = sub_244EE170C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  sub_244EBFC30();
  sub_244EE1F70();
  v9 = v8 & 1;
  sub_244EBFC74((uint64_t)v6, &qword_25742AFF0);
  swift_bridgeObjectRelease();
  return v9;
}

_QWORD *sub_244EC0358(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_244EC04A4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t sub_244EC0374()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244EC0398()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_244EC03B8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_244EC03DC()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_244EC0410()
{
  uint64_t *v0;

  return sub_244EBFCF8(v0[2], v0[3], v0[4], v0[5]);
}

unint64_t sub_244EC041C()
{
  unint64_t result;

  result = qword_25742B008;
  if (!qword_25742B008)
  {
    result = MEMORY[0x24952A0F0](MEMORY[0x24BEE0D18], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25742B008);
  }
  return result;
}

unint64_t sub_244EC0460()
{
  unint64_t result;

  result = qword_25742B010;
  if (!qword_25742B010)
  {
    result = MEMORY[0x24952A0F0](MEMORY[0x24BEE5E60], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25742B010);
  }
  return result;
}

_QWORD *sub_244EC04A4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742B018);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742B020);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_244EC05C4()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_244EC05F8(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_244EC063C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244EC0678()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_244EC06AC(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_244EC06F0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_244EC0730()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_244EC073C(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = swift_allocObject();
  v3 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + 16) = sub_244EC08A0(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v2 + 24) = sub_244EC08A0(v3);
  swift_beginAccess();
  swift_beginAccess();
  sub_244EB72E4(a1, (uint64_t *)(v2 + 16), (uint64_t *)(v2 + 24));
  swift_endAccess();
  swift_endAccess();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_244EC07F8(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v1 + 16) = sub_244EC08A0(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v1 + 24) = sub_244EC08A0(v3);
  swift_beginAccess();
  swift_beginAccess();
  sub_244EB72E4(a1, (uint64_t *)(v1 + 16), (uint64_t *)(v1 + 24));
  swift_endAccess();
  swift_endAccess();
  swift_bridgeObjectRelease();
  return v1;
}

_QWORD *sub_244EC08A0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  char v12;
  _QWORD __dst[39];

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_11;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AEF8);
  v2 = (_QWORD *)sub_244EE20C0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    return v2;
  }
  swift_retain();
  memcpy(__dst, (const void *)(a1 + 32), 0x130uLL);
  v4 = __dst[0];
  sub_244EC2740((uint64_t)__dst);
  v5 = sub_244EB9538(v4);
  if ((v6 & 1) != 0)
  {
LABEL_8:
    __break(1u);
LABEL_9:
    swift_release();
    goto LABEL_11;
  }
  v7 = 336;
  while (1)
  {
    *(_QWORD *)((char *)v2 + ((v5 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v5;
    *(_QWORD *)(v2[6] + 8 * v5) = v4;
    result = memcpy((void *)(v2[7] + 296 * v5), &__dst[1], 0x128uLL);
    v9 = v2[2];
    v10 = __OFADD__(v9, 1);
    v11 = v9 + 1;
    if (v10)
      break;
    v2[2] = v11;
    if (!--v3)
      goto LABEL_9;
    memcpy(__dst, (const void *)(a1 + v7), 0x130uLL);
    v4 = __dst[0];
    sub_244EC2740((uint64_t)__dst);
    v5 = sub_244EB9538(v4);
    v7 += 304;
    if ((v12 & 1) != 0)
      goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t sub_244EC0A04@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  __int128 v24;
  char v25;
  char v26;
  uint64_t result;
  char v28;
  char v29;
  uint64_t v30;
  char v31;
  int v32;
  char v33;
  int v34;
  char v35;
  char v36;
  char v37;
  char v38;
  uint64_t v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  uint64_t v56;
  void (*v57)(unint64_t *, _QWORD);
  char v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  uint64_t v73;
  int v74;
  int v75;
  int v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v81;
  int v82;
  uint64_t v83;
  int v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  int v90;
  unint64_t v91;
  int v92;
  unint64_t v93[4];
  uint64_t v94;
  _BYTE __dst[296];
  char v96;
  char v97;
  char v98;
  char v99;
  char v100;
  char v101;
  char v102;
  char v103;
  char v104;
  char v105;
  char v106;
  char v107;
  char v108;
  char v109;
  char v110;
  char v111;
  char v112;
  char v113;
  char v114;
  char v115;
  char v116;
  char v117;
  _QWORD __src[37];
  _BYTE v119[296];
  _BYTE v120[296];
  _QWORD v121[38];

  v6 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 96);
  v7 = swift_retain();
  v8 = v6(v7);
  if (*(_QWORD *)(v8 + 16) && (v9 = sub_244EB9538(a1), (v10 & 1) != 0))
  {
    memcpy(__dst, (const void *)(*(_QWORD *)(v8 + 56) + 296 * v9), sizeof(__dst));
    sub_244EBEE3C((uint64_t)__dst);
    swift_release();
    swift_bridgeObjectRelease();
    v11 = memcpy(__src, __dst, sizeof(__src));
    v12 = sub_244ECDDF8(v11);
    if (a2 >> 62)
      goto LABEL_40;
    v13 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    while (v13)
    {
      if (v12 >> 62)
      {
LABEL_42:
        swift_bridgeObjectRetain();
        v14 = sub_244EE209C();
        swift_bridgeObjectRelease();
      }
      else
      {
        v14 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      v15 = 0;
      v89 = a2;
      v91 = a2 & 0xC000000000000001;
      v81 = a2 + 32;
      v83 = a2 & 0xFFFFFFFFFFFFFF8;
      v87 = v13;
      while (1)
      {
        if (v91)
        {
          v46 = MEMORY[0x249529C58](v15, a2);
          v47 = __OFADD__(v15++, 1);
          if (v47)
            break;
          goto LABEL_17;
        }
        if (v15 >= *(_QWORD *)(v83 + 16))
          goto LABEL_39;
        v46 = *(_QWORD *)(v81 + 8 * v15);
        swift_retain();
        v47 = __OFADD__(v15++, 1);
        if (v47)
          break;
LABEL_17:
        if (v14)
        {
          sub_244EE1A6C();
          swift_bridgeObjectRetain();
          v48 = 4;
          while (1)
          {
            v49 = v48 - 4;
            if ((v12 & 0xC000000000000001) != 0)
            {
              a2 = MEMORY[0x249529C58](v48 - 4, v12);
              v50 = v48 - 3;
              if (__OFADD__(v49, 1))
                goto LABEL_37;
            }
            else
            {
              a2 = *(_QWORD *)(v12 + 8 * v48);
              swift_retain();
              v50 = v48 - 3;
              if (__OFADD__(v49, 1))
              {
LABEL_37:
                __break(1u);
                goto LABEL_38;
              }
            }
            v93[0] = a2;
            v94 = v46;
            sub_244EC2594(&qword_25742AF10, MEMORY[0x24BDE7200]);
            v51 = sub_244EE1DD8();
            swift_release();
            if ((v51 & 1) != 0)
              break;
            ++v48;
            if (v50 == v14)
            {
              swift_release();
              swift_bridgeObjectRelease();
              goto LABEL_34;
            }
          }
          swift_bridgeObjectRelease();
          v52 = swift_retain();
          v53 = v6(v52);
          if (*(_QWORD *)(v53 + 16))
          {
            v54 = sub_244EB9538(v46);
            if ((v55 & 1) != 0)
            {
              memcpy(v120, (const void *)(*(_QWORD *)(v53 + 56) + 296 * v54), sizeof(v120));
              sub_244EBEE3C((uint64_t)v120);
              swift_release();
              swift_bridgeObjectRelease();
              memcpy(v121, __src, 0x128uLL);
              sub_244ED3794((unint64_t)v120, (uint64_t)v119);
              sub_244EBBA84((uint64_t)v120);
              sub_244EBBA84((uint64_t)v121);
              memcpy(__src, v119, sizeof(__src));
              sub_244ED3F24();
              swift_beginAccess();
              swift_retain();
              v57 = (void (*)(unint64_t *, _QWORD))swift_modifyAtWritableKeyPath();
              v13 = v87;
              a2 = v89;
              if ((*(_BYTE *)(v56 + 4) & 1) != 0)
              {
LABEL_9:
                v57(v93, 0);
                swift_release();
                goto LABEL_10;
              }
              if (!__OFSUB__(*(_DWORD *)v56, 1))
              {
                --*(_DWORD *)v56;
                goto LABEL_9;
              }
              __break(1u);
              goto LABEL_42;
            }
          }
          swift_bridgeObjectRelease();
          swift_release_n();
LABEL_34:
          v13 = v87;
          a2 = v89;
          if (v15 == v87)
            goto LABEL_35;
        }
        else
        {
LABEL_10:
          swift_release();
          if (v15 == v13)
            goto LABEL_35;
        }
      }
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      swift_bridgeObjectRetain();
      v13 = sub_244EE209C();
    }
LABEL_35:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v45 = BYTE4(__src[0]);
    v41 = BYTE4(__src[1]);
    v70 = __src[1];
    v71 = __src[2];
    v42 = BYTE4(__src[2]);
    v66 = __src[3];
    v67 = __src[0];
    v43 = BYTE4(__src[3]);
    v44 = BYTE4(__src[4]);
    v28 = BYTE4(__src[6]);
    v65 = __src[7];
    result = BYTE4(__src[7]);
    v62 = __src[8];
    v63 = __src[4];
    v26 = BYTE4(__src[8]);
    v59 = __src[5];
    v60 = __src[9];
    v25 = __src[10];
    v24 = *(_OWORD *)&__src[11];
    v68 = __src[6];
    v69 = __src[13];
    v36 = BYTE4(__src[13]);
    v64 = __src[14];
    v37 = BYTE4(__src[14]);
    v61 = __src[15];
    v38 = BYTE4(__src[15]);
    v39 = __src[16];
    v40 = __src[17];
    v92 = __src[18];
    v31 = BYTE4(__src[32]);
    v29 = __src[35];
    v19 = BYTE4(__src[19]);
    v76 = __src[20];
    v77 = __src[19];
    v20 = BYTE4(__src[20]);
    v21 = BYTE4(__src[21]);
    v74 = __src[22];
    v75 = __src[21];
    v22 = BYTE4(__src[22]);
    v73 = __src[23];
    v72 = __src[24];
    v23 = BYTE4(__src[24]);
    v32 = __src[25];
    v33 = BYTE4(__src[25]);
    v34 = __src[26];
    v35 = BYTE4(__src[26]);
    v85 = __src[28];
    v58 = BYTE4(__src[28]);
    v84 = __src[29];
    v16 = BYTE4(__src[29]);
    v82 = __src[30];
    v17 = BYTE4(__src[30]);
    v78 = __src[27];
    v79 = __src[31];
    v90 = __src[32];
    v30 = __src[33];
    v88 = __src[34];
    v86 = __src[36];
    v18 = BYTE4(__src[18]);
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_244ECFB74((uint64_t)v121);
    v90 = v121[32];
    v120[0] = BYTE4(v121[32]);
    v119[0] = v121[35];
    v86 = v121[36];
    v88 = v121[34];
    v85 = v121[28];
    v58 = BYTE4(v121[28]);
    v84 = v121[29];
    v16 = BYTE4(v121[29]);
    v82 = v121[30];
    v17 = BYTE4(v121[30]);
    v78 = v121[27];
    v79 = v121[31];
    v92 = v121[18];
    v18 = BYTE4(v121[18]);
    v77 = v121[19];
    v19 = BYTE4(v121[19]);
    v76 = v121[20];
    v20 = BYTE4(v121[20]);
    v75 = v121[21];
    v21 = BYTE4(v121[21]);
    v74 = v121[22];
    v22 = BYTE4(v121[22]);
    v73 = v121[23];
    v72 = v121[24];
    v23 = BYTE4(v121[24]);
    v24 = *(_OWORD *)&v121[11];
    v25 = v121[10] & 1;
    v26 = BYTE4(v121[8]) & 1;
    result = BYTE4(v121[7]) & 1;
    v28 = BYTE4(v121[6]) & 1;
    v29 = v121[35] & 1;
    v30 = v121[33];
    v31 = BYTE4(v121[32]) & 1;
    v32 = v121[25];
    v33 = BYTE4(v121[25]);
    v34 = v121[26];
    v35 = BYTE4(v121[26]);
    v69 = v121[13];
    v36 = BYTE4(v121[13]);
    v64 = v121[14];
    v37 = BYTE4(v121[14]);
    v61 = v121[15];
    v38 = BYTE4(v121[15]);
    v39 = v121[16];
    v40 = v121[17];
    v68 = v121[6];
    v65 = v121[7];
    v62 = v121[8];
    v60 = v121[9];
    v70 = v121[1];
    v41 = BYTE4(v121[1]);
    v71 = v121[2];
    v42 = BYTE4(v121[2]);
    v66 = v121[3];
    v43 = BYTE4(v121[3]);
    v63 = v121[4];
    v44 = BYTE4(v121[4]);
    v59 = v121[5];
    v67 = v121[0];
    v45 = BYTE4(v121[0]);
  }
  LOBYTE(__src[0]) = v45;
  __dst[0] = v41;
  LOBYTE(v93[0]) = v42;
  LOBYTE(v94) = v43;
  v117 = v44;
  v116 = v28;
  v115 = result;
  v114 = v26;
  v113 = v25;
  v112 = v36;
  v111 = v37;
  v110 = v38;
  v109 = v40;
  v108 = v18;
  v107 = v19;
  v106 = v20;
  v105 = v21;
  v104 = v22;
  v103 = v23;
  v102 = v33;
  v101 = v35;
  v100 = v58;
  v99 = v16;
  v98 = v17;
  v97 = v31;
  v96 = v29;
  *(_DWORD *)a3 = v67;
  *(_DWORD *)(a3 + 8) = v70;
  *(_BYTE *)(a3 + 4) = __src[0];
  *(_BYTE *)(a3 + 12) = __dst[0];
  *(_DWORD *)(a3 + 16) = v71;
  *(_BYTE *)(a3 + 20) = v93[0];
  *(_DWORD *)(a3 + 24) = v66;
  *(_BYTE *)(a3 + 28) = v94;
  *(_DWORD *)(a3 + 32) = v63;
  *(_BYTE *)(a3 + 36) = v117;
  *(_QWORD *)(a3 + 40) = v59;
  *(_DWORD *)(a3 + 48) = v68;
  *(_BYTE *)(a3 + 52) = v116;
  *(_DWORD *)(a3 + 56) = v65;
  *(_BYTE *)(a3 + 60) = v115;
  *(_DWORD *)(a3 + 64) = v62;
  *(_BYTE *)(a3 + 68) = v114;
  *(_QWORD *)(a3 + 72) = v60;
  *(_BYTE *)(a3 + 80) = v113;
  *(_OWORD *)(a3 + 88) = v24;
  *(_DWORD *)(a3 + 104) = v69;
  *(_BYTE *)(a3 + 108) = v112;
  *(_DWORD *)(a3 + 112) = v64;
  *(_BYTE *)(a3 + 116) = v111;
  *(_DWORD *)(a3 + 120) = v61;
  *(_BYTE *)(a3 + 124) = v110;
  *(_QWORD *)(a3 + 128) = v39;
  *(_BYTE *)(a3 + 136) = v109;
  *(_DWORD *)(a3 + 144) = v92;
  *(_BYTE *)(a3 + 148) = v108;
  *(_DWORD *)(a3 + 152) = v77;
  *(_BYTE *)(a3 + 156) = v107;
  *(_DWORD *)(a3 + 160) = v76;
  *(_BYTE *)(a3 + 164) = v106;
  *(_DWORD *)(a3 + 168) = v75;
  *(_BYTE *)(a3 + 172) = v105;
  *(_DWORD *)(a3 + 176) = v74;
  *(_BYTE *)(a3 + 180) = v104;
  *(_QWORD *)(a3 + 184) = v73;
  *(_DWORD *)(a3 + 192) = v72;
  *(_BYTE *)(a3 + 196) = v103;
  *(_DWORD *)(a3 + 200) = v32;
  *(_BYTE *)(a3 + 204) = v102;
  *(_DWORD *)(a3 + 208) = v34;
  *(_BYTE *)(a3 + 212) = v101;
  *(_QWORD *)(a3 + 216) = v78;
  *(_DWORD *)(a3 + 224) = v85;
  *(_BYTE *)(a3 + 228) = v100;
  *(_DWORD *)(a3 + 232) = v84;
  *(_BYTE *)(a3 + 236) = v99;
  *(_DWORD *)(a3 + 240) = v82;
  *(_BYTE *)(a3 + 244) = v98;
  *(_QWORD *)(a3 + 248) = v79;
  *(_DWORD *)(a3 + 256) = v90;
  *(_BYTE *)(a3 + 260) = v97;
  *(_QWORD *)(a3 + 264) = v30;
  *(_QWORD *)(a3 + 272) = v88;
  *(_BYTE *)(a3 + 280) = v96;
  *(_QWORD *)(a3 + 288) = v86;
  return result;
}

void *sub_244EC12E8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  _BYTE __src[296];

  sub_244EC1E64(a1, __src);
  return memcpy(a2, __src, 0x128uLL);
}

uint64_t sub_244EC1324@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  __int128 v10;
  uint64_t result;
  int v12;
  char v13;
  int v14;
  char v15;
  int v16;
  char v17;
  uint64_t v18;
  char v19;
  int v20;
  char v21;
  int v22;
  char v23;
  int v24;
  char v25;
  uint64_t v26;
  char v27;
  int v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  char v33;
  char v34;
  char v35;
  int v36;
  int v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  int v45;
  char v46;
  uint64_t v47;
  int v48;
  char v49;
  int v50;
  int v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  int v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  char v63;
  char v64;
  char v65;
  char v66;
  char v67;
  _QWORD __dst[37];
  char v69;
  char v70;

  v5 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 120);
  v6 = swift_retain();
  v7 = v5(v6);
  if (*(_QWORD *)(v7 + 16) && (v8 = sub_244EB9538(a1), (v9 & 1) != 0))
  {
    memcpy(__dst, (const void *)(*(_QWORD *)(v7 + 56) + 296 * v8), sizeof(__dst));
    sub_244EBEE3C((uint64_t)__dst);
    swift_release();
    swift_bridgeObjectRelease();
    v62 = __dst[32];
    v60 = __dst[34];
    v61 = __dst[33];
    v34 = __dst[35];
    v35 = BYTE4(__dst[32]);
    v59 = __dst[36];
    v49 = BYTE4(__dst[28]);
    v57 = __dst[29];
    v58 = __dst[28];
    v46 = BYTE4(__dst[29]);
    v56 = __dst[30];
    v54 = __dst[27];
    v55 = __dst[31];
    v43 = BYTE4(__dst[18]);
    v44 = BYTE4(__dst[30]);
    v52 = __dst[19];
    v53 = __dst[18];
    v41 = BYTE4(__dst[20]);
    v42 = BYTE4(__dst[19]);
    v50 = __dst[21];
    v51 = __dst[20];
    v48 = __dst[22];
    v39 = BYTE4(__dst[22]);
    v40 = BYTE4(__dst[21]);
    v47 = __dst[23];
    v45 = __dst[24];
    v37 = __dst[25];
    v38 = BYTE4(__dst[24]);
    v33 = BYTE4(__dst[25]);
    v36 = __dst[26];
    v10 = *(_OWORD *)&__dst[11];
    result = BYTE4(__dst[26]);
    v12 = __dst[13];
    v13 = BYTE4(__dst[13]);
    v14 = __dst[14];
    v15 = BYTE4(__dst[14]);
    v16 = __dst[15];
    v17 = BYTE4(__dst[15]);
    v18 = __dst[16];
    v19 = __dst[17];
    v20 = __dst[6];
    v21 = BYTE4(__dst[6]);
    v22 = __dst[7];
    v23 = BYTE4(__dst[7]);
    v24 = __dst[8];
    v25 = BYTE4(__dst[8]);
    v26 = __dst[9];
    v27 = __dst[10];
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    sub_244EC1E64(a1, __dst);
    v62 = __dst[32];
    v70 = BYTE4(__dst[32]);
    v60 = __dst[34];
    v61 = __dst[33];
    v69 = __dst[35];
    v59 = __dst[36];
    v49 = BYTE4(__dst[28]);
    v57 = __dst[29];
    v58 = __dst[28];
    v46 = BYTE4(__dst[29]);
    v56 = __dst[30];
    v55 = __dst[31];
    v54 = __dst[27];
    v53 = __dst[18];
    v43 = BYTE4(__dst[18]);
    v44 = BYTE4(__dst[30]);
    v42 = BYTE4(__dst[19]);
    v51 = __dst[20];
    v52 = __dst[19];
    v50 = __dst[21];
    v40 = BYTE4(__dst[21]);
    v41 = BYTE4(__dst[20]);
    v48 = __dst[22];
    v47 = __dst[23];
    v45 = __dst[24];
    v38 = BYTE4(__dst[24]);
    v39 = BYTE4(__dst[22]);
    v10 = *(_OWORD *)&__dst[11];
    v27 = __dst[10] & 1;
    v25 = BYTE4(__dst[8]) & 1;
    v23 = BYTE4(__dst[7]) & 1;
    v21 = BYTE4(__dst[6]) & 1;
    v34 = __dst[35] & 1;
    v35 = BYTE4(__dst[32]) & 1;
    v33 = BYTE4(__dst[25]);
    v36 = __dst[26];
    v37 = __dst[25];
    result = BYTE4(__dst[26]);
    v12 = __dst[13];
    v13 = BYTE4(__dst[13]);
    v14 = __dst[14];
    v15 = BYTE4(__dst[14]);
    v16 = __dst[15];
    v17 = BYTE4(__dst[15]);
    v18 = __dst[16];
    v19 = __dst[17];
    v20 = __dst[6];
    v22 = __dst[7];
    v24 = __dst[8];
    v26 = __dst[9];
  }
  v28 = __dst[1];
  v29 = __dst[2];
  v30 = __dst[3];
  v31 = __dst[4];
  v32 = __dst[5];
  v67 = BYTE4(__dst[0]);
  v66 = BYTE4(__dst[1]);
  v65 = BYTE4(__dst[2]);
  v64 = BYTE4(__dst[3]);
  v63 = BYTE4(__dst[4]);
  *(_DWORD *)a2 = __dst[0];
  *(_DWORD *)(a2 + 8) = v28;
  *(_BYTE *)(a2 + 4) = v67;
  *(_BYTE *)(a2 + 12) = v66;
  *(_DWORD *)(a2 + 16) = v29;
  *(_BYTE *)(a2 + 20) = v65;
  *(_DWORD *)(a2 + 24) = v30;
  *(_BYTE *)(a2 + 28) = v64;
  *(_DWORD *)(a2 + 32) = v31;
  *(_BYTE *)(a2 + 36) = v63;
  *(_QWORD *)(a2 + 40) = v32;
  *(_DWORD *)(a2 + 48) = v20;
  *(_BYTE *)(a2 + 52) = v21;
  *(_DWORD *)(a2 + 56) = v22;
  *(_BYTE *)(a2 + 60) = v23;
  *(_DWORD *)(a2 + 64) = v24;
  *(_BYTE *)(a2 + 68) = v25;
  *(_QWORD *)(a2 + 72) = v26;
  *(_BYTE *)(a2 + 80) = v27;
  *(_OWORD *)(a2 + 88) = v10;
  *(_DWORD *)(a2 + 104) = v12;
  *(_BYTE *)(a2 + 108) = v13;
  *(_DWORD *)(a2 + 112) = v14;
  *(_BYTE *)(a2 + 116) = v15;
  *(_DWORD *)(a2 + 120) = v16;
  *(_BYTE *)(a2 + 124) = v17;
  *(_QWORD *)(a2 + 128) = v18;
  *(_BYTE *)(a2 + 136) = v19;
  *(_DWORD *)(a2 + 144) = v53;
  *(_BYTE *)(a2 + 148) = v43;
  *(_DWORD *)(a2 + 152) = v52;
  *(_BYTE *)(a2 + 156) = v42;
  *(_DWORD *)(a2 + 160) = v51;
  *(_BYTE *)(a2 + 164) = v41;
  *(_DWORD *)(a2 + 168) = v50;
  *(_BYTE *)(a2 + 172) = v40;
  *(_DWORD *)(a2 + 176) = v48;
  *(_BYTE *)(a2 + 180) = v39;
  *(_QWORD *)(a2 + 184) = v47;
  *(_DWORD *)(a2 + 192) = v45;
  *(_BYTE *)(a2 + 196) = v38;
  *(_DWORD *)(a2 + 200) = v37;
  *(_BYTE *)(a2 + 204) = v33;
  *(_DWORD *)(a2 + 208) = v36;
  *(_BYTE *)(a2 + 212) = result;
  *(_QWORD *)(a2 + 216) = v54;
  *(_DWORD *)(a2 + 224) = v58;
  *(_BYTE *)(a2 + 228) = v49;
  *(_DWORD *)(a2 + 232) = v57;
  *(_BYTE *)(a2 + 236) = v46;
  *(_DWORD *)(a2 + 240) = v56;
  *(_BYTE *)(a2 + 244) = v44;
  *(_QWORD *)(a2 + 248) = v55;
  *(_DWORD *)(a2 + 256) = v62;
  *(_BYTE *)(a2 + 260) = v35;
  *(_QWORD *)(a2 + 264) = v61;
  *(_QWORD *)(a2 + 272) = v60;
  *(_BYTE *)(a2 + 280) = v34;
  *(_QWORD *)(a2 + 288) = v59;
  return result;
}

uint64_t sub_244EC1890()
{
  return 1;
}

unint64_t sub_244EC1898(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v6)(_BYTE *);
  uint64_t (*v7)(_BYTE *, _QWORD);
  uint64_t v8;
  unint64_t result;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(_BYTE *);
  void (*v16)(_BYTE *, _QWORD);
  uint64_t *v17;
  uint64_t *v18;
  unint64_t v19;
  char v20;
  char v21;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  unint64_t v24;
  uint64_t (*v25)(_QWORD *, _QWORD);
  uint64_t *v26;
  uint64_t *v27;
  void (*v28)(_BYTE *, _QWORD);
  uint64_t *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _BYTE v34[32];
  _QWORD __dst[37];
  uint64_t v36[38];

  v3 = v2;
  v6 = *(uint64_t (**)(_BYTE *))(*(_QWORD *)v2 + 112);
  v7 = (uint64_t (*)(_BYTE *, _QWORD))v6(v34);
  sub_244EC1B8C(a1, __dst);
  sub_244EC2684((uint64_t)__dst, (uint64_t)v36, &qword_25742B028);
  sub_244EC2464(v36);
  v8 = v7(v34, 0);
  if ((a2 & 1) == 0)
    goto LABEL_16;
  result = sub_244ECDDF8(v8);
  v10 = result;
  v30 = a1;
  if (!(result >> 62))
  {
    v11 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v11)
      goto LABEL_4;
LABEL_15:
    swift_bridgeObjectRelease();
    a1 = v30;
LABEL_16:
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742AF18);
    v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_244EE2940;
    *(_QWORD *)(v23 + 32) = a1;
    __dst[0] = v23;
    sub_244EE1E8C();
    v24 = __dst[0];
    swift_retain();
    v25 = (uint64_t (*)(_QWORD *, _QWORD))v6(__dst);
    v27 = v26;
    v28 = (void (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *))(*(_QWORD *)v3 + 136))(v34);
    sub_244EB72E4(v24, v27, v29);
    swift_bridgeObjectRelease();
    v28(v34, 0);
    return v25(__dst, 0);
  }
  result = sub_244EE209C();
  v11 = result;
  if (!result)
    goto LABEL_15;
LABEL_4:
  if (v11 >= 1)
  {
    v12 = 0;
    v31 = v10 & 0xC000000000000001;
    v32 = v10;
    do
    {
      if (v31)
      {
        v13 = MEMORY[0x249529C58](v12, v10);
      }
      else
      {
        v13 = *(_QWORD *)(v10 + 8 * v12 + 32);
        swift_retain();
      }
      v14 = v3;
      v15 = v6;
      v16 = (void (*)(_BYTE *, _QWORD))v6(v34);
      v18 = v17;
      swift_bridgeObjectRetain();
      v19 = sub_244EB9538(v13);
      v21 = v20;
      swift_bridgeObjectRelease();
      if ((v21 & 1) != 0)
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v33 = *v18;
        *v18 = 0x8000000000000000;
        if (!isUniquelyReferenced_nonNull_native)
          sub_244EBB0C4();
        swift_release();
        memcpy(__dst, (const void *)(*(_QWORD *)(v33 + 56) + 296 * v19), sizeof(__dst));
        sub_244EC1C84(v19, v33);
        *v18 = v33;
        swift_bridgeObjectRelease();
        sub_244EBBA84((uint64_t)__dst);
      }
      ++v12;
      v16(v34, 0);
      swift_release();
      v3 = v14;
      v6 = v15;
      v10 = v32;
    }
    while (v11 != v12);
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

uint64_t sub_244EC1B3C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_244EC1B60()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_244EC1B8C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  _QWORD v11[37];

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_244EB9538(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v11[0] = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_244EBB0C4();
      v9 = v11[0];
    }
    swift_release();
    memmove(a2, (const void *)(*(_QWORD *)(v9 + 56) + 296 * v6), 0x128uLL);
    sub_244EC1C84(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
    return nullsub_1(a2);
  }
  else
  {
    sub_244EC25D4((uint64_t)v11);
    return sub_244EC2684((uint64_t)v11, (uint64_t)a2, &qword_25742B028);
  }
}

unint64_t sub_244EC1C84(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  const void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_244EE1F94();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      sub_244EE1A6C();
      sub_244EC2594(&qword_25742AF00, MEMORY[0x24BDE71F8]);
      do
      {
        result = sub_244EE1DC0();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 >= v8 && v3 >= (uint64_t)v9)
          {
LABEL_16:
            v12 = *(_QWORD *)(a2 + 48);
            v13 = (_QWORD *)(v12 + 8 * v3);
            v14 = (_QWORD *)(v12 + 8 * v6);
            if (v3 != v6 || v13 >= v14 + 1)
              *v13 = *v14;
            v15 = *(_QWORD *)(a2 + 56);
            result = v15 + 296 * v3;
            v16 = (const void *)(v15 + 296 * v6);
            if (v3 != v6 || (v3 = v6, result >= (unint64_t)v16 + 296))
            {
              result = (unint64_t)memmove((void *)result, v16, 0x128uLL);
              v3 = v6;
            }
          }
        }
        else if (v9 >= v8 || v3 >= (uint64_t)v9)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void *sub_244EC1E64@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  char v7;
  int v8;
  char v9;
  char v10;
  int v11;
  int v12;
  char v13;
  int v14;
  uint64_t v15;
  char v17;
  int v18;
  char v19;
  int v20;
  char v21;
  int v22;
  uint64_t v23;
  char v24;
  int v25;
  char v26;
  char v27;
  int v28;
  char v29;
  uint64_t v30;
  char v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  char v44;
  int v45;
  char v46;
  int v47;
  char v48;
  int v49;
  uint64_t v50;
  char v51;
  int v52;
  char v53;
  int v54;
  char v55;
  int v56;
  char v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[21];
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  int v82;
  char v83;
  int v84;
  char v85;
  int v86;
  char v87;
  int v88;
  char v89;
  uint64_t v90;
  int v91;
  char v92;
  int v93;
  char v94;
  int v95;
  char v96;
  uint64_t v97;
  char v98;
  uint64_t v99;
  uint64_t v100;
  int v101;
  char v102;
  _QWORD v103[2];
  char v104;
  uint64_t v105;
  int v106;
  char v107;
  int v108;
  char v109;
  int v110;
  char v111;
  uint64_t v112;
  char v113;
  int v114;
  char v115;
  int v116;
  char v117;
  int v118;
  char v119;
  int v120;
  char v121;
  int v122;
  char v123;
  uint64_t v124;
  int v125;
  char v126;
  int v127;
  char v128;
  int v129;
  char v130;
  _BYTE v131[8];
  _BYTE v132[8];
  _BYTE v133[8];
  _BYTE v134[8];
  _BYTE v135[8];
  _OWORD v136[2];
  _OWORD v137[2];
  uint64_t v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint64_t v142;
  _BYTE v143[8];
  _BYTE v144[8];
  uint64_t v145;
  _OWORD v146[2];
  uint64_t v147;
  _BYTE v148[8];
  _BYTE v149[8];
  _OWORD v150[3];
  _BYTE v151[21];
  _QWORD __src[39];

  sub_244ECFB74((uint64_t)&v64);
  v150[1] = v73;
  v150[2] = v74;
  *(_OWORD *)v151 = *(_OWORD *)v75;
  *(_QWORD *)&v151[13] = *(_QWORD *)&v75[13];
  v150[0] = v72;
  v146[0] = v79;
  v146[1] = v80;
  v147 = v81;
  v145 = v76;
  v139 = v68;
  v140 = v69;
  v141 = v70;
  v142 = v71;
  v137[0] = v65;
  v137[1] = v66;
  v138 = v67;
  v136[0] = v77;
  v136[1] = v78;
  v59 = sub_244EB9228(a1);
  v60 = v3;
  v61 = v4;
  v62 = v5;
  swift_bridgeObjectRetain();
  sub_244EC260C((uint64_t)v136);
  sub_244EB8FE8(a1, (uint64_t)&v82);
  v57 = v83;
  v58 = v82;
  v55 = v85;
  v56 = v84;
  v53 = v87;
  v54 = v86;
  v51 = v89;
  v52 = v88;
  v50 = v90;
  sub_244EC2684((uint64_t)&v90, (uint64_t)v135, &qword_25742B120);
  sub_244EC26C8((uint64_t)v135);
  sub_244EC2634((uint64_t)v137);
  sub_244EB9058(a1, (uint64_t)&v91);
  v48 = v92;
  v49 = v91;
  v46 = v94;
  v47 = v93;
  v44 = v96;
  v45 = v95;
  v43 = v97;
  v42 = v98;
  v40 = v100;
  v41 = v99;
  sub_244EC2684((uint64_t)&v99, (uint64_t)v134, &qword_25742B128);
  sub_244EC2684((uint64_t)&v100, (uint64_t)v133, &qword_25742B130);
  sub_244EC2684((uint64_t)&v141 + 8, (uint64_t)v144, &qword_25742B128);
  sub_244EC26C8((uint64_t)v134);
  sub_244EC26C8((uint64_t)v133);
  sub_244EC265C((uint64_t)v144);
  sub_244EC2684((uint64_t)&v142, (uint64_t)v143, &qword_25742B130);
  sub_244EC265C((uint64_t)v143);
  v33 = sub_244EB9194();
  swift_bridgeObjectRetain();
  sub_244EC265C((uint64_t)&v145);
  sub_244EB927C(a1, (uint64_t)&v101);
  v38 = v102;
  v39 = v101;
  v36 = v103[1];
  v37 = v103[0];
  v35 = v104;
  v34 = v105;
  sub_244EC2684((uint64_t)v103, (uint64_t)v132, &qword_25742B138);
  sub_244EC2684((uint64_t)&v105, (uint64_t)v131, qword_25742B140);
  sub_244EC2684((uint64_t)v146 + 8, (uint64_t)v149, &qword_25742B138);
  sub_244EC26C8((uint64_t)v132);
  sub_244EC26C8((uint64_t)v131);
  sub_244EC265C((uint64_t)v149);
  sub_244EC2684((uint64_t)&v147, (uint64_t)v148, qword_25742B140);
  sub_244EC265C((uint64_t)v148);
  sub_244EB90A0((uint64_t)&v106);
  v6 = v106;
  v7 = v107;
  v8 = v108;
  v9 = v109;
  v31 = v111;
  v32 = v110;
  v30 = v112;
  v29 = v113;
  sub_244EB90E0(a1, (uint64_t)&v114);
  v10 = v115;
  v11 = v116;
  v27 = v117;
  v28 = v114;
  v12 = v118;
  v25 = v120;
  v26 = v119;
  v13 = v121;
  v14 = v122;
  v24 = v123;
  v23 = v124;
  v21 = v126;
  v22 = v125;
  v19 = v128;
  v20 = v127;
  v17 = v130;
  v18 = v129;
  sub_244EC26F0((uint64_t)&v114);
  sub_244EC2718((uint64_t)v150);
  v15 = sub_244EB92BC(a1);
  LODWORD(__src[1]) = v58;
  BYTE4(__src[1]) = v57;
  LODWORD(__src[2]) = v56;
  BYTE4(__src[2]) = v55;
  LODWORD(__src[3]) = v54;
  BYTE4(__src[3]) = v53;
  LODWORD(__src[4]) = v52;
  BYTE4(__src[4]) = v51;
  __src[5] = v50;
  LODWORD(__src[6]) = v49;
  BYTE4(__src[6]) = v48;
  LODWORD(__src[7]) = v47;
  BYTE4(__src[7]) = v46;
  LODWORD(__src[8]) = v45;
  BYTE4(__src[8]) = v44;
  __src[9] = v43;
  LOBYTE(__src[10]) = v42;
  __src[11] = v41;
  __src[12] = v40;
  LODWORD(__src[13]) = v6;
  BYTE4(__src[13]) = v7;
  LODWORD(__src[14]) = v8;
  BYTE4(__src[14]) = v9;
  LODWORD(__src[0]) = v15;
  BYTE4(__src[0]) = BYTE4(v15) & 1;
  LODWORD(__src[15]) = v32;
  BYTE4(__src[15]) = v31;
  __src[16] = v30;
  LOBYTE(__src[17]) = v29;
  LODWORD(__src[18]) = v28;
  BYTE4(__src[18]) = v10;
  LODWORD(__src[19]) = v11;
  BYTE4(__src[19]) = v27;
  LODWORD(__src[20]) = v12;
  BYTE4(__src[20]) = v26;
  LODWORD(__src[21]) = v25;
  BYTE4(__src[21]) = v13;
  LODWORD(__src[22]) = v14;
  BYTE4(__src[22]) = v24;
  __src[23] = v23;
  LODWORD(__src[24]) = v22;
  BYTE4(__src[24]) = v21;
  LODWORD(__src[25]) = v20;
  BYTE4(__src[25]) = v19;
  LODWORD(__src[26]) = v18;
  BYTE4(__src[26]) = v17;
  __src[27] = v33;
  LODWORD(__src[28]) = v59;
  BYTE4(__src[28]) = BYTE4(v59) & 1;
  LODWORD(__src[29]) = v60;
  BYTE4(__src[29]) = BYTE4(v60) & 1;
  LODWORD(__src[30]) = v61;
  BYTE4(__src[30]) = BYTE4(v61) & 1;
  __src[31] = v62;
  LODWORD(__src[32]) = v39;
  BYTE4(__src[32]) = v38;
  __src[33] = v37;
  __src[34] = v36;
  LOBYTE(__src[35]) = v35;
  __src[36] = v34;
  sub_244EBEE3C((uint64_t)__src);
  sub_244EC265C((uint64_t)v132);
  sub_244EC265C((uint64_t)v131);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_244EC2718((uint64_t)&v114);
  sub_244EC265C((uint64_t)v134);
  sub_244EC265C((uint64_t)v133);
  sub_244EC2634((uint64_t)&v82);
  sub_244EBBA84((uint64_t)__src);
  return memcpy(a2, __src, 0x128uLL);
}

uint64_t *sub_244EC2464(uint64_t *a1)
{
  sub_244EC24E4(*a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
  return a1;
}

uint64_t sub_244EC24E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;

  if (a6 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for MetricsData()
{
  return objc_opt_self();
}

uint64_t sub_244EC2594(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_244EE1A6C();
    result = MEMORY[0x24952A0F0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

double sub_244EC25D4(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 1;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_QWORD *)(a1 + 288) = 0;
  return result;
}

uint64_t sub_244EC260C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_244EC2634(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_244EC265C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_244EC2684(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_244EC26C8(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_244EC26F0(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_244EC2718(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_244EC2740(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_244EC27E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  int v8;
  uint64_t result;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v2 = v1;
  v4 = sub_244EE182C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (int *)((char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(int *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  v8 = (*(uint64_t (**)(int *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x24BDE6778])
  {
    result = (*(uint64_t (**)(int *, uint64_t))(v5 + 96))(v7, v4);
    v10 = *v7;
    *(_QWORD *)(a1 + 24) = MEMORY[0x24BEE14E8];
    *(_DWORD *)a1 = v10;
  }
  else if (v8 == *MEMORY[0x24BDE6780])
  {
    (*(void (**)(int *, uint64_t))(v5 + 96))(v7, v4);
    v11 = *(_QWORD *)v7;
    result = sub_244EE1748();
    *(_QWORD *)(a1 + 24) = result;
    *(_QWORD *)a1 = v11;
  }
  else
  {
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    return (*(uint64_t (**)(int *, uint64_t))(v5 + 8))(v7, v4);
  }
  return result;
}

uint64_t sub_244EC290C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_244EC2914(uint64_t a1, void *a2)
{
  return sub_244EC291C(a2);
}

uint64_t sub_244EC291C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _BYTE v20[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  char v24;

  v2 = sub_244EE1CB8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v20[-v7];
  if (a1)
  {
    v9 = (void *)objc_opt_self();
    v10 = a1;
    v11 = objc_msgSend(v9, sel_mainBundle);
    v12 = objc_msgSend(v11, sel_bundleIdentifier);

    if (v12)
    {
      sub_244EE1DE4();

    }
    sub_244EE1868();
    v21 = v15;
    v22 = v16;
    v23 = v17;
    v24 = 0;
    sub_244EE1CAC();
    sub_244EE167C();
    swift_allocObject();
    sub_244EE1670();
    sub_244EC2C44();
    v18 = sub_244EE1664();
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v8, v2);

  }
  else
  {
    v13 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v14 = objc_msgSend(v13, sel_bundleIdentifier);

    if (v14)
    {
      sub_244EE1DE4();

    }
    v22 = 0u;
    v23 = 0u;
    v21 = 0u;
    v24 = 1;
    sub_244EE1CAC();
    sub_244EE167C();
    swift_allocObject();
    sub_244EE1670();
    sub_244EC2C44();
    v18 = sub_244EE1664();
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v6, v2);
  }
  swift_release();
  return v18;
}

ValueMetadata *type metadata accessor for SceneConfigurationDataProvider()
{
  return &type metadata for SceneConfigurationDataProvider;
}

unint64_t sub_244EC2C44()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25742B160;
  if (!qword_25742B160)
  {
    v1 = sub_244EE1CB8();
    result = MEMORY[0x24952A0F0](MEMORY[0x24BEAFE18], v1);
    atomic_store(result, (unint64_t *)&qword_25742B160);
  }
  return result;
}

uint64_t sub_244EC2C8C()
{
  uint64_t v0;

  sub_244EE1934();
  sub_244EE1910();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B168);
  swift_getTupleTypeMetadata2();
  sub_244EC31C4();
  v0 = sub_244EE1E50();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_244EC2D68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t TupleTypeMetadata2;
  uint64_t v19;
  _BYTE v21[16];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v14 = sub_244EE1F40();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = &v21[-v16];
  v26 = a1;
  MEMORY[0x249529A24](&v26, a4, MEMORY[0x24BEE27D0], a5, MEMORY[0x24BEE27D8]);
  v22 = a5;
  v23 = a6;
  v24 = a2;
  v25 = a3;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  sub_244EC3000((void (*)(char *, char *))sub_244EC37D0, (uint64_t)v21, MEMORY[0x24BEE4078], TupleTypeMetadata2, v19, a7);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v15 + 8))(v17, v14);
}

uint64_t sub_244EC2E8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;

  return sub_244EC2D68(a1, a2, a3, v4[4], v4[2], v4[3], a4);
}

uint64_t sub_244EC2E98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B180);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EE16AC();
  v13 = sub_244EE16B8();
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_244EC37FC((uint64_t)v12);
    v15 = (char *)a5 + *(int *)(swift_getTupleTypeMetadata2() + 48);
    *a5 = a2;
    a5[1] = a3;
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(v15, a1, a4);
    return swift_bridgeObjectRetain();
  }
  else
  {
    v17 = sub_244EE1688();
    v19 = v18;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v12, v13);
    v20 = (char *)a5 + *(int *)(swift_getTupleTypeMetadata2() + 48);
    *a5 = v17;
    a5[1] = v19;
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))(v20, a1, a4);
  }
}

uint64_t sub_244EC3000@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, char *);
  uint64_t v28;

  v25 = a5;
  v26 = a2;
  v28 = a4;
  v27 = a1;
  v24 = a3;
  v9 = *(_QWORD *)(a3 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v10);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v6);
  v22 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
    v27(v18, v12);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    if (v7)
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v25, v12, v24);
    v22 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(a6, v22, 1);
}

uint64_t sub_244EC3190(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v1 + 32))(*a1, a1[1], a1[2]);
}

unint64_t sub_244EC31C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25742B170;
  if (!qword_25742B170)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742B168);
    result = MEMORY[0x24952A0F0](MEMORY[0x24BEE04D8], v1);
    atomic_store(result, (unint64_t *)&qword_25742B170);
  }
  return result;
}

uint64_t sub_244EC3210()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _BOOL4 v8;
  uint64_t result;
  int v10;
  _BOOL8 v11;
  int v12;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE60);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_244EE19E8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EE1958();
  sub_244EE197C();
  swift_release();
  sub_244EE19DC();
  sub_244EBEDF4();
  sub_244EE1964();
  sub_244EE1940();
  v8 = v11;
  sub_244EE1928();
  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v10 = v8 + v12;
  if (__OFADD__(v8, v12))
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v11 = v10 >= 1;
    sub_244EC347C();
    return sub_244EE1F88();
  }
  return result;
}

uint64_t sub_244EC33A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int v4;
  uint64_t result;
  uint64_t v6;
  int v7;
  int v8;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AE60);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EE19DC();
  sub_244EBEDF4();
  sub_244EE1964();
  sub_244EE1940();
  v4 = v8;
  sub_244EE1928();
  result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (!__OFADD__(v4, v7))
    return v4 + v7 > 0;
  __break(1u);
  return result;
}

unint64_t sub_244EC347C()
{
  unint64_t result;

  result = qword_25742B178;
  if (!qword_25742B178)
  {
    result = MEMORY[0x24952A0F0](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_25742B178);
  }
  return result;
}

uint64_t sub_244EC34C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _QWORD v5[2];

  v0 = sub_244EE19E8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EE1958();
  sub_244EE197C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v5[1] = 0;
  sub_244EC347C();
  return sub_244EE1F88();
}

uint64_t sub_244EC3588()
{
  return 0;
}

uint64_t sub_244EC3590()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  _QWORD v6[2];

  v0 = sub_244EE19E8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EE1958();
  sub_244EE197C();
  swift_release();
  v4 = sub_244EC3680();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v6[1] = (v4 & 1) != 0;
  sub_244EC347C();
  return sub_244EE1F88();
}

uint64_t sub_244EC3680()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char v9;
  void (*v10)(char *, uint64_t);
  char v11;
  uint64_t v13;

  v1 = v0;
  v2 = sub_244EE19E8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v13 - v7;
  sub_244EE19DC();
  sub_244EE197C();
  swift_release();
  sub_244EE1820();
  v9 = sub_244EE19D0();
  v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v8, v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v1, v2);
  if ((v9 & 1) != 0)
  {
    sub_244EE19DC();
    sub_244EE197C();
    swift_release();
    sub_244EE17FC();
    v11 = sub_244EE19D0();
    v10(v8, v2);
  }
  else
  {
    v11 = 0;
  }
  v10(v6, v2);
  return v11 & 1;
}

uint64_t sub_244EC37C4()
{
  return MEMORY[0x24BEE4B00];
}

uint64_t sub_244EC37D0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_244EC2E98(a1, v2[4], v2[5], v2[2], a2);
}

uint64_t sub_244EC37FC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B180);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *sub_244EC383C()
{
  return &qword_25742B188;
}

uint64_t sub_244EC3848()
{
  swift_beginAccess();
  return qword_25742B188;
}

uint64_t sub_244EC3888(uint64_t a1)
{
  uint64_t result;

  result = swift_beginAccess();
  qword_25742B188 = a1;
  return result;
}

uint64_t (*sub_244EC38CC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_244EC390C()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_244EE1C58();
  return v0;
}

uint64_t sub_244EC394C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v1 = sub_244EE1C64();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EE1C58();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v0 + OBJC_IVAR____TtC20RealityKitInspection32SceneDebugRepresentationProvider_hierarchy, v4, v1);
  return v0;
}

uint64_t sub_244EC39D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  swift_beginAccess();
  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v1 + 128))(a1, qword_25742B188);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 136))(v3);
}

uint64_t sub_244EC3A38(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint8_t *v12;
  void (*v13)(uint64_t *, _QWORD);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18[4];

  v5 = sub_244EE1D30();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EE1CDC();
  swift_retain();
  v9 = sub_244EE1D24();
  v10 = sub_244EE1F10();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v17 = v2;
    v12 = v11;
    *(_DWORD *)v11 = 134217984;
    v16 = v6;
    v18[0] = sub_244EE1A24();
    v6 = v16;
    sub_244EE1F4C();
    swift_release();
    _os_log_impl(&dword_244EB5000, v9, v10, "Representing entity %llu in RealityKitHierarchy", v12, 0xCu);
    MEMORY[0x24952A198](v12, -1, -1);

  }
  else
  {

    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_244EC4344(a1, 0, a2, 1);
  swift_beginAccess();
  v13 = (void (*)(uint64_t *, _QWORD))sub_244EE1C4C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B190);
  sub_244EE1ACC();
  v13(v18, 0);
  swift_endAccess();
  return swift_release();
}

void sub_244EC3C40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v0 = sub_244EE1C64();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_244EE1D30();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v18[3] = (char *)v18 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v18 - v9;
  sub_244EE1CDC();
  v11 = sub_244EE1D24();
  v12 = sub_244EE1F10();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_244EB5000, v11, v12, "Encoding RealityKitHierarchy", v13, 2u);
    MEMORY[0x24952A198](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  sub_244EE167C();
  swift_allocObject();
  v14 = sub_244EE1670();
  v15 = v19 + OBJC_IVAR____TtC20RealityKitInspection32SceneDebugRepresentationProvider_hierarchy;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v15, v0);
  sub_244EBEF9C(&qword_25742B198, (uint64_t (*)(uint64_t))MEMORY[0x24BEAFDB0], MEMORY[0x24BEAFDC0]);
  v19 = v14;
  sub_244EE1664();
  v17 = v16;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  __asm { BR              X10 }
}

uint64_t sub_244EC4344(uint64_t *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  os_log_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t inited;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t *boxed_opaque_existential_0;
  _QWORD *v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t *v60;
  void (*v61)(uint64_t *, _QWORD);
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  char v66;
  void (*v67)(__int128 *, _QWORD);
  _QWORD v69[2];
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  os_log_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96[3];
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  uint64_t v102;

  v85 = a4;
  v93 = a3;
  v77 = a2;
  v5 = sub_244EE1A0C();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AF30);
  v8 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  v10 = (char *)v69 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = sub_244EE1CA0();
  v91 = *(_QWORD *)(v92 - 8);
  v11 = MEMORY[0x24BDAC7A8](v92);
  v84 = (char *)v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v69 - v13;
  v15 = sub_244EE19E8();
  MEMORY[0x24BDAC7A8](v15);
  v80 = (char *)v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = sub_244EE19C4();
  v82 = *(_QWORD *)(v83 - 8);
  MEMORY[0x24BDAC7A8](v83);
  v90 = (char *)v69 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = sub_244EE21C8();
  v87 = *(_QWORD *)(v89 - 8);
  v18 = MEMORY[0x24BDAC7A8](v89);
  v20 = (_QWORD *)((char *)v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v18);
  v79 = (_QWORD *)((char *)v69 - v21);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B2A8);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v81 = (char *)v69 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v78 = (uint64_t)v69 - v25;
  v95 = sub_244EE1D18();
  v86 = *(_QWORD *)(v95 - 8);
  v26 = MEMORY[0x24BDAC7A8](v95);
  v88 = (char *)v69 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v94 = (char *)v69 - v28;
  v76 = sub_244EE1D30();
  v29 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v31 = (char *)v69 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EE1CDC();
  swift_retain_n();
  v32 = sub_244EE1D24();
  v33 = sub_244EE1F10();
  v34 = os_log_type_enabled(v32, v33);
  v71 = v8;
  v70 = v10;
  v69[1] = v7;
  if (v34)
  {
    v75 = v32;
    v35 = (uint8_t *)swift_slowAlloc();
    v36 = swift_slowAlloc();
    *(_QWORD *)&v101 = v36;
    *(_DWORD *)v35 = 136315138;
    v74 = (uint64_t)(v35 + 4);
    v37 = sub_244EE1A30();
    v98 = sub_244ECB0C4(v37, v38, (uint64_t *)&v101);
    sub_244EE1F4C();
    swift_release_n();
    swift_bridgeObjectRelease();
    v39 = v75;
    _os_log_impl(&dword_244EB5000, v75, v33, "RealityKitHierarchy capturing entity: %s", v35, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24952A198](v36, -1, -1);
    MEMORY[0x24952A198](v35, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v76);
  v40 = v95;
  v41 = v94;
  v42 = v88;
  sub_244EE1A24();
  sub_244EE1D0C();
  *(_QWORD *)&v101 = a1;
  sub_244EE21D4();
  v77 = v43;
  v88 = *(char **)(v86 + 16);
  ((void (*)(char *, char *, uint64_t))v88)(v42, v41, v40);
  v76 = sub_244EE1A30();
  v75 = v44;
  *(_QWORD *)&v101 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B000);
  v74 = sub_244EE1DF0();
  v73 = v45;
  swift_retain();
  sub_244EE1A48();
  sub_244EE1988();
  sub_244EE1A54();
  sub_244EE1A18();
  sub_244EE1C1C();
  swift_allocObject();
  v46 = sub_244EE1C04();
  v77 = sub_244EE1A6C();
  v102 = v77;
  *(_QWORD *)&v101 = a1;
  swift_retain();
  v47 = v79;
  sub_244EE218C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B3A0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_244EE25F0;
  *(_QWORD *)(inited + 32) = 0x6E656E6F706D6F63;
  *(_QWORD *)(inited + 40) = 0xEA00000000007374;
  *(_QWORD *)(inited + 48) = 0x6E6572646C696863;
  *(_QWORD *)(inited + 56) = 0xE800000000000000;
  sub_244EC4E74(v47, v93, inited, v78);
  swift_setDeallocating();
  swift_arrayDestroy();
  v87 = *(_QWORD *)(v87 + 8);
  ((void (*)(uint64_t *, uint64_t))v87)(v47, v89);
  sub_244EE1BF8();
  v79 = a1;
  sub_244EE197C();
  v49 = v90;
  sub_244EE1994();
  sub_244EE19B8();
  v50 = v92;
  v51 = v91;
  v52 = v84;
  v53 = (uint64_t)v81;
  while (v102)
  {
    sub_244ECCA5C(&v101, (uint64_t)&v98);
    __swift_project_boxed_opaque_existential_1Tm(&v98, v99);
    v96[0] = swift_getDynamicType();
    v96[1] = v100;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742B3A8);
    sub_244EE1DF0();
    swift_bridgeObjectRetain();
    sub_244EE1C94();
    (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v52, v14, v50);
    ((void (*)(char *, char *, uint64_t))v88)(v42, v94, v95);
    v54 = v99;
    v55 = __swift_project_boxed_opaque_existential_1Tm(&v98, v99);
    v97 = v54;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v96);
    v57 = v55;
    v51 = v91;
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v54 - 8) + 16))(boxed_opaque_existential_0, v57, v54);
    sub_244ECCA98(v96);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v96);
    sub_244EE1C40();
    swift_allocObject();
    sub_244EE1C34();
    v58 = v99;
    v59 = __swift_project_boxed_opaque_existential_1Tm(&v98, v99);
    v97 = v58;
    v60 = __swift_allocate_boxed_opaque_existential_0(v96);
    (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v58 - 8) + 16))(v60, v59, v58);
    sub_244EE218C();
    sub_244EC4E74(v20, v93, MEMORY[0x24BEE4AF8], v53);
    ((void (*)(uint64_t *, uint64_t))v87)(v20, v89);
    sub_244EE1C28();
    v61 = (void (*)(uint64_t *, _QWORD))sub_244EE1BEC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742B3B0);
    sub_244EE1ACC();
    v61(v96, 0);
    v50 = v92;
    v49 = v90;
    swift_release();
    (*(void (**)(char *, uint64_t))(v51 + 8))(v14, v50);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v98);
    sub_244EE19B8();
  }
  (*(void (**)(char *, uint64_t))(v82 + 8))(v49, v83);
  if ((v85 & 1) != 0)
  {
    sub_244EE173C();
    v62 = v70;
    sub_244EE19F4();
    v63 = v72;
    sub_244EE1A00();
    v64 = v101;
    for (i = v93; (_QWORD)v101; v64 = v101)
    {
      swift_retain();
      v66 = sub_244EC010C();
      sub_244EC4344(v64, v46, i, (v66 & 1) == 0);
      swift_release();
      v67 = (void (*)(__int128 *, _QWORD))sub_244EE1C10();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742B190);
      sub_244EE1ACC();
      v67(&v101, 0);
      swift_release();
      swift_release();
      sub_244EE1A00();
    }
    (*(void (**)(char *, uint64_t))(v71 + 8))(v62, v63);
  }
  (*(void (**)(char *, uint64_t))(v86 + 8))(v94, v95);
  return v46;
}

uint64_t sub_244EC4E74@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  void (*v28)(char *, uint64_t *, uint64_t);
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void (*v37)(_QWORD, _QWORD);
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  uint64_t v40;
  __int128 v41;
  char *v42;
  char *v43;
  _QWORD *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  char *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char *v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  NSObject *v81;
  os_log_type_t v82;
  const char *v83;
  os_log_type_t v84;
  uint64_t v86;
  char *v87;
  uint64_t *v88;
  char *v89;
  uint64_t v90;
  char *v91;
  _QWORD *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  __int128 v103;
  uint64_t *v104;
  uint64_t *v105;
  uint64_t *v106;
  uint8_t *v107;
  uint64_t v108;
  char *v109;
  char *v110;
  void (*v111)(_QWORD, _QWORD);
  uint64_t v112;
  __int128 *v113;
  uint64_t *v114;
  uint64_t v115[2];
  uint64_t v116[3];
  uint64_t v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _QWORD v127[2];
  uint64_t v128;
  void (*v129)(_QWORD, _QWORD);
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;

  v96 = a2;
  v108 = a3;
  v97 = a4;
  v5 = sub_244EE1B2C();
  v94 = *(_QWORD *)(v5 - 8);
  v95 = v5;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v93 = (char *)&v86 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v92 = (uint64_t *)((char *)&v86 - v8);
  v9 = sub_244EE1AFC();
  v100 = *(_QWORD *)(v9 - 8);
  v101 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v91 = (char *)&v86 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v99 = (char *)&v86 - v12;
  v13 = sub_244EE21C8();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v86 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_244EE1D30();
  v113 = *(__int128 **)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v89 = (char *)&v86 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v87 = (char *)&v86 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v109 = (char *)&v86 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v110 = (char *)&v86 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v86 - v26;
  sub_244EE1CDC();
  v28 = *(void (**)(char *, uint64_t *, uint64_t))(v14 + 16);
  v114 = a1;
  v28(v16, a1, v13);
  v29 = sub_244EE1D24();
  v30 = sub_244EE1F10();
  v31 = os_log_type_enabled(v29, v30);
  v32 = v108;
  v112 = v17;
  if (v31)
  {
    v33 = (uint8_t *)swift_slowAlloc();
    v111 = (void (*)(_QWORD, _QWORD))swift_slowAlloc();
    v129 = v111;
    *(_DWORD *)v33 = 136315138;
    v107 = v33 + 4;
    v127[0] = sub_244EE2198();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742B318);
    v34 = sub_244EE1DF0();
    v127[0] = sub_244ECB0C4(v34, v35, (uint64_t *)&v129);
    v36 = v108;
    sub_244EE1F4C();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    _os_log_impl(&dword_244EB5000, v29, v30, "RealityKitHierarchy capturing properties for subjectType: %s", v33, 0xCu);
    v37 = v111;
    swift_arrayDestroy();
    MEMORY[0x24952A198](v37, -1, -1);
    MEMORY[0x24952A198](v33, -1, -1);

    v111 = (void (*)(_QWORD, _QWORD))*((_QWORD *)v113 + 1);
    v111(v27, v112);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);

    v111 = (void (*)(_QWORD, _QWORD))*((_QWORD *)v113 + 1);
    v111(v27, v112);
    v36 = v32;
  }
  v38 = sub_244EE1C88();
  v39 = (uint64_t (*)(uint64_t))MEMORY[0x24BEAFDE0];
  sub_244EBEF9C(&qword_25742B340, (uint64_t (*)(uint64_t))MEMORY[0x24BEAFC08], MEMORY[0x24BEAFC00]);
  sub_244EBEF9C(&qword_25742B348, v39, MEMORY[0x24BEAFDD8]);
  v90 = v38;
  sub_244EE1AE4();
  sub_244EE21BC();
  v40 = sub_244EE2054();
  swift_release();
  swift_retain();
  v107 = (uint8_t *)v40;
  sub_244EE20D8();
  v42 = v109;
  if (v132)
  {
    v113 = &v125;
    v114 = &v128;
    v105 = &v117;
    v106 = &v131;
    v104 = &v123;
    v88 = (uint64_t *)(v36 + 40);
    *(_QWORD *)&v41 = 136315138;
    v103 = v41;
    v98 = MEMORY[0x24BEE4AD8] + 8;
    while (1)
    {
      v48 = (uint64_t)v129;
      v49 = v130;
      v127[0] = v129;
      v127[1] = v130;
      v50 = v114;
      sub_244ECC9E4(v106, v114);
      swift_bridgeObjectRetain();
      v51 = v110;
      sub_244EE1CDC();
      *(_QWORD *)&v124 = v48;
      *((_QWORD *)&v124 + 1) = v49;
      sub_244ECC8D0((uint64_t)v50, (uint64_t)v113);
      sub_244ECCA18((uint64_t)&v124, (uint64_t)&v121, &qword_25742B358);
      v118 = v124;
      v119 = v125;
      v120 = v126;
      swift_bridgeObjectRetain();
      v52 = sub_244EE1D24();
      v53 = sub_244EE1F10();
      if (os_log_type_enabled(v52, v53))
      {
        v54 = swift_slowAlloc();
        v55 = swift_slowAlloc();
        v102 = v55;
        *(_DWORD *)v54 = v103;
        v57 = v121;
        v56 = v122;
        v116[0] = v55;
        v116[1] = v121;
        v116[2] = v122;
        v58 = (uint64_t)v105;
        sub_244ECC8D0((uint64_t)v104, (uint64_t)v105);
        v115[0] = v57;
        v115[1] = v56;
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_25742B390);
        v59 = sub_244EE1DF0();
        v61 = v60;
        v62 = v112;
        __swift_destroy_boxed_opaque_existential_1Tm(v58);
        *(_QWORD *)(v54 + 4) = sub_244ECB0C4(v59, v61, v116);
        v42 = v109;
        swift_bridgeObjectRelease();
        sub_244EBFC74((uint64_t)&v118, &qword_25742B358);
        sub_244EBFC74((uint64_t)&v121, &qword_25742B358);
        _os_log_impl(&dword_244EB5000, v52, v53, "property label: %s", (uint8_t *)v54, 0xCu);
        v63 = v102;
        swift_arrayDestroy();
        MEMORY[0x24952A198](v63, -1, -1);
        MEMORY[0x24952A198](v54, -1, -1);

        v64 = v110;
        v65 = v62;
      }
      else
      {
        sub_244EBFC74((uint64_t)&v118, &qword_25742B358);
        sub_244EBFC74((uint64_t)&v121, &qword_25742B358);

        v64 = v51;
        v65 = v112;
      }
      v111(v64, v65);
      sub_244EE1CDC();
      *(_QWORD *)&v124 = v48;
      *((_QWORD *)&v124 + 1) = v49;
      sub_244ECC8D0((uint64_t)v114, (uint64_t)v113);
      sub_244ECCA18((uint64_t)&v124, (uint64_t)&v121, &qword_25742B358);
      v118 = v124;
      v119 = v125;
      v120 = v126;
      swift_bridgeObjectRetain();
      v66 = sub_244EE1D24();
      v67 = sub_244EE1F10();
      if (os_log_type_enabled(v66, v67))
      {
        v68 = swift_slowAlloc();
        v69 = swift_slowAlloc();
        v115[0] = v69;
        *(_DWORD *)v68 = v103;
        sub_244ECC8D0((uint64_t)v104, (uint64_t)v105);
        v70 = sub_244EE1DF0();
        *(_QWORD *)(v68 + 4) = sub_244ECB0C4(v70, v71, v115);
        v42 = v109;
        swift_bridgeObjectRelease();
        sub_244EBFC74((uint64_t)&v118, &qword_25742B358);
        sub_244EBFC74((uint64_t)&v121, &qword_25742B358);
        _os_log_impl(&dword_244EB5000, v66, v67, "property value: %s", (uint8_t *)v68, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24952A198](v69, -1, -1);
        MEMORY[0x24952A198](v68, -1, -1);
      }
      else
      {
        sub_244EBFC74((uint64_t)&v118, &qword_25742B358);
        sub_244EBFC74((uint64_t)&v121, &qword_25742B358);
      }

      v111(v42, v112);
      v72 = v108;
      *(_QWORD *)&v124 = v48;
      *((_QWORD *)&v124 + 1) = v49;
      v73 = (uint64_t)v113;
      sub_244ECC8D0((uint64_t)v114, (uint64_t)v113);
      __swift_destroy_boxed_opaque_existential_1Tm(v73);
      if (!v49)
        break;
      v74 = *(_QWORD *)(v72 + 16);
      if (v74)
      {
        sub_244EBFC30();
        swift_bridgeObjectRetain();
        v75 = v88;
        while (1)
        {
          v76 = *v75;
          *(_QWORD *)&v124 = *(v75 - 1);
          *((_QWORD *)&v124 + 1) = v76;
          v121 = v48;
          v122 = v49;
          if (!sub_244EE1F64())
            break;
          v75 += 2;
          if (!--v74)
          {
            swift_bridgeObjectRelease();
            goto LABEL_6;
          }
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v77 = v87;
        sub_244EE1CDC();
        v78 = sub_244EE1D24();
        v84 = sub_244EE1F10();
        if (os_log_type_enabled(v78, v84))
        {
          v80 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v80 = 0;
          v81 = v78;
          v82 = v84;
          v83 = "Excluding property";
LABEL_24:
          _os_log_impl(&dword_244EB5000, v81, v82, v83, v80, 2u);
          MEMORY[0x24952A198](v80, -1, -1);
        }
        goto LABEL_25;
      }
LABEL_6:
      swift_bridgeObjectRetain();
      v43 = v99;
      sub_244EE1AF0();
      v44 = v92;
      v45 = v114;
      sub_244EC6898((uint64_t)v114, v96, v92);
      (*(void (**)(char *, char *, uint64_t))(v100 + 16))(v91, v43, v101);
      v46 = v94;
      v47 = v95;
      (*(void (**)(char *, _QWORD *, uint64_t))(v94 + 16))(v93, v44, v95);
      sub_244ECCA98(v45);
      swift_allocObject();
      sub_244EE1C70();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742B2A8);
      sub_244EE1ACC();
      swift_release();
      (*(void (**)(_QWORD *, uint64_t))(v46 + 8))(v44, v47);
      v42 = v109;
      (*(void (**)(char *, uint64_t))(v100 + 8))(v99, v101);
LABEL_7:
      sub_244EBFC74((uint64_t)v127, &qword_25742B358);
      sub_244EE20D8();
      if (!v132)
        return swift_release_n();
    }
    v77 = v89;
    sub_244EE1CDC();
    v78 = sub_244EE1D24();
    v79 = sub_244EE1F28();
    if (os_log_type_enabled(v78, v79))
    {
      v80 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v80 = 0;
      v81 = v78;
      v82 = v79;
      v83 = "Failed to capture property because it lacked a label";
      goto LABEL_24;
    }
LABEL_25:

    v111(v77, v112);
    goto LABEL_7;
  }
  return swift_release_n();
}

unint64_t sub_244EC5908(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  __int128 v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  char *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  char *v52;
  __int128 v53;
  uint64_t *v54;
  uint64_t *v55;
  char *v56;
  _OWORD *v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _OWORD v63[3];
  _BYTE v64[16];
  uint64_t v65;
  __int128 v66;
  _OWORD v67[2];
  _QWORD v68[2];
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v45 = a2;
  v2 = sub_244EE1B2C();
  v48 = *(_QWORD *)(v2 - 8);
  v49 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v47 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v46 = (char *)&v44 - v5;
  v6 = sub_244EE1D30();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v44 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v44 - v14;
  sub_244EE1CDC();
  v16 = sub_244EE1D24();
  v17 = sub_244EE1F10();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_244EB5000, v16, v17, "RealityKitHierarchy capturing array", v18, 2u);
    MEMORY[0x24952A198](v18, -1, -1);
  }

  v19 = *(void (**)(char *, uint64_t))(v7 + 8);
  v19(v15, v6);
  sub_244EE21BC();
  v20 = sub_244EE2054();
  swift_release();
  swift_retain();
  v60 = v20;
  sub_244EE20D8();
  if (v73)
  {
    v58 = &v72;
    v59 = &v69;
    v57 = v67;
    v55 = &v61;
    v22 = MEMORY[0x24BEE4AF8];
    v54 = &v65;
    *(_QWORD *)&v21 = 136315138;
    v53 = v21;
    v51 = MEMORY[0x24BEE4AD8] + 8;
    v52 = v10;
    v56 = v13;
    do
    {
      v50 = v22;
      while (1)
      {
        v23 = v70;
        v24 = v71;
        v68[0] = v70;
        v68[1] = v71;
        v25 = v59;
        sub_244ECC9E4(v58, v59);
        swift_bridgeObjectRetain();
        sub_244EE1CDC();
        *(_QWORD *)&v66 = v23;
        *((_QWORD *)&v66 + 1) = v24;
        sub_244ECC8D0((uint64_t)v25, (uint64_t)v57);
        sub_244ECCA18((uint64_t)&v66, (uint64_t)v64, &qword_25742B358);
        v63[0] = v66;
        v63[1] = v67[0];
        v63[2] = v67[1];
        swift_bridgeObjectRetain();
        v26 = sub_244EE1D24();
        v27 = sub_244EE1F10();
        if (os_log_type_enabled(v26, v27))
        {
          v28 = swift_slowAlloc();
          v29 = v19;
          v30 = v6;
          v31 = swift_slowAlloc();
          v62 = v31;
          *(_DWORD *)v28 = v53;
          sub_244ECC8D0((uint64_t)v54, (uint64_t)v55);
          v32 = sub_244EE1DF0();
          *(_QWORD *)(v28 + 4) = sub_244ECB0C4(v32, v33, &v62);
          swift_bridgeObjectRelease();
          sub_244EBFC74((uint64_t)v63, &qword_25742B358);
          sub_244EBFC74((uint64_t)v64, &qword_25742B358);
          _os_log_impl(&dword_244EB5000, v26, v27, "property value: %s", (uint8_t *)v28, 0xCu);
          swift_arrayDestroy();
          v34 = v31;
          v6 = v30;
          v19 = v29;
          v10 = v52;
          v13 = v56;
          MEMORY[0x24952A198](v34, -1, -1);
          MEMORY[0x24952A198](v28, -1, -1);
        }
        else
        {
          sub_244EBFC74((uint64_t)v63, &qword_25742B358);
          sub_244EBFC74((uint64_t)v64, &qword_25742B358);
        }

        v19(v13, v6);
        if (!v24)
          break;
        swift_bridgeObjectRelease();
        sub_244EE1CDC();
        v35 = sub_244EE1D24();
        v36 = sub_244EE1F28();
        if (os_log_type_enabled(v35, v36))
        {
          v37 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v37 = 0;
          _os_log_impl(&dword_244EB5000, v35, v36, "Failed to capture array property because it contained a label", v37, 2u);
          MEMORY[0x24952A198](v37, -1, -1);
        }

        v19(v10, v6);
        sub_244EBFC74((uint64_t)v68, &qword_25742B358);
        sub_244EE20D8();
        if (!v73)
        {
          v22 = v50;
          goto LABEL_21;
        }
      }
      v38 = v46;
      sub_244EC6898(v59, v45);
      (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v47, v38, v49);
      v22 = v50;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v22 = sub_244ECAEBC(0, *(_QWORD *)(v22 + 16) + 1, 1, v22);
      v40 = *(_QWORD *)(v22 + 16);
      v39 = *(_QWORD *)(v22 + 24);
      if (v40 >= v39 >> 1)
        v22 = sub_244ECAEBC(v39 > 1, v40 + 1, 1, v22);
      *(_QWORD *)(v22 + 16) = v40 + 1;
      v41 = v48;
      v42 = v49;
      (*(void (**)(unint64_t, char *, uint64_t))(v48 + 32))(v22+ ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80))+ *(_QWORD *)(v48 + 72) * v40, v47, v49);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v46, v42);
      sub_244EBFC74((uint64_t)v68, &qword_25742B358);
      sub_244EE20D8();
    }
    while (v73);
  }
  else
  {
    v22 = MEMORY[0x24BEE4AF8];
  }
LABEL_21:
  swift_release_n();
  return v22;
}

uint64_t sub_244EC5EBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  NSObject *v23;
  os_log_type_t v24;
  _BOOL4 v25;
  uint8_t *v26;
  uint8_t *v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t result;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(char *, char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char isUniquelyReferenced_nonNull_native;
  void (*v62)(char *, uint64_t);
  uint64_t v63;
  char *v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  uint64_t v79;
  __int128 v80;
  uint64_t *v81;
  uint64_t *v82;
  char *v83;
  uint64_t v84;
  void (*v85)(char *, uint64_t);
  _OWORD *v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _OWORD v92[3];
  _BYTE v93[16];
  uint64_t v94;
  __int128 v95;
  _OWORD v96[2];
  _QWORD v97[2];
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;

  v72 = a2;
  v2 = sub_244EE1B20();
  v67 = *(_QWORD *)(v2 - 8);
  v68 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v66 = (char *)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_244EE1B2C();
  v73 = *(_QWORD *)(v4 - 8);
  v74 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v65 = (char *)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v64 = (char *)&v63 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v70 = (char *)&v63 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v63 - v11;
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B2A8);
  v71 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v75 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = sub_244EE1D30();
  v14 = *(_QWORD *)(v84 - 8);
  v15 = MEMORY[0x24BDAC7A8](v84);
  v17 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v63 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v63 - v21;
  sub_244EE1CDC();
  v23 = sub_244EE1D24();
  v24 = sub_244EE1F10();
  v25 = os_log_type_enabled(v23, v24);
  v83 = v12;
  if (v25)
  {
    v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_244EB5000, v23, v24, "RealityKitHierarchy capturing dictionary", v26, 2u);
    v27 = v26;
    v12 = v83;
    MEMORY[0x24952A198](v27, -1, -1);
  }

  v28 = *(void (**)(char *, uint64_t))(v14 + 8);
  v29 = v84;
  v28(v22, v84);
  v77 = sub_244EC66E0(MEMORY[0x24BEE4AF8]);
  sub_244EE21BC();
  v30 = sub_244EE2054();
  swift_release();
  swift_retain();
  v89 = v30;
  sub_244EE20D8();
  if (!v102)
  {
LABEL_31:
    swift_release_n();
    return v77;
  }
  v87 = &v101;
  v88 = &v98;
  v86 = v96;
  v81 = &v94;
  v82 = &v90;
  v69 = *MEMORY[0x24BEAFC90];
  *(_QWORD *)&v31 = 136315138;
  v80 = v31;
  v78 = v20;
  v79 = MEMORY[0x24BEE4AD8] + 8;
  v85 = v28;
  while (1)
  {
    v32 = v99;
    v33 = v100;
    v97[0] = v99;
    v97[1] = v100;
    v34 = v88;
    sub_244ECC9E4(v87, v88);
    swift_bridgeObjectRetain();
    sub_244EE1CDC();
    *(_QWORD *)&v95 = v32;
    *((_QWORD *)&v95 + 1) = v33;
    sub_244ECC8D0((uint64_t)v34, (uint64_t)v86);
    sub_244ECCA18((uint64_t)&v95, (uint64_t)v93, &qword_25742B358);
    v92[0] = v95;
    v92[1] = v96[0];
    v92[2] = v96[1];
    swift_bridgeObjectRetain();
    v35 = sub_244EE1D24();
    v36 = sub_244EE1F10();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = swift_slowAlloc();
      v38 = swift_slowAlloc();
      v91 = v38;
      *(_DWORD *)v37 = v80;
      sub_244ECC8D0((uint64_t)v81, (uint64_t)v82);
      v39 = sub_244EE1DF0();
      *(_QWORD *)(v37 + 4) = sub_244ECB0C4(v39, v40, &v91);
      v28 = v85;
      swift_bridgeObjectRelease();
      sub_244EBFC74((uint64_t)v92, &qword_25742B358);
      sub_244EBFC74((uint64_t)v93, &qword_25742B358);
      _os_log_impl(&dword_244EB5000, v35, v36, "property value: %s", (uint8_t *)v37, 0xCu);
      v20 = v78;
      swift_arrayDestroy();
      v41 = v38;
      v29 = v84;
      MEMORY[0x24952A198](v41, -1, -1);
      v42 = v37;
      v12 = v83;
      MEMORY[0x24952A198](v42, -1, -1);
    }
    else
    {
      sub_244EBFC74((uint64_t)v92, &qword_25742B358);
      sub_244EBFC74((uint64_t)v93, &qword_25742B358);
    }

    v28(v20, v29);
    if (v33)
    {
      swift_bridgeObjectRelease();
      sub_244EE1CDC();
      v43 = sub_244EE1D24();
      v44 = sub_244EE1F28();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v45 = 0;
        _os_log_impl(&dword_244EB5000, v43, v44, "Failed to capture dictionary property because it contained a label", v45, 2u);
        v46 = v45;
        v28 = v85;
        MEMORY[0x24952A198](v46, -1, -1);
      }

      v28(v17, v29);
      goto LABEL_12;
    }
    sub_244EC6898(v88, v72);
    v48 = v73;
    v47 = v74;
    v49 = (*(uint64_t (**)(char *, uint64_t))(v73 + 88))(v12, v74);
    if (v49 != v69)
    {
      sub_244EBFC74((uint64_t)v97, &qword_25742B358);
      (*(void (**)(char *, uint64_t))(v48 + 8))(v12, v47);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v48 + 96))(v12, v47);
    swift_bridgeObjectRelease();
    v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B328);
    (*(void (**)(char *, char *, uint64_t))(v71 + 32))(v75, &v12[*(int *)(v50 + 48)], v76);
    v51 = sub_244EE1AB4();
    if (v51 >> 62)
      v52 = sub_244EE209C();
    else
      v52 = *(_QWORD *)((v51 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRelease();
    if (v52 < 2)
    {
      (*(void (**)(char *, uint64_t))(v71 + 8))(v75, v76);
LABEL_12:
      sub_244EBFC74((uint64_t)v97, &qword_25742B358);
      goto LABEL_13;
    }
    result = sub_244EE1AB4();
    if ((result & 0xC000000000000001) != 0)
    {
      MEMORY[0x249529C58](0, result);
      goto LABEL_22;
    }
    if (!*(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10))
      break;
    swift_retain();
LABEL_22:
    swift_bridgeObjectRelease();
    sub_244EE1C7C();
    swift_release();
    result = sub_244EE1AB4();
    if ((result & 0xC000000000000001) != 0)
    {
      MEMORY[0x249529C58](1, result);
    }
    else
    {
      if (*(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
        goto LABEL_33;
      swift_retain();
    }
    swift_bridgeObjectRelease();
    v54 = v64;
    sub_244EE1C7C();
    swift_release();
    v56 = v73;
    v55 = v74;
    v57 = *(void (**)(char *, char *, uint64_t))(v73 + 16);
    v58 = (uint64_t)v65;
    v57(v65, v70, v74);
    sub_244EBEF9C(&qword_25742B368, (uint64_t (*)(uint64_t))MEMORY[0x24BEAFCA8], MEMORY[0x24BEAFCB8]);
    sub_244EE1FA0();
    v59 = (uint64_t)v66;
    sub_244EE1B14();
    v57((char *)v58, v54, v55);
    v60 = v77;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)&v95 = v60;
    sub_244ECBC14(v58, v59, isUniquelyReferenced_nonNull_native);
    v77 = v95;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v59, v68);
    v62 = *(void (**)(char *, uint64_t))(v56 + 8);
    v62(v54, v55);
    v62(v70, v55);
    (*(void (**)(char *, uint64_t))(v71 + 8))(v75, v76);
    sub_244EBFC74((uint64_t)v97, &qword_25742B358);
    v12 = v83;
    v29 = v84;
    v28 = v85;
LABEL_13:
    sub_244EE20D8();
    if (!v102)
      goto LABEL_31;
  }
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

unint64_t sub_244EC66E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  _QWORD v24[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B380);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B370);
  v6 = sub_244EE20C0();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v24[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_244ECCA18(v12, (uint64_t)v5, &qword_25742B380);
    result = sub_244ECB7B0((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_244EE1B20();
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    v19 = v7[7];
    v20 = sub_244EE1B2C();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v16, v9, v20);
    v21 = v7[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_11;
    v7[2] = v23;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_244EC6898@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
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
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  NSObject *v113;
  os_log_type_t v114;
  _BOOL4 v115;
  uint8_t *v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  void (*v120)(char *, uint64_t);
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unsigned int (*v126)(_QWORD, _QWORD, _QWORD);
  _QWORD *v127;
  void (*v128)(_QWORD, _QWORD, _QWORD);
  uint64_t v129;
  unsigned int (*v130)(uint64_t, uint64_t, _QWORD *);
  unsigned int v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char *v140;
  char v141;
  char *v142;
  void (*v143)(char *, _QWORD *);
  uint64_t v144;
  char *v145;
  NSObject *v146;
  os_log_type_t v147;
  uint8_t *v148;
  uint64_t v150;
  unsigned int (*v151)(uint64_t, uint64_t, uint64_t);
  char v152;
  uint64_t v153;
  uint64_t v154;
  void (*v155)(uint64_t, uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void (*v165)(char *, uint64_t, uint64_t);
  char *v166;
  uint64_t v167;
  char *v168;
  char *v169;
  NSObject *v170;
  os_log_type_t v171;
  char *v172;
  uint8_t *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  unint64_t v178;
  uint64_t v179;
  void *v180;
  id v181;
  char *v182;
  NSObject *v183;
  os_log_type_t v184;
  _BOOL4 v185;
  uint64_t v186;
  uint8_t *v187;
  id v188;
  uint64_t (*v189)(void);
  uint64_t *boxed_opaque_existential_0;
  char *v191;
  NSObject *v192;
  os_log_type_t v193;
  _BOOL4 v194;
  uint64_t v195;
  uint8_t *v196;
  uint64_t v197;
  uint64_t v198;
  unint64_t v199;
  char *v200;
  UIImage *v201;
  uint64_t v202;
  double v203;
  double v204;
  _QWORD *v205;
  uint64_t v206;
  uint64_t v207;
  _QWORD *v208;
  uint64_t v209;
  uint64_t v210;
  unsigned int v211;
  uint64_t v212;
  uint64_t v213;
  NSObject *v214;
  os_log_type_t v215;
  uint8_t *v216;
  uint64_t v217;
  void (*v218)(char *, char *, uint64_t);
  char *v219;
  uint64_t v220;
  uint64_t v221;
  void (*v222)(char *, uint64_t);
  char *v223;
  NSObject *v224;
  os_log_type_t v225;
  _BOOL4 v226;
  char *v227;
  uint8_t *v228;
  uint8_t *v229;
  uint64_t v230;
  char *v231;
  uint64_t v232;
  uint64_t v233;
  char *v234;
  char *v235;
  NSObject *v236;
  os_log_type_t v237;
  uint8_t *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  unint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  char *v246;
  char v247;
  void (*v248)(char *, _QWORD *);
  uint64_t v249;
  uint64_t v250;
  unint64_t v251;
  char *v252;
  void (*v253)(char *, uint64_t);
  unint64_t v254;
  NSData *v255;
  NSData *v256;
  void (*v257)(char *, uint64_t);
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  char *v262;
  NSObject *v263;
  os_log_type_t v264;
  uint8_t *v265;
  _QWORD *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  unint64_t v270;
  unint64_t v271;
  uint64_t v272;
  uint64_t v273;
  unsigned int (*v274)(uint64_t, uint64_t, uint64_t);
  void (*v275)(char *, uint64_t, uint64_t);
  char *v276;
  uint64_t v277;
  char *v278;
  unint64_t v279;
  unsigned int (*v280)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v281)(uint64_t);
  char *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  unsigned __int128 v286;
  char *v287;
  NSObject *v288;
  os_log_type_t v289;
  uint8_t *v290;
  uint64_t v291;
  uint64_t v292;
  void (*v293)(char *, uint64_t);
  void (*v294)(char *, uint64_t);
  uint64_t v295;
  uint64_t v296;
  void (*v297)(char *, uint64_t);
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  char *v301;
  void (*v302)(char *, char *, uint64_t);
  char *v303;
  void (*v304)(char *, char *, uint64_t);
  uint64_t v305;
  char *v306;
  uint64_t v307;
  char *v308;
  NSObject *v309;
  os_log_type_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  unint64_t v314;
  void (*v315)(char *, uint64_t);
  uint64_t v316;
  void (*v317)(char *, uint64_t);
  uint64_t v318;
  _QWORD *v319;
  uint64_t v320;
  uint64_t v321;
  char *v322;
  NSObject *v323;
  os_log_type_t v324;
  uint64_t v325;
  uint64_t v326;
  unint64_t v327;
  uint64_t v328;
  unint64_t v329;
  unint64_t v330;
  uint64_t v331;
  uint64_t v332;
  unint64_t v333;
  char *v334;
  NSObject *v335;
  os_log_type_t v336;
  uint64_t v337;
  uint64_t v338;
  unint64_t v339;
  uint64_t v340;
  uint64_t v341;
  unint64_t v342;
  unint64_t v343;
  uint64_t v344;
  void (*v345)(char *, uint64_t, uint64_t);
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  char *v349;
  void (*v350)(char *, char *, uint64_t);
  char *v351;
  NSObject *v352;
  os_log_type_t v353;
  int v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  unint64_t v360;
  uint64_t v361;
  unint64_t v362;
  uint64_t v363;
  uint64_t (*v364)(uint64_t);
  char *v365;
  uint64_t v366;
  void (*v367)(char *, char *, uint64_t);
  char *v368;
  void (*v369)(char *, char *, uint64_t);
  char *v370;
  char *v371;
  uint64_t v372;
  uint64_t v373;
  char *v374;
  char *v375;
  NSObject *v376;
  os_log_type_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  unint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  unint64_t v386;
  unsigned int (*v387)(_QWORD, _QWORD, _QWORD);
  uint64_t *v388;
  char *v389;
  uint64_t *v390;
  char *v391;
  NSObject *v392;
  os_log_type_t v393;
  _BOOL4 v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  unint64_t v399;
  char *v400;
  uint64_t v401;
  unint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t *v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  char *v410;
  uint64_t v411;
  void (*v412)(char *, uint64_t);
  void (*v413)(char *, uint64_t);
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  char *v417;
  void (*v418)(char *, uint64_t);
  char *v419;
  char *v420;
  NSObject *v421;
  os_log_type_t v422;
  uint8_t *v423;
  uint64_t v424;
  uint64_t v425;
  unint64_t v426;
  char *v427;
  char *v428;
  NSObject *v429;
  os_log_type_t v430;
  uint8_t *v431;
  uint64_t v432;
  uint64_t v433;
  unint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  _QWORD *v439;
  uint64_t v440;
  unint64_t v441;
  unint64_t v442;
  char *v443;
  NSObject *v444;
  os_log_type_t v445;
  uint8_t *v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  _QWORD *v451;
  _QWORD *v452;
  uint64_t v453;
  uint64_t *v454;
  char *v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  char *v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  void (*v464)(char *, uint64_t);
  void (*v465)(char *, uint64_t);
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  char *v469;
  char *v470;
  char *v471;
  char *v472;
  char *v473;
  char *v474;
  char *v475;
  char *v476;
  char *v477;
  char *v478;
  char *v479;
  char *v480;
  char *v481;
  char *v482;
  char *v483;
  char *v484;
  char *v485;
  char *v486;
  char *v487;
  char *v488;
  char *v489;
  char *v490;
  char *v491;
  char *v492;
  char *v493;
  char *v494;
  char *v495;
  uint64_t v496;
  char *v497;
  char *v498;
  uint64_t v499;
  char *v500;
  uint64_t v501;
  char *v502;
  uint64_t v503;
  char *v504;
  uint64_t v505;
  char *v506;
  char *v507;
  char *v508;
  char *v509;
  void (*v510)(_QWORD *, uint64_t, _QWORD *);
  void (*v511)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v512;
  uint64_t v513;
  char *v514;
  char *v515;
  char *v516;
  char *v517;
  char *v518;
  uint64_t v519;
  char *v520;
  uint64_t v521;
  char *v522;
  char *v523;
  uint64_t v524;
  uint64_t v525;
  _QWORD *v526;
  void (*v527)(char *, uint64_t);
  char *v528;
  char *v529;
  uint64_t v530;
  uint64_t v531;
  char *v532;
  _QWORD *v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  _QWORD *v537;
  uint64_t v538;
  _QWORD *v539;
  uint64_t v540;
  uint64_t DynamicType;
  uint64_t v542;
  __int128 v543;
  char v544[8];
  uint64_t v545;
  unsigned __int128 v546;
  __int128 v547;
  uint64_t v548;
  uint64_t v549;
  unsigned __int128 v550;
  __int128 v551;
  uint64_t v552;
  uint64_t v553;

  v519 = a2;
  v526 = a3;
  v501 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B2A8);
  v499 = *(_QWORD *)(v501 - 8);
  v4 = MEMORY[0x24BDAC7A8](v501);
  v471 = (char *)&v468 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v484 = (char *)&v468 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v473 = (char *)&v468 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v486 = (char *)&v468 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v502 = (char *)&v468 - v12;
  v505 = sub_244EE1AFC();
  v503 = *(_QWORD *)(v505 - 8);
  v13 = MEMORY[0x24BDAC7A8](v505);
  v15 = (char *)&v468 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v507 = (char *)&v468 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v508 = (char *)&v468 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v509 = (char *)&v468 - v20;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B2B0);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v476 = (char *)&v468 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v483 = (char *)&v468 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v474 = (char *)&v468 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v492 = (char *)&v468 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v529 = (char *)&v468 - v30;
  v31 = sub_244EE1B2C();
  v32 = *(_QWORD *)(v31 - 8);
  v33 = MEMORY[0x24BDAC7A8](v31);
  v477 = (char *)&v468 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = MEMORY[0x24BDAC7A8](v33);
  v478 = (char *)&v468 - v36;
  v37 = MEMORY[0x24BDAC7A8](v35);
  v469 = (char *)&v468 - v38;
  v39 = MEMORY[0x24BDAC7A8](v37);
  v487 = (char *)&v468 - v40;
  v41 = MEMORY[0x24BDAC7A8](v39);
  v491 = (char *)&v468 - v42;
  v43 = MEMORY[0x24BDAC7A8](v41);
  v520 = (char *)&v468 - v44;
  MEMORY[0x24BDAC7A8](v43);
  v523 = (char *)&v468 - v45;
  v539 = (_QWORD *)sub_244EE21A4();
  v538 = *(v539 - 1);
  MEMORY[0x24BDAC7A8](v539);
  v518 = (char *)&v468 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  v531 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B2B8);
  v47 = MEMORY[0x24BDAC7A8](v531);
  v512 = (uint64_t)&v468 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v47);
  v533 = (uint64_t *)((char *)&v468 - v49);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B2C0);
  v51 = MEMORY[0x24BDAC7A8](v50);
  v532 = (char *)&v468 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = MEMORY[0x24BDAC7A8](v51);
  v513 = (uint64_t)&v468 - v54;
  v55 = MEMORY[0x24BDAC7A8](v53);
  v534 = (uint64_t)&v468 - v56;
  v57 = MEMORY[0x24BDAC7A8](v55);
  v521 = (uint64_t)&v468 - v58;
  v59 = MEMORY[0x24BDAC7A8](v57);
  v537 = (uint64_t *)((char *)&v468 - v60);
  MEMORY[0x24BDAC7A8](v59);
  v528 = (char *)&v468 - v61;
  v62 = sub_244EE1D30();
  v527 = *(void (**)(char *, uint64_t))(v62 - 8);
  v63 = MEMORY[0x24BDAC7A8](v62);
  v480 = (char *)&v468 - ((v64 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = MEMORY[0x24BDAC7A8](v63);
  v479 = (char *)&v468 - v66;
  v67 = MEMORY[0x24BDAC7A8](v65);
  v493 = (char *)&v468 - v68;
  v69 = MEMORY[0x24BDAC7A8](v67);
  v475 = (char *)&v468 - v70;
  v71 = MEMORY[0x24BDAC7A8](v69);
  v495 = (char *)&v468 - v72;
  v73 = MEMORY[0x24BDAC7A8](v71);
  v481 = (char *)&v468 - v74;
  v75 = MEMORY[0x24BDAC7A8](v73);
  v482 = (char *)&v468 - v76;
  v77 = MEMORY[0x24BDAC7A8](v75);
  v494 = (char *)&v468 - v78;
  v79 = MEMORY[0x24BDAC7A8](v77);
  v506 = (char *)&v468 - v80;
  v81 = MEMORY[0x24BDAC7A8](v79);
  v489 = (char *)&v468 - v82;
  v83 = MEMORY[0x24BDAC7A8](v81);
  v472 = (char *)&v468 - v84;
  v85 = MEMORY[0x24BDAC7A8](v83);
  v498 = (char *)&v468 - v86;
  v87 = MEMORY[0x24BDAC7A8](v85);
  v488 = (char *)&v468 - v88;
  v89 = MEMORY[0x24BDAC7A8](v87);
  v490 = (char *)&v468 - v90;
  v91 = MEMORY[0x24BDAC7A8](v89);
  v515 = (char *)&v468 - v92;
  v93 = MEMORY[0x24BDAC7A8](v91);
  v514 = (char *)&v468 - v94;
  v95 = MEMORY[0x24BDAC7A8](v93);
  v522 = (char *)&v468 - v96;
  v97 = MEMORY[0x24BDAC7A8](v95);
  v517 = (char *)&v468 - v98;
  MEMORY[0x24BDAC7A8](v97);
  v100 = (char *)&v468 - v99;
  v101 = sub_244EE21C8();
  v530 = *(_QWORD *)(v101 - 8);
  v102 = MEMORY[0x24BDAC7A8](v101);
  v470 = (char *)&v468 - ((v103 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = MEMORY[0x24BDAC7A8](v102);
  v500 = (char *)&v468 - v105;
  v106 = MEMORY[0x24BDAC7A8](v104);
  v497 = (char *)&v468 - v107;
  v108 = MEMORY[0x24BDAC7A8](v106);
  v504 = (char *)&v468 - v109;
  MEMORY[0x24BDAC7A8](v108);
  v111 = (char *)&v468 - v110;
  v524 = a1;
  sub_244ECC8D0(a1, (uint64_t)&v550);
  sub_244EE218C();
  v112 = sub_244EE2198();
  sub_244EE1CDC();
  v113 = sub_244EE1D24();
  v114 = sub_244EE1F10();
  v115 = os_log_type_enabled(v113, v114);
  v540 = v31;
  v535 = v32;
  v525 = v101;
  v536 = v62;
  v496 = v112;
  v485 = v15;
  if (v115)
  {
    v116 = (uint8_t *)swift_slowAlloc();
    v117 = swift_slowAlloc();
    *(_QWORD *)&v550 = v117;
    *(_DWORD *)v116 = 136315138;
    *(_QWORD *)&v546 = v112;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742B318);
    v118 = sub_244EE1DF0();
    *(_QWORD *)&v546 = sub_244ECB0C4(v118, v119, (uint64_t *)&v550);
    v101 = v525;
    sub_244EE1F4C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_244EB5000, v113, v114, "RealityKitHierarchy capturing PropertyValue of subjectType: %s", v116, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24952A198](v117, -1, -1);
    MEMORY[0x24952A198](v116, -1, -1);

    v120 = (void (*)(char *, uint64_t))*((_QWORD *)v527 + 1);
    v121 = v100;
    v122 = v536;
  }
  else
  {

    v120 = (void (*)(char *, uint64_t))*((_QWORD *)v527 + 1);
    v121 = v100;
    v122 = v62;
  }
  v527 = v120;
  v120(v121, v122);
  v123 = (uint64_t)v528;
  sub_244EE21B0();
  v124 = *MEMORY[0x24BEE4390];
  v125 = v538;
  v126 = (unsigned int (*)(_QWORD, _QWORD, _QWORD))v537;
  v127 = v539;
  v510 = *(void (**)(_QWORD *, uint64_t, _QWORD *))(v538 + 104);
  v510(v537, v124, v539);
  v511 = *(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(v125 + 56);
  v511(v126, 0, 1, v127);
  v128 = (void (*)(_QWORD, _QWORD, _QWORD))v533;
  v129 = (uint64_t)v533 + *(int *)(v531 + 48);
  sub_244ECCA18(v123, (uint64_t)v533, &qword_25742B2C0);
  sub_244ECCA18((uint64_t)v126, v129, &qword_25742B2C0);
  v130 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD *))(v125 + 48);
  if (v130((uint64_t)v128, 1, v127) != 1)
  {
    v135 = v521;
    sub_244ECCA18((uint64_t)v128, v521, &qword_25742B2C0);
    if (v130(v129, 1, v127) != 1)
    {
      v136 = v101;
      v137 = v123;
      v138 = v135;
      v139 = v538;
      v140 = v518;
      (*(void (**)(char *, uint64_t, _QWORD *))(v538 + 32))(v518, v129, v127);
      v141 = sub_244EE1DD8();
      v142 = v111;
      v143 = *(void (**)(char *, _QWORD *))(v139 + 8);
      v143(v140, v539);
      sub_244EBFC74((uint64_t)v537, &qword_25742B2C0);
      v144 = v137;
      v101 = v136;
      sub_244EBFC74(v144, &qword_25742B2C0);
      v143((char *)v138, v539);
      v111 = v142;
      sub_244EBFC74((uint64_t)v533, &qword_25742B2C0);
      v132 = (uint64_t)v532;
      v133 = v534;
      v134 = (uint64_t)v529;
      if ((v141 & 1) == 0)
        goto LABEL_16;
      goto LABEL_11;
    }
    sub_244EBFC74((uint64_t)v537, &qword_25742B2C0);
    sub_244EBFC74(v123, &qword_25742B2C0);
    (*(void (**)(uint64_t, _QWORD *))(v538 + 8))(v135, v127);
    v132 = (uint64_t)v532;
    v133 = v534;
LABEL_9:
    sub_244EBFC74((uint64_t)v128, &qword_25742B2B8);
    v134 = (uint64_t)v529;
    goto LABEL_16;
  }
  sub_244EBFC74((uint64_t)v126, &qword_25742B2C0);
  sub_244EBFC74(v123, &qword_25742B2C0);
  v131 = v130(v129, 1, v127);
  v132 = (uint64_t)v532;
  v133 = v534;
  if (v131 != 1)
    goto LABEL_9;
  sub_244EBFC74((uint64_t)v128, &qword_25742B2C0);
  v134 = (uint64_t)v529;
LABEL_11:
  sub_244EE21BC();
  sub_244ECACFC(&v546);
  swift_release();
  if (v549)
  {
    v550 = v546;
    sub_244ECC9E4(&v547, &v551);
    v145 = v517;
    sub_244EE1CDC();
    v146 = sub_244EE1D24();
    v147 = sub_244EE1F10();
    if (os_log_type_enabled(v146, v147))
    {
      v148 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v148 = 0;
      _os_log_impl(&dword_244EB5000, v146, v147, "Unwrapping optional PropertyValue", v148, 2u);
      MEMORY[0x24952A198](v148, -1, -1);
    }

    v527(v145, v536);
    sub_244EC6898(&v551, v519);
    sub_244EBFC74((uint64_t)&v550, &qword_25742B358);
    return (*(uint64_t (**)(char *, uint64_t))(v530 + 8))(v111, v101);
  }
  sub_244EBFC74((uint64_t)&v546, &qword_25742B308);
  v133 = v534;
LABEL_16:
  v150 = v524;
  sub_244ECC8D0(v524, (uint64_t)&v550);
  sub_244EE1B08();
  v151 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v535 + 48);
  if (v151(v134, 1, v540) != 1)
  {
    v162 = v535;
    v163 = v101;
    v164 = (uint64_t)v111;
    v165 = *(void (**)(char *, uint64_t, uint64_t))(v535 + 32);
    v166 = v523;
    v167 = v540;
    v165(v523, v134, v540);
    v168 = v522;
    sub_244EE1CDC();
    v169 = v520;
    (*(void (**)(char *, char *, uint64_t))(v162 + 16))(v520, v166, v167);
    v170 = sub_244EE1D24();
    v171 = sub_244EE1F10();
    if (os_log_type_enabled(v170, v171))
    {
      v172 = v169;
      v173 = (uint8_t *)swift_slowAlloc();
      v174 = swift_slowAlloc();
      v175 = v540;
      v539 = v165;
      v176 = v174;
      *(_QWORD *)&v550 = v174;
      *(_DWORD *)v173 = 136315138;
      v516 = (char *)v164;
      sub_244EBEF9C(&qword_25742B360, (uint64_t (*)(uint64_t))MEMORY[0x24BEAFCA8], MEMORY[0x24BEAFCC0]);
      v177 = sub_244EE20FC();
      *(_QWORD *)&v546 = sub_244ECB0C4(v177, v178, (uint64_t *)&v550);
      sub_244EE1F4C();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v162 + 8))(v172, v175);
      _os_log_impl(&dword_244EB5000, v170, v171, "Encoded PropertyValueType as known type: %s", v173, 0xCu);
      swift_arrayDestroy();
      v179 = v176;
      v165 = (void (*)(char *, uint64_t, uint64_t))v539;
      MEMORY[0x24952A198](v179, -1, -1);
      MEMORY[0x24952A198](v173, -1, -1);

      v527(v522, v536);
      (*(void (**)(char *, uint64_t))(v530 + 8))(v516, v525);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v162 + 8))(v169, v540);
      v527(v168, v536);
      (*(void (**)(uint64_t, uint64_t))(v530 + 8))(v164, v163);
    }
    return ((uint64_t (*)(_QWORD *, char *, uint64_t))v165)(v526, v523, v540);
  }
  sub_244EBFC74(v134, &qword_25742B2B0);
  sub_244ECC8D0(v150, (uint64_t)&v543);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B2C8);
  v152 = swift_dynamicCast();
  v516 = v111;
  if ((v152 & 1) != 0)
  {
    v537 = v151;
    sub_244ECCA5C((__int128 *)&v546, (uint64_t)&v550);
    v153 = *((_QWORD *)&v551 + 1);
    v154 = v552;
    __swift_project_boxed_opaque_existential_1Tm(&v550, *((uint64_t *)&v551 + 1));
    v155 = *(void (**)(uint64_t, uint64_t))(v154 + 16);
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v157 = sub_244EE1F40();
    v158 = *(_QWORD *)(v157 - 8);
    MEMORY[0x24BDAC7A8](v157);
    v160 = (char *)&v468 - v159;
    v155(v153, v154);
    v161 = *(_QWORD *)(AssociatedTypeWitness - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v161 + 48))(v160, 1, AssociatedTypeWitness) != 1)
    {
      v545 = AssociatedTypeWitness;
      boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v543);
      (*(void (**)(uint64_t *, char *, uint64_t))(v161 + 32))(boxed_opaque_existential_0, v160, AssociatedTypeWitness);
      sub_244ECC9E4(&v543, &v546);
      v191 = v514;
      sub_244EE1CDC();
      sub_244ECC8D0((uint64_t)&v546, (uint64_t)&v543);
      v192 = sub_244EE1D24();
      v193 = sub_244EE1F10();
      v194 = os_log_type_enabled(v192, v193);
      v195 = v525;
      if (v194)
      {
        v196 = (uint8_t *)swift_slowAlloc();
        v197 = swift_slowAlloc();
        v542 = v197;
        *(_DWORD *)v196 = 136315138;
        __swift_project_boxed_opaque_existential_1Tm(&v543, v545);
        DynamicType = swift_getDynamicType();
        __swift_instantiateConcreteTypeFromMangledName(&qword_25742B318);
        v198 = sub_244EE1DF0();
        DynamicType = sub_244ECB0C4(v198, v199, &v542);
        sub_244EE1F4C();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v543);
        _os_log_impl(&dword_244EB5000, v192, v193, "Unwrapping value as type: %s", v196, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24952A198](v197, -1, -1);
        MEMORY[0x24952A198](v196, -1, -1);

        v200 = v514;
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v543);

        v200 = v191;
      }
      v527(v200, v536);
      v206 = v530;
      sub_244EC6898(&v546, v519);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v546);
      (*(void (**)(char *, uint64_t))(v206 + 8))(v516, v195);
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v550);
    }
    (*(void (**)(char *, uint64_t))(v158 + 8))(v160, v157);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v550);
    v101 = v525;
    v150 = v524;
    v132 = (uint64_t)v532;
    v133 = v534;
    v151 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v537;
  }
  else
  {
    v548 = 0;
    v546 = 0u;
    v547 = 0u;
    sub_244EBFC74((uint64_t)&v546, &qword_25742B2D0);
  }
  sub_244ECC8D0(v150, (uint64_t)&v550);
  if (swift_dynamicCast())
  {
    sub_244ECC90C(0, &qword_25742B2D8);
    v180 = (void *)sub_244EE1F34();
LABEL_29:
    v181 = v180;
    v182 = v515;
    sub_244EE1CDC();
    v183 = sub_244EE1D24();
    v184 = sub_244EE1F10();
    v185 = os_log_type_enabled(v183, v184);
    v186 = v530;
    if (v185)
    {
      v187 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v187 = 0;
      _os_log_impl(&dword_244EB5000, v183, v184, "Encoded PropertyValueType as a color", v187, 2u);
      MEMORY[0x24952A198](v187, -1, -1);
    }

    v527(v182, v536);
    v188 = objc_msgSend(v181, sel_CGColor);

    (*(void (**)(char *, uint64_t))(v186 + 8))(v516, v101);
    *v526 = v188;
    goto LABEL_32;
  }
  sub_244ECC8D0(v150, (uint64_t)&v550);
  sub_244ECC90C(0, &qword_25742B2D8);
  if (swift_dynamicCast())
  {
    v180 = (void *)v546;
    goto LABEL_29;
  }
  sub_244ECC8D0(v150, (uint64_t)&v550);
  sub_244ECC90C(0, &qword_25742B2E0);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v201 = (UIImage *)v546;
    objc_msgSend((id)v546, sel_size);
    v202 = v513;
    if (v203 > 1024.0 || (-[UIImage size](v201, sel_size), v204 > 1024.0))
    {

      (*(void (**)(char *, uint64_t))(v530 + 8))(v516, v101);
      v205 = v526;
      *v526 = 0xD000000000000037;
      v205[1] = 0x8000000244EE3B10;
LABEL_32:
      v189 = *(uint64_t (**)(void))(v535 + 104);
      return v189();
    }
    v255 = UIImagePNGRepresentation(v201);
    if (v255)
    {
      v256 = v255;
      v257 = v527;
      v258 = v536;
      v259 = sub_244EE16D0();
      v261 = v260;

      v262 = v490;
      sub_244EE1CDC();
      v263 = sub_244EE1D24();
      v264 = sub_244EE1F10();
      if (os_log_type_enabled(v263, v264))
      {
        v265 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v265 = 0;
        _os_log_impl(&dword_244EB5000, v263, v264, "Encoded PropertyValueType as an image", v265, 2u);
        MEMORY[0x24952A198](v265, -1, -1);
      }

      v257(v262, v258);
      (*(void (**)(char *, uint64_t))(v530 + 8))(v516, v101);
      v266 = v526;
      *v526 = v259;
      v266[1] = v261;
      goto LABEL_32;
    }
    v537 = v151;

  }
  else
  {
    v537 = v151;
    v202 = v513;
  }
  sub_244EE21B0();
  v207 = v133;
  v208 = v539;
  v510((_QWORD *)v202, *MEMORY[0x24BEE4380], v539);
  v511(v202, 0, 1, v208);
  v209 = v512;
  v210 = v512 + *(int *)(v531 + 48);
  sub_244ECCA18(v207, v512, &qword_25742B2C0);
  sub_244ECCA18(v202, v210, &qword_25742B2C0);
  if (v130(v209, 1, v208) == 1)
  {
    sub_244EBFC74(v202, &qword_25742B2C0);
    sub_244EBFC74(v207, &qword_25742B2C0);
    v211 = v130(v210, 1, v208);
    v212 = v530;
    v213 = v524;
    if (v211 == 1)
    {
      sub_244EBFC74(v512, &qword_25742B2C0);
      goto LABEL_64;
    }
    goto LABEL_50;
  }
  sub_244ECCA18(v209, v132, &qword_25742B2C0);
  if (v130(v210, 1, v208) == 1)
  {
    sub_244EBFC74(v513, &qword_25742B2C0);
    sub_244EBFC74(v534, &qword_25742B2C0);
    (*(void (**)(uint64_t, _QWORD *))(v538 + 8))(v132, v208);
    v212 = v530;
    v213 = v524;
LABEL_50:
    sub_244EBFC74(v512, &qword_25742B2B8);
    goto LABEL_51;
  }
  v245 = v538;
  v246 = v518;
  (*(void (**)(char *, uint64_t, _QWORD *))(v538 + 32))(v518, v210, v208);
  v247 = sub_244EE1DD8();
  v248 = *(void (**)(char *, _QWORD *))(v245 + 8);
  v248(v246, v208);
  sub_244EBFC74(v513, &qword_25742B2C0);
  sub_244EBFC74(v534, &qword_25742B2C0);
  v248((char *)v132, v208);
  sub_244EBFC74(v209, &qword_25742B2C0);
  v212 = v530;
  v213 = v524;
  if ((v247 & 1) == 0)
  {
LABEL_51:
    sub_244ECC8D0(v213, (uint64_t)&v550);
    sub_244EE1A6C();
    if (swift_dynamicCast())
    {
      sub_244EE1CDC();
      swift_retain();
      v214 = sub_244EE1D24();
      v215 = sub_244EE1F10();
      if (os_log_type_enabled(v214, v215))
      {
        v216 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v216 = 134217984;
        *(_QWORD *)&v550 = sub_244EE1A24();
        v212 = v530;
        sub_244EE1F4C();
        swift_release();
        _os_log_impl(&dword_244EB5000, v214, v215, "Encoded PropertyValueType as an EntityID: %llu", v216, 0xCu);
        v217 = v536;
        MEMORY[0x24952A198](v216, -1, -1);

      }
      else
      {

        swift_release();
        v217 = v536;
      }
      v527(v506, v217);
      v267 = sub_244EE1A24();
      swift_release();
      (*(void (**)(char *, uint64_t))(v212 + 8))(v516, v525);
      *v526 = v267;
      goto LABEL_32;
    }
    v218 = *(void (**)(char *, char *, uint64_t))(v212 + 16);
    v219 = v500;
    v218(v500, v516, v525);
    v220 = v519 - 1;
    if (v519 < 1)
    {
      v222 = *(void (**)(char *, uint64_t))(v212 + 8);
      v222(v219, v525);
      v244 = v536;
LABEL_121:
      sub_244ECC8D0(v213, (uint64_t)&v543);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742B2E8);
      if (swift_dynamicCast())
      {
        sub_244ECCA5C((__int128 *)&v546, (uint64_t)&v550);
        v420 = v493;
        sub_244EE1CDC();
        sub_244ECC944((uint64_t)&v550, (uint64_t)&v546);
        v421 = sub_244EE1D24();
        v422 = sub_244EE1F10();
        if (os_log_type_enabled(v421, v422))
        {
          v423 = (uint8_t *)swift_slowAlloc();
          v424 = swift_slowAlloc();
          *(_QWORD *)&v543 = v424;
          *(_DWORD *)v423 = 136315138;
          v539 = v423 + 4;
          __swift_project_boxed_opaque_existential_1Tm(&v546, *((uint64_t *)&v547 + 1));
          v425 = sub_244EE20FC();
          v542 = sub_244ECB0C4(v425, v426, (uint64_t *)&v543);
          sub_244EE1F4C();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v546);
          _os_log_impl(&dword_244EB5000, v421, v422, "Encoded PropertyValueType as a string (CustomStringConvertible): %s", v423, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24952A198](v424, -1, -1);
          MEMORY[0x24952A198](v423, -1, -1);

          v427 = v493;
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v546);

          v427 = v420;
        }
        v527(v427, v244);
        __swift_project_boxed_opaque_existential_1Tm(&v550, *((uint64_t *)&v551 + 1));
        v436 = sub_244EE20FC();
        v438 = v437;
        v222(v516, v525);
        v439 = v526;
        *v526 = v436;
        v439[1] = v438;
      }
      else
      {
        v548 = 0;
        v546 = 0u;
        v547 = 0u;
        sub_244EBFC74((uint64_t)&v546, &qword_25742B2F0);
        sub_244ECC8D0(v213, (uint64_t)&v543);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25742B2F8);
        if (!swift_dynamicCast())
        {
          v548 = 0;
          v546 = 0u;
          v547 = 0u;
          sub_244EBFC74((uint64_t)&v546, &qword_25742B300);
          sub_244ECC8D0(v213, (uint64_t)&v550);
          v440 = sub_244EE1DF0();
          v442 = v441;
          v443 = v480;
          sub_244EE1CDC();
          swift_bridgeObjectRetain_n();
          v444 = sub_244EE1D24();
          v445 = sub_244EE1F10();
          if (os_log_type_enabled(v444, v445))
          {
            v446 = (uint8_t *)swift_slowAlloc();
            v447 = swift_slowAlloc();
            *(_QWORD *)&v550 = v447;
            v539 = v222;
            *(_DWORD *)v446 = 136315138;
            swift_bridgeObjectRetain();
            *(_QWORD *)&v546 = sub_244ECB0C4(v440, v442, (uint64_t *)&v550);
            sub_244EE1F4C();
            swift_bridgeObjectRelease_n();
            _os_log_impl(&dword_244EB5000, v444, v445, "Encoded PropertyValueType as a string (Unknown): %s", v446, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24952A198](v447, -1, -1);
            MEMORY[0x24952A198](v446, -1, -1);

            v527(v443, v536);
            ((void (*)(char *, uint64_t))v539)(v516, v525);
          }
          else
          {
            swift_bridgeObjectRelease_n();

            v527(v443, v244);
            v222(v516, v525);
          }
          v452 = v526;
          *v526 = v440;
          v452[1] = v442;
          v189 = *(uint64_t (**)(void))(v535 + 104);
          return v189();
        }
        v539 = v222;
        sub_244ECCA5C((__int128 *)&v546, (uint64_t)&v550);
        v428 = v479;
        sub_244EE1CDC();
        sub_244ECC944((uint64_t)&v550, (uint64_t)&v546);
        v429 = sub_244EE1D24();
        v430 = sub_244EE1F10();
        if (os_log_type_enabled(v429, v430))
        {
          v431 = (uint8_t *)swift_slowAlloc();
          v432 = swift_slowAlloc();
          v542 = v432;
          *(_DWORD *)v431 = 136315138;
          sub_244ECC944((uint64_t)&v546, (uint64_t)&v543);
          v433 = sub_244EE1DF0();
          *(_QWORD *)&v543 = sub_244ECB0C4(v433, v434, &v542);
          v435 = (uint64_t)v516;
          sub_244EE1F4C();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v546);
          _os_log_impl(&dword_244EB5000, v429, v430, "Encoded PropertyValueType as a string (CustomDebugStringConvertible): %s", v431, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24952A198](v432, -1, -1);
          MEMORY[0x24952A198](v431, -1, -1);

          v527(v428, v536);
        }
        else
        {
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v546);

          v527(v428, v244);
          v435 = (uint64_t)v516;
        }
        __swift_project_boxed_opaque_existential_1Tm(&v550, *((uint64_t *)&v551 + 1));
        v448 = sub_244EE20FC();
        v450 = v449;
        ((void (*)(uint64_t, uint64_t))v539)(v435, v525);
        v451 = v526;
        *v526 = v448;
        v451[1] = v450;
      }
      (*(void (**)(void))(v535 + 104))();
      return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v550);
    }
    sub_244EE21BC();
    v221 = sub_244EE2060();
    swift_release();
    v222 = *(void (**)(char *, uint64_t))(v212 + 8);
    v222(v219, v525);
    if (v221 > 0)
    {
      v223 = v494;
      sub_244EE1CDC();
      v224 = sub_244EE1D24();
      v225 = sub_244EE1F10();
      v226 = os_log_type_enabled(v224, v225);
      v227 = v495;
      if (v226)
      {
        v228 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v228 = 0;
        _os_log_impl(&dword_244EB5000, v224, v225, "Unwrapping complex property type", v228, 2u);
        v229 = v228;
        v227 = v495;
        v223 = v494;
        MEMORY[0x24952A198](v229, -1, -1);
      }

      v527(v223, v536);
      sub_244EE21BC();
      sub_244ECACFC(&v550);
      swift_release();
      if (v553)
      {
        v230 = *((_QWORD *)&v550 + 1);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v551);
        if (v230)
        {
          v539 = v222;
          swift_bridgeObjectRelease();
          v231 = v484;
          v232 = (uint64_t)v516;
          sub_244EC4E74(v516, v220, MEMORY[0x24BEE4AF8]);
          v233 = v501;
          if ((sub_244EE1AD8() & 1) == 0)
          {
            sub_244EE1CDC();
            v348 = v499;
            v349 = v231;
            v350 = *(void (**)(char *, char *, uint64_t))(v499 + 16);
            v351 = v471;
            v350(v471, v349, v233);
            v352 = sub_244EE1D24();
            v353 = sub_244EE1F10();
            v354 = v353;
            if (os_log_type_enabled(v352, v353))
            {
              v355 = swift_slowAlloc();
              LODWORD(v538) = v354;
              v356 = v355;
              v357 = swift_slowAlloc();
              *(_QWORD *)&v550 = v357;
              *(_DWORD *)v356 = 136315394;
              v358 = v496;
              *(_QWORD *)&v546 = v496;
              __swift_instantiateConcreteTypeFromMangledName(&qword_25742B318);
              v359 = sub_244EE1DF0();
              *(_QWORD *)&v546 = sub_244ECB0C4(v359, v360, (uint64_t *)&v550);
              sub_244EE1F4C();
              swift_bridgeObjectRelease();
              *(_WORD *)(v356 + 12) = 2080;
              v350(v486, v351, v233);
              v361 = sub_244EE1DF0();
              *(_QWORD *)&v546 = sub_244ECB0C4(v361, v362, (uint64_t *)&v550);
              sub_244EE1F4C();
              v363 = v499;
              swift_bridgeObjectRelease();
              (*(void (**)(char *, uint64_t))(v363 + 8))(v351, v233);
              _os_log_impl(&dword_244EB5000, v352, (os_log_type_t)v538, "Encoded PropertyValueType as a nested type: %s -> %s", (uint8_t *)v356, 0x16u);
              swift_arrayDestroy();
              MEMORY[0x24952A198](v357, -1, -1);
              MEMORY[0x24952A198](v356, -1, -1);

              v527(v495, v536);
            }
            else
            {
              (*(void (**)(char *, uint64_t))(v348 + 8))(v351, v233);

              v527(v227, v536);
              v363 = v348;
              v358 = v496;
            }
            v453 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B328);
            v454 = v526;
            v455 = (char *)v526 + *(int *)(v453 + 48);
            *(_QWORD *)&v550 = v358;
            __swift_instantiateConcreteTypeFromMangledName(&qword_25742B318);
            v456 = sub_244EE1DF0();
            v458 = v457;
            ((void (*)(char *, uint64_t))v539)(v516, v525);
            *v454 = v456;
            v454[1] = v458;
            (*(void (**)(char *, char *, uint64_t))(v363 + 32))(v455, v484, v233);
            v189 = *(uint64_t (**)(void))(v535 + 104);
            return v189();
          }
          v234 = v475;
          sub_244EE1CDC();
          v235 = v470;
          v218(v470, (char *)v232, v525);
          v236 = sub_244EE1D24();
          v237 = sub_244EE1F1C();
          if (os_log_type_enabled(v236, v237))
          {
            v238 = (uint8_t *)swift_slowAlloc();
            v239 = swift_slowAlloc();
            *(_QWORD *)&v550 = v239;
            *(_DWORD *)v238 = 136315138;
            v240 = v525;
            v241 = sub_244EE20FC();
            *(_QWORD *)&v546 = sub_244ECB0C4(v241, v242, (uint64_t *)&v550);
            sub_244EE1F4C();
            swift_bridgeObjectRelease();
            v243 = v240;
            v222 = (void (*)(char *, uint64_t))v539;
            ((void (*)(char *, uint64_t))v539)(v235, v243);
            _os_log_impl(&dword_244EB5000, v236, v237, "Nested PropertyValueType has no properties %s", v238, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24952A198](v239, -1, -1);
            MEMORY[0x24952A198](v238, -1, -1);

            v244 = v536;
            v527(v475, v536);
            (*(void (**)(char *, uint64_t))(v499 + 8))(v484, v501);
          }
          else
          {

            v417 = v235;
            v418 = (void (*)(char *, uint64_t))v539;
            ((void (*)(char *, uint64_t))v539)(v417, v525);
            v244 = v536;
            v527(v234, v536);
            v419 = v231;
            v222 = v418;
            (*(void (**)(char *, uint64_t))(v499 + 8))(v419, v501);
          }
          goto LABEL_120;
        }
      }
      else
      {
        sub_244EBFC74((uint64_t)&v550, &qword_25742B308);
      }
      sub_244ECC8D0(v524, (uint64_t)&v550);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742B310);
      if (swift_dynamicCast())
      {
        swift_bridgeObjectRelease();
        v320 = (uint64_t)v516;
        v321 = sub_244EC5EBC((uint64_t)v516, v519);
        v322 = v482;
        sub_244EE1CDC();
        swift_bridgeObjectRetain_n();
        v323 = sub_244EE1D24();
        v324 = sub_244EE1F10();
        if (os_log_type_enabled(v323, v324))
        {
          v325 = swift_slowAlloc();
          v538 = swift_slowAlloc();
          *(_QWORD *)&v550 = v538;
          *(_DWORD *)v325 = 136315394;
          *(_QWORD *)&v546 = v496;
          __swift_instantiateConcreteTypeFromMangledName(&qword_25742B318);
          v326 = sub_244EE1DF0();
          v539 = v222;
          *(_QWORD *)&v546 = sub_244ECB0C4(v326, v327, (uint64_t *)&v550);
          sub_244EE1F4C();
          swift_bridgeObjectRelease();
          *(_WORD *)(v325 + 12) = 2080;
          sub_244EE1B20();
          sub_244EBEF9C(&qword_25742B320, (uint64_t (*)(uint64_t))MEMORY[0x24BEAFC50], MEMORY[0x24BEAFC60]);
          swift_bridgeObjectRetain();
          v328 = sub_244EE1D6C();
          v330 = v329;
          swift_bridgeObjectRelease();
          *(_QWORD *)&v546 = sub_244ECB0C4(v328, v330, (uint64_t *)&v550);
          sub_244EE1F4C();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_244EB5000, v323, v324, "Encoded PropertyValueType as an dictionary: %s -> %s", (uint8_t *)v325, 0x16u);
          v331 = v538;
          swift_arrayDestroy();
          MEMORY[0x24952A198](v331, -1, -1);
          MEMORY[0x24952A198](v325, -1, -1);

          v527(v482, v536);
          ((void (*)(uint64_t, uint64_t))v539)(v320, v525);
        }
        else
        {
          swift_bridgeObjectRelease_n();

          v527(v322, v536);
          v222((char *)v320, v525);
        }
        *v526 = v321;
      }
      else
      {
        v332 = (uint64_t)v516;
        v333 = sub_244EC5908((uint64_t)v516, v519);
        v334 = v481;
        sub_244EE1CDC();
        swift_bridgeObjectRetain_n();
        v335 = sub_244EE1D24();
        v336 = sub_244EE1F10();
        if (os_log_type_enabled(v335, v336))
        {
          v337 = swift_slowAlloc();
          v538 = swift_slowAlloc();
          *(_QWORD *)&v550 = v538;
          *(_DWORD *)v337 = 136315394;
          *(_QWORD *)&v546 = v496;
          __swift_instantiateConcreteTypeFromMangledName(&qword_25742B318);
          v338 = sub_244EE1DF0();
          *(_QWORD *)&v546 = sub_244ECB0C4(v338, v339, (uint64_t *)&v550);
          v539 = v222;
          sub_244EE1F4C();
          swift_bridgeObjectRelease();
          *(_WORD *)(v337 + 12) = 2080;
          v340 = swift_bridgeObjectRetain();
          v341 = MEMORY[0x249529AF0](v340, v540);
          v343 = v342;
          swift_bridgeObjectRelease();
          *(_QWORD *)&v546 = sub_244ECB0C4(v341, v343, (uint64_t *)&v550);
          sub_244EE1F4C();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_244EB5000, v335, v336, "Encoded PropertyValueType as an array: %s -> %s", (uint8_t *)v337, 0x16u);
          v344 = v538;
          swift_arrayDestroy();
          MEMORY[0x24952A198](v344, -1, -1);
          MEMORY[0x24952A198](v337, -1, -1);

          v527(v481, v536);
          ((void (*)(uint64_t, uint64_t))v539)(v332, v525);
        }
        else
        {
          swift_bridgeObjectRelease_n();

          v527(v334, v536);
          v222((char *)v332, v525);
        }
        *v526 = v333;
      }
      goto LABEL_88;
    }
    v244 = v536;
LABEL_120:
    v213 = v524;
    goto LABEL_121;
  }
LABEL_64:
  sub_244EE1AF0();
  sub_244EE1AF0();
  sub_244EE1AF0();
  v249 = (uint64_t)v516;
  sub_244EE21BC();
  sub_244ECACFC(&v546);
  swift_release();
  if (!v549)
  {
    sub_244EBFC74((uint64_t)&v546, &qword_25742B308);
    v268 = v524;
    sub_244ECC8D0(v524, (uint64_t)&v550);
    v269 = sub_244EE1DF0();
    v271 = v270;
    sub_244ECC8D0(v268, (uint64_t)&v543);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742B330);
    if ((swift_dynamicCast() & 1) == 0)
    {
      v548 = 0;
      v546 = 0u;
      v547 = 0u;
      sub_244EBFC74((uint64_t)&v546, &qword_25742B338);
      v278 = v489;
      goto LABEL_93;
    }
    sub_244ECCA5C((__int128 *)&v546, (uint64_t)&v550);
    *((_QWORD *)&v547 + 1) = MEMORY[0x24BEE0D00];
    *(_QWORD *)&v546 = v269;
    *((_QWORD *)&v546 + 1) = v271;
    swift_bridgeObjectRetain();
    v272 = (uint64_t)v483;
    sub_244EE1B08();
    v273 = v540;
    v274 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v537;
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v537)(v272, 1, v540) == 1)
    {
LABEL_77:
      v278 = v489;
      sub_244EBFC74(v272, &qword_25742B2B0);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v550);
LABEL_93:
      sub_244EE1CDC();
      swift_bridgeObjectRetain_n();
      v309 = sub_244EE1D24();
      v310 = sub_244EE1F10();
      if (os_log_type_enabled(v309, v310))
      {
        v311 = swift_slowAlloc();
        v312 = swift_slowAlloc();
        *(_QWORD *)&v550 = v312;
        *(_DWORD *)v311 = 136315394;
        *(_QWORD *)&v546 = v496;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25742B318);
        v313 = sub_244EE1DF0();
        *(_QWORD *)&v546 = sub_244ECB0C4(v313, v314, (uint64_t *)&v550);
        sub_244EE1F4C();
        swift_bridgeObjectRelease();
        *(_WORD *)(v311 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(_QWORD *)&v546 = sub_244ECB0C4(v269, v271, (uint64_t *)&v550);
        sub_244EE1F4C();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_244EB5000, v309, v310, "Encoded PropertyValueType as an enumeration: %s -> %s", (uint8_t *)v311, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24952A198](v312, -1, -1);
        MEMORY[0x24952A198](v311, -1, -1);

        v527(v278, v536);
        v315 = *(void (**)(char *, uint64_t))(v503 + 8);
        v316 = v505;
        v315(v507, v505);
        v315(v508, v316);
        v315(v509, v316);
        (*(void (**)(char *, uint64_t))(v530 + 8))(v516, v525);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        v527(v278, v536);
        v317 = *(void (**)(char *, uint64_t))(v503 + 8);
        v318 = v505;
        v317(v507, v505);
        v317(v508, v318);
        v317(v509, v318);
        (*(void (**)(char *, uint64_t))(v212 + 8))(v516, v525);
      }
      v319 = v526;
      *v526 = v269;
      v319[1] = v271;
      goto LABEL_32;
    }
    v275 = *(void (**)(char *, uint64_t, uint64_t))(v535 + 32);
    v276 = v478;
    v275(v478, v272, v273);
    __swift_project_boxed_opaque_existential_1Tm(&v550, *((uint64_t *)&v551 + 1));
    *((_QWORD *)&v547 + 1) = swift_getAssociatedTypeWitness();
    __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v546);
    v277 = v540;
    sub_244EE1E68();
    v272 = (uint64_t)v476;
    sub_244EE1B08();
    if (v274(v272, 1, v277) == 1)
    {
      (*(void (**)(char *, uint64_t))(v535 + 8))(v276, v277);
      goto LABEL_77;
    }
    swift_bridgeObjectRelease();
    v275(v477, v272, v277);
    sub_244EE1C88();
    v364 = (uint64_t (*)(uint64_t))MEMORY[0x24BEAFDE0];
    sub_244EBEF9C(&qword_25742B340, (uint64_t (*)(uint64_t))MEMORY[0x24BEAFC08], MEMORY[0x24BEAFC00]);
    sub_244EBEF9C(&qword_25742B348, v364, MEMORY[0x24BEAFDD8]);
    v365 = v473;
    v366 = v505;
    sub_244EE1AE4();
    v367 = *(void (**)(char *, char *, uint64_t))(v503 + 16);
    v368 = v485;
    v367(v485, v509, v366);
    v369 = *(void (**)(char *, char *, uint64_t))(v535 + 16);
    v370 = v276;
    v371 = v487;
    v369(v487, v370, v277);
    swift_allocObject();
    v539 = (_QWORD *)sub_244EE1C70();
    v372 = v501;
    sub_244EE1ACC();
    v367(v368, v508, v366);
    v369(v371, v477, v277);
    __swift_project_boxed_opaque_existential_1Tm(&v550, *((uint64_t *)&v551 + 1));
    *((_QWORD *)&v547 + 1) = swift_getAssociatedTypeWitness();
    __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v546);
    sub_244EE1E68();
    sub_244ECCA98(&v546);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v546);
    swift_allocObject();
    v373 = sub_244EE1C70();
    v374 = v365;
    sub_244EE1ACC();
    v375 = v472;
    sub_244EE1CDC();
    v376 = sub_244EE1D24();
    v377 = sub_244EE1F10();
    if (os_log_type_enabled(v376, v377))
    {
      v378 = swift_slowAlloc();
      v537 = (_QWORD *)swift_slowAlloc();
      *(_QWORD *)&v546 = v537;
      *(_DWORD *)v378 = 136315394;
      v379 = v496;
      *(_QWORD *)&v543 = v496;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25742B318);
      v380 = v372;
      v381 = sub_244EE1DF0();
      v538 = v373;
      *(_QWORD *)&v543 = sub_244ECB0C4(v381, v382, (uint64_t *)&v546);
      v383 = v540;
      sub_244EE1F4C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v378 + 12) = 2080;
      swift_beginAccess();
      v384 = v499;
      (*(void (**)(char *, char *, uint64_t))(v499 + 16))(v486, v374, v380);
      v385 = sub_244EE1DF0();
      v542 = sub_244ECB0C4(v385, v386, (uint64_t *)&v546);
      sub_244EE1F4C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_244EB5000, v376, v377, "Encoded PropertyValueType as an enumeration with raw value: %s -> %s", (uint8_t *)v378, 0x16u);
      v387 = (unsigned int (*)(_QWORD, _QWORD, _QWORD))v537;
      swift_arrayDestroy();
      MEMORY[0x24952A198](v387, -1, -1);
      MEMORY[0x24952A198](v378, -1, -1);

      v527(v472, v536);
      v388 = v526;
      v365 = v473;
    }
    else
    {

      v527(v375, v536);
      v388 = v526;
      v384 = v499;
      v379 = v496;
      v383 = v540;
    }
    v459 = (char *)v388 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25742B328) + 48);
    *(_QWORD *)&v546 = v379;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742B318);
    v460 = sub_244EE1DF0();
    v462 = v461;
    swift_release();
    swift_release();
    v463 = v535;
    v464 = *(void (**)(char *, uint64_t))(v535 + 8);
    v464(v477, v383);
    v464(v478, v383);
    v465 = *(void (**)(char *, uint64_t))(v503 + 8);
    v466 = v505;
    v465(v507, v505);
    v465(v508, v466);
    v465(v509, v466);
    (*(void (**)(char *, uint64_t))(v530 + 8))(v516, v525);
    *v388 = v460;
    v388[1] = v462;
    swift_beginAccess();
    v467 = v501;
    (*(void (**)(char *, char *, uint64_t))(v384 + 16))(v459, v365, v501);
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v463 + 104))(v388, *MEMORY[0x24BEAFC18], v383);
    (*(void (**)(char *, uint64_t))(v384 + 8))(v365, v467);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v550);
  }
  v251 = *((_QWORD *)&v546 + 1);
  v250 = v546;
  v550 = v546;
  sub_244ECC9E4(&v547, &v551);
  sub_244ECC8D0((uint64_t)&v551, (uint64_t)&v547);
  swift_bridgeObjectRetain();
  sub_244EE218C();
  v546 = __PAIR128__(v251, v250);
  sub_244ECC8D0((uint64_t)&v551, (uint64_t)&v547);
  v252 = v497;
  (*(void (**)(char *, uint64_t, uint64_t))(v212 + 16))(v497, v249, v525);
  if (v251)
  {
    v253 = *(void (**)(char *, uint64_t))(v212 + 8);
    swift_bridgeObjectRetain();
    v253(v252, v525);
    v254 = v251;
  }
  else
  {
    *(_QWORD *)&v543 = sub_244EE21BC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742B350);
    v250 = sub_244EE1DF0();
    v254 = v279;
    v253 = *(void (**)(char *, uint64_t))(v212 + 8);
    v253(v252, v525);
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v547);
  v280 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v537;
  v539 = v253;
  if (v519 < 1)
    goto LABEL_83;
  v538 = v519 - 1;
  sub_244EE1C88();
  v281 = (uint64_t (*)(uint64_t))MEMORY[0x24BEAFDE0];
  sub_244EBEF9C(&qword_25742B340, (uint64_t (*)(uint64_t))MEMORY[0x24BEAFC08], MEMORY[0x24BEAFC00]);
  sub_244EBEF9C(&qword_25742B348, v281, MEMORY[0x24BEAFDD8]);
  v282 = v502;
  v283 = v505;
  sub_244EE1AE4();
  v545 = MEMORY[0x24BEE0D00];
  *(_QWORD *)&v543 = v250;
  *((_QWORD *)&v543 + 1) = v254;
  swift_bridgeObjectRetain();
  v284 = (uint64_t)v492;
  sub_244EE1B08();
  v285 = v540;
  if (v280(v284, 1, v540) == 1)
  {
    sub_244EBFC74(v284, &qword_25742B2B0);
    (*(void (**)(char *, uint64_t))(v499 + 8))(v282, v501);
    v253 = (void (*)(char *, uint64_t))v539;
LABEL_83:
    sub_244ECC8D0((uint64_t)&v551, (uint64_t)&v547);
    swift_bridgeObjectRelease();
    sub_244EE1DF0();
    *(_QWORD *)&v546 = v250;
    *((_QWORD *)&v546 + 1) = v254;
    sub_244EE1E2C();
    sub_244EE1E2C();
    swift_bridgeObjectRelease();
    sub_244EE1E2C();
    v286 = v546;
    v287 = v498;
    sub_244EE1CDC();
    swift_bridgeObjectRetain_n();
    v288 = sub_244EE1D24();
    v289 = sub_244EE1F10();
    if (os_log_type_enabled(v288, v289))
    {
      v290 = (uint8_t *)swift_slowAlloc();
      v291 = swift_slowAlloc();
      *(_QWORD *)&v546 = v291;
      *(_DWORD *)v290 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v543 = sub_244ECB0C4(v286, *((unint64_t *)&v286 + 1), (uint64_t *)&v546);
      sub_244EE1F4C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_244EB5000, v288, v289, "Encoded PropertyValueType as an simplified enumeration: %s", v290, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952A198](v291, -1, -1);
      MEMORY[0x24952A198](v290, -1, -1);

      v527(v498, v536);
      v292 = v525;
      v293 = (void (*)(char *, uint64_t))v539;
      ((void (*)(char *, uint64_t))v539)(v504, v525);
      sub_244EBFC74((uint64_t)&v550, &qword_25742B358);
      v294 = *(void (**)(char *, uint64_t))(v503 + 8);
      v295 = v505;
      v294(v507, v505);
      v294(v508, v295);
      v294(v509, v295);
      v293(v516, v292);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      v527(v287, v536);
      v296 = v525;
      v253(v504, v525);
      sub_244EBFC74((uint64_t)&v550, &qword_25742B358);
      v297 = *(void (**)(char *, uint64_t))(v503 + 8);
      v298 = v505;
      v297(v507, v505);
      v297(v508, v298);
      v297(v509, v298);
      v253(v516, v296);
    }
    *(_OWORD *)v526 = v286;
LABEL_88:
    v189 = *(uint64_t (**)(void))(v535 + 104);
    return v189();
  }
  v537 = v280;
  v299 = v535;
  swift_bridgeObjectRelease();
  v300 = v285;
  v301 = v491;
  v533 = *(_QWORD **)(v299 + 32);
  ((void (*)(char *, uint64_t, uint64_t))v533)(v491, v284, v285);
  v302 = *(void (**)(char *, char *, uint64_t))(v503 + 16);
  v303 = v485;
  v302(v485, v509, v283);
  v304 = *(void (**)(char *, char *, uint64_t))(v299 + 16);
  v304(v487, v301, v300);
  swift_allocObject();
  v534 = sub_244EE1C70();
  v305 = v501;
  sub_244EE1ACC();
  v306 = v504;
  sub_244EE21BC();
  v307 = sub_244EE2060();
  swift_release();
  if (v307 < 1)
  {
    v345 = (void (*)(char *, uint64_t, uint64_t))v533;
    sub_244ECC8D0((uint64_t)&v551, (uint64_t)v544);
    swift_bridgeObjectRelease();
    v346 = (uint64_t)v474;
    sub_244EE1B08();
    v347 = v540;
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v537)(v346, 1, v540) == 1)
    {
      sub_244EBFC74(v346, &qword_25742B2B0);
      v305 = v501;
    }
    else
    {
      v389 = v469;
      v345(v469, v346, v347);
      v302(v303, v507, v505);
      v304(v487, v389, v347);
      v545 = v347;
      v390 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v543);
      v304((char *)v390, v389, v347);
      sub_244ECCA98(&v543);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v543);
      swift_allocObject();
      sub_244EE1C70();
      v305 = v501;
      sub_244EE1ACC();
      swift_release();
      (*(void (**)(char *, uint64_t))(v535 + 8))(v389, v347);
    }
    v306 = v504;
  }
  else
  {
    swift_bridgeObjectRelease();
    v308 = v486;
    sub_244EC4E74(v306, v538, MEMORY[0x24BEE4AF8]);
    sub_244EE1AC0();
    (*(void (**)(char *, uint64_t))(v499 + 8))(v308, v305);
  }
  v391 = v488;
  sub_244EE1CDC();
  v392 = sub_244EE1D24();
  v393 = sub_244EE1F10();
  v394 = os_log_type_enabled(v392, v393);
  v395 = v496;
  if (v394)
  {
    v396 = swift_slowAlloc();
    v397 = swift_slowAlloc();
    *(_QWORD *)&v543 = v397;
    *(_DWORD *)v396 = 136315394;
    v542 = v395;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742B318);
    v398 = sub_244EE1DF0();
    v542 = sub_244ECB0C4(v398, v399, (uint64_t *)&v543);
    sub_244EE1F4C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v396 + 12) = 2080;
    v400 = v502;
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v499 + 16))(v486, v400, v305);
    v401 = sub_244EE1DF0();
    DynamicType = sub_244ECB0C4(v401, v402, (uint64_t *)&v543);
    sub_244EE1F4C();
    v306 = v504;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_244EB5000, v392, v393, "Encoded PropertyValueType as an enumeration with associated values: %s -> %s", (uint8_t *)v396, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24952A198](v397, -1, -1);
    MEMORY[0x24952A198](v396, -1, -1);

    v527(v488, v536);
    v403 = v535;
  }
  else
  {

    v527(v391, v536);
    v403 = v535;
    v400 = v502;
  }
  v404 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B328);
  v405 = v526;
  v538 = (uint64_t)v526 + *(int *)(v404 + 48);
  *(_QWORD *)&v543 = v395;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B318);
  v406 = sub_244EE1DF0();
  v408 = v407;
  swift_release();
  v409 = v540;
  (*(void (**)(char *, uint64_t))(v403 + 8))(v491, v540);
  v410 = v306;
  v411 = v525;
  v412 = (void (*)(char *, uint64_t))v539;
  ((void (*)(char *, uint64_t))v539)(v410, v525);
  sub_244EBFC74((uint64_t)&v550, &qword_25742B358);
  v413 = *(void (**)(char *, uint64_t))(v503 + 8);
  v414 = v505;
  v413(v507, v505);
  v413(v508, v414);
  v413(v509, v414);
  v412(v516, v411);
  *v405 = v406;
  v405[1] = v408;
  swift_beginAccess();
  v415 = v499;
  v416 = v501;
  (*(void (**)(uint64_t, char *, uint64_t))(v499 + 16))(v538, v400, v501);
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v403 + 104))(v405, *MEMORY[0x24BEAFC70], v409);
  return (*(uint64_t (**)(char *, uint64_t))(v415 + 8))(v400, v416);
}

uint64_t sub_244ECACFC@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  swift_getObjectType();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v2 = sub_244EE1FD0();
  swift_getObjectType();
  result = sub_244EE1FD0();
  if (v2 == result)
  {
    v4 = sub_244EE1FDC();
    swift_unknownObjectRelease();
    if ((v4 & 1) != 0)
    {
      result = swift_unknownObjectRelease();
      a1[1] = 0u;
      a1[2] = 0u;
      *a1 = 0u;
    }
    else
    {
      sub_244EE206C();
      return swift_unknownObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_244ECAE04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC20RealityKitInspection32SceneDebugRepresentationProvider_hierarchy;
  v2 = sub_244EE1C64();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_244ECAE48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC20RealityKitInspection32SceneDebugRepresentationProvider_hierarchy;
  v2 = sub_244EE1C64();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_244ECAE9C(unint64_t a1)
{
  return sub_244ECC6A8(a1);
}

uint64_t sub_244ECAEBC(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B388);
  v10 = *(_QWORD *)(sub_244EE1B2C() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_244EE2078();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_244EE1B2C() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_244ECC590(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_244ECB0C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_244ECB194(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_244ECC8D0((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_244ECC8D0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_244ECB194(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_244EE1F58();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_244ECB34C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_244EE2000();
  if (!v8)
  {
    sub_244EE2078();
    __break(1u);
LABEL_17:
    result = sub_244EE20CC();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_244ECB34C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_244ECB3E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_244ECB5B8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_244ECB5B8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_244ECB3E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_244ECB554(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_244EE1FC4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_244EE2078();
      __break(1u);
LABEL_10:
      v2 = sub_244EE1E38();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_244EE20CC();
    __break(1u);
LABEL_14:
    result = sub_244EE2078();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_244ECB554(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B398);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_244ECB5B8(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742B398);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_244EE20CC();
  __break(1u);
  return result;
}

uint64_t sub_244ECB704(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  sub_244ECC508(a1, a2);
  sub_244ECC36C(a1, a2);
  sub_244ECC54C(a1, a2);
  v4 = sub_244EE1E14();
  swift_release();
  return v4;
}

uint64_t sub_244ECB778@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_244EE1E14();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_244ECB7B0(uint64_t a1)
{
  uint64_t v2;

  sub_244EE1B20();
  sub_244EBEF9C(&qword_25742B320, (uint64_t (*)(uint64_t))MEMORY[0x24BEAFC50], MEMORY[0x24BEAFC60]);
  v2 = sub_244EE1DC0();
  return sub_244ECBE54(a1, v2);
}

uint64_t sub_244ECB81C(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  _QWORD *v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[4];
  int v43;
  uint64_t *v44;
  int64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  uint64_t v52;

  v3 = v2;
  v5 = sub_244EE1B2C();
  v51 = *(_QWORD *)(v5 - 8);
  v52 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v50 = &v42[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_244EE1B20();
  v49 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v42[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B370);
  v11 = sub_244EE20B4();
  v12 = v11;
  if (!*(_QWORD *)(v10 + 16))
    goto LABEL_41;
  v13 = 1 << *(_BYTE *)(v10 + 32);
  v14 = *(_QWORD *)(v10 + 64);
  v46 = (_QWORD *)(v10 + 64);
  if (v13 < 64)
    v15 = ~(-1 << v13);
  else
    v15 = -1;
  v16 = v15 & v14;
  v44 = v2;
  v45 = (unint64_t)(v13 + 63) >> 6;
  v17 = v11 + 64;
  v48 = v10;
  result = swift_retain();
  v19 = 0;
  v43 = a2;
  v20 = 16;
  if ((a2 & 1) != 0)
    v20 = 32;
  v47 = v20;
  v21 = v20;
  while (1)
  {
    if (v16)
    {
      v23 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v24 = v23 | (v19 << 6);
      goto LABEL_24;
    }
    v25 = v19 + 1;
    if (__OFADD__(v19, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v25 >= v45)
      break;
    v26 = v46;
    v27 = v46[v25];
    ++v19;
    if (!v27)
    {
      v19 = v25 + 1;
      if (v25 + 1 >= v45)
        goto LABEL_34;
      v27 = v46[v19];
      if (!v27)
      {
        v28 = v25 + 2;
        if (v28 >= v45)
        {
LABEL_34:
          v40 = v48;
          swift_release();
          v3 = v44;
          if ((v43 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v27 = v46[v28];
        if (!v27)
        {
          while (1)
          {
            v19 = v28 + 1;
            if (__OFADD__(v28, 1))
              goto LABEL_43;
            if (v19 >= v45)
              goto LABEL_34;
            v27 = v46[v19];
            ++v28;
            if (v27)
              goto LABEL_23;
          }
        }
        v19 = v28;
      }
    }
LABEL_23:
    v16 = (v27 - 1) & v27;
    v24 = __clz(__rbit64(v27)) + (v19 << 6);
LABEL_24:
    v29 = v48;
    v30 = *(_QWORD *)(v49 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v49 + v21))(v9, *(_QWORD *)(v48 + 48) + v30 * v24, v7);
    v31 = *(_QWORD *)(v29 + 56);
    v32 = *(_QWORD *)(v51 + 72);
    (*(void (**)(_BYTE *, unint64_t, uint64_t))(v51 + v21))(v50, v31 + v32 * v24, v52);
    sub_244EBEF9C(&qword_25742B320, (uint64_t (*)(uint64_t))MEMORY[0x24BEAFC50], MEMORY[0x24BEAFC60]);
    result = sub_244EE1DC0();
    v33 = -1 << *(_BYTE *)(v12 + 32);
    v34 = result & ~v33;
    v35 = v34 >> 6;
    if (((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v34) & ~*(_QWORD *)(v17 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v36 = 0;
      v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v38 = v35 == v37;
        if (v35 == v37)
          v35 = 0;
        v36 |= v38;
        v39 = *(_QWORD *)(v17 + 8 * v35);
      }
      while (v39 == -1);
      v22 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(_QWORD *)(v17 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    (*(void (**)(unint64_t, _BYTE *, uint64_t))(v49 + 32))(*(_QWORD *)(v12 + 48) + v30 * v22, v9, v7);
    result = (*(uint64_t (**)(unint64_t, _BYTE *, uint64_t))(v51 + 32))(*(_QWORD *)(v12 + 56) + v32 * v22, v50, v52);
    ++*(_QWORD *)(v12 + 16);
  }
  v40 = v48;
  swift_release();
  v3 = v44;
  v26 = v46;
  if ((v43 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v41 = 1 << *(_BYTE *)(v40 + 32);
  if (v41 >= 64)
    bzero(v26, ((unint64_t)(v41 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v26 = -1 << v41;
  *(_QWORD *)(v40 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v12;
  return result;
}

uint64_t sub_244ECBC14(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;
  uint64_t v26;

  v4 = (_QWORD **)v3;
  v8 = sub_244EE1B20();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_244ECB7B0(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a3 & 1) != 0)
    {
LABEL_7:
      v20 = *v4;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = v20[7];
        v22 = sub_244EE1B2C();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 40))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v14, a1, v22);
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_244ECBF94();
      goto LABEL_7;
    }
    sub_244ECB81C(v17, a3 & 1);
    v24 = sub_244ECB7B0(a2);
    if ((v18 & 1) == (v25 & 1))
    {
      v14 = v24;
      v20 = *v4;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_244ECBD9C(v14, (uint64_t)v11, a1, v20);
    }
  }
  result = sub_244EE2144();
  __break(1u);
  return result;
}

uint64_t sub_244ECBD9C(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_244EE1B20();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  v10 = a4[7];
  v11 = sub_244EE1B2C();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * a1, a3, v11);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

unint64_t sub_244ECBE54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_244EE1B20();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_244EBEF9C(&qword_25742B378, (uint64_t (*)(uint64_t))MEMORY[0x24BEAFC50], MEMORY[0x24BEAFC68]);
      v14 = sub_244EE1DD8();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

char *sub_244ECBF94()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *result;
  char *v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  int64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;

  v41 = sub_244EE1B2C();
  v37 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v40 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_244EE1B20();
  v36 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v38 = (char *)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B370);
  v33 = v0;
  v3 = *v0;
  v4 = sub_244EE20A8();
  v5 = *(_QWORD *)(v3 + 16);
  v43 = v4;
  if (!v5)
  {
    result = (char *)swift_release();
    v32 = v43;
    v31 = v33;
LABEL_25:
    *v31 = v32;
    return result;
  }
  v6 = v4;
  result = (char *)(v4 + 64);
  v8 = (char *)(v3 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  v34 = v3 + 64;
  if (v6 != v3 || result >= &v8[8 * v9])
  {
    result = (char *)memmove(result, v8, 8 * v9);
    v6 = v43;
  }
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v42 = v3;
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v35 = (unint64_t)(v11 + 63) >> 6;
  v14 = v36;
  v15 = v37;
  v17 = v38;
  v16 = v39;
  v18 = v41;
  v19 = v43;
  while (1)
  {
    if (v13)
    {
      v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v44 = v10;
      v21 = v20 | (v10 << 6);
      v22 = v42;
      goto LABEL_9;
    }
    v27 = v10 + 1;
    v22 = v42;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v27 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v27);
    v29 = v10 + 1;
    if (!v28)
    {
      v29 = v27 + 1;
      if (v27 + 1 >= v35)
        goto LABEL_23;
      v28 = *(_QWORD *)(v34 + 8 * v29);
      if (!v28)
        break;
    }
LABEL_22:
    v13 = (v28 - 1) & v28;
    v44 = v29;
    v21 = __clz(__rbit64(v28)) + (v29 << 6);
LABEL_9:
    v23 = *(_QWORD *)(v14 + 72) * v21;
    (*(void (**)(char *, unint64_t, uint64_t))(v14 + 16))(v17, *(_QWORD *)(v22 + 48) + v23, v16);
    v24 = *(_QWORD *)(v15 + 72) * v21;
    v25 = *(_QWORD *)(v22 + 56) + v24;
    v26 = v40;
    (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v40, v25, v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v14 + 32))(*(_QWORD *)(v19 + 48) + v23, v17, v16);
    result = (char *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v15 + 32))(*(_QWORD *)(v19 + 56) + v24, v26, v18);
    v10 = v44;
  }
  v30 = v27 + 2;
  if (v30 >= v35)
  {
LABEL_23:
    result = (char *)swift_release();
    v31 = v33;
    v32 = v43;
    goto LABEL_25;
  }
  v28 = *(_QWORD *)(v34 + 8 * v30);
  if (v28)
  {
    v29 = v30;
    goto LABEL_22;
  }
  while (1)
  {
    v29 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v29 >= v35)
      goto LABEL_23;
    v28 = *(_QWORD *)(v34 + 8 * v29);
    ++v30;
    if (v28)
      goto LABEL_22;
  }
LABEL_27:
  __break(1u);
  return result;
}

_QWORD *sub_244ECC274(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a1)
    v4 = a2 - a1;
  else
    v4 = 0;
  result = a3(&v6, a1, v4);
  if (!v3)
    return (_QWORD *)v6;
  return result;
}

uint64_t sub_244ECC2C0(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *(*a4)(uint64_t *__return_ptr, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t result;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = sub_244EE1640();
  v9 = result;
  if (result)
  {
    result = sub_244EE1658();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v9 += a1 - result;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
    __break(1u);
    goto LABEL_15;
  }
  v12 = sub_244EE164C();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  v14 = v9 + v13;
  if (v9)
    v15 = v14;
  else
    v15 = 0;
  result = (uint64_t)sub_244ECC274(v9, v15, a4);
  if (v4)
    return v16;
  return result;
}

void sub_244ECC36C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = sub_244EE16DC();
  MEMORY[0x24BDAC7A8](v3);
  __asm { BR              X10 }
}

_QWORD *sub_244ECC3E8()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;

  if (BYTE6(v0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742B398);
    v4 = (_QWORD *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v4);
    v4[2] = BYTE6(v0);
    v4[3] = 2 * v6 - 64;
    sub_244ECC508(v2, v0);
    v7 = sub_244EE16C4();
    sub_244ECC54C(v2, v0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v1);
    if (v7 != BYTE6(v0))
    {
      __break(1u);
      JUMPOUT(0x244ECC4BCLL);
    }
  }
  return v4;
}

uint64_t sub_244ECC4D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_244EE1E14();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_244ECC508(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_244ECC54C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_244ECC590(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_244EE1B2C() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_244EE20CC();
  __break(1u);
  return result;
}

uint64_t sub_244ECC6A8(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  void (*v5)(uint64_t, uint64_t);
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_244EE1A6C();
  swift_allocObject();
  sub_244EE1A60();
  sub_244EE1A3C();
  if (!(a1 >> 62))
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
LABEL_10:
    v8 = swift_bridgeObjectRelease();
    v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 136))(v8);
    swift_release();
    return v9;
  }
  swift_bridgeObjectRetain();
  result = sub_244EE209C();
  v3 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v3 >= 1)
  {
    v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v1 + 128);
    swift_beginAccess();
    for (i = 0; i != v3; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v7 = MEMORY[0x249529C58](i, a1);
      }
      else
      {
        v7 = *(_QWORD *)(a1 + 8 * i + 32);
        swift_retain();
      }
      v5(v7, qword_25742B188);
      swift_release();
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_244ECC820()
{
  return type metadata accessor for SceneDebugRepresentationProvider();
}

uint64_t type metadata accessor for SceneDebugRepresentationProvider()
{
  uint64_t result;

  result = qword_25742B5E0;
  if (!qword_25742B5E0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_244ECC864()
{
  uint64_t result;
  unint64_t v1;

  result = sub_244EE1C64();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_244ECC8D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_244ECC90C(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_244ECC944(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

_OWORD *sub_244ECC9E4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1Tm(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_244ECCA18(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_244ECCA5C(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void sub_244ECCA74()
{
  swift_deletedMethodError();
  __break(1u);
}

void sub_244ECCA84()
{
  qword_25742B5F8 = MEMORY[0x24BEE4B00];
}

uint64_t sub_244ECCA98(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  void (*v28)(_BYTE *, _QWORD, uint64_t);
  void (*v29)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v30;
  unsigned int (*v31)(uint64_t, uint64_t, uint64_t);
  _BYTE *v32;
  uint64_t v33;
  _BYTE *v34;
  _BYTE *v35;
  uint64_t v36;
  _BYTE *v37;
  _BYTE *v38;
  void (*v39)(_BYTE *, uint64_t);
  _BYTE *v40;
  char v41;
  uint64_t v42;
  void (*v43)(_BYTE *, uint64_t);
  unsigned __int8 v44;
  const void *DynamicType;
  _BYTE v47[4];
  int v48;
  _BYTE *v49;
  void (*v50)(_BYTE *, _QWORD, uint64_t, uint64_t);
  _QWORD *v51;
  _BYTE *v52;
  uint64_t v53;
  _BYTE *v54;
  _BYTE *v55;
  _BYTE *v56;
  _BYTE *v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  __int128 v63;
  _OWORD v64[3];

  v2 = sub_244EE21A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v52 = &v47[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B2B8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v54 = &v47[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v47[-v8];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B2C0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v49 = &v47[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = MEMORY[0x24BDAC7A8](v11);
  v56 = &v47[-v14];
  v15 = MEMORY[0x24BDAC7A8](v13);
  v55 = &v47[-v16];
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = &v47[-v18];
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = &v47[-v21];
  MEMORY[0x24BDAC7A8](v20);
  v24 = &v47[-v23];
  v25 = sub_244EE21C8();
  v58 = *(_QWORD *)(v25 - 8);
  v59 = v25;
  MEMORY[0x24BDAC7A8](v25);
  v27 = &v47[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v51 = a1;
  sub_244ECC8D0((uint64_t)a1, (uint64_t)&v63);
  sub_244EE218C();
  v57 = v27;
  sub_244EE21B0();
  v28 = *(void (**)(_BYTE *, _QWORD, uint64_t))(v3 + 104);
  v28(v22, *MEMORY[0x24BEE4390], v2);
  v29 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v3 + 56);
  v29(v22, 0, 1, v2);
  v53 = v5;
  v30 = (uint64_t)&v9[*(int *)(v5 + 48)];
  sub_244ECD114((uint64_t)v24, (uint64_t)v9);
  sub_244ECD114((uint64_t)v22, v30);
  v31 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v31((uint64_t)v9, 1, v2) != 1)
  {
    sub_244ECD114((uint64_t)v9, (uint64_t)v19);
    if (v31(v30, 1, v2) != 1)
    {
      v50 = v29;
      v38 = v52;
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 32))(v52, v30, v2);
      v48 = sub_244EE1DD8();
      v39 = *(void (**)(_BYTE *, uint64_t))(v3 + 8);
      v39(v38, v2);
      sub_244EBFC74((uint64_t)v22, &qword_25742B2C0);
      sub_244EBFC74((uint64_t)v24, &qword_25742B2C0);
      v39(v19, v2);
      sub_244EBFC74((uint64_t)v9, &qword_25742B2C0);
      v32 = v57;
      v33 = (uint64_t)v55;
      if ((v48 & 1) != 0)
        goto LABEL_16;
LABEL_7:
      sub_244EE21B0();
      v34 = v56;
      v28(v56, *MEMORY[0x24BEE4368], v2);
      v50(v34, 0, 1, v2);
      v35 = v54;
      v36 = (uint64_t)&v54[*(int *)(v53 + 48)];
      sub_244ECD114(v33, (uint64_t)v54);
      sub_244ECD114((uint64_t)v34, v36);
      if (v31((uint64_t)v35, 1, v2) == 1)
      {
        sub_244EBFC74((uint64_t)v34, &qword_25742B2C0);
        sub_244EBFC74(v33, &qword_25742B2C0);
        if (v31(v36, 1, v2) == 1)
        {
          sub_244EBFC74((uint64_t)v35, &qword_25742B2C0);
          goto LABEL_16;
        }
      }
      else
      {
        v37 = v49;
        sub_244ECD114((uint64_t)v35, (uint64_t)v49);
        if (v31(v36, 1, v2) != 1)
        {
          v40 = v52;
          (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 32))(v52, v36, v2);
          v41 = sub_244EE1DD8();
          v42 = v33;
          v43 = *(void (**)(_BYTE *, uint64_t))(v3 + 8);
          v43(v40, v2);
          sub_244EBFC74((uint64_t)v56, &qword_25742B2C0);
          sub_244EBFC74(v42, &qword_25742B2C0);
          v43(v37, v2);
          sub_244EBFC74((uint64_t)v35, &qword_25742B2C0);
          if ((v41 & 1) != 0)
            goto LABEL_16;
LABEL_18:
          __swift_project_boxed_opaque_existential_1Tm(v51, v51[3]);
          DynamicType = (const void *)swift_getDynamicType();
          v44 = sub_244ECD15C(DynamicType);
          goto LABEL_19;
        }
        sub_244EBFC74((uint64_t)v56, &qword_25742B2C0);
        sub_244EBFC74(v33, &qword_25742B2C0);
        (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v37, v2);
      }
      sub_244EBFC74((uint64_t)v35, &qword_25742B2B8);
      goto LABEL_18;
    }
    sub_244EBFC74((uint64_t)v22, &qword_25742B2C0);
    sub_244EBFC74((uint64_t)v24, &qword_25742B2C0);
    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v19, v2);
LABEL_6:
    v50 = v29;
    sub_244EBFC74((uint64_t)v9, &qword_25742B2B8);
    v32 = v57;
    v33 = (uint64_t)v55;
    goto LABEL_7;
  }
  sub_244EBFC74((uint64_t)v22, &qword_25742B2C0);
  sub_244EBFC74((uint64_t)v24, &qword_25742B2C0);
  if (v31(v30, 1, v2) != 1)
    goto LABEL_6;
  sub_244EBFC74((uint64_t)v9, &qword_25742B2C0);
  v32 = v57;
LABEL_16:
  sub_244EE21BC();
  sub_244ECACFC(&v60);
  swift_release();
  if (!v62)
  {
    (*(void (**)(_BYTE *, uint64_t))(v58 + 8))(v32, v59);
    sub_244EBFC74((uint64_t)&v60, &qword_25742B308);
    v44 = 0;
    return v44 & 1;
  }
  v63 = v60;
  sub_244ECC9E4(&v61, v64);
  v44 = sub_244ECCA98(v64);
  sub_244EBFC74((uint64_t)&v63, &qword_25742B358);
LABEL_19:
  (*(void (**)(_BYTE *, uint64_t))(v58 + 8))(v32, v59);
  return v44 & 1;
}

uint64_t sub_244ECD114(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B2C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

const char *sub_244ECD15C(const void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  char v20;
  const char *result;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  const char *v26;
  uint64_t v27;
  unint64_t v28;
  char isUniquelyReferenced_nonNull_native;
  void *v30;
  char v31;
  char *v32;
  NSObject *v33;
  os_log_type_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void (*v42)(char *, uint64_t);
  const char *v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  int v46;
  int v47;
  const char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  Dl_info v54;

  v2 = sub_244EE1D30();
  v51 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v50 = (char *)&v45 - v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B3B8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_244EE1D54();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v45 - v15;
  if (qword_25742B5F0 != -1)
    swift_once();
  swift_beginAccess();
  v17 = qword_25742B5F8;
  if (*(_QWORD *)(qword_25742B5F8 + 16))
  {
    v18 = sub_244ECD7D4((uint64_t)a1);
    if ((v19 & 1) != 0)
    {
      v20 = *(_BYTE *)(*(_QWORD *)(v17 + 56) + v18);
      swift_endAccess();
      return (const char *)(v20 & 1);
    }
  }
  swift_endAccess();
  memset(&v54, 0, sizeof(v54));
  if (!dladdr(a1, &v54))
  {
    v22 = 1;
LABEL_10:
    v49 = v2;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, v22, 1, v10);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    {
      sub_244EBFC74((uint64_t)v9, &qword_25742B3B8);
      sub_244EE1CDC();
      v23 = sub_244EE1D24();
      v24 = sub_244EE1F10();
      if (os_log_type_enabled(v23, v24))
      {
        v25 = (uint8_t *)swift_slowAlloc();
        v26 = (const char *)swift_slowAlloc();
        v54.dli_fname = v26;
        *(_DWORD *)v25 = 136315138;
        v52 = (uint64_t)a1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25742B318);
        v27 = sub_244EE1DF0();
        v52 = sub_244ECB0C4(v27, v28, (uint64_t *)&v54);
        sub_244EE1F4C();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_244EB5000, v23, v24, "Type %s unable to determine source - isInternal=unknown", v25, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24952A198](v26, -1, -1);
        MEMORY[0x24952A198](v25, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v51 + 8))(v5, v49);
      swift_beginAccess();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v52 = qword_25742B5F8;
      qword_25742B5F8 = 0x8000000000000000;
      sub_244ECDAA0(0, (uint64_t)a1, isUniquelyReferenced_nonNull_native);
      qword_25742B5F8 = v52;
      swift_bridgeObjectRelease();
      swift_endAccess();
      v20 = 0;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
      v54.dli_fname = (const char *)sub_244EE1D48();
      v54.dli_fbase = v30;
      v52 = 0xD000000000000010;
      v53 = 0x8000000244EE3E30;
      sub_244EBFC30();
      v20 = sub_244EE1F7C();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      v31 = swift_isUniquelyReferenced_nonNull_native();
      v52 = qword_25742B5F8;
      qword_25742B5F8 = 0x8000000000000000;
      sub_244ECDAA0(v20 & 1, (uint64_t)a1, v31);
      qword_25742B5F8 = v52;
      swift_bridgeObjectRelease();
      swift_endAccess();
      v32 = v50;
      sub_244EE1CDC();
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
      v33 = sub_244EE1D24();
      v34 = sub_244EE1F10();
      v35 = v34;
      if (os_log_type_enabled(v33, v34))
      {
        v36 = swift_slowAlloc();
        v47 = v20 & 1;
        v37 = v36;
        v48 = (const char *)swift_slowAlloc();
        v54.dli_fname = v48;
        *(_DWORD *)v37 = 136315650;
        v46 = v35;
        v52 = (uint64_t)a1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25742B318);
        v38 = sub_244EE1DF0();
        v52 = sub_244ECB0C4(v38, v39, (uint64_t *)&v54);
        sub_244EE1F4C();
        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 12) = 2080;
        v40 = sub_244EE1D48();
        v52 = sub_244ECB0C4(v40, v41, (uint64_t *)&v54);
        sub_244EE1F4C();
        swift_bridgeObjectRelease();
        v42 = *(void (**)(char *, uint64_t))(v11 + 8);
        v42(v14, v10);
        *(_WORD *)(v37 + 22) = 1024;
        LODWORD(v52) = v47;
        sub_244EE1F4C();
        _os_log_impl(&dword_244EB5000, v33, (os_log_type_t)v46, "Type %s source: %s, isInternal=%{BOOL}d", (uint8_t *)v37, 0x1Cu);
        v43 = v48;
        swift_arrayDestroy();
        MEMORY[0x24952A198](v43, -1, -1);
        MEMORY[0x24952A198](v37, -1, -1);

        (*(void (**)(char *, uint64_t))(v51 + 8))(v50, v49);
        v42(v16, v10);
      }
      else
      {

        v44 = *(void (**)(char *, uint64_t))(v11 + 8);
        v44(v14, v10);
        (*(void (**)(char *, uint64_t))(v51 + 8))(v32, v49);
        v44(v16, v10);
      }
    }
    return (const char *)(v20 & 1);
  }
  result = v54.dli_fname;
  if (v54.dli_fname)
  {
    sub_244EE1D3C();
    v22 = 0;
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

unint64_t sub_244ECD7D4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_244EE215C();
  return sub_244ECDBD0(a1, v2);
}

uint64_t sub_244ECD804(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  char v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B3C0);
  result = sub_244EE20B4();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v33 = a2;
    v32 = v3;
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v30 = -1 << v10;
    v31 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v17 = v16 | (v8 << 6);
      }
      else
      {
        v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v18 >= v13)
          goto LABEL_31;
        v19 = v9[v18];
        ++v8;
        if (!v19)
        {
          v8 = v18 + 1;
          if (v18 + 1 >= v13)
            goto LABEL_31;
          v19 = v9[v8];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_31:
              if ((v33 & 1) == 0)
              {
                result = swift_release();
                v3 = v32;
                goto LABEL_38;
              }
              if (v31 >= 64)
                bzero((void *)(v5 + 64), 8 * v13);
              else
                *v9 = v30;
              v3 = v32;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v19 = v9[v20];
            if (!v19)
            {
              while (1)
              {
                v8 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_40;
                if (v8 >= v13)
                  goto LABEL_31;
                v19 = v9[v8];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v8 = v20;
          }
        }
LABEL_21:
        v12 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v17);
      v22 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v17);
      result = sub_244EE215C();
      v23 = -1 << *(_BYTE *)(v7 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v15) = v21;
      *(_BYTE *)(*(_QWORD *)(v7 + 56) + v15) = v22;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

uint64_t sub_244ECDAA0(char a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v4 = v3;
  v8 = *v3;
  v10 = sub_244ECD7D4(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_244ECDC6C();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(v16[7] + v10) = a1 & 1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_QWORD *)(v16[6] + 8 * v10) = a2;
    *(_BYTE *)(v16[7] + v10) = a1 & 1;
    v18 = v16[2];
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_244ECD804(result, a3 & 1);
  result = sub_244ECD7D4(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_244EE2144();
  __break(1u);
  return result;
}

unint64_t sub_244ECDBD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

void *sub_244ECDC6C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B3C0);
  v2 = *v0;
  v3 = sub_244EE20A8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v20 = __clz(__rbit64(v18));
    v12 = (v18 - 1) & v18;
    v15 = v20 + (v9 << 6);
LABEL_12:
    v16 = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = v16;
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_244ECDDFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_244EE1A0C();
  MEMORY[0x24BDAC7A8](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AF30);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BEE4AF8];
  sub_244EE1A6C();
  sub_244EE173C();
  sub_244EE19F4();
  while (1)
  {
    sub_244EE1A00();
    if (!v9)
      break;
    v5 = swift_retain();
    MEMORY[0x249529AE4](v5);
    if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_244EE1E98();
    sub_244EE1EA4();
    v6 = sub_244EE1E8C();
    v7 = sub_244ECDDFC(v6);
    sub_244ECE150(v7);
    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v10;
}

uint64_t sub_244ECDF64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v0 = sub_244EE1A0C();
  MEMORY[0x24BDAC7A8](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742AF30);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v13 - v6;
  v14 = MEMORY[0x24BEE4AF8];
  sub_244EE1A6C();
  sub_244EE173C();
  sub_244EE19F4();
  while (1)
  {
    sub_244EE1A00();
    if (!v13)
      break;
    v8 = swift_retain();
    MEMORY[0x249529AE4](v8);
    if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_244EE1E98();
    sub_244EE1EA4();
    sub_244EE1E8C();
    swift_release();
  }
  v9 = *(void (**)(char *, uint64_t))(v2 + 8);
  v9(v7, v1);
  sub_244EE173C();
  sub_244EE19F4();
  while (1)
  {
    v10 = sub_244EE1A00();
    if (!v13)
      break;
    v11 = sub_244ECDF64(v10);
    sub_244ECE150(v11);
    swift_release();
  }
  v9(v5, v1);
  return v14;
}

uint64_t sub_244ECE150(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_244EE209C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_244EE209C();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x249529C64](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_244EBBC08(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_244EE209C();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_244EE1E8C();
  }
  __break(1u);
  return result;
}

uint64_t Array.appending<A>(contentsOf:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  MEMORY[0x24BDAC7A8](a1);
  v7 = a2;
  (*(void (**)(char *))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_244EE1EBC();
  swift_bridgeObjectRetain();
  sub_244EE1EB0();
  return v7;
}

uint64_t Array<A>.removingDuplicates()()
{
  uint64_t v0;
  uint64_t v1;

  sub_244EE1D60();
  v0 = sub_244EE1EBC();
  swift_bridgeObjectRetain();
  MEMORY[0x24952A0F0](MEMORY[0x24BEE12F0], v0);
  v1 = sub_244EE200C();
  swift_bridgeObjectRelease();
  return v1;
}

BOOL sub_244ECE470()
{
  char v1;

  sub_244EE1DA8();
  sub_244EE1D78();
  return v1 == 2;
}

uint64_t Array<A>.removeDuplicates()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t result;

  v1 = Array<A>.removingDuplicates()();
  result = swift_bridgeObjectRelease();
  *v0 = v1;
  return result;
}

uint64_t sub_244ECE520()
{
  _BYTE v1[40];

  sub_244EE17F0();
  sub_244EE17E4();
  sub_244EE17D8();
  swift_release();
  sub_244EE17C0();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v1);
}

uint64_t sub_244ECE594@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  id v30;
  id v31;
  void (*v32)(char *, uint64_t);
  void (*v33)(char *, char *, uint64_t);
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  _BOOL4 v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  void (*v51)(char *, uint64_t);
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71[3];

  v62 = a1;
  v68 = a2;
  v61 = sub_244EE176C();
  v57 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v58 = (char *)&v51 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B3C8);
  MEMORY[0x24BDAC7A8](v3);
  v60 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_244EE1754();
  v55 = *(_QWORD *)(v5 - 8);
  v56 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v54 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = sub_244EE17A8();
  v64 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59);
  v63 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = sub_244EE1D30();
  v53 = *(_QWORD *)(v69 - 8);
  v8 = MEMORY[0x24BDAC7A8](v69);
  v66 = (char *)&v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v51 - v10;
  v12 = sub_244EE16B8();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v51 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v51 - v20;
  v22 = sub_244EE1700();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v51 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EE16F4();
  v67 = sub_244EE16E8();
  v27 = v26;
  v28 = *(void (**)(char *, uint64_t))(v23 + 8);
  v29 = v12;
  v28(v25, v22);
  v30 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v31 = objc_msgSend(v30, sel_temporaryDirectory);

  sub_244EE16A0();
  v71[0] = v67;
  v71[1] = v27;
  sub_244EE1E2C();
  sub_244EE1694();
  swift_bridgeObjectRelease();
  v32 = *(void (**)(char *, uint64_t))(v13 + 8);
  v32(v19, v12);
  sub_244EE1CD0();
  v67 = v13;
  v33 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v34 = v16;
  v65 = v21;
  v33(v16, v21, v12);
  v52 = v11;
  v35 = sub_244EE1D24();
  v36 = sub_244EE1F10();
  v37 = os_log_type_enabled(v35, v36);
  v51 = v32;
  if (v37)
  {
    v38 = (uint8_t *)swift_slowAlloc();
    v39 = swift_slowAlloc();
    v71[0] = v39;
    *(_DWORD *)v38 = 136315138;
    sub_244EBEF9C(&qword_25742B3D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v40 = sub_244EE20FC();
    v70 = sub_244ECB0C4(v40, v41, v71);
    sub_244EE1F4C();
    swift_bridgeObjectRelease();
    v32(v34, v29);
    _os_log_impl(&dword_244EB5000, v35, v36, "writing to %s", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24952A198](v39, -1, -1);
    MEMORY[0x24952A198](v38, -1, -1);
  }
  else
  {
    v32(v34, v12);
  }

  v53 = *(_QWORD *)(v53 + 8);
  ((void (*)(char *, uint64_t))v53)(v52, v69);
  v42 = v65;
  v43 = v61;
  v45 = v59;
  v44 = v60;
  v47 = v57;
  v46 = v58;
  (*(void (**)(char *, _QWORD, uint64_t))(v55 + 104))(v54, *MEMORY[0x24BDE6390], v56);
  v48 = v63;
  sub_244EE1760();
  sub_244EE1790();
  (*(void (**)(char *, _QWORD, uint64_t))(v47 + 104))(v46, *MEMORY[0x24BDE63A8], v43);
  sub_244EE1778();
  v49 = sub_244EE1784();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v44, 0, 1, v49);
  sub_244EE179C();
  sub_244EE17B4();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v48, v45);
  (*(void (**)(uint64_t, char *, uint64_t))(v67 + 32))(v68, v42, v29);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v67 + 56))(v68, 0, 1, v29);
}

uint64_t sub_244ECECCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_244EE16B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  v5 = *MEMORY[0x24BEAFE20];
  v6 = sub_244EE1CC4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(a2, v5, v6);
}

uint64_t sub_244ECED48(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B408);
  v10 = *(_QWORD *)(sub_244EE16B8() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_244EE2078();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_244EE16B8() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_244ECF368(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_244ECEF50(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_244ECEFA8(a1, a2, a3, (_QWORD *)*v3, &qword_25742B410, (uint64_t (*)(_QWORD))MEMORY[0x24BEAFE28]);
  *v3 = result;
  return result;
}

uint64_t sub_244ECEF7C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_244ECEFA8(a1, a2, a3, (_QWORD *)*v3, &qword_25742B418, (uint64_t (*)(_QWORD))MEMORY[0x24BDE6458]);
  *v3 = result;
  return result;
}

uint64_t sub_244ECEFA8(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v16 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v11;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  result = sub_244EE20CC();
  __break(1u);
  return result;
}

uint64_t sub_244ECF188(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;

  v2 = v1;
  v4 = sub_244EE17CC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_15;
  v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    if (!v8)
      return v9;
    v19 = MEMORY[0x24BEE4AF8];
    result = sub_244ECEF7C(0, v8 & ~(v8 >> 63), 0);
    if (v8 < 0)
      break;
    v11 = 0;
    v9 = v19;
    v16 = a1 & 0xC000000000000001;
    v17 = v8;
    v18 = a1;
    while (v8 != v11)
    {
      if (v16)
        MEMORY[0x249529C58](v11, a1);
      else
        swift_retain();
      v12 = v2;
      Entity.augmentedWithPersistentIDs<A>(_:)((uint64_t (*)(uint64_t))sub_244ECE520);
      swift_release();
      v19 = v9;
      v14 = *(_QWORD *)(v9 + 16);
      v13 = *(_QWORD *)(v9 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_244ECEF7C(v13 > 1, v14 + 1, 1);
        v9 = v19;
      }
      ++v11;
      *(_QWORD *)(v9 + 16) = v14 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v14, v7, v4);
      v8 = v17;
      v2 = v12;
      a1 = v18;
      if (v17 == v11)
        return v9;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v8 = sub_244EE209C();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_244ECF368(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_244EE16B8() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_244EE20CC();
  __break(1u);
  return result;
}

uint64_t sub_244ECF480(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  int64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void (*v34)(char *, unint64_t, uint64_t);
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v45[2];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  void (*v52)(char *, unint64_t, uint64_t);
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;

  v2 = sub_244EE1CC4();
  v46 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v51 = (char *)v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B180);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_244EE16B8();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v55 = (char *)v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v54 = (char *)v45 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v50 = (char *)v45 - v13;
  v14 = sub_244EE17CC();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_244ECF188(a1);
  v47 = 0;
  v19 = *(_QWORD *)(v18 + 16);
  v56 = v8;
  if (v19)
  {
    v20 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    v45[1] = v18;
    v21 = v18 + v20;
    v22 = *(_QWORD *)(v15 + 72);
    v52 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
    v53 = v22;
    v23 = v15;
    v24 = MEMORY[0x24BEE4AF8];
    v48 = v23;
    v49 = v2;
    v52(v17, v18 + v20, v14);
    while (1)
    {
      sub_244ECE594((uint64_t)v17, (uint64_t)v6);
      (*(void (**)(char *, uint64_t))(v23 + 8))(v17, v14);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
      {
        sub_244EC37FC((uint64_t)v6);
      }
      else
      {
        v25 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
        v26 = v50;
        v25(v50, v6, v7);
        v25(v54, v26, v7);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
          v27 = v24;
        else
          v27 = sub_244ECED48(0, *(_QWORD *)(v24 + 16) + 1, 1, v24);
        v29 = *(_QWORD *)(v27 + 16);
        v28 = *(_QWORD *)(v27 + 24);
        if (v29 >= v28 >> 1)
          v27 = sub_244ECED48(v28 > 1, v29 + 1, 1, v27);
        *(_QWORD *)(v27 + 16) = v29 + 1;
        v8 = v56;
        v24 = v27;
        v25((char *)(v27+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v56 + 72) * v29), v54, v7);
        v23 = v48;
        v2 = v49;
      }
      v21 += v53;
      if (!--v19)
        break;
      v52(v17, v21, v14);
    }
    swift_bridgeObjectRelease();
    v30 = *(_QWORD *)(v24 + 16);
    if (v30)
      goto LABEL_14;
LABEL_22:
    swift_bridgeObjectRelease();
    v38 = MEMORY[0x24BEE4AF8];
    goto LABEL_23;
  }
  swift_bridgeObjectRelease();
  v24 = MEMORY[0x24BEE4AF8];
  v30 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
  if (!v30)
    goto LABEL_22;
LABEL_14:
  v57 = MEMORY[0x24BEE4AF8];
  sub_244ECEF50(0, v30, 0);
  v31 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v32 = v8;
  v52 = (void (*)(char *, unint64_t, uint64_t))v24;
  v33 = v24 + v31;
  v54 = *(char **)(v32 + 72);
  v34 = *(void (**)(char *, unint64_t, uint64_t))(v32 + 16);
  LODWORD(v53) = *MEMORY[0x24BEAFE20];
  v35 = v51;
  v36 = v46;
  do
  {
    v37 = v55;
    v34(v55, v33, v7);
    v34(v35, (unint64_t)v37, v7);
    (*(void (**)(char *, _QWORD, uint64_t))(v36 + 104))(v35, v53, v2);
    (*(void (**)(char *, uint64_t))(v56 + 8))(v37, v7);
    v38 = v57;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_244ECEF50(0, *(_QWORD *)(v38 + 16) + 1, 1);
      v35 = v51;
      v38 = v57;
    }
    v40 = *(_QWORD *)(v38 + 16);
    v39 = *(_QWORD *)(v38 + 24);
    if (v40 >= v39 >> 1)
    {
      sub_244ECEF50(v39 > 1, v40 + 1, 1);
      v35 = v51;
      v38 = v57;
    }
    *(_QWORD *)(v38 + 16) = v40 + 1;
    (*(void (**)(unint64_t, char *, uint64_t))(v36 + 32))(v38+ ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))+ *(_QWORD *)(v36 + 72) * v40, v35, v2);
    v57 = v38;
    v33 += (unint64_t)v54;
    --v30;
  }
  while (v30);
  swift_bridgeObjectRelease();
LABEL_23:
  sub_244EE167C();
  swift_allocObject();
  sub_244EE1670();
  v57 = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B3E0);
  sub_244ECF998();
  v41 = v47;
  v42 = sub_244EE1664();
  if (v41)
  {
    MEMORY[0x24952A054](v41);
    swift_bridgeObjectRelease();
    swift_release();
    return 0;
  }
  else
  {
    v43 = v42;
    swift_bridgeObjectRelease();
    swift_release();
  }
  return v43;
}

ValueMetadata *type metadata accessor for RealityFileProvider()
{
  return &type metadata for RealityFileProvider;
}

unint64_t sub_244ECF998()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_25742B3E8;
  if (!qword_25742B3E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742B3E0);
    v2 = sub_244ECF9FC();
    result = MEMORY[0x24952A0F0](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25742B3E8);
  }
  return result;
}

unint64_t sub_244ECF9FC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_25742B3F0;
  if (!qword_25742B3F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742B3F8);
    v2 = sub_244EBEF9C(&qword_25742B400, (uint64_t (*)(uint64_t))MEMORY[0x24BEAFE28], MEMORY[0x24BEAFE38]);
    result = MEMORY[0x24952A0F0](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25742B3F0);
  }
  return result;
}

uint64_t sub_244ECFA78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

void *sub_244ECFA80()
{
  return &unk_244EE2B60;
}

void *sub_244ECFA8C()
{
  return &unk_244EE2B68;
}

uint64_t sub_244ECFA98()
{
  return 0;
}

char *sub_244ECFAA4()
{
  return &byte_25742B850;
}

uint64_t sub_244ECFAB0()
{
  swift_beginAccess();
  return byte_25742B850;
}

uint64_t sub_244ECFAF0(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_25742B850 = a1;
  return result;
}

uint64_t (*sub_244ECFB34())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_244ECFB74(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 4) = 1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 12) = 1;
  *(_DWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 20) = 1;
  *(_DWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 28) = 1;
  *(_DWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 36) = 1;
  *(_QWORD *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 52) = 1;
  *(_DWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 60) = 1;
  *(_DWORD *)(a1 + 64) = 0;
  *(_BYTE *)(a1 + 68) = 1;
  *(_QWORD *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 80) = 1;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_DWORD *)(a1 + 104) = 0;
  *(_BYTE *)(a1 + 108) = 1;
  *(_DWORD *)(a1 + 112) = 0;
  *(_BYTE *)(a1 + 116) = 1;
  *(_DWORD *)(a1 + 120) = 0;
  *(_BYTE *)(a1 + 124) = 1;
  *(_QWORD *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 136) = 1;
  *(_DWORD *)(a1 + 144) = 0;
  *(_BYTE *)(a1 + 148) = 1;
  *(_DWORD *)(a1 + 152) = 0;
  *(_BYTE *)(a1 + 156) = 1;
  *(_DWORD *)(a1 + 160) = 0;
  *(_BYTE *)(a1 + 164) = 1;
  *(_DWORD *)(a1 + 168) = 0;
  *(_BYTE *)(a1 + 172) = 1;
  *(_DWORD *)(a1 + 176) = 0;
  *(_BYTE *)(a1 + 180) = 1;
  *(_QWORD *)(a1 + 184) = 0;
  *(_DWORD *)(a1 + 192) = 0;
  *(_BYTE *)(a1 + 196) = 1;
  *(_DWORD *)(a1 + 200) = 0;
  *(_BYTE *)(a1 + 204) = 1;
  *(_DWORD *)(a1 + 208) = 0;
  *(_BYTE *)(a1 + 212) = 1;
  *(_QWORD *)(a1 + 216) = 0;
  *(_DWORD *)(a1 + 224) = 0;
  *(_BYTE *)(a1 + 228) = 1;
  *(_DWORD *)(a1 + 232) = 0;
  *(_BYTE *)(a1 + 236) = 1;
  *(_DWORD *)(a1 + 240) = 0;
  *(_BYTE *)(a1 + 244) = 1;
  *(_QWORD *)(a1 + 248) = 0;
  *(_DWORD *)(a1 + 256) = 0;
  *(_BYTE *)(a1 + 260) = 1;
  *(_QWORD *)(a1 + 264) = 0;
  *(_QWORD *)(a1 + 272) = 0;
  *(_BYTE *)(a1 + 280) = 1;
  *(_QWORD *)(a1 + 288) = 0;
}

uint64_t sub_244ECFD4C()
{
  return 0;
}

uint64_t sub_244ECFD58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  int v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  void (*v35)(char *, uint64_t);
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t AssociatedTypeWitness;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;

  v45 = a5;
  v43 = *(_QWORD *)(*(_QWORD *)(a4 + 8) + 24);
  v42 = *(_QWORD *)(v43 + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v39 = (char *)&v37 - v9;
  v10 = *(_QWORD *)(a3 - 8);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v41 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v46 = (char *)&v37 - v13;
  v14 = sub_244EE1F40();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v37 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v37 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v37 - v21;
  v44 = v10;
  v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  v24 = a1;
  v25 = v23(a1, 1, a3);
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v38 = a2;
  v26(v22, a2, v14);
  if (v25 == 1 && v23((uint64_t)v22, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v22, v14);
    v27 = 1;
    v29 = v44;
    v28 = v45;
  }
  else
  {
    v30 = *(void (**)(char *, uint64_t))(v15 + 8);
    v30(v22, v14);
    v26(v20, v24, v14);
    if (v23((uint64_t)v20, 1, a3) == 1)
    {
      swift_getAssociatedConformanceWitness();
      sub_244EE212C();
      sub_244EE2108();
      v30(v20, v14);
      v31 = v38;
      v29 = v44;
    }
    else
    {
      v29 = v44;
      (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v46, v20, a3);
      v31 = v38;
    }
    v32 = v37;
    v26(v37, v31, v14);
    if (v23((uint64_t)v32, 1, a3) == 1)
    {
      swift_getAssociatedConformanceWitness();
      sub_244EE212C();
      v33 = v41;
      sub_244EE2108();
      v30(v32, v14);
    }
    else
    {
      v33 = v41;
      (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v41, v32, a3);
    }
    v28 = v45;
    v34 = v46;
    sub_244EE2084();
    v35 = *(void (**)(char *, uint64_t))(v29 + 8);
    v35(v33, a3);
    v35(v34, a3);
    v27 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v28, v27, 1, a3);
}

uint64_t sub_244ED0120@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t, uint64_t);
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  char *v24;
  char *v25;
  void (*v26)(char *, char *, uint64_t);
  void (*v27)(char *, uint64_t);
  _QWORD v29[2];
  uint64_t v30;
  char *v31;

  v29[1] = a4;
  v30 = a2;
  v31 = a5;
  v7 = sub_244EE1F40();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)v29 - v13;
  v15 = *(_QWORD *)(a3 - 8);
  v16 = MEMORY[0x24BDAC7A8](v12);
  v18 = (char *)v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v29 - v19;
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v21(v14, a1, v7);
  v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v22(v14, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v14, v7);
    v23 = 1;
    v24 = v31;
  }
  else
  {
    v25 = v14;
    v26 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
    v26(v20, v25, a3);
    v21(v11, v30, v7);
    if (v22(v11, 1, a3) == 1)
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      v24 = v31;
      v26(v31, v20, a3);
    }
    else
    {
      v26(v18, v11, a3);
      v24 = v31;
      sub_244EE2090();
      v27 = *(void (**)(char *, uint64_t))(v15 + 8);
      v27(v18, a3);
      v27(v20, a3);
    }
    v23 = 0;
  }
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v24, v23, 1, a3);
}

uint64_t sub_244ED0330(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = a1;
  if (a2)
  {
    if (a1)
    {
      MEMORY[0x24BDAC7A8](a1);
      sub_244EE1DA8();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_244EE1D90();
      return a1;
    }
    else
    {
      swift_bridgeObjectRetain();
      return a2;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v2;
}

uint64_t sub_244ED040C(uint64_t result)
{
  if (result)
  {
    MEMORY[0x24BDAC7A8](result);
    swift_bridgeObjectRetain();
    return sub_244EE1D9C();
  }
  return result;
}

uint64_t sub_244ED04A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t TupleTypeMetadata2;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char v15;
  char v16;
  _QWORD v18[2];

  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v11 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v13 = (char *)v18 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 16))((char *)v18 - v12, a1, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 16))(&v13[*(int *)(TupleTypeMetadata2 + 48)], a2, a5);
  if (a3)
  {
    v18[1] = a3;
    v14 = sub_244EE1D84();
    MEMORY[0x24952A0F0](MEMORY[0x24BEE0310], v14);
    v15 = sub_244EE1E5C();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, TupleTypeMetadata2);
    v16 = v15 ^ 1;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, TupleTypeMetadata2);
    v16 = 1;
  }
  return v16 & 1;
}

uint64_t sub_244ED05F4(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)v1 = result;
  *(_BYTE *)(v1 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t (*sub_244ED0604())()
{
  return nullsub_1;
}

unint64_t sub_244ED0614(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  unsigned __int8 v3;

  if ((a2 & 0x100000000) == 0)
  {
    if ((a1 & 0x100000000) != 0)
      LODWORD(a1) = 0;
    v2 = __OFADD__((_DWORD)a2, (_DWORD)a1);
    LODWORD(a1) = a2 + a1;
    if (!v2)
      goto LABEL_5;
    __break(1u);
LABEL_9:
    v3 = 1;
    return a1 | ((unint64_t)v3 << 32);
  }
  if ((a1 & 0x100000000) != 0)
    goto LABEL_9;
LABEL_5:
  v3 = 0;
  return a1 | ((unint64_t)v3 << 32);
}

uint64_t sub_244ED0664(unint64_t a1)
{
  return a1 | ((HIDWORD(a1) & 1) << 32);
}

unint64_t sub_244ED067C(unint64_t result, unint64_t a2)
{
  uint64_t v2;
  BOOL v3;

  if (((a2 | result) & 0x100000000) != 0)
  {
    v2 = HIDWORD(a2) & 1;
    return a2 | ((unint64_t)v2 << 32);
  }
  v3 = __OFSUB__((_DWORD)a2, (_DWORD)result);
  LODWORD(a2) = a2 - result;
  if (!v3)
  {
    LOBYTE(v2) = 0;
    return a2 | ((unint64_t)v2 << 32);
  }
  __break(1u);
  return result;
}

uint64_t sub_244ED06B8()
{
  return 0x100000000;
}

unint64_t sub_244ED06D4()
{
  unsigned int *v0;

  return *v0 | ((unint64_t)*((unsigned __int8 *)v0 + 4) << 32);
}

unint64_t sub_244ED06F4()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 8) | ((unint64_t)*(unsigned __int8 *)(v0 + 12) << 32);
}

uint64_t sub_244ED0714(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 8) = result;
  *(_BYTE *)(v1 + 12) = BYTE4(result) & 1;
  return result;
}

uint64_t (*sub_244ED0724())()
{
  return nullsub_1;
}

unint64_t sub_244ED0734()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 16) | ((unint64_t)*(unsigned __int8 *)(v0 + 20) << 32);
}

uint64_t sub_244ED0754(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 16) = result;
  *(_BYTE *)(v1 + 20) = BYTE4(result) & 1;
  return result;
}

uint64_t (*sub_244ED0764())()
{
  return nullsub_1;
}

unint64_t sub_244ED0774()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 24) | ((unint64_t)*(unsigned __int8 *)(v0 + 28) << 32);
}

uint64_t sub_244ED0794(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 24) = result;
  *(_BYTE *)(v1 + 28) = BYTE4(result) & 1;
  return result;
}

uint64_t (*sub_244ED07A4())()
{
  return nullsub_1;
}

uint64_t sub_244ED07B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = a1;
  return result;
}

uint64_t (*sub_244ED07DC())()
{
  return nullsub_1;
}

uint64_t sub_244ED07EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  int v7;
  int v8;
  int v9;
  int v12;
  int v13;
  BOOL v14;
  int v15;
  char v16;
  int v17;
  int v18;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  unint64_t v21;
  char v22;
  char v23;
  char v24;
  unint64_t v25;
  unint64_t v26;
  _BYTE v27[8];
  uint64_t v28;

  v12 = *(_DWORD *)a1;
  if (*(_BYTE *)(v4 + 4) == 1)
  {
    if ((*(_BYTE *)(a1 + 4) & 1) != 0)
    {
      v2 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    v13 = *(_DWORD *)v4;
    if (*(_BYTE *)(a1 + 4))
      v12 = 0;
    v14 = __OFADD__(v13, v12);
    v12 += v13;
    if (v14)
    {
      __break(1u);
      goto LABEL_14;
    }
  }
  v2 = 0;
LABEL_8:
  v7 = *(_DWORD *)(a1 + 8);
  if (*(_BYTE *)(v4 + 12) == 1)
  {
    if ((*(_BYTE *)(a1 + 12) & 1) != 0)
    {
      v3 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    v15 = *(_DWORD *)(v4 + 8);
    if (*(_BYTE *)(a1 + 12))
      v7 = 0;
    v14 = __OFADD__(v15, v7);
    v7 += v15;
    if (v14)
    {
      __break(1u);
      goto LABEL_21;
    }
  }
LABEL_14:
  v3 = 0;
LABEL_15:
  v9 = *(_DWORD *)(a1 + 16);
  if (*(_BYTE *)(v4 + 20) == 1)
  {
    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    {
      v16 = 1;
      goto LABEL_22;
    }
  }
  else
  {
    v17 = *(_DWORD *)(v4 + 16);
    if (*(_BYTE *)(a1 + 20))
      v9 = 0;
    v14 = __OFADD__(v17, v9);
    v9 += v17;
    if (v14)
    {
      __break(1u);
      goto LABEL_28;
    }
  }
LABEL_21:
  v16 = 0;
LABEL_22:
  v8 = *(_DWORD *)(a1 + 24);
  v23 = v16;
  v24 = v3;
  v22 = v2;
  if (*(_BYTE *)(v4 + 28) == 1)
  {
    if ((*(_BYTE *)(a1 + 28) & 1) != 0)
    {
      v6 = 1;
      goto LABEL_29;
    }
  }
  else
  {
    v18 = *(_DWORD *)(v4 + 24);
    if (*(_BYTE *)(a1 + 28))
      v8 = 0;
    v14 = __OFADD__(v18, v8);
    v8 += v18;
    if (v14)
    {
      __break(1u);
      goto LABEL_41;
    }
  }
LABEL_28:
  v6 = 0;
LABEL_29:
  sub_244EC2684(v4 + 32, (uint64_t)v27, &qword_25742B120);
  v5 = *(_QWORD *)(a1 + 32);
  sub_244EC2684((uint64_t)v27, (uint64_t)&v26, &qword_25742B120);
  if (!v5)
  {
    result = sub_244EC26C8((uint64_t)v27);
    goto LABEL_42;
  }
  sub_244EC2684((uint64_t)v27, (uint64_t)&v28, &qword_25742B120);
  if (!v28)
  {
LABEL_41:
    v26 = v5;
    result = swift_bridgeObjectRetain();
    goto LABEL_42;
  }
  sub_244ED978C(v4);
  sub_244ED978C(a1);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v25 = v26;
  v26 = 0x8000000000000000;
  sub_244ED6EB4(v5, (uint64_t)sub_244ED9788, 0, isUniquelyReferenced_nonNull_native, &v25, &qword_25742AEF0);
  v26 = v25;
  result = swift_bridgeObjectRelease();
LABEL_42:
  v21 = v26;
  *(_DWORD *)a2 = v12;
  *(_BYTE *)(a2 + 4) = v22;
  *(_DWORD *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 12) = v24;
  *(_DWORD *)(a2 + 16) = v9;
  *(_BYTE *)(a2 + 20) = v23;
  *(_DWORD *)(a2 + 24) = v8;
  *(_BYTE *)(a2 + 28) = v6;
  *(_QWORD *)(a2 + 32) = v21;
  return result;
}

uint64_t sub_244ED0A50@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_DWORD *)a6 = result;
  *(_BYTE *)(a6 + 4) = BYTE4(result) & 1;
  *(_DWORD *)(a6 + 8) = a2;
  *(_BYTE *)(a6 + 12) = BYTE4(a2) & 1;
  *(_DWORD *)(a6 + 16) = a3;
  *(_BYTE *)(a6 + 20) = BYTE4(a3) & 1;
  *(_DWORD *)(a6 + 24) = a4;
  *(_BYTE *)(a6 + 28) = BYTE4(a4) & 1;
  *(_QWORD *)(a6 + 32) = a5;
  return result;
}

uint64_t sub_244ED0A88@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  int v5;
  char v6;
  BOOL v7;
  int v8;
  char v9;
  int v10;
  int v11;
  char v12;
  int v13;
  int v14;
  char v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  char v20;
  int v21;

  v3 = result;
  v5 = *(_DWORD *)v2;
  v6 = *(_BYTE *)(v2 + 4);
  if ((v6 & 1) == 0 && (*(_BYTE *)(result + 4) & 1) == 0)
  {
    v7 = __OFSUB__(v5, *(_DWORD *)result);
    v5 -= *(_DWORD *)result;
    if (v7)
    {
      __break(1u);
      goto LABEL_21;
    }
    v6 = 0;
  }
  v8 = *(_DWORD *)(v2 + 8);
  v9 = *(_BYTE *)(v2 + 12);
  if ((v9 & 1) == 0 && (*(_BYTE *)(result + 12) & 1) == 0)
  {
    v10 = *(_DWORD *)(result + 8);
    v7 = __OFSUB__(v8, v10);
    v8 -= v10;
    if (!v7)
    {
      v9 = 0;
      goto LABEL_9;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
LABEL_9:
  v11 = *(_DWORD *)(v2 + 16);
  v12 = *(_BYTE *)(v2 + 20);
  if ((v12 & 1) == 0 && (*(_BYTE *)(result + 20) & 1) == 0)
  {
    v13 = *(_DWORD *)(result + 16);
    v7 = __OFSUB__(v11, v13);
    v11 -= v13;
    if (!v7)
    {
      v12 = 0;
      goto LABEL_13;
    }
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
LABEL_13:
  v14 = *(_DWORD *)(v2 + 24);
  v15 = *(_BYTE *)(v2 + 28);
  if ((v15 & 1) == 0 && (*(_BYTE *)(result + 28) & 1) == 0)
  {
    v16 = *(_DWORD *)(result + 24);
    v7 = __OFSUB__(v14, v16);
    v14 -= v16;
    if (!v7)
    {
      v15 = 0;
      goto LABEL_17;
    }
LABEL_23:
    __break(1u);
    return result;
  }
LABEL_17:
  v17 = *(_QWORD *)(v2 + 32);
  if (v17)
  {
    v18 = *(_QWORD *)(result + 32);
    v20 = v6;
    v21 = v5;
    v19 = v8;
    sub_244ED978C(result);
    sub_244ED978C(v2);
    v17 = sub_244ED9DF4(v17, v18, &qword_25742AEF0);
    sub_244EC2634(v3);
    result = sub_244EC2634(v2);
    v8 = v19;
    v6 = v20;
    v5 = v21;
  }
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = v6;
  *(_DWORD *)(a2 + 8) = v8;
  *(_BYTE *)(a2 + 12) = v9;
  *(_DWORD *)(a2 + 16) = v11;
  *(_BYTE *)(a2 + 20) = v12;
  *(_DWORD *)(a2 + 24) = v14;
  *(_BYTE *)(a2 + 28) = v15;
  *(_QWORD *)(a2 + 32) = v17;
  return result;
}

uint64_t sub_244ED0BEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  int v3;
  char v4;
  int v5;
  char v6;
  int v7;
  char v8;
  uint64_t v9;

  v2 = *(_BYTE *)(v1 + 12);
  v3 = *(_DWORD *)(v1 + 16);
  v4 = *(_BYTE *)(v1 + 20);
  v5 = *(_DWORD *)(v1 + 24);
  v6 = *(_BYTE *)(v1 + 28);
  v7 = *(_DWORD *)(v1 + 32);
  v8 = *(_BYTE *)(v1 + 36);
  v9 = *(_QWORD *)(v1 + 40);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 8);
  *(_BYTE *)(a1 + 4) = v2;
  *(_DWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 12) = v4;
  *(_DWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 20) = v6;
  *(_DWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 28) = v8;
  *(_QWORD *)(a1 + 32) = v9;
  return swift_bridgeObjectRetain();
}

__n128 sub_244ED0C38(uint64_t a1)
{
  uint64_t v1;
  __n128 result;
  __int128 v4;

  swift_bridgeObjectRelease();
  result = *(__n128 *)a1;
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 8) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 24) = v4;
  *(_QWORD *)(v1 + 40) = *(_QWORD *)(a1 + 32);
  return result;
}

unint64_t sub_244ED0C70()
{
  uint64_t v0;
  int v1;
  int v2;
  unint64_t result;
  unsigned int v4;
  unsigned __int8 v5;
  int v6;
  BOOL v7;
  uint64_t v8;
  _BYTE v9[8];
  _BYTE v10[8];
  int v11;
  char v12;
  int v13;
  char v14;
  int v15;
  char v16;

  sub_244EC2684(v0, (uint64_t)v10, &qword_25742B420);
  sub_244EC2684((uint64_t)v10, (uint64_t)&v11, &qword_25742B420);
  if ((v12 & 1) != 0
    || (v1 = v11,
        sub_244EC2684(v0 + 8, (uint64_t)v9, &qword_25742B420),
        sub_244EC2684((uint64_t)v9, (uint64_t)&v13, &qword_25742B420),
        (v14 & 1) != 0)
    || (v2 = v13,
        sub_244EC2684(v0 + 16, (uint64_t)&v8, &qword_25742B420),
        result = sub_244EC2684((uint64_t)&v8, (uint64_t)&v15, &qword_25742B420),
        (v16 & 1) != 0))
  {
    v4 = 0;
    v5 = 1;
LABEL_5:
    LOBYTE(v15) = v5;
    return v4 | ((unint64_t)v5 << 32);
  }
  v6 = v1 + v2;
  if (__OFADD__(v1, v2))
  {
    __break(1u);
  }
  else
  {
    v7 = __OFADD__(v6, v15);
    v4 = v6 + v15;
    if (!v7)
    {
      v5 = 0;
      goto LABEL_5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_244ED0D5C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t sub_244ED0D68(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = result;
  *(_BYTE *)(v2 + 32) = a2 & 1;
  return result;
}

uint64_t sub_244ED0D78()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_244ED0D80(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 40) = a1;
  return result;
}

uint64_t (*sub_244ED0DA8())()
{
  return nullsub_1;
}

uint64_t sub_244ED0DB8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_244ED0DC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = a1;
  return result;
}

uint64_t (*sub_244ED0DE8())()
{
  return nullsub_1;
}

uint64_t sub_244ED0DF8@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  char v6;
  int v7;
  char v8;
  int v11;
  int v12;
  BOOL v13;
  int v14;
  char v15;
  int v16;
  uint64_t v17;
  BOOL v18;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  unint64_t v21;
  char v22;
  char v23;
  unint64_t v24;
  unint64_t v25;
  _BYTE v26[8];
  uint64_t v27;

  v11 = *a1;
  if (*(_BYTE *)(v3 + 4) == 1)
  {
    if ((a1[1] & 1) != 0)
    {
      v8 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    v12 = *(_DWORD *)v3;
    if (*((_BYTE *)a1 + 4))
      v11 = 0;
    v13 = __OFADD__(v12, v11);
    v11 += v12;
    if (v13)
    {
      __break(1u);
      goto LABEL_14;
    }
  }
  v8 = 0;
LABEL_8:
  v5 = a1[2];
  if (*(_BYTE *)(v3 + 12) == 1)
  {
    if ((a1[3] & 1) != 0)
    {
      v2 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    v14 = *(_DWORD *)(v3 + 8);
    if (*((_BYTE *)a1 + 12))
      v5 = 0;
    v13 = __OFADD__(v14, v5);
    v5 += v14;
    if (v13)
    {
      __break(1u);
      goto LABEL_21;
    }
  }
LABEL_14:
  v2 = 0;
LABEL_15:
  v7 = a1[4];
  if (*(_BYTE *)(v3 + 20) == 1)
  {
    if ((a1[5] & 1) != 0)
    {
      v15 = 1;
      goto LABEL_22;
    }
  }
  else
  {
    v16 = *(_DWORD *)(v3 + 16);
    if (*((_BYTE *)a1 + 20))
      v7 = 0;
    v13 = __OFADD__(v16, v7);
    v7 += v16;
    if (v13)
    {
      __break(1u);
      goto LABEL_28;
    }
  }
LABEL_21:
  v15 = 0;
LABEL_22:
  v4 = *((_QWORD *)a1 + 3);
  v22 = v15;
  v23 = v2;
  if (*(_BYTE *)(v3 + 32) == 1)
  {
    if ((a1[8] & 1) != 0)
    {
      v6 = 1;
      goto LABEL_29;
    }
  }
  else
  {
    v17 = *(_QWORD *)(v3 + 24);
    if (*((_BYTE *)a1 + 32))
      v4 = 0;
    v18 = __CFADD__(v17, v4);
    v4 += v17;
    if (v18)
    {
      __break(1u);
      goto LABEL_41;
    }
  }
LABEL_28:
  v6 = 0;
LABEL_29:
  sub_244EC2684(v3 + 48, (uint64_t)v26, &qword_25742B130);
  v3 = *((_QWORD *)a1 + 6);
  sub_244EC2684((uint64_t)v26, (uint64_t)&v25, &qword_25742B130);
  if (!v3)
  {
    result = sub_244EC26C8((uint64_t)v26);
    goto LABEL_42;
  }
  sub_244EC2684((uint64_t)v26, (uint64_t)&v27, &qword_25742B130);
  if (!v27)
  {
LABEL_41:
    v25 = v3;
    result = swift_bridgeObjectRetain();
    goto LABEL_42;
  }
  sub_244EC26C8((uint64_t)v26);
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v24 = v25;
  v25 = 0x8000000000000000;
  sub_244ED6EB4(v3, (uint64_t)sub_244ED9788, 0, isUniquelyReferenced_nonNull_native, &v24, &qword_25742AED0);
  v25 = v24;
  result = swift_bridgeObjectRelease();
LABEL_42:
  v21 = v25;
  *(_DWORD *)a2 = v11;
  *(_BYTE *)(a2 + 4) = v8;
  *(_DWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 12) = v23;
  *(_DWORD *)(a2 + 16) = v7;
  *(_BYTE *)(a2 + 20) = v22;
  *(_QWORD *)(a2 + 24) = v4;
  *(_BYTE *)(a2 + 32) = v6;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = v21;
  return result;
}

uint64_t sub_244ED1054@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  *(_DWORD *)a8 = result;
  *(_BYTE *)(a8 + 4) = BYTE4(result) & 1;
  *(_DWORD *)(a8 + 8) = a2;
  *(_BYTE *)(a8 + 12) = BYTE4(a2) & 1;
  *(_DWORD *)(a8 + 16) = a3;
  *(_BYTE *)(a8 + 20) = BYTE4(a3) & 1;
  *(_QWORD *)(a8 + 24) = a4;
  *(_BYTE *)(a8 + 32) = a5 & 1;
  *(_QWORD *)(a8 + 40) = a6;
  *(_QWORD *)(a8 + 48) = a7;
  return result;
}

uint64_t sub_244ED108C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int *v2;
  int v4;
  char v5;
  BOOL v6;
  int v7;
  char v8;
  int v9;
  int v10;
  char v11;
  int v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  int v21;

  v4 = *v2;
  v5 = *((_BYTE *)v2 + 4);
  if ((v5 & 1) == 0 && (*(_BYTE *)(result + 4) & 1) == 0)
  {
    v6 = __OFSUB__(v4, *(_DWORD *)result);
    v4 -= *(_DWORD *)result;
    if (v6)
    {
      __break(1u);
      goto LABEL_23;
    }
    v5 = 0;
  }
  v7 = v2[2];
  v8 = *((_BYTE *)v2 + 12);
  if ((v8 & 1) == 0 && (*(_BYTE *)(result + 12) & 1) == 0)
  {
    v9 = *(_DWORD *)(result + 8);
    v6 = __OFSUB__(v7, v9);
    v7 -= v9;
    if (!v6)
    {
      v8 = 0;
      goto LABEL_9;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
LABEL_9:
  v10 = v2[4];
  v11 = *((_BYTE *)v2 + 20);
  if ((v11 & 1) == 0 && (*(_BYTE *)(result + 20) & 1) == 0)
  {
    v12 = *(_DWORD *)(result + 16);
    v6 = __OFSUB__(v10, v12);
    v10 -= v12;
    if (!v6)
    {
      v11 = 0;
      goto LABEL_13;
    }
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    return result;
  }
LABEL_13:
  v13 = *((_QWORD *)v2 + 3);
  v14 = *((_BYTE *)v2 + 32);
  if ((v14 & 1) == 0 && (*(_BYTE *)(result + 32) & 1) == 0)
  {
    v15 = *(_QWORD *)(result + 24);
    v16 = v13 >= v15;
    v13 -= v15;
    if (!v16)
      goto LABEL_25;
    v14 = 0;
  }
  if (*((_QWORD *)v2 + 6))
  {
    v17 = *(_QWORD *)(result + 48);
    v20 = v5;
    v21 = v4;
    swift_bridgeObjectRetain();
    v18 = swift_bridgeObjectRetain();
    v19 = sub_244ED9DF4(v18, v17, &qword_25742AED0);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    v5 = v20;
    v4 = v21;
  }
  else
  {
    v19 = 0;
  }
  *(_DWORD *)a2 = v4;
  *(_BYTE *)(a2 + 4) = v5;
  *(_DWORD *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 12) = v8;
  *(_DWORD *)(a2 + 16) = v10;
  *(_BYTE *)(a2 + 20) = v11;
  *(_QWORD *)(a2 + 24) = v13;
  *(_BYTE *)(a2 + 32) = v14;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = v19;
  return result;
}

uint64_t sub_244ED11E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  int v3;
  char v4;
  int v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_BYTE *)(v1 + 52);
  v3 = *(_DWORD *)(v1 + 56);
  v4 = *(_BYTE *)(v1 + 60);
  v5 = *(_DWORD *)(v1 + 64);
  v6 = *(_BYTE *)(v1 + 68);
  v7 = *(_QWORD *)(v1 + 72);
  v8 = *(_BYTE *)(v1 + 80);
  v9 = *(_QWORD *)(v1 + 88);
  v10 = *(_QWORD *)(v1 + 96);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 48);
  *(_BYTE *)(a1 + 4) = v2;
  *(_DWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 12) = v4;
  *(_DWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 20) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = v10;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

__n128 sub_244ED1250(uint64_t a1)
{
  uint64_t v1;
  __int128 v3;
  __n128 result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 48) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 64) = v3;
  result = *(__n128 *)(a1 + 32);
  *(__n128 *)(v1 + 80) = result;
  *(_QWORD *)(v1 + 96) = *(_QWORD *)(a1 + 48);
  return result;
}

int *sub_244ED1294@<X0>(int *result@<X0>, uint64_t a2@<X8>)
{
  int *v2;
  int v3;
  int v4;
  int v5;
  BOOL v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  char v11;
  uint64_t v12;
  BOOL v13;

  v3 = *result;
  v4 = *((unsigned __int8 *)result + 4);
  if (*((_BYTE *)v2 + 4) == 1)
  {
    if ((v4 & 1) != 0)
    {
      LOBYTE(v5) = 1;
      goto LABEL_8;
    }
  }
  else
  {
    v5 = *v2;
    if (*((_BYTE *)result + 4))
      v3 = 0;
    v6 = __OFADD__(v5, v3);
    v3 += v5;
    if (v6)
    {
      __break(1u);
      goto LABEL_14;
    }
  }
  LOBYTE(v5) = 0;
LABEL_8:
  v4 = result[2];
  v7 = *((unsigned __int8 *)result + 12);
  if (*((_BYTE *)v2 + 12) == 1)
  {
    if ((v7 & 1) != 0)
    {
      LOBYTE(v8) = 1;
      goto LABEL_15;
    }
  }
  else
  {
    v8 = v2[2];
    if (*((_BYTE *)result + 12))
      v4 = 0;
    v6 = __OFADD__(v8, v4);
    v4 += v8;
    if (v6)
    {
      __break(1u);
      goto LABEL_21;
    }
  }
LABEL_14:
  LOBYTE(v8) = 0;
LABEL_15:
  v7 = result[4];
  v9 = *((unsigned __int8 *)result + 20);
  if (*((_BYTE *)v2 + 20) == 1)
  {
    if ((v9 & 1) != 0)
    {
      LOBYTE(v10) = 1;
      goto LABEL_22;
    }
  }
  else
  {
    v10 = v2[4];
    if (*((_BYTE *)result + 20))
      v7 = 0;
    v6 = __OFADD__(v10, v7);
    v7 += v10;
    if (v6)
    {
      __break(1u);
      goto LABEL_28;
    }
  }
LABEL_21:
  LOBYTE(v10) = 0;
LABEL_22:
  v9 = *((_QWORD *)result + 3);
  if (*((_BYTE *)v2 + 32) == 1)
  {
    if ((result[8] & 1) != 0)
    {
      v11 = 1;
LABEL_29:
      *(_DWORD *)a2 = v3;
      *(_BYTE *)(a2 + 4) = v5;
      *(_DWORD *)(a2 + 8) = v4;
      *(_BYTE *)(a2 + 12) = v8;
      *(_DWORD *)(a2 + 16) = v7;
      *(_BYTE *)(a2 + 20) = v10;
      *(_QWORD *)(a2 + 24) = v9;
      *(_BYTE *)(a2 + 32) = v11;
      return result;
    }
LABEL_28:
    v11 = 0;
    goto LABEL_29;
  }
  v12 = *((_QWORD *)v2 + 3);
  if (*((_BYTE *)result + 32))
    v9 = 0;
  v13 = __CFADD__(v12, v9);
  v9 += v12;
  if (!v13)
    goto LABEL_28;
  __break(1u);
  return result;
}

uint64_t sub_244ED13D8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(_DWORD *)a6 = result;
  *(_BYTE *)(a6 + 4) = BYTE4(result) & 1;
  *(_DWORD *)(a6 + 8) = a2;
  *(_BYTE *)(a6 + 12) = BYTE4(a2) & 1;
  *(_DWORD *)(a6 + 16) = a3;
  *(_BYTE *)(a6 + 20) = BYTE4(a3) & 1;
  *(_QWORD *)(a6 + 24) = a4;
  *(_BYTE *)(a6 + 32) = a5 & 1;
  return result;
}

uint64_t sub_244ED140C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int *v2;
  int v3;
  char v4;
  BOOL v5;
  int v6;
  char v7;
  int v8;
  int v9;
  char v10;
  int v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  BOOL v15;

  v3 = *v2;
  v4 = *((_BYTE *)v2 + 4);
  if ((v4 & 1) == 0 && (*(_BYTE *)(result + 4) & 1) == 0)
  {
    v5 = __OFSUB__(v3, *(_DWORD *)result);
    v3 -= *(_DWORD *)result;
    if (v5)
    {
      __break(1u);
      goto LABEL_20;
    }
    v4 = 0;
  }
  v6 = v2[2];
  v7 = *((_BYTE *)v2 + 12);
  if ((v7 & 1) != 0 || (*(_BYTE *)(result + 12) & 1) != 0)
    goto LABEL_9;
  v8 = *(_DWORD *)(result + 8);
  v5 = __OFSUB__(v6, v8);
  v6 -= v8;
  if (v5)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v7 = 0;
LABEL_9:
  v9 = v2[4];
  v10 = *((_BYTE *)v2 + 20);
  if ((v10 & 1) != 0 || (*(_BYTE *)(result + 20) & 1) != 0)
  {
LABEL_13:
    v12 = *((_QWORD *)v2 + 3);
    v13 = *((_BYTE *)v2 + 32);
    if ((v13 & 1) == 0 && (*(_BYTE *)(result + 32) & 1) == 0)
    {
      v14 = *(_QWORD *)(result + 24);
      v15 = v12 >= v14;
      v12 -= v14;
      if (!v15)
        goto LABEL_22;
      v13 = 0;
    }
    *(_DWORD *)a2 = v3;
    *(_BYTE *)(a2 + 4) = v4;
    *(_DWORD *)(a2 + 8) = v6;
    *(_BYTE *)(a2 + 12) = v7;
    *(_DWORD *)(a2 + 16) = v9;
    *(_BYTE *)(a2 + 20) = v10;
    *(_QWORD *)(a2 + 24) = v12;
    *(_BYTE *)(a2 + 32) = v13;
    return result;
  }
  v11 = *(_DWORD *)(result + 16);
  v5 = __OFSUB__(v9, v11);
  v9 -= v11;
  if (!v5)
  {
    v10 = 0;
    goto LABEL_13;
  }
LABEL_21:
  __break(1u);
LABEL_22:
  __break(1u);
  return result;
}

void sub_244ED14D0(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  int v3;
  char v4;
  int v5;
  char v6;
  uint64_t v7;
  char v8;

  v2 = *(_BYTE *)(v1 + 108);
  v3 = *(_DWORD *)(v1 + 112);
  v4 = *(_BYTE *)(v1 + 116);
  v5 = *(_DWORD *)(v1 + 120);
  v6 = *(_BYTE *)(v1 + 124);
  v7 = *(_QWORD *)(v1 + 128);
  v8 = *(_BYTE *)(v1 + 136);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 104);
  *(_BYTE *)(a1 + 4) = v2;
  *(_DWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 12) = v4;
  *(_DWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 20) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_BYTE *)(a1 + 32) = v8;
}

__n128 sub_244ED1514(uint64_t a1)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 104) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 120) = v3;
  *(_BYTE *)(v1 + 136) = *(_BYTE *)(a1 + 32);
  return result;
}

uint64_t (*sub_244ED152C())()
{
  return nullsub_1;
}

unint64_t sub_244ED153C()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 32) | ((unint64_t)*(unsigned __int8 *)(v0 + 36) << 32);
}

uint64_t sub_244ED155C(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 32) = result;
  *(_BYTE *)(v1 + 36) = BYTE4(result) & 1;
  return result;
}

unint64_t sub_244ED156C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;

  sub_244EC2684(v0 + 40, (uint64_t)&v4, &qword_25742B428);
  sub_244EC2684((uint64_t)&v4, (uint64_t)&v5, &qword_25742B428);
  v1 = v5;
  if (!v5)
    goto LABEL_4;
  v2 = *(_QWORD *)(v5 + 16);
  if (v2 >> 31)
  {
    __break(1u);
LABEL_4:
    v2 = 0;
  }
  return v2 | ((unint64_t)(v1 == 0) << 32);
}

unint64_t sub_244ED15E4()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 48) | ((unint64_t)*(unsigned __int8 *)(v0 + 52) << 32);
}

uint64_t sub_244ED1604(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 48) = result;
  *(_BYTE *)(v1 + 52) = BYTE4(result) & 1;
  return result;
}

unint64_t sub_244ED1614()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 56) | ((unint64_t)*(unsigned __int8 *)(v0 + 60) << 32);
}

uint64_t sub_244ED1634(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 56) = result;
  *(_BYTE *)(v1 + 60) = BYTE4(result) & 1;
  return result;
}

uint64_t (*sub_244ED1644())()
{
  return nullsub_1;
}

unint64_t sub_244ED1654()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + 64) | ((unint64_t)*(unsigned __int8 *)(v0 + 68) << 32);
}

uint64_t sub_244ED1674(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(v1 + 64) = result;
  *(_BYTE *)(v1 + 68) = BYTE4(result) & 1;
  return result;
}

uint64_t (*sub_244ED1684())()
{
  return nullsub_1;
}

unint64_t sub_244ED1694@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  char isUniquelyReferenced_nonNull_native;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  BOOL v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  unint64_t result;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  char v25;
  int v26;
  unint64_t v27;
  unint64_t v28;
  _BYTE v29[8];
  _BYTE v30[8];
  uint64_t v31;
  uint64_t v32;

  sub_244EC2684(v2 + 40, (uint64_t)v30, &qword_25742B428);
  sub_244EC2684((uint64_t)v30, (uint64_t)&v28, &qword_25742B428);
  sub_244EC2684(a1 + 40, (uint64_t)v29, &qword_25742B428);
  sub_244EC2684((uint64_t)v29, (uint64_t)&v32, &qword_25742B428);
  v5 = v32;
  if (v32)
  {
    sub_244EC2684((uint64_t)v30, (uint64_t)&v31, &qword_25742B428);
    if (v31)
    {
      sub_244EC26F0(v2);
      sub_244EC26F0(a1);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v27 = v28;
      v28 = 0x8000000000000000;
      sub_244ED66D4(v5, (uint64_t)sub_244ED9D88, 0, isUniquelyReferenced_nonNull_native, (uint64_t *)&v27);
      v28 = v27;
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    v28 = v5;
    sub_244EC26F0(v2);
    v8 = a1;
  }
  else
  {
    v8 = v2;
  }
  sub_244EC26F0(v8);
LABEL_7:
  v9 = *(_DWORD *)a1;
  v10 = *(unsigned __int8 *)(a1 + 4);
  if (*(_BYTE *)(v2 + 4) == 1)
  {
    if ((v10 & 1) != 0)
    {
      LOBYTE(v11) = 1;
      goto LABEL_14;
    }
  }
  else
  {
    v11 = *(_DWORD *)v2;
    if (*(_BYTE *)(a1 + 4))
      v9 = 0;
    v12 = __OFADD__(v11, v9);
    v9 += v11;
    if (v12)
    {
      __break(1u);
      goto LABEL_20;
    }
  }
  LOBYTE(v11) = 0;
LABEL_14:
  v10 = *(_DWORD *)(a1 + 8);
  v13 = *(unsigned __int8 *)(a1 + 12);
  if (*(_BYTE *)(v2 + 12) == 1)
  {
    if ((v13 & 1) != 0)
    {
      LOBYTE(v14) = 1;
      goto LABEL_21;
    }
  }
  else
  {
    v14 = *(_DWORD *)(v2 + 8);
    if (*(_BYTE *)(a1 + 12))
      v10 = 0;
    v12 = __OFADD__(v14, v10);
    v10 += v14;
    if (v12)
    {
      __break(1u);
      goto LABEL_27;
    }
  }
LABEL_20:
  LOBYTE(v14) = 0;
LABEL_21:
  v13 = *(_DWORD *)(a1 + 16);
  v15 = *(unsigned __int8 *)(a1 + 20);
  if (*(_BYTE *)(v2 + 20) == 1)
  {
    if ((v15 & 1) != 0)
    {
      LOBYTE(v16) = 1;
      goto LABEL_28;
    }
  }
  else
  {
    v16 = *(_DWORD *)(v2 + 16);
    if (*(_BYTE *)(a1 + 20))
      v13 = 0;
    v12 = __OFADD__(v16, v13);
    v13 += v16;
    if (v12)
    {
      __break(1u);
      goto LABEL_34;
    }
  }
LABEL_27:
  LOBYTE(v16) = 0;
LABEL_28:
  v15 = *(_DWORD *)(a1 + 24);
  v17 = *(unsigned __int8 *)(a1 + 28);
  if (*(_BYTE *)(v2 + 28) == 1)
  {
    if ((v17 & 1) != 0)
    {
      LOBYTE(v18) = 1;
      goto LABEL_35;
    }
  }
  else
  {
    v18 = *(_DWORD *)(v2 + 24);
    if (*(_BYTE *)(a1 + 28))
      v15 = 0;
    v12 = __OFADD__(v18, v15);
    v15 += v18;
    if (v12)
    {
      __break(1u);
      goto LABEL_41;
    }
  }
LABEL_34:
  LOBYTE(v18) = 0;
LABEL_35:
  v17 = *(_DWORD *)(a1 + 32);
  result = *(unsigned __int8 *)(a1 + 36);
  if (*(_BYTE *)(v2 + 36) == 1)
  {
    if ((result & 1) != 0)
    {
      LOBYTE(v20) = 1;
      goto LABEL_42;
    }
  }
  else
  {
    v20 = *(_DWORD *)(v2 + 32);
    if (*(_BYTE *)(a1 + 36))
      v17 = 0;
    v12 = __OFADD__(v20, v17);
    v17 += v20;
    if (v12)
    {
      __break(1u);
      goto LABEL_48;
    }
  }
LABEL_41:
  LOBYTE(v20) = 0;
LABEL_42:
  result = v28;
  v7 = *(_DWORD *)(a1 + 48);
  v21 = *(unsigned __int8 *)(a1 + 52);
  if (*(_BYTE *)(v2 + 52) == 1)
  {
    if ((v21 & 1) != 0)
    {
      LOBYTE(v22) = 1;
      goto LABEL_49;
    }
  }
  else
  {
    v22 = *(_DWORD *)(v2 + 48);
    if (*(_BYTE *)(a1 + 52))
      v7 = 0;
    v12 = __OFADD__(v22, v7);
    v7 += v22;
    if (v12)
    {
      __break(1u);
      goto LABEL_55;
    }
  }
LABEL_48:
  LOBYTE(v22) = 0;
LABEL_49:
  v21 = *(_DWORD *)(a1 + 56);
  v23 = *(unsigned __int8 *)(a1 + 60);
  if (*(_BYTE *)(v2 + 60) == 1)
  {
    if ((v23 & 1) != 0)
    {
      LOBYTE(v24) = 1;
      goto LABEL_56;
    }
  }
  else
  {
    v24 = *(_DWORD *)(v2 + 56);
    if (*(_BYTE *)(a1 + 60))
      v21 = 0;
    v12 = __OFADD__(v24, v21);
    v21 += v24;
    if (v12)
    {
      __break(1u);
      goto LABEL_62;
    }
  }
LABEL_55:
  LOBYTE(v24) = 0;
LABEL_56:
  v23 = *(_DWORD *)(a1 + 64);
  if (*(_BYTE *)(v2 + 68) == 1)
  {
    if ((*(_BYTE *)(a1 + 68) & 1) != 0)
    {
      v25 = 1;
LABEL_63:
      *(_DWORD *)a2 = v9;
      *(_BYTE *)(a2 + 4) = v11;
      *(_DWORD *)(a2 + 8) = v10;
      *(_BYTE *)(a2 + 12) = v14;
      *(_DWORD *)(a2 + 16) = v13;
      *(_BYTE *)(a2 + 20) = v16;
      *(_DWORD *)(a2 + 24) = v15;
      *(_BYTE *)(a2 + 28) = v18;
      *(_DWORD *)(a2 + 32) = v17;
      *(_BYTE *)(a2 + 36) = v20;
      *(_QWORD *)(a2 + 40) = result;
      *(_DWORD *)(a2 + 48) = v7;
      *(_BYTE *)(a2 + 52) = v22;
      *(_DWORD *)(a2 + 56) = v21;
      *(_BYTE *)(a2 + 60) = v24;
      *(_DWORD *)(a2 + 64) = v23;
      *(_BYTE *)(a2 + 68) = v25;
      return result;
    }
LABEL_62:
    v25 = 0;
    goto LABEL_63;
  }
  v26 = *(_DWORD *)(v2 + 64);
  if (*(_BYTE *)(a1 + 68))
    v23 = 0;
  v12 = __OFADD__(v26, v23);
  v23 += v26;
  if (!v12)
    goto LABEL_62;
  __break(1u);
  return result;
}

uint64_t sub_244ED1A28@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, int a10, char a11)
{
  *(_DWORD *)a9 = result;
  *(_BYTE *)(a9 + 4) = BYTE4(result) & 1;
  *(_DWORD *)(a9 + 8) = a2;
  *(_BYTE *)(a9 + 12) = BYTE4(a2) & 1;
  *(_DWORD *)(a9 + 16) = a3;
  *(_BYTE *)(a9 + 20) = BYTE4(a3) & 1;
  *(_DWORD *)(a9 + 24) = a4;
  *(_BYTE *)(a9 + 28) = BYTE4(a4) & 1;
  *(_DWORD *)(a9 + 32) = a5;
  *(_BYTE *)(a9 + 36) = BYTE4(a5) & 1;
  *(_QWORD *)(a9 + 40) = a6;
  *(_DWORD *)(a9 + 48) = a7;
  *(_BYTE *)(a9 + 52) = BYTE4(a7) & 1;
  *(_DWORD *)(a9 + 56) = a8;
  *(_BYTE *)(a9 + 60) = BYTE4(a8) & 1;
  *(_DWORD *)(a9 + 64) = a10;
  *(_BYTE *)(a9 + 68) = a11 & 1;
  return result;
}

unint64_t sub_244ED1A94@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  int *v2;
  unint64_t v3;
  int v5;
  char v6;
  BOOL v7;
  int v8;
  char v9;
  int v10;
  int v11;
  char v12;
  int v13;
  int v14;
  char v15;
  int v16;
  int v17;
  char v18;
  int v19;
  int v20;
  char v21;
  int v22;
  int v23;
  char v24;
  int v25;
  int v26;
  char v27;
  int v28;
  unint64_t v29;
  uint64_t v30;
  int v31;
  char v32;
  int v33;
  char v34;
  int v35;
  char v36;
  int v37;
  char v38;
  int v39;
  char v40;
  unint64_t v41;
  _BYTE v42[8];
  uint64_t v43;

  v3 = result;
  v5 = *v2;
  v6 = *((_BYTE *)v2 + 4);
  if ((v6 & 1) == 0 && (*(_BYTE *)(result + 4) & 1) == 0)
  {
    v7 = __OFSUB__(v5, *(_DWORD *)result);
    v5 -= *(_DWORD *)result;
    if (v7)
    {
      __break(1u);
      goto LABEL_37;
    }
    v6 = 0;
  }
  v8 = v2[2];
  v9 = *((_BYTE *)v2 + 12);
  if ((v9 & 1) == 0 && (*(_BYTE *)(result + 12) & 1) == 0)
  {
    v10 = *(_DWORD *)(result + 8);
    v7 = __OFSUB__(v8, v10);
    v8 -= v10;
    if (!v7)
    {
      v9 = 0;
      goto LABEL_9;
    }
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
LABEL_9:
  v11 = v2[4];
  v12 = *((_BYTE *)v2 + 20);
  if ((v12 & 1) == 0 && (*(_BYTE *)(result + 20) & 1) == 0)
  {
    v13 = *(_DWORD *)(result + 16);
    v7 = __OFSUB__(v11, v13);
    v11 -= v13;
    if (!v7)
    {
      v12 = 0;
      goto LABEL_13;
    }
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
LABEL_13:
  v14 = v2[6];
  v15 = *((_BYTE *)v2 + 28);
  if ((v15 & 1) == 0 && (*(_BYTE *)(result + 28) & 1) == 0)
  {
    v16 = *(_DWORD *)(result + 24);
    v7 = __OFSUB__(v14, v16);
    v14 -= v16;
    if (!v7)
    {
      v15 = 0;
      goto LABEL_17;
    }
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
LABEL_17:
  v17 = v2[8];
  v18 = *((_BYTE *)v2 + 36);
  if ((v18 & 1) == 0 && (*(_BYTE *)(result + 36) & 1) == 0)
  {
    v19 = *(_DWORD *)(result + 32);
    v7 = __OFSUB__(v17, v19);
    v17 -= v19;
    if (!v7)
    {
      v18 = 0;
      goto LABEL_21;
    }
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_21:
  v38 = v18;
  v39 = v17;
  v40 = v15;
  result = sub_244ED9FB4(MEMORY[0x24BEE4AF8]);
  v20 = v2[12];
  v21 = *((_BYTE *)v2 + 52);
  if ((v21 & 1) == 0 && (*(_BYTE *)(v3 + 52) & 1) == 0)
  {
    v22 = *(_DWORD *)(v3 + 48);
    v7 = __OFSUB__(v20, v22);
    v20 -= v22;
    if (!v7)
    {
      v21 = 0;
      goto LABEL_25;
    }
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
LABEL_25:
  v37 = v14;
  v23 = v2[14];
  v24 = *((_BYTE *)v2 + 60);
  if ((v24 & 1) == 0 && (*(_BYTE *)(v3 + 60) & 1) == 0)
  {
    v25 = *(_DWORD *)(v3 + 56);
    v7 = __OFSUB__(v23, v25);
    v23 -= v25;
    if (!v7)
    {
      v24 = 0;
      goto LABEL_29;
    }
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
LABEL_29:
  v36 = v12;
  v26 = v2[16];
  v27 = *((_BYTE *)v2 + 68);
  if ((v27 & 1) == 0 && (*(_BYTE *)(v3 + 68) & 1) == 0)
  {
    v28 = *(_DWORD *)(v3 + 64);
    v7 = __OFSUB__(v26, v28);
    v26 -= v28;
    if (!v7)
    {
      v27 = 0;
      goto LABEL_33;
    }
LABEL_43:
    __break(1u);
    return result;
  }
LABEL_33:
  v31 = v26;
  v32 = v24;
  v33 = v23;
  v34 = v21;
  v29 = result;
  v35 = v20;
  sub_244EC2684((uint64_t)(v2 + 10), (uint64_t)v42, &qword_25742B428);
  result = sub_244EC2684((uint64_t)v42, (uint64_t)&v43, &qword_25742B428);
  v30 = v43;
  if (v43)
  {
    v41 = sub_244ED9FB4(MEMORY[0x24BEE4AF8]);
    MEMORY[0x24BDAC7A8](v41);
    sub_244EDA228(v30, (void (*)(uint64_t, uint64_t))sub_244EDA0B4);
    result = swift_bridgeObjectRelease();
    v29 = v41;
  }
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = v6;
  *(_DWORD *)(a2 + 8) = v8;
  *(_BYTE *)(a2 + 12) = v9;
  *(_DWORD *)(a2 + 16) = v11;
  *(_BYTE *)(a2 + 20) = v36;
  *(_DWORD *)(a2 + 24) = v37;
  *(_BYTE *)(a2 + 28) = v40;
  *(_DWORD *)(a2 + 32) = v39;
  *(_BYTE *)(a2 + 36) = v38;
  *(_QWORD *)(a2 + 40) = v29;
  *(_DWORD *)(a2 + 48) = v35;
  *(_BYTE *)(a2 + 52) = v34;
  *(_DWORD *)(a2 + 56) = v33;
  *(_BYTE *)(a2 + 60) = v32;
  *(_DWORD *)(a2 + 64) = v31;
  *(_BYTE *)(a2 + 68) = v27;
  return result;
}

uint64_t sub_244ED1D68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_244EDA3A8((int *)(v1 + 144), a1);
}

uint64_t sub_244ED1D74(int *a1)
{
  uint64_t v1;

  return sub_244EDA458(a1, v1 + 144);
}

uint64_t (*sub_244ED1D7C())()
{
  return nullsub_1;
}

unint64_t sub_244ED1D8C(unint64_t result)
{
  int64_t v1;
  unsigned int v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  BOOL v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;

  if (!result)
  {
    v2 = 0;
    return v2 | ((unint64_t)(result == 0) << 32);
  }
  v1 = 0;
  v2 = 0;
  v3 = result + 64;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  while (v6)
  {
    v8 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v9 = v8 | (v1 << 6);
LABEL_6:
    v10 = *(_DWORD *)(*(_QWORD *)(result + 56) + 4 * v9);
    v11 = __OFADD__(v2, v10);
    v2 += v10;
    if (v11)
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }
  v12 = v1 + 1;
  if (__OFADD__(v1, 1))
    goto LABEL_29;
  if (v12 >= v7)
    return v2 | ((unint64_t)(result == 0) << 32);
  v13 = *(_QWORD *)(v3 + 8 * v12);
  ++v1;
  if (v13)
    goto LABEL_25;
  v1 = v12 + 1;
  if (v12 + 1 >= v7)
    return v2 | ((unint64_t)(result == 0) << 32);
  v13 = *(_QWORD *)(v3 + 8 * v1);
  if (v13)
    goto LABEL_25;
  v1 = v12 + 2;
  if (v12 + 2 >= v7)
    return v2 | ((unint64_t)(result == 0) << 32);
  v13 = *(_QWORD *)(v3 + 8 * v1);
  if (v13)
    goto LABEL_25;
  v1 = v12 + 3;
  if (v12 + 3 >= v7)
    return v2 | ((unint64_t)(result == 0) << 32);
  v13 = *(_QWORD *)(v3 + 8 * v1);
  if (v13)
    goto LABEL_25;
  v1 = v12 + 4;
  if (v12 + 4 >= v7)
    return v2 | ((unint64_t)(result == 0) << 32);
  v13 = *(_QWORD *)(v3 + 8 * v1);
  if (v13)
  {
LABEL_25:
    v6 = (v13 - 1) & v13;
    v9 = __clz(__rbit64(v13)) + (v1 << 6);
    goto LABEL_6;
  }
  v14 = v12 + 5;
  if (v14 >= v7)
    return v2 | ((unint64_t)(result == 0) << 32);
  v13 = *(_QWORD *)(v3 + 8 * v14);
  if (v13)
  {
    v1 = v14;
    goto LABEL_25;
  }
  while (1)
  {
    v1 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v1 >= v7)
      return v2 | ((unint64_t)(result == 0) << 32);
    v13 = *(_QWORD *)(v3 + 8 * v1);
    ++v14;
    if (v13)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_244ED1EE8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

unint64_t sub_244ED1F10(uint64_t a1)
{
  unint64_t v1;

  if (!a1)
    goto LABEL_4;
  v1 = *(_QWORD *)(a1 + 16);
  if (v1 >> 31)
  {
    __break(1u);
LABEL_4:
    v1 = 0;
  }
  return v1 | ((unint64_t)(a1 == 0) << 32);
}

uint64_t sub_244ED1F48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;

  v2 = a2;
  if (a1)
  {
    if (a2)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v6 = v2;
      sub_244ED6950(a1, (uint64_t)sub_244ED9D9C, 0, isUniquelyReferenced_nonNull_native, &v6);
      v2 = v6;
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      return a1;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return v2;
}

unint64_t sub_244ED1FF8(uint64_t a1, uint64_t a2)
{
  unint64_t result;
  unint64_t v4;

  result = sub_244EDA50C(MEMORY[0x24BEE4AF8]);
  if (a2)
  {
    swift_bridgeObjectRelease();
    v4 = sub_244EDA50C(MEMORY[0x24BEE4AF8]);
    MEMORY[0x24BDAC7A8](v4);
    sub_244EDA83C(a2, (uint64_t (*)(_QWORD, _QWORD))sub_244EDA5E0);
    return v4;
  }
  return result;
}

unint64_t sub_244ED2090(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  unint64_t result;
  char v9;
  int v10;
  BOOL v11;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  if (!a3)
    goto LABEL_6;
  if (!*(_QWORD *)(a3 + 16))
    goto LABEL_6;
  result = sub_244ED7DA8(a1);
  if ((v9 & 1) == 0)
    goto LABEL_6;
  v10 = *(_DWORD *)(*(_QWORD *)(a3 + 56) + 4 * result);
  v11 = __OFSUB__(a2, v10);
  a2 -= v10;
  if (v11)
  {
    __break(1u);
    return result;
  }
  if (a2 >= 1)
  {
LABEL_6:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *a4;
    *a4 = 0x8000000000000000;
    sub_244ED8BE4(a2, a1, isUniquelyReferenced_nonNull_native);
    *a4 = v13;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_244ED2138()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_244ED2140(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 216) = a1;
  return result;
}

uint64_t (*sub_244ED2168())()
{
  return nullsub_1;
}

uint64_t sub_244ED2178(uint64_t a1, unint64_t a2)
{
  return a2 | ((HIDWORD(a2) & 1) << 32);
}

uint64_t sub_244ED2190(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return a3 | ((HIDWORD(a3) & 1) << 32);
}

uint64_t sub_244ED21A8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_244ED21B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = a1;
  return result;
}

unint64_t sub_244ED21D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v10;
  int v11;
  BOOL v12;
  unsigned __int8 v13;
  int v14;
  int v15;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v18;

  v10 = a1;
  if ((a5 & 0x100000000) != 0)
  {
    if ((a1 & 0x100000000) == 0)
    {
      v10 = a1;
      goto LABEL_6;
    }
LABEL_22:
    v13 = 1;
    if ((a6 & 0x100000000) == 0)
      goto LABEL_7;
LABEL_23:
    if ((a2 & 0x100000000) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
  if ((a1 & 0x100000000) != 0)
    v11 = 0;
  else
    v11 = a1;
  v12 = __OFADD__((_DWORD)a5, v11);
  v10 = a5 + v11;
  if (v12)
  {
    __break(1u);
    goto LABEL_22;
  }
LABEL_6:
  v13 = 0;
  if ((a6 & 0x100000000) != 0)
    goto LABEL_23;
LABEL_7:
  if ((a2 & 0x100000000) != 0)
    v14 = 0;
  else
    v14 = a2;
  if (!__OFADD__((_DWORD)a6, v14))
  {
LABEL_11:
    if ((a7 & 0x100000000) == 0)
      goto LABEL_12;
LABEL_27:
    if ((a3 & 0x100000000) == 0)
      goto LABEL_16;
LABEL_30:
    if (!a4)
      goto LABEL_31;
    goto LABEL_17;
  }
  __break(1u);
LABEL_26:
  if ((a7 & 0x100000000) != 0)
    goto LABEL_27;
LABEL_12:
  if ((a3 & 0x100000000) != 0)
    v15 = 0;
  else
    v15 = a3;
  if (__OFADD__((_DWORD)a7, v15))
  {
    __break(1u);
    goto LABEL_30;
  }
LABEL_16:
  if (!a4)
  {
LABEL_31:
    swift_bridgeObjectRetain();
    return v10 | ((unint64_t)v13 << 32);
  }
LABEL_17:
  if (!a8)
    goto LABEL_31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v18 = a8;
  sub_244ED6BFC(a4, (uint64_t)sub_244ED9DB0, 0, isUniquelyReferenced_nonNull_native, &v18);
  swift_bridgeObjectRelease();
  return v10 | ((unint64_t)v13 << 32);
}

uint64_t sub_244ED2370(unint64_t a1)
{
  return a1 | ((HIDWORD(a1) & 1) << 32);
}

unint64_t sub_244ED23AC(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8;
  uint64_t v10;
  uint64_t v11;

  v8 = a5;
  if (((a5 | result) & 0x100000000) != 0)
  {
    v10 = HIDWORD(a5) & 1;
    if (((a6 | a2) & 0x100000000) != 0)
      goto LABEL_3;
    goto LABEL_8;
  }
  v8 = a5 - result;
  if (__OFSUB__((_DWORD)a5, (_DWORD)result))
  {
    __break(1u);
    goto LABEL_14;
  }
  LOBYTE(v10) = 0;
  if (((a6 | a2) & 0x100000000) == 0)
  {
LABEL_8:
    if (!__OFSUB__((_DWORD)a6, (_DWORD)a2))
    {
      if (((a7 | a3) & 0x100000000) != 0)
      {
LABEL_4:
        if (!a8)
          return v8 | ((unint64_t)v10 << 32);
LABEL_5:
        swift_bridgeObjectRetain();
        v11 = swift_bridgeObjectRetain();
        sub_244EDAB70(v11, a4);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v8 | ((unint64_t)v10 << 32);
      }
      goto LABEL_10;
    }
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
LABEL_3:
  if (((a7 | a3) & 0x100000000) != 0)
    goto LABEL_4;
LABEL_10:
  if (!__OFSUB__((_DWORD)a7, (_DWORD)a3))
  {
    if (!a8)
      return v8 | ((unint64_t)v10 << 32);
    goto LABEL_5;
  }
LABEL_15:
  __break(1u);
  return result;
}

unint64_t sub_244ED24D8()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 v2;

  v1 = *(unsigned int *)(v0 + 224);
  v2 = *(_BYTE *)(v0 + 228);
  swift_bridgeObjectRetain();
  return v1 | ((unint64_t)v2 << 32);
}

uint64_t sub_244ED255C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_DWORD *)(v4 + 224) = a1;
  *(_BYTE *)(v4 + 228) = BYTE4(a1) & 1;
  *(_DWORD *)(v4 + 232) = a2;
  *(_BYTE *)(v4 + 236) = BYTE4(a2) & 1;
  *(_DWORD *)(v4 + 240) = a3;
  *(_BYTE *)(v4 + 244) = BYTE4(a3) & 1;
  *(_QWORD *)(v4 + 248) = a4;
  return result;
}

uint64_t (*sub_244ED25C4())()
{
  return nullsub_1;
}

uint64_t sub_244ED25D4(int a1)
{
  uint64_t v1;
  uint64_t result;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  __int128 v17;
  _BYTE v18[8];
  uint64_t v19;

  v17 = *(_OWORD *)(v1 + 240);
  sub_244EC2684((uint64_t)&v17 + 8, (uint64_t)v18, &qword_25742B430);
  result = sub_244EC2684((uint64_t)v18, (uint64_t)&v19, &qword_25742B430);
  if (v19)
  {
    v4 = 0;
    v5 = 0;
    v6 = v19 + 64;
    v7 = 1 << *(_BYTE *)(v19 + 32);
    v8 = -1;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    v9 = v8 & *(_QWORD *)(v19 + 64);
    v10 = (unint64_t)(v7 + 63) >> 6;
    while (1)
    {
      if (v9)
      {
        v11 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v12 = v11 | (v4 << 6);
      }
      else
      {
        v13 = v4 + 1;
        if (__OFADD__(v4, 1))
        {
          __break(1u);
LABEL_35:
          __break(1u);
          goto LABEL_36;
        }
        if (v13 >= v10)
          goto LABEL_29;
        v14 = *(_QWORD *)(v6 + 8 * v13);
        ++v4;
        if (!v14)
        {
          v4 = v13 + 1;
          if (v13 + 1 >= v10)
            goto LABEL_29;
          v14 = *(_QWORD *)(v6 + 8 * v4);
          if (!v14)
          {
            v4 = v13 + 2;
            if (v13 + 2 >= v10)
              goto LABEL_29;
            v14 = *(_QWORD *)(v6 + 8 * v4);
            if (!v14)
            {
              v4 = v13 + 3;
              if (v13 + 3 >= v10)
                goto LABEL_29;
              v14 = *(_QWORD *)(v6 + 8 * v4);
              if (!v14)
              {
                v4 = v13 + 4;
                if (v13 + 4 >= v10)
                  goto LABEL_29;
                v14 = *(_QWORD *)(v6 + 8 * v4);
                if (!v14)
                {
                  v15 = v13 + 5;
                  if (v15 >= v10)
                  {
LABEL_29:
                    sub_244EC26C8((uint64_t)v18);
                    result = swift_release();
                    if (v5 >= (uint64_t)0xFFFFFFFF80000000)
                    {
                      if (v5 <= 0x7FFFFFFF)
                        return v5;
                      __break(1u);
                      return 0;
                    }
LABEL_36:
                    __break(1u);
LABEL_37:
                    __break(1u);
                    return result;
                  }
                  v14 = *(_QWORD *)(v6 + 8 * v15);
                  if (!v14)
                  {
                    while (1)
                    {
                      v4 = v15 + 1;
                      if (__OFADD__(v15, 1))
                        goto LABEL_37;
                      if (v4 >= v10)
                        goto LABEL_29;
                      v14 = *(_QWORD *)(v6 + 8 * v4);
                      ++v15;
                      if (v14)
                        goto LABEL_28;
                    }
                  }
                  v4 = v15;
                }
              }
            }
          }
        }
LABEL_28:
        v9 = (v14 - 1) & v14;
        v12 = __clz(__rbit64(v14)) + (v4 << 6);
      }
      if (*(_DWORD *)(*(_QWORD *)(v19 + 56) + 4 * v12) == a1 && __OFADD__(v5++, 1))
        goto LABEL_35;
    }
  }
  return 0;
}

uint64_t sub_244ED27AC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_244ED27B4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_244ED27C0()
{
  return swift_bridgeObjectRetain();
}

void sub_244ED27C8(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 4) = 1;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = 1;
  *(_QWORD *)(a1 + 32) = 0;
}

uint64_t sub_244ED27E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v2 + 24) - 8) + 16))(a2, a1);
}

uint64_t sub_244ED281C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_244ED04A4(a1, a2, v2[5], v2[2], v2[3]) & 1;
}

double sub_244ED284C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double result;
  __int128 v5;
  _OWORD v6[2];
  uint64_t v7;

  sub_244EDAD24(a1, a2, (uint64_t)v6);
  result = *(double *)v6;
  v5 = v6[1];
  *(_OWORD *)a3 = v6[0];
  *(_OWORD *)(a3 + 16) = v5;
  *(_QWORD *)(a3 + 32) = v7;
  return result;
}

double sub_244ED288C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  char v9;
  double result;
  __int128 v11;
  uint64_t v12;
  _OWORD v13[2];
  uint64_t v14;
  _BYTE v15[8];
  _BYTE v16[8];
  uint64_t v17;
  uint64_t v18;

  sub_244EC2684(v2 + 8, (uint64_t)v16, &qword_25742B138);
  v5 = *(_QWORD *)(a1 + 8);
  sub_244EC2684((uint64_t)v16, (uint64_t)v13, &qword_25742B138);
  if (v5)
  {
    sub_244EC2684((uint64_t)v16, (uint64_t)&v17, &qword_25742B138);
    if (v17)
    {
      sub_244EC26C8((uint64_t)v16);
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v18 = *(_QWORD *)&v13[0];
      *(_QWORD *)&v13[0] = 0x8000000000000000;
      sub_244ED6EB4(v5, (uint64_t)sub_244ED9788, 0, isUniquelyReferenced_nonNull_native, &v18, &qword_25742AE80);
      *(_QWORD *)&v13[0] = v18;
      swift_bridgeObjectRelease();
    }
    else
    {
      *(_QWORD *)&v13[0] = v5;
      swift_bridgeObjectRetain();
    }
  }
  else
  {
    sub_244EC26C8((uint64_t)v16);
  }
  v7 = *(_QWORD *)&v13[0];
  sub_244EC2684(v2 + 32, (uint64_t)v15, qword_25742B140);
  v8 = *(_QWORD *)(a1 + 32);
  sub_244EC2684((uint64_t)v15, (uint64_t)v13, qword_25742B140);
  if (v8)
  {
    sub_244EC2684((uint64_t)v15, (uint64_t)&v18, qword_25742B140);
    if (v18)
    {
      sub_244EC26C8((uint64_t)v15);
      swift_bridgeObjectRetain();
      v9 = swift_isUniquelyReferenced_nonNull_native();
      v12 = *(_QWORD *)&v13[0];
      *(_QWORD *)&v13[0] = 0x8000000000000000;
      sub_244ED6EB4(v8, (uint64_t)sub_244ED9788, 0, v9, &v12, &qword_25742AE78);
      *(_QWORD *)&v13[0] = v12;
      swift_bridgeObjectRelease();
    }
    else
    {
      *(_QWORD *)&v13[0] = v8;
      swift_bridgeObjectRetain();
    }
  }
  else
  {
    sub_244EC26C8((uint64_t)v15);
  }
  sub_244EDAD24(v7, *(uint64_t *)&v13[0], (uint64_t)v13);
  result = *(double *)v13;
  v11 = v13[1];
  *(_OWORD *)a2 = v13[0];
  *(_OWORD *)(a2 + 16) = v11;
  *(_QWORD *)(a2 + 32) = v14;
  return result;
}

double sub_244ED2A70@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double result;
  __int128 v12;
  _OWORD v13[2];
  uint64_t v14;

  if (!*(_QWORD *)(v2 + 8))
  {
    v7 = 0;
    if (*(_QWORD *)(v2 + 32))
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  v5 = *(_QWORD *)(a1 + 8);
  swift_bridgeObjectRetain();
  v6 = swift_bridgeObjectRetain();
  v7 = sub_244ED9DF4(v6, v5, &qword_25742AE80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v2 + 32))
    goto LABEL_5;
LABEL_3:
  v8 = *(_QWORD *)(a1 + 32);
  swift_bridgeObjectRetain();
  v9 = swift_bridgeObjectRetain();
  v10 = sub_244ED9DF4(v9, v8, &qword_25742AE78);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_6:
  sub_244EDAD24(v7, v10, (uint64_t)v13);
  result = *(double *)v13;
  v12 = v13[1];
  *(_OWORD *)a2 = v13[0];
  *(_OWORD *)(a2 + 16) = v12;
  *(_QWORD *)(a2 + 32) = v14;
  return result;
}

uint64_t sub_244ED2B70@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;

  v2 = *(_BYTE *)(v1 + 260);
  v3 = *(_BYTE *)(v1 + 280);
  v4 = *(_QWORD *)(v1 + 288);
  *(_DWORD *)a1 = *(_DWORD *)(v1 + 256);
  *(_BYTE *)(a1 + 4) = v2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 264);
  *(_BYTE *)(a1 + 24) = v3;
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

__n128 sub_244ED2BC0(uint64_t a1)
{
  uint64_t v1;
  __n128 result;
  __int128 v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = *(__n128 *)a1;
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v1 + 256) = *(_OWORD *)a1;
  *(_OWORD *)(v1 + 272) = v4;
  *(_QWORD *)(v1 + 288) = *(_QWORD *)(a1 + 32);
  return result;
}

uint64_t (*sub_244ED2BFC())()
{
  return nullsub_1;
}

uint64_t sub_244ED2C0C()
{
  return 0x100000000;
}

void sub_244ED2C44(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 4) = 1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 12) = 1;
  *(_DWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 20) = 1;
  *(_DWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 28) = 1;
  *(_QWORD *)(a1 + 32) = 0;
}

void sub_244ED2C70(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 4) = 1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 12) = 1;
  *(_DWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 20) = 1;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
}

void sub_244ED2C9C(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 4) = 1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 12) = 1;
  *(_DWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 20) = 1;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = 1;
}

void sub_244ED2CC4(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 4) = 1;
  *(_DWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 12) = 1;
  *(_DWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 20) = 1;
  *(_DWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 28) = 1;
  *(_DWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 36) = 1;
  *(_QWORD *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 52) = 1;
  *(_DWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 60) = 1;
  *(_DWORD *)(a1 + 64) = 0;
  *(_BYTE *)(a1 + 68) = 1;
}

__n128 sub_244ED2D10@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  __n128 result;
  __int128 v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;

  v35 = *(_BYTE *)(a6 + 4) & 1;
  v34 = *(_BYTE *)(a6 + 12) & 1;
  v33 = *(_BYTE *)(a6 + 20) & 1;
  v32 = *(_BYTE *)(a6 + 28) & 1;
  v31 = *(_BYTE *)(a7 + 4) & 1;
  v30 = *(_BYTE *)(a7 + 12) & 1;
  v29 = *(_BYTE *)(a7 + 20) & 1;
  v28 = *(_BYTE *)(a7 + 32) & 1;
  v27 = *(_BYTE *)(a11 + 4) & 1;
  v26 = *(_BYTE *)(a11 + 12) & 1;
  v25 = *(_BYTE *)(a11 + 20) & 1;
  v24 = *(_BYTE *)(a11 + 32) & 1;
  v23 = *(_BYTE *)(a12 + 4) & 1;
  v22 = *(_BYTE *)(a12 + 12) & 1;
  v21 = *(_BYTE *)(a12 + 20) & 1;
  v20 = *(_BYTE *)(a12 + 28) & 1;
  v19 = *(_BYTE *)(a12 + 36) & 1;
  v18 = *(_BYTE *)(a12 + 52) & 1;
  v17 = *(_BYTE *)(a12 + 60) & 1;
  v16 = *(_BYTE *)(a12 + 68) & 1;
  v15 = *(_BYTE *)(a10 + 4) & 1;
  v14 = *(_BYTE *)(a10 + 24) & 1;
  *(_DWORD *)a9 = a1;
  *(_BYTE *)(a9 + 4) = BYTE4(a1) & 1;
  *(_DWORD *)(a9 + 8) = *(_DWORD *)a6;
  *(_BYTE *)(a9 + 12) = v35;
  *(_DWORD *)(a9 + 16) = *(_DWORD *)(a6 + 8);
  *(_BYTE *)(a9 + 20) = v34;
  *(_DWORD *)(a9 + 24) = *(_DWORD *)(a6 + 16);
  *(_BYTE *)(a9 + 28) = v33;
  *(_DWORD *)(a9 + 32) = *(_DWORD *)(a6 + 24);
  *(_BYTE *)(a9 + 36) = v32;
  *(_QWORD *)(a9 + 40) = *(_QWORD *)(a6 + 32);
  *(_DWORD *)(a9 + 48) = *(_DWORD *)a7;
  *(_BYTE *)(a9 + 52) = v31;
  *(_DWORD *)(a9 + 56) = *(_DWORD *)(a7 + 8);
  *(_BYTE *)(a9 + 60) = v30;
  *(_DWORD *)(a9 + 64) = *(_DWORD *)(a7 + 16);
  *(_BYTE *)(a9 + 68) = v29;
  *(_QWORD *)(a9 + 72) = *(_QWORD *)(a7 + 24);
  *(_BYTE *)(a9 + 80) = v28;
  result = *(__n128 *)(a7 + 40);
  *(_DWORD *)(a9 + 104) = *(_DWORD *)a11;
  *(_BYTE *)(a9 + 108) = v27;
  *(_DWORD *)(a9 + 112) = *(_DWORD *)(a11 + 8);
  *(_BYTE *)(a9 + 116) = v26;
  *(_DWORD *)(a9 + 120) = *(_DWORD *)(a11 + 16);
  *(_BYTE *)(a9 + 124) = v25;
  *(_QWORD *)(a9 + 128) = *(_QWORD *)(a11 + 24);
  *(_BYTE *)(a9 + 136) = v24;
  *(_DWORD *)(a9 + 144) = *(_DWORD *)a12;
  *(_BYTE *)(a9 + 148) = v23;
  *(_DWORD *)(a9 + 152) = *(_DWORD *)(a12 + 8);
  *(_BYTE *)(a9 + 156) = v22;
  *(_DWORD *)(a9 + 160) = *(_DWORD *)(a12 + 16);
  *(_BYTE *)(a9 + 164) = v21;
  *(_DWORD *)(a9 + 168) = *(_DWORD *)(a12 + 24);
  *(_BYTE *)(a9 + 172) = v20;
  *(_DWORD *)(a9 + 176) = *(_DWORD *)(a12 + 32);
  *(_BYTE *)(a9 + 180) = v19;
  *(_QWORD *)(a9 + 184) = *(_QWORD *)(a12 + 40);
  *(_DWORD *)(a9 + 192) = *(_DWORD *)(a12 + 48);
  *(_BYTE *)(a9 + 196) = v18;
  *(_DWORD *)(a9 + 200) = *(_DWORD *)(a12 + 56);
  *(_BYTE *)(a9 + 204) = v17;
  *(_DWORD *)(a9 + 208) = *(_DWORD *)(a12 + 64);
  *(_BYTE *)(a9 + 212) = v16;
  *(_QWORD *)(a9 + 216) = a8;
  *(_DWORD *)(a9 + 224) = a2;
  *(_BYTE *)(a9 + 228) = BYTE4(a2) & 1;
  *(_DWORD *)(a9 + 232) = a3;
  *(_BYTE *)(a9 + 236) = BYTE4(a3) & 1;
  *(_DWORD *)(a9 + 240) = a4;
  *(_BYTE *)(a9 + 244) = BYTE4(a4) & 1;
  *(_QWORD *)(a9 + 248) = a5;
  *(_DWORD *)(a9 + 256) = *(_DWORD *)a10;
  *(_BYTE *)(a9 + 260) = v15;
  *(_BYTE *)(a9 + 280) = v14;
  v13 = *(_OWORD *)(a10 + 8);
  *(_QWORD *)(a9 + 288) = *(_QWORD *)(a10 + 32);
  *(__n128 *)(a9 + 88) = result;
  *(_OWORD *)(a9 + 264) = v13;
  return result;
}

uint64_t sub_244ED3008@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int *v2;
  int v5;
  int v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  char v28;
  char v29;
  char v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  uint64_t result;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;
  char v51;
  char v52;
  char v53;
  char v54;
  int v55;
  int v56;
  int v57;
  uint64_t v58;
  int v59;
  unint64_t v60;
  int v61;
  uint64_t v62;
  int v63;
  int v64;
  uint64_t v65;
  int v66;
  int v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  _BYTE v81[7];
  __int16 v82;
  char v83;
  __int16 v84;
  char v85;
  __int16 v86;
  char v87;
  __int16 v88;
  char v89;
  __int16 v90;
  char v91;
  char v92;
  __int16 v93;
  char v94;
  char v95;
  __int16 v96;
  char v97;
  char v98;
  __int16 v99;
  char v100;
  char v101;
  __int16 v102;
  char v103;
  char v104;
  __int16 v105;
  char v106;
  char v107;
  __int16 v108;
  char v109;
  char v110;
  __int16 v111;
  char v112;
  char v113;
  _BYTE v114[7];
  __int16 v115;
  char v116;
  __int16 v117;
  char v118;
  __int16 v119;
  char v120;
  _BYTE v121[7];
  __int16 v122;
  char v123;
  __int16 v124;
  char v125;
  __int16 v126;
  char v127;
  __int16 v128;
  char v129;
  __int16 v130;
  char v131;
  __int16 v132;
  char v133;
  __int16 v134;
  char v135;
  __int16 v136;
  char v137;
  int v138;
  char v139;
  int v140;
  char v141;
  int v142;
  char v143;
  int v144;
  char v145;
  uint64_t v146;
  int v147;
  char v148;
  int v149;
  char v150;
  int v151;
  char v152;
  uint64_t v153;
  char v154;
  uint64_t v155;
  uint64_t v156;
  int v157;
  char v158;
  uint64_t v159;
  uint64_t v160;
  char v161;
  uint64_t v162;
  int v163;
  char v164;
  int v165;
  char v166;
  int v167;
  char v168;
  uint64_t v169;
  char v170;
  int v171;
  char v172;
  int v173;
  char v174;
  int v175;
  char v176;
  int v177;
  char v178;
  int v179;
  char v180;
  uint64_t v181;
  int v182;
  char v183;
  int v184;
  char v185;
  int v186;
  char v187;
  _OWORD v188[3];
  _OWORD v189[2];
  __int128 v190;
  __int128 v191;
  __int128 v192;
  _OWORD v193[4];
  uint64_t v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  uint64_t v198;
  _OWORD v199[2];
  uint64_t v200;
  __int128 v201;
  __int128 v202;
  uint64_t v203;

  v5 = *a1;
  if ((v2[1] & 1) == 0)
  {
    v6 = *v2;
    if ((a1[1] & 1) != 0)
      v5 = 0;
    v7 = __OFADD__(v6, v5);
    v5 += v6;
    if (!v7)
      goto LABEL_5;
    __break(1u);
LABEL_9:
    v78 = v5;
    v73 = 1;
    goto LABEL_10;
  }
  if ((a1[1] & 1) != 0)
    goto LABEL_9;
LABEL_5:
  v78 = v5;
  v73 = 0;
LABEL_10:
  v8 = v2[56];
  v9 = v2[58];
  v10 = *((_BYTE *)v2 + 236);
  v11 = v2[60];
  v12 = *((_BYTE *)v2 + 244);
  v13 = *((_QWORD *)v2 + 31);
  v14 = a1[56];
  v15 = *((_BYTE *)a1 + 228);
  v16 = a1[58];
  v17 = *((_BYTE *)a1 + 236);
  v18 = a1[60] | ((unint64_t)*((unsigned __int8 *)a1 + 244) << 32);
  LOBYTE(v190) = *((_BYTE *)v2 + 228);
  LOBYTE(v188[0]) = v10;
  LOBYTE(v171) = v12;
  v60 = sub_244ED21D8(v14 | ((unint64_t)v15 << 32), v16 | ((unint64_t)v17 << 32), v18, *((_QWORD *)a1 + 31), v8 | ((unint64_t)v190 << 32), v9 | ((unint64_t)v10 << 32), v11 | ((unint64_t)v12 << 32), v13);
  v62 = v19;
  v65 = v20;
  v80 = v21;
  v22 = *(_OWORD *)(v2 + 6);
  v201 = *(_OWORD *)(v2 + 2);
  v202 = v22;
  v203 = *((_QWORD *)v2 + 5);
  v23 = *(_OWORD *)(a1 + 6);
  v199[0] = *(_OWORD *)(a1 + 2);
  v199[1] = v23;
  v200 = *((_QWORD *)a1 + 5);
  sub_244ED07EC((uint64_t)v199, (uint64_t)&v138);
  v59 = v138;
  v63 = v140;
  v53 = v141;
  v54 = v139;
  v66 = v142;
  v68 = v144;
  v51 = v145;
  v52 = v143;
  v70 = v146;
  v24 = *((_OWORD *)v2 + 4);
  v195 = *((_OWORD *)v2 + 3);
  v196 = v24;
  v25 = *((_OWORD *)v2 + 5);
  v198 = *((_QWORD *)v2 + 12);
  v197 = v25;
  sub_244ED0DF8(a1 + 12, (uint64_t)&v147);
  v61 = v147;
  v64 = v149;
  v47 = v150;
  v48 = v148;
  v67 = v151;
  v69 = v153;
  v45 = v154;
  v46 = v152;
  v71 = v156;
  v72 = v155;
  v74 = sub_244ED1F48(*((_QWORD *)a1 + 27), *((_QWORD *)v2 + 27));
  v26 = *((_OWORD *)v2 + 17);
  v193[2] = *((_OWORD *)v2 + 16);
  v193[3] = v26;
  v194 = *((_QWORD *)v2 + 36);
  sub_244ED288C((uint64_t)(a1 + 64), (uint64_t)&v157);
  v75 = v157;
  v76 = v160;
  v77 = v159;
  v49 = v161;
  v50 = v158;
  v79 = v162;
  sub_244ED1294(a1 + 26, (uint64_t)&v163);
  v27 = v164;
  v55 = v163;
  v56 = v165;
  v28 = v166;
  v57 = v167;
  v29 = v168;
  v58 = v169;
  v30 = v170;
  v31 = *((_OWORD *)v2 + 12);
  v192 = *((_OWORD *)v2 + 11);
  v193[0] = v31;
  *(_QWORD *)((char *)v193 + 13) = *(_QWORD *)((char *)v2 + 205);
  v32 = *((_OWORD *)v2 + 10);
  v190 = *((_OWORD *)v2 + 9);
  v191 = v32;
  v33 = *((_OWORD *)a1 + 12);
  v188[2] = *((_OWORD *)a1 + 11);
  v189[0] = v33;
  *(_QWORD *)((char *)v189 + 13) = *(_QWORD *)((char *)a1 + 205);
  v34 = *((_OWORD *)a1 + 10);
  v188[0] = *((_OWORD *)a1 + 9);
  v188[1] = v34;
  sub_244ED1694((uint64_t)v188, (uint64_t)&v171);
  v35 = v171;
  v113 = v172;
  v110 = v174;
  v107 = v176;
  v104 = v178;
  v101 = v180;
  v98 = v183;
  v95 = v185;
  v92 = v187;
  v36 = v173;
  v37 = v175;
  v38 = v177;
  *(_DWORD *)a2 = v78;
  *(_BYTE *)(a2 + 4) = v73;
  *(_WORD *)(a2 + 5) = v136;
  *(_BYTE *)(a2 + 7) = v137;
  v39 = v179;
  *(_DWORD *)(a2 + 8) = v59;
  *(_BYTE *)(a2 + 12) = v54;
  *(_BYTE *)(a2 + 15) = v135;
  *(_WORD *)(a2 + 13) = v134;
  v40 = v181;
  *(_DWORD *)(a2 + 16) = v63;
  *(_BYTE *)(a2 + 20) = v53;
  *(_BYTE *)(a2 + 23) = v133;
  *(_WORD *)(a2 + 21) = v132;
  v41 = v182;
  *(_DWORD *)(a2 + 24) = v66;
  *(_BYTE *)(a2 + 28) = v52;
  *(_BYTE *)(a2 + 31) = v131;
  *(_WORD *)(a2 + 29) = v130;
  v42 = v184;
  v43 = v186;
  *(_DWORD *)(a2 + 32) = v68;
  *(_BYTE *)(a2 + 36) = v51;
  *(_BYTE *)(a2 + 39) = v129;
  *(_WORD *)(a2 + 37) = v128;
  *(_QWORD *)(a2 + 40) = v70;
  *(_DWORD *)(a2 + 48) = v61;
  *(_BYTE *)(a2 + 52) = v48;
  *(_BYTE *)(a2 + 55) = v127;
  *(_WORD *)(a2 + 53) = v126;
  *(_DWORD *)(a2 + 56) = v64;
  *(_BYTE *)(a2 + 60) = v47;
  *(_BYTE *)(a2 + 63) = v125;
  *(_WORD *)(a2 + 61) = v124;
  *(_DWORD *)(a2 + 64) = v67;
  *(_BYTE *)(a2 + 68) = v46;
  *(_BYTE *)(a2 + 71) = v123;
  *(_WORD *)(a2 + 69) = v122;
  *(_QWORD *)(a2 + 72) = v69;
  *(_BYTE *)(a2 + 80) = v45;
  *(_DWORD *)(a2 + 84) = *(_DWORD *)&v121[3];
  *(_DWORD *)(a2 + 81) = *(_DWORD *)v121;
  *(_QWORD *)(a2 + 88) = v72;
  *(_QWORD *)(a2 + 96) = v71;
  *(_DWORD *)(a2 + 104) = v55;
  *(_BYTE *)(a2 + 108) = v27;
  *(_BYTE *)(a2 + 111) = v120;
  *(_WORD *)(a2 + 109) = v119;
  *(_DWORD *)(a2 + 112) = v56;
  *(_BYTE *)(a2 + 116) = v28;
  *(_BYTE *)(a2 + 119) = v118;
  *(_WORD *)(a2 + 117) = v117;
  *(_DWORD *)(a2 + 120) = v57;
  *(_BYTE *)(a2 + 124) = v29;
  *(_BYTE *)(a2 + 127) = v116;
  *(_WORD *)(a2 + 125) = v115;
  *(_QWORD *)(a2 + 128) = v58;
  *(_BYTE *)(a2 + 136) = v30;
  result = *(unsigned int *)&v114[3];
  *(_DWORD *)(a2 + 140) = *(_DWORD *)&v114[3];
  *(_DWORD *)(a2 + 144) = v35;
  *(_DWORD *)(a2 + 137) = *(_DWORD *)v114;
  *(_BYTE *)(a2 + 148) = v113;
  *(_BYTE *)(a2 + 151) = v112;
  *(_WORD *)(a2 + 149) = v111;
  *(_DWORD *)(a2 + 152) = v36;
  *(_BYTE *)(a2 + 156) = v110;
  *(_BYTE *)(a2 + 159) = v109;
  *(_WORD *)(a2 + 157) = v108;
  *(_DWORD *)(a2 + 160) = v37;
  *(_BYTE *)(a2 + 164) = v107;
  *(_BYTE *)(a2 + 167) = v106;
  *(_WORD *)(a2 + 165) = v105;
  *(_DWORD *)(a2 + 168) = v38;
  *(_BYTE *)(a2 + 172) = v104;
  *(_BYTE *)(a2 + 175) = v103;
  *(_WORD *)(a2 + 173) = v102;
  *(_DWORD *)(a2 + 176) = v39;
  *(_BYTE *)(a2 + 180) = v101;
  *(_BYTE *)(a2 + 183) = v100;
  *(_WORD *)(a2 + 181) = v99;
  *(_QWORD *)(a2 + 184) = v40;
  *(_DWORD *)(a2 + 192) = v41;
  *(_BYTE *)(a2 + 196) = v98;
  *(_BYTE *)(a2 + 199) = v97;
  *(_WORD *)(a2 + 197) = v96;
  *(_DWORD *)(a2 + 200) = v42;
  *(_BYTE *)(a2 + 204) = v95;
  *(_BYTE *)(a2 + 207) = v94;
  *(_WORD *)(a2 + 205) = v93;
  *(_DWORD *)(a2 + 208) = v43;
  *(_BYTE *)(a2 + 212) = v92;
  *(_BYTE *)(a2 + 215) = v91;
  *(_WORD *)(a2 + 213) = v90;
  *(_QWORD *)(a2 + 216) = v74;
  *(_DWORD *)(a2 + 224) = v60;
  *(_BYTE *)(a2 + 228) = BYTE4(v60) & 1;
  *(_BYTE *)(a2 + 231) = v89;
  *(_WORD *)(a2 + 229) = v88;
  *(_DWORD *)(a2 + 232) = v62;
  *(_BYTE *)(a2 + 236) = BYTE4(v62) & 1;
  *(_BYTE *)(a2 + 239) = v87;
  *(_WORD *)(a2 + 237) = v86;
  *(_DWORD *)(a2 + 240) = v65;
  *(_BYTE *)(a2 + 244) = BYTE4(v65) & 1;
  *(_BYTE *)(a2 + 247) = v85;
  *(_WORD *)(a2 + 245) = v84;
  *(_QWORD *)(a2 + 248) = v80;
  *(_DWORD *)(a2 + 256) = v75;
  *(_BYTE *)(a2 + 260) = v50;
  *(_BYTE *)(a2 + 263) = v83;
  *(_WORD *)(a2 + 261) = v82;
  *(_QWORD *)(a2 + 264) = v77;
  *(_QWORD *)(a2 + 272) = v76;
  *(_BYTE *)(a2 + 280) = v49;
  *(_DWORD *)(a2 + 284) = *(_DWORD *)&v81[3];
  *(_DWORD *)(a2 + 281) = *(_DWORD *)v81;
  *(_QWORD *)(a2 + 288) = v79;
  return result;
}

unint64_t sub_244ED3794@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  int *v2;
  int *v3;
  unint64_t v4;
  int v6;
  int v7;
  char v8;
  BOOL v9;
  __int128 v10;
  __int128 v11;
  int v12;
  char v13;
  int v14;
  char v15;
  int v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  int v22;
  char v23;
  int v24;
  char v25;
  int v26;
  char v27;
  int v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  uint64_t v55;
  int v56;
  int v57;
  int v58;
  char v59;
  int v60;
  int v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  char v69;
  char v70;
  char v71;
  unint64_t v72;
  int v73;
  int v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  char v81;
  char v82;
  int v83;
  char v84;
  int v85;
  int v86;
  int v87;
  uint64_t v88;
  int v89;
  int v90;
  int v91;
  char v92;
  char v93;
  char v94;
  char v95;
  int v96;
  char v97;
  char v98;
  char v99;
  char v100;
  char v101;
  char v102;
  char v103;
  char v104;
  int v105;
  char v106;
  int v107;
  char v108;
  int v109;
  char v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  char v116;
  uint64_t v117;
  uint64_t v118;
  char v119;
  uint64_t v120;
  int v121;
  char v122;
  int v123;
  char v124;
  int v125;
  char v126;
  uint64_t v127;
  char v128;
  int v129;
  char v130;
  int v131;
  char v132;
  int v133;
  char v134;
  int v135;
  char v136;
  int v137;
  char v138;
  uint64_t v139;
  int v140;
  char v141;
  int v142;
  char v143;
  int v144;
  char v145;
  _OWORD v146[3];
  _OWORD v147[2];
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _OWORD v151[2];
  uint64_t v152;
  uint64_t v153;
  __int128 v154;
  __int128 v155;
  uint64_t v156;
  __int128 v157;
  __int128 v158;
  uint64_t v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  uint64_t v164[3];

  v3 = v2;
  v4 = result;
  v6 = *v2;
  v7 = *((unsigned __int8 *)v2 + 4);
  if (((v7 | *(unsigned __int8 *)(result + 4)) & 1) != 0)
  {
    v8 = v7 & 1;
  }
  else
  {
    v9 = __OFSUB__(v6, *(_DWORD *)result);
    v6 -= *(_DWORD *)result;
    if (v9)
    {
      __break(1u);
      goto LABEL_48;
    }
    v8 = 0;
  }
  v10 = *((_OWORD *)v2 + 15);
  v162 = *((_OWORD *)v2 + 14);
  v163 = v10;
  v11 = *(_OWORD *)(result + 240);
  v160 = *(_OWORD *)(result + 224);
  v161 = v11;
  v12 = v162;
  v13 = BYTE4(v162);
  if ((BYTE4(v162) & 1) == 0 && (BYTE4(v160) & 1) == 0)
  {
    v12 = v162 - v160;
    if (!__OFSUB__((_DWORD)v162, (_DWORD)v160))
    {
      v13 = 0;
      goto LABEL_9;
    }
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
LABEL_9:
  v14 = DWORD2(v162);
  v15 = BYTE12(v162);
  if ((BYTE12(v162) & 1) == 0 && (BYTE12(v160) & 1) == 0)
  {
    v14 = DWORD2(v162) - DWORD2(v160);
    if (!__OFSUB__(DWORD2(v162), DWORD2(v160)))
    {
      v15 = 0;
      goto LABEL_13;
    }
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
LABEL_13:
  v16 = v163;
  v17 = BYTE4(v163);
  if ((BYTE4(v163) & 1) == 0 && (BYTE4(v161) & 1) == 0)
  {
    v16 = v163 - v161;
    if (!__OFSUB__((_DWORD)v163, (_DWORD)v161))
    {
      v17 = 0;
      goto LABEL_17;
    }
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
LABEL_17:
  v92 = v17;
  v93 = v15;
  v94 = v8;
  v95 = v13;
  v96 = v16;
  v18 = *((_QWORD *)&v163 + 1);
  if (*((_QWORD *)&v163 + 1))
  {
    v19 = *((_QWORD *)&v161 + 1);
    sub_244EDB58C((uint64_t)&v160);
    sub_244EDB58C((uint64_t)&v162);
    v18 = sub_244EDAB70(v18, v19);
    sub_244EC260C((uint64_t)&v160);
    result = sub_244EC260C((uint64_t)&v162);
  }
  v20 = *(_OWORD *)(v3 + 6);
  v157 = *(_OWORD *)(v3 + 2);
  v158 = v20;
  v159 = *((_QWORD *)v3 + 5);
  v21 = *(_OWORD *)(v4 + 24);
  v154 = *(_OWORD *)(v4 + 8);
  v155 = v21;
  v156 = *(_QWORD *)(v4 + 40);
  v22 = v157;
  v23 = BYTE4(v157);
  if ((BYTE4(v157) & 1) == 0 && (BYTE4(v154) & 1) == 0)
  {
    v22 = v157 - v154;
    if (!__OFSUB__((_DWORD)v157, (_DWORD)v154))
    {
      v23 = 0;
      goto LABEL_23;
    }
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
LABEL_23:
  v24 = DWORD2(v157);
  v25 = BYTE12(v157);
  if ((BYTE12(v157) & 1) == 0 && (BYTE12(v154) & 1) == 0)
  {
    v24 = DWORD2(v157) - DWORD2(v154);
    if (!__OFSUB__(DWORD2(v157), DWORD2(v154)))
    {
      v25 = 0;
      goto LABEL_27;
    }
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
LABEL_27:
  v26 = v158;
  v27 = BYTE4(v158);
  if ((BYTE4(v158) & 1) != 0 || (BYTE4(v155) & 1) != 0)
    goto LABEL_31;
  v26 = v158 - v155;
  if (__OFSUB__((_DWORD)v158, (_DWORD)v155))
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  v27 = 0;
LABEL_31:
  v28 = DWORD2(v158);
  v29 = BYTE12(v158);
  if ((BYTE12(v158) & 1) != 0 || (BYTE12(v155) & 1) != 0)
    goto LABEL_35;
  v28 = DWORD2(v158) - DWORD2(v155);
  if (!__OFSUB__(DWORD2(v158), DWORD2(v155)))
  {
    v29 = 0;
LABEL_35:
    v79 = v29;
    v81 = v27;
    v82 = v25;
    v83 = v28;
    v84 = v23;
    v85 = v26;
    v86 = v24;
    v87 = v22;
    v88 = v18;
    v30 = v159;
    if (v159)
    {
      v31 = v156;
      sub_244ED978C((uint64_t)&v154);
      sub_244ED978C((uint64_t)&v157);
      v80 = sub_244ED9DF4(v30, v31, &qword_25742AEF0);
      sub_244EC2634((uint64_t)&v154);
      sub_244EC2634((uint64_t)&v157);
    }
    else
    {
      v80 = 0;
    }
    v91 = v12;
    sub_244ED108C(v4 + 48, (uint64_t)&v105);
    v73 = v105;
    v74 = v107;
    v70 = v108;
    v71 = v106;
    v75 = v109;
    v68 = v112;
    v69 = v110;
    v78 = v113;
    v76 = v111;
    v77 = v114;
    v152 = *((_QWORD *)v3 + 27);
    v32 = sub_244EDA50C(MEMORY[0x24BEE4AF8]);
    sub_244EC2684((uint64_t)&v152, (uint64_t)&v153, &qword_25742B438);
    sub_244EC2684((uint64_t)&v153, (uint64_t)v164, &qword_25742B438);
    v33 = v164[0];
    v89 = v6;
    if (v164[0])
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)&v148 = sub_244EDA50C(MEMORY[0x24BEE4AF8]);
      MEMORY[0x24BDAC7A8](v148);
      sub_244EDA83C(v33, (uint64_t (*)(_QWORD, _QWORD))sub_244EDCD10);
      v72 = v148;
    }
    else
    {
      v72 = v32;
    }
    v90 = v14;
    v34 = *((_QWORD *)v3 + 36);
    v35 = *(_QWORD *)(v4 + 288);
    if (*((_QWORD *)v3 + 33))
    {
      v36 = *(_QWORD *)(v4 + 264);
      swift_bridgeObjectRetain();
      v37 = swift_bridgeObjectRetain();
      v38 = sub_244ED9DF4(v37, v36, &qword_25742AE80);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v34)
      {
LABEL_43:
        swift_bridgeObjectRetain();
        v39 = swift_bridgeObjectRetain();
        v40 = sub_244ED9DF4(v39, v35, &qword_25742AE78);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_46:
        sub_244EDAD24(v38, v40, (uint64_t)&v115);
        v65 = v115;
        v59 = v116;
        v66 = v118;
        v67 = v117;
        v41 = v119;
        v64 = v120;
        sub_244ED140C(v4 + 104, (uint64_t)&v121);
        v42 = v122;
        v60 = v121;
        v61 = v123;
        v43 = v124;
        v62 = v125;
        v44 = v126;
        v63 = v127;
        v45 = v128;
        v46 = *((_OWORD *)v3 + 12);
        v150 = *((_OWORD *)v3 + 11);
        v151[0] = v46;
        *(_QWORD *)((char *)v151 + 13) = *(_QWORD *)((char *)v3 + 205);
        v47 = *((_OWORD *)v3 + 10);
        v148 = *((_OWORD *)v3 + 9);
        v149 = v47;
        v48 = *(_OWORD *)(v4 + 192);
        v146[2] = *(_OWORD *)(v4 + 176);
        v147[0] = v48;
        *(_QWORD *)((char *)v147 + 13) = *(_QWORD *)(v4 + 205);
        v49 = *(_OWORD *)(v4 + 160);
        v146[0] = *(_OWORD *)(v4 + 144);
        v146[1] = v49;
        result = sub_244ED1A94((unint64_t)v146, (uint64_t)&v129);
        v104 = v130;
        v103 = v132;
        v102 = v134;
        v101 = v136;
        v100 = v138;
        v99 = v141;
        v98 = v143;
        v97 = v145;
        v50 = v129;
        v51 = v131;
        v52 = v133;
        v53 = v135;
        v54 = v137;
        *(_DWORD *)a2 = v89;
        *(_BYTE *)(a2 + 4) = v94;
        v55 = v139;
        *(_DWORD *)(a2 + 8) = v87;
        *(_BYTE *)(a2 + 12) = v84;
        v56 = v140;
        *(_DWORD *)(a2 + 16) = v86;
        *(_BYTE *)(a2 + 20) = v82;
        v57 = v142;
        *(_DWORD *)(a2 + 24) = v85;
        *(_BYTE *)(a2 + 28) = v81;
        v58 = v144;
        *(_DWORD *)(a2 + 32) = v83;
        *(_BYTE *)(a2 + 36) = v79;
        *(_QWORD *)(a2 + 40) = v80;
        *(_DWORD *)(a2 + 48) = v73;
        *(_BYTE *)(a2 + 52) = v71;
        *(_DWORD *)(a2 + 56) = v74;
        *(_BYTE *)(a2 + 60) = v70;
        *(_DWORD *)(a2 + 64) = v75;
        *(_BYTE *)(a2 + 68) = v69;
        *(_QWORD *)(a2 + 72) = v76;
        *(_BYTE *)(a2 + 80) = v68;
        *(_QWORD *)(a2 + 88) = v78;
        *(_QWORD *)(a2 + 96) = v77;
        *(_DWORD *)(a2 + 104) = v60;
        *(_BYTE *)(a2 + 108) = v42;
        *(_DWORD *)(a2 + 112) = v61;
        *(_BYTE *)(a2 + 116) = v43;
        *(_DWORD *)(a2 + 120) = v62;
        *(_BYTE *)(a2 + 124) = v44;
        *(_QWORD *)(a2 + 128) = v63;
        *(_BYTE *)(a2 + 136) = v45;
        *(_DWORD *)(a2 + 144) = v50;
        *(_BYTE *)(a2 + 148) = v104;
        *(_DWORD *)(a2 + 152) = v51;
        *(_BYTE *)(a2 + 156) = v103;
        *(_DWORD *)(a2 + 160) = v52;
        *(_BYTE *)(a2 + 164) = v102;
        *(_DWORD *)(a2 + 168) = v53;
        *(_BYTE *)(a2 + 172) = v101;
        *(_DWORD *)(a2 + 176) = v54;
        *(_BYTE *)(a2 + 180) = v100;
        *(_QWORD *)(a2 + 184) = v55;
        *(_DWORD *)(a2 + 192) = v56;
        *(_BYTE *)(a2 + 196) = v99;
        *(_DWORD *)(a2 + 200) = v57;
        *(_BYTE *)(a2 + 204) = v98;
        *(_DWORD *)(a2 + 208) = v58;
        *(_BYTE *)(a2 + 212) = v97;
        *(_QWORD *)(a2 + 216) = v72;
        *(_DWORD *)(a2 + 224) = v91;
        *(_BYTE *)(a2 + 228) = v95;
        *(_DWORD *)(a2 + 232) = v90;
        *(_BYTE *)(a2 + 236) = v93;
        *(_DWORD *)(a2 + 240) = v96;
        *(_BYTE *)(a2 + 244) = v92;
        *(_QWORD *)(a2 + 248) = v88;
        *(_DWORD *)(a2 + 256) = v65;
        *(_BYTE *)(a2 + 260) = v59;
        *(_QWORD *)(a2 + 264) = v67;
        *(_QWORD *)(a2 + 272) = v66;
        *(_BYTE *)(a2 + 280) = v41;
        *(_QWORD *)(a2 + 288) = v64;
        return result;
      }
    }
    else
    {
      v38 = 0;
      if (v34)
        goto LABEL_43;
    }
    v40 = 0;
    goto LABEL_46;
  }
LABEL_54:
  __break(1u);
  return result;
}

uint64_t sub_244ED3F00()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B858 = result;
  return result;
}

uint64_t *sub_244ED3F24()
{
  if (qword_25742B600 != -1)
    swift_once();
  return &qword_25742B858;
}

uint64_t sub_244ED3F64()
{
  return sub_244ED6590(&qword_25742B600);
}

uint64_t sub_244ED3F80(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B600, &qword_25742B858);
}

uint64_t (*sub_244ED3F9C())()
{
  if (qword_25742B600 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED4008()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B860 = result;
  return result;
}

uint64_t *sub_244ED402C()
{
  if (qword_25742B608 != -1)
    swift_once();
  return &qword_25742B860;
}

uint64_t sub_244ED406C()
{
  return sub_244ED6590(&qword_25742B608);
}

uint64_t sub_244ED4088(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B608, &qword_25742B860);
}

uint64_t (*sub_244ED40A4())()
{
  if (qword_25742B608 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED4110()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B868 = result;
  return result;
}

uint64_t *sub_244ED4134()
{
  if (qword_25742B610 != -1)
    swift_once();
  return &qword_25742B868;
}

uint64_t sub_244ED4174()
{
  return sub_244ED6590(&qword_25742B610);
}

uint64_t sub_244ED4190(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B610, &qword_25742B868);
}

uint64_t (*sub_244ED41AC())()
{
  if (qword_25742B610 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED4218()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B870 = result;
  return result;
}

uint64_t *sub_244ED423C()
{
  if (qword_25742B618 != -1)
    swift_once();
  return &qword_25742B870;
}

uint64_t sub_244ED427C()
{
  return sub_244ED6590(&qword_25742B618);
}

uint64_t sub_244ED4298(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B618, &qword_25742B870);
}

uint64_t (*sub_244ED42B4())()
{
  if (qword_25742B618 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED4320()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B878 = result;
  return result;
}

uint64_t *sub_244ED4344()
{
  if (qword_25742B620 != -1)
    swift_once();
  return &qword_25742B878;
}

uint64_t sub_244ED4384()
{
  return sub_244ED6590(&qword_25742B620);
}

uint64_t sub_244ED43A0(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B620, &qword_25742B878);
}

uint64_t (*sub_244ED43BC())()
{
  if (qword_25742B620 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED4428()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B880 = result;
  return result;
}

uint64_t *sub_244ED444C()
{
  if (qword_25742B628 != -1)
    swift_once();
  return &qword_25742B880;
}

uint64_t sub_244ED448C()
{
  return sub_244ED6590(&qword_25742B628);
}

uint64_t sub_244ED44A8(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B628, &qword_25742B880);
}

uint64_t (*sub_244ED44C4())()
{
  if (qword_25742B628 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED4530()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B888 = result;
  return result;
}

uint64_t *sub_244ED4554()
{
  if (qword_25742B630 != -1)
    swift_once();
  return &qword_25742B888;
}

uint64_t sub_244ED4594()
{
  return sub_244ED6590(&qword_25742B630);
}

uint64_t sub_244ED45B0(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B630, &qword_25742B888);
}

uint64_t (*sub_244ED45CC())()
{
  if (qword_25742B630 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED4638()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B890 = result;
  return result;
}

uint64_t *sub_244ED465C()
{
  if (qword_25742B638 != -1)
    swift_once();
  return &qword_25742B890;
}

uint64_t sub_244ED469C()
{
  return sub_244ED6590(&qword_25742B638);
}

uint64_t sub_244ED46B8(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B638, &qword_25742B890);
}

uint64_t (*sub_244ED46D4())()
{
  if (qword_25742B638 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED4740()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B898 = result;
  return result;
}

uint64_t *sub_244ED4764()
{
  if (qword_25742B640 != -1)
    swift_once();
  return &qword_25742B898;
}

uint64_t sub_244ED47A4()
{
  return sub_244ED6590(&qword_25742B640);
}

uint64_t sub_244ED47C0(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B640, &qword_25742B898);
}

uint64_t (*sub_244ED47DC())()
{
  if (qword_25742B640 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED4848()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B8A0 = result;
  return result;
}

uint64_t *sub_244ED486C()
{
  if (qword_25742B648 != -1)
    swift_once();
  return &qword_25742B8A0;
}

uint64_t sub_244ED48AC()
{
  return sub_244ED6590(&qword_25742B648);
}

uint64_t sub_244ED48C8(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B648, &qword_25742B8A0);
}

uint64_t (*sub_244ED48E4())()
{
  if (qword_25742B648 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED4950()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B8A8 = result;
  return result;
}

uint64_t sub_244ED4974@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int v2;
  char v3;
  int v4;
  int v5;
  int v6;
  BOOL v7;

  if ((*(_BYTE *)(result + 4) & 1) != 0)
  {
    v2 = 0;
    v3 = 1;
LABEL_8:
    *(_DWORD *)a2 = v2;
    *(_BYTE *)(a2 + 4) = v3;
    return result;
  }
  v2 = 0;
  v3 = 1;
  if ((*(_BYTE *)(result + 12) & 1) != 0 || (*(_BYTE *)(result + 20) & 1) != 0)
    goto LABEL_8;
  v4 = *(_DWORD *)(result + 8);
  v5 = *(_DWORD *)result + v4;
  if (__OFADD__(*(_DWORD *)result, v4))
  {
    __break(1u);
  }
  else
  {
    v6 = *(_DWORD *)(result + 16);
    v7 = __OFADD__(v5, v6);
    v2 = v5 + v6;
    if (!v7)
    {
      v3 = 0;
      goto LABEL_8;
    }
  }
  __break(1u);
  return result;
}

uint64_t *sub_244ED49D4()
{
  if (qword_25742B650 != -1)
    swift_once();
  return &qword_25742B8A8;
}

uint64_t sub_244ED4A14()
{
  return sub_244ED6590(&qword_25742B650);
}

uint64_t sub_244ED4A30(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B650, &qword_25742B8A8);
}

uint64_t (*sub_244ED4A4C())()
{
  if (qword_25742B650 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED4AB8()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B8B0 = result;
  return result;
}

uint64_t *sub_244ED4ADC()
{
  if (qword_25742B658 != -1)
    swift_once();
  return &qword_25742B8B0;
}

uint64_t sub_244ED4B1C()
{
  return sub_244ED6590(&qword_25742B658);
}

uint64_t sub_244ED4B38(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B658, &qword_25742B8B0);
}

uint64_t (*sub_244ED4B54())()
{
  if (qword_25742B658 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED4BC0()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B8B8 = result;
  return result;
}

uint64_t *sub_244ED4BE4()
{
  if (qword_25742B660 != -1)
    swift_once();
  return &qword_25742B8B8;
}

uint64_t sub_244ED4C24()
{
  return sub_244ED6590(&qword_25742B660);
}

uint64_t sub_244ED4C40(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B660, &qword_25742B8B8);
}

uint64_t (*sub_244ED4C5C())()
{
  if (qword_25742B660 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED4CC8()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B8C0 = result;
  return result;
}

uint64_t *sub_244ED4CEC()
{
  if (qword_25742B668 != -1)
    swift_once();
  return &qword_25742B8C0;
}

uint64_t sub_244ED4D2C()
{
  return sub_244ED6590(&qword_25742B668);
}

uint64_t sub_244ED4D48(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B668, &qword_25742B8C0);
}

uint64_t (*sub_244ED4D64())()
{
  if (qword_25742B668 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED4DD0()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B8C8 = result;
  return result;
}

uint64_t *sub_244ED4DF4()
{
  if (qword_25742B670 != -1)
    swift_once();
  return &qword_25742B8C8;
}

uint64_t sub_244ED4E34()
{
  return sub_244ED6590(&qword_25742B670);
}

uint64_t sub_244ED4E50(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B670, &qword_25742B8C8);
}

uint64_t (*sub_244ED4E6C())()
{
  if (qword_25742B670 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED4ED8()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B8D0 = result;
  return result;
}

uint64_t *sub_244ED4EFC()
{
  if (qword_25742B678 != -1)
    swift_once();
  return &qword_25742B8D0;
}

uint64_t sub_244ED4F3C()
{
  return sub_244ED6590(&qword_25742B678);
}

uint64_t sub_244ED4F58(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B678, &qword_25742B8D0);
}

uint64_t (*sub_244ED4F74())()
{
  if (qword_25742B678 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED4FE0()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B8D8 = result;
  return result;
}

unint64_t sub_244ED5004@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;

  result = sub_244ED1D8C(*a1);
  *(_DWORD *)a2 = result;
  *(_BYTE *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t *sub_244ED5034()
{
  if (qword_25742B680 != -1)
    swift_once();
  return &qword_25742B8D8;
}

uint64_t sub_244ED5074()
{
  return sub_244ED6590(&qword_25742B680);
}

uint64_t sub_244ED5090(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B680, &qword_25742B8D8);
}

uint64_t (*sub_244ED50AC())()
{
  if (qword_25742B680 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED5118()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B8E0 = result;
  return result;
}

uint64_t *sub_244ED513C()
{
  if (qword_25742B688 != -1)
    swift_once();
  return &qword_25742B8E0;
}

uint64_t sub_244ED517C()
{
  return sub_244ED6590(&qword_25742B688);
}

uint64_t sub_244ED5198(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B688, &qword_25742B8E0);
}

uint64_t (*sub_244ED51B4())()
{
  if (qword_25742B688 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED5220()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B8E8 = result;
  return result;
}

uint64_t *sub_244ED5244@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *result;
  if (!*result)
    goto LABEL_4;
  v3 = *(_QWORD *)(v2 + 16);
  if (v3 >> 31)
  {
    __break(1u);
LABEL_4:
    LODWORD(v3) = 0;
  }
  *(_DWORD *)a2 = v3;
  *(_BYTE *)(a2 + 4) = v2 == 0;
  return result;
}

uint64_t *sub_244ED5274()
{
  if (qword_25742B690 != -1)
    swift_once();
  return &qword_25742B8E8;
}

uint64_t sub_244ED52B4()
{
  return sub_244ED6590(&qword_25742B690);
}

uint64_t sub_244ED52D0(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B690, &qword_25742B8E8);
}

uint64_t (*sub_244ED52EC())()
{
  if (qword_25742B690 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED5358()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B8F0 = result;
  return result;
}

uint64_t *sub_244ED537C()
{
  if (qword_25742B698 != -1)
    swift_once();
  return &qword_25742B8F0;
}

uint64_t sub_244ED53BC()
{
  return sub_244ED6590(&qword_25742B698);
}

uint64_t sub_244ED53D8(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B698, &qword_25742B8F0);
}

uint64_t (*sub_244ED53F4())()
{
  if (qword_25742B698 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED5460()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B8F8 = result;
  return result;
}

uint64_t *sub_244ED5484()
{
  if (qword_25742B6A0 != -1)
    swift_once();
  return &qword_25742B8F8;
}

uint64_t sub_244ED54C4()
{
  return sub_244ED6590(&qword_25742B6A0);
}

uint64_t sub_244ED54E0(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B6A0, &qword_25742B8F8);
}

uint64_t (*sub_244ED54FC())()
{
  if (qword_25742B6A0 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED5568()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B900 = result;
  return result;
}

uint64_t *sub_244ED558C()
{
  if (qword_25742B6A8 != -1)
    swift_once();
  return &qword_25742B900;
}

uint64_t sub_244ED55CC()
{
  return sub_244ED6590(&qword_25742B6A8);
}

uint64_t sub_244ED55E8(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B6A8, &qword_25742B900);
}

uint64_t (*sub_244ED5604())()
{
  if (qword_25742B6A8 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED5670()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B908 = result;
  return result;
}

uint64_t *sub_244ED5694()
{
  if (qword_25742B6B0 != -1)
    swift_once();
  return &qword_25742B908;
}

uint64_t sub_244ED56D4()
{
  return sub_244ED6590(&qword_25742B6B0);
}

uint64_t sub_244ED56F0(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B6B0, &qword_25742B908);
}

uint64_t (*sub_244ED570C())()
{
  if (qword_25742B6B0 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED5778()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B910 = result;
  return result;
}

uint64_t *sub_244ED579C()
{
  if (qword_25742B6B8 != -1)
    swift_once();
  return &qword_25742B910;
}

uint64_t sub_244ED57DC()
{
  return sub_244ED6590(&qword_25742B6B8);
}

uint64_t sub_244ED57F8(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B6B8, &qword_25742B910);
}

uint64_t (*sub_244ED5814())()
{
  if (qword_25742B6B8 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED5880()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B918 = result;
  return result;
}

uint64_t *sub_244ED58A4()
{
  if (qword_25742B6C0 != -1)
    swift_once();
  return &qword_25742B918;
}

uint64_t sub_244ED58E4()
{
  return sub_244ED6590(&qword_25742B6C0);
}

uint64_t sub_244ED5900(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B6C0, &qword_25742B918);
}

uint64_t (*sub_244ED591C())()
{
  if (qword_25742B6C0 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED5988()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B920 = result;
  return result;
}

uint64_t *sub_244ED59AC()
{
  if (qword_25742B6C8 != -1)
    swift_once();
  return &qword_25742B920;
}

uint64_t sub_244ED59EC()
{
  return sub_244ED6590(&qword_25742B6C8);
}

uint64_t sub_244ED5A08(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B6C8, &qword_25742B920);
}

uint64_t (*sub_244ED5A24())()
{
  if (qword_25742B6C8 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED5A90()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B928 = result;
  return result;
}

uint64_t *sub_244ED5AB4()
{
  if (qword_25742B6D0 != -1)
    swift_once();
  return &qword_25742B928;
}

uint64_t sub_244ED5AF4()
{
  return sub_244ED6590(&qword_25742B6D0);
}

uint64_t sub_244ED5B10(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B6D0, &qword_25742B928);
}

uint64_t (*sub_244ED5B2C())()
{
  if (qword_25742B6D0 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED5B98()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B930 = result;
  return result;
}

uint64_t *sub_244ED5BBC()
{
  if (qword_25742B6D8 != -1)
    swift_once();
  return &qword_25742B930;
}

uint64_t sub_244ED5BFC()
{
  return sub_244ED6590(&qword_25742B6D8);
}

uint64_t sub_244ED5C18(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B6D8, &qword_25742B930);
}

uint64_t (*sub_244ED5C34())()
{
  if (qword_25742B6D8 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED5CA0()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B938 = result;
  return result;
}

uint64_t *sub_244ED5CC4()
{
  if (qword_25742B6E0 != -1)
    swift_once();
  return &qword_25742B938;
}

uint64_t sub_244ED5D04()
{
  return sub_244ED6590(&qword_25742B6E0);
}

uint64_t sub_244ED5D20(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B6E0, &qword_25742B938);
}

uint64_t (*sub_244ED5D3C())()
{
  if (qword_25742B6E0 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED5DA8()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B940 = result;
  return result;
}

uint64_t *sub_244ED5DCC()
{
  if (qword_25742B6E8 != -1)
    swift_once();
  return &qword_25742B940;
}

uint64_t sub_244ED5E0C()
{
  return sub_244ED6590(&qword_25742B6E8);
}

uint64_t sub_244ED5E28(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B6E8, &qword_25742B940);
}

uint64_t (*sub_244ED5E44())()
{
  if (qword_25742B6E8 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED5EB0()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B948 = result;
  return result;
}

uint64_t *sub_244ED5ED4()
{
  if (qword_25742B6F0 != -1)
    swift_once();
  return &qword_25742B948;
}

uint64_t sub_244ED5F14()
{
  return sub_244ED6590(&qword_25742B6F0);
}

uint64_t sub_244ED5F30(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B6F0, &qword_25742B948);
}

uint64_t (*sub_244ED5F4C())()
{
  if (qword_25742B6F0 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED5FB8()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B950 = result;
  return result;
}

uint64_t *sub_244ED5FDC()
{
  if (qword_25742B6F8 != -1)
    swift_once();
  return &qword_25742B950;
}

uint64_t sub_244ED601C()
{
  return sub_244ED6590(&qword_25742B6F8);
}

uint64_t sub_244ED6038(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B6F8, &qword_25742B950);
}

uint64_t (*sub_244ED6054())()
{
  if (qword_25742B6F8 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED60C0()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B958 = result;
  return result;
}

uint64_t sub_244ED60E4@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(result + 40);
  if (!v2)
    goto LABEL_4;
  v3 = *(_QWORD *)(v2 + 16);
  if (v3 >> 31)
  {
    __break(1u);
LABEL_4:
    LODWORD(v3) = 0;
  }
  *(_DWORD *)a2 = v3;
  *(_BYTE *)(a2 + 4) = v2 == 0;
  return result;
}

uint64_t *sub_244ED6114()
{
  if (qword_25742B700 != -1)
    swift_once();
  return &qword_25742B958;
}

uint64_t sub_244ED6154()
{
  return sub_244ED6590(&qword_25742B700);
}

uint64_t sub_244ED6170(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B700, &qword_25742B958);
}

uint64_t (*sub_244ED618C())()
{
  if (qword_25742B700 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED61F8()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B960 = result;
  return result;
}

uint64_t *sub_244ED621C()
{
  if (qword_25742B708 != -1)
    swift_once();
  return &qword_25742B960;
}

uint64_t sub_244ED625C()
{
  return sub_244ED6590(&qword_25742B708);
}

uint64_t sub_244ED6278(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B708, &qword_25742B960);
}

uint64_t (*sub_244ED6294())()
{
  if (qword_25742B708 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED6300()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B968 = result;
  return result;
}

uint64_t *sub_244ED6324()
{
  if (qword_25742B710 != -1)
    swift_once();
  return &qword_25742B968;
}

uint64_t sub_244ED6364()
{
  return sub_244ED6590(&qword_25742B710);
}

uint64_t sub_244ED6380(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B710, &qword_25742B968);
}

uint64_t (*sub_244ED639C())()
{
  if (qword_25742B710 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED6408()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B970 = result;
  return result;
}

uint64_t *sub_244ED642C()
{
  if (qword_25742B718 != -1)
    swift_once();
  return &qword_25742B970;
}

uint64_t sub_244ED646C()
{
  return sub_244ED6590(&qword_25742B718);
}

uint64_t sub_244ED6488(uint64_t a1)
{
  return sub_244ED6604(a1, &qword_25742B718, &qword_25742B970);
}

uint64_t (*sub_244ED64A4())()
{
  if (qword_25742B718 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED6510()
{
  uint64_t result;

  result = swift_getKeyPath();
  qword_25742B978 = result;
  return result;
}

uint64_t *sub_244ED6534()
{
  if (qword_25742B720[0] != -1)
    swift_once();
  return &qword_25742B978;
}

uint64_t sub_244ED6574()
{
  return sub_244ED6590(qword_25742B720);
}

uint64_t sub_244ED6590(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_244ED65E8(uint64_t a1)
{
  return sub_244ED6604(a1, qword_25742B720, &qword_25742B978);
}

uint64_t sub_244ED6604(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (*a2 != -1)
    swift_once();
  swift_beginAccess();
  *a3 = a1;
  return swift_release();
}

uint64_t (*sub_244ED6668())()
{
  if (qword_25742B720[0] != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_244ED66D4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  char v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;

  swift_bridgeObjectRetain();
  swift_retain();
  v7 = sub_244ED97B4();
  if (!v8)
  {
LABEL_16:
    swift_release();
    swift_bridgeObjectRelease();
    sub_244EDCCA8();
    return swift_release();
  }
  v9 = v7;
  v10 = v8;
  while (1)
  {
    v17 = *a5;
    v19 = sub_244ED7D74(v9);
    v20 = *(_QWORD *)(v17 + 16);
    v21 = (v18 & 1) == 0;
    v22 = v20 + v21;
    if (__OFADD__(v20, v21))
      break;
    v23 = v18;
    if (*(_QWORD *)(v17 + 24) >= v22)
    {
      if ((a4 & 1) != 0)
      {
        if ((v18 & 1) != 0)
          goto LABEL_3;
      }
      else
      {
        sub_244ED7E00();
        if ((v23 & 1) != 0)
          goto LABEL_3;
      }
    }
    else
    {
      sub_244ED74E4(v22, a4 & 1);
      v24 = sub_244ED7D74(v9);
      if ((v23 & 1) != (v25 & 1))
        goto LABEL_19;
      v19 = v24;
      if ((v23 & 1) != 0)
      {
LABEL_3:
        v11 = *a5;
        v12 = 8 * v19;
        v13 = *(_QWORD *)(*(_QWORD *)(*a5 + 56) + v12);
        v31 = v10;
        sub_244EE1A6C();
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_25742AF20);
        sub_244EDCCB0();
        v31 = Array.appending<A>(contentsOf:)((uint64_t)&v31, v13);
        sub_244EC2594(&qword_25742AF00, MEMORY[0x24BDE71F8]);
        Array<A>.removeDuplicates()();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v14 = *(_QWORD *)(v11 + 56);
        v15 = v31;
        swift_bridgeObjectRelease();
        *(_QWORD *)(v14 + v12) = v15;
        goto LABEL_4;
      }
    }
    v26 = (_QWORD *)*a5;
    *(_QWORD *)(*a5 + 8 * (v19 >> 6) + 64) |= 1 << v19;
    *(_DWORD *)(v26[6] + 4 * v19) = v9;
    *(_QWORD *)(v26[7] + 8 * v19) = v10;
    v27 = v26[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (v28)
      goto LABEL_18;
    v26[2] = v29;
LABEL_4:
    v9 = sub_244ED97B4();
    v10 = v16;
    a4 = 1;
    if (!v16)
      goto LABEL_16;
  }
  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  result = sub_244EE2144();
  __break(1u);
  return result;
}

uint64_t sub_244ED6950(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  _QWORD *v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  _QWORD *v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  char v40;
  char v41;
  _QWORD *v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t result;

  swift_bridgeObjectRetain();
  swift_retain();
  v7 = sub_244ED992C();
  if (!v7)
    goto LABEL_25;
  v9 = v7;
  v10 = v8;
  v11 = (_QWORD *)*a5;
  v13 = sub_244ED7DA8(v7);
  v14 = v11[2];
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v17 = v12;
  if (v11[3] >= v16)
  {
    if ((a4 & 1) != 0)
    {
      v20 = (_QWORD *)*a5;
      if ((v12 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_244ED7FA4();
      v20 = (_QWORD *)*a5;
      if ((v17 & 1) != 0)
        goto LABEL_9;
    }
LABEL_12:
    v20[(v13 >> 6) + 8] |= 1 << v13;
    *(_QWORD *)(v20[6] + 8 * v13) = v9;
    *(_DWORD *)(v20[7] + 4 * v13) = v10;
    v25 = v20[2];
    v23 = __OFADD__(v25, 1);
    v26 = v25 + 1;
    if (v23)
    {
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v20[2] = v26;
LABEL_14:
    v27 = sub_244ED992C();
    if (v27)
    {
      v29 = v27;
      v30 = v28;
      do
      {
        v34 = (_QWORD *)*a5;
        v35 = sub_244ED7DA8(v29);
        v37 = v34[2];
        v38 = (v36 & 1) == 0;
        v23 = __OFADD__(v37, v38);
        v39 = v37 + v38;
        if (v23)
          goto LABEL_26;
        v40 = v36;
        if (v34[3] < v39)
        {
          sub_244ED7794(v39, 1);
          v35 = sub_244ED7DA8(v29);
          if ((v40 & 1) != (v41 & 1))
            goto LABEL_29;
        }
        v42 = (_QWORD *)*a5;
        if ((v40 & 1) != 0)
        {
          v43 = v42[7];
          v44 = *(_DWORD *)(v43 + 4 * v35);
          v23 = __OFADD__(v44, v30);
          v45 = v44 + v30;
          if (v23)
            goto LABEL_28;
          *(_DWORD *)(v43 + 4 * v35) = v45;
        }
        else
        {
          v42[(v35 >> 6) + 8] |= 1 << v35;
          *(_QWORD *)(v42[6] + 8 * v35) = v29;
          *(_DWORD *)(v42[7] + 4 * v35) = v30;
          v31 = v42[2];
          v23 = __OFADD__(v31, 1);
          v32 = v31 + 1;
          if (v23)
            goto LABEL_27;
          v42[2] = v32;
        }
        v29 = sub_244ED992C();
        v30 = v33;
      }
      while (v29);
    }
LABEL_25:
    swift_release();
    swift_bridgeObjectRelease();
    sub_244EDCCA8();
    return swift_release();
  }
  sub_244ED7794(v16, a4 & 1);
  v18 = sub_244ED7DA8(v9);
  if ((v17 & 1) == (v19 & 1))
  {
    v13 = v18;
    v20 = (_QWORD *)*a5;
    if ((v17 & 1) == 0)
      goto LABEL_12;
LABEL_9:
    v21 = v20[7];
    v22 = *(_DWORD *)(v21 + 4 * v13);
    v23 = __OFADD__(v22, v10);
    v24 = v22 + v10;
    if (v23)
    {
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    *(_DWORD *)(v21 + 4 * v13) = v24;
    goto LABEL_14;
  }
LABEL_29:
  result = sub_244EE2144();
  __break(1u);
  return result;
}

uint64_t sub_244ED6BFC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  _QWORD *v20;
  int v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  _QWORD *v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  char v38;
  char v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t result;

  swift_bridgeObjectRetain();
  swift_retain();
  v7 = sub_244ED9A8C();
  if (!v7)
    goto LABEL_23;
  v9 = v7;
  v10 = v8;
  v11 = (_QWORD *)*a5;
  v13 = sub_244EB9538(v7);
  v14 = v11[2];
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v17 = v12;
  if (v11[3] >= v16)
  {
    if ((a4 & 1) != 0)
    {
      v20 = (_QWORD *)*a5;
      if ((v12 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_244ED8134();
      v20 = (_QWORD *)*a5;
      if ((v17 & 1) != 0)
        goto LABEL_9;
    }
LABEL_11:
    v20[(v13 >> 6) + 8] |= 1 << v13;
    *(_QWORD *)(v20[6] + 8 * v13) = v9;
    *(_DWORD *)(v20[7] + 4 * v13) = v10;
    v22 = v20[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v20[2] = v24;
LABEL_13:
    v25 = sub_244ED9A8C();
    if (v25)
    {
      v27 = v25;
      v28 = v26;
      do
      {
        v32 = (_QWORD *)*a5;
        v33 = sub_244EB9538(v27);
        v35 = v32[2];
        v36 = (v34 & 1) == 0;
        v23 = __OFADD__(v35, v36);
        v37 = v35 + v36;
        if (v23)
          goto LABEL_24;
        v38 = v34;
        if (v32[3] < v37)
        {
          sub_244ED7A58(v37, 1);
          v33 = sub_244EB9538(v27);
          if ((v38 & 1) != (v39 & 1))
            goto LABEL_26;
        }
        v40 = (_QWORD *)*a5;
        if ((v38 & 1) != 0)
        {
          v29 = 4 * v33;
          v30 = *(_DWORD *)(v40[7] + 4 * v33);
          swift_release();
          *(_DWORD *)(v40[7] + v29) = v30;
        }
        else
        {
          v40[(v33 >> 6) + 8] |= 1 << v33;
          *(_QWORD *)(v40[6] + 8 * v33) = v27;
          *(_DWORD *)(v40[7] + 4 * v33) = v28;
          v41 = v40[2];
          v23 = __OFADD__(v41, 1);
          v42 = v41 + 1;
          if (v23)
            goto LABEL_25;
          v40[2] = v42;
        }
        v27 = sub_244ED9A8C();
        v28 = v31;
      }
      while (v27);
    }
LABEL_23:
    swift_release();
    swift_bridgeObjectRelease();
    sub_244EDCCA8();
    return swift_release();
  }
  sub_244ED7A58(v16, a4 & 1);
  v18 = sub_244EB9538(v9);
  if ((v17 & 1) == (v19 & 1))
  {
    v13 = v18;
    v20 = (_QWORD *)*a5;
    if ((v17 & 1) == 0)
      goto LABEL_11;
LABEL_9:
    v21 = *(_DWORD *)(v20[7] + 4 * v13);
    swift_release();
    *(_DWORD *)(v20[7] + 4 * v13) = v21;
    goto LABEL_13;
  }
LABEL_26:
  sub_244EE1A6C();
  result = sub_244EE2144();
  __break(1u);
  return result;
}

uint64_t sub_244ED6EB4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5, uint64_t *a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  char v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  char v44;
  char v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t result;

  swift_bridgeObjectRetain();
  swift_retain();
  v9 = sub_244ED9C04();
  if (!v9)
    goto LABEL_23;
  v11 = v9;
  v12 = v10;
  v13 = (_QWORD *)*a5;
  v15 = sub_244EB9538(v9);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v19 = v14;
  if (v13[3] >= v18)
  {
    if ((a4 & 1) != 0)
    {
      v22 = (_QWORD *)*a5;
      if ((v14 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_244ED82D8(a6);
      v22 = (_QWORD *)*a5;
      if ((v19 & 1) != 0)
        goto LABEL_9;
    }
LABEL_11:
    v22[(v15 >> 6) + 8] |= 1 << v15;
    v26 = 8 * v15;
    *(_QWORD *)(v22[6] + v26) = v11;
    *(_QWORD *)(v22[7] + v26) = v12;
    v27 = v22[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (v28)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v22[2] = v29;
LABEL_13:
    v30 = sub_244ED9C04();
    if (v30)
    {
      v32 = v30;
      v33 = v31;
      do
      {
        v38 = (_QWORD *)*a5;
        v39 = sub_244EB9538(v32);
        v41 = v38[2];
        v42 = (v40 & 1) == 0;
        v28 = __OFADD__(v41, v42);
        v43 = v41 + v42;
        if (v28)
          goto LABEL_24;
        v44 = v40;
        if (v38[3] < v43)
        {
          sub_244ED71BC(v43, 1, a6);
          v39 = sub_244EB9538(v32);
          if ((v44 & 1) != (v45 & 1))
            goto LABEL_26;
        }
        v46 = (_QWORD *)*a5;
        if ((v44 & 1) != 0)
        {
          v34 = 8 * v39;
          v35 = *(_QWORD *)(v46[7] + 8 * v39);
          swift_bridgeObjectRetain();
          swift_release();
          swift_bridgeObjectRelease();
          v36 = v46[7];
          swift_bridgeObjectRelease();
          *(_QWORD *)(v36 + v34) = v35;
        }
        else
        {
          v46[(v39 >> 6) + 8] |= 1 << v39;
          v47 = 8 * v39;
          *(_QWORD *)(v46[6] + v47) = v32;
          *(_QWORD *)(v46[7] + v47) = v33;
          v48 = v46[2];
          v28 = __OFADD__(v48, 1);
          v49 = v48 + 1;
          if (v28)
            goto LABEL_25;
          v46[2] = v49;
        }
        v32 = sub_244ED9C04();
        v33 = v37;
      }
      while (v32);
    }
LABEL_23:
    swift_release();
    swift_bridgeObjectRelease();
    sub_244EDCCA8();
    return swift_release();
  }
  sub_244ED71BC(v18, a4 & 1, a6);
  v20 = sub_244EB9538(v11);
  if ((v19 & 1) == (v21 & 1))
  {
    v15 = v20;
    v22 = (_QWORD *)*a5;
    if ((v19 & 1) == 0)
      goto LABEL_11;
LABEL_9:
    v23 = 8 * v15;
    v24 = *(_QWORD *)(v22[7] + v23);
    swift_bridgeObjectRetain();
    swift_release();
    swift_bridgeObjectRelease();
    v25 = v22[7];
    swift_bridgeObjectRelease();
    *(_QWORD *)(v25 + v23) = v24;
    goto LABEL_13;
  }
LABEL_26:
  sub_244EE1A6C();
  result = sub_244EE2144();
  __break(1u);
  return result;
}

uint64_t sub_244ED71BC(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v36 = a2;
  v7 = sub_244EE20B4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v35 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v34 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v34)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v35 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v34)
        goto LABEL_33;
      v24 = *(_QWORD *)(v35 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v35 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v34)
              goto LABEL_33;
            v24 = *(_QWORD *)(v35 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(_QWORD *)(*(_QWORD *)(v6 + 48) + v30);
    v32 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + v30);
    if ((v36 & 1) == 0)
    {
      swift_retain();
      swift_bridgeObjectRetain();
    }
    sub_244EE1A6C();
    sub_244EC2594(&qword_25742AF00, MEMORY[0x24BDE71F8]);
    result = sub_244EE1DC0();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + v19) = v32;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v23 = (_QWORD *)(v6 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v6 + 32);
  if (v33 >= 64)
    bzero(v23, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v33;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_244ED74E4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B450);
  result = sub_244EE20B4();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v29 = -1 << v10;
    v30 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v31 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v18 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v20 >= v31)
          goto LABEL_33;
        v21 = v9[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v31)
            goto LABEL_33;
          v21 = v9[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((a2 & 1) != 0)
              {
                if (v30 >= 64)
                  bzero((void *)(v5 + 64), 8 * v31);
                else
                  *v9 = v29;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v21 = v9[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_41;
                if (v8 >= v31)
                  goto LABEL_33;
                v21 = v9[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v12 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = *(unsigned int *)(*(_QWORD *)(v5 + 48) + 4 * v19);
      v28 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v19);
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain();
      result = MEMORY[0x249529DC0](*(_QWORD *)(v7 + 40), v27, 4);
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v25 = v16 == v24;
          if (v16 == v24)
            v16 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v26 == -1);
        v17 = __clz(__rbit64(~v26)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_DWORD *)(*(_QWORD *)(v7 + 48) + 4 * v17) = v27;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v28;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_244ED7794(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  _QWORD *v31;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B448);
  result = sub_244EE20B4();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v30 = a2;
    v8 = 0;
    v31 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v16 = v15 | (v8 << 6);
      }
      else
      {
        v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v17 >= v12)
          goto LABEL_31;
        v18 = v31[v17];
        ++v8;
        if (!v18)
        {
          v8 = v17 + 1;
          if (v17 + 1 >= v12)
            goto LABEL_31;
          v18 = v31[v8];
          if (!v18)
          {
            v19 = v17 + 2;
            if (v19 >= v12)
            {
LABEL_31:
              if ((v30 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_38;
              }
              v29 = 1 << *(_BYTE *)(v5 + 32);
              if (v29 >= 64)
                bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v31 = -1 << v29;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v18 = v31[v19];
            if (!v18)
            {
              while (1)
              {
                v8 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_40;
                if (v8 >= v12)
                  goto LABEL_31;
                v18 = v31[v8];
                ++v19;
                if (v18)
                  goto LABEL_21;
              }
            }
            v8 = v19;
          }
        }
LABEL_21:
        v11 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      v20 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v16);
      v21 = *(_DWORD *)(*(_QWORD *)(v5 + 56) + 4 * v16);
      sub_244EE2168();
      sub_244EE2174();
      result = sub_244EE2180();
      v22 = -1 << *(_BYTE *)(v7 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v13 + 8 * v24);
        }
        while (v28 == -1);
        v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v14) = v20;
      *(_DWORD *)(*(_QWORD *)(v7 + 56) + 4 * v14) = v21;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

uint64_t sub_244ED7A58(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  _QWORD *v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  char v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AEA8);
  v33 = a2;
  v6 = sub_244EE20B4();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v32 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v31 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v18 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_31;
    }
    v20 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v20 >= v31)
      break;
    v21 = (_QWORD *)(v5 + 64);
    v22 = *(_QWORD *)(v32 + 8 * v20);
    ++v13;
    if (!v22)
    {
      v13 = v20 + 1;
      if (v20 + 1 >= v31)
        goto LABEL_33;
      v22 = *(_QWORD *)(v32 + 8 * v13);
      if (!v22)
      {
        v23 = v20 + 2;
        if (v23 >= v31)
        {
LABEL_33:
          swift_release();
          if ((v33 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v22 = *(_QWORD *)(v32 + 8 * v23);
        if (!v22)
        {
          while (1)
          {
            v13 = v23 + 1;
            if (__OFADD__(v23, 1))
              goto LABEL_42;
            if (v13 >= v31)
              goto LABEL_33;
            v22 = *(_QWORD *)(v32 + 8 * v13);
            ++v23;
            if (v22)
              goto LABEL_30;
          }
        }
        v13 = v23;
      }
    }
LABEL_30:
    v10 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_31:
    v28 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v19);
    v29 = *(_DWORD *)(*(_QWORD *)(v5 + 56) + 4 * v19);
    if ((v33 & 1) == 0)
      swift_retain();
    sub_244EE1A6C();
    sub_244EC2594(&qword_25742AF00, MEMORY[0x24BDE71F8]);
    result = sub_244EE1DC0();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v26 = v16 == v25;
        if (v16 == v25)
          v16 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v27 == -1);
      v17 = __clz(__rbit64(~v27)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v17) = v28;
    *(_DWORD *)(*(_QWORD *)(v7 + 56) + 4 * v17) = v29;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v21 = (_QWORD *)(v5 + 64);
  if ((v33 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v30 = 1 << *(_BYTE *)(v5 + 32);
  if (v30 >= 64)
    bzero(v21, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v21 = -1 << v30;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_244ED7D74(unsigned int a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = MEMORY[0x249529DC0](*(_QWORD *)(v1 + 40), a1, 4);
  return sub_244ED8478(a1, v3);
}

unint64_t sub_244ED7DA8(uint64_t a1)
{
  uint64_t v2;

  sub_244EE2168();
  sub_244EE2174();
  v2 = sub_244EE2180();
  return sub_244ECDBD0(a1, v2);
}

void *sub_244ED7E00()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B450);
  v2 = *v0;
  v3 = sub_244EE20A8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 4 * v15;
    v17 = *(_DWORD *)(*(_QWORD *)(v2 + 48) + 4 * v15);
    v18 = 8 * v15;
    v19 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v18);
    *(_DWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v18) = v19;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_244ED7FA4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B448);
  v2 = *v0;
  v3 = sub_244EE20A8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v23 = __clz(__rbit64(v21));
    v12 = (v21 - 1) & v21;
    v15 = v23 + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 4 * v15;
    v19 = *(_DWORD *)(*(_QWORD *)(v2 + 56) + v18);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_DWORD *)(*(_QWORD *)(v4 + 56) + v18) = v19;
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_244ED8134()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AEA8);
  v2 = *v0;
  v3 = sub_244EE20A8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 4 * v15;
    v19 = *(_DWORD *)(*(_QWORD *)(v2 + 56) + v18);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_DWORD *)(*(_QWORD *)(v4 + 56) + v18) = v19;
    result = (void *)swift_retain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_244ED82D8(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_244EE20A8();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v14)
      goto LABEL_26;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_26;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
        break;
    }
LABEL_25:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = *(_QWORD *)(*(_QWORD *)(v3 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v17) = v18;
    swift_retain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v21 = v19 + 2;
  if (v21 >= v14)
    goto LABEL_26;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_244ED8478(int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_244ED8514(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v5 = a4;
  v6 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v5;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  result = sub_244EE20C0();
  v9 = result;
  v32 = a2;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 64;
  v34 = v5;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v35 = v11;
      v14 = v13 | (v11 << 6);
    }
    else
    {
      v15 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_40;
      if (v15 >= v32)
        return v9;
      v16 = a1[v15];
      v17 = v11 + 1;
      if (!v16)
      {
        v17 = v11 + 2;
        if (v11 + 2 >= v32)
          return v9;
        v16 = a1[v17];
        if (!v16)
        {
          v17 = v11 + 3;
          if (v11 + 3 >= v32)
            return v9;
          v16 = a1[v17];
          if (!v16)
          {
            v18 = v11 + 4;
            if (v11 + 4 >= v32)
              return v9;
            v16 = a1[v18];
            if (!v16)
            {
              while (1)
              {
                v17 = v18 + 1;
                if (__OFADD__(v18, 1))
                  goto LABEL_41;
                if (v17 >= v32)
                  return v9;
                v16 = a1[v17];
                ++v18;
                if (v16)
                  goto LABEL_24;
              }
            }
            v17 = v11 + 4;
          }
        }
      }
LABEL_24:
      v10 = (v16 - 1) & v16;
      v35 = v17;
      v14 = __clz(__rbit64(v16)) + (v17 << 6);
    }
    v19 = 8 * v14;
    v20 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v19);
    v21 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v19);
    sub_244EE1A6C();
    sub_244EC2594(&qword_25742AF00, MEMORY[0x24BDE71F8]);
    swift_retain();
    swift_bridgeObjectRetain();
    result = sub_244EE1DC0();
    v22 = -1 << *(_BYTE *)(v9 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v28 = v24 == v27;
        if (v24 == v27)
          v24 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v24);
      }
      while (v29 == -1);
      v25 = __clz(__rbit64(~v29)) + (v24 << 6);
    }
    *(_QWORD *)(v12 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    v30 = 8 * v25;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + v30) = v20;
    *(_QWORD *)(*(_QWORD *)(v9 + 56) + v30) = v21;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v6--, 1))
      break;
    v5 = v34;
    v11 = v35;
    if (!v6)
      return v9;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_244ED87E8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742AEA8);
  result = sub_244EE20C0();
  v8 = result;
  v29 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 64;
  v31 = v4;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v32 = v10;
      v13 = v12 | (v10 << 6);
    }
    else
    {
      v14 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_40;
      if (v14 >= v29)
        return v8;
      v15 = a1[v14];
      v16 = v10 + 1;
      if (!v15)
      {
        v16 = v10 + 2;
        if (v10 + 2 >= v29)
          return v8;
        v15 = a1[v16];
        if (!v15)
        {
          v16 = v10 + 3;
          if (v10 + 3 >= v29)
            return v8;
          v15 = a1[v16];
          if (!v15)
          {
            v17 = v10 + 4;
            if (v10 + 4 >= v29)
              return v8;
            v15 = a1[v17];
            if (!v15)
            {
              while (1)
              {
                v16 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_41;
                if (v16 >= v29)
                  return v8;
                v15 = a1[v16];
                ++v17;
                if (v15)
                  goto LABEL_24;
              }
            }
            v16 = v10 + 4;
          }
        }
      }
LABEL_24:
      v9 = (v15 - 1) & v15;
      v32 = v16;
      v13 = __clz(__rbit64(v15)) + (v16 << 6);
    }
    v18 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13);
    v19 = *(_DWORD *)(*(_QWORD *)(v4 + 56) + 4 * v13);
    sub_244EE1A6C();
    sub_244EC2594(&qword_25742AF00, MEMORY[0x24BDE71F8]);
    swift_retain();
    result = sub_244EE1DC0();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v23) = v18;
    *(_DWORD *)(*(_QWORD *)(v8 + 56) + 4 * v23) = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    v4 = v31;
    v10 = v32;
    if (!v5)
      return v8;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_244ED8AB0(uint64_t a1, unsigned int a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v4 = v3;
  v8 = *v3;
  v10 = sub_244ED7D74(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_244ED7E00();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_DWORD *)(v16[6] + 4 * v10) = a2;
    *(_QWORD *)(v16[7] + 8 * v10) = a1;
    v19 = v16[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_244ED74E4(result, a3 & 1);
  result = sub_244ED7D74(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_244EE2144();
  __break(1u);
  return result;
}

uint64_t sub_244ED8BE4(int a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v4 = v3;
  v8 = *v3;
  v10 = sub_244ED7DA8(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_244ED7FA4();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      *(_DWORD *)(v16[7] + 4 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_QWORD *)(v16[6] + 8 * v10) = a2;
    *(_DWORD *)(v16[7] + 4 * v10) = a1;
    v18 = v16[2];
    v19 = __OFADD__(v18, 1);
    v20 = v18 + 1;
    if (!v19)
    {
      v16[2] = v20;
      return result;
    }
    goto LABEL_14;
  }
  sub_244ED7794(result, a3 & 1);
  result = sub_244ED7DA8(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_244EE2144();
  __break(1u);
  return result;
}

uint64_t sub_244ED8D0C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_244EE2168();
  swift_bridgeObjectRetain();
  sub_244EE1E20();
  v8 = sub_244EE2180();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_244EE2114() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_244EE2114() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_244ED9194(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_244ED8EB8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B440);
  v3 = sub_244EE1FB8();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_244EE2168();
      sub_244EE1E20();
      result = sub_244EE2180();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_244ED9194(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_244ED8EB8();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_244ED932C();
      goto LABEL_22;
    }
    sub_244ED94DC();
  }
  v11 = *v4;
  sub_244EE2168();
  sub_244EE1E20();
  result = sub_244EE2180();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_244EE2114(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_244EE2138();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_244EE2114();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_244ED932C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B440);
  v2 = *v0;
  v3 = sub_244EE1FAC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_244ED94DC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B440);
  v3 = sub_244EE1FB8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_244EE2168();
    swift_bridgeObjectRetain();
    sub_244EE1E20();
    result = sub_244EE2180();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_244ED978C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_244ED97B4()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  void (*v9)(uint64_t *__return_ptr, int *);
  uint64_t result;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = *(_DWORD *)(*(_QWORD *)(v1 + 48) + 4 * v6);
    v8 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v9 = (void (*)(uint64_t *__return_ptr, int *))v0[5];
    v18 = v7;
    v19 = v8;
    swift_bridgeObjectRetain();
    v9(&v17, &v18);
    swift_bridgeObjectRelease();
    return v17;
  }
  v11 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v12 = (unint64_t)(v0[2] + 64) >> 6;
    if (v11 < v12)
    {
      v13 = v0[1];
      v14 = *(_QWORD *)(v13 + 8 * v11);
      if (v14)
      {
LABEL_7:
        v5 = (v14 - 1) & v14;
        v6 = __clz(__rbit64(v14)) + (v11 << 6);
        v4 = v11;
        goto LABEL_3;
      }
      v15 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v12)
      {
        v14 = *(_QWORD *)(v13 + 8 * v15);
        if (v14)
        {
LABEL_10:
          v11 = v15;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v12)
        {
          v14 = *(_QWORD *)(v13 + 8 * (v3 + 3));
          if (v14)
          {
            v11 = v3 + 3;
            goto LABEL_7;
          }
          v15 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v12)
          {
            v14 = *(_QWORD *)(v13 + 8 * v15);
            if (v14)
              goto LABEL_10;
            v11 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v12)
            {
              v14 = *(_QWORD *)(v13 + 8 * v11);
              if (v14)
                goto LABEL_7;
              v4 = v12 - 1;
              v16 = v3 + 6;
              while (v12 != v16)
              {
                v14 = *(_QWORD *)(v13 + 8 * v16++);
                if (v14)
                {
                  v11 = v16 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_244ED992C()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  void (*v9)(uint64_t *__return_ptr, uint64_t *);
  uint64_t result;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * v6);
    v8 = *(_DWORD *)(*(_QWORD *)(v1 + 56) + 4 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v9 = (void (*)(uint64_t *__return_ptr, uint64_t *))v0[5];
    v18 = v7;
    v19 = v8;
    v9(&v17, &v18);
    return v17;
  }
  v11 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v12 = (unint64_t)(v0[2] + 64) >> 6;
    if (v11 < v12)
    {
      v13 = v0[1];
      v14 = *(_QWORD *)(v13 + 8 * v11);
      if (v14)
      {
LABEL_7:
        v5 = (v14 - 1) & v14;
        v6 = __clz(__rbit64(v14)) + (v11 << 6);
        v4 = v11;
        goto LABEL_3;
      }
      v15 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v12)
      {
        v14 = *(_QWORD *)(v13 + 8 * v15);
        if (v14)
        {
LABEL_10:
          v11 = v15;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v12)
        {
          v14 = *(_QWORD *)(v13 + 8 * (v3 + 3));
          if (v14)
          {
            v11 = v3 + 3;
            goto LABEL_7;
          }
          v15 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v12)
          {
            v14 = *(_QWORD *)(v13 + 8 * v15);
            if (v14)
              goto LABEL_10;
            v11 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v12)
            {
              v14 = *(_QWORD *)(v13 + 8 * v11);
              if (v14)
                goto LABEL_7;
              v4 = v12 - 1;
              v16 = v3 + 6;
              while (v12 != v16)
              {
                v14 = *(_QWORD *)(v13 + 8 * v16++);
                if (v14)
                {
                  v11 = v16 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_244ED9A8C()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  void (*v9)(uint64_t *__return_ptr, uint64_t *);
  uint64_t result;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * v6);
    v8 = *(_DWORD *)(*(_QWORD *)(v1 + 56) + 4 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v9 = (void (*)(uint64_t *__return_ptr, uint64_t *))v0[5];
    v18 = v7;
    v19 = v8;
    swift_retain();
    v9(&v17, &v18);
    swift_release();
    return v17;
  }
  v11 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v12 = (unint64_t)(v0[2] + 64) >> 6;
    if (v11 < v12)
    {
      v13 = v0[1];
      v14 = *(_QWORD *)(v13 + 8 * v11);
      if (v14)
      {
LABEL_7:
        v5 = (v14 - 1) & v14;
        v6 = __clz(__rbit64(v14)) + (v11 << 6);
        v4 = v11;
        goto LABEL_3;
      }
      v15 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v12)
      {
        v14 = *(_QWORD *)(v13 + 8 * v15);
        if (v14)
        {
LABEL_10:
          v11 = v15;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v12)
        {
          v14 = *(_QWORD *)(v13 + 8 * (v3 + 3));
          if (v14)
          {
            v11 = v3 + 3;
            goto LABEL_7;
          }
          v15 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v12)
          {
            v14 = *(_QWORD *)(v13 + 8 * v15);
            if (v14)
              goto LABEL_10;
            v11 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v12)
            {
              v14 = *(_QWORD *)(v13 + 8 * v11);
              if (v14)
                goto LABEL_7;
              v4 = v12 - 1;
              v16 = v3 + 6;
              while (v12 != v16)
              {
                v14 = *(_QWORD *)(v13 + 8 * v16++);
                if (v14)
                {
                  v11 = v16 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_244ED9C04()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t *__return_ptr, _QWORD *);
  uint64_t result;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * v6);
    v8 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v9 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v18[0] = v7;
    v18[1] = v8;
    swift_retain();
    swift_bridgeObjectRetain();
    v9(&v17, v18);
    swift_bridgeObjectRelease();
    swift_release();
    return v17;
  }
  v11 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v12 = (unint64_t)(v0[2] + 64) >> 6;
    if (v11 < v12)
    {
      v13 = v0[1];
      v14 = *(_QWORD *)(v13 + 8 * v11);
      if (v14)
      {
LABEL_7:
        v5 = (v14 - 1) & v14;
        v6 = __clz(__rbit64(v14)) + (v11 << 6);
        v4 = v11;
        goto LABEL_3;
      }
      v15 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v12)
      {
        v14 = *(_QWORD *)(v13 + 8 * v15);
        if (v14)
        {
LABEL_10:
          v11 = v15;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v12)
        {
          v14 = *(_QWORD *)(v13 + 8 * (v3 + 3));
          if (v14)
          {
            v11 = v3 + 3;
            goto LABEL_7;
          }
          v15 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v12)
          {
            v14 = *(_QWORD *)(v13 + 8 * v15);
            if (v14)
              goto LABEL_10;
            v11 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v12)
            {
              v14 = *(_QWORD *)(v13 + 8 * v11);
              if (v14)
                goto LABEL_7;
              v4 = v12 - 1;
              v16 = v3 + 6;
              while (v12 != v16)
              {
                v14 = *(_QWORD *)(v13 + 8 * v16++);
                if (v14)
                {
                  v11 = v16 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_244ED9D88@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *((_QWORD *)a1 + 1);
  *(_DWORD *)a2 = v2;
  *(_QWORD *)(a2 + 8) = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_244ED9D9C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  int v2;

  v2 = *(_DWORD *)(result + 8);
  *(_QWORD *)a2 = *(_QWORD *)result;
  *(_DWORD *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_244ED9DB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2;

  v2 = *(_DWORD *)(a1 + 8);
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_DWORD *)(a2 + 8) = v2;
  return swift_retain();
}

uint64_t sub_244ED9DC8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  swift_retain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_244ED9DF4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  char v7;
  unsigned int v8;
  unint64_t v9;
  size_t v10;
  uint64_t isStackAllocationSafe;
  uint64_t v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v7 = *(_BYTE *)(a1 + 32);
  v8 = v7 & 0x3F;
  v9 = (unint64_t)((1 << v7) + 63) >> 6;
  v10 = 8 * v9;
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v8 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v10);
    swift_bridgeObjectRetain();
    v12 = sub_244EDB388((uint64_t)v15 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v9, a1, a2, a3);
    swift_bridgeObjectRelease();
    if (v3)
      swift_willThrow();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v13 = (void *)swift_slowAlloc();
    bzero(v13, v10);
    swift_bridgeObjectRetain();
    v12 = sub_244EDB388((uint64_t)v13, v9, a1, a2, a3);
    swift_bridgeObjectRelease();
    MEMORY[0x24952A198](v13, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v12;
}

unint64_t sub_244ED9FB4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t result;
  char v7;
  _QWORD *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  char v14;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B450);
  v3 = (_QWORD *)sub_244EE20C0();
  v4 = *(_DWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  result = sub_244ED7D74(v4);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v8 = (_QWORD *)(a1 + 56);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_DWORD *)(v3[6] + 4 * result) = v4;
    *(_QWORD *)(v3[7] + 8 * result) = v5;
    v9 = v3[2];
    v10 = __OFADD__(v9, 1);
    v11 = v9 + 1;
    if (v10)
      break;
    v3[2] = v11;
    if (!--v1)
      goto LABEL_8;
    v12 = v8 + 2;
    v4 = *((_DWORD *)v8 - 2);
    v13 = *v8;
    swift_bridgeObjectRetain();
    result = sub_244ED7D74(v4);
    v8 = v12;
    v5 = v13;
    if ((v14 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_244EDA0B4(unsigned int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  _BYTE v17[8];
  uint64_t v18;

  v5 = *(uint64_t **)(v2 + 24);
  sub_244EC2684(*(_QWORD *)(v2 + 16) + 40, (uint64_t)v17, &qword_25742B428);
  sub_244EC2684((uint64_t)v17, (uint64_t)&v18, &qword_25742B428);
  v6 = v18;
  if (v18 && *(_QWORD *)(v18 + 16) && (v7 = sub_244ED7D74(a1), (v8 & 1) != 0))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v7);
    swift_bridgeObjectRetain();
    v10 = swift_bridgeObjectRetain();
    v11 = sub_244EDA5E8(v10, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      v15 = sub_244EE209C();
      swift_bridgeObjectRelease();
      if (v15 < 1)
        return swift_bridgeObjectRelease();
    }
    else if (*(uint64_t *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10) < 1)
    {
      return swift_bridgeObjectRelease();
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v16 = *v5;
    *v5 = 0x8000000000000000;
    v13 = v11;
  }
  else
  {
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v16 = *v5;
    *v5 = 0x8000000000000000;
    v13 = a2;
  }
  sub_244ED8AB0(v13, a1, isUniquelyReferenced_nonNull_native);
  *v5 = v16;
  return swift_bridgeObjectRelease();
}

uint64_t sub_244EDA228(uint64_t a1, void (*a2)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;

  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    v15 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v15 >= v8)
      return swift_release();
    v16 = *(_QWORD *)(v4 + 8 * v15);
    ++v10;
    if (!v16)
    {
      v10 = v15 + 1;
      if (v15 + 1 >= v8)
        return swift_release();
      v16 = *(_QWORD *)(v4 + 8 * v10);
      if (!v16)
      {
        v10 = v15 + 2;
        if (v15 + 2 >= v8)
          return swift_release();
        v16 = *(_QWORD *)(v4 + 8 * v10);
        if (!v16)
        {
          v10 = v15 + 3;
          if (v15 + 3 >= v8)
            return swift_release();
          v16 = *(_QWORD *)(v4 + 8 * v10);
          if (!v16)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v16 - 1) & v16;
    v12 = __clz(__rbit64(v16)) + (v10 << 6);
LABEL_5:
    v13 = *(unsigned int *)(*(_QWORD *)(a1 + 48) + 4 * v12);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    a2(v13, v14);
    result = swift_bridgeObjectRelease();
  }
  v17 = v15 + 4;
  if (v17 >= v8)
    return swift_release();
  v16 = *(_QWORD *)(v4 + 8 * v17);
  if (v16)
  {
    v10 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v10 >= v8)
      return swift_release();
    v16 = *(_QWORD *)(v4 + 8 * v10);
    ++v17;
    if (v16)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_244EDA3A8(int *a1, uint64_t a2)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;

  v3 = *a1;
  *(_BYTE *)(a2 + 4) = *((_BYTE *)a1 + 4);
  *(_DWORD *)a2 = v3;
  v4 = a1[2];
  *(_BYTE *)(a2 + 12) = *((_BYTE *)a1 + 12);
  *(_DWORD *)(a2 + 8) = v4;
  v5 = a1[4];
  *(_BYTE *)(a2 + 20) = *((_BYTE *)a1 + 20);
  *(_DWORD *)(a2 + 16) = v5;
  v6 = a1[6];
  *(_BYTE *)(a2 + 28) = *((_BYTE *)a1 + 28);
  *(_DWORD *)(a2 + 24) = v6;
  v7 = a1[8];
  *(_BYTE *)(a2 + 36) = *((_BYTE *)a1 + 36);
  *(_DWORD *)(a2 + 32) = v7;
  *(_QWORD *)(a2 + 40) = *((_QWORD *)a1 + 5);
  v8 = a1[12];
  *(_BYTE *)(a2 + 52) = *((_BYTE *)a1 + 52);
  *(_DWORD *)(a2 + 48) = v8;
  v9 = a1[14];
  *(_BYTE *)(a2 + 60) = *((_BYTE *)a1 + 60);
  *(_DWORD *)(a2 + 56) = v9;
  v10 = a1[16];
  *(_BYTE *)(a2 + 68) = *((_BYTE *)a1 + 68);
  *(_DWORD *)(a2 + 64) = v10;
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_244EDA458(int *a1, uint64_t a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;

  v4 = *a1;
  *(_BYTE *)(a2 + 4) = *((_BYTE *)a1 + 4);
  *(_DWORD *)a2 = v4;
  v5 = a1[2];
  *(_BYTE *)(a2 + 12) = *((_BYTE *)a1 + 12);
  *(_DWORD *)(a2 + 8) = v5;
  v6 = a1[4];
  *(_BYTE *)(a2 + 20) = *((_BYTE *)a1 + 20);
  *(_DWORD *)(a2 + 16) = v6;
  v7 = a1[6];
  *(_BYTE *)(a2 + 28) = *((_BYTE *)a1 + 28);
  *(_DWORD *)(a2 + 24) = v7;
  v8 = a1[8];
  *(_BYTE *)(a2 + 36) = *((_BYTE *)a1 + 36);
  *(_DWORD *)(a2 + 32) = v8;
  *(_QWORD *)(a2 + 40) = *((_QWORD *)a1 + 5);
  swift_bridgeObjectRelease();
  v9 = a1[12];
  *(_BYTE *)(a2 + 52) = *((_BYTE *)a1 + 52);
  *(_DWORD *)(a2 + 48) = v9;
  v10 = a1[14];
  *(_BYTE *)(a2 + 60) = *((_BYTE *)a1 + 60);
  *(_DWORD *)(a2 + 56) = v10;
  v11 = a1[16];
  *(_BYTE *)(a2 + 68) = *((_BYTE *)a1 + 68);
  *(_DWORD *)(a2 + 64) = v11;
  return a2;
}

unint64_t sub_244EDA50C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _DWORD *i;
  uint64_t v5;
  int v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742B448);
    v3 = (_QWORD *)sub_244EE20C0();
    for (i = (_DWORD *)(a1 + 40); ; i += 4)
    {
      v5 = *((_QWORD *)i - 1);
      v6 = *i;
      result = sub_244ED7DA8(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_QWORD *)(v3[6] + 8 * result) = v5;
      *(_DWORD *)(v3[7] + 4 * result) = v6;
      v9 = v3[2];
      v10 = __OFADD__(v9, 1);
      v11 = v9 + 1;
      if (v10)
        goto LABEL_10;
      v3[2] = v11;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

unint64_t sub_244EDA5E0(uint64_t a1, int a2)
{
  uint64_t v2;

  return sub_244ED2090(a1, a2, *(_QWORD *)(v2 + 16), *(uint64_t **)(v2 + 24));
}

uint64_t sub_244EDA5E8(unint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v3 = a1;
  v18 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
LABEL_30:
    v4 = sub_244EE209C();
    if (v4)
      goto LABEL_3;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
    {
LABEL_3:
      v14 = v3;
      v5 = 0;
      v15 = v3 & 0xFFFFFFFFFFFFFF8;
      v16 = v3 & 0xC000000000000001;
      while (1)
      {
        if (v16)
        {
          MEMORY[0x249529C58](v5, v14);
          v6 = __OFADD__(v5, 1);
          v7 = v5 + 1;
          if (v6)
            goto LABEL_29;
        }
        else
        {
          if (v5 >= *(_QWORD *)(v15 + 16))
            goto LABEL_28;
          swift_retain();
          v6 = __OFADD__(v5, 1);
          v7 = v5 + 1;
          if (v6)
          {
LABEL_29:
            __break(1u);
            goto LABEL_30;
          }
        }
        v17 = v7;
        if (a2 >> 62)
        {
          swift_bridgeObjectRetain();
          v8 = sub_244EE209C();
          if (v8)
          {
LABEL_11:
            v3 = sub_244EE1A6C();
            v9 = 4;
            do
            {
              v10 = v9 - 4;
              if ((a2 & 0xC000000000000001) != 0)
              {
                MEMORY[0x249529C58](v9 - 4, a2);
                v11 = v9 - 3;
                if (__OFADD__(v10, 1))
                  goto LABEL_27;
              }
              else
              {
                swift_retain();
                v11 = v9 - 3;
                if (__OFADD__(v10, 1))
                {
LABEL_27:
                  __break(1u);
LABEL_28:
                  __break(1u);
                  goto LABEL_29;
                }
              }
              sub_244EC2594(&qword_25742AF10, MEMORY[0x24BDE7200]);
              v12 = sub_244EE1DD8();
              swift_release();
              if ((v12 & 1) != 0)
              {
                swift_release();
                swift_bridgeObjectRelease();
                goto LABEL_5;
              }
              ++v9;
            }
            while (v11 != v8);
          }
        }
        else
        {
          v8 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v8)
            goto LABEL_11;
        }
        swift_bridgeObjectRelease();
        v3 = (uint64_t)&v18;
        sub_244EE2018();
        sub_244EE203C();
        sub_244EE2048();
        sub_244EE2024();
LABEL_5:
        v5 = v17;
        if (v17 == v4)
          return v18;
      }
    }
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_244EDA83C(uint64_t a1, uint64_t (*a2)(_QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;

  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v8)
      return swift_release();
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v10;
    if (!v14)
    {
      v10 = v13 + 1;
      if (v13 + 1 >= v8)
        return swift_release();
      v14 = *(_QWORD *)(v4 + 8 * v10);
      if (!v14)
      {
        v10 = v13 + 2;
        if (v13 + 2 >= v8)
          return swift_release();
        v14 = *(_QWORD *)(v4 + 8 * v10);
        if (!v14)
        {
          v10 = v13 + 3;
          if (v13 + 3 >= v8)
            return swift_release();
          v14 = *(_QWORD *)(v4 + 8 * v10);
          if (!v14)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v10 << 6);
LABEL_5:
    result = a2(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v12), *(unsigned int *)(*(_QWORD *)(a1 + 56) + 4 * v12));
  }
  v15 = v13 + 4;
  if (v15 >= v8)
    return swift_release();
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
    v10 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v10 >= v8)
      return swift_release();
    v14 = *(_QWORD *)(v4 + 8 * v10);
    ++v15;
    if (v14)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_244EDA99C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  unint64_t *v22;
  uint64_t v23;

  v22 = (unint64_t *)result;
  v23 = 0;
  v6 = 0;
  v7 = a3 + 64;
  v8 = 1 << *(_BYTE *)(a3 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(a3 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    while (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v6 << 6);
      if (!a4)
        goto LABEL_4;
LABEL_22:
      if (*(_QWORD *)(a4 + 16))
      {
        v18 = *(_QWORD *)(*(_QWORD *)(a3 + 48) + 8 * v14);
        swift_retain();
        swift_bridgeObjectRetain();
        sub_244EB9538(v18);
        v20 = v19;
        swift_release();
        result = swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          continue;
      }
      goto LABEL_4;
    }
    v15 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v15 >= v11)
      return sub_244ED87E8(v22, a2, v23, a3);
    v16 = *(_QWORD *)(v7 + 8 * v15);
    ++v6;
    if (!v16)
    {
      v6 = v15 + 1;
      if (v15 + 1 >= v11)
        return sub_244ED87E8(v22, a2, v23, a3);
      v16 = *(_QWORD *)(v7 + 8 * v6);
      if (!v16)
      {
        v6 = v15 + 2;
        if (v15 + 2 >= v11)
          return sub_244ED87E8(v22, a2, v23, a3);
        v16 = *(_QWORD *)(v7 + 8 * v6);
        if (!v16)
          break;
      }
    }
LABEL_21:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v6 << 6);
    if (a4)
      goto LABEL_22;
LABEL_4:
    *(unint64_t *)((char *)v22 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    if (__OFADD__(v23++, 1))
      goto LABEL_28;
  }
  v17 = v15 + 3;
  if (v17 >= v11)
    return sub_244ED87E8(v22, a2, v23, a3);
  v16 = *(_QWORD *)(v7 + 8 * v17);
  if (v16)
  {
    v6 = v17;
    goto LABEL_21;
  }
  while (1)
  {
    v6 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v6 >= v11)
      return sub_244ED87E8(v22, a2, v23, a3);
    v16 = *(_QWORD *)(v7 + 8 * v6);
    ++v17;
    if (v16)
      goto LABEL_21;
  }
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_244EDAB70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v5;
  unsigned int v6;
  unint64_t v7;
  size_t v8;
  uint64_t isStackAllocationSafe;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v7 = (unint64_t)((1 << v5) + 63) >> 6;
  v8 = 8 * v7;
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    v10 = sub_244EDA99C((uint64_t)v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v7, a1, a2);
    swift_bridgeObjectRelease();
    if (v2)
      swift_willThrow();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v11 = (void *)swift_slowAlloc();
    bzero(v11, v8);
    swift_bridgeObjectRetain();
    v10 = sub_244EDA99C((uint64_t)v11, v7, a1, a2);
    swift_bridgeObjectRelease();
    MEMORY[0x24952A198](v11, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v10;
}

uint64_t sub_244EDAD24@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  int64_t v34;
  int64_t v35;
  unint64_t v36;
  int64_t v37;
  unint64_t v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  int64_t v46;
  int64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  int64_t v54;
  unint64_t v55;
  int64_t v56;
  BOOL v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int64_t v62;
  uint64_t v63;
  uint64_t v65;
  int64_t v66;
  int64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71[3];

  v3 = a2;
  if (!a2)
  {
LABEL_102:
    v7 = 0;
    v58 = 0;
LABEL_106:
    *(_DWORD *)a3 = v58;
    *(_BYTE *)(a3 + 4) = v3 == 0;
    *(_QWORD *)(a3 + 8) = result;
    *(_QWORD *)(a3 + 16) = v7;
    *(_BYTE *)(a3 + 24) = v3 == 0;
    *(_QWORD *)(a3 + 32) = v3;
    return result;
  }
  v59 = a3;
  v60 = result;
  v71[2] = MEMORY[0x24BEE4B08];
  v61 = a2 + 64;
  v4 = 1 << *(_BYTE *)(a2 + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a2 + 64);
  v62 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  v69 = 0;
  v8 = 0;
LABEL_7:
  v70 = v7;
  if (v6)
  {
    v65 = (v6 - 1) & v6;
    v67 = v8;
    v9 = __clz(__rbit64(v6)) | (v8 << 6);
LABEL_25:
    v14 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v9);
    v15 = v14 + 64;
    v16 = 1 << *(_BYTE *)(v14 + 32);
    if (v16 < 64)
      v17 = ~(-1 << v16);
    else
      v17 = -1;
    v18 = v17 & *(_QWORD *)(v14 + 64);
    v19 = (unint64_t)(v16 + 63) >> 6;
    result = swift_bridgeObjectRetain();
    v20 = 0;
    while (1)
    {
      if (v18)
      {
        v21 = __clz(__rbit64(v18));
        v18 &= v18 - 1;
        v22 = v21 | (v20 << 6);
      }
      else
      {
        v27 = v20 + 1;
        if (__OFADD__(v20, 1))
        {
          __break(1u);
          goto LABEL_104;
        }
        if (v27 >= v19)
          goto LABEL_6;
        v28 = *(_QWORD *)(v15 + 8 * v27);
        ++v20;
        if (!v28)
        {
          v20 = v27 + 1;
          if (v27 + 1 >= v19)
            goto LABEL_6;
          v28 = *(_QWORD *)(v15 + 8 * v20);
          if (!v28)
          {
            v20 = v27 + 2;
            if (v27 + 2 >= v19)
              goto LABEL_6;
            v28 = *(_QWORD *)(v15 + 8 * v20);
            if (!v28)
            {
              v20 = v27 + 3;
              if (v27 + 3 >= v19)
                goto LABEL_6;
              v28 = *(_QWORD *)(v15 + 8 * v20);
              if (!v28)
              {
                v29 = v27 + 4;
                if (v29 >= v19)
                {
LABEL_6:
                  result = swift_release();
                  v7 = v70;
                  v6 = v65;
                  v8 = v67;
                  goto LABEL_7;
                }
                v28 = *(_QWORD *)(v15 + 8 * v29);
                if (!v28)
                {
                  while (1)
                  {
                    v20 = v29 + 1;
                    if (__OFADD__(v29, 1))
                      break;
                    if (v20 >= v19)
                      goto LABEL_6;
                    v28 = *(_QWORD *)(v15 + 8 * v20);
                    ++v29;
                    if (v28)
                      goto LABEL_47;
                  }
LABEL_108:
                  __break(1u);
LABEL_109:
                  __break(1u);
                  goto LABEL_110;
                }
                v20 = v29;
              }
            }
          }
        }
LABEL_47:
        v18 = (v28 - 1) & v28;
        v22 = __clz(__rbit64(v28)) + (v20 << 6);
      }
      v23 = (uint64_t *)(*(_QWORD *)(v14 + 56) + 24 * v22);
      v24 = *v23;
      v25 = v23[1];
      v26 = v23[2];
      swift_bridgeObjectRetain_n();
      v7 = sub_244ED8D0C(v71, v24, v25);
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if ((v7 & 1) != 0)
      {
        if (__OFADD__(v69, 1))
          goto LABEL_109;
        ++v69;
        v30 = __CFADD__(v70, v26);
        v70 += v26;
        if (v30)
        {
          __break(1u);
          goto LABEL_52;
        }
      }
    }
  }
  v10 = v8 + 1;
  if (__OFADD__(v8, 1))
    goto LABEL_111;
  if (v10 < v62)
  {
    v11 = *(_QWORD *)(v61 + 8 * v10);
    v12 = v8 + 1;
    if (v11)
      goto LABEL_24;
    v12 = v8 + 2;
    if (v8 + 2 >= v62)
      goto LABEL_52;
    v11 = *(_QWORD *)(v61 + 8 * v12);
    if (v11)
      goto LABEL_24;
    v12 = v8 + 3;
    if (v8 + 3 >= v62)
      goto LABEL_52;
    v11 = *(_QWORD *)(v61 + 8 * v12);
    if (v11)
      goto LABEL_24;
    v12 = v8 + 4;
    if (v8 + 4 >= v62)
      goto LABEL_52;
    v11 = *(_QWORD *)(v61 + 8 * v12);
    if (v11)
      goto LABEL_24;
    v13 = v8 + 5;
    if (v8 + 5 >= v62)
      goto LABEL_52;
    v11 = *(_QWORD *)(v61 + 8 * v13);
    if (v11)
    {
      v12 = v8 + 5;
LABEL_24:
      v65 = (v11 - 1) & v11;
      v67 = v12;
      v9 = __clz(__rbit64(v11)) + (v12 << 6);
      goto LABEL_25;
    }
    while (1)
    {
      v12 = v13 + 1;
      if (__OFADD__(v13, 1))
        goto LABEL_113;
      if (v12 >= v62)
        break;
      v11 = *(_QWORD *)(v61 + 8 * v12);
      ++v13;
      if (v11)
        goto LABEL_24;
    }
  }
LABEL_52:
  v3 = a2;
  swift_release();
  if (!v60)
  {
LABEL_105:
    swift_bridgeObjectRelease();
    a3 = v59;
    result = v60;
    v58 = v69;
    goto LABEL_106;
  }
  v63 = v60 + 64;
  v31 = 1 << *(_BYTE *)(v60 + 32);
  if (v31 < 64)
    v32 = ~(-1 << v31);
  else
    v32 = -1;
  v33 = v32 & *(_QWORD *)(v60 + 64);
  v66 = (unint64_t)(v31 + 63) >> 6;
  swift_bridgeObjectRetain();
  v34 = 0;
  v3 = 24;
  while (2)
  {
    if (!v33)
    {
      v37 = v34 + 1;
      result = v60;
      v7 = v70;
      if (__OFADD__(v34, 1))
        goto LABEL_112;
      if (v37 < v66)
      {
        v38 = *(_QWORD *)(v63 + 8 * v37);
        v39 = v34 + 1;
        if (v38)
          goto LABEL_75;
        v39 = v34 + 2;
        if (v34 + 2 >= v66)
          goto LABEL_104;
        v38 = *(_QWORD *)(v63 + 8 * v39);
        if (v38)
          goto LABEL_75;
        v39 = v34 + 3;
        if (v34 + 3 >= v66)
          goto LABEL_104;
        v38 = *(_QWORD *)(v63 + 8 * v39);
        if (v38)
          goto LABEL_75;
        v39 = v34 + 4;
        if (v34 + 4 >= v66)
          goto LABEL_104;
        v38 = *(_QWORD *)(v63 + 8 * v39);
        if (v38)
          goto LABEL_75;
        v40 = v34 + 5;
        if (v34 + 5 >= v66)
          goto LABEL_104;
        v38 = *(_QWORD *)(v63 + 8 * v40);
        if (v38)
        {
          v39 = v34 + 5;
LABEL_75:
          v68 = (v38 - 1) & v38;
          v35 = v39;
          v36 = __clz(__rbit64(v38)) + (v39 << 6);
          goto LABEL_76;
        }
        while (1)
        {
          v39 = v40 + 1;
          if (__OFADD__(v40, 1))
            goto LABEL_114;
          if (v39 >= v66)
            break;
          v38 = *(_QWORD *)(v63 + 8 * v39);
          ++v40;
          if (v38)
            goto LABEL_75;
        }
      }
LABEL_104:
      swift_release();
      v3 = a2;
      goto LABEL_105;
    }
    v68 = (v33 - 1) & v33;
    v35 = v34;
    v36 = __clz(__rbit64(v33)) | (v34 << 6);
    result = v60;
LABEL_76:
    v41 = *(_QWORD *)(*(_QWORD *)(result + 56) + 8 * v36);
    v42 = v41 + 64;
    v43 = 1 << *(_BYTE *)(v41 + 32);
    if (v43 < 64)
      v44 = ~(-1 << v43);
    else
      v44 = -1;
    v45 = v44 & *(_QWORD *)(v41 + 64);
    v46 = (unint64_t)(v43 + 63) >> 6;
    result = swift_bridgeObjectRetain();
    v47 = 0;
    while (1)
    {
      if (v45)
      {
        v48 = __clz(__rbit64(v45));
        v45 &= v45 - 1;
        v49 = v48 | (v47 << 6);
        goto LABEL_81;
      }
      v54 = v47 + 1;
      if (__OFADD__(v47, 1))
      {
        __break(1u);
        goto LABEL_108;
      }
      if (v54 >= v46)
        goto LABEL_57;
      v55 = *(_QWORD *)(v42 + 8 * v54);
      ++v47;
      if (!v55)
      {
        v47 = v54 + 1;
        if (v54 + 1 >= v46)
          goto LABEL_57;
        v55 = *(_QWORD *)(v42 + 8 * v47);
        if (!v55)
        {
          v47 = v54 + 2;
          if (v54 + 2 >= v46)
            goto LABEL_57;
          v55 = *(_QWORD *)(v42 + 8 * v47);
          if (!v55)
          {
            v47 = v54 + 3;
            if (v54 + 3 >= v46)
              goto LABEL_57;
            v55 = *(_QWORD *)(v42 + 8 * v47);
            if (!v55)
              break;
          }
        }
      }
LABEL_98:
      v45 = (v55 - 1) & v55;
      v49 = __clz(__rbit64(v55)) + (v47 << 6);
LABEL_81:
      v50 = (uint64_t *)(*(_QWORD *)(v41 + 56) + 24 * v49);
      v51 = *v50;
      v52 = v50[1];
      swift_bridgeObjectRetain();
      v53 = sub_244ED8D0C(v71, v51, v52);
      result = swift_bridgeObjectRelease();
      if ((v53 & 1) != 0)
      {
        v57 = __OFADD__(v69, 1);
        a3 = ++v69;
        if (v57)
        {
          __break(1u);
          goto LABEL_102;
        }
      }
    }
    v56 = v54 + 4;
    if (v56 >= v46)
    {
LABEL_57:
      swift_release();
      v34 = v35;
      v33 = v68;
      continue;
    }
    break;
  }
  v55 = *(_QWORD *)(v42 + 8 * v56);
  if (v55)
  {
    v47 = v56;
    goto LABEL_98;
  }
  while (1)
  {
    v47 = v56 + 1;
    if (__OFADD__(v56, 1))
      break;
    if (v47 >= v46)
      goto LABEL_57;
    v55 = *(_QWORD *)(v42 + 8 * v47);
    ++v56;
    if (v55)
      goto LABEL_98;
  }
LABEL_110:
  __break(1u);
LABEL_111:
  __break(1u);
LABEL_112:
  __break(1u);
LABEL_113:
  __break(1u);
LABEL_114:
  __break(1u);
  return result;
}

uint64_t sub_244EDB388(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  unint64_t *v23;
  uint64_t v24;
  int64_t v25;

  v23 = (unint64_t *)result;
  v7 = 0;
  v8 = a3 + 64;
  v9 = 1 << *(_BYTE *)(a3 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(a3 + 64);
  v25 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    while (v11)
    {
      v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v14 = v13 | (v7 << 6);
      if (!a4)
        goto LABEL_4;
LABEL_22:
      if (*(_QWORD *)(a4 + 16))
      {
        v18 = *(_QWORD *)(*(_QWORD *)(a3 + 48) + 8 * v14);
        swift_retain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_244EB9538(v18);
        v20 = v19;
        swift_release();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          continue;
      }
      goto LABEL_4;
    }
    v15 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v15 >= v25)
      return sub_244ED8514(v23, a2, v24, a3, a5);
    v16 = *(_QWORD *)(v8 + 8 * v15);
    ++v7;
    if (!v16)
    {
      v7 = v15 + 1;
      if (v15 + 1 >= v25)
        return sub_244ED8514(v23, a2, v24, a3, a5);
      v16 = *(_QWORD *)(v8 + 8 * v7);
      if (!v16)
      {
        v7 = v15 + 2;
        if (v15 + 2 >= v25)
          return sub_244ED8514(v23, a2, v24, a3, a5);
        v16 = *(_QWORD *)(v8 + 8 * v7);
        if (!v16)
          break;
      }
    }
LABEL_21:
    v11 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v7 << 6);
    if (a4)
      goto LABEL_22;
LABEL_4:
    *(unint64_t *)((char *)v23 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    if (__OFADD__(v24++, 1))
      goto LABEL_28;
  }
  v17 = v15 + 3;
  if (v17 >= v25)
    return sub_244ED8514(v23, a2, v24, a3, a5);
  v16 = *(_QWORD *)(v8 + 8 * v17);
  if (v16)
  {
    v7 = v17;
    goto LABEL_21;
  }
  while (1)
  {
    v7 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v7 >= v25)
      return sub_244ED8514(v23, a2, v24, a3, a5);
    v16 = *(_QWORD *)(v8 + 8 * v7);
    ++v17;
    if (v16)
      goto LABEL_21;
  }
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_244EDB58C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for Metrics()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Metrics(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  v3 = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v3;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 60) = *(_BYTE *)(a2 + 60);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  v4 = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = v4;
  v5 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v5;
  v6 = *(_OWORD *)(a2 + 104);
  v7 = *(_OWORD *)(a2 + 120);
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = v7;
  *(_OWORD *)(a1 + 104) = v6;
  LODWORD(v4) = *(_DWORD *)(a2 + 144);
  *(_BYTE *)(a1 + 148) = *(_BYTE *)(a2 + 148);
  *(_DWORD *)(a1 + 144) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 152);
  *(_BYTE *)(a1 + 156) = *(_BYTE *)(a2 + 156);
  *(_DWORD *)(a1 + 152) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 160);
  *(_BYTE *)(a1 + 164) = *(_BYTE *)(a2 + 164);
  *(_DWORD *)(a1 + 160) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 168);
  *(_BYTE *)(a1 + 172) = *(_BYTE *)(a2 + 172);
  *(_DWORD *)(a1 + 168) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 176);
  *(_BYTE *)(a1 + 180) = *(_BYTE *)(a2 + 180);
  *(_DWORD *)(a1 + 176) = v4;
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  LODWORD(v4) = *(_DWORD *)(a2 + 192);
  *(_BYTE *)(a1 + 196) = *(_BYTE *)(a2 + 196);
  *(_DWORD *)(a1 + 192) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 200);
  *(_BYTE *)(a1 + 204) = *(_BYTE *)(a2 + 204);
  *(_DWORD *)(a1 + 200) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 208);
  *(_BYTE *)(a1 + 212) = *(_BYTE *)(a2 + 212);
  *(_DWORD *)(a1 + 208) = v4;
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  LODWORD(v4) = *(_DWORD *)(a2 + 224);
  *(_BYTE *)(a1 + 228) = *(_BYTE *)(a2 + 228);
  *(_DWORD *)(a1 + 224) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 232);
  *(_BYTE *)(a1 + 236) = *(_BYTE *)(a2 + 236);
  *(_DWORD *)(a1 + 232) = v4;
  LODWORD(v4) = *(_DWORD *)(a2 + 240);
  *(_BYTE *)(a1 + 244) = *(_BYTE *)(a2 + 244);
  *(_DWORD *)(a1 + 240) = v4;
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  LODWORD(v4) = *(_DWORD *)(a2 + 256);
  *(_BYTE *)(a1 + 260) = *(_BYTE *)(a2 + 260);
  *(_DWORD *)(a1 + 256) = v4;
  v9 = *(_QWORD *)(a2 + 264);
  v8 = *(_QWORD *)(a2 + 272);
  *(_BYTE *)(a1 + 280) = *(_BYTE *)(a2 + 280);
  *(_QWORD *)(a1 + 264) = v9;
  *(_QWORD *)(a1 + 272) = v8;
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Metrics(uint64_t a1, int *a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;

  v4 = *a2;
  *(_BYTE *)(a1 + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)a1 = v4;
  v5 = a2[2];
  *(_BYTE *)(a1 + 12) = *((_BYTE *)a2 + 12);
  *(_DWORD *)(a1 + 8) = v5;
  v6 = a2[4];
  *(_BYTE *)(a1 + 20) = *((_BYTE *)a2 + 20);
  *(_DWORD *)(a1 + 16) = v6;
  v7 = a2[6];
  *(_BYTE *)(a1 + 28) = *((_BYTE *)a2 + 28);
  *(_DWORD *)(a1 + 24) = v7;
  v8 = a2[8];
  *(_BYTE *)(a1 + 36) = *((_BYTE *)a2 + 36);
  *(_DWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = a2[12];
  *(_BYTE *)(a1 + 52) = *((_BYTE *)a2 + 52);
  *(_DWORD *)(a1 + 48) = v9;
  v10 = a2[14];
  *(_BYTE *)(a1 + 60) = *((_BYTE *)a2 + 60);
  *(_DWORD *)(a1 + 56) = v10;
  v11 = a2[16];
  *(_BYTE *)(a1 + 68) = *((_BYTE *)a2 + 68);
  *(_DWORD *)(a1 + 64) = v11;
  v12 = *((_QWORD *)a2 + 9);
  *(_BYTE *)(a1 + 80) = *((_BYTE *)a2 + 80);
  *(_QWORD *)(a1 + 72) = v12;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = a2[26];
  *(_BYTE *)(a1 + 108) = *((_BYTE *)a2 + 108);
  *(_DWORD *)(a1 + 104) = v13;
  v14 = a2[28];
  *(_BYTE *)(a1 + 116) = *((_BYTE *)a2 + 116);
  *(_DWORD *)(a1 + 112) = v14;
  v15 = a2[30];
  *(_BYTE *)(a1 + 124) = *((_BYTE *)a2 + 124);
  *(_DWORD *)(a1 + 120) = v15;
  v16 = *((_QWORD *)a2 + 16);
  *(_BYTE *)(a1 + 136) = *((_BYTE *)a2 + 136);
  *(_QWORD *)(a1 + 128) = v16;
  LODWORD(v16) = a2[36];
  *(_BYTE *)(a1 + 148) = *((_BYTE *)a2 + 148);
  *(_DWORD *)(a1 + 144) = v16;
  LODWORD(v16) = a2[38];
  *(_BYTE *)(a1 + 156) = *((_BYTE *)a2 + 156);
  *(_DWORD *)(a1 + 152) = v16;
  LODWORD(v16) = a2[40];
  *(_BYTE *)(a1 + 164) = *((_BYTE *)a2 + 164);
  *(_DWORD *)(a1 + 160) = v16;
  LODWORD(v16) = a2[42];
  *(_BYTE *)(a1 + 172) = *((_BYTE *)a2 + 172);
  *(_DWORD *)(a1 + 168) = v16;
  LODWORD(v16) = a2[44];
  *(_BYTE *)(a1 + 180) = *((_BYTE *)a2 + 180);
  *(_DWORD *)(a1 + 176) = v16;
  *(_QWORD *)(a1 + 184) = *((_QWORD *)a2 + 23);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = a2[48];
  *(_BYTE *)(a1 + 196) = *((_BYTE *)a2 + 196);
  *(_DWORD *)(a1 + 192) = v17;
  v18 = a2[50];
  *(_BYTE *)(a1 + 204) = *((_BYTE *)a2 + 204);
  *(_DWORD *)(a1 + 200) = v18;
  v19 = a2[52];
  *(_BYTE *)(a1 + 212) = *((_BYTE *)a2 + 212);
  *(_DWORD *)(a1 + 208) = v19;
  *(_QWORD *)(a1 + 216) = *((_QWORD *)a2 + 27);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v20 = a2[56];
  *(_BYTE *)(a1 + 228) = *((_BYTE *)a2 + 228);
  *(_DWORD *)(a1 + 224) = v20;
  v21 = a2[58];
  *(_BYTE *)(a1 + 236) = *((_BYTE *)a2 + 236);
  *(_DWORD *)(a1 + 232) = v21;
  v22 = a2[60];
  *(_BYTE *)(a1 + 244) = *((_BYTE *)a2 + 244);
  *(_DWORD *)(a1 + 240) = v22;
  *(_QWORD *)(a1 + 248) = *((_QWORD *)a2 + 31);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v23 = a2[64];
  *(_BYTE *)(a1 + 260) = *((_BYTE *)a2 + 260);
  *(_DWORD *)(a1 + 256) = v23;
  *(_QWORD *)(a1 + 264) = *((_QWORD *)a2 + 33);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v24 = *((_QWORD *)a2 + 34);
  *(_BYTE *)(a1 + 280) = *((_BYTE *)a2 + 280);
  *(_QWORD *)(a1 + 272) = v24;
  *(_QWORD *)(a1 + 288) = *((_QWORD *)a2 + 36);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy296_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x128uLL);
}

uint64_t assignWithTake for Metrics(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  v4 = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 60) = *(_BYTE *)(a2 + 60);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 104) = *(_DWORD *)(a2 + 104);
  *(_BYTE *)(a1 + 108) = *(_BYTE *)(a2 + 108);
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 116) = *(_BYTE *)(a2 + 116);
  *(_DWORD *)(a1 + 120) = *(_DWORD *)(a2 + 120);
  *(_BYTE *)(a1 + 124) = *(_BYTE *)(a2 + 124);
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  v5 = *(_DWORD *)(a2 + 144);
  *(_BYTE *)(a1 + 148) = *(_BYTE *)(a2 + 148);
  *(_DWORD *)(a1 + 144) = v5;
  *(_BYTE *)(a1 + 156) = *(_BYTE *)(a2 + 156);
  *(_DWORD *)(a1 + 152) = *(_DWORD *)(a2 + 152);
  *(_BYTE *)(a1 + 164) = *(_BYTE *)(a2 + 164);
  *(_DWORD *)(a1 + 160) = *(_DWORD *)(a2 + 160);
  *(_BYTE *)(a1 + 172) = *(_BYTE *)(a2 + 172);
  *(_DWORD *)(a1 + 168) = *(_DWORD *)(a2 + 168);
  *(_BYTE *)(a1 + 180) = *(_BYTE *)(a2 + 180);
  *(_DWORD *)(a1 + 176) = *(_DWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 192) = *(_DWORD *)(a2 + 192);
  *(_BYTE *)(a1 + 196) = *(_BYTE *)(a2 + 196);
  *(_DWORD *)(a1 + 200) = *(_DWORD *)(a2 + 200);
  *(_BYTE *)(a1 + 204) = *(_BYTE *)(a2 + 204);
  *(_DWORD *)(a1 + 208) = *(_DWORD *)(a2 + 208);
  *(_BYTE *)(a1 + 212) = *(_BYTE *)(a2 + 212);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 224) = *(_DWORD *)(a2 + 224);
  *(_BYTE *)(a1 + 228) = *(_BYTE *)(a2 + 228);
  *(_DWORD *)(a1 + 232) = *(_DWORD *)(a2 + 232);
  *(_BYTE *)(a1 + 236) = *(_BYTE *)(a2 + 236);
  *(_DWORD *)(a1 + 240) = *(_DWORD *)(a2 + 240);
  *(_BYTE *)(a1 + 244) = *(_BYTE *)(a2 + 244);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 256) = *(_DWORD *)(a2 + 256);
  *(_BYTE *)(a1 + 260) = *(_BYTE *)(a2 + 260);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_BYTE *)(a1 + 280) = *(_BYTE *)(a2 + 280);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Metrics(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 296))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Metrics(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 296) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 296) = 0;
    if (a2)
      *(_QWORD *)(result + 40) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for Metrics()
{
  return &type metadata for Metrics;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for Metrics.EntityTree(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Metrics.EntityTree(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 5) = v3;
  return result;
}

ValueMetadata *type metadata accessor for Metrics.EntityTree()
{
  return &type metadata for Metrics.EntityTree;
}

uint64_t destroy for Metrics.Animation()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Metrics.Animation(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Metrics.Animation(uint64_t a1, int *a2)
{
  int v3;
  int v4;
  int v5;
  int v6;

  v3 = *a2;
  *(_BYTE *)(a1 + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)a1 = v3;
  v4 = a2[2];
  *(_BYTE *)(a1 + 12) = *((_BYTE *)a2 + 12);
  *(_DWORD *)(a1 + 8) = v4;
  v5 = a2[4];
  *(_BYTE *)(a1 + 20) = *((_BYTE *)a2 + 20);
  *(_DWORD *)(a1 + 16) = v5;
  v6 = a2[6];
  *(_BYTE *)(a1 + 28) = *((_BYTE *)a2 + 28);
  *(_DWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for Metrics.Animation(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Metrics.Animation(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Metrics.Animation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 32) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for Metrics.Animation()
{
  return &type metadata for Metrics.Animation;
}

uint64_t initializeBufferWithCopyOfBuffer for Metrics.Audio(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for Metrics.Audio()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Metrics.Audio(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Metrics.Audio(uint64_t a1, int *a2)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  v4 = *a2;
  *(_BYTE *)(a1 + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)a1 = v4;
  v5 = a2[2];
  *(_BYTE *)(a1 + 12) = *((_BYTE *)a2 + 12);
  *(_DWORD *)(a1 + 8) = v5;
  v6 = a2[4];
  *(_BYTE *)(a1 + 20) = *((_BYTE *)a2 + 20);
  *(_DWORD *)(a1 + 16) = v6;
  v7 = *((_QWORD *)a2 + 3);
  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for Metrics.Audio(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Metrics.Audio(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 56))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Metrics.Audio(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
      *(_QWORD *)(result + 40) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for Metrics.Audio()
{
  return &type metadata for Metrics.Audio;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for Metrics.Geometry(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Metrics.Geometry(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 33) = v3;
  return result;
}

ValueMetadata *type metadata accessor for Metrics.Geometry()
{
  return &type metadata for Metrics.Geometry;
}

uint64_t destroy for Metrics.Lighting()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Metrics.Lighting(uint64_t a1, uint64_t a2)
{
  int v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  v3 = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v3;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 60) = *(_BYTE *)(a2 + 60);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Metrics.Lighting(uint64_t a1, int *a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;

  v4 = *a2;
  *(_BYTE *)(a1 + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)a1 = v4;
  v5 = a2[2];
  *(_BYTE *)(a1 + 12) = *((_BYTE *)a2 + 12);
  *(_DWORD *)(a1 + 8) = v5;
  v6 = a2[4];
  *(_BYTE *)(a1 + 20) = *((_BYTE *)a2 + 20);
  *(_DWORD *)(a1 + 16) = v6;
  v7 = a2[6];
  *(_BYTE *)(a1 + 28) = *((_BYTE *)a2 + 28);
  *(_DWORD *)(a1 + 24) = v7;
  v8 = a2[8];
  *(_BYTE *)(a1 + 36) = *((_BYTE *)a2 + 36);
  *(_DWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = a2[12];
  *(_BYTE *)(a1 + 52) = *((_BYTE *)a2 + 52);
  *(_DWORD *)(a1 + 48) = v9;
  v10 = a2[14];
  *(_BYTE *)(a1 + 60) = *((_BYTE *)a2 + 60);
  *(_DWORD *)(a1 + 56) = v10;
  v11 = a2[16];
  *(_BYTE *)(a1 + 68) = *((_BYTE *)a2 + 68);
  *(_DWORD *)(a1 + 64) = v11;
  return a1;
}

__n128 __swift_memcpy69_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 61) = *(_QWORD *)(a2 + 61);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for Metrics.Lighting(uint64_t a1, uint64_t a2)
{
  int v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  v4 = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 52);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 60) = *(_BYTE *)(a2 + 60);
  *(_DWORD *)(a1 + 64) = *(_DWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 68) = *(_BYTE *)(a2 + 68);
  return a1;
}

uint64_t getEnumTagSinglePayload for Metrics.Lighting(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 69))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Metrics.Lighting(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 68) = 0;
    *(_DWORD *)(result + 64) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 69) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 69) = 0;
    if (a2)
      *(_QWORD *)(result + 40) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for Metrics.Lighting()
{
  return &type metadata for Metrics.Lighting;
}

_QWORD *initializeBufferWithCopyOfBuffer for Metrics.Material(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for Metrics.Material()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for Metrics.Material(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for Metrics.Material(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Metrics.Material(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Metrics.Material(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for Metrics.Material()
{
  return &type metadata for Metrics.Material;
}

uint64_t destroy for Metrics.Physics()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Metrics.Physics(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Metrics.Physics(uint64_t a1, int *a2)
{
  int v3;
  int v4;
  int v5;

  v3 = *a2;
  *(_BYTE *)(a1 + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)a1 = v3;
  v4 = a2[2];
  *(_BYTE *)(a1 + 12) = *((_BYTE *)a2 + 12);
  *(_DWORD *)(a1 + 8) = v4;
  v5 = a2[4];
  *(_BYTE *)(a1 + 20) = *((_BYTE *)a2 + 20);
  *(_DWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for Metrics.Physics(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 12) = *(_BYTE *)(a2 + 12);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Metrics.Physics(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Metrics.Physics(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for Metrics.Physics()
{
  return &type metadata for Metrics.Physics;
}

uint64_t destroy for Metrics.Texture()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Metrics.Texture(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Metrics.Texture(uint64_t a1, int *a2)
{
  int v4;
  uint64_t v5;

  v4 = *a2;
  *(_BYTE *)(a1 + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = *((_QWORD *)a2 + 2);
  *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for Metrics.Texture(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Metrics.Texture(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Metrics.Texture(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for Metrics.Texture()
{
  return &type metadata for Metrics.Texture;
}

ValueMetadata *type metadata accessor for Metrics.KeyPaths()
{
  return &type metadata for Metrics.KeyPaths;
}

uint64_t sub_244EDCCA8()
{
  return swift_release();
}

unint64_t sub_244EDCCB0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25742B458;
  if (!qword_25742B458)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25742AF20);
    result = MEMORY[0x24952A0F0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25742B458);
  }
  return result;
}

uint64_t sub_244EDCD1C(uint64_t a1, const void *a2)
{
  _BYTE v4[296];
  _BYTE v5[296];
  _BYTE v6[296];
  _BYTE __dst[296];

  sub_244ED579C();
  swift_beginAccess();
  memcpy(__dst, a2, sizeof(__dst));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_244EBEE3C((uint64_t)a2);
  sub_244ED58A4();
  swift_beginAccess();
  memcpy(v6, a2, sizeof(v6));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_244EBBA84((uint64_t)a2);
  sub_244EBEE3C((uint64_t)a2);
  sub_244ED59AC();
  swift_beginAccess();
  memcpy(v5, a2, sizeof(v5));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_244EBBA84((uint64_t)a2);
  sub_244ED5AB4();
  swift_beginAccess();
  memcpy(v4, a2, sizeof(v4));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_244EBBA84((uint64_t)a2);
  sub_244EE1B68();
  return swift_release();
}

uint64_t sub_244EDCF14(uint64_t a1, const void *a2)
{
  _BYTE v4[296];
  _BYTE v5[296];
  _BYTE v6[296];
  _BYTE v7[296];
  _BYTE v8[296];
  _BYTE v9[296];
  _BYTE v10[296];
  _BYTE __dst[296];

  sub_244EDD328(a2);
  sub_244EBEE3C((uint64_t)a2);
  sub_244ED5BBC();
  swift_beginAccess();
  memcpy(__dst, a2, sizeof(__dst));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_244EBBA84((uint64_t)a2);
  sub_244EBEE3C((uint64_t)a2);
  sub_244ED5CC4();
  swift_beginAccess();
  memcpy(v10, a2, sizeof(v10));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_244EBBA84((uint64_t)a2);
  sub_244EBEE3C((uint64_t)a2);
  sub_244ED5DCC();
  swift_beginAccess();
  memcpy(v9, a2, sizeof(v9));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_244EBBA84((uint64_t)a2);
  sub_244EBEE3C((uint64_t)a2);
  sub_244ED5ED4();
  swift_beginAccess();
  memcpy(v8, a2, sizeof(v8));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_244EBBA84((uint64_t)a2);
  sub_244EBEE3C((uint64_t)a2);
  sub_244ED5FDC();
  swift_beginAccess();
  memcpy(v7, a2, sizeof(v7));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_244EBBA84((uint64_t)a2);
  sub_244EBEE3C((uint64_t)a2);
  sub_244ED6324();
  swift_beginAccess();
  memcpy(v6, a2, sizeof(v6));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_244EBBA84((uint64_t)a2);
  sub_244EBEE3C((uint64_t)a2);
  sub_244ED642C();
  swift_beginAccess();
  memcpy(v5, a2, sizeof(v5));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_244EBBA84((uint64_t)a2);
  sub_244ED6534();
  swift_beginAccess();
  memcpy(v4, a2, sizeof(v4));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_244EBBA84((uint64_t)a2);
  sub_244EE1B80();
  return swift_release();
}

uint64_t sub_244EDD328(const void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t result;
  uint64_t v13;
  unint64_t v14;
  unint64_t i;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  unsigned int v27;
  uint64_t v28;
  char isUniquelyReferenced_nonNull_native;
  char v30;
  unint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int64_t v46;
  uint64_t v47;
  unint64_t v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  int64_t v52;
  uint64_t v53;
  _QWORD v54[37];

  v2 = sub_244EE1D18();
  v50 = *(_QWORD *)(v2 - 8);
  v51 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_244EBEE3C((uint64_t)a1);
  sub_244ED621C();
  swift_beginAccess();
  memcpy(v54, a1, sizeof(v54));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_244EBBA84((uint64_t)a1);
  v5 = v53;
  if (!v53)
    return 0;
  v6 = 0;
  v7 = v53 + 64;
  v8 = 1 << *(_BYTE *)(v53 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(v53 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v46 = v11;
  v47 = MEMORY[0x24BEE4B00];
  v44 = v53 + 64;
  v45 = v53;
  if (v10)
    goto LABEL_9;
LABEL_12:
  v18 = v6 + 1;
  if (!__OFADD__(v6, 1))
  {
    if (v18 < v11)
    {
      v19 = *(_QWORD *)(v7 + 8 * v18);
      ++v6;
      if (v19)
        goto LABEL_25;
      v6 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_49;
      v19 = *(_QWORD *)(v7 + 8 * v6);
      if (v19)
        goto LABEL_25;
      v6 = v18 + 2;
      if (v18 + 2 >= v11)
        goto LABEL_49;
      v19 = *(_QWORD *)(v7 + 8 * v6);
      if (v19)
      {
LABEL_25:
        v10 = (v19 - 1) & v19;
        for (i = __clz(__rbit64(v19)) + (v6 << 6); ; i = v14 | (v6 << 6))
        {
          v52 = v6;
          v21 = *(_QWORD *)(v5 + 56);
          v49 = *(_DWORD *)(*(_QWORD *)(v5 + 48) + 4 * i);
          v22 = *(_QWORD *)(v21 + 8 * i);
          if (v22 >> 62)
          {
            swift_bridgeObjectRetain_n();
            v13 = sub_244EE209C();
            swift_bridgeObjectRelease();
            if (!v13)
              goto LABEL_8;
            swift_bridgeObjectRetain();
            v16 = sub_244EE209C();
            swift_bridgeObjectRelease();
            if (!v16)
            {
              swift_bridgeObjectRelease();
              v17 = MEMORY[0x24BEE4AF8];
              goto LABEL_37;
            }
          }
          else
          {
            v16 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            if (!v16)
            {
LABEL_8:
              swift_bridgeObjectRelease();
              v6 = v52;
              if (!v10)
                goto LABEL_12;
              goto LABEL_9;
            }
          }
          v54[0] = MEMORY[0x24BEE4AF8];
          sub_244EE0700(0, v16 & ~(v16 >> 63), 0);
          if (v16 < 0)
            goto LABEL_52;
          v23 = 0;
          v17 = v54[0];
          v48 = v22 & 0xC000000000000001;
          do
          {
            if (v48)
              MEMORY[0x249529C58](v23, v22);
            else
              swift_retain();
            sub_244EE1A24();
            sub_244EE1D0C();
            swift_release();
            v54[0] = v17;
            v24 = v4;
            v26 = *(_QWORD *)(v17 + 16);
            v25 = *(_QWORD *)(v17 + 24);
            if (v26 >= v25 >> 1)
            {
              sub_244EE0700(v25 > 1, v26 + 1, 1);
              v17 = v54[0];
            }
            ++v23;
            *(_QWORD *)(v17 + 16) = v26 + 1;
            (*(void (**)(unint64_t, char *, uint64_t))(v50 + 32))(v17+ ((*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80))+ *(_QWORD *)(v50 + 72) * v26, v24, v51);
            v4 = v24;
          }
          while (v16 != v23);
          swift_bridgeObjectRelease();
LABEL_37:
          v27 = v49;
          v28 = v47;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v54[0] = v28;
          v31 = sub_244ED7D74(v27);
          v32 = *(_QWORD *)(v28 + 16);
          v33 = (v30 & 1) == 0;
          v34 = v32 + v33;
          if (__OFADD__(v32, v33))
            goto LABEL_53;
          v35 = v30;
          if (*(_QWORD *)(v28 + 24) >= v34)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              sub_244EDFD10();
          }
          else
          {
            sub_244EDE808(v34, isUniquelyReferenced_nonNull_native);
            v36 = sub_244ED7D74(v27);
            if ((v35 & 1) != (v37 & 1))
              goto LABEL_55;
            v31 = v36;
          }
          v11 = v46;
          v38 = (_QWORD *)v54[0];
          v47 = v54[0];
          if ((v35 & 1) != 0)
          {
            v39 = *(_QWORD *)(v54[0] + 56);
            swift_bridgeObjectRelease();
            *(_QWORD *)(v39 + 8 * v31) = v17;
          }
          else
          {
            *(_QWORD *)(v54[0] + 8 * (v31 >> 6) + 64) |= 1 << v31;
            *(_DWORD *)(v38[6] + 4 * v31) = v27;
            *(_QWORD *)(v38[7] + 8 * v31) = v17;
            v40 = v38[2];
            v41 = __OFADD__(v40, 1);
            v42 = v40 + 1;
            if (v41)
              goto LABEL_54;
            v38[2] = v42;
          }
          swift_bridgeObjectRelease();
          v7 = v44;
          v5 = v45;
          v6 = v52;
          if (!v10)
            goto LABEL_12;
LABEL_9:
          v14 = __clz(__rbit64(v10));
          v10 &= v10 - 1;
        }
      }
      v20 = v18 + 3;
      if (v20 < v11)
      {
        v19 = *(_QWORD *)(v7 + 8 * v20);
        if (v19)
        {
          v6 = v20;
          goto LABEL_25;
        }
        while (1)
        {
          v6 = v20 + 1;
          if (__OFADD__(v20, 1))
            goto LABEL_51;
          if (v6 >= v11)
            break;
          v19 = *(_QWORD *)(v7 + 8 * v6);
          ++v20;
          if (v19)
            goto LABEL_25;
        }
      }
    }
LABEL_49:
    swift_release();
    return v47;
  }
  __break(1u);
LABEL_51:
  __break(1u);
LABEL_52:
  __break(1u);
LABEL_53:
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  result = sub_244EE2144();
  __break(1u);
  return result;
}

uint64_t sub_244EDD7D4(uint64_t a1, const void *a2)
{
  _BYTE __dst[296];

  sub_244EDD898(a2);
  sub_244ED5034();
  swift_beginAccess();
  memcpy(__dst, a2, sizeof(__dst));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_244EBBA84((uint64_t)a2);
  sub_244EE1B98();
  return swift_release();
}

uint64_t sub_244EDD898(const void *a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  int v14;
  char isUniquelyReferenced_nonNull_native;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t result;
  int64_t v28;
  uint64_t v29;
  _QWORD __dst[37];

  sub_244EBEE3C((uint64_t)a1);
  sub_244ED513C();
  swift_beginAccess();
  memcpy(__dst, a1, sizeof(__dst));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_244EBBA84((uint64_t)a1);
  if (!v29)
    return 0;
  v2 = 0;
  v3 = v29 + 64;
  v4 = 1 << *(_BYTE *)(v29 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(v29 + 64);
  v28 = (unint64_t)(v4 + 63) >> 6;
  v7 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v9 = v8 | (v2 << 6);
    }
    else
    {
      v10 = v2 + 1;
      if (__OFADD__(v2, 1))
        goto LABEL_39;
      if (v10 >= v28)
      {
LABEL_34:
        swift_release();
        return (uint64_t)v7;
      }
      v11 = *(_QWORD *)(v3 + 8 * v10);
      ++v2;
      if (!v11)
      {
        v2 = v10 + 1;
        if (v10 + 1 >= v28)
          goto LABEL_34;
        v11 = *(_QWORD *)(v3 + 8 * v2);
        if (!v11)
        {
          v2 = v10 + 2;
          if (v10 + 2 >= v28)
            goto LABEL_34;
          v11 = *(_QWORD *)(v3 + 8 * v2);
          if (!v11)
          {
            v12 = v10 + 3;
            if (v12 >= v28)
              goto LABEL_34;
            v11 = *(_QWORD *)(v3 + 8 * v12);
            if (!v11)
            {
              while (1)
              {
                v2 = v12 + 1;
                if (__OFADD__(v12, 1))
                  goto LABEL_40;
                if (v2 >= v28)
                  goto LABEL_34;
                v11 = *(_QWORD *)(v3 + 8 * v2);
                ++v12;
                if (v11)
                  goto LABEL_22;
              }
            }
            v2 = v12;
          }
        }
      }
LABEL_22:
      v6 = (v11 - 1) & v11;
      v9 = __clz(__rbit64(v11)) + (v2 << 6);
    }
    v13 = *(_QWORD *)(*(_QWORD *)(v29 + 48) + 8 * v9);
    v14 = *(_DWORD *)(*(_QWORD *)(v29 + 56) + 4 * v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    __dst[0] = v7;
    v17 = sub_244EDE76C(v13);
    v18 = v7[2];
    v19 = (v16 & 1) == 0;
    v20 = v18 + v19;
    if (__OFADD__(v18, v19))
      break;
    v21 = v16;
    if (v7[3] >= v20)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v7 = (_QWORD *)__dst[0];
        if ((v16 & 1) != 0)
          goto LABEL_5;
      }
      else
      {
        sub_244EDFEB4();
        v7 = (_QWORD *)__dst[0];
        if ((v21 & 1) != 0)
          goto LABEL_5;
      }
    }
    else
    {
      sub_244EDEAB8(v20, isUniquelyReferenced_nonNull_native);
      v22 = sub_244EDE76C(v13);
      if ((v21 & 1) != (v23 & 1))
        goto LABEL_41;
      v17 = v22;
      v7 = (_QWORD *)__dst[0];
      if ((v21 & 1) != 0)
      {
LABEL_5:
        *(_DWORD *)(v7[7] + 4 * v17) = v14;
        goto LABEL_6;
      }
    }
    v7[(v17 >> 6) + 8] |= 1 << v17;
    *(_QWORD *)(v7[6] + 8 * v17) = v13;
    *(_DWORD *)(v7[7] + 4 * v17) = v14;
    v24 = v7[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
      goto LABEL_38;
    v7[2] = v26;
LABEL_6:
    swift_bridgeObjectRelease();
  }
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  result = sub_244EE2144();
  __break(1u);
  return result;
}

uint64_t sub_244EDDB68(uint64_t a1, const void *a2)
{
  uint64_t v3;
  uint64_t v5[37];
  uint64_t v6;
  _BYTE __dst[296];

  sub_244EBEE3C((uint64_t)a2);
  sub_244ED5694();
  swift_beginAccess();
  memcpy(__dst, a2, sizeof(__dst));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_244EBBA84((uint64_t)a2);
  if (v5[0])
  {
    sub_244EBEE3C((uint64_t)a2);
    sub_244ED5484();
    swift_beginAccess();
    memcpy(__dst, a2, sizeof(__dst));
    swift_retain();
    swift_getAtKeyPath();
    swift_release();
    sub_244EBBA84((uint64_t)a2);
    v3 = MEMORY[0x24BEE4B00];
    v6 = MEMORY[0x24BEE4B00];
    swift_bridgeObjectRetain();
    sub_244EE0CEC(v3, v5[0], v5[0], &v6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    sub_244EBEE3C((uint64_t)a2);
    sub_244ED537C();
    swift_beginAccess();
    memcpy(__dst, a2, sizeof(__dst));
    swift_retain();
    swift_getAtKeyPath();
    swift_release();
    sub_244EBBA84((uint64_t)a2);
    sub_244ED558C();
    swift_beginAccess();
    memcpy(v5, a2, sizeof(v5));
    swift_retain();
    swift_getAtKeyPath();
    swift_release();
    sub_244EBBA84((uint64_t)a2);
    swift_bridgeObjectRetain();
    sub_244EE1B50();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_244EBBA84((uint64_t)a2);
    __dst[0] = 0;
    sub_244EE1B50();
  }
  return swift_release();
}

uint64_t sub_244EDDE08(_QWORD *a1, uint64_t *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int64_t v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  char *v38;
  void (*v39)(char *, char *, uint64_t);
  _QWORD *v40;
  int v41;
  _QWORD *v42;
  char v43;
  unint64_t v44;
  uint64_t v45;
  _BOOL8 v46;
  uint64_t v47;
  char v48;
  unint64_t v49;
  char v50;
  _QWORD *v51;
  uint64_t *v52;
  uint64_t v53;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  int64_t v65;
  uint64_t v66;
  _QWORD *v67;
  char *v68;
  uint64_t v69;
  int64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;

  v63 = a1;
  v7 = sub_244EE1B44();
  v72 = *(_QWORD *)(v7 - 8);
  v73 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v71 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v68 = (char *)&v59 - v10;
  v11 = sub_244EE1D18();
  result = MEMORY[0x24BDAC7A8](v11);
  v69 = a2[1];
  if (!*(_QWORD *)(v69 + 16) || !*(_QWORD *)(a3 + 16))
    return result;
  v60 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = v14;
  v62 = result;
  v15 = *a2;
  v16 = swift_retain();
  v17 = sub_244EB9538(v16);
  if ((v18 & 1) == 0)
    return swift_release();
  v19 = *(_QWORD *)(*(_QWORD *)(a3 + 56) + 8 * v17);
  swift_bridgeObjectRetain();
  v59 = v15;
  swift_release();
  v20 = *(_QWORD *)(v69 + 64);
  v64 = v69 + 64;
  v21 = 1 << *(_BYTE *)(v69 + 32);
  v22 = -1;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  v23 = v22 & v20;
  v65 = (unint64_t)(v21 + 63) >> 6;
  swift_bridgeObjectRetain();
  v24 = 0;
  v25 = (char *)MEMORY[0x24BEE4AF8];
  v66 = v19;
  v67 = a4;
  while (1)
  {
    if (v23)
    {
      v26 = __clz(__rbit64(v23));
      v23 &= v23 - 1;
      v70 = v24;
      v27 = v26 | (v24 << 6);
    }
    else
    {
      v28 = v24 + 1;
      if (__OFADD__(v24, 1))
        goto LABEL_47;
      if (v28 >= v65)
      {
LABEL_43:
        swift_bridgeObjectRelease();
        swift_release();
        swift_retain();
        sub_244EE1A24();
        v56 = (uint64_t)v60;
        sub_244EE1D0C();
        swift_release();
        v57 = v63;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v74 = (_QWORD *)*v57;
        *v57 = 0x8000000000000000;
        sub_244EDF7E4((uint64_t)v25, v56, isUniquelyReferenced_nonNull_native);
        *v57 = v74;
        swift_bridgeObjectRelease();
        return (*(uint64_t (**)(uint64_t, uint64_t))(v61 + 8))(v56, v62);
      }
      v29 = *(_QWORD *)(v64 + 8 * v28);
      v30 = v24 + 1;
      if (!v29)
      {
        v30 = v24 + 2;
        if (v24 + 2 >= v65)
          goto LABEL_43;
        v29 = *(_QWORD *)(v64 + 8 * v30);
        if (!v29)
        {
          v30 = v24 + 3;
          if (v24 + 3 >= v65)
            goto LABEL_43;
          v29 = *(_QWORD *)(v64 + 8 * v30);
          if (!v29)
          {
            v31 = v24 + 4;
            if (v24 + 4 >= v65)
              goto LABEL_43;
            v29 = *(_QWORD *)(v64 + 8 * v31);
            if (!v29)
            {
              while (1)
              {
                v30 = v31 + 1;
                if (__OFADD__(v31, 1))
                  goto LABEL_48;
                if (v30 >= v65)
                  goto LABEL_43;
                v29 = *(_QWORD *)(v64 + 8 * v30);
                ++v31;
                if (v29)
                  goto LABEL_24;
              }
            }
            v30 = v24 + 4;
          }
        }
      }
LABEL_24:
      v23 = (v29 - 1) & v29;
      v70 = v30;
      v27 = __clz(__rbit64(v29)) + (v30 << 6);
    }
    v32 = (uint64_t *)(*(_QWORD *)(v69 + 48) + 16 * v27);
    v33 = *v32;
    v34 = v32[1];
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v25 = sub_244EE09E8(0, *((_QWORD *)v25 + 2) + 1, 1, v25);
    v36 = *((_QWORD *)v25 + 2);
    v35 = *((_QWORD *)v25 + 3);
    if (v36 >= v35 >> 1)
      v25 = sub_244EE09E8((char *)(v35 > 1), v36 + 1, 1, v25);
    *((_QWORD *)v25 + 2) = v36 + 1;
    v37 = &v25[16 * v36];
    *((_QWORD *)v37 + 4) = v33;
    *((_QWORD *)v37 + 5) = v34;
    if (*(_QWORD *)(v19 + 16))
    {
      swift_bridgeObjectRetain();
      sub_244EB95C8(v33, v34);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRetain();
    v38 = v68;
    sub_244EE1B38();
    swift_bridgeObjectRelease();
    v39 = *(void (**)(char *, char *, uint64_t))(v72 + 32);
    v39(v71, v38, v73);
    v40 = v67;
    v41 = swift_isUniquelyReferenced_nonNull_native();
    v74 = (_QWORD *)*v40;
    v42 = v74;
    *v40 = 0x8000000000000000;
    v44 = sub_244EB95C8(v33, v34);
    v45 = v42[2];
    v46 = (v43 & 1) == 0;
    v47 = v45 + v46;
    if (__OFADD__(v45, v46))
      break;
    v48 = v43;
    if (v42[3] >= v47)
    {
      if ((v41 & 1) != 0)
      {
        v51 = v74;
        if ((v43 & 1) != 0)
          goto LABEL_7;
      }
      else
      {
        sub_244EE0044();
        v51 = v74;
        if ((v48 & 1) != 0)
          goto LABEL_7;
      }
    }
    else
    {
      sub_244EDED54(v47, v41);
      v49 = sub_244EB95C8(v33, v34);
      if ((v48 & 1) != (v50 & 1))
        goto LABEL_49;
      v44 = v49;
      v51 = v74;
      if ((v48 & 1) != 0)
      {
LABEL_7:
        (*(void (**)(unint64_t, char *, uint64_t))(v72 + 40))(v51[7] + *(_QWORD *)(v72 + 72) * v44, v71, v73);
        goto LABEL_8;
      }
    }
    v51[(v44 >> 6) + 8] |= 1 << v44;
    v52 = (uint64_t *)(v51[6] + 16 * v44);
    *v52 = v33;
    v52[1] = v34;
    v39((char *)(v51[7] + *(_QWORD *)(v72 + 72) * v44), v71, v73);
    v53 = v51[2];
    v54 = __OFADD__(v53, 1);
    v55 = v53 + 1;
    if (v54)
      goto LABEL_46;
    v51[2] = v55;
    swift_bridgeObjectRetain();
LABEL_8:
    *v40 = v74;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v19 = v66;
    v24 = v70;
  }
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  result = sub_244EE2144();
  __break(1u);
  return result;
}

uint64_t sub_244EDE3A4(uint64_t a1, _BYTE *a2)
{
  uint64_t v2;

  v2 = sub_244EE0EE8(a1, a2);
  swift_release();
  return v2;
}

uint64_t sub_244EDE3D4(unint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  int v9;
  BOOL v10;
  int v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _BYTE v24[296];
  _QWORD v25[37];

  type metadata accessor for MetricsData();
  v2 = swift_bridgeObjectRetain();
  v3 = sub_244EC073C(v2);
  swift_retain();
  v4 = sub_244EE0AE8(a1, v3);
  swift_release();
  v5 = v4[2];
  if (v5)
  {
    sub_244EE12E4((uint64_t)(v4 + 4), (uint64_t)v24);
    v6 = (uint64_t)(v4 + 41);
    v7 = 1;
    while (1)
    {
      sub_244EE12E4((uint64_t)v24, (uint64_t)v25);
      v8 = sub_244EE132C((uint64_t)v25) == 1;
      v9 = ((v8 | BYTE4(v25[0])) & 1) != 0 ? 0 : LODWORD(v25[0]);
      v10 = __OFADD__(v7, v9);
      v11 = v7 + v9;
      if (v10)
        break;
      if (!--v5)
        goto LABEL_11;
      sub_244EE12E4(v6, (uint64_t)v24);
      v6 += 296;
      v10 = __OFADD__(v11, 1);
      v7 = v11 + 1;
      if (v10)
      {
        __break(1u);
LABEL_11:
        swift_bridgeObjectRelease();
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_28:
    swift_bridgeObjectRetain();
    result = sub_244EE209C();
    v12 = result;
    if (!result)
      goto LABEL_29;
    goto LABEL_15;
  }
  swift_bridgeObjectRelease();
LABEL_13:
  v25[0] = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_28;
  v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v12)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    v22 = v25[0];
    swift_bridgeObjectRelease();
    swift_retain();
    sub_244EE1350(MEMORY[0x24BEE4B00], v22, v3);
    swift_bridgeObjectRelease();
    swift_release();
    v23 = sub_244EE1BBC();
    swift_release();
    return v23;
  }
LABEL_15:
  if (v12 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v14 = 0;
      do
      {
        MEMORY[0x249529C58](v14, a1);
        v15 = swift_retain();
        MEMORY[0x249529AE4](v15);
        if (*(_QWORD *)((v25[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v25[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_244EE1E98();
        ++v14;
        sub_244EE1EA4();
        v16 = sub_244EE1E8C();
        v17 = sub_244ECDF60(v16);
        sub_244ECE150(v17);
        swift_unknownObjectRelease();
      }
      while (v12 != v14);
    }
    else
    {
      v18 = 0;
      do
      {
        v19 = swift_retain_n();
        MEMORY[0x249529AE4](v19);
        if (*(_QWORD *)((v25[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v25[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_244EE1E98();
        ++v18;
        sub_244EE1EA4();
        v20 = sub_244EE1E8C();
        v21 = sub_244ECDF60(v20);
        sub_244ECE150(v21);
        swift_release();
      }
      while (v12 != v18);
    }
    goto LABEL_29;
  }
  __break(1u);
  return result;
}

uint64_t sub_244EDE6D8()
{
  unint64_t v0;
  uint64_t v1;

  sub_244EE1BC8();
  v0 = swift_bridgeObjectRetain();
  sub_244EDE3D4(v0);
  v1 = sub_244EE1BB0();
  swift_release();
  return v1;
}

uint64_t sub_244EDE734()
{
  return swift_deallocClassInstance();
}

uint64_t sub_244EDE744()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 80))();
}

unint64_t sub_244EDE76C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_244EE215C();
  return sub_244EDFB34(a1, v2);
}

unint64_t sub_244EDE79C(uint64_t a1)
{
  uint64_t v2;

  sub_244EE1D18();
  sub_244EBEF9C(&qword_25742B508, (uint64_t (*)(uint64_t))MEMORY[0x24BEAFE70], MEMORY[0x24BEAFE80]);
  v2 = sub_244EE1DC0();
  return sub_244EDFBD0(a1, v2);
}

uint64_t sub_244EDE808(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B538);
  result = sub_244EE20B4();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v29 = -1 << v10;
    v30 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v31 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v18 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v20 >= v31)
          goto LABEL_33;
        v21 = v9[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v31)
            goto LABEL_33;
          v21 = v9[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v31)
            {
LABEL_33:
              if ((a2 & 1) != 0)
              {
                if (v30 >= 64)
                  bzero((void *)(v5 + 64), 8 * v31);
                else
                  *v9 = v29;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v21 = v9[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_41;
                if (v8 >= v31)
                  goto LABEL_33;
                v21 = v9[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v12 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = *(unsigned int *)(*(_QWORD *)(v5 + 48) + 4 * v19);
      v28 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v19);
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain();
      result = MEMORY[0x249529DC0](*(_QWORD *)(v7 + 40), v27, 4);
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v25 = v16 == v24;
          if (v16 == v24)
            v16 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v26 == -1);
        v17 = __clz(__rbit64(~v26)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_DWORD *)(*(_QWORD *)(v7 + 48) + 4 * v17) = v27;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v28;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_244EDEAB8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  char v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B530);
  result = sub_244EE20B4();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v33 = a2;
    v32 = v3;
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v30 = -1 << v10;
    v31 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v13 = (unint64_t)(v10 + 63) >> 6;
    v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        v16 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v17 = v16 | (v8 << 6);
      }
      else
      {
        v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v18 >= v13)
          goto LABEL_31;
        v19 = v9[v18];
        ++v8;
        if (!v19)
        {
          v8 = v18 + 1;
          if (v18 + 1 >= v13)
            goto LABEL_31;
          v19 = v9[v8];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v13)
            {
LABEL_31:
              if ((v33 & 1) == 0)
              {
                result = swift_release();
                v3 = v32;
                goto LABEL_38;
              }
              if (v31 >= 64)
                bzero((void *)(v5 + 64), 8 * v13);
              else
                *v9 = v30;
              v3 = v32;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v19 = v9[v20];
            if (!v19)
            {
              while (1)
              {
                v8 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_40;
                if (v8 >= v13)
                  goto LABEL_31;
                v19 = v9[v8];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v8 = v20;
          }
        }
LABEL_21:
        v12 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v17);
      v22 = *(_DWORD *)(*(_QWORD *)(v5 + 56) + 4 * v17);
      result = sub_244EE215C();
      v23 = -1 << *(_BYTE *)(v7 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v14 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v14 + 8 * v25);
        }
        while (v29 == -1);
        v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v15) = v21;
      *(_DWORD *)(*(_QWORD *)(v7 + 56) + 4 * v15) = v22;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

uint64_t sub_244EDED54(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  int v43;
  char *v44;
  uint64_t v45;

  v3 = v2;
  v45 = sub_244EE1B44();
  v5 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B528);
  v43 = a2;
  v8 = sub_244EE20B4();
  v9 = v8;
  if (*(_QWORD *)(v7 + 16))
  {
    v40 = v2;
    v10 = 1 << *(_BYTE *)(v7 + 32);
    v11 = *(_QWORD *)(v7 + 64);
    v42 = (_QWORD *)(v7 + 64);
    if (v10 < 64)
      v12 = ~(-1 << v10);
    else
      v12 = -1;
    v13 = v12 & v11;
    v41 = (unint64_t)(v10 + 63) >> 6;
    v14 = v8 + 64;
    result = swift_retain();
    v16 = 0;
    while (1)
    {
      if (v13)
      {
        v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v20 = v19 | (v16 << 6);
      }
      else
      {
        v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v41)
          goto LABEL_34;
        v22 = v42[v21];
        ++v16;
        if (!v22)
        {
          v16 = v21 + 1;
          if (v21 + 1 >= v41)
            goto LABEL_34;
          v22 = v42[v16];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v41)
            {
LABEL_34:
              swift_release();
              v3 = v40;
              if ((v43 & 1) != 0)
              {
                v38 = 1 << *(_BYTE *)(v7 + 32);
                if (v38 >= 64)
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v38;
                *(_QWORD *)(v7 + 16) = 0;
              }
              break;
            }
            v22 = v42[v23];
            if (!v22)
            {
              while (1)
              {
                v16 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v16 >= v41)
                  goto LABEL_34;
                v22 = v42[v16];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v16 = v23;
          }
        }
LABEL_21:
        v13 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      v24 = *(_QWORD *)(v7 + 56);
      v25 = v7;
      v26 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v20);
      v28 = *v26;
      v27 = v26[1];
      v29 = *(_QWORD *)(v5 + 72);
      v30 = v24 + v29 * v20;
      if ((v43 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v44, v30, v45);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v44, v30, v45);
        swift_bridgeObjectRetain();
      }
      sub_244EE2168();
      sub_244EE1E20();
      result = sub_244EE2180();
      v31 = -1 << *(_BYTE *)(v9 + 32);
      v32 = result & ~v31;
      v33 = v32 >> 6;
      if (((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v34 = 0;
        v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v36 = v33 == v35;
          if (v33 == v35)
            v33 = 0;
          v34 |= v36;
          v37 = *(_QWORD *)(v14 + 8 * v33);
        }
        while (v37 == -1);
        v17 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v17);
      *v18 = v28;
      v18[1] = v27;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v9 + 56) + v29 * v17, v44, v45);
      ++*(_QWORD *)(v9 + 16);
      v7 = v25;
    }
  }
  result = swift_release();
  *v3 = v9;
  return result;
}

uint64_t sub_244EDF0BC(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  int v42;

  v3 = v2;
  v5 = sub_244EE1D18();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B520);
  v42 = a2;
  v10 = sub_244EE20B4();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v40 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v38 = v2;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = v40[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v39)
              goto LABEL_34;
            v24 = v40[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
      swift_bridgeObjectRetain();
    }
    sub_244EBEF9C(&qword_25742B508, (uint64_t (*)(uint64_t))MEMORY[0x24BEAFE70], MEMORY[0x24BEAFE80]);
    result = sub_244EE1DC0();
    v29 = -1 << *(_BYTE *)(v11 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v31);
      }
      while (v35 == -1);
      v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v28;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v9 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_244EDF450(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  int v42;

  v3 = v2;
  v5 = sub_244EE1D18();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B500);
  v42 = a2;
  v10 = sub_244EE20B4();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v40 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v38 = v2;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = v40[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v39)
              goto LABEL_34;
            v24 = v40[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
      swift_retain();
    }
    sub_244EBEF9C(&qword_25742B508, (uint64_t (*)(uint64_t))MEMORY[0x24BEAFE70], MEMORY[0x24BEAFE80]);
    result = sub_244EE1DC0();
    v29 = -1 << *(_BYTE *)(v11 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v31);
      }
      while (v35 == -1);
      v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v28;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v9 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_244EDF7E4(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = sub_244EE1D18();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_244EDE79C(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_244EE02A0();
    goto LABEL_7;
  }
  sub_244EDF0BC(v17, a3 & 1);
  v23 = sub_244EDE79C(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    result = sub_244EE2144();
    __break(1u);
    return result;
  }
  v14 = v23;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_244EDFA9C(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_244EDF940(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = sub_244EE1D18();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_244EDE79C(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];
      result = swift_release();
      *(_QWORD *)(v21 + 8 * v14) = a1;
      return result;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_244EE04D0();
    goto LABEL_7;
  }
  sub_244EDF450(v17, a3 & 1);
  v23 = sub_244EDE79C(a2);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_14:
    result = sub_244EE2144();
    __break(1u);
    return result;
  }
  v14 = v23;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  return sub_244EDFA9C(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_244EDFA9C(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_244EE1D18();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

unint64_t sub_244EDFB34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_244EDFBD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_244EE1D18();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_244EBEF9C(&qword_25742B510, (uint64_t (*)(uint64_t))MEMORY[0x24BEAFE70], MEMORY[0x24BEAFE88]);
      v14 = sub_244EE1DD8();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

void *sub_244EDFD10()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B538);
  v2 = *v0;
  v3 = sub_244EE20A8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 4 * v15;
    v17 = *(_DWORD *)(*(_QWORD *)(v2 + 48) + 4 * v15);
    v18 = 8 * v15;
    v19 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v18);
    *(_DWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v18) = v19;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_244EDFEB4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B530);
  v2 = *v0;
  v3 = sub_244EE20A8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v23 = __clz(__rbit64(v21));
    v12 = (v21 - 1) & v21;
    v15 = v23 + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 4 * v15;
    v19 = *(_DWORD *)(*(_QWORD *)(v2 + 56) + v18);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_DWORD *)(*(_QWORD *)(v4 + 56) + v18) = v19;
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_244EE0044()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = sub_244EE1B44();
  v1 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B528);
  v31 = v0;
  v4 = *v0;
  v5 = sub_244EE20A8();
  v6 = *(_QWORD *)(v4 + 16);
  v35 = v5;
  if (!v6)
  {
    result = (void *)swift_release();
    v29 = v35;
    v28 = v31;
LABEL_28:
    *v28 = v29;
    return result;
  }
  v7 = v5;
  result = (void *)(v5 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    v7 = v35;
  }
  v32 = v4 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v4 + 16);
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v33 = (unint64_t)(v12 + 63) >> 6;
  v15 = v34;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      v11 = v25 + 1;
      if (v25 + 1 >= v33)
        goto LABEL_26;
      v26 = *(_QWORD *)(v32 + 8 * v11);
      if (!v26)
        break;
    }
LABEL_25:
    v14 = (v26 - 1) & v26;
    v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(_QWORD *)(v4 + 56) + v22, v15);
    v23 = v35;
    v24 = (_QWORD *)(*(_QWORD *)(v35 + 48) + v18);
    *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v23 + 56) + v22, v3, v15);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release();
    v28 = v31;
    v29 = v35;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v32 + 8 * v27);
  if (v26)
  {
    v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v11 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v11);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_244EE02A0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_244EE1D18();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B520);
  v24 = v0;
  v5 = *v0;
  v6 = sub_244EE20A8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v24 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v25 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_244EE04D0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_244EE1D18();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B500);
  v24 = v0;
  v5 = *v0;
  v6 = sub_244EE20A8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v24 = v7;
    return result;
  }
  result = (void *)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v25 = v5 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = (void *)swift_retain();
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

size_t sub_244EE0700(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_244EE0738(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

_QWORD *sub_244EE071C(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_244EE08AC(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

size_t sub_244EE0738(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25742B540);
  v10 = *(_QWORD *)(sub_244EE1D18() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(sub_244EE1D18() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

_QWORD *sub_244EE08AC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742B518);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 296);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[37 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 296 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742B028);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_244EE09E8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25742B3A0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_244EE0AE8(unint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  const void *v13;
  unint64_t v14;
  unint64_t v15;
  _BYTE __dst[296];
  _BYTE v18[296];
  _BYTE v19[304];
  uint64_t v20;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_244EE209C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = MEMORY[0x24BEE4AF8];
  if (!v3)
    return (_QWORD *)v4;
  v20 = MEMORY[0x24BEE4AF8];
  result = sub_244EE071C(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v6 = 0;
    v7 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 96);
    v4 = v20;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v8 = MEMORY[0x249529C58](v6, a1);
      }
      else
      {
        v8 = *(_QWORD *)(a1 + 8 * v6 + 32);
        swift_retain();
      }
      v9 = swift_retain();
      v10 = v7(v9);
      if (*(_QWORD *)(v10 + 16) && (v11 = sub_244EB9538(v8), (v12 & 1) != 0))
      {
        v13 = (const void *)(*(_QWORD *)(v10 + 56) + 296 * v11);
        memcpy(__dst, v13, sizeof(__dst));
        memmove(v18, v13, 0x128uLL);
        nullsub_1(v18);
        sub_244EBEE3C((uint64_t)__dst);
        swift_release();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_release();
        swift_bridgeObjectRelease();
        sub_244EC25D4((uint64_t)v18);
      }
      sub_244EE12E4((uint64_t)v18, (uint64_t)v19);
      swift_release();
      v20 = v4;
      v15 = *(_QWORD *)(v4 + 16);
      v14 = *(_QWORD *)(v4 + 24);
      if (v15 >= v14 >> 1)
      {
        sub_244EE071C((_QWORD *)(v14 > 1), v15 + 1, 1);
        v4 = v20;
      }
      ++v6;
      *(_QWORD *)(v4 + 16) = v15 + 1;
      sub_244EE12E4((uint64_t)v19, v4 + 296 * v15 + 32);
    }
    while (v3 != v6);
    return (_QWORD *)v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_244EE0CEC(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22[2];
  uint64_t v23;

  v23 = a1;
  v8 = a2 + 64;
  v9 = 1 << *(_BYTE *)(a2 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(a2 + 64);
  v21 = (unint64_t)(v9 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v13 = 0;
  if (!v11)
    goto LABEL_5;
LABEL_4:
  v14 = __clz(__rbit64(v11));
  v11 &= v11 - 1;
  for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v17)) + (v13 << 6))
  {
    v19 = 8 * i;
    v20 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + v19);
    v22[0] = *(_QWORD *)(*(_QWORD *)(a2 + 48) + v19);
    v22[1] = v20;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_244EDDE08(&v23, v22, a3, a4);
    if (v4)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    result = swift_release();
    if (v11)
      goto LABEL_4;
LABEL_5:
    v16 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v16 >= v21)
      goto LABEL_25;
    v17 = *(_QWORD *)(v8 + 8 * v16);
    ++v13;
    if (!v17)
    {
      v13 = v16 + 1;
      if (v16 + 1 >= v21)
        goto LABEL_25;
      v17 = *(_QWORD *)(v8 + 8 * v13);
      if (!v17)
      {
        v13 = v16 + 2;
        if (v16 + 2 >= v21)
          goto LABEL_25;
        v17 = *(_QWORD *)(v8 + 8 * v13);
        if (!v17)
        {
          v13 = v16 + 3;
          if (v16 + 3 >= v21)
            goto LABEL_25;
          v17 = *(_QWORD *)(v8 + 8 * v13);
          if (!v17)
            break;
        }
      }
    }
LABEL_20:
    v11 = (v17 - 1) & v17;
  }
  v18 = v16 + 4;
  if (v18 >= v21)
  {
LABEL_25:
    swift_release();
    return v23;
  }
  v17 = *(_QWORD *)(v8 + 8 * v18);
  if (v17)
  {
    v13 = v18;
    goto LABEL_20;
  }
  while (1)
  {
    v13 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v13 >= v21)
      goto LABEL_25;
    v17 = *(_QWORD *)(v8 + 8 * v13);
    ++v18;
    if (v17)
      goto LABEL_20;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_244EE0EE8(uint64_t a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v33;
  char *v34;
  char *v35;
  int v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  _BYTE v53[296];

  v4 = sub_244EE1D18();
  MEMORY[0x24BDAC7A8](v4);
  v44 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_244EE1B5C();
  v45 = *(_QWORD *)(v47 - 8);
  v6 = MEMORY[0x24BDAC7A8](v47);
  v46 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v33 - v8;
  v10 = sub_244EE1BA4();
  v42 = *(_QWORD *)(v10 - 8);
  v43 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v41 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v33 - v13;
  v15 = sub_244EE1B8C();
  v49 = *(_QWORD *)(v15 - 8);
  v50 = v15;
  v16 = MEMORY[0x24BDAC7A8](v15);
  v40 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v33 - v18;
  v48 = sub_244EE1B74();
  v20 = *(_QWORD *)(v48 - 8);
  v38 = v20;
  v21 = MEMORY[0x24BDAC7A8](v48);
  v39 = (char *)&v33 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v33 - v23;
  swift_retain();
  sub_244EBEE3C((uint64_t)a2);
  v37 = v24;
  sub_244EDCD1C(a1, a2);
  swift_retain();
  sub_244EBEE3C((uint64_t)a2);
  v35 = v19;
  sub_244EDCF14(a1, a2);
  swift_retain();
  sub_244EBEE3C((uint64_t)a2);
  sub_244EDD898(a2);
  sub_244ED5034();
  swift_beginAccess();
  memcpy(v53, a2, sizeof(v53));
  swift_retain();
  swift_getAtKeyPath();
  swift_release();
  sub_244EBBA84((uint64_t)a2);
  v51 = v52;
  v34 = v14;
  sub_244EE1B98();
  swift_release();
  v25 = swift_retain();
  v33 = v9;
  sub_244EDDB68(v25, a2);
  v26 = *(_DWORD *)a2;
  if ((a2[4] & 1) != 0)
    v26 = 0;
  v36 = v26;
  swift_retain();
  sub_244EE1A24();
  sub_244EE1D0C();
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v39, v24, v48);
  (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v40, v19, v50);
  v27 = v42;
  v28 = v43;
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v41, v14, v43);
  v29 = v45;
  v30 = v47;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v46, v9, v47);
  v31 = sub_244EE1BD4();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v33, v30);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v34, v28);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v35, v50);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v37, v48);
  return v31;
}

uint64_t sub_244EE12E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25742B028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_244EE132C(uint64_t a1)
{
  unint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  v2 = v1 - 1;
  if (v2 < 0)
    v2 = -1;
  return (v2 + 1);
}

uint64_t sub_244EE1350(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char isUniquelyReferenced_nonNull_native;
  void (*v29)(uint64_t, uint64_t);
  _QWORD v31[2];
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t);
  unint64_t v41;
  _BYTE v42[304];
  uint64_t v43;

  v4 = v3;
  v8 = sub_244EE1D18();
  v36 = *(_QWORD *)(v8 - 8);
  v37 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v35 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v38 = (char *)v31 - v11;
  if (a2 >> 62)
  {
LABEL_16:
    swift_bridgeObjectRetain();
    v12 = sub_244EE209C();
    if (v12)
      goto LABEL_3;
  }
  else
  {
    v12 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v12)
    {
LABEL_3:
      v31[1] = v4;
      v32 = v12;
      v41 = a2 & 0xC000000000000001;
      v13 = *(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 96);
      v39 = a1;
      v40 = v13;
      v14 = 4;
      v33 = a2;
      v34 = a3;
      while (1)
      {
        v4 = v14 - 4;
        if (v41)
        {
          a1 = MEMORY[0x249529C58](v14 - 4, a2);
          v15 = v14 - 3;
          if (__OFADD__(v4, 1))
            goto LABEL_15;
        }
        else
        {
          a1 = *(_QWORD *)(a2 + 8 * v14);
          swift_retain();
          v15 = v14 - 3;
          if (__OFADD__(v4, 1))
          {
LABEL_15:
            __break(1u);
            goto LABEL_16;
          }
        }
        v16 = swift_retain();
        v17 = v40(v16);
        if (*(_QWORD *)(v17 + 16) && (v18 = sub_244EB9538(a1), (v19 & 1) != 0))
        {
          memcpy(v42, (const void *)(*(_QWORD *)(v17 + 56) + 296 * v18), 0x128uLL);
          sub_244EBEE3C((uint64_t)v42);
          swift_release();
          swift_bridgeObjectRelease();
          swift_retain();
          sub_244EE1A24();
          v20 = v38;
          sub_244EE1D0C();
          swift_release();
          sub_244EE1BE0();
          v21 = swift_retain();
          v22 = sub_244EE0EE8(v21, v42);
          swift_release();
          v23 = (uint64_t)v35;
          v24 = v36;
          v25 = v20;
          v26 = v37;
          (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v35, v25, v37);
          swift_retain();
          v27 = v39;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v43 = v27;
          sub_244EDF940(v22, v23, isUniquelyReferenced_nonNull_native);
          v39 = v43;
          swift_bridgeObjectRelease();
          v29 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
          v12 = v32;
          v29(v23, v26);
          a2 = v33;
          a3 = v34;
          swift_release();
          v29((uint64_t)v38, v26);
          swift_release();
        }
        else
        {
          swift_release_n();
          swift_bridgeObjectRelease();
        }
        ++v14;
        if (v15 == v12)
        {
          swift_bridgeObjectRelease();
          return v39;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t type metadata accessor for InspectorSceneStatisticsProvider()
{
  return objc_opt_self();
}

uint64_t sub_244EE1640()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_244EE164C()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_244EE1658()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_244EE1664()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_244EE1670()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_244EE167C()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_244EE1688()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_244EE1694()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_244EE16A0()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_244EE16AC()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_244EE16B8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_244EE16C4()
{
  return MEMORY[0x24BDCDBF8]();
}

uint64_t sub_244EE16D0()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_244EE16DC()
{
  return MEMORY[0x24BDCDD78]();
}

uint64_t sub_244EE16E8()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_244EE16F4()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_244EE1700()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_244EE170C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_244EE1718()
{
  return MEMORY[0x24BDE6080]();
}

uint64_t sub_244EE1724()
{
  return MEMORY[0x24BDE6088]();
}

uint64_t sub_244EE1730()
{
  return MEMORY[0x24BDE6108]();
}

uint64_t sub_244EE173C()
{
  return MEMORY[0x24BDE6118]();
}

uint64_t sub_244EE1748()
{
  return MEMORY[0x24BDE6388]();
}

uint64_t sub_244EE1754()
{
  return MEMORY[0x24BDE6398]();
}

uint64_t sub_244EE1760()
{
  return MEMORY[0x24BDE63A0]();
}

uint64_t sub_244EE176C()
{
  return MEMORY[0x24BDE63C0]();
}

uint64_t sub_244EE1778()
{
  return MEMORY[0x24BDE63E8]();
}

uint64_t sub_244EE1784()
{
  return MEMORY[0x24BDE63F8]();
}

uint64_t sub_244EE1790()
{
  return MEMORY[0x24BDE6408]();
}

uint64_t sub_244EE179C()
{
  return MEMORY[0x24BDE6418]();
}

uint64_t sub_244EE17A8()
{
  return MEMORY[0x24BDE6438]();
}

uint64_t sub_244EE17B4()
{
  return MEMORY[0x24BDE6448]();
}

uint64_t sub_244EE17C0()
{
  return MEMORY[0x24BDE6450]();
}

uint64_t sub_244EE17CC()
{
  return MEMORY[0x24BDE6458]();
}

uint64_t sub_244EE17D8()
{
  return MEMORY[0x24BDE64E8]();
}

uint64_t sub_244EE17E4()
{
  return MEMORY[0x24BDE6508]();
}

uint64_t sub_244EE17F0()
{
  return MEMORY[0x24BDE6510]();
}

uint64_t sub_244EE17FC()
{
  return MEMORY[0x24BDE65B0]();
}

uint64_t sub_244EE1808()
{
  return MEMORY[0x24BDE65F8]();
}

uint64_t sub_244EE1814()
{
  return MEMORY[0x24BDE6698]();
}

uint64_t sub_244EE1820()
{
  return MEMORY[0x24BDE66A8]();
}

uint64_t sub_244EE182C()
{
  return MEMORY[0x24BDE6788]();
}

uint64_t sub_244EE1838()
{
  return MEMORY[0x24BDE67B0]();
}

uint64_t sub_244EE1844()
{
  return MEMORY[0x24BDE6868]();
}

uint64_t sub_244EE1850()
{
  return MEMORY[0x24BDE6EC0]();
}

uint64_t sub_244EE185C()
{
  return MEMORY[0x24BDE6EF0]();
}

uint64_t sub_244EE1868()
{
  return MEMORY[0x24BDE8028]();
}

uint64_t sub_244EE1874()
{
  return MEMORY[0x24BDE8128]();
}

uint64_t sub_244EE1880()
{
  return MEMORY[0x24BDE6F30]();
}

uint64_t sub_244EE188C()
{
  return MEMORY[0x24BDE6F48]();
}

uint64_t sub_244EE1898()
{
  return MEMORY[0x24BDE6F50]();
}

uint64_t sub_244EE18A4()
{
  return MEMORY[0x24BDE6F58]();
}

uint64_t sub_244EE18B0()
{
  return MEMORY[0x24BDE6F68]();
}

uint64_t sub_244EE18BC()
{
  return MEMORY[0x24BDE6F70]();
}

uint64_t sub_244EE18C8()
{
  return MEMORY[0x24BDE6F78]();
}

uint64_t sub_244EE18D4()
{
  return MEMORY[0x24BDE6F80]();
}

uint64_t sub_244EE18E0()
{
  return MEMORY[0x24BDE6F88]();
}

uint64_t sub_244EE18EC()
{
  return MEMORY[0x24BDE6F98]();
}

uint64_t sub_244EE18F8()
{
  return MEMORY[0x24BDE6FB0]();
}

uint64_t sub_244EE1904()
{
  return MEMORY[0x24BDE6FB8]();
}

uint64_t sub_244EE1910()
{
  return MEMORY[0x24BDE6FC8]();
}

uint64_t sub_244EE191C()
{
  return MEMORY[0x24BDE6FD0]();
}

uint64_t sub_244EE1928()
{
  return MEMORY[0x24BDE6FD8]();
}

uint64_t sub_244EE1934()
{
  return MEMORY[0x24BDE6FE0]();
}

uint64_t sub_244EE1940()
{
  return MEMORY[0x24BDE6FE8]();
}

uint64_t sub_244EE194C()
{
  return MEMORY[0x24BDE6FF0]();
}

uint64_t sub_244EE1958()
{
  return MEMORY[0x24BDE6FF8]();
}

uint64_t sub_244EE1964()
{
  return MEMORY[0x24BDE7008]();
}

uint64_t sub_244EE1970()
{
  return MEMORY[0x24BDE7028]();
}

uint64_t sub_244EE197C()
{
  return MEMORY[0x24BDE7040]();
}

uint64_t sub_244EE1988()
{
  return MEMORY[0x24BDE7048]();
}

uint64_t sub_244EE1994()
{
  return MEMORY[0x24BDE7050]();
}

uint64_t sub_244EE19A0()
{
  return MEMORY[0x24BDE7058]();
}

uint64_t sub_244EE19AC()
{
  return MEMORY[0x24BDE7060]();
}

uint64_t sub_244EE19B8()
{
  return MEMORY[0x24BDE7068]();
}

uint64_t sub_244EE19C4()
{
  return MEMORY[0x24BDE7070]();
}

uint64_t sub_244EE19D0()
{
  return MEMORY[0x24BDE7078]();
}

uint64_t sub_244EE19DC()
{
  return MEMORY[0x24BDE7088]();
}

uint64_t sub_244EE19E8()
{
  return MEMORY[0x24BDE7098]();
}

uint64_t sub_244EE19F4()
{
  return MEMORY[0x24BDE7108]();
}

uint64_t sub_244EE1A00()
{
  return MEMORY[0x24BDE7110]();
}

uint64_t sub_244EE1A0C()
{
  return MEMORY[0x24BDE7138]();
}

uint64_t sub_244EE1A18()
{
  return MEMORY[0x24BDE7160]();
}

uint64_t sub_244EE1A24()
{
  return MEMORY[0x24BDE7188]();
}

uint64_t sub_244EE1A30()
{
  return MEMORY[0x24BDE7190]();
}

uint64_t sub_244EE1A3C()
{
  return MEMORY[0x24BDE7198]();
}

uint64_t sub_244EE1A48()
{
  return MEMORY[0x24BDE71B0]();
}

uint64_t sub_244EE1A54()
{
  return MEMORY[0x24BDE71B8]();
}

uint64_t sub_244EE1A60()
{
  return MEMORY[0x24BDE71E0]();
}

uint64_t sub_244EE1A6C()
{
  return MEMORY[0x24BDE71E8]();
}

uint64_t sub_244EE1A78()
{
  return MEMORY[0x24BDE7A20]();
}

uint64_t sub_244EE1A84()
{
  return MEMORY[0x24BDE7A30]();
}

uint64_t sub_244EE1A90()
{
  return MEMORY[0x24BDE7A40]();
}

uint64_t sub_244EE1A9C()
{
  return MEMORY[0x24BEAFBB8]();
}

uint64_t sub_244EE1AA8()
{
  return MEMORY[0x24BEAFBC0]();
}

uint64_t sub_244EE1AB4()
{
  return MEMORY[0x24BEAFBC8]();
}

uint64_t sub_244EE1AC0()
{
  return MEMORY[0x24BEAFBD0]();
}

uint64_t sub_244EE1ACC()
{
  return MEMORY[0x24BEAFBD8]();
}

uint64_t sub_244EE1AD8()
{
  return MEMORY[0x24BEAFBE0]();
}

uint64_t sub_244EE1AE4()
{
  return MEMORY[0x24BEAFBE8]();
}

uint64_t sub_244EE1AF0()
{
  return MEMORY[0x24BEAFBF8]();
}

uint64_t sub_244EE1AFC()
{
  return MEMORY[0x24BEAFC08]();
}

uint64_t sub_244EE1B08()
{
  return MEMORY[0x24BEAFC20]();
}

uint64_t sub_244EE1B14()
{
  return MEMORY[0x24BEAFC48]();
}

uint64_t sub_244EE1B20()
{
  return MEMORY[0x24BEAFC50]();
}

uint64_t sub_244EE1B2C()
{
  return MEMORY[0x24BEAFCA8]();
}

uint64_t sub_244EE1B38()
{
  return MEMORY[0x24BEAFCC8]();
}

uint64_t sub_244EE1B44()
{
  return MEMORY[0x24BEAFCD0]();
}

uint64_t sub_244EE1B50()
{
  return MEMORY[0x24BEAFCE0]();
}

uint64_t sub_244EE1B5C()
{
  return MEMORY[0x24BEAFCE8]();
}

uint64_t sub_244EE1B68()
{
  return MEMORY[0x24BEAFCF0]();
}

uint64_t sub_244EE1B74()
{
  return MEMORY[0x24BEAFCF8]();
}

uint64_t sub_244EE1B80()
{
  return MEMORY[0x24BEAFD00]();
}

uint64_t sub_244EE1B8C()
{
  return MEMORY[0x24BEAFD08]();
}

uint64_t sub_244EE1B98()
{
  return MEMORY[0x24BEAFD10]();
}

uint64_t sub_244EE1BA4()
{
  return MEMORY[0x24BEAFD18]();
}

uint64_t sub_244EE1BB0()
{
  return MEMORY[0x24BEAFD20]();
}

uint64_t sub_244EE1BBC()
{
  return MEMORY[0x24BEAFD28]();
}

uint64_t sub_244EE1BC8()
{
  return MEMORY[0x24BEAFD30]();
}

uint64_t sub_244EE1BD4()
{
  return MEMORY[0x24BEAFD38]();
}

uint64_t sub_244EE1BE0()
{
  return MEMORY[0x24BEAFD40]();
}

uint64_t sub_244EE1BEC()
{
  return MEMORY[0x24BEAFD50]();
}

uint64_t sub_244EE1BF8()
{
  return MEMORY[0x24BEAFD58]();
}

uint64_t sub_244EE1C04()
{
  return MEMORY[0x24BEAFD60]();
}

uint64_t sub_244EE1C10()
{
  return MEMORY[0x24BEAFD68]();
}

uint64_t sub_244EE1C1C()
{
  return MEMORY[0x24BEAFD70]();
}

uint64_t sub_244EE1C28()
{
  return MEMORY[0x24BEAFD80]();
}

uint64_t sub_244EE1C34()
{
  return MEMORY[0x24BEAFD88]();
}

uint64_t sub_244EE1C40()
{
  return MEMORY[0x24BEAFD90]();
}

uint64_t sub_244EE1C4C()
{
  return MEMORY[0x24BEAFDA0]();
}

uint64_t sub_244EE1C58()
{
  return MEMORY[0x24BEAFDA8]();
}

uint64_t sub_244EE1C64()
{
  return MEMORY[0x24BEAFDB0]();
}

uint64_t sub_244EE1C70()
{
  return MEMORY[0x24BEAFDC8]();
}

uint64_t sub_244EE1C7C()
{
  return MEMORY[0x24BEAFDD0]();
}

uint64_t sub_244EE1C88()
{
  return MEMORY[0x24BEAFDE0]();
}

uint64_t sub_244EE1C94()
{
  return MEMORY[0x24BEAFDF0]();
}

uint64_t sub_244EE1CA0()
{
  return MEMORY[0x24BEAFDF8]();
}

uint64_t sub_244EE1CAC()
{
  return MEMORY[0x24BEAFE08]();
}

uint64_t sub_244EE1CB8()
{
  return MEMORY[0x24BEAFE10]();
}

uint64_t sub_244EE1CC4()
{
  return MEMORY[0x24BEAFE28]();
}

uint64_t sub_244EE1CD0()
{
  return MEMORY[0x24BEAFE40]();
}

uint64_t sub_244EE1CDC()
{
  return MEMORY[0x24BEAFE48]();
}

uint64_t sub_244EE1CE8()
{
  return MEMORY[0x24BEAFE50]();
}

uint64_t sub_244EE1CF4()
{
  return MEMORY[0x24BEAFE58]();
}

uint64_t sub_244EE1D00()
{
  return MEMORY[0x24BEAFE60]();
}

uint64_t sub_244EE1D0C()
{
  return MEMORY[0x24BEAFE68]();
}

uint64_t sub_244EE1D18()
{
  return MEMORY[0x24BEAFE70]();
}

uint64_t sub_244EE1D24()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_244EE1D30()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_244EE1D3C()
{
  return MEMORY[0x24BEE6048]();
}

uint64_t sub_244EE1D48()
{
  return MEMORY[0x24BEE6070]();
}

uint64_t sub_244EE1D54()
{
  return MEMORY[0x24BEE60D8]();
}

uint64_t sub_244EE1D60()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t sub_244EE1D6C()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_244EE1D78()
{
  return MEMORY[0x24BEE0280]();
}

uint64_t sub_244EE1D84()
{
  return MEMORY[0x24BEE0300]();
}

uint64_t sub_244EE1D90()
{
  return MEMORY[0x24BEE0380]();
}

uint64_t sub_244EE1D9C()
{
  return MEMORY[0x24BEE03D0]();
}

uint64_t sub_244EE1DA8()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_244EE1DB4()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_244EE1DC0()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_244EE1DCC()
{
  return MEMORY[0x24BEE75F0]();
}

uint64_t sub_244EE1DD8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_244EE1DE4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_244EE1DF0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_244EE1DFC()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_244EE1E08()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_244EE1E14()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_244EE1E20()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_244EE1E2C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_244EE1E38()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_244EE1E44()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_244EE1E50()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_244EE1E5C()
{
  return MEMORY[0x24BEE0F30]();
}

uint64_t sub_244EE1E68()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_244EE1E74()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_244EE1E80()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_244EE1E8C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_244EE1E98()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_244EE1EA4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_244EE1EB0()
{
  return MEMORY[0x24BEE11F0]();
}

uint64_t sub_244EE1EBC()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_244EE1EC8()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_244EE1ED4()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_244EE1EE0()
{
  return MEMORY[0x24BEE1908]();
}

uint64_t sub_244EE1EEC()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_244EE1EF8()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_244EE1F04()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_244EE1F10()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_244EE1F1C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_244EE1F28()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_244EE1F34()
{
  return MEMORY[0x24BDF5540]();
}

uint64_t sub_244EE1F40()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_244EE1F4C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_244EE1F58()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_244EE1F64()
{
  return MEMORY[0x24BDD05C8]();
}

uint64_t sub_244EE1F70()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_244EE1F7C()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_244EE1F88()
{
  return MEMORY[0x24BEE20A0]();
}

uint64_t sub_244EE1F94()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_244EE1FA0()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_244EE1FAC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_244EE1FB8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_244EE1FC4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_244EE1FD0()
{
  return MEMORY[0x24BEE2628]();
}

uint64_t sub_244EE1FDC()
{
  return MEMORY[0x24BEE2630]();
}

uint64_t sub_244EE1FE8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_244EE1FF4()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_244EE2000()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_244EE200C()
{
  return MEMORY[0x24BEE28C0]();
}

uint64_t sub_244EE2018()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_244EE2024()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_244EE2030()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_244EE203C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_244EE2048()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_244EE2054()
{
  return MEMORY[0x24BEE2B80]();
}

uint64_t sub_244EE2060()
{
  return MEMORY[0x24BEE2E20]();
}

uint64_t sub_244EE206C()
{
  return MEMORY[0x24BEE2E38]();
}

uint64_t sub_244EE2078()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_244EE2084()
{
  return MEMORY[0x24BEE2F68]();
}

uint64_t sub_244EE2090()
{
  return MEMORY[0x24BEE2F70]();
}

uint64_t sub_244EE209C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_244EE20A8()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_244EE20B4()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_244EE20C0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_244EE20CC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_244EE20D8()
{
  return MEMORY[0x24BEE30D0]();
}

uint64_t sub_244EE20E4()
{
  return MEMORY[0x24BEE30E0]();
}

uint64_t sub_244EE20F0()
{
  return MEMORY[0x24BEE30E8]();
}

uint64_t sub_244EE20FC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_244EE2108()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_244EE2114()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_244EE2120()
{
  return MEMORY[0x24BEE3A40]();
}

uint64_t sub_244EE212C()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_244EE2138()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_244EE2144()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_244EE2150()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_244EE215C()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_244EE2168()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_244EE2174()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_244EE2180()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_244EE218C()
{
  return MEMORY[0x24BEE4358]();
}

uint64_t sub_244EE2198()
{
  return MEMORY[0x24BEE4360]();
}

uint64_t sub_244EE21A4()
{
  return MEMORY[0x24BEE4398]();
}

uint64_t sub_244EE21B0()
{
  return MEMORY[0x24BEE43B0]();
}

uint64_t sub_244EE21BC()
{
  return MEMORY[0x24BEE43D0]();
}

uint64_t sub_244EE21C8()
{
  return MEMORY[0x24BEE43D8]();
}

uint64_t sub_244EE21D4()
{
  return MEMORY[0x24BEE49D0]();
}

uint64_t REEntitySetName()
{
  return MEMORY[0x24BE22180]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2E0](image);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x24BDAE058](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_modifyAtWritableKeyPath()
{
  return MEMORY[0x24BEE4EC0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x24BEE4F28]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

